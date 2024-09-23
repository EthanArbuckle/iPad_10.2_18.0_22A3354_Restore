uint64_t DIHLDiskImageAttach()
{
  return 4294967246;
}

uint64_t DIGetBundleRef()
{
  CFBundleRef BundleWithIdentifier;
  int *v1;

  if (pthread_mutex_lock(&stru_254B5AD00))
    return 0;
  if (!qword_254B5AD90)
  {
    *__error() = 0;
    BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.DiskImagesFramework"));
    qword_254B5AD90 = (uint64_t)BundleWithIdentifier;
    if (BundleWithIdentifier)
    {
      CFRetain(BundleWithIdentifier);
    }
    else if (dword_254B5AD98)
    {
      v1 = __error();
      sub_21281D6F4("DIGetBundleRef returned NULL, error %d\n", *v1);
    }
  }
  if (pthread_mutex_unlock(&stru_254B5AD00))
    return 0;
  else
    return qword_254B5AD90;
}

void sub_2127F0E84(void *context, CFDictionaryRef theDict, unint64_t a3)
{
  if (a3 <= 2)
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)off_24CE2BEB8[a3], context);
}

void sub_2127F0EB0(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6;

  v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
    CFDictionarySetValue((CFMutableDictionaryRef)cf, a1, a2);
}

void DIAddPermission(__CFDictionary *a1, int a2)
{
  const void **v2;

  if (a1)
  {
    if (a2 == 3)
    {
      v2 = (const void **)MEMORY[0x24BDBD270];
      goto LABEL_7;
    }
    if (a2 == 1)
    {
      v2 = (const void **)MEMORY[0x24BDBD268];
LABEL_7:
      CFDictionarySetValue(a1, CFSTR("writeable"), *v2);
      return;
    }
    CFDictionaryRemoveValue(a1, CFSTR("writeable"));
  }
}

uint64_t DI_kextExists()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;

  v0 = *MEMORY[0x24BDD8B20];
  v1 = IOServiceMatching("IOHDIXController");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService)
    return 3758097088;
  IOObjectRelease(MatchingService);
  return 0;
}

uint64_t DIInitialize()
{
  uint64_t result;
  const __CFString *v1;
  const __CFString *v2;
  int v3;
  const char *v4;
  const char *v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t (**v10)(void);
  const void *v11;
  int v12;
  uint64_t v13;
  uint64_t (**v14)(void);
  const void *v15;
  int v16;
  uint64_t v17;
  uint64_t (**v18)(void);
  const void *v19;
  int v20;
  uint64_t v21;
  uint64_t (**v22)(void);
  const void *v23;
  int v24;
  uint64_t v25;
  uint64_t (**v26)(void);
  const void *v27;
  const __CFString *v28;
  int v29;
  int v30;
  unsigned int v31;
  int v32;
  char __str[1024];
  char v34[1024];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (sub_2127F1434())
    return 0;
  v32 = 0;
  if (pthread_mutex_lock(&stru_254B5ACC0))
    return *__error();
  if ((byte_254B5AD88 & 1) != 0)
  {
LABEL_63:
    result = pthread_mutex_unlock(&stru_254B5ACC0);
    if (!(_DWORD)result)
      return result;
    return *__error();
  }
  *__error() = 0;
  if (DIGetBundleRef())
  {
    dword_254B5AD8C = getpid();
    v32 = dword_254B5AD8C;
    sysctlbyname("vfs.generic.noremotehang", 0, 0, &v32, 4uLL);
    v1 = (const __CFString *)sub_2127F14C0();
    if (!sub_2127F14C8(v1, 0))
    {
      if (v1)
        CFRelease(v1);
      v1 = (const __CFString *)sub_2127F14C0();
      sub_2127F14C8(v1, 0);
    }
    if (v1)
      CFRelease(v1);
    v2 = (const __CFString *)sub_2127F14C0();
    if (sub_2127F14C8(v2, 0))
    {
      v3 = v32;
      v4 = getprogname();
      if (v4)
      {
        v5 = v4;
        if (snprintf(__str, 0x400uLL, "%s%s", "/tmp/", "DiskImages-debug/") <= 1023
          && (mkdir(__str, 0x3FFu) != -1 || *__error() == 17)
          && snprintf(v34, 0x400uLL, "%s%s.%d.txt", __str, v5, v3) <= 1023)
        {
          v6 = open(v34, 2818, 384);
          if (v6 == -1)
          {
            sub_212821CC4();
            if (!v2)
              goto LABEL_23;
            goto LABEL_22;
          }
          v7 = v6;
          dup2(v6, 1);
          dup2(v7, 2);
          if (v7 >= 3)
            close(v7);
        }
      }
    }
    if (!v2)
    {
LABEL_23:
      if (qword_254B5AD48)
      {
        CFRelease((CFTypeRef)qword_254B5AD48);
        qword_254B5AD48 = 0;
      }
      qword_254B5AD48 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      v8 = sub_2127F16E8();
      if (v8 >= 1)
      {
        v9 = v8;
        v10 = &off_254B5A980;
        do
        {
          if (*v10)
          {
            v11 = (const void *)(*v10)();
            sub_2127F17F0(v11);
            if (v11)
              CFRelease(v11);
          }
          v10 += 7;
          --v9;
        }
        while (v9);
      }
      v12 = sub_2127F1958(1);
      if (v12 >= 1)
      {
        v13 = v12;
        v14 = off_254B5AA28;
        do
        {
          if (*v14)
          {
            v15 = (const void *)(*v14)();
            sub_2127F17F0(v15);
            if (v15)
              CFRelease(v15);
          }
          v14 += 7;
          --v13;
        }
        while (v13);
      }
      v16 = sub_2127F1958(2);
      if (v16 >= 1)
      {
        v17 = v16;
        v18 = &off_254B5AA98;
        do
        {
          if (*v18)
          {
            v19 = (const void *)(*v18)();
            sub_2127F17F0(v19);
            if (v19)
              CFRelease(v19);
          }
          v18 += 7;
          --v17;
        }
        while (v17);
      }
      v20 = sub_2127F1958(3);
      if (v20 >= 1)
      {
        v21 = v20;
        v22 = (uint64_t (**)(void))&qword_254B5AD50;
        do
        {
          if (*v22)
          {
            v23 = (const void *)(*v22)();
            sub_2127F17F0(v23);
            if (v23)
              CFRelease(v23);
          }
          v22 += 7;
          --v21;
        }
        while (v21);
      }
      v24 = sub_2127F1C90();
      if (v24 >= 1)
      {
        v25 = v24;
        v26 = (uint64_t (**)(void))&qword_254B5AB08;
        do
        {
          if (*v26)
          {
            v27 = (const void *)(*v26)();
            sub_2127F17F0(v27);
            if (v27)
              CFRelease(v27);
          }
          v26 += 11;
          --v25;
        }
        while (v25);
      }
      *__error() = 0;
      v28 = (const __CFString *)sub_2127F14C0();
      v29 = sub_2127F14C8(v28, 0);
      byte_254B5AD40 = v29;
      if (getenv("DISKIMAGEOBJECTTRACKING"))
        v30 = 1;
      else
        v30 = v29;
      byte_254B5AD40 = v30;
      if (v28)
      {
        CFRelease(v28);
        v30 = byte_254B5AD40;
      }
      if (v30)
      {
        printf("\x1B[7mDIInitialize: starting DiskImageObject tracking\n\x1B[0m");
        sub_212814AE8();
      }
      v32 = -v32;
      sysctlbyname("vfs.generic.noremotehang", 0, 0, &v32, 4uLL);
      byte_254B5AD88 = 1;
      goto LABEL_63;
    }
LABEL_22:
    CFRelease(v2);
    goto LABEL_23;
  }
  v31 = *__error();
  pthread_mutex_unlock(&stru_254B5ACC0);
  if (v31)
    return v31;
  else
    return 119;
}

uint64_t sub_2127F1434()
{
  unsigned int v0;

  if (pthread_mutex_lock(&stru_254B5ACC0))
    return 0;
  if (byte_254B5AD88 == 1)
  {
    if (dword_254B5AD8C)
    {
      if (getpid() == dword_254B5AD8C)
      {
        v0 = 1;
        goto LABEL_9;
      }
      dword_254B5AD8C = 0;
    }
    v0 = 0;
    byte_254B5AD88 = 0;
  }
  else
  {
    v0 = 0;
  }
LABEL_9:
  if (pthread_mutex_unlock(&stru_254B5ACC0))
    return 0;
  else
    return v0;
}

uint64_t sub_2127F14C0()
{
  return 0;
}

uint64_t sub_2127F14C8(const __CFString *a1, unsigned __int8 a2)
{
  int v3;
  unsigned __int8 v4;
  unsigned __int8 v6;

  v6 = a2;
  v3 = sub_2127F1508(a1, &v6);
  v4 = v6;
  if (!v3)
    return a2;
  return v4;
}

uint64_t sub_2127F1508(const __CFString *a1, _BYTE *a2)
{
  CFTypeID v4;
  uint64_t v5;
  CFTypeID v6;
  CFTypeID v7;
  double valuePtr;

  if (!a1)
    return 0;
  v4 = CFGetTypeID(a1);
  if (v4 != CFBooleanGetTypeID())
  {
    v6 = CFGetTypeID(a1);
    if (v6 == CFStringGetTypeID())
    {
      v5 = 1;
      if (CFStringCompare(a1, CFSTR("YES"), 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 1;
        return v5;
      }
      v5 = 1;
      if (CFStringCompare(a1, CFSTR("TRUE"), 1uLL) == kCFCompareEqualTo
        || (v5 = 1, CFStringCompare(a1, CFSTR("1"), 1uLL) == kCFCompareEqualTo))
      {
        *a2 = 1;
        return v5;
      }
      if (CFStringCompare(a1, CFSTR("NO"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("FALSE"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("0"), 1uLL) == kCFCompareEqualTo)
      {
        *a2 = 0;
        return 1;
      }
    }
    else
    {
      v7 = CFGetTypeID(a1);
      if (v7 == CFNumberGetTypeID())
      {
        valuePtr = 0.0;
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr))
        {
          *a2 = valuePtr != 0.0;
          return 1;
        }
      }
    }
    return 0;
  }
  *a2 = CFBooleanGetValue((CFBooleanRef)a1);
  return 1;
}

uint64_t sub_2127F167C(char *bsdName)
{
  mach_port_t v1;
  __CFDictionary *v2;
  const __CFDictionary *v3;

  if (!bsdName)
    return 0;
  v1 = *MEMORY[0x24BDD8B20];
  v2 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, bsdName);
  if (!v2)
    return 0;
  v3 = v2;
  CFDictionarySetValue(v2, CFSTR("IOProviderClass"), CFSTR("IOMedia"));
  return IOServiceGetMatchingService(v1, v3);
}

uint64_t sub_2127F16E8()
{
  uint64_t result;
  __CFString **v1;
  __CFString *v2;

  if (!off_254B5A9A8)
    return 0;
  LODWORD(result) = 0;
  v1 = &off_254B5A9E0;
  do
  {
    result = (result + 1);
    v2 = *v1;
    v1 += 7;
  }
  while (v2);
  return result;
}

__CFDictionary *sub_2127F1718()
{
  __CFDictionary *Mutable;
  int v1;
  CFTypeRef v2;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v1 = DIGetBundleRef();
    v2 = sub_21281FFEC(v1, (int)CFSTR("BSD backing store"), CFSTR("BSD backing store"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CBackingStore"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-type"), CFSTR("builtin"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-name"), v2);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-key"), CFSTR("CBSDBackingStore"));
    if (v2)
      CFRelease(v2);
  }
  return Mutable;
}

void sub_2127F17F0(const void *a1)
{
  CFTypeID v2;
  CFTypeID v3;
  __CFArray *v4;
  CFRange v5;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    if (v2 == CFDictionaryGetTypeID())
    {
      CFArrayAppendValue((CFMutableArrayRef)qword_254B5AD48, a1);
    }
    else
    {
      v3 = CFGetTypeID(a1);
      if (v3 == CFArrayGetTypeID())
      {
        v4 = (__CFArray *)qword_254B5AD48;
        v5.length = CFArrayGetCount((CFArrayRef)a1);
        v5.location = 0;
        CFArrayAppendArray(v4, (CFArrayRef)a1, v5);
      }
    }
  }
}

__CFDictionary *sub_2127F1880()
{
  __CFDictionary *Mutable;
  int v1;
  CFTypeRef v2;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v1 = DIGetBundleRef();
    v2 = sub_21281FFEC(v1, (int)CFSTR("vectored backing store"), CFSTR("vectored backing store"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CBackingStore"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-type"), CFSTR("builtin"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-name"), v2);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-key"), CFSTR("CVectoredBackingStore"));
    if (v2)
      CFRelease(v2);
  }
  return Mutable;
}

uint64_t sub_2127F1958(int a1)
{
  uint64_t (**v1)();
  uint64_t result;
  uint64_t *v3;
  uint64_t v4;

  if ((a1 - 1) > 2)
    return 0;
  v1 = off_24CE29098[a1 - 1];
  if (!v1[5])
    return 0;
  LODWORD(result) = 0;
  v3 = (uint64_t *)(v1 + 12);
  do
  {
    result = (result + 1);
    v4 = *v3;
    v3 += 7;
  }
  while (v4);
  return result;
}

__CFArray *sub_2127F1998()
{
  const __CFAllocator *v0;
  __CFArray *Mutable;
  __CFDictionary *v2;
  int v3;
  CFTypeRef v4;
  const void *v5;
  __CFDictionary *v6;
  int v7;
  CFTypeRef v8;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v2 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = DIGetBundleRef();
  v4 = sub_21281FFEC(v3, (int)CFSTR("128-bit AES encryption"), CFSTR("128-bit AES encryption"));
  CFDictionaryAddValue(v2, CFSTR("plugin-class"), CFSTR("CFileEncoding"));
  CFDictionaryAddValue(v2, CFSTR("plugin-type"), CFSTR("builtin"));
  CFDictionaryAddValue(v2, CFSTR("plugin-name"), v4);
  CFDictionaryAddValue(v2, CFSTR("plugin-key"), CFSTR("AES-128"));
  v5 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(v2, CFSTR("plugin-encryption"), (const void *)*MEMORY[0x24BDBD270]);
  if (v4)
    CFRelease(v4);
  CFArrayAppendValue(Mutable, v2);
  if (v2)
    CFRelease(v2);
  v6 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = DIGetBundleRef();
  v8 = sub_21281FFEC(v7, (int)CFSTR("256-bit AES encryption (recommended)"), CFSTR("256-bit AES encryption (recommended)"));
  CFDictionaryAddValue(v6, CFSTR("plugin-class"), CFSTR("CFileEncoding"));
  CFDictionaryAddValue(v6, CFSTR("plugin-type"), CFSTR("builtin"));
  CFDictionaryAddValue(v6, CFSTR("plugin-name"), v8);
  CFDictionaryAddValue(v6, CFSTR("plugin-key"), CFSTR("AES-256"));
  CFDictionaryAddValue(v6, CFSTR("plugin-encryption"), v5);
  if (v8)
    CFRelease(v8);
  CFArrayAppendValue(Mutable, v6);
  if (v6)
    CFRelease(v6);
  return Mutable;
}

__CFDictionary *sub_2127F1B9C()
{
  __CFDictionary *Mutable;
  int v1;
  CFTypeRef v2;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v1 = DIGetBundleRef();
    v2 = sub_21281FFEC(v1, (int)CFSTR("UDIF encoding"), CFSTR("UDIF encoding"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CFileEncoding"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-type"), CFSTR("builtin"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-name"), v2);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-key"), CFSTR("CUDIFEncoding"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-encryption"), (const void *)*MEMORY[0x24BDBD268]);
    if (v2)
      CFRelease(v2);
  }
  return Mutable;
}

uint64_t sub_2127F1C90()
{
  uint64_t result;
  __CFString **v1;
  __CFString *v2;

  if (!off_254B5AB50)
    return 0;
  LODWORD(result) = 0;
  v1 = &off_254B5ABA8;
  do
  {
    result = (result + 1);
    v2 = *v1;
    v1 += 11;
  }
  while (v2);
  return result;
}

__CFDictionary *sub_2127F1CC0()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  __CFDictionary *v2;
  int v3;
  CFTypeRef v4;
  __CFArray *v5;
  const void *v6;
  const void *v7;
  __CFArray *v8;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CDiskImage"));
    CFDictionaryAddValue(v2, CFSTR("plugin-type"), CFSTR("builtin"));
    v3 = DIGetBundleRef();
    v4 = sub_21281FFEC(v3, (int)CFSTR("UDIF disk image"), CFSTR("UDIF disk image"));
    CFDictionaryAddValue(v2, CFSTR("plugin-name"), v4);
    if (v4)
      CFRelease(v4);
    CFDictionaryAddValue(v2, CFSTR("plugin-key"), CFSTR("CUDIFDiskImage"));
    v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    v6 = (const void *)*MEMORY[0x24BDBD268];
    sub_2128160AC(v5, CFSTR("read-only"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("read-only format"), CFSTR("UDRO"), CFSTR("dmg"), (const void *)*MEMORY[0x24BDBD268]);
    v7 = (const void *)*MEMORY[0x24BDBD270];
    sub_2128160AC(v5, CFSTR("compressed (ADC)"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("compressed format with ADC"), CFSTR("UDCO"), CFSTR("dmg"), (const void *)*MEMORY[0x24BDBD270]);
    sub_2128160AC(v5, CFSTR("compressed"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("compressed format with zlib"), CFSTR("UDZO"), CFSTR("dmg"), v6);
    sub_2128160AC(v5, CFSTR("compressed (lzfse)"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("compressed format with lzfse"), CFSTR("ULFO"), CFSTR("dmg"), v7);
    sub_2128160AC(v5, CFSTR("entire device"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("complete format"), CFSTR("UFBI"), CFSTR("dmg"), v7);
    sub_2128160AC(v5, CFSTR("iPod image"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("complete format"), CFSTR("IPOD"), CFSTR("ipodimage"), v7);
    CFDictionaryAddValue(v2, CFSTR("plugin-diskimage-convert"), v5);
    if (v5)
      CFRelease(v5);
    v8 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    sub_21281630C(v8, CFSTR("CRC-32 image checksum"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("UDIF CRC-32 image checksum"), CFSTR("UDIF-CRC32"), v6);
    sub_21281630C(v8, CFSTR("MD5 image checksum"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("UDIF MD5 image checksum"), CFSTR("UDIF-MD5"), v7);
    sub_21281630C(v8, CFSTR("iPod image checksum"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("iPod image checksum"), CFSTR("IPOD"), v7);
    CFDictionaryAddValue(v2, CFSTR("plugin-diskimage-checksum"), v8);
    if (v8)
      CFRelease(v8);
  }
  return v2;
}

__CFDictionary *sub_2127F1FC0()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  __CFDictionary *v2;
  int v3;
  CFTypeRef v4;
  __CFArray *v5;
  const void *v6;
  __CFArray *v7;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v2 = Mutable;
  if (Mutable)
  {
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CDiskImage"));
    CFDictionaryAddValue(v2, CFSTR("plugin-type"), CFSTR("builtin"));
    v3 = DIGetBundleRef();
    v4 = sub_21281FFEC(v3, (int)CFSTR("sparse disk image"), CFSTR("sparse disk image"));
    CFDictionaryAddValue(v2, CFSTR("plugin-name"), v4);
    if (v4)
      CFRelease(v4);
    CFDictionaryAddValue(v2, CFSTR("plugin-key"), CFSTR("CSparseDiskImage"));
    v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    v6 = (const void *)*MEMORY[0x24BDBD270];
    sub_2128160AC(v5, CFSTR("sparse"), (uint64_t)CFSTR("CSparseDiskImage"), (uint64_t)CFSTR("sparse format"), CFSTR("UDSP"), CFSTR("sparseimage"), (const void *)*MEMORY[0x24BDBD270]);
    CFDictionaryAddValue(v2, CFSTR("plugin-diskimage-convert"), v5);
    if (v5)
      CFRelease(v5);
    v7 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    sub_2128161BC(v7, CFSTR("sparse disk image"), (uint64_t)CFSTR("CSparseDiskImage"), (uint64_t)CFSTR("name of disk image we create"), CFSTR("SPARSE"), CFSTR("sparseimage"), (const void *)*MEMORY[0x24BDBD268], v6, 0);
    CFDictionaryAddValue(v2, CFSTR("plugin-diskimage-create"), v7);
    if (v7)
      CFRelease(v7);
  }
  return v2;
}

__CFDictionary *sub_2127F2198()
{
  const __CFAllocator *v0;
  __CFDictionary *Mutable;
  int v2;
  CFTypeRef v3;
  const CFArrayCallBacks *v4;
  __CFArray *v5;
  const void *v6;
  __CFArray *v7;
  const void *v8;
  __CFArray *v9;
  __CFArray *v10;
  __CFDictionary *v11;
  int v12;
  CFTypeRef v13;

  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v2 = DIGetBundleRef();
    v3 = sub_21281FFEC(v2, (int)CFSTR("raw disk image"), CFSTR("raw disk image"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-class"), CFSTR("CDiskImage"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-type"), CFSTR("builtin"));
    CFDictionaryAddValue(Mutable, CFSTR("plugin-name"), v3);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-key"), CFSTR("CRawDiskImage"));
    if (v3)
      CFRelease(v3);
    v4 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    v5 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    v6 = (const void *)*MEMORY[0x24BDBD268];
    sub_2128160AC(v5, CFSTR("read/write"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("type of disk image we create"), CFSTR("UDRW"), CFSTR("dmg"), (const void *)*MEMORY[0x24BDBD268]);
    sub_2128160AC(v5, CFSTR("DVD/CD master"), (uint64_t)CFSTR("CUDIFDiskImage"), (uint64_t)CFSTR("type of disk image we create"), CFSTR("UDTO"), CFSTR("cdr"), v6);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-convert"), v5);
    v7 = CFArrayCreateMutable(v0, 0, v4);
    v8 = (const void *)*MEMORY[0x24BDBD270];
    sub_21281630C(v7, CFSTR("CRC-32"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw CRC-32 checksum"), CFSTR("CRC32"), (const void *)*MEMORY[0x24BDBD270]);
    sub_21281630C(v7, CFSTR("MD5"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw MD5 checksum"), CFSTR("MD5"), v8);
    sub_21281630C(v7, CFSTR("SHA"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw SHA checksum"), CFSTR("SHA"), v8);
    sub_21281630C(v7, CFSTR("SHA-1"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw SHA-1 checksum"), CFSTR("SHA1"), v8);
    sub_21281630C(v7, CFSTR("SHA-256"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw SHA-256 checksum"), CFSTR("SHA256"), v8);
    sub_21281630C(v7, CFSTR("SHA-384"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw SHA-384 checksum"), CFSTR("SHA384"), v8);
    sub_21281630C(v7, CFSTR("SHA-512"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("raw SHA-512 checksum"), CFSTR("SHA512"), v8);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-checksum"), v7);
    if (v7)
      CFRelease(v7);
    v9 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    sub_2128161BC(v9, CFSTR("read/write disk image"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("type of disk image we create"), CFSTR("UDIF"), CFSTR("dmg"), v6, v6, 0);
    sub_2128161BC(v9, CFSTR("DVD/CD master"), (uint64_t)CFSTR("CRawDiskImage"), (uint64_t)CFSTR("type of disk image we create"), CFSTR("UDTO"), CFSTR("cdr"), v6, v6, 0);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create"), v9);
    if (v9)
      CFRelease(v9);
    v10 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
    v11 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v12 = DIGetBundleRef();
    v13 = sub_21281FFEC(v12, (int)CFSTR("hybrid image (HFS+/ISO/UDF)"), CFSTR("hybrid image (HFS+/ISO/UDF)"));
    CFDictionaryAddValue(v11, CFSTR("plugin-diskimage-iff-name"), v13);
    if (v13)
      CFRelease(v13);
    CFDictionaryAddValue(v11, CFSTR("plugin-diskimage-iff-key"), CFSTR("UNIV"));
    CFDictionaryAddValue(v11, CFSTR("plugin-diskimage-iff-extension"), CFSTR("dmg"));
    CFArrayAppendValue(v10, v11);
    if (v11)
      CFRelease(v11);
    CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-iff"), v10);
    if (v10)
      CFRelease(v10);
  }
  return Mutable;
}

uint64_t DIResolveURLToBackingStore(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4, CFTypeRef *a5)
{
  uint64_t v10;
  CFMutableStringRef Mutable;
  __CFString *v12;
  unsigned int v13;
  char *v15;
  CFStringRef appendedString;
  char *v17;

  appendedString = 0;
  v17 = 0;
  v15 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v10 = 22;
  if (a1 && a4)
  {
    if (!sub_2127F1434())
      return 119;
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!Mutable)
      return 999;
    v12 = Mutable;
    v10 = DIBackingStoreNewWithCFURL(a1, a2, (uint64_t)&v17, (uint64_t)&appendedString);
    if (appendedString)
      CFStringAppend(v12, appendedString);
    if (!(_DWORD)v10)
    {
      if (!a3)
      {
LABEL_34:
        v10 = 0;
LABEL_35:
        if (appendedString)
        {
          CFRelease(appendedString);
          appendedString = 0;
        }
        *a4 = v17;
        if (a5)
        {
          *a5 = v12;
          if (!CFStringGetLength(v12) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0;
          }
        }
        else
        {
          CFRelease(v12);
        }
        return v10;
      }
      v13 = 0;
      while (1)
      {
        if (((a3 >> v13) & 1) != 0)
        {
          do
          {
            if (appendedString)
            {
              CFRelease(appendedString);
              appendedString = 0;
            }
            v10 = sub_2127F4360(v13, (uint64_t)v17, a2, (uint64_t)&v15, (uint64_t)&appendedString);
            if (appendedString)
              CFStringAppend(v12, appendedString);
            if ((_DWORD)v10 != 110)
            {
              if ((_DWORD)v10)
                goto LABEL_30;
              if (v17)
                DIDiskImageObjectRelease(v17);
              v17 = v15;
            }
          }
          while (!(v10 | v13));
          v10 = 0;
LABEL_30:
          if (appendedString)
          {
            CFRelease(appendedString);
            appendedString = 0;
          }
          if ((_DWORD)v10)
            break;
        }
        if (++v13 == 3)
          goto LABEL_34;
      }
    }
    if (v17)
    {
      DIDiskImageObjectRelease(v17);
      v17 = 0;
    }
    goto LABEL_35;
  }
  return v10;
}

uint64_t DIBackingStoreNewWithCFURL(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  unsigned int v9;
  __CFString **v10;
  unsigned int v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  int v13;
  __CFString *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (!off_254B5A9A8)
    return 110;
  v8 = 0;
  v9 = 0;
  v10 = &off_254B5A9E0;
  v11 = -1;
  do
  {
    v12 = (uint64_t (*)(uint64_t, uint64_t))*(v10 - 11);
    if (v12)
    {
      v13 = v12(a1, a2);
      if (v13 > v8)
      {
        v11 = v9;
        v8 = v13;
      }
    }
    ++v9;
    v14 = *v10;
    v10 += 7;
  }
  while (v14);
  if ((v11 & 0x80000000) != 0)
    return 110;
  v15 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))*(&off_254B5A980 + 7 * v11 + 2);
  if (v15)
    return v15(a1, a2, a3, a4);
  else
    return 78;
}

uint64_t sub_2127F28B8(const __CFURL *a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  stat v8;

  if (!a1 || (sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CBSDBackingStore")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CBSDBackingStore")) > 0)
    return 1000;
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, CFSTR("file-type"), 0)
     || CFDictionaryGetValueIfPresent(theDict, CFSTR("file-creator"), 0)))
  {
    return 4294966296;
  }
  v5 = CFURLCopyScheme(a1);
  if (!v5)
    return 4294966296;
  v6 = v5;
  if (CFStringCompare(v5, CFSTR("file"), 0) || CFURLHasDirectoryPath(a1))
  {
    v4 = 4294966296;
  }
  else if (sub_2127F2A94(a1, &v8))
  {
    v4 = 1;
  }
  else
  {
    v4 = 100;
  }
  CFRelease(v6);
  return v4;
}

uint64_t sub_2127F29C0(CFDictionaryRef theDict, const void *a2, const __CFString *a3)
{
  uint64_t result;
  CFTypeID v6;
  void *value;

  result = 0;
  if (theDict)
  {
    if (a2)
    {
      if (a3)
      {
        value = 0;
        result = CFDictionaryGetValueIfPresent(theDict, a2, (const void **)&value);
        if ((_DWORD)result)
        {
          v6 = CFGetTypeID(value);
          if (v6 == CFStringGetTypeID())
          {
            if (CFStringCompare((CFStringRef)value, a3, 0))
              return 0xFFFFFFFFLL;
            else
              return 1;
          }
          else
          {
            return 0xFFFFFFFFLL;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_2127F2A48(const __CFDictionary *a1, const void *a2, unsigned __int8 a3)
{
  const __CFString *Value;
  unsigned __int8 v6;

  if (a1)
  {
    Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
    if (Value)
    {
      v6 = a3;
      if (sub_2127F1508(Value, &v6))
        return v6;
    }
  }
  return a3;
}

uint64_t sub_2127F2A94(const __CFURL *a1, stat *a2)
{
  const char *v3;
  char *v4;
  uint64_t v5;

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = (const char *)sub_2127F2AEC(a1);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = (char *)v3;
  v5 = stat(v3, a2);
  if ((v5 & 0x80000000) != 0)
    v5 = *__error();
  free(v4);
  return v5;
}

const __CFString *sub_2127F2AEC(const __CFURL *a1)
{
  const __CFString *result;
  const __CFString *v2;
  void *v3;

  result = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (result)
  {
    v2 = result;
    v3 = sub_2127F2B30(result, 0x8000100u);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

void *sub_2127F2B30(const __CFString *a1, CFStringEncoding a2)
{
  CFIndex Length;
  CFIndex v5;
  void *v6;

  Length = CFStringGetLength(a1);
  v5 = CFStringGetMaximumSizeForEncoding(Length, a2) + 1;
  v6 = malloc_type_malloc(v5, 0x1F3DE694uLL);
  if (v6 && !CFStringGetCString(a1, (char *)v6, v5, a2))
  {
    free(v6);
    return 0;
  }
  return v6;
}

uint64_t sub_2127F2BA8(const __CFURL *a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  const __CFString *v6;
  const __CFString *v7;

  if ((sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CVectoredBackingStore")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CVectoredBackingStore")) > 0)
    return 1000;
  if (theDict
    && (CFDictionaryGetValueIfPresent(theDict, CFSTR("file-type"), 0)
     || CFDictionaryGetValueIfPresent(theDict, CFSTR("file-creator"), 0)))
  {
    return 4294966296;
  }
  v6 = CFURLCopyScheme(a1);
  v4 = 4294966296;
  if (v6)
  {
    v7 = v6;
    if (CFStringCompare(v6, CFSTR("vectored"), 0))
      v4 = 4294966296;
    else
      v4 = 9999;
    CFRelease(v7);
  }
  return v4;
}

uint64_t sub_2127F2C84(const __CFURL *a1, const __CFDictionary *a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _QWORD *v14;
  unsigned int v16;
  stat v17;

  if (a4)
    *a4 = 0;
  if (!a3)
    return 22;
  *a3 = 0;
  if (!a1)
  {
    v10 = 0;
    v9 = 22;
LABEL_16:
    *a3 = v10;
    return v9;
  }
  v7 = sub_2127F2A94(a1, &v17);
  if ((_DWORD)v7)
  {
    v9 = v7;
    v10 = 0;
    goto LABEL_22;
  }
  v8 = v17.st_mode & 0xF000;
  v9 = 102;
  if (v8 != 4096 && v8 != 0x4000)
  {
    v10 = operator new();
    sub_2127F2E88((_QWORD *)v10, a2);
    v11 = (*(uint64_t (**)(uint64_t, const __CFURL *))(*(_QWORD *)v10 + 736))(v10, a1);
    if (!(_DWORD)v11)
    {
      v12 = sub_2127F3728((uint64_t)a2);
      v13 = sub_2127F2A48(a2, CFSTR("exclusive-open-locks-are-optional"), 0);
      v14 = (_QWORD *)MEMORY[0x24BDBD270];
      if (v13)
        (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)v10 + 32))(v10, CFSTR("exclusive-open-locks-are-optional"), *MEMORY[0x24BDBD270]);
      if (sub_2127F2A48(a2, CFSTR("skip-permissions-check"), 0)
        || (v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v10 + 80))(v10, v12), !(_DWORD)v11))
      {
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v10 + 760))(v10))
          (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)v10 + 32))(v10, CFSTR("bs-io-scheduling"), *v14);
        sub_2127F375C(v10, a2);
        v9 = 0;
        *(_BYTE *)(v10 + 369) = sub_2127F2A48(a2, CFSTR("bs-no-follow"), 0);
        goto LABEL_16;
      }
    }
    v9 = v11;
LABEL_22:
    if ((v9 & 0x80000000) != 0)
    {
      v16 = *__error();
      if (v16)
        v9 = v16;
      else
        v9 = 999;
    }
    if (v10)
    {
      sub_2127F38CC((char *)v10);
      v10 = 0;
    }
    goto LABEL_16;
  }
  return v9;
}

void sub_2127F2E64(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10F1C40D1CC5EF5);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F2E88(_QWORD *a1, const __CFDictionary *a2)
{
  _QWORD *v3;

  v3 = sub_2127F2F10(a1, a2);
  *v3 = &off_24CE293E0;
  v3[42] = 0;
  v3[43] = 0;
  *((_DWORD *)v3 + 80) = -1;
  v3[35] = 0;
  *((_DWORD *)v3 + 72) = 0;
  v3[37] = 0;
  *((_BYTE *)v3 + 304) = 0;
  v3[41] = 0;
  v3[39] = 0;
  *((_BYTE *)v3 + 369) = 0;
  sub_2127F32D4((uint64_t)v3, CFSTR("thread-safe"), (const void *)*MEMORY[0x24BDBD270]);
  return a1;
}

void sub_2127F2EF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3BA8(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F2F10(_QWORD *a1, const __CFDictionary *a2)
{
  _QWORD *v4;
  size_t v5;
  const __CFNumber *Value;
  const __CFNumber *v7;
  int v9;
  int valuePtr;

  sub_2127F2FD0((uint64_t)a1);
  *v4 = off_24CE2C690;
  v5 = 0x100000;
  v9 = 0x100000;
  valuePtr = 4;
  v4[25] = 0;
  v4[26] = 0;
  if (a2)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("bs-cache-depth"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    v7 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("bs-cache-entry-size"));
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberSInt32Type, &v9);
      v5 = v9;
    }
    else
    {
      v5 = 0x100000;
    }
  }
  sub_2127F3128(a1, valuePtr, v5);
  return a1;
}

void sub_2127F2FB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3D40(v1);
  _Unwind_Resume(a1);
}

double sub_2127F2FD0(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = sub_2127F3014(a1);
  *(_QWORD *)v1 = off_24CE29108;
  *(_DWORD *)(v1 + 104) = 0;
  *(_QWORD *)(v1 + 184) = 0;
  *(_BYTE *)(v1 + 192) = 0;
  *(_QWORD *)(v1 + 112) = 0;
  *(_QWORD *)(v1 + 120) = 0;
  *(_BYTE *)(v1 + 128) = 0;
  result = 0.0;
  *(_OWORD *)(v1 + 136) = 0u;
  *(_OWORD *)(v1 + 152) = 0u;
  *(_OWORD *)(v1 + 164) = 0u;
  return result;
}

uint64_t sub_2127F3014(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;

  *(_QWORD *)a1 = &off_24CE29710;
  *(_QWORD *)(a1 + 80) = 0;
  *(_DWORD *)(a1 + 8) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 16), 0);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = Mutable;
  DIDiskImageObjectRetain_0((char *)a1);
  if (qword_254B5ADA0)
    CFArrayAppendValue((CFMutableArrayRef)qword_254B5ADA0, (const void *)a1);
  return a1;
}

uint64_t DIDiskImageObjectRetain_0(char *a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  FILE *v4;
  const char *v5;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v3 = (*((_DWORD *)a1 + 2) + 1);
  *((_DWORD *)a1 + 2) = v3;
  if (qword_254B5ADA0)
  {
    v4 = (FILE *)*MEMORY[0x24BDAC8D8];
    v5 = (const char *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 16))(a1);
    fprintf(v4, "\x1B[34m\x1B[43mCDiskImageObject::retain: object %s %p refCount is %d.\x1B[0m\n", v5, a1, v3);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

_QWORD *sub_2127F3128(_QWORD *result, int a2, size_t a3)
{
  uint64_t v5;
  _QWORD *v6;

  if (!result[26])
  {
    v5 = (uint64_t)result;
    pthread_mutex_init((pthread_mutex_t *)(result + 27), 0);
    v6 = (_QWORD *)operator new();
    result = sub_2127F31C4(v6, v5, (uint64_t)sub_2127FF720, a2, a3);
    *(_QWORD *)(v5 + 208) = v6;
  }
  return result;
}

void sub_2127F31A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C4079B348B8);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F31C4(_QWORD *a1, uint64_t a2, uint64_t a3, int a4, size_t a5)
{
  int v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a4;
  a1[4] = a2;
  a1[5] = a3;
  *a1 = &off_24CE2C978;
  a1[1] = a5;
  v10 = malloc_type_calloc((2 * a4) | 1, 0x18uLL, 0x1010040A79CA2DEuLL);
  a1[2] = 0;
  a1[3] = v10;
  if (v6 >= 1)
  {
    do
    {
      v11 = operator new();
      *(_QWORD *)v11 = &off_24CE2C998;
      *(_QWORD *)(v11 + 48) = a2;
      *(_QWORD *)(v11 + 56) = a3;
      *(_BYTE *)(v11 + 8) = 0;
      *(_BYTE *)(v11 + 16) = 0;
      *(_DWORD *)(v11 + 12) = 0;
      *(_QWORD *)(v11 + 24) = 0;
      *(_QWORD *)(v11 + 32) = 0;
      *(_QWORD *)(v11 + 40) = malloc_type_malloc(a5, 0x302A07CAuLL);
      v12 = a1[2];
      *(_QWORD *)(v11 + 64) = a5;
      *(_QWORD *)(v11 + 72) = v12;
      a1[2] = v11;
      --v6;
    }
    while (v6);
  }
  return a1;
}

void sub_2127F32B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10F1C4066F82E81);
  _Unwind_Resume(a1);
}

BOOL sub_2127F32D4(uint64_t a1, void *key, const void *a3)
{
  __CFDictionary *v4;

  if (key)
  {
    v4 = *(__CFDictionary **)(a1 + 96);
    if (a3)
      CFDictionarySetValue(v4, key, a3);
    else
      CFDictionaryRemoveValue(v4, key);
  }
  return key != 0;
}

uint64_t sub_2127F3314(uint64_t a1, const __CFURL *a2)
{
  uint64_t v4;
  __darwin_time_t tv_sec;
  CFStringRef v6;
  void *v7;
  const __CFString *v8;
  stat v10;

  sub_2127F3404((_QWORD *)a1, a2);
  v4 = sub_2127F2A94(a2, &v10);
  if (!(_DWORD)v4)
  {
    tv_sec = v10.st_mtimespec.tv_sec;
    *(_QWORD *)(a1 + 280) = v10.st_ino;
    *(_DWORD *)(a1 + 288) = v10.st_dev;
    *(_QWORD *)(a1 + 200) = v10.st_size;
    v6 = CFStringCreateWithFormat(0, 0, CFSTR("%ld"), tv_sec);
    if (v6)
      (*(void (**)(uint64_t, const __CFString *, CFStringRef))(*(_QWORD *)a1 + 32))(a1, CFSTR("bs-modtime"), v6);
    v7 = *(void **)(a1 + 296);
    if (v7)
    {
      free(v7);
      *(_QWORD *)(a1 + 296) = 0;
    }
    v8 = sub_2127F2AEC(a2);
    *(_QWORD *)(a1 + 296) = v8;
    if (!v8)
    {
      v4 = 999;
      if (!v6)
        return v4;
      goto LABEL_8;
    }
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 728))(a1);
    if (v6)
LABEL_8:
      CFRelease(v6);
  }
  return v4;
}

uint64_t sub_2127F3404(_QWORD *a1, CFURLRef anURL)
{
  CFURLRef v2;
  CFStringRef v4;
  CFStringRef v5;
  const __CFURL *v6;
  const __CFURL *v7;
  const void *v9;
  CFStringRef v10;
  CFStringRef PathComponent;
  CFStringRef v12;
  CFArrayRef v13;
  void *values;

  if (!anURL)
    return 22;
  v2 = anURL;
  v4 = CFURLCopyUserName(anURL);
  if (!v4)
    goto LABEL_7;
  v5 = v4;
  v6 = (const __CFURL *)sub_212806E94((uint64_t)v2, 0, 0);
  if (!v6)
  {
    CFRelease(v5);
LABEL_7:
    values = v2;
    CFRetain(v2);
    goto LABEL_8;
  }
  v7 = v6;
  values = v6;
  CFRelease(v5);
  v2 = v7;
LABEL_8:
  v9 = (const void *)a1[18];
  if (v9)
    CFRelease(v9);
  a1[18] = v2;
  v10 = CFURLCopyPath(v2);
  (*(void (**)(_QWORD *, CFStringRef))(*a1 + 512))(a1, v10);
  if (v10)
    CFRelease(v10);
  PathComponent = CFURLCopyLastPathComponent(v2);
  (*(void (**)(_QWORD *, CFStringRef))(*a1 + 520))(a1, PathComponent);
  if (PathComponent)
    CFRelease(PathComponent);
  v12 = CFURLCopyPathExtension(v2);
  (*(void (**)(_QWORD *, CFStringRef))(*a1 + 528))(a1, v12);
  if (v12)
    CFRelease(v12);
  v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, 1, MEMORY[0x24BDBD690]);
  (*(void (**)(_QWORD *, CFArrayRef))(*a1 + 536))(a1, v13);
  if (v13)
    CFRelease(v13);
  return 0;
}

void sub_2127F356C(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 136);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 136) = cf;
  if (cf)
    CFRetain(cf);
}

void sub_2127F35B0(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 112);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 112) = cf;
  if (cf)
    CFRetain(cf);
}

void sub_2127F35F4(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 120);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 120) = cf;
  if (cf)
    CFRetain(cf);
}

void sub_2127F3638(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 152);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 152) = cf;
}

uint64_t sub_2127F3674(uint64_t a1)
{
  CFStringRef v2;
  CFStringRef v3;

  v2 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("d%d:i%llu"), *(unsigned int *)(a1 + 288), *(_QWORD *)(a1 + 280));
  if (!v2)
    return 999;
  v3 = v2;
  (*(void (**)(uint64_t, CFStringRef))(*(_QWORD *)a1 + 552))(a1, v2);
  CFRelease(v3);
  return 0;
}

void sub_2127F36F0(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  CFRetain(cf);
  v4 = *(const void **)(a1 + 160);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 160) = cf;
}

uint64_t sub_2127F3728(uint64_t result)
{
  if (result)
  {
    result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("writeable"));
    if (result)
    {
      if (CFBooleanGetValue((CFBooleanRef)result))
        return 3;
      else
        return 1;
    }
  }
  return result;
}

uint64_t sub_2127F375C(uint64_t a1, const __CFDictionary *a2)
{
  char *v4;
  pid_t v5;
  char __str[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (sub_2127F2A48(a2, CFSTR("skip-flushing"), 0))
    *(_BYTE *)(a1 + 304) = 1;
  if (sub_2127F2A48(a2, CFSTR("di-bsd-log-io"), 0))
  {
    v4 = basename(*(char **)(a1 + 296));
    v5 = getpid();
    snprintf(__str, 0x400uLL, "/tmp/%s-%d.log", v4, v5);
    syslog(5, "CBSDBackingStore: using log file: %s\n", __str);
    *(_QWORD *)(a1 + 328) = fopen(__str, "a");
  }
  if (sub_2127F2A48(a2, CFSTR("mp-apple-quarantine"), 0))
    sub_2127F32D4(a1, CFSTR("mp-apple-quarantine"), (const void *)*MEMORY[0x24BDBD270]);
  if (sub_2127F2A48(a2, CFSTR("bs-cache"), 1u))
    sub_2127F3128((_QWORD *)a1, 4, 0x100000uLL);
  else
    sub_2127F3C0C(a1);
  return 0;
}

uint64_t sub_2127F38B0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 160);
}

uint64_t DIDiskImageObjectRelease(char *a1)
{
  return sub_2127F38CC(a1);
}

uint64_t sub_2127F38CC(char *a1)
{
  int v2;
  FILE *v3;
  FILE *v4;
  const char *v5;

  os_log_create("com.apple.diskimages", "DIDiskimageObject");
  if (!a1)
    return 0;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v2 = *((_DWORD *)a1 + 2);
  *((_DWORD *)a1 + 2) = v2 - 1;
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  if (!qword_254B5ADA0)
  {
    if (v2 != 1)
      return 0;
LABEL_9:
    (*(void (**)(char *))(*(_QWORD *)a1 + 8))(a1);
    return 1;
  }
  if (v2 < 2)
  {
    v4 = (FILE *)*MEMORY[0x24BDAC8D8];
    v5 = (const char *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 16))(a1);
    if (v2 != 1)
    {
      fprintf(v4, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p \x1B[5m\x1B[7mrefCount is %d.\x1B[0m\n");
      return 0;
    }
    fprintf(v4, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d. \x1B[7mfreeing object.\x1B[0m\n", v5, a1, 0);
    goto LABEL_9;
  }
  v3 = (FILE *)*MEMORY[0x24BDAC8D8];
  (*(void (**)(char *))(*(_QWORD *)a1 + 16))(a1);
  fprintf(v3, "\x1B[33m\x1B[44mCDiskImageObject::release: object %s %p refCount is %d.\x1B[0m\n");
  return 0;
}

void sub_2127F39E4(uint64_t a1)
{
  sub_2127F3A3C(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127F3A18(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10F1C40D1CC5EF5);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F3A3C(uint64_t a1)
{
  uint64_t (**v2)();
  FILE *v3;
  void *v4;
  const void *v5;

  v2 = &off_24CE293E0;
  *(_QWORD *)a1 = &off_24CE293E0;
  v3 = *(FILE **)(a1 + 328);
  if (v3)
  {
    fclose(v3);
    v2 = *(uint64_t (***)())a1;
  }
  ((void (*)(uint64_t, uint64_t))v2[35])(a1, 1);
  *(_QWORD *)(a1 + 280) = 0;
  *(_DWORD *)(a1 + 288) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  v4 = *(void **)(a1 + 296);
  if (v4)
  {
    free(v4);
    *(_QWORD *)(a1 + 296) = 0;
  }
  v5 = *(const void **)(a1 + 312);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 312) = 0;
  }
  return sub_2127F3BA8(a1);
}

void sub_2127F3AB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3BA8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F3ACC(uint64_t *a1)
{
  stat v3;

  (*(void (**)(uint64_t *))(*a1 + 584))(a1);
  if (((*(uint64_t (**)(uint64_t *))(*a1 + 568))(a1) & 1) == 0 && *((_DWORD *)a1 + 80) != -1)
  {
    if (a1[26] && (*(unsigned int (**)(uint64_t *))(*a1 + 72))(a1))
      sub_2127F4B4C(a1[26], a1[25]);
    close(*((_DWORD *)a1 + 80));
    if (a1[26] && !stat((const char *)a1[37], &v3))
      *((_OWORD *)a1 + 22) = v3.st_mtimespec;
    *((_DWORD *)a1 + 80) = -1;
  }
  return 0;
}

uint64_t sub_2127F3B74(uint64_t result, int a2)
{
  int v2;
  int v4;

  v2 = *(_DWORD *)(result + 168);
  if (v2 > 0 || a2 != 0)
  {
    v4 = v2 - 1;
    if (a2)
      v4 = 0;
    *(_DWORD *)(result + 168) = v4;
  }
  return result;
}

BOOL sub_2127F3B98(uint64_t a1)
{
  return *(_DWORD *)(a1 + 168) > 0;
}

_QWORD *sub_2127F3BA8(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = off_24CE2C690;
  v2 = *(_QWORD *)(a1 + 208);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 216));
  }
  *(_QWORD *)(a1 + 208) = 0;
  return sub_2127F3D40(a1);
}

void sub_2127F3BF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3D40(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F3C0C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 208);
  if (result)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)result + 8))(result);
    result = pthread_mutex_destroy((pthread_mutex_t *)(a1 + 216));
  }
  *(_QWORD *)(a1 + 208) = 0;
  return result;
}

void sub_2127F3C48(uint64_t a1)
{
  sub_2127F3CA0(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127F3C7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C4079B348B8);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F3CA0(uint64_t a1)
{
  _QWORD *i;

  *(_QWORD *)a1 = &off_24CE2C978;
  for (i = *(_QWORD **)(a1 + 16); i; i = *(_QWORD **)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i[9];
    (*(void (**)(_QWORD *))(*i + 8))(i);
  }
  free(*(void **)(a1 + 24));
  return a1;
}

void sub_2127F3CF8(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2C998;
  free(*(void **)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  JUMPOUT(0x212BF43D0);
}

_QWORD *sub_2127F3D40(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  char *v8;

  *(_QWORD *)a1 = off_24CE29108;
  *(_DWORD *)(a1 + 104) = 0;
  v2 = *(const void **)(a1 + 136);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(a1 + 136) = 0;
  }
  v3 = *(const void **)(a1 + 112);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(a1 + 112) = 0;
  }
  v4 = *(const void **)(a1 + 120);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 120) = 0;
  }
  v5 = *(const void **)(a1 + 160);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 160) = 0;
  }
  v6 = *(const void **)(a1 + 144);
  if (v6)
  {
    CFRelease(v6);
    *(_QWORD *)(a1 + 144) = 0;
  }
  v7 = *(const void **)(a1 + 152);
  if (v7)
  {
    CFRelease(v7);
    *(_QWORD *)(a1 + 152) = 0;
  }
  v8 = *(char **)(a1 + 184);
  if (v8)
  {
    DIDiskImageObjectRelease(v8);
    *(_QWORD *)(a1 + 184) = 0;
  }
  return sub_2127F3E08((_QWORD *)a1);
}

void sub_2127F3DE0(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

BOOL sub_2127F3DF8(uint64_t a1)
{
  return *(_DWORD *)(a1 + 176) > 0;
}

_QWORD *sub_2127F3E08(_QWORD *a1)
{
  pthread_mutex_t *v2;
  const __CFArray *v3;
  CFIndex FirstIndexOfValue;
  const void *v5;
  CFRange v7;

  *a1 = &off_24CE29710;
  v2 = (pthread_mutex_t *)(a1 + 2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 2));
  pthread_mutex_unlock(v2);
  v3 = (const __CFArray *)qword_254B5ADA0;
  if (qword_254B5ADA0)
  {
    v7.length = CFArrayGetCount((CFArrayRef)qword_254B5ADA0);
    v7.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v3, v7, a1);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_254B5ADA0, FirstIndexOfValue);
  }
  v5 = (const void *)a1[12];
  if (v5)
  {
    CFRelease(v5);
    a1[12] = 0;
  }
  pthread_mutex_destroy(v2);
  return a1;
}

uint64_t DIResolveURLToDiskImage(uint64_t a1, const __CFDictionary *a2, unsigned int a3, _QWORD *a4, CFTypeRef *a5)
{
  uint64_t v10;
  const __CFAllocator *v11;
  CFMutableStringRef Mutable;
  __CFString *v13;
  const __CFDictionary *MutableCopy;
  __CFDictionary *v15;
  CFStringRef appendedString;
  char *v18;
  char *v19;

  v18 = 0;
  v19 = 0;
  appendedString = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v10 = 22;
  if (a1 && a4)
  {
    if (sub_2127F1434())
    {
      v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (Mutable)
      {
        v13 = Mutable;
        if (a2)
          MutableCopy = CFDictionaryCreateMutableCopy(v11, 0, a2);
        else
          MutableCopy = CFDictionaryCreateMutable(v11, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        v15 = MutableCopy;
        if (CFDictionaryGetValue(MutableCopy, CFSTR("shadow-file")))
          DIAddPermission(v15, 1);
        v10 = DIResolveURLToBackingStore(a1, (uint64_t)v15, a3, &v19, (CFTypeRef *)&appendedString);
        if (appendedString)
          CFStringAppend(v13, appendedString);
        if (!(_DWORD)v10)
        {
          if (appendedString)
          {
            CFRelease(appendedString);
            appendedString = 0;
          }
          v10 = sub_2127F5D10((uint64_t)v19, a2, &v18, (CFTypeRef *)&appendedString);
          if (appendedString)
            CFStringAppend(v13, appendedString);
          if ((_DWORD)v10 && v18)
          {
            DIDiskImageObjectRelease(v18);
            v18 = 0;
          }
        }
        if (v19)
        {
          DIDiskImageObjectRelease(v19);
          v19 = 0;
        }
        if (v15)
          CFRelease(v15);
        if (appendedString)
        {
          CFRelease(appendedString);
          appendedString = 0;
        }
        *a4 = v18;
        if (a5)
        {
          *a5 = v13;
          if (!CFStringGetLength(v13) && *a5)
          {
            CFRelease(*a5);
            *a5 = 0;
          }
        }
        else
        {
          CFRelease(v13);
        }
      }
      else
      {
        return 999;
      }
    }
    else
    {
      return 119;
    }
  }
  return v10;
}

uint64_t sub_2127F4084(uint64_t a1, int a2)
{
  uint64_t result;
  const __CFString *v5;
  int v6;
  const char *v7;
  int v8;
  int v9;

  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    v5 = (const __CFString *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("exclusive-open-locks-are-optional"));
    v6 = sub_2127F14C8(v5, 0);
    *(_BYTE *)(a1 + 368) = v6;
    if (a2)
    {
      if (a2 == 3)
      {
        v7 = *(const char **)(a1 + 296);
        v8 = 2;
      }
      else
      {
        if (a2 != 1)
          return 22;
        v7 = *(const char **)(a1 + 296);
        v8 = 0;
      }
      v9 = sub_2127F4264(v7, v8, v6, 438);
      if ((v9 & 0x80000000) == 0)
        goto LABEL_15;
LABEL_21:
      result = *__error();
      if ((_DWORD)result)
        return result;
      return sub_2127F4354(a1, a2);
    }
    v9 = sub_2127F4264(*(const char **)(a1 + 296), 2, v6, 438);
    if (v9 < 0)
    {
      v9 = sub_2127F4264(*(const char **)(a1 + 296), 0, *(unsigned __int8 *)(a1 + 368), 438);
      if (v9 < 0)
      {
        a2 = 3;
        goto LABEL_21;
      }
      a2 = 1;
    }
    else
    {
      a2 = 3;
    }
LABEL_15:
    close(v9);
    return sub_2127F4354(a1, a2);
  }
  if (!a2)
    return 0;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1) == a2)
    return 0;
  return 13;
}

const void *sub_2127F41A8(_QWORD *a1, CFTypeRef cf1)
{
  uint64_t v4;
  const void *v5;

  if (!CFEqual(cf1, CFSTR("bs-persistentID")))
    return sub_2127F4250((uint64_t)a1, cf1);
  if (!a1[39])
  {
    v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 752))(a1);
    if (v4)
    {
      v5 = (const void *)v4;
      a1[39] = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("i:%llu on %@"), a1[35], v4);
      CFRelease(v5);
    }
  }
  return (const void *)a1[39];
}

const void *sub_2127F4250(uint64_t a1, const void *a2)
{
  if (a2)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 96), a2);
  else
    return 0;
}

uint64_t sub_2127F4264(const char *a1, int a2, int a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  if ((a2 & 3) == 2)
    v8 = 36;
  else
    v8 = 20;
  v9 = open(a1, v8 | a2, a4);
  v10 = v9;
  if ((v9 & 0x80000000) != 0)
  {
    v12 = *__error();
    if (v12 == 45 || a3 && v12 == 35)
    {
      v10 = open(a1, a2 & 0xFFFFFFCB, a4);
      if ((v10 & 0x80000000) != 0)
      {
        v13 = *__error();
        *__error() = v13;
      }
    }
    else
    {
      *__error() = v12;
    }
  }
  else
  {
    v11 = fcntl(v9, 3, 0);
    if ((v11 & 0x80000000) == 0)
      fcntl(v10, 4, v11 & 0xFFFFFFFB);
  }
  return v10;
}

uint64_t sub_2127F4354(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 104) = a2;
  return 0;
}

uint64_t sub_2127F4360(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (**v5)();
  unsigned int v10;
  int v11;
  uint64_t v12;
  uint64_t *v13;
  unsigned int v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  int v16;
  uint64_t v17;
  uint64_t (*v18)();

  if (a1 > 2)
    return 110;
  v5 = off_24CE29010[a1];
  if (!v5[5])
    return 110;
  v10 = 0;
  v11 = 0;
  v12 = (int)a1;
  v13 = (uint64_t *)(v5 + 12);
  v14 = -1;
  do
  {
    v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 11);
    if (v15)
    {
      v16 = v15(a2, a3);
      if (v16 > v11)
      {
        v14 = v10;
        v11 = v16;
      }
    }
    ++v10;
    v17 = *v13;
    v13 += 7;
  }
  while (v17);
  if ((v14 & 0x80000000) != 0)
    return 110;
  v18 = off_24CE29010[v12][7 * v14 + 2];
  if (v18)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v18)(a2, a3, a4, a5);
  else
    return 78;
}

uint64_t sub_2127F4454(_DWORD *a1)
{
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t result;

  if (((*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 568))(a1) & 1) != 0)
    goto LABEL_14;
  v2 = a1[80];
  if (v2 != -1)
    goto LABEL_13;
  if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)a1 + 72))(a1))
    v3 = 2;
  else
    v3 = 0;
  if (*((_BYTE *)a1 + 192))
    v3 |= 0x80u;
  if (*((_BYTE *)a1 + 369))
    v4 = v3 | 0x100;
  else
    v4 = v3;
  v5 = sub_2127F4264(*((const char **)a1 + 37), v4, *((unsigned __int8 *)a1 + 368), 438);
  a1[80] = v5;
  if ((v5 & 0x80000000) == 0)
  {
    sub_2127F4540();
    v2 = a1[80];
LABEL_13:
    fcntl(v2, 48, 1);
LABEL_14:
    (*(void (**)(_DWORD *))(*(_QWORD *)a1 + 576))(a1);
    return 0;
  }
  a1[80] = -1;
  result = *__error();
  if (!(_DWORD)result)
    goto LABEL_14;
  return result;
}

BOOL sub_2127F4530(uint64_t a1)
{
  return *(_DWORD *)(a1 + 104) == 3;
}

uint64_t sub_2127F4540()
{
  return 0;
}

uint64_t sub_2127F4548(uint64_t result)
{
  ++*(_DWORD *)(result + 168);
  return result;
}

uint64_t sub_2127F4558(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  FILE *v10;
  pid_t v11;

  v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    v11 = getpid();
    fprintf(v10, "read\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }
  return sub_2127F45DC(a1, a2, a3, a4, a5);
}

uint64_t sub_2127F45DC(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t *a4, uint64_t a5)
{
  pthread_mutex_t *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t *v18;
  int v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  unint64_t v31;

  v31 = 0;
  v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  v11 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    v12 = 9;
    goto LABEL_14;
  }
  v12 = 22;
  if (!a4 || !a5)
  {
LABEL_14:
    pthread_mutex_unlock(v10);
    if (!a4)
      return v12;
    goto LABEL_18;
  }
  v12 = 29;
  if ((a2 & 0x8000000000000000) == 0)
  {
    v13 = *(_QWORD *)(a1 + 200);
    if (v13 >= a2 && v13 - a2 >= a3)
    {
      v14 = *(_QWORD *)(a1 + 208);
      if (v14)
      {
        v30 = 0;
        v15 = sub_2127F4810(v14, a2, a3, &v30, 0);
        if (v15 >= 1)
        {
          v16 = v15;
          v29 = a3;
          v17 = 0;
          v18 = v30;
          v19 = v15;
          v20 = v30;
          do
          {
            memmove((void *)(a5 + *v20 - a2), (const void *)v20[2], v20[1]);
            v17 += v20[1];
            v20 += 3;
            --v19;
          }
          while (v19);
          v21 = v29;
          if (v17 == v29)
          {
            v12 = 0;
            goto LABEL_34;
          }
          v26 = a2;
          while (1)
          {
            v23 = *v18;
            v24 = *v18 - v26;
            if (*v18 > v26)
            {
              v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 712))(a1);
              if ((_DWORD)v25)
              {
                v12 = v25;
LABEL_33:
                v21 = v17;
                goto LABEL_34;
              }
              v17 += v24;
              v23 = *v18;
            }
            v26 = v18[1] + v23;
            v18 += 3;
            if (!--v16)
              goto LABEL_27;
          }
        }
        v17 = 0;
        if (!a3)
          goto LABEL_32;
        v29 = a3;
        v26 = a2;
LABEL_27:
        v27 = v29 + a2 - v26;
        if (v29 + a2 <= v26)
        {
LABEL_32:
          v12 = 0;
          goto LABEL_33;
        }
        v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 712))(a1);
        if ((_DWORD)v12)
          v28 = 0;
        else
          v28 = v27;
        v21 = v17 + v28;
LABEL_34:
        v11 = v21;
        goto LABEL_14;
      }
      v12 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, unint64_t *, uint64_t))(*(_QWORD *)a1 + 688))(a1, a2, a3, &v31, a5);
    }
  }
  pthread_mutex_unlock(v10);
  v11 = v31;
LABEL_18:
  *a4 = v11;
  return v12;
}

uint64_t sub_2127F4810(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, int a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(uint64_t **)(a1 + 24);
  if (a4)
    *a4 = v5;
  v6 = *(_QWORD *)(a1 + 16);
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(a1 + 16);
  do
  {
    if (*(_BYTE *)(v7 + 8))
      ++*(_DWORD *)(v7 + 12);
    v7 = *(_QWORD *)(v7 + 72);
  }
  while (v7);
  v8 = 0;
  do
  {
    if (*(_BYTE *)(v6 + 8))
    {
      v9 = *(_QWORD *)(v6 + 32);
      if (v9 >= a2)
      {
        v10 = *(_QWORD *)(v6 + 24);
        if (v10 < a3 + a2)
        {
          if (v10 <= a2)
            v11 = a2;
          else
            v11 = *(_QWORD *)(v6 + 24);
          if (v9 >= a3 + a2 - 1)
            v9 = a3 + a2 - 1;
          if (a5)
            *(_BYTE *)(v6 + 16) = 1;
          *(_DWORD *)(v6 + 12) = 0;
          *v5 = v11;
          v5[1] = v9 - v11 + 1;
          v5[2] = *(_QWORD *)(v6 + 40) + v11 - v10;
          v8 = (v8 + 1);
          v5 += 3;
        }
      }
    }
    v6 = *(_QWORD *)(v6 + 72);
  }
  while (v6);
  if ((_DWORD)v8)
    qsort(*(void **)(a1 + 24), (int)v8, 0x18uLL, (int (__cdecl *)(const void *, const void *))sub_2127F8FEC);
  return v8;
}

uint64_t sub_2127F48FC(_QWORD *a1, uint64_t a2, size_t a3, char *a4)
{
  char *v4;
  size_t v5;
  uint64_t v6;
  size_t v8;
  size_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v6 = a2;
  v8 = *(_QWORD *)(a1[26] + 8);
  v16 = 0;
  if (v8 <= a3)
  {
    v9 = a3 / v8 * v8;
    result = (*(uint64_t (**)(_QWORD *, uint64_t, size_t, uint64_t *, char *))(*a1 + 688))(a1, a2, v9, &v16, a4);
    if ((_DWORD)result)
      return result;
    v5 -= v9;
    v6 += v9;
    v4 += v9;
  }
  if (!v5)
    return 0;
  v11 = sub_2127F4A4C(a1[26]);
  v12 = v11;
  if (!*(_BYTE *)(v11 + 8) || !*(_BYTE *)(v11 + 16) || (result = sub_2127FF694(v11), !(_DWORD)result))
  {
    *(_BYTE *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(_BYTE *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = 0;
    *(_QWORD *)(v12 + 32) = 0;
    v13 = a1[26];
    v14 = sub_2127F4A9C(v13, v6, a1[25] - 1);
    if (!v14)
    {
      for (i = *(_QWORD *)(v13 + 16); i; i = *(_QWORD *)(i + 72))
        ;
    }
    result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t *, _QWORD))(*a1 + 688))(a1, v6, v14, &v16, *(_QWORD *)(v12 + 40));
    if (!(_DWORD)result)
    {
      *(_DWORD *)(v12 + 12) = 0;
      *(_QWORD *)(v12 + 24) = v6;
      *(_QWORD *)(v12 + 32) = v6 + v14 - 1;
      *(_BYTE *)(v12 + 16) = 0;
      *(_BYTE *)(v12 + 8) = 1;
      memmove(v4, *(const void **)(v12 + 40), v5);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2127F4A4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  int v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v3 = -1;
  while (*(_BYTE *)(v1 + 8))
  {
    v4 = *(_DWORD *)(v1 + 12);
    if (*(_BYTE *)(v1 + 16))
      ++v4;
    if (v4 > v3)
    {
      result = v1;
      v3 = v4;
    }
    v1 = *(_QWORD *)(v1 + 72);
    if (!v1)
      return result;
  }
  return v1;
}

uint64_t sub_2127F4A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  if (a3 - a2 >= v4)
    v5 = a2 + v4 - 1;
  else
    v5 = a3;
  for (; v3; v3 = *(_QWORD *)(v3 + 72))
  {
    if (*(_BYTE *)(v3 + 8) && *(_QWORD *)(v3 + 32) >= a2)
    {
      v6 = *(_QWORD *)(v3 + 24);
      if (v6 <= a2)
        v7 = a2;
      else
        v7 = *(_QWORD *)(v3 + 24);
      v8 = v7 - 1;
      if (v6 <= v5)
        v5 = v8;
    }
  }
  return v5 - a2 + 1;
}

uint64_t sub_2127F4AF8(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ssize_t v6;
  ssize_t v7;
  uint64_t result;

  ++*(_QWORD *)(a1 + 336);
  v6 = pread(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0)
    return *__error();
  v7 = v6;
  result = 0;
  *a4 = v7;
  return result;
}

uint64_t sub_2127F4B4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  sub_2127F4B98(a1, a2);
  if (!v2)
    return 0;
  while (1)
  {
    if (*(_BYTE *)(v2 + 8))
    {
      if (*(_BYTE *)(v2 + 16))
      {
        result = sub_2127FF694(v2);
        if ((_DWORD)result)
          break;
      }
    }
    v2 = *(_QWORD *)(v2 + 72);
    if (!v2)
      return 0;
  }
  return result;
}

uint64_t sub_2127F4B98(uint64_t result, uint64_t a2)
{
  uint64_t i;

  for (i = *(_QWORD *)(result + 16); i; i = *(_QWORD *)(i + 72))
  {
    if (*(_BYTE *)(i + 8))
    {
      if (*(_QWORD *)(i + 24) >= a2)
      {
        *(_BYTE *)(i + 8) = 0;
        *(_DWORD *)(i + 12) = 0;
        *(_QWORD *)(i + 24) = 0;
        *(_QWORD *)(i + 32) = 0;
        *(_BYTE *)(i + 16) = 0;
      }
      else if (*(_QWORD *)(i + 32) >= a2)
      {
        *(_QWORD *)(i + 32) = a2 - 1;
      }
    }
  }
  return result;
}

uint64_t sub_2127F4BEC(uint64_t a1, const __CFDictionary *a2)
{
  uint64_t v4;
  int v6;

  if (sub_2127F2A48(a2, CFSTR("DIIsPotentiallyValidDiskImage"), 0)
    || (sub_2127F29C0(a2, CFSTR("fileencoding-class"), CFSTR("CEncryptedEncoding")) & 0x80000000) != 0)
  {
    return 4294966296;
  }
  v6 = sub_2127F29C0(a2, CFSTR("fileencoding-class"), CFSTR("CEncryptedEncoding"));
  v4 = 1000;
  if (v6 <= 0)
  {
    if (sub_2127F4C84(a1, 0))
      return 1000;
    else
      return 4294966296;
  }
  return v4;
}

BOOL sub_2127F4C84(uint64_t a1, CFUUIDRef *a2)
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  const __CFString *v5;
  _BOOL8 v6;

  v3 = sub_2127F4CFC(a1);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = (const __CFString *)sub_2128023F8(v3, CFSTR("uuid"));
  v6 = v5 != 0;
  if (a2 && v5)
    *a2 = CFUUIDCreateFromString((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
  CFRelease(v4);
  return v6;
}

__CFDictionary *sub_2127F4CFC(uint64_t a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  int v4;
  char v5;
  CFNumberRef v7;
  const __CFUUID *v8;
  CFStringRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  const __CFUUID *v12;
  CFStringRef v13;
  CFNumberRef v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int *v19;
  unint64_t v20;
  int v21;
  int v22;
  unint64_t v23;
  _QWORD *v24;
  int v25;
  uint64_t v26;
  int8x16_t v27;
  __CFDictionary *v28;
  CFDataRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  unsigned int *v33;
  __CFArray *theArray;
  int v35;
  int v36;
  int valuePtr;
  unsigned int v38;
  _DWORD v39[2];
  uint64_t v40;
  CFUUIDBytes v41;
  _BYTE v42[20];
  uint64_t v43;
  unint64_t v44;
  CFIndex length[4];
  int8x16_t v46;
  CFUUIDBytes v47;
  uint64_t v48;
  _DWORD v49[4];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (a1 && !(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1))
  {
    v44 = 0;
    if ((*(unsigned int (**)(uint64_t, unint64_t *))(*(_QWORD *)a1 + 296))(a1, &v44)
      || (v44 & 0x8000000000000000) != 0)
    {
      goto LABEL_5;
    }
    v43 = 0;
    if (v44 >= 0x4FC)
    {
      if ((*(unsigned int (**)(uint64_t, unint64_t, uint64_t, uint64_t *, CFUUIDBytes *))(*(_QWORD *)a1 + 328))(a1, v44 - 1276, 1276, &v43, &v47))
      {
        goto LABEL_5;
      }
      if (!sub_2127F5358((uint64_t)&v47) && v49[2] == 1701733234 && v49[1] == 1667527521 && v49[0] == 1)
      {
        v7 = CFNumberCreate(v2, kCFNumberSInt32Type, v49);
        CFDictionarySetValue(Mutable, CFSTR("encrypted-file-version"), v7);
        CFRelease(v7);
        v8 = CFUUIDCreateFromUUIDBytes(v2, v47);
        v9 = CFUUIDCreateString(v2, v8);
        CFDictionarySetValue(Mutable, CFSTR("uuid"), v9);
        if (v9)
          CFRelease(v9);
        if (v8)
          CFRelease(v8);
        v10 = CFNumberCreate(v2, kCFNumberSInt32Type, &v48);
        CFDictionarySetValue(Mutable, CFSTR("blocksize"), v10);
        if (v10)
          CFRelease(v10);
        goto LABEL_64;
      }
    }
    if (!(*(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t *, _DWORD *))(*(_QWORD *)a1 + 328))(a1, 0, 72, &v43, v39)&& !sub_2127F5428((uint64_t)v39))
    {
      v5 = 0;
      if (v39[0] != 1701733234 || v39[1] != 1667527521)
      {
LABEL_6:
        v4 = 1;
        if ((v5 & 1) != 0)
          goto LABEL_9;
        goto LABEL_7;
      }
      v11 = CFNumberCreate(v2, kCFNumberSInt32Type, &v40);
      CFDictionarySetValue(Mutable, CFSTR("version"), v11);
      CFRelease(v11);
      v12 = CFUUIDCreateFromUUIDBytes(v2, v41);
      v13 = CFUUIDCreateString(v2, v12);
      CFDictionarySetValue(Mutable, CFSTR("uuid"), v13);
      if (v13)
        CFRelease(v13);
      if (v12)
        CFRelease(v12);
      v14 = CFNumberCreate(v2, kCFNumberSInt32Type, v42);
      CFDictionarySetValue(Mutable, CFSTR("blocksize"), v14);
      if (v14)
        CFRelease(v14);
      v15 = *(_QWORD *)&v42[12];
      v38 = 0;
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(_QWORD *)a1 + 328))(a1, 72, 4, &v43, &v38))
      {
        v16 = bswap32(v38);
        v38 = v16;
        if (v16 <= 0x800)
        {
          v17 = 20 * v16 + 4;
          v18 = (unsigned int *)malloc_type_malloc(v17, 0xFB8CA57FuLL);
          if (v18)
          {
            v19 = v18;
            if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(_QWORD *)a1 + 328))(a1, 72, v17, &v43, v18))
            {
              sub_2128119FC(v19, v17);
              v36 = 0;
              valuePtr = 0;
              v33 = v19;
              theArray = CFArrayCreateMutable(v2, 0, MEMORY[0x24BDBD690]);
              v20 = *v19;
              if ((_DWORD)v20)
              {
                v21 = 0;
                v22 = 0;
                v23 = 0;
                v24 = v19 + 2;
                do
                {
                  v25 = *((_DWORD *)v24 - 1);
                  if (v15 >= *v24)
                    v15 = *v24;
                  if (v25 == 2)
                  {
                    v26 = v24[1];
                    ++v22;
                    v35 = v21;
                    v36 = v22;
                    if (v26 != 564)
                      goto LABEL_62;
                    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 328))(a1))
                      goto LABEL_62;
                    LODWORD(length[0]) = bswap32(length[0]);
                    v27 = vrev32q_s8(v46);
                    v46 = v27;
                    if (LODWORD(length[0]) > 0x20 || v27.i32[3] > 0x200u)
                      goto LABEL_62;
                    v28 = CFDictionaryCreateMutable(v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                    v29 = CFDataCreate(v2, (const UInt8 *)length + 4, LODWORD(length[0]));
                    CFDictionarySetValue(v28, CFSTR("public-key-hash"), v29);
                    CFRelease(v29);
                    CFArrayAppendValue(theArray, v28);
                    CFRelease(v28);
                    v20 = *v33;
                    v21 = v35;
                  }
                  else if (v25 == 1)
                  {
                    valuePtr = ++v21;
                  }
                  ++v23;
                  v24 = (_QWORD *)((char *)v24 + 20);
                }
                while (v23 < v20);
              }
              v30 = CFNumberCreate(v2, kCFNumberSInt32Type, &valuePtr);
              CFDictionarySetValue(Mutable, CFSTR("passphrase-count"), v30);
              if (v30)
                CFRelease(v30);
              v31 = CFNumberCreate(v2, kCFNumberSInt32Type, &v36);
              CFDictionarySetValue(Mutable, CFSTR("private-key-count"), v31);
              if (v31)
                CFRelease(v31);
              if (v36)
                CFDictionarySetValue(Mutable, CFSTR("private-keys"), theArray);
              if (theArray)
                CFRelease(theArray);
              length[0] = (v15 - 76) / 0x14uLL;
              v32 = CFNumberCreate(v2, kCFNumberSInt64Type, length);
              CFDictionarySetValue(Mutable, CFSTR("max-key-count"), v32);
              if (v32)
                CFRelease(v32);
LABEL_62:
              v19 = v33;
            }
            free(v19);
          }
        }
      }
LABEL_64:
      v5 = 1;
      goto LABEL_6;
    }
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
LABEL_7:
  if (Mutable)
  {
    CFRelease(Mutable);
    Mutable = 0;
  }
LABEL_9:
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
  return Mutable;
}

uint64_t sub_2127F5338(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 22;
  result = 0;
  *a2 = *(_QWORD *)(a1 + 200);
  return result;
}

uint64_t sub_2127F5358(uint64_t a1)
{
  int8x16_t v1;
  unsigned int v2;
  int8x16_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  v2 = bswap32(*(_DWORD *)(a1 + 52));
  *(_DWORD *)(a1 + 48) = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 52) = v2;
  v3 = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(int8x16_t *)(a1 + 88) = v3;
  v4 = bswap32(*(_DWORD *)(a1 + 136));
  *(_DWORD *)(a1 + 136) = v4;
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  v5 = bswap32(*(_DWORD *)(a1 + 436));
  *(_DWORD *)(a1 + 436) = v5;
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  v6 = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 736) = v6;
  v7 = bswap32(*(_DWORD *)(a1 + 996));
  *(_DWORD *)(a1 + 996) = v7;
  *(_QWORD *)(a1 + 1256) = bswap64(*(_QWORD *)(a1 + 1256));
  *(int8x8_t *)(a1 + 1264) = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  if (v7 > 0x100 || v6 > 0x100 || v5 > 0x100 || v4 > 0x100 || v3.i32[3] > 0x400u || v2 > 0x20)
    return 107;
  else
    return 0;
}

uint64_t sub_2127F5428(uint64_t a1)
{
  int8x16_t v1;
  unsigned int v2;

  v1 = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  v2 = bswap32(*(_DWORD *)(a1 + 32));
  *(_DWORD *)(a1 + 32) = v2;
  *(_DWORD *)(a1 + 52) = bswap32(*(_DWORD *)(a1 + 52));
  *(int8x16_t *)(a1 + 56) = vrev64q_s8(*(int8x16_t *)(a1 + 56));
  if (v2 > 0x400 || v1.i32[2] > 0x400u)
    return 107;
  else
    return 0;
}

uint64_t sub_2127F5478(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  int v5;
  char v7;

  if ((sub_2127F29C0(theDict, CFSTR("fileencoding-class"), CFSTR("CUDIFEncoding")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("fileencoding-class"), CFSTR("CUDIFEncoding")) > 0)
    return 1000;
  v5 = sub_2127F2A48(theDict, CFSTR("expandable"), 0);
  v4 = 4294966296;
  if (!v5)
  {
    v7 = 0;
    if (sub_2127F5528(a1, &v7))
      return 900;
    else
      return 4294966296;
  }
  return v4;
}

uint64_t sub_2127F5528(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v6 = 0;
  v4 = 0;
  if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 296))(a1, &v6) && v6 >= 512)
  {
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1))
    {
      if (sub_2127F567C(a1, &v7, v6 - 512))
      {
        v4 = 0;
        goto LABEL_14;
      }
      if (v7 == 1802464377 && v8 == 4)
      {
        v4 = 1;
        if (!a2)
        {
LABEL_14:
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
          return v4;
        }
      }
      else
      {
        v4 = 0;
        if (sub_2127F567C(a1, &v7, 0) || v7 != 1802464377 || v8 != 4)
          goto LABEL_14;
        if (!a2)
          goto LABEL_10;
        LOBYTE(v4) = 0;
      }
      *a2 = v4;
LABEL_10:
      v4 = 1;
      goto LABEL_14;
    }
    return 0;
  }
  return v4;
}

uint64_t sub_2127F567C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v8;
  _BYTE __src[512];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
  if (!(_DWORD)v6)
  {
    v8 = 0;
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _BYTE *))(*(_QWORD *)a1 + 328))(a1, a3, 512, &v8, __src);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
    if (!(_DWORD)v6)
    {
      sub_2127F5754((uint64_t)__src);
      memcpy(a2, __src, 0x200uLL);
    }
  }
  return v6;
}

int8x8_t sub_2127F5754(uint64_t a1)
{
  int8x16_t v1;
  int8x8_t result;

  v1 = vrev64q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)a1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)(a1 + 16) = v1;
  *(int8x16_t *)(a1 + 32) = vrev64q_s8(*(int8x16_t *)(a1 + 32));
  *(_QWORD *)(a1 + 48) = bswap64(*(_QWORD *)(a1 + 48));
  *(int8x8_t *)(a1 + 56) = vrev32_s8(*(int8x8_t *)(a1 + 56));
  *(int8x8_t *)(a1 + 80) = vrev32_s8(*(int8x8_t *)(a1 + 80));
  *(int8x16_t *)(a1 + 216) = vrev64q_s8(*(int8x16_t *)(a1 + 216));
  *(int8x16_t *)(a1 + 296) = vrev64q_s8(*(int8x16_t *)(a1 + 296));
  result = vrev32_s8(*(int8x8_t *)(a1 + 352));
  *(int8x8_t *)(a1 + 352) = result;
  *(_DWORD *)(a1 + 488) = bswap32(*(_DWORD *)(a1 + 488));
  *(_QWORD *)(a1 + 492) = bswap64(*(_QWORD *)(a1 + 492));
  return result;
}

uint64_t sub_2127F57D8(uint64_t a1, uint64_t a2, char **a3, _QWORD *a4)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v10;

  if (a4)
    *a4 = 0;
  if (!a3)
    return 22;
  *a3 = 0;
  if (!a1)
    return 22;
  v10 = 0;
  v6 = sub_2127F3728(a2);
  if (!sub_2127F5528(a1, &v10))
    return 110;
  v7 = (char *)operator new();
  sub_2127F58DC((uint64_t)v7);
  v8 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)v7 + 696))(v7, a1);
  if ((_DWORD)v8 || (v8 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)v7 + 80))(v7, v6), (_DWORD)v8))
  {
    DIDiskImageObjectRelease(v7);
    v7 = 0;
  }
  *a3 = v7;
  return v8;
}

void sub_2127F58B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40C363EFF1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F58DC(uint64_t a1)
{
  _QWORD *v2;

  sub_2127F594C(a1);
  *v2 = &off_24CE2B890;
  *(_BYTE *)(a1 + 779) = 0;
  bzero(v2 + 29, 0x220uLL);
  sub_2127F32D4(a1, CFSTR("thread-safe"), (const void *)*MEMORY[0x24BDBD270]);
  return a1;
}

void sub_2127F5934(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127FE1AC(v1);
  _Unwind_Resume(a1);
}

void sub_2127F594C(uint64_t a1)
{
  _QWORD *v1;

  sub_2127F5974(a1);
  *v1 = &off_24CE2B238;
  v1[27] = 0;
  v1[28] = 0;
  v1[26] = 0;
}

void sub_2127F5974(uint64_t a1)
{
  _QWORD *v1;

  sub_2127F2FD0(a1);
  *v1 = &off_24CE2AF50;
  v1[25] = 0;
}

uint64_t sub_2127F5998(uint64_t a1, char *a2)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v4 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)a2 + 80))(a2, 1);
  if ((_DWORD)v4)
    return v4;
  v19 = 0;
  v4 = (*(uint64_t (**)(char *, uint64_t *))(*(_QWORD *)a2 + 296))(a2, &v19);
  if ((_DWORD)v4)
    return v4;
  v4 = (*(uint64_t (**)(char *))(*(_QWORD *)a2 + 272))(a2);
  if ((_DWORD)v4)
    return v4;
  v5 = (_DWORD *)(a1 + 232);
  v6 = sub_2127F567C((uint64_t)a2, (void *)(a1 + 232), v19 - 512);
  if ((_DWORD)v6)
    goto LABEL_23;
  if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
  {
    v7 = 0;
    v8 = 1;
LABEL_12:
    *(_BYTE *)(a1 + 776) = v8;
    *(_BYTE *)(a1 + 777) = v7;
    v10 = *(_QWORD *)(a1 + 256);
    v9 = *(_QWORD *)(a1 + 264);
    *(_QWORD *)(a1 + 752) = v9;
    *(_QWORD *)(a1 + 744) = v10;
    sub_2127F5B90(a1, v9);
    v11 = *(_DWORD *)(a1 + 244);
    *(_BYTE *)(a1 + 778) = v11 & 1;
    if ((v11 & 1) != 0)
    {
      v14 = *(_QWORD *)(a1 + 272);
      v12 = *(_QWORD *)(a1 + 280);
      *(_QWORD *)(a1 + 768) = v12;
      *(_QWORD *)(a1 + 760) = v14;
    }
    else
    {
      v12 = 0;
      *(_OWORD *)(a1 + 760) = 0u;
    }
    sub_2127F5B98(a1, v12);
    if (*(_DWORD *)(a1 + 288) >= 2u)
      v15 = 1684371059;
    else
      v15 = 1684371049;
    sub_2127F5BA0(a1, v15);
    v16 = (*(uint64_t (**)(char *))(*(_QWORD *)a2 + 192))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 520))(a1, v16);
    v17 = (*(uint64_t (**)(char *))(*(_QWORD *)a2 + 208))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 528))(a1, v17);
    sub_2127F5BB8(a1, a2);
    v13 = 0;
    goto LABEL_20;
  }
  v6 = sub_2127F567C((uint64_t)a2, (void *)(a1 + 232), 0);
  if ((_DWORD)v6)
  {
LABEL_23:
    v13 = v6;
  }
  else
  {
    if (*v5 == 1802464377 && *(_DWORD *)(a1 + 236) == 4)
    {
      v8 = 0;
      v7 = 1;
      goto LABEL_12;
    }
    v13 = 107;
  }
LABEL_20:
  (*(void (**)(char *, _QWORD))(*(_QWORD *)a2 + 280))(a2, 0);
  return v13;
}

uint64_t sub_2127F5B90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 216) = a2;
  return result;
}

uint64_t sub_2127F5B98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 224) = a2;
  return result;
}

uint64_t sub_2127F5BA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 208) = a2;
  return result;
}

uint64_t sub_2127F5BA8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t sub_2127F5BB0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

uint64_t sub_2127F5BB8(uint64_t a1, char *a2)
{
  DIDiskImageObjectRetain_0(a2);
  sub_2127F38CC(*(char **)(a1 + 200));
  *(_QWORD *)(a1 + 200) = a2;
  return 0;
}

uint64_t sub_2127F5BF0(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = 1;
  if (a2 < 2)
    goto LABEL_10;
  if (a2 != 3)
  {
    if (a2 != 1003)
      return 22;
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
    v3 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 80))(v5, 3);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
    if (!(_DWORD)v3)
    {
      v3 = 1003;
LABEL_10:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 560))(a1, v3);
      return 0;
    }
  }
  return v3;
}

BOOL sub_2127F5CC0(uint64_t a1)
{
  return *(_DWORD *)(a1 + 208) != 0;
}

uint64_t sub_2127F5CD0(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 208);
  return 0;
}

BOOL sub_2127F5CE0(uint64_t a1)
{
  return *(_DWORD *)(a1 + 212) != 0;
}

__n128 sub_2127F5CF0(uint64_t a1, __n128 *a2)
{
  __n128 result;

  result = *(__n128 *)(a1 + 296);
  *a2 = result;
  return result;
}

uint64_t sub_2127F5D00(uint64_t a1)
{
  return *(unsigned int *)(a1 + 288);
}

uint64_t sub_2127F5D08(uint64_t a1)
{
  return *(unsigned int *)(a1 + 292);
}

uint64_t sub_2127F5D10(uint64_t a1, const __CFDictionary *a2, char **a3, CFTypeRef *a4)
{
  CFMutableStringRef Mutable;
  __CFString *v9;
  uint64_t v10;
  char *v11;
  CFStringRef appendedString;
  char *v14;

  appendedString = 0;
  v14 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a3)
    return 22;
  if (!sub_2127F1434())
    return 119;
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!Mutable)
    return 999;
  v9 = Mutable;
  v10 = sub_2127F5E34(a1, a2, (uint64_t)&v14, (uint64_t)&appendedString);
  if (appendedString)
    CFStringAppend(v9, appendedString);
  v11 = v14;
  if ((_DWORD)v10 && v14)
  {
    DIDiskImageObjectRelease(v14);
    v11 = 0;
    v14 = 0;
  }
  if (appendedString)
  {
    CFRelease(appendedString);
    appendedString = 0;
    v11 = v14;
  }
  *a3 = v11;
  if (a4)
  {
    *a4 = v9;
    if (!CFStringGetLength(v9) && *a4)
    {
      CFRelease(*a4);
      *a4 = 0;
    }
  }
  else
  {
    CFRelease(v9);
  }
  return v10;
}

uint64_t sub_2127F5E34(uint64_t a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  unsigned int v9;
  __CFString **v10;
  unsigned int v11;
  uint64_t (*v12)(uint64_t, const __CFDictionary *);
  int v13;
  __CFString *v14;
  CFTypeID v15;
  uint64_t (*v17)(uint64_t, const __CFDictionary *, uint64_t, uint64_t);
  uint64_t v18;
  void *value;

  if (!off_254B5AB50)
    return 110;
  v8 = 0;
  v9 = 0;
  v10 = &off_254B5ABA8;
  v11 = -1;
  do
  {
    v12 = (uint64_t (*)(uint64_t, const __CFDictionary *))*(v10 - 19);
    if (v12)
    {
      v13 = v12(a1, a2);
      if (v13 > v8)
      {
        v11 = v9;
        v8 = v13;
      }
    }
    ++v9;
    v14 = *v10;
    v10 += 11;
  }
  while (v14);
  if ((v11 & 0x80000000) != 0)
    return 110;
  if (CFStringCompare((CFStringRef)qword_254B5AB08[11 * v11 + 9], CFSTR("CNotSupportedDiskImage"), 0))
  {
    if (a2)
    {
      value = 0;
      if (CFDictionaryGetValueIfPresent(a2, CFSTR("udif-chunk-size"), (const void **)&value))
      {
        v18 = 0;
        v15 = CFGetTypeID(value);
        if (v15 == CFNumberGetTypeID()
          && CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v18)
          && (unint64_t)(v18 - 2097153) < 0xFFFFFFFFFFE001FFLL)
        {
          return 22;
        }
      }
    }
    v17 = (uint64_t (*)(uint64_t, const __CFDictionary *, uint64_t, uint64_t))qword_254B5AB08[11 * v11 + 2];
    if (v17)
      return v17(a1, a2, a3, a4);
    return 110;
  }
  return 123;
}

uint64_t sub_2127F5F9C(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  __CFString **v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  int v9;
  __CFString *v10;

  if (!off_254B5AB50)
    return 0xFFFFFFFFLL;
  v4 = 0;
  v5 = 0;
  v6 = &off_254B5ABA8;
  v7 = 0xFFFFFFFFLL;
  do
  {
    v8 = (uint64_t (*)(uint64_t, uint64_t))*(v6 - 19);
    if (v8)
    {
      v9 = v8(a1, a2);
      if (v9 <= v4)
        v7 = v7;
      else
        v7 = v5;
      if (v9 > v4)
        v4 = v9;
    }
    ++v5;
    v10 = *v6;
    v6 += 11;
  }
  while (v10);
  return v7;
}

uint64_t sub_2127F6024(const void *a1, CFDictionaryRef theDict)
{
  if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CUDIFDiskImage")) > 0
    || (int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRestrictedUDIFDiskImage")) > 0)
  {
    return 9999;
  }
  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CUDIFDiskImage")) & 0x80000000) == 0
    && a1
    && __dynamic_cast(a1, (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2BBB0, 0))
  {
    return 1000;
  }
  return 4294966296;
}

uint64_t sub_2127F60D8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 208))(result);
  return result;
}

uint64_t sub_2127F60F0(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFString *v5;

  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CSparseDiskImage")) & 0x80000000) != 0)
    return 4294967196;
  if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CSparseDiskImage")) > 0)
    return 9999;
  v5 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(a1);
  if (v5 && CFStringCompare(v5, CFSTR("sparseimage"), 1uLL) == kCFCompareEqualTo)
    return 1000;
  else
    return sub_2127F61F4(a1);
}

uint64_t sub_2127F6198(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 200);
  if (v1)
  {
    if (__dynamic_cast(*(const void **)(result + 200), (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2B210, 0))
    {
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 488))(v1);
    }
    else
    {
      return v1;
    }
  }
  return result;
}

uint64_t sub_2127F61F4(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[64];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!a1 || (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1))
    return 0;
  if (sub_2127F6308(a1, (uint64_t)v4, 64))
  {
    v2 = 0;
  }
  else if (sub_212818334((uint64_t)v4))
  {
    v2 = 1000;
  }
  else
  {
    v2 = 0;
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
  return v2;
}

uint64_t sub_2127F62A8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (((*(uint64_t (**)(_QWORD *))(*a1 + 568))(a1) & 1) != 0 || (v2 = a1[25]) == 0)
    v3 = 0;
  else
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v2);
  (*(void (**)(_QWORD *))(*a1 + 576))(a1);
  return v3;
}

uint64_t sub_2127F6308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v7;

  v7 = 0;
  v5 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 328))(a1, 0, a3, &v7, a2);
  if (!(_DWORD)v5)
    sub_2127F641C(a2, (unint64_t)(a3 + 0x3FFFFFFC0) >> 2);
  return v5;
}

uint64_t sub_2127F6374(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v8;
  uint64_t v12;

  if (!a5)
    return 22;
  v8 = a1[94];
  if ((uint64_t)v8 < a2 || a3 + a2 > v8)
    return 29;
  v12 = (*(uint64_t (**)(_QWORD *))(*a1 + 496))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 328))(v12, a1[93] + a2, a3, a4, a5);
}

uint64_t sub_2127F6414(uint64_t a1)
{
  return *(_QWORD *)(a1 + 200);
}

uint64_t sub_2127F641C(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unsigned int *v3;

  *(int8x16_t *)result = vrev32q_s8(*(int8x16_t *)result);
  *(_DWORD *)(result + 16) = bswap32(*(_DWORD *)(result + 16));
  *(int8x16_t *)(result + 20) = vrev64q_s8(*(int8x16_t *)(result + 20));
  if (a2)
  {
    v2 = a2;
    v3 = (unsigned int *)(result + 64);
    do
    {
      *v3 = bswap32(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_2127F6464(_QWORD *a1)
{
  uint64_t v2;

  (*(void (**)(_QWORD *))(*a1 + 584))(a1);
  if (((*(uint64_t (**)(_QWORD *))(*a1 + 568))(a1) & 1) == 0)
  {
    v2 = a1[25];
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 280))(v2, 0);
  }
  return 0;
}

uint64_t sub_2127F64BC(const void *a1, CFDictionaryRef theDict)
{
  uint64_t result;
  int v5;
  unsigned int v6;

  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRawDiskImage")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRawDiskImage")) > 0)
    return 1000;
  result = sub_2127F6590((uint64_t)a1);
  if ((result & 0x80000000) == 0)
  {
    v6 = 0;
    if (a1
      && __dynamic_cast(a1, (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2BBB0, 0))
    {
      return 4294966296;
    }
    v5 = sub_212807634((uint64_t)a1, &v6);
    result = v6;
    if (!v5 && (v6 & 0x80000000) == 0)
    {
      sub_212807700((uint64_t)a1, &v6);
      return v6;
    }
  }
  return result;
}

uint64_t sub_2127F6590(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  uint64_t v4;
  __CFDictionary *v6;
  const __CFArray *Value;
  const __CFArray *v8;
  CFIndex Count;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  char *v14;
  uint64_t v15;
  uint64_t valuePtr;
  uint64_t v17;

  valuePtr = 0;
  v17 = 0;
  v14 = 0;
  v15 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 296))(a1, &v17))
    goto LABEL_2;
  v4 = 4294967196;
  if (v17 && (v17 & 0x1FF) == 0)
  {
    CFDictionarySetValue(Mutable, CFSTR("writeable"), (const void *)*MEMORY[0x24BDBD268]);
    if (sub_212807018(a1, (uint64_t)Mutable, &v14, 0))
    {
      v3 = 0;
    }
    else
    {
      v6 = sub_21280275C(v14, 0);
      v3 = v6;
      if (v6)
      {
        Value = (const __CFArray *)CFDictionaryGetValue(v6, CFSTR("partitions"));
        if (Value)
        {
          v8 = Value;
          Count = CFArrayGetCount(Value);
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, Count - 1);
          if (!ValueAtIndex
            || (v11 = ValueAtIndex,
                (v12 = (const __CFNumber *)sub_2127FE630(ValueAtIndex, CFSTR("partition-start"))) == 0)
            || !CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr)
            || (v13 = (const __CFNumber *)sub_2127FE630(v11, CFSTR("partition-length"))) == 0)
          {
LABEL_2:
            v4 = 4294967196;
            goto LABEL_3;
          }
          v4 = 4294967196;
          if (CFNumberGetValue(v13, kCFNumberSInt64Type, &v15))
          {
            if (v17 >= (v15 + valuePtr) << 9)
              v4 = 0;
            else
              v4 = 4294967196;
          }
        }
      }
    }
  }
LABEL_3:
  if (v14)
  {
    DIDiskImageObjectRelease(v14);
    v14 = 0;
  }
  if (v3)
    CFRelease(v3);
  if (Mutable)
    CFRelease(Mutable);
  return v4;
}

uint64_t sub_2127F672C(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 216);
  return 0;
}

uint64_t sub_2127F6740(uint64_t a1, CFDictionaryRef theDict, uint64_t *a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v11;
  _QWORD v12[7];
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v7 = 22;
  if (a1 && a3)
  {
    if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CWOUDIFDiskImage")) > 0)
      return 78;
    if (((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRestrictedUDIFDiskImage")) > 0
       || sub_2127F2A48(theDict, CFSTR("restricted-only"), 0))
      && ((*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)a1 + 704))(a1, v12), v13 >= 2))
    {
      v8 = operator new();
      sub_2127F6954(v8);
      *(_QWORD *)v8 = &off_24CE2AC18;
    }
    else
    {
      v8 = operator new();
      sub_2127F6954(v8);
    }
    if (theDict)
    {
      v11 = 0;
      v12[0] = -1;
      if (CFDictionaryGetValueIfPresent(theDict, CFSTR("udif-chunk-size"), (const void **)&v11))
      {
        if (!sub_212806A98(v11, kCFNumberSInt64Type, v12))
        {
          v7 = 999;
LABEL_25:
          sub_2127F38CC((char *)v8);
          v8 = 0;
LABEL_26:
          *a3 = v8;
          return v7;
        }
        v9 = v12[0];
        if (v12[0] < 0)
          v9 = 2048;
      }
      else
      {
        v9 = 2048;
      }
      *(_QWORD *)(v8 + 920) = v9;
    }
    v7 = (*(uint64_t (**)(uint64_t, uint64_t, CFDictionaryRef))(*(_QWORD *)v8 + 568))(v8, a1, theDict);
    if (!(_DWORD)v7)
      goto LABEL_26;
    goto LABEL_25;
  }
  return v7;
}

void sub_2127F6924(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F6954(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2127F6A04(a1);
  *(_QWORD *)v2 = &off_24CE2A988;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 160), 0);
  (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)a1 + 32))(a1, CFSTR("thread-safe"), *MEMORY[0x24BDBD270]);
  bzero((void *)(a1 + 360), 0x22EuLL);
  *(_QWORD *)(a1 + 920) = -1;
  *(_OWORD *)(a1 + 928) = 0u;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 944), 0);
  *(_DWORD *)(a1 + 1028) = 0;
  *(_BYTE *)(a1 + 1032) = 0;
  *(_OWORD *)(a1 + 1008) = 0u;
  *(_BYTE *)(a1 + 1024) = 0;
  return a1;
}

void sub_2127F69EC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F6A04(uint64_t a1)
{
  uint64_t result;

  result = sub_2127F3014(a1);
  *(_QWORD *)result = off_24CE29EA8;
  *(_QWORD *)(result + 136) = 0;
  *(_DWORD *)(result + 144) = 0;
  *(_BYTE *)(result + 148) = 0;
  *(_QWORD *)(result + 152) = 0;
  *(_QWORD *)(result + 112) = 0;
  *(_QWORD *)(result + 120) = 0;
  *(_QWORD *)(result + 104) = 0;
  *(_BYTE *)(result + 128) = 0;
  return result;
}

BOOL sub_2127F6A40(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  CFTypeID v7;
  int Value;
  int v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeID v12;
  uint64_t v13;
  unsigned int valuePtr;

  if (CFStringCompare(theString1, CFSTR("cache enabled"), 0))
    return sub_2127F6BAC(a1, theString1, a3);
  valuePtr = 0;
  if (!a3)
    goto LABEL_14;
  v7 = CFGetTypeID(a3);
  if (v7 != CFBooleanGetTypeID())
  {
    v12 = CFGetTypeID(a3);
    if (v12 != CFNumberGetTypeID())
      return 0;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberIntType, &valuePtr);
    if (valuePtr)
      goto LABEL_9;
LABEL_14:
    v13 = *(_QWORD *)(a1 + 368);
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    *(_QWORD *)(a1 + 368) = 0;
    return sub_2127F32D4(a1, theString1, a3);
  }
  Value = CFBooleanGetValue((CFBooleanRef)a3);
  if (Value)
    v9 = 5;
  else
    v9 = 0;
  valuePtr = v9;
  if (!Value)
    goto LABEL_14;
LABEL_9:
  v10 = *(_QWORD *)(a1 + 368);
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
  v11 = operator new();
  sub_2127FD5FC(v11, valuePtr);
  *(_QWORD *)(a1 + 368) = v11;
  return sub_2127F32D4(a1, theString1, a3);
}

void sub_2127F6B88(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x1081C406A7D350BLL);
  _Unwind_Resume(a1);
}

BOOL sub_2127F6BAC(uint64_t a1, __CFString *theString1, const __CFString *a3)
{
  CFTypeID v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  CFDataRef ExternalRepresentation;
  CFDataRef v16;
  _BOOL8 v17;

  if (!theString1 || CFStringCompare(theString1, CFSTR("cache enabled"), 0) == kCFCompareEqualTo)
    return 0;
  if (CFStringCompare(theString1, CFSTR("on IO thread"), 0) == kCFCompareEqualTo)
  {
    if (a3)
    {
      v6 = CFGetTypeID(a3);
      if (v6 != CFBooleanGetTypeID())
        return 0;
      v7 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
    }
    else
    {
      v7 = 0;
    }
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
    if (!v8 || v7 != (*(unsigned int (**)(uint64_t, _BOOL8))(*(_QWORD *)v8 + 664))(v8, v7))
      return 0;
  }
  if (!CFEqual(theString1, CFSTR("di-valid-cached-checksum")))
    return sub_2127F32D4(a1, theString1, a3);
  v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (!v9)
    return 0;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 488))(v9);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = (*(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)v10 + 128))(v10, CFSTR("com.apple.diskimages.recentcksum"), 0);
  if (!a3 || !sub_2127F14C8(a3, 0))
    return v12 == 0;
  v13 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 544))(a1);
  if (!v13)
    return 0;
  v14 = v13;
  ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], v13, 0x8000100u, 0);
  if (!ExternalRepresentation)
  {
    CFRelease(v14);
    return 0;
  }
  v16 = ExternalRepresentation;
  v17 = (*(unsigned int (**)(uint64_t, const __CFString *, CFDataRef))(*(_QWORD *)v11 + 128))(v11, CFSTR("com.apple.diskimages.recentcksum"), ExternalRepresentation) == 0;
  CFRelease(v14);
  CFRelease(v16);
  return v17;
}

uint64_t sub_2127F6D88(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t sub_2127F6D90(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 72))(result);
  return result;
}

uint64_t sub_2127F6DA8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 148) = a2;
  return result;
}

void *sub_2127F6DB0(uint64_t a1, void *__dst)
{
  return memcpy(__dst, (const void *)(a1 + 232), 0x200uLL);
}

uint64_t sub_2127F6DC4(uint64_t *a1, char **a2)
{
  int v4;
  uint64_t v5;
  CFIndex Code;
  char *v7;
  uint64_t v9;
  UInt8 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFAllocator *v15;
  const __CFData *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  CFTypeID v19;
  __CFDictionary *Value;
  __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFPropertyListFormat format;
  uint64_t v26;
  CFErrorRef error;
  char *v28;

  v28 = 0;
  if (a2)
  {
    *a2 = 0;
    v4 = (*(uint64_t (**)(uint64_t *))(*a1 + 616))(a1);
    v5 = *a1;
    if (v4)
    {
      Code = 0;
      v28 = (char *)(*(uint64_t (**)(uint64_t *))(v5 + 640))(a1);
      if (v28)
      {
LABEL_4:
        (*(void (**)(uint64_t *))(*a1 + 624))(a1);
        v7 = v28;
LABEL_10:
        *a2 = v7;
        return Code;
      }
LABEL_9:
      v7 = 0;
      goto LABEL_10;
    }
    if (((*(uint64_t (**)(uint64_t *))(v5 + 592))(a1) & 1) != 0)
    {
      Code = 4294967242;
      goto LABEL_8;
    }
    if (!*((_BYTE *)a1 + 778))
    {
      v24 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      Code = (*(uint64_t (**)(uint64_t, char **))(*(_QWORD *)v24 + 344))(v24, &v28);
      if (!(_DWORD)Code)
        (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v28);
      goto LABEL_8;
    }
    v9 = a1[57];
    if (!v9)
    {
      if (!a1[95] || !a1[96])
      {
        Code = 4294967257;
        goto LABEL_8;
      }
      goto LABEL_52;
    }
    v26 = 0;
    error = 0;
    v10 = (UInt8 *)malloc_type_malloc(v9 + 1, 0x8856F354uLL);
    if (!v10)
    {
      v16 = 0;
      v18 = 0;
      v21 = 0;
      Code = *__error();
      goto LABEL_36;
    }
    v11 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 272))(v11);
    if ((_DWORD)v12)
    {
      Code = v12;
    }
    else
    {
      v13 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      Code = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, UInt8 *))(*(_QWORD *)v13 + 328))(v13, a1[56], a1[57], &v26, v10);
      v14 = (*(uint64_t (**)(uint64_t *))(*a1 + 496))(a1);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v14 + 280))(v14, 0);
      if (!(_DWORD)Code)
      {
        v10[v26] = 0;
        v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v16 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, v26 + 1);
        if (!v16)
        {
          v18 = 0;
          v21 = 0;
          goto LABEL_57;
        }
        format = 0;
        v17 = (const __CFDictionary *)CFPropertyListCreateWithData(v15, v16, 0, &format, &error);
        if (v17)
        {
          v18 = v17;
          *((_BYTE *)a1 + 780) = format == kCFPropertyListBinaryFormat_v1_0;
          v19 = CFGetTypeID(v17);
          if (v19 != CFDictionaryGetTypeID())
          {
            v21 = 0;
            Code = 107;
            goto LABEL_36;
          }
          Value = (__CFDictionary *)CFDictionaryGetValue(v18, CFSTR("resource-fork"));
          v21 = Value;
          if (Value)
          {
            CFRetain(Value);
            v22 = sub_2127F7174(v21, 1, (uint64_t *)&v28);
            if ((_DWORD)v22)
            {
              Code = v22;
            }
            else
            {
              v23 = (*(uint64_t (**)(char *))(*(_QWORD *)v28 + 48))(v28);
              Code = v23;
              if ((_DWORD)v23 && v28)
              {
                DIDiskImageObjectRelease(v28);
                v28 = 0;
              }
              else if (!(_DWORD)v23)
              {
                (*(void (**)(uint64_t *, char *))(*a1 + 648))(a1, v28);
                sub_2127F38CC(v28);
                *((_BYTE *)a1 + 779) = 1;
              }
            }
LABEL_36:
            if (error)
            {
              CFRelease(error);
              error = 0;
            }
            if (!v10)
            {
LABEL_42:
              if (v16)
                CFRelease(v16);
              if (v18)
                CFRelease(v18);
              if (v21)
                CFRelease(v21);
              if ((_DWORD)Code && a1[95] && a1[96])
              {
                fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CUDIFEncoding::openResourceFile XML failed (contain non-XML embedded rsrc fork) - %d\n", Code);
LABEL_52:
                Code = 78;
              }
LABEL_8:
              if (v28)
                goto LABEL_4;
              goto LABEL_9;
            }
LABEL_41:
            free(v10);
            goto LABEL_42;
          }
LABEL_57:
          Code = 4294962336;
          goto LABEL_36;
        }
        if (!error)
        {
          v18 = 0;
          v21 = 0;
          Code = 4294962336;
          goto LABEL_41;
        }
        Code = CFErrorGetCode(error);
LABEL_32:
        v18 = 0;
        v21 = 0;
        goto LABEL_36;
      }
    }
    v16 = 0;
    goto LABEL_32;
  }
  return 22;
}

BOOL sub_2127F7164(uint64_t a1)
{
  return *(_DWORD *)(a1 + 172) > 0;
}

uint64_t sub_2127F7174(__CFDictionary *a1, int a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t result;

  if (!a3)
    return 22;
  *a3 = 0;
  v6 = operator new();
  sub_2127F7204(v6, a1, a2);
  result = 0;
  *a3 = v6;
  return result;
}

void sub_2127F71E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F7204(uint64_t a1, CFMutableDictionaryRef Mutable, int a3)
{
  _QWORD *v6;

  v6 = sub_2127F72C4(a1);
  *v6 = &off_24CE2BD50;
  v6[13] = 0;
  *((_BYTE *)v6 + 114) = a3 == 3;
  *((_WORD *)v6 + 56) = 0;
  *((_BYTE *)v6 + 115) = 1;
  if (Mutable)
    CFRetain(Mutable);
  else
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  sub_2127F72E4(a1, Mutable);
  CFRelease(Mutable);
  return a1;
}

void sub_2127F72AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F72C4(uint64_t a1)
{
  _QWORD *result;

  result = (_QWORD *)sub_2127F3014(a1);
  *result = off_24CE2BBD8;
  return result;
}

void sub_2127F72E4(uint64_t a1, CFPropertyListRef propertyList)
{
  const void *v4;

  if (*(_QWORD *)(a1 + 104))
  {
    sub_2127F8A94(a1);
    v4 = *(const void **)(a1 + 104);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 104) = 0;
    }
  }
  if (propertyList)
    *(_QWORD *)(a1 + 104) = CFPropertyListCreateDeepCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], propertyList, 2uLL);
}

uint64_t sub_2127F7344(uint64_t a1)
{
  sub_2127F736C(a1);
  *(_WORD *)(a1 + 112) = 0;
  return 0;
}

void sub_2127F736C(uint64_t a1)
{
  const __CFDictionary *v1;
  size_t Count;
  int64_t v3;
  const void **v4;
  const void **v5;
  const void **v6;
  uint64_t i;
  const __CFArray *v8;
  CFIndex v9;
  CFIndex v10;
  CFIndex j;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v13;
  int v14;
  void *v16;
  int v17;

  v1 = *(const __CFDictionary **)(a1 + 104);
  if (v1)
  {
    Count = CFDictionaryGetCount(v1);
    if (Count)
    {
      v3 = Count;
      v4 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      if (v4)
      {
        v5 = v4;
        v6 = (const void **)malloc_type_calloc(v3, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v5, v6);
        if (v3 >= 1)
        {
          for (i = 0; i != v3; ++i)
          {
            v8 = (const __CFArray *)v6[i];
            if (v8)
            {
              v9 = CFArrayGetCount((CFArrayRef)v6[i]);
              if (v9 >= 1)
              {
                v10 = v9;
                for (j = 0; j != v10; ++j)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, j);
                  if (ValueAtIndex)
                  {
                    v13 = ValueAtIndex;
                    v17 = 0;
                    if (sub_2127F74E4(ValueAtIndex, CFSTR("Attributes"), &v17))
                    {
                      if (sub_2127F74E4(v13, CFSTR("ID"), (_WORD *)&v17 + 1) && (v17 & 4) != 0)
                      {
                        v16 = 0;
                        v14 = sub_2127F820C((const __CFString *)v5[i]);
                        sub_2127F7C8C(a1, v14, v13, &v16);
                      }
                    }
                  }
                }
              }
            }
          }
        }
        free(v5);
        if (v6)
          free(v6);
      }
    }
  }
}

uint64_t sub_2127F74E4(const __CFDictionary *a1, const void *a2, _WORD *a3)
{
  const __CFString *Value;
  const __CFString *v5;
  CFTypeID v6;
  const char *v7;
  char *v8;
  __int16 v9;
  uint64_t v10;
  CFTypeID v11;
  int v12;
  __int16 v13;
  char *v15;
  __int16 valuePtr;

  valuePtr = 0;
  if (!a1 || !a3)
  {
    if (!a3)
      return 0;
    goto LABEL_17;
  }
  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!Value)
    goto LABEL_13;
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 != CFStringGetTypeID())
  {
    v11 = CFGetTypeID(v5);
    if (v11 == CFNumberGetTypeID())
    {
      v12 = CFNumberGetValue((CFNumberRef)v5, kCFNumberSInt16Type, &valuePtr);
      v13 = valuePtr;
      if (v12)
      {
        *a3 = valuePtr;
        return 1;
      }
LABEL_14:
      v10 = 0;
      *a3 = v13;
      return v10;
    }
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v15 = 0;
  v7 = (const char *)sub_2127F2B30(v5, 0x600u);
  if (!v7)
  {
LABEL_17:
    v10 = 0;
    *a3 = 0;
    return v10;
  }
  v8 = (char *)v7;
  if (!*v7)
  {
    v9 = 0;
    goto LABEL_20;
  }
  v9 = strtol(v7, &v15, 0);
  if (*v15)
  {
LABEL_20:
    v10 = 0;
    goto LABEL_9;
  }
  v10 = 1;
LABEL_9:
  *a3 = v9;
  free(v8);
  return v10;
}

char *sub_2127F75FC(uint64_t a1, char *a2)
{
  char *result;

  if (a2)
    DIDiskImageObjectRetain_0(a2);
  result = *(char **)(a1 + 184);
  if (result)
    result = (char *)DIDiskImageObjectRelease(result);
  *(_QWORD *)(a1 + 184) = a2;
  return result;
}

uint64_t sub_2127F7638(uint64_t result)
{
  ++*(_DWORD *)(result + 176);
  return result;
}

uint64_t sub_2127F7648(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  void *v8;
  const __CFAllocator *v9;
  CFMutableArrayRef Mutable;
  uint64_t v11;
  __int16 i;
  CFStringRef v14;
  const void *v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  const __CFString *v19;
  uint64_t *v20;
  int v21;
  unsigned __int8 pStr[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v20 = 0;
  result = sub_2127F796C(a1, a2, (__int16 *)&v21 + 1, &v21);
  if (!(_DWORD)result)
  {
    v5 = v21;
    v6 = HIWORD(v21);
    v7 = v21 - HIWORD(v21) + 1;
    *(_WORD *)(a1 + 912) = v7;
    *(_WORD *)(a1 + 914) = v6;
    *(_WORD *)(a1 + 916) = v5;
    v8 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    *(_QWORD *)(a1 + 928) = v8;
    if (v8
      && (bzero(v8, 8 * *(__int16 *)(a1 + 912)),
          v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240],
          Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]),
          (*(_QWORD *)(a1 + 936) = Mutable) != 0))
    {
      if (*(__int16 *)(a1 + 912) >= 1)
      {
        v11 = 0;
        for (i = HIWORD(v21); ; ++i)
        {
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          *(_OWORD *)pStr = 0u;
          v23 = 0u;
          result = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t **))(*(_QWORD *)a2 + 120))(a2, 1651272568, i, &v20);
          if ((_DWORD)result)
            return result;
          if (*(_DWORD *)*v20 != 1752394093 || *(_DWORD *)(*v20 + 4) != 0x1000000)
            return 107;
          result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 320))(a2);
          if ((_DWORD)result)
            return result;
          result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)a2 + 248))(a2, v20);
          if ((_DWORD)result)
            return result;
          *(_QWORD *)(*(_QWORD *)(a1 + 928) + 8 * v11) = v20;
          v14 = CFStringCreateWithPascalString(v9, pStr, 0);
          if (v14)
          {
            v15 = v14;
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v14);
          }
          else
          {
            v18 = DIGetBundleRef();
            if (i == -1)
            {
              v15 = sub_21281FFEC(v18, (int)CFSTR("Driver Descriptor Map"), CFSTR("Driver Descriptor Map"));
            }
            else
            {
              v19 = (const __CFString *)sub_21281FFEC(v18, (int)CFSTR("partition %d"), CFSTR("partition %d"));
              v15 = CFStringCreateWithFormat(v9, 0, v19, i);
              CFRelease(v19);
            }
            CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v15);
            if (!v15)
              goto LABEL_20;
          }
          CFRelease(v15);
LABEL_20:
          nullsub_4(v20);
          v16 = *v20;
          v17 = sub_212820120((uint64_t)v20);
          if (sub_2127F8360(v16, v17))
            return 107;
          if (++v11 >= *(__int16 *)(a1 + 912))
          {
            if (*(_WORD *)(a1 + 912) != 3)
              return 0;
            if (*(_QWORD *)(**(_QWORD **)(*(_QWORD *)(a1 + 928) + 8) + 16)
               + *(_QWORD *)(**(_QWORD **)(*(_QWORD *)(a1 + 928) + 8) + 8) <= *(_QWORD *)(**(_QWORD **)(*(_QWORD *)(a1 + 928) + 16)
                                                                                            + 8))
              return 0;
            else
              return 107;
          }
        }
      }
      return 0;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

uint64_t sub_2127F796C(uint64_t a1, uint64_t a2, __int16 *a3, _WORD *a4)
{
  uint64_t result;
  __int16 v8;
  int v9;
  unsigned int v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;

  v14 = 0;
  if (a3 && a4)
  {
    if (a2)
    {
      result = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(_QWORD *)a2 + 96))(a2, 1651272568, &v14);
      if ((_DWORD)result)
      {
        v8 = 0;
        v13 = 0;
      }
      else
      {
        v8 = v14;
        if (v14)
        {
          v9 = *(_DWORD *)(a1 + 880);
          v8 = v14 - 2;
          if (v9)
            v10 = 107;
          else
            v10 = 0;
          if (v9)
            v11 = 0;
          else
            v11 = v14 - 1;
          if (v9 == 1)
          {
            v10 = 0;
            v12 = -1;
          }
          else
          {
            v8 = v11;
            v12 = 0;
          }
          if (v9 == 2)
            result = 0;
          else
            result = v10;
          if (v9 == 2)
          {
            v8 = v14 - 1;
            v13 = 0;
          }
          else
          {
            v13 = v12;
          }
        }
        else
        {
          v13 = 0;
          result = 107;
        }
      }
    }
    else
    {
      v8 = 0;
      v13 = 0;
      result = 999;
    }
    goto LABEL_21;
  }
  v8 = 0;
  v13 = 0;
  result = 22;
  if (a3)
LABEL_21:
    *a3 = v13;
  if (a4)
    *a4 = v8;
  return result;
}

uint64_t sub_2127F7A64(uint64_t a1, unsigned int a2, _WORD *a3)
{
  uint64_t v4;
  uint64_t result;

  if (!a3)
    return 4294967246;
  v4 = *(_QWORD *)(a1 + 104);
  if (v4)
  {
    result = (uint64_t)sub_2127F7ABC(a1, a2);
    if (result)
    {
      LOWORD(v4) = CFArrayGetCount((CFArrayRef)result);
      result = 0;
    }
    else
    {
      LOWORD(v4) = 0;
    }
  }
  else
  {
    result = 4294967097;
  }
  *a3 = v4;
  return result;
}

const void *sub_2127F7ABC(uint64_t a1, unsigned int a2)
{
  CFStringRef v3;
  CFStringRef v4;
  const void *Value;

  if (!*(_QWORD *)(a1 + 104))
    return 0;
  v3 = sub_2127F7B14(a2);
  if (!v3)
    return 0;
  v4 = v3;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v3);
  CFRelease(v4);
  return Value;
}

CFStringRef sub_2127F7B14(unsigned int a1)
{
  UInt8 bytes[4];

  *(_DWORD *)bytes = bswap32(a1);
  return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, 4, 0, 0);
}

uint64_t sub_2127F7B54(uint64_t a1, unsigned int a2, __int16 a3, _QWORD *a4)
{
  void *v6;
  const __CFDictionary *v8;
  uint64_t result;
  void *v10;

  v10 = 0;
  if (!a4)
    return 4294967246;
  v6 = *(void **)(a1 + 104);
  if (v6)
  {
    v8 = sub_2127F7BDC(a1, a2, a3);
    if (v8)
    {
      result = sub_2127F7C8C(a1, a2, v8, &v10);
      v6 = v10;
    }
    else
    {
      v6 = 0;
      result = 4294967104;
    }
  }
  else
  {
    result = 4294967097;
  }
  *a4 = v6;
  return result;
}

const __CFDictionary *sub_2127F7BDC(uint64_t a1, unsigned int a2, __int16 a3)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  __int16 v12;

  v12 = 0;
  if (!*(_QWORD *)(a1 + 104))
    return 0;
  v4 = (const __CFArray *)sub_2127F7ABC(a1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  Count = CFArrayGetCount(v4);
  if (Count < 1)
    return 0;
  v7 = Count;
  v8 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
    if (ValueAtIndex)
    {
      v10 = ValueAtIndex;
      if (sub_2127F74E4(ValueAtIndex, CFSTR("ID"), &v12))
      {
        if (v12 == a3)
          break;
      }
    }
    if (v7 == ++v8)
      return 0;
  }
  return v10;
}

uint64_t sub_2127F7C8C(uint64_t a1, int a2, CFDictionaryRef theDict, void **a4)
{
  uint64_t v7;
  void **v8;
  const __CFData *Value;
  const __CFData *v10;
  CFTypeID v11;
  CFIndex Length;
  uint64_t v13;
  uint64_t v14;
  __int16 v16;
  __int16 v17;
  void *v18;
  CFRange v19;

  v18 = 0;
  if (!theDict || !a4)
  {
    v14 = 4294967246;
    if (!a4)
      return v14;
    goto LABEL_15;
  }
  if (sub_2127F7E88(a1, theDict, &v18))
  {
    if (*(_QWORD *)v18)
      goto LABEL_14;
    goto LABEL_9;
  }
  v18 = sub_212820068();
  v7 = sub_21281FFF4();
  v8 = (void **)v18;
  if ((_DWORD)v7)
  {
    v14 = v7;
LABEL_24:
    if ((_DWORD)v14 && v8)
    {
      sub_212820098(v8);
      v18 = 0;
    }
    goto LABEL_15;
  }
  if (!v18)
  {
    v14 = 4294967188;
    goto LABEL_15;
  }
  if ((sub_2127F7F30(0, theDict, (uint64_t)v18) & 1) == 0)
  {
    v14 = 4294962336;
    v8 = (void **)v18;
    goto LABEL_24;
  }
LABEL_9:
  if (*(_BYTE *)(a1 + 115))
  {
    Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("Data"));
    if (!Value || (v10 = Value, v11 = CFGetTypeID(Value), v11 != CFDataGetTypeID()))
    {
      v14 = 4294967097;
      goto LABEL_15;
    }
    Length = CFDataGetLength(v10);
    sub_212820128(v18, Length);
    v13 = sub_21281FFF4();
    if ((_DWORD)v13)
    {
      v14 = v13;
      goto LABEL_15;
    }
    v19.location = 0;
    v19.length = Length;
    CFDataGetBytes(v10, v19, *(UInt8 **)v18);
    v17 = 0;
    sub_21282012C();
    nullsub_4(v18);
    sub_2127F74E4(theDict, CFSTR("ID"), &v17);
    sub_21281FFF4();
    nullsub_4(v18);
    v16 = 0;
    sub_21282012C();
    sub_2127F74E4(theDict, CFSTR("Attributes"), &v16);
    nullsub_4(v18);
  }
LABEL_14:
  v14 = 0;
LABEL_15:
  *a4 = v18;
  return v14;
}

const __CFNumber *sub_2127F7E88(int a1, CFDictionaryRef theDict, _QWORD *a3)
{
  const __CFNumber *result;
  const __CFNumber *v5;
  CFTypeID v6;
  int Value;
  uint64_t v8;
  BOOL v9;
  uint64_t valuePtr;

  valuePtr = 0;
  if (theDict && a3)
  {
    result = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Handle"));
    if (result)
    {
      v5 = result;
      v6 = CFGetTypeID(result);
      if (v6 == CFNumberGetTypeID())
      {
        Value = CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
        v8 = valuePtr;
        if (Value)
          v9 = valuePtr == 0;
        else
          v9 = 1;
        result = (const __CFNumber *)!v9;
      }
      else
      {
        v8 = 0;
        result = 0;
      }
      goto LABEL_11;
    }
LABEL_14:
    v8 = 0;
LABEL_11:
    *a3 = v8;
    return result;
  }
  result = 0;
  if (a3)
    goto LABEL_14;
  return result;
}

uint64_t sub_2127F7F30(int a1, CFMutableDictionaryRef theDict, uint64_t a3)
{
  uint64_t result;
  const void *v5;
  uint64_t valuePtr;

  valuePtr = a3;
  if (!theDict)
    return 0;
  if (a3)
  {
    result = (uint64_t)CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
    if (!result)
      return result;
    v5 = (const void *)result;
    CFDictionarySetValue(theDict, CFSTR("Handle"), (const void *)result);
    CFRelease(v5);
  }
  else
  {
    CFDictionaryRemoveValue(theDict, CFSTR("Handle"));
  }
  return 1;
}

uint64_t sub_2127F7FBC(uint64_t a1, uint64_t a2, _WORD *a3, _DWORD *a4, unsigned __int8 *a5, _QWORD *a6)
{
  uint64_t result;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const void *v13;
  CFTypeID TypeID;

  result = 4294967246;
  if (a2 && a3 && a4 && a5 && a6)
  {
    if (!*(_QWORD *)(a1 + 104))
      return 4294967097;
    v11 = sub_2127F8098(a1, a2, a4);
    if (!v11)
      return 4294967104;
    v12 = v11;
    if (!sub_2127F74E4(v11, CFSTR("ID"), a3) || !sub_2127F8244((_BOOL8)v12, a5))
      return 4294967097;
    *a6 = 0;
    result = (uint64_t)CFDictionaryGetValue(v12, CFSTR("CFName"));
    if (result)
    {
      v13 = (const void *)result;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v13))
      {
        result = 0;
        *a6 = v13;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *sub_2127F8098(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const __CFDictionary *v6;
  size_t Count;
  int64_t v8;
  const void **v9;
  const void **v10;
  const void **v11;
  uint64_t v12;
  const __CFArray *v13;
  CFIndex v14;
  CFIndex v15;
  CFIndex v16;
  const __CFDictionary *ValueAtIndex;
  unsigned int v18;
  int v20;
  uint64_t v21;

  if (a3)
    *a3 = 0;
  v6 = *(const __CFDictionary **)(a1 + 104);
  if (!v6)
    return 0;
  Count = CFDictionaryGetCount(v6);
  if (!Count)
    return 0;
  v8 = Count;
  v9 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v9)
    return 0;
  v10 = v9;
  v11 = (const void **)malloc_type_calloc(v8, 8uLL, 0x6004044C4A2DFuLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v10, v11);
  if (v8 < 1)
  {
LABEL_17:
    ValueAtIndex = 0;
LABEL_18:
    if (!v11)
      goto LABEL_20;
  }
  else
  {
    v12 = 0;
    while (1)
    {
      v20 = sub_2127F820C((const __CFString *)v10[v12]);
      v13 = (const __CFArray *)v11[v12];
      v14 = CFArrayGetCount(v13);
      if (v14 >= 1)
        break;
LABEL_16:
      if (++v12 == v8)
        goto LABEL_17;
    }
    v15 = v14;
    v16 = 0;
    while (1)
    {
      v21 = 0;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16);
      v18 = sub_2127F7E88((int)ValueAtIndex, ValueAtIndex, &v21) ^ 1;
      if (v21 != a2)
        LOBYTE(v18) = 1;
      if (a3 && (v18 & 1) == 0)
        break;
      if ((v18 & 1) == 0)
        goto LABEL_18;
      if (v15 == ++v16)
        goto LABEL_16;
    }
    *a3 = v20;
    if (!v11)
      goto LABEL_20;
  }
  free(v11);
LABEL_20:
  free(v10);
  return ValueAtIndex;
}

uint64_t sub_2127F820C(const __CFString *a1)
{
  unsigned int *v1;
  unsigned int v2;

  v1 = (unsigned int *)sub_2127F2B30(a1, 0);
  if (v1)
  {
    v2 = *v1;
    free(v1);
  }
  else
  {
    v2 = 0;
  }
  return bswap32(v2);
}

BOOL sub_2127F8244(_BOOL8 result, unsigned __int8 *a2)
{
  const __CFString *Value;
  const __CFString *v4;
  CFTypeID v5;

  if (!a2)
    return 0;
  *a2 = 0;
  if (result)
  {
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("Name"));
    if (Value)
    {
      v4 = Value;
      v5 = CFGetTypeID(Value);
      return v5 == CFStringGetTypeID() && CFStringGetPascalString(v4, a2, 256, 0) != 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t sub_2127F82D0(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v2;
  __CFDictionary *v3;
  __int16 v5;

  if (!a2)
    return 4294967246;
  if (!*(_QWORD *)(a1 + 104))
    return 4294967097;
  v2 = sub_2127F8098(a1, a2, 0);
  if (!v2)
    return 4294967104;
  v3 = v2;
  v5 = 0;
  if (!sub_2127F74E4(v2, CFSTR("Attributes"), &v5))
    return 4294967097;
  if ((v5 & 2) != 0)
    return 4294967098;
  CFDictionaryRemoveValue(v3, CFSTR("Handle"));
  return 0;
}

uint64_t sub_2127F8360(uint64_t a1, unint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v5;

  if (a2 < 0xF4)
    return 29;
  v2 = *(_DWORD *)(a1 + 200);
  v3 = bswap32(v2);
  if (v2)
  {
    if (40 * (unint64_t)(v3 - 1) + 244 > a2)
      return 29;
  }
  *(int8x8_t *)a1 = vrev32_s8(*(int8x8_t *)a1);
  *(int8x16_t *)(a1 + 8) = vrev64q_s8(*(int8x16_t *)(a1 + 8));
  *(_QWORD *)(a1 + 24) = bswap64(*(_QWORD *)(a1 + 24));
  *(int8x8_t *)(a1 + 32) = vrev32_s8(*(int8x8_t *)(a1 + 32));
  *(int8x8_t *)(a1 + 64) = vrev32_s8(*(int8x8_t *)(a1 + 64));
  *(_DWORD *)(a1 + 200) = v3;
  if (v2)
  {
    v5 = a1 + 204;
    do
    {
      *(int8x8_t *)v5 = vrev32_s8(*(int8x8_t *)v5);
      *(int8x16_t *)(v5 + 8) = vrev64q_s8(*(int8x16_t *)(v5 + 8));
      *(int8x16_t *)(v5 + 24) = vrev64q_s8(*(int8x16_t *)(v5 + 24));
      v5 += 40;
      --v3;
    }
    while (v3);
  }
  return 0;
}

uint64_t sub_2127F8414(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  if (*(__int16 *)(a1 + 912) < 1)
    return 0;
  v4 = 0;
  while (1)
  {
    v5 = *(_QWORD **)(*(_QWORD *)(a1 + 928) + 8 * v4);
    if (!v5 || !*v5)
      return 999;
    if ((sub_2127F8490((uint64_t)v5, a2) & 1) == 0)
      break;
    if (++v4 >= *(__int16 *)(a1 + 912))
      return 0;
  }
  return 107;
}

uint64_t sub_2127F8490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v17;
  int64_t v18;
  _QWORD *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;
  _BOOL4 v29;
  uint64_t v30;

  v4 = sub_212820120(a1);
  v5 = *(_QWORD *)a1;
  v6 = *(unsigned int *)(*(_QWORD *)a1 + 200);
  if (v6 < 2)
    return 0;
  v8 = *(_QWORD *)(v5 + 24);
  v9 = (v4 - 204) / 0x28uLL;
  v10 = v9 == v6 && v8 <= a2;
  v13 = v10 && *(_DWORD *)(v5 + 4) == 1 && *(_DWORD *)v5 == 1835627368;
  if ((unint64_t)(v4 - 204) > 0x27)
  {
    v17 = 0;
    v14 = 0;
    v15 = *(_QWORD *)(v5 + 16);
    v18 = v9 - 1;
    v19 = (_QWORD *)(v5 + 252);
    v20 = 1;
    do
    {
      v21 = *((_DWORD *)v19 - 12);
      v22 = *(v19 - 2);
      v23 = *(v19 - 5);
      v24 = *(v19 - 4);
      if (v14 <= v23)
        v14 = *(v19 - 5);
      if (v21 >= -2147483639 && (v21 + 1) >= 4 && v21 != 2147483646)
        v13 = 0;
      if (v21 >= -2147483639)
      {
        if (v21 == 1)
          v13 = (v22 >= v24 << 9) & v13;
      }
      else
      {
        v13 = (v24 <= *(unsigned int *)(v5 + 32)) & v13;
      }
      v27 = v24 + v23;
      v29 = v27 <= v15 && v23 <= v15;
      v13 &= v29;
      if (v21 != -1 && (v21 & 0xF0000000) != 0x70000000 && v18 > v17 && *v19 < v23)
        v13 = 0;
      if (v18 > v17 && v27 != *v19)
        v13 = 0;
      v30 = *(v19 - 3) + v8;
      if (v30 + v22 > a2 || v30 > a2)
        v13 = 0;
      v17 = v20;
      v10 = v9 > v20++;
      v19 += 5;
    }
    while (v10);
  }
  else
  {
    v14 = 0;
    v15 = *(_QWORD *)(v5 + 16);
  }
  if (v14 == v15)
    v7 = v13;
  else
    v7 = 0;
  nullsub_4(a1);
  return v7;
}

uint64_t sub_2127F8628(uint64_t a1)
{
  void **v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v31;
  unsigned int v32;
  __int128 v33;

  v2 = (void **)sub_212820064(204);
  if (!sub_21281FFF4())
  {
    v3 = *v2;
    *(_QWORD *)v3 = 0x16D697368;
    v3[9] = -2;
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      v4 = 0;
      v32 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 204;
      v31 = a1;
      while (1)
      {
        v9 = *(uint64_t **)(*(_QWORD *)(a1 + 928) + 8 * v4);
        v10 = *v9;
        v11 = *(_DWORD *)(*v9 + 200);
        v12 = *(_QWORD *)(*v9 + 8);
        if (v12 > v6)
        {
          v8 += 40;
          sub_2128200C8((uint64_t)v2, v8);
          if (sub_21281FFF4())
            break;
          v13 = (uint64_t)*v2 + 40 * v7++;
          *(_DWORD *)(v13 + 204) = 0;
          *(_DWORD *)(v13 + 208) = 0;
          *(_QWORD *)(v13 + 212) = v6;
          *(_QWORD *)(v13 + 220) = v12 - v6;
          *(_QWORD *)(v13 + 228) = v5;
          *(_QWORD *)(v13 + 236) = 0;
          v10 = *v9;
          v6 = v12;
        }
        v14 = v11 - 1;
        v15 = *(_DWORD *)(v10 + 32);
        v16 = v32;
        if (v15 > v32)
          v16 = v15;
        sub_2128200C8((uint64_t)v2, v8 + 40 * v14);
        if (sub_21281FFF4())
          break;
        if (v14 >= 1)
        {
          v17 = 0;
          v18 = *v9;
          while (1)
          {
            v19 = *(_QWORD *)(v18 + v17 + 204);
            v20 = *(_QWORD *)(v18 + v17 + 212);
            v21 = *(_QWORD *)(v18 + v17 + 220);
            v33 = *(_OWORD *)(v18 + v17 + 228);
            v22 = *(_QWORD *)(v18 + 8) + v20;
            if (v22 >= v6)
              goto LABEL_25;
            if (v22 + v21 > v6)
              break;
LABEL_26:
            v17 += 40;
            if (40 * v14 == v17)
              goto LABEL_27;
          }
          if ((int)v19 > 2147483645)
          {
            if ((_DWORD)v19 != 2147483646)
              goto LABEL_23;
          }
          else if (v19 >= 3)
          {
            if ((int)v19 < -2147483639 || (_DWORD)v19 == -1)
            {
LABEL_29:
              v25 = 107;
              goto LABEL_30;
            }
LABEL_23:
            if ((v19 & 0x80000000) != 0)
              goto LABEL_29;
          }
          v21 += v20 - v6;
          v20 = v6;
LABEL_25:
          v24 = (uint64_t)*v2 + 40 * v7++;
          v8 += 40;
          *(_QWORD *)(v24 + 204) = v19;
          *(_QWORD *)(v24 + 212) = v20;
          *(_QWORD *)(v24 + 220) = v21;
          *(_OWORD *)(v24 + 228) = v33;
          v18 = *v9;
          *(_QWORD *)(v24 + 212) = *(_QWORD *)(*v9 + 8) + v20;
          *(_QWORD *)(v24 + 228) += *(_QWORD *)(v18 + 24);
          v6 += v21;
          v5 += *(_QWORD *)(v24 + 236);
          goto LABEL_26;
        }
LABEL_27:
        v32 = v16;
        ++v4;
        a1 = v31;
        if (v4 >= *(__int16 *)(v31 + 912))
          goto LABEL_33;
      }
      v25 = 12;
LABEL_30:
      a1 = v31;
      goto LABEL_31;
    }
    v7 = 0;
    v6 = 0;
    v5 = 0;
    v32 = 0;
    v8 = 204;
LABEL_33:
    v26 = *(_QWORD *)(a1 + 884);
    if (v26 <= v6)
      goto LABEL_36;
    v8 += 40;
    sub_2128200C8((uint64_t)v2, v8);
    if (!sub_21281FFF4())
    {
      v27 = (uint64_t)*v2 + 40 * v7++;
      *(_DWORD *)(v27 + 204) = 0;
      *(_DWORD *)(v27 + 208) = 0;
      *(_QWORD *)(v27 + 212) = v6;
      *(_QWORD *)(v27 + 220) = v26 - v6;
      *(_QWORD *)(v27 + 228) = v5;
      *(_QWORD *)(v27 + 236) = 0;
      v6 = v26;
LABEL_36:
      sub_2128200C8((uint64_t)v2, v8 + 40);
      if (!sub_21281FFF4())
      {
        v25 = 0;
        v28 = *v2;
        v29 = (uint64_t)*v2 + 40 * v7;
        *(_QWORD *)(v29 + 204) = 0xFFFFFFFFLL;
        *(_QWORD *)(v29 + 212) = v6;
        *(_QWORD *)(v29 + 220) = 0;
        *(_QWORD *)(v29 + 228) = v5;
        *(_QWORD *)(v29 + 236) = 0;
        v28[2] = v6;
        *((_DWORD *)v28 + 8) = v32;
        *((_DWORD *)v28 + 50) = v7 + 1;
        goto LABEL_38;
      }
    }
  }
  v25 = 12;
LABEL_31:
  sub_212820098(v2);
  v2 = 0;
LABEL_38:
  *(_QWORD *)(a1 + 904) = v2;
  return v25;
}

uint64_t sub_2127F894C(_BYTE *a1)
{
  uint64_t result;
  uint64_t v3;

  (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 632))(a1);
  result = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 616))(a1);
  if ((result & 1) == 0)
  {
    if (!a1[778])
    {
      v3 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 496))(a1);
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v3 + 352))(v3, 0);
    }
    return (*(uint64_t (**)(_BYTE *, _QWORD))(*(_QWORD *)a1 + 648))(a1, 0);
  }
  return result;
}

uint64_t sub_2127F89CC(uint64_t result, int a2)
{
  int v2;
  int v4;

  v2 = *(_DWORD *)(result + 176);
  if (v2 > 0 || a2 != 0)
  {
    v4 = v2 - 1;
    if (a2)
      v4 = 0;
    *(_DWORD *)(result + 176) = v4;
  }
  return result;
}

void sub_2127F89F0(_QWORD *a1)
{
  sub_2127F8A48(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127F8A24(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F8A48(_QWORD *a1)
{
  *a1 = &off_24CE2BD50;
  sub_2127F72E4((uint64_t)a1, 0);
  return sub_2127F8BD8(a1);
}

void sub_2127F8A7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

void sub_2127F8A94(uint64_t a1)
{
  const __CFDictionary *v2;
  size_t Count;
  int64_t v4;
  const void **v5;
  const void **v6;
  const void **v7;
  uint64_t i;
  const __CFArray *v9;
  CFIndex v10;
  CFIndex v11;
  CFIndex j;
  const __CFDictionary *ValueAtIndex;
  __CFDictionary *v14;
  void *v15;

  v2 = *(const __CFDictionary **)(a1 + 104);
  if (v2)
  {
    Count = CFDictionaryGetCount(v2);
    if (Count)
    {
      v4 = Count;
      v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
      if (v5)
      {
        v6 = v5;
        v7 = (const void **)malloc_type_calloc(v4, 8uLL, 0x6004044C4A2DFuLL);
        CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
        if (v4 >= 1)
        {
          for (i = 0; i != v4; ++i)
          {
            v9 = (const __CFArray *)v7[i];
            if (v9)
            {
              v10 = CFArrayGetCount((CFArrayRef)v7[i]);
              if (v10 >= 1)
              {
                v11 = v10;
                for (j = 0; j != v11; ++j)
                {
                  v15 = 0;
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, j);
                  if (ValueAtIndex)
                  {
                    v14 = ValueAtIndex;
                    if (sub_2127F7E88((int)ValueAtIndex, ValueAtIndex, &v15))
                      sub_212820098((void **)v15);
                    CFDictionaryRemoveValue(v14, CFSTR("Handle"));
                  }
                }
              }
            }
          }
        }
        free(v6);
        if (v7)
          free(v7);
      }
    }
  }
}

uint64_t sub_2127F8BDC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v5;

  v2 = *(void **)(a1 + 1008);
  if (v2)
    free(v2);
  *(_QWORD *)(a1 + 1008) = 0;
  v3 = *(unsigned int *)(**(_QWORD **)(a1 + 904) + 32);
  if (!(_DWORD)v3)
    return 0;
  if (v3 > 0x400000)
    return 107;
  *(_BYTE *)(a1 + 1024) = 0;
  *(_QWORD *)(a1 + 1016) = v3 << 9;
  v5 = malloc_type_malloc(v3 << 9, 0x5D0096D1uLL);
  *(_QWORD *)(a1 + 1008) = v5;
  if (v5)
    return 0;
  else
    return 12;
}

char *sub_2127F8C58(uint64_t a1, char *a2)
{
  char *result;

  if (a2)
    DIDiskImageObjectRetain_0(a2);
  result = *(char **)(a1 + 136);
  if (result)
    result = (char *)DIDiskImageObjectRelease(result);
  *(_QWORD *)(a1 + 136) = a2;
  return result;
}

uint64_t sub_2127F8C98(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 136);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 432))(result);
  return result;
}

uint64_t sub_2127F8CB0(uint64_t a1)
{
  void *v2;
  CFArrayRef v3;
  CFTypeID v4;
  uint64_t v5;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFArray *Value;
  const __CFArray *v13;
  int v14;
  CFTypeRef cf;
  void *values;

  cf = 0;
  v2 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
  values = v2;
  if (!v2)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v3 = (CFArrayRef)v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFArrayGetTypeID())
    CFRetain(v3);
  else
    v3 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, 1, MEMORY[0x24BDBD690]);
  if (sub_2127F8E60((CFArrayRef *)&cf) || !cf || (Count = CFArrayGetCount((CFArrayRef)cf), Count < 1))
  {
LABEL_7:
    v5 = 0;
    if (!v3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v8 = Count;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
    if (!ValueAtIndex)
      goto LABEL_23;
    v11 = ValueAtIndex;
    Value = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("writeable-components"));
    v13 = (const __CFArray *)CFDictionaryGetValue(v11, CFSTR("readonly-components"));
    if (Value)
    {
      if (sub_21280A650(Value, v3))
        break;
    }
    if (v13)
    {
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1))
      {
        v14 = sub_21280A650(v13, v3);
      }
      else
      {
        v14 = sub_2128073D0(v13, v3);
        if (Value)
          goto LABEL_23;
      }
      if (v14)
        break;
    }
LABEL_23:
    if (v8 == ++v9)
      goto LABEL_7;
  }
  v5 = 1;
  if (v3)
LABEL_8:
    CFRelease(v3);
LABEL_9:
  if (cf)
    CFRelease(cf);
  return v5;
}

uint64_t sub_2127F8E48(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t sub_2127F8E60(CFArrayRef *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  uint64_t MatchingServices;
  uint64_t v5;
  __CFArray *Mutable;
  io_object_t v7;
  io_registry_entry_t v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  BOOL v11;
  CFArrayRef Copy;
  void *value;
  io_iterator_t existing;

  existing = 0;
  value = 0;
  if (!a1)
    return 4;
  *a1 = 0;
  v2 = *MEMORY[0x24BDD8B20];
  v3 = IOServiceMatching("IOHDIXHDDrive");
  MatchingServices = IOServiceGetMatchingServices(v2, v3, &existing);
  if ((_DWORD)MatchingServices)
  {
    v5 = MatchingServices;
    Mutable = 0;
  }
  else
  {
    if (!IOIteratorIsValid(existing))
      MEMORY[0x212BF42BC](existing);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (Mutable)
    {
      v7 = IOIteratorNext(existing);
      if (v7)
      {
        v8 = v7;
        do
        {
          v9 = sub_21280736C(v8);
          if (v9)
          {
            v10 = v9;
            if (CFDictionaryGetValueIfPresent(v9, CFSTR("backingstore-id"), (const void **)&value))
              CFArrayAppendValue(Mutable, value);
            CFRelease(v10);
          }
          IOObjectRelease(v8);
          v8 = IOIteratorNext(existing);
        }
        while (v8);
      }
      v5 = 0;
    }
    else
    {
      v5 = 999;
    }
  }
  if (existing)
  {
    IOObjectRelease(existing);
    existing = 0;
  }
  if ((_DWORD)v5)
    v11 = Mutable == 0;
  else
    v11 = 1;
  if (!v11)
    goto LABEL_28;
  if (Mutable)
  {
    Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], Mutable);
    *a1 = Copy;
    if (Copy)
      v5 = v5;
    else
      v5 = 999;
LABEL_28:
    CFRelease(Mutable);
  }
  return v5;
}

uint64_t sub_2127F8FDC()
{
  return 0;
}

uint64_t sub_2127F8FE4()
{
  return 0;
}

uint64_t sub_2127F8FEC(_QWORD *a1, _QWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

uint64_t DIDiskImageHasChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
}

uint64_t sub_2127F9020(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;

  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
  if (!v1)
    return 0;
  v2 = (char *)v1;
  v3 = (*(unsigned int (**)(uint64_t))(*(_QWORD *)v1 + 80))(v1) ^ 1;
  DIDiskImageObjectRelease(v2);
  return v3;
}

uint64_t sub_2127F9070(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_2127F90FC(*(_DWORD *)(a1 + 744));
  if (v2)
  {
    v3 = v2;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 144))(v2, a1 + 752);
  }
  else
  {
    v3 = operator new();
    sub_212814FD8(v3, 0);
  }
  return v3;
}

void sub_2127F90D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F90FC(int a1)
{
  uint64_t v1;

  v1 = 0;
  switch(a1)
  {
    case 0:
    case 10:
    case 11:
    case 12:
    case 13:
      v1 = operator new();
      sub_212814FD8(v1, a1 != 0);
      break;
    case 2:
      v1 = operator new();
      sub_2127F92B0(v1);
      break;
    case 4:
      v1 = operator new();
      sub_212810BB8();
      break;
    case 6:
      v1 = operator new();
      sub_2128150A0();
      break;
    case 7:
      v1 = operator new();
      sub_21281E530();
      break;
    case 8:
      v1 = operator new();
      sub_21281E660();
      break;
    case 9:
      v1 = operator new();
      sub_21281E790();
      break;
    default:
      return v1;
  }
  return v1;
}

void sub_2127F9244(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F92B0(uint64_t a1)
{
  uint64_t result;

  result = sub_2127F92D4(a1);
  *(_QWORD *)result = &off_24CE29828;
  *(_DWORD *)(result + 112) = 0;
  return result;
}

uint64_t sub_2127F92D4(uint64_t a1)
{
  *(_QWORD *)sub_2127F3014(a1) = off_24CE29760;
  *(_QWORD *)(a1 + 104) = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  return a1;
}

void sub_2127F931C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F9334(uint64_t result, unsigned int *a2)
{
  *(_DWORD *)(result + 112) = bswap32(*a2);
  return result;
}

BOOL sub_2127F9344(uint64_t a1)
{
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1) == 10)
    return 0;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1))
    return (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1) == 0;
  return 1;
}

uint64_t sub_2127F93B0()
{
  return 2;
}

uint64_t sub_2127F93B8()
{
  return 32;
}

void sub_2127F93C0(_QWORD *a1)
{
  sub_2127F9418(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127F93F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127F9418(_QWORD *a1)
{
  const void *v2;

  *a1 = off_24CE29760;
  v2 = (const void *)a1[13];
  if (v2)
    CFRelease(v2);
  return sub_2127F3E08(a1);
}

void sub_2127F9450(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

uint64_t DIDiskImageCopyImageChecksum(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
}

uint64_t DIDiskImageGetBackingStore(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
}

BOOL sub_2127F9480(uint64_t a1)
{
  statfs v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  return ((statfs(*(const char **)(a1 + 296), &v2) & 0x80000000) == 0 || !*__error()) && (v2.f_flags & 0x1000) == 0;
}

uint64_t sub_2127F94FC(uint64_t a1)
{
  statfs v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  if (statfs(*(const char **)(a1 + 296), &v2) < 0 && *__error())
    return 0;
  else
    return v2.f_flags & 1;
}

uint64_t sub_2127F9578(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t sub_2127F9584(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t DIDiskImageValidateChecksum(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 168))(a1, a2, a3, a4, 0);
}

uint64_t sub_2127F959C(uint64_t a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, char a5)
{
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  uint64_t result;

  v10 = (const __CFString *)sub_2127F14C0();
  v11 = sub_2127F14C8(v10, 0);
  if (v10)
    CFRelease(v10);
  if ((a5 & 1) == 0 && v11)
  {
    v12 = (const __CFString *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("di-valid-cached-checksum"));
    if (sub_2127F14C8(v12, 0))
    {
      if (a2)
        *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
      if (a3)
        *a3 = 0;
      if (a4)
        *a4 = 0;
      return 117;
    }
    goto LABEL_14;
  }
  if (v11)
LABEL_14:
    (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)a1 + 32))(a1, CFSTR("di-valid-cached-checksum"), *MEMORY[0x24BDBD268]);
  result = (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD *, _QWORD *))(*(_QWORD *)a1 + 160))(a1, a2, a3, a4);
  if ((a5 & 4) == 0 && a5 & 2 | v11 && !(_DWORD)result)
  {
    (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)a1 + 32))(a1, CFSTR("di-valid-cached-checksum"), *MEMORY[0x24BDBD270]);
    return 0;
  }
  return result;
}

__CFArray *sub_2127F96EC(uint64_t a1, __CFString *theString1)
{
  int HasPrefix;
  __CFArray *v5;
  const __CFString *v6;
  int v8;
  const __CFString **v9;

  if (CFStringCompare(theString1, CFSTR("udif-ordered-chunks"), 0))
  {
    HasPrefix = CFStringHasPrefix(theString1, CFSTR("data-run-info-"));
    v5 = sub_2127F97D0(a1, theString1);
    v6 = (const __CFString *)v5;
    if (HasPrefix && !v5)
    {
      sub_21281A4C0(a1, theString1);
      return sub_2127F97D0(a1, theString1);
    }
  }
  else
  {
    v6 = (const __CFString *)sub_2127F97D0(a1, theString1);
    if (!v6)
    {
      v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 608))(a1);
      v9 = (const __CFString **)MEMORY[0x24BDBD270];
      if (!v8)
        v9 = (const __CFString **)MEMORY[0x24BDBD268];
      v6 = *v9;
      sub_2127F6BAC(a1, theString1, *v9);
    }
  }
  return (__CFArray *)v6;
}

__CFArray *sub_2127F97D0(uint64_t a1, CFTypeRef cf1)
{
  int v4;
  uint64_t v5;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  if (!cf1)
    return 0;
  if (CFEqual(cf1, CFSTR("di-valid-cached-checksum")))
  {
    v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 536))(a1);
    v5 = MEMORY[0x24BDBD270];
    if (!v4)
      v5 = MEMORY[0x24BDBD268];
    return *(__CFArray **)v5;
  }
  if (CFEqual(cf1, CFSTR("tiger-blkx")))
  {
    v7 = (char *)a1;
    v8 = 1;
    return sub_212815EA0(v7, v8);
  }
  if (CFEqual(cf1, CFSTR("leopard-blkx")))
  {
    v7 = (char *)a1;
    v8 = 0;
    return sub_212815EA0(v7, v8);
  }
  if (CFEqual(cf1, CFSTR("bs-io-scheduling"))
    && (v9 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1)) != 0
    && (v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 488))(v9)) != 0)
  {
    return (__CFArray *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)v10 + 24))(v10, CFSTR("bs-io-scheduling"));
  }
  else
  {
    return (__CFArray *)sub_2127F4250(a1, cf1);
  }
}

uint64_t sub_2127F98EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CFStringRef v6;
  CFStringRef v7;
  const __CFString *v8;
  const __CFString *v9;
  CFTypeRef cf;

  cf = 0;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (!v2)
    goto LABEL_4;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 488))(v2);
  if (!v3
    || (*(unsigned int (**)(uint64_t, const __CFString *, CFTypeRef *))(*(_QWORD *)v3 + 120))(v3, CFSTR("com.apple.diskimages.recentcksum"), &cf))
  {
    goto LABEL_4;
  }
  if (!cf)
    return 0;
  v6 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)cf, 0x8000100u);
  if (v6)
  {
    v7 = v6;
    v8 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 544))(a1);
    if (v8)
    {
      v9 = v8;
      v4 = CFEqual(v7, v8);
      CFRelease(v7);
      v7 = v9;
    }
    else
    {
      v4 = 0;
    }
    CFRelease(v7);
  }
  else
  {
LABEL_4:
    v4 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v4;
}

size_t sub_2127F99E4(uint64_t a1, const __CFString *a2, CFDataRef *a3)
{
  const char *v5;
  char *v6;
  ssize_t v7;
  size_t v8;
  UInt8 *v9;
  UInt8 *v10;
  ssize_t v11;
  CFDataRef v12;

  v5 = (const char *)sub_2127F2B30(a2, 0x8000100u);
  v6 = (char *)v5;
  if (a3 && v5)
  {
    v7 = getxattr(*(const char **)(a1 + 296), v5, 0, 0, 0, 0);
    v8 = v7;
    if ((v7 & 0x8000000000000000) == 0)
    {
      v9 = (UInt8 *)malloc_type_malloc(v7, 0xD316FE41uLL);
      if (v9)
      {
        v10 = v9;
        v11 = getxattr(*(const char **)(a1 + 296), v6, v9, v8, 0, 0);
        v8 = 999;
        if ((v11 & 0x8000000000000000) == 0)
        {
          v12 = CFDataCreate(0, v10, v11);
          *a3 = v12;
          if (v12)
            v8 = 0;
          else
            v8 = 999;
        }
        free(v10);
      }
      else
      {
        v8 = 12;
      }
    }
  }
  else
  {
    v8 = 999;
    if (!v5)
      return v8;
  }
  free(v6);
  return v8;
}

uint64_t sub_2127F9AD4(uint64_t a1, const __CFString *a2, const __CFData *a3)
{
  const char *v5;
  char *v6;
  const char *v7;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v10;
  uint64_t v11;

  v5 = (const char *)sub_2127F2B30(a2, 0x8000100u);
  if (!v5)
    return 999;
  v6 = (char *)v5;
  v7 = *(const char **)(a1 + 296);
  if (a3)
  {
    BytePtr = CFDataGetBytePtr(a3);
    Length = CFDataGetLength(a3);
    v10 = setxattr(v7, v6, BytePtr, Length, 0, 0);
  }
  else
  {
    v10 = removexattr(v7, v5, 0);
  }
  v11 = v10;
  free(v6);
  return v11;
}

uint64_t sub_2127F9B78(uint64_t a1, char **a2, char **a3, _QWORD *a4)
{
  uint64_t result;

  if (a4)
    *a4 = 0;
  *(_BYTE *)(a1 + 1032) = 1;
  result = sub_2127F9BB0(a1, a2, a3, a4);
  *(_BYTE *)(a1 + 1032) = 0;
  return result;
}

uint64_t sub_2127F9BB0(uint64_t a1, char **a2, char **a3, _QWORD *a4)
{
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a4)
    *a4 = 0;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
  v8 = (char *)v7;
  if (!v7)
  {
    if (a2)
    {
      v9 = 0;
      v10 = 999;
      goto LABEL_13;
    }
    v10 = 999;
    if (!a3)
      return v10;
    v9 = 0;
LABEL_22:
    *a3 = v9;
    return v10;
  }
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 80))(v7))
  {
    v9 = (char *)operator new();
    sub_212814FD8(v9, 0);
    goto LABEL_12;
  }
  v9 = (char *)sub_2127F9D14((uint64_t)v8);
  if (!v9)
  {
LABEL_12:
    v10 = 999;
    if (a2)
      goto LABEL_13;
    goto LABEL_21;
  }
  v11 = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)a1 + 184))(a1, v9);
  if ((_DWORD)v11)
  {
    v10 = v11;
    if (a2)
      goto LABEL_13;
    goto LABEL_21;
  }
  if ((*(unsigned int (**)(char *, char *))(*(_QWORD *)v8 + 152))(v8, v9))
    v10 = 0;
  else
    v10 = 116;
  if (!a2)
  {
LABEL_21:
    DIDiskImageObjectRelease(v8);
    if (!a3)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_13:
  *a2 = v8;
  if (a3)
    goto LABEL_22;
LABEL_23:
  if (v9)
    DIDiskImageObjectRelease(v9);
  return v10;
}

void sub_2127F9CF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127F9D14(uint64_t a1)
{
  int v1;

  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1);
  return sub_2127F90FC(v1);
}

uint64_t sub_2127F9D30(unsigned __int8 *a1, uint64_t a2)
{
  return (*(uint64_t (**)(unsigned __int8 *, uint64_t, _QWORD))(*(_QWORD *)a1 + 560))(a1, a2, a1[1032]);
}

uint64_t sub_2127F9D40(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD **v9;
  uint64_t v10;
  _QWORD **v11;
  uint64_t v12;
  _QWORD *v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;
  char *v17;
  int v18;
  const __CFString *v19;
  CFStringRef v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  const __CFString *v24;
  CFStringRef v25;
  CFStringRef v26;
  int v27;
  const __CFString *v28;
  CFStringRef v29;
  CFStringRef v30;
  CFStringRef v31;
  int v32;
  CFStringRef v33;
  CFStringRef v34;
  CFTypeRef cf;
  _QWORD **v37;
  int v38;
  const __CFBoolean *v39;
  char *v40;
  const __CFAllocator *alloc;
  char v42[4];
  unsigned int v43;
  _QWORD v44[18];

  v44[16] = *MEMORY[0x24BDAC8D0];
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 48))(a2);
  (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
  if (*(__int16 *)(a1 + 912) >= 1)
  {
    v6 = 0;
    v7 = *(unsigned __int16 *)(a1 + 912);
    v8 = *(__int16 *)(a1 + 914);
    v9 = (_QWORD **)(a1 + 904);
    alloc = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v10 = 8 * v8;
    v39 = (const __CFBoolean *)*MEMORY[0x24BDBD270];
    while (1)
    {
      if ((int)v8 < -2)
        goto LABEL_44;
      v11 = v9;
      if (v8 + v6 != -2)
      {
        v12 = *(__int16 *)(a1 + 914);
        if (v8 + v6 - v12 >= v7)
          goto LABEL_44;
        v11 = (_QWORD **)(*(_QWORD *)(a1 + 928) - 8 * v12 + v10);
      }
      v13 = *v11;
      if (!*v11
        || (v14 = (const __CFString *)sub_2127FA26C(a1, v8 + v6)) == 0
        || (v15 = v14, (v16 = sub_2127F90FC(*(_DWORD *)(*v13 + 64))) == 0))
      {
LABEL_44:
        v21 = 999;
        goto LABEL_45;
      }
      v17 = (char *)v16;
      v38 = a3;
      v37 = v9;
      if (a3)
        v40 = (char *)sub_2127FA29C((_DWORD *)(*v13 + 64));
      else
        v40 = 0;
      v18 = DIGetBundleRef();
      v19 = (const __CFString *)sub_21281FFEC(v18, (int)CFSTR("Checksumming %1$@\\U2026"), CFSTR("Checksumming %1$@\\U2026"));
      v20 = CFStringCreateWithFormat(alloc, 0, v19, v15);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v20, 16);
      if (v20)
        CFRelease(v20);
      if (v19)
        CFRelease(v19);
      v21 = sub_2127FA4F8((char *)a1, v13, v17);
      (*(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)a1 + 336))(a1, &stru_24CE2CFF0, 16);
      if ((_DWORD)v21 == 111)
        break;
      if (!(_DWORD)v21)
      {
        v22 = (*(uint64_t (**)(uint64_t, char *, char *))(*(_QWORD *)a1 + 376))(a1, v40, v17);
        v23 = DIGetBundleRef();
        v24 = (const __CFString *)sub_21281FFEC(v23, (int)CFSTR("%1$@: %2$@"), CFSTR("%1$@: %2$@"));
        v25 = sub_2127FC5AC(v15, 36, v39);
        cf = (CFTypeRef)v22;
        v26 = CFStringCreateWithFormat(alloc, 0, v24, v25, v22);
        (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v26, 8);
        if (v25)
          CFRelease(v25);
        if (v26)
          CFRelease(v26);
        if (v24)
          CFRelease(v24);
        a3 = v38;
        if (cf)
          CFRelease(cf);
        (*(void (**)(char *, char *))(*(_QWORD *)v17 + 136))(v17, v42);
        (*(void (**)(uint64_t, _QWORD *, unint64_t))(*(_QWORD *)a2 + 56))(a2, v44, (unint64_t)v43 >> 3);
        goto LABEL_39;
      }
      v32 = DIGetBundleRef();
      v28 = (const __CFString *)sub_21281FFEC(v32, (int)CFSTR("%1$@: checksum failed with error %2$ld."), CFSTR("%1$@: checksum failed with error %2$ld."));
      v33 = sub_2127FC5AC(v15, 36, v39);
      v34 = CFStringCreateWithFormat(alloc, 0, v28, v33, v21);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v34, 8);
      if (v33)
        CFRelease(v33);
      if (v34)
      {
        v31 = v34;
LABEL_36:
        CFRelease(v31);
      }
LABEL_37:
      a3 = v38;
      if (v28)
        CFRelease(v28);
LABEL_39:
      DIDiskImageObjectRelease(v17);
      if (v40)
        DIDiskImageObjectRelease(v40);
      v9 = v37;
      if ((_DWORD)v21)
        goto LABEL_45;
      ++v6;
      v7 = *(__int16 *)(a1 + 912);
      v10 += 8;
      if (v6 >= v7)
        goto LABEL_43;
    }
    v27 = DIGetBundleRef();
    v28 = (const __CFString *)sub_21281FFEC(v27, (int)CFSTR("%1$@: checksum canceled."), CFSTR("%1$@: checksum canceled."));
    v29 = sub_2127FC5AC(v15, 36, v39);
    v30 = CFStringCreateWithFormat(alloc, 0, v28, v29);
    (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v30, 8);
    if (v29)
      CFRelease(v29);
    if (!v30)
      goto LABEL_37;
    v31 = v30;
    goto LABEL_36;
  }
LABEL_43:
  v21 = 0;
LABEL_45:
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 72))(a2);
  (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, 100.0);
  return v21;
}

uLong sub_2127FA1B0(uint64_t a1)
{
  uLong result;

  result = crc32(0, 0, 0);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_2127FA1E0(uint64_t a1, float a2)
{
  uint64_t (*v3)(uint64_t);
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, float *, _QWORD, _QWORD, _QWORD);
  float v6;

  v6 = a2;
  v3 = *(uint64_t (**)(uint64_t))(a1 + 112);
  if (v3)
    return v3(a1);
  result = sub_2127FA258(a1);
  if (result)
  {
    v5 = (uint64_t (*)(uint64_t, uint64_t, float *, _QWORD, _QWORD, _QWORD))sub_2127FA258(a1);
    return v5(1, a1, &v6, 0, 0, 0);
  }
  return result;
}

uint64_t sub_2127FA258(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t sub_2127FA264(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

const void *sub_2127FA26C(uint64_t a1, uint64_t a2)
{
  CFIndex v2;
  const __CFArray *v3;

  if (a2 >= -1
    && (v2 = a2 - *(__int16 *)(a1 + 914), v2 < *(__int16 *)(a1 + 912))
    && (v3 = *(const __CFArray **)(a1 + 936)) != 0)
  {
    return CFArrayGetValueAtIndex(v3, v2);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_2127FA29C(_DWORD *a1)
{
  uint64_t v1;

  v1 = 0;
  switch(*a1)
  {
    case 0:
    case 0xA:
    case 0xB:
    case 0xC:
    case 0xD:
      v1 = operator new();
      sub_212814FD8(v1, *a1 != 0);
      goto LABEL_3;
    case 2:
      v1 = operator new();
      sub_2127F92B0(v1);
      goto LABEL_3;
    case 4:
      v1 = operator new();
      sub_212810BB8();
      goto LABEL_3;
    case 6:
      v1 = operator new();
      sub_2128150A0();
      goto LABEL_3;
    case 7:
    case 8:
      v1 = operator new();
      sub_21281E530();
      goto LABEL_3;
    case 9:
      v1 = operator new();
      sub_21281E790();
LABEL_3:
      (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v1 + 144))(v1, a1 + 2);
      break;
    default:
      return v1;
  }
  return v1;
}

void sub_2127FA3FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FA468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t (*v8)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD);

  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 104);
  if (v6)
    return v6(a1, a2, a3);
  result = sub_2127FA258(a1);
  if (result)
  {
    v8 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))sub_2127FA258(a1);
    return v8(0, a1, a2, a3, 0, 0);
  }
  return result;
}

uint64_t sub_2127FA4F8(char *a1, _QWORD *a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  BOOL v22;
  timespec v24;
  void *v25;
  __int128 v26;
  char *v27;
  char *v28;
  __int128 v29;
  void *v30[2];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[20];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  pthread_mutex_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  v6 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
  (*(void (**)(char *))(*(_QWORD *)a3 + 48))(a3);
  memset(&v38, 0, sizeof(v38));
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  memset(v34, 0, sizeof(v34));
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v26 = 0u;
  v28 = a3;
  DIDiskImageObjectRetain_0(a3);
  v27 = a1;
  DIDiskImageObjectRetain_0(a1);
  v7 = *a2;
  v8 = *a2 + 204;
  v39 = a2;
  v40 = v8;
  *(_QWORD *)&v36 = *(_QWORD *)(v7 + 16);
  *((_QWORD *)&v36 + 1) = *(_QWORD *)(v7 + 8);
  pthread_mutex_init((pthread_mutex_t *)&v30[1], 0);
  pthread_cond_init((pthread_cond_t *)&v34[1], 0);
  pthread_mutex_init((pthread_mutex_t *)&v34[7], 0);
  pthread_cond_init((pthread_cond_t *)&v34[15], 0);
  BYTE8(v35) = 0;
  v37 = 0uLL;
  pthread_mutex_init(&v38, 0);
  v9 = operator new();
  sub_2127FAA3C(v9);
  *(_QWORD *)&v26 = v9;
  v10 = operator new();
  sub_2127FAA3C(v10);
  *((_QWORD *)&v26 + 1) = v10;
  *(_QWORD *)&v29 = 0x500000002;
  DWORD2(v29) = 2;
  v30[0] = malloc_type_calloc(2uLL, 8uLL, 0x2004093837F09uLL);
  if (v30[0])
  {
    v11 = 0;
    do
    {
      v12 = operator new();
      sub_21281AF70(v12, 1);
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)v26 + 16))(v26, v12);
      ++v11;
    }
    while (v11 < SDWORD1(v29));
    v13 = 0;
    v14 = 0;
    do
    {
      pthread_create((pthread_t *)((char *)v30[0] + v13), 0, (void *(__cdecl *)(void *))sub_2127FAB44, &v26);
      ++v14;
      v13 += 8;
    }
    while (v14 < (int)v29 - 1);
    pthread_create((pthread_t *)v30[0] + v14, 0, (void *(__cdecl *)(void *))sub_2127FAE70, &v26);
    pthread_mutex_lock((pthread_mutex_t *)&v30[1]);
    while (DWORD2(v29))
      pthread_cond_wait((pthread_cond_t *)&v34[1], (pthread_mutex_t *)&v30[1]);
    pthread_mutex_unlock((pthread_mutex_t *)&v30[1]);
    v24.tv_sec = time(0) + 1;
    v24.tv_nsec = 0;
    pthread_mutex_lock((pthread_mutex_t *)&v34[7]);
    while (1)
    {
      pthread_cond_timedwait((pthread_cond_t *)&v34[15], (pthread_mutex_t *)&v34[7], &v24);
      if (v6)
        v16.n128_f32[0] = (float)((float)(uint64_t)(v37 + *((_QWORD *)&v36 + 1)) * 100.0) / (float)v6;
      else
        v16.n128_u32[0] = 1120403456;
      (*(void (**)(char *, __n128))(*(_QWORD *)a1 + 344))(a1, v16);
      v17 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 352))(a1);
      v18 = v17;
      v19 = BYTE8(v35) ? 1 : v17;
      if (v19 == 1)
        break;
      ++v24.tv_sec;
    }
    BYTE8(v35) = 1;
    if ((int)v29 >= 1)
    {
      v20 = 0;
      do
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v26 + 1) + 48))(*((_QWORD *)&v26 + 1));
        (*(void (**)(_QWORD))(*(_QWORD *)v26 + 48))(v26);
        ++v20;
      }
      while (v20 < (int)v29);
    }
    if (v18)
      v15 = 111;
    else
      v15 = 0;
    pthread_mutex_unlock((pthread_mutex_t *)&v34[7]);
    if ((int)v29 >= 1)
    {
      v21 = 0;
      do
      {
        pthread_join(*((pthread_t *)v30[0] + v21), &v25);
        if ((_DWORD)v15)
          v22 = 1;
        else
          v22 = v25 == 0;
        if (v22)
          v15 = v15;
        else
          v15 = v25;
        ++v21;
      }
      while (v21 < (int)v29);
    }
  }
  else
  {
    v15 = 12;
  }
  (*(void (**)(char *))(*(_QWORD *)a3 + 72))(a3);
  sub_2127F38CC(v28);
  v28 = 0;
  sub_2127F38CC(v27);
  v27 = 0;
  if ((_QWORD)v26)
    (*(void (**)(_QWORD))(*(_QWORD *)v26 + 8))(v26);
  if (*((_QWORD *)&v26 + 1))
    (*(void (**)(_QWORD))(**((_QWORD **)&v26 + 1) + 8))(*((_QWORD *)&v26 + 1));
  pthread_mutex_destroy((pthread_mutex_t *)&v30[1]);
  pthread_cond_destroy((pthread_cond_t *)&v34[1]);
  pthread_mutex_destroy((pthread_mutex_t *)&v34[7]);
  pthread_cond_destroy((pthread_cond_t *)&v34[15]);
  pthread_mutex_destroy(&v38);
  if (v30[0])
    free(v30[0]);
  return v15;
}

void sub_2127FA9B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FAA04(_QWORD **a1)
{
  uint64_t result;

  result = ((uint64_t (*)(_QWORD **))(*a1)[37])(a1);
  if (result)
    return *(_QWORD *)(*a1[113] + 16);
  return result;
}

uint64_t sub_2127FAA3C(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2C9F0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  pthread_cond_init((pthread_cond_t *)(a1 + 72), 0);
  *(_DWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = 0;
  *(_DWORD *)(a1 + 144) = 0;
  return a1;
}

uint64_t sub_2127FAA88(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2CA40;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 8), 0);
  *(_QWORD *)(a1 + 72) = 0;
  return a1;
}

uint64_t sub_2127FAAC0(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  int v5;
  int v6;

  v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    *(_QWORD *)(a2 + 72) = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(a1 + 128) = a2;
    v5 = *(_DWORD *)(a1 + 140);
    v6 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v6;
    if (v5)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "TAOQueue::push: _count is now %d\n", v6);
  }
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

uint64_t sub_2127FAB44(_QWORD *a1)
{
  pthread_mutex_t *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  int *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int *v14;
  BOOL v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  uint64_t v28;
  _QWORD *v29;

  v28 = 0;
  v29 = 0;
  v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  v3 = (*(uint64_t (**)(_QWORD, _QWORD **, _QWORD))(*(_QWORD *)*a1 + 32))(*a1, &v29, 0);
  if (v3)
    v4 = 1;
  else
    v4 = v29 == 0;
  if (v4)
  {
LABEL_54:
    if (v3)
      goto LABEL_55;
    goto LABEL_56;
  }
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)a1 + 5);
    v5 = a1[39];
    v6 = (int *)a1[49];
    v7 = *v6;
    if (*v6 == -1)
    {
      v10 = 0;
      LOBYTE(v9) = 0;
      v8 = 0;
      v12 = a1[39];
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 2048;
      v12 = a1[39];
      while (1)
      {
        v13 = *((_QWORD *)v6 + 2);
        if (!v13)
          break;
LABEL_12:
        v15 = (v7 - 2147483646) < 2 || v7 == 0;
        v16 = !v15 && v7 != 2;
        v17 = v15;
        if (v10)
        {
          if (v8 != v16 || v9 != v17)
            goto LABEL_37;
        }
        else
        {
          v9 = v17;
          v8 = v16;
        }
        v18 = *((_QWORD *)v6 + 1) + v13;
        v19 = v18 - v12;
        if (v8)
        {
          if (v19 >= v11)
            v20 = v11;
          else
            v20 = v18 - v12;
          v10 += v20;
          v12 += v20;
          if (v19 > v11)
          {
            v8 = 1;
            goto LABEL_37;
          }
          v11 -= v20;
        }
        else
        {
          v10 += v19;
          v12 = v18;
        }
        v21 = v6[10];
        v6 += 10;
        v7 = v21;
        a1[49] = v6;
        if (v21 == -1)
          goto LABEL_37;
      }
      v14 = v6 + 10;
      while (1)
      {
        v7 = *v14;
        if (*v14 == -1)
          break;
        v13 = *((_QWORD *)v14 + 2);
        v14 += 10;
        if (v13)
        {
          v6 = v14 - 10;
          a1[49] = v6;
          goto LABEL_12;
        }
      }
      a1[49] = v14;
    }
LABEL_37:
    a1[39] = v12;
    pthread_mutex_unlock((pthread_mutex_t *)a1 + 5);
    if (v5 >= a1[36] || v10 == 0)
    {
      v3 = 0;
      goto LABEL_56;
    }
    if (!v8)
    {
      (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)*a1 + 16))(*a1, v29);
      v24 = operator new();
      sub_2127FAA88(v24);
      *(_QWORD *)v24 = &off_24CE2AE90;
      *(_QWORD *)(v24 + 96) = 0;
      *(_QWORD *)(v24 + 104) = 0;
      *(_QWORD *)(v24 + 88) = 0;
      v28 = v10;
      v29 = (_QWORD *)v24;
      *(_BYTE *)(v24 + 112) = v9;
      goto LABEL_46;
    }
    v23 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, _QWORD))(*(_QWORD *)a1[2] + 48))(a1[2], a1[37] + v5, v10, &v28, v29[13]);
    if (v23)
    {
      v3 = v23;
      goto LABEL_55;
    }
    if (v28 != v10)
      break;
    v24 = (uint64_t)v29;
LABEL_46:
    *(_QWORD *)(v24 + 88) = v5;
    *(_QWORD *)(v24 + 96) = v10;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)a1[1] + 24))(a1[1], v24);
    v29 = 0;
    v25 = (*(uint64_t (**)(_QWORD, _QWORD **, _QWORD))(*(_QWORD *)*a1 + 32))(*a1, &v29, 0);
    if (v25)
      v26 = 1;
    else
      v26 = v29 == 0;
    if (v26)
    {
      v3 = v25;
      goto LABEL_54;
    }
  }
  v3 = 5;
LABEL_55:
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
LABEL_56:
  if (v29)
    (*(void (**)(_QWORD *))(*v29 + 8))(v29);
  return v3;
}

void sub_2127FAE4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4072491613);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FAE70(_QWORD *a1)
{
  pthread_mutex_t *v2;
  int v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v10;
  _QWORD *v11;

  v11 = 0;
  v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  v10 = a1[38];
  if (v10 >= a1[36])
  {
LABEL_12:
    v3 = 0;
  }
  else
  {
    while (1)
    {
      v3 = (*(uint64_t (**)(_QWORD, BOOL (*)(uint64_t, _QWORD *), uint64_t *, _QWORD **))(*(_QWORD *)a1[1] + 40))(a1[1], sub_2127FBF14, &v10, &v11);
      v4 = v11;
      if (v3 || v11 == 0)
        break;
      v6 = v11[12];
      a1[38] += v6;
      v7 = v4[13];
      if (v7)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)a1[3] + 56))(a1[3], v7, v6 << 9);
        v8 = v11;
        v11[11] = 0;
        v8[12] = 0;
        (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 16))(*a1);
      }
      else if (!*((_BYTE *)v4 + 112)
             || ((*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)a1[3] + 64))(a1[3], 0, v6 << 9),
                 (v4 = v11) != 0))
      {
        (*(void (**)(_QWORD *))(*v4 + 8))(v4);
      }
      v10 = a1[38];
      v11 = 0;
      if (v10 >= a1[36])
        goto LABEL_12;
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  if (v11)
    (*(void (**)(_QWORD *))(*v11 + 8))(v11);
  return v3;
}

uint64_t sub_2127FAFE4(uint64_t a1, uint64_t a2, char a3)
{
  pthread_mutex_t *v6;
  FILE **v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;

  v6 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *(_QWORD *)a2 = 0;
  if (*(_DWORD *)(a1 + 120))
    goto LABEL_12;
  v7 = (FILE **)MEMORY[0x24BDAC8D8];
  while (1)
  {
    if ((a3 & 1) == 0)
    {
      v8 = *(_DWORD *)(a1 + 144);
      if (*(_DWORD *)(a1 + 136) < v8)
      {
        if (*(_DWORD *)(a1 + 140))
          fprintf(*v7, "TAOQueue::dequeue: stalled _count=%d _reservePool=%d\n", *(_DWORD *)(a1 + 136), v8);
        goto LABEL_8;
      }
    }
    v9 = *(_QWORD *)(a1 + 128);
    if (v9)
      break;
LABEL_8:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), v6);
    if (*(_DWORD *)(a1 + 120))
      goto LABEL_12;
  }
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(*(_QWORD *)(a1 + 128) + 72);
  *(_QWORD *)(*(_QWORD *)a2 + 72) = 0;
  v10 = *(_DWORD *)(a1 + 140);
  v11 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v11;
  if (v10)
    fprintf(*v7, "TAOQueue::dequeue: _count is now %d\n", v11);
LABEL_12:
  pthread_mutex_unlock(v6);
  return 0;
}

uint64_t sub_2127FB0EC(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3, _QWORD *a4)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v12;
  int v13;
  int v14;

  if (!a2)
    return (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD))(*(_QWORD *)a1 + 32))(a1, a4, 0);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  *a4 = 0;
  if (*(_DWORD *)(a1 + 120))
    goto LABEL_17;
  v8 = (uint64_t *)(a1 + 128);
  while (1)
  {
    v9 = *v8;
    if (*v8)
      break;
LABEL_9:
    pthread_cond_wait((pthread_cond_t *)(a1 + 72), (pthread_mutex_t *)(a1 + 8));
    if (*(_DWORD *)(a1 + 120))
      goto LABEL_17;
  }
  if (a2(*v8, a3))
  {
    while (1)
    {
      v10 = v9;
      v9 = *(_QWORD *)(v9 + 72);
      if (!v9)
        goto LABEL_9;
      if (!a2(v9, a3))
        goto LABEL_13;
    }
  }
  v10 = 0;
LABEL_13:
  v12 = (_QWORD *)(v10 + 72);
  if (!v10)
    v12 = (_QWORD *)(a1 + 128);
  *v12 = *(_QWORD *)(v9 + 72);
  *(_QWORD *)(v9 + 72) = 0;
  *a4 = v9;
  v13 = *(_DWORD *)(a1 + 140);
  v14 = *(_DWORD *)(a1 + 136) - 1;
  *(_DWORD *)(a1 + 136) = v14;
  if (v13)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "TAOQueue::dequeueWithFilter: _count is now %d\n", v14);
LABEL_17:
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 8));
  return 0;
}

uint64_t sub_2127FB244(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, char *a5)
{
  pthread_rwlock_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *v20;
  char *v21;
  int v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  pthread_rwlock_t *v28;
  pthread_mutex_t *v30;
  void *__src;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _DWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v39 = 0;
  v9 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 160));
  v28 = v9;
  if (a5)
  {
    v10 = 0;
    if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1))
    {
      v11 = 22;
      if ((a3 & 0x8000000000000000) == 0)
      {
        v12 = *(_QWORD *)(a1 + 360);
        if (v12 >= a2 && a3 + a2 <= v12)
        {
          if (a3)
          {
            v10 = 0;
            v30 = (pthread_mutex_t *)(a1 + 944);
            while (1)
            {
              v37 = 0;
              v38 = 0;
              v35 = 0;
              v36 = 0;
              v33 = 0;
              v34 = 0;
              __src = 0;
              v32 = 0;
              v13 = *(_QWORD *)(a1 + 368);
              if (v13)
              {
                sub_2127FD820(v13);
                if (sub_2127FD828(*(_QWORD *)(a1 + 368), a2, a3, &v38, (uint64_t *)&__src))
                {
                  memmove(a5, __src, v38 << 9);
                  sub_2127FD8BC(*(_QWORD *)(a1 + 368));
                  goto LABEL_25;
                }
                sub_2127FD8BC(*(_QWORD *)(a1 + 368));
              }
              sub_2127FB630(a1, a2, &v37, (_DWORD *)&v37 + 1, &v35, &v34, &v33, &v32, &v36);
              v15 = v34;
              v14 = v35;
              v16 = a2 - v35;
              if (v34 - (a2 - v35) >= a3)
                v17 = a3;
              else
                v17 = v34 - (a2 - v35);
              v38 = v17;
              if (SHIDWORD(v37) >= -2147483639)
              {
                LODWORD(v11) = 999;
                switch(HIDWORD(v37))
                {
                  case 0xFFFFFFFF:
                    goto LABEL_43;
                  case 0:
                  case 2:
                    bzero(a5, v17 << 9);
                    goto LABEL_25;
                  case 1:
                    v24 = v33 + (v16 << 9);
                    v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
                    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(_QWORD *)v25
                                                                                                  + 328))(v25, v24, v17 << 9, &v39, a5);
                    break;
                  default:
                    if (HIDWORD(v37) == 2147483646)
                      goto LABEL_51;
                    v22 = (*(uint64_t (**)(uint64_t, _DWORD *, uint64_t, uint64_t, uint64_t *, char *))(*(_QWORD *)a1 + 576))(a1, v36, a2, v17, &v38, a5);
                    break;
                }
                LODWORD(v11) = v22;
                goto LABEL_43;
              }
              v18 = *(_QWORD *)(a1 + 368);
              v19 = pthread_mutex_trylock(v30);
              if (v18 || a2 != v14 || v17 != v15)
              {
                if (!v19)
                {
                  LODWORD(v11) = sub_2127FD8C4(a1, (uint64_t)v36, v37);
                  if (!(_DWORD)v11)
                    memmove(a5, (const void *)(*(_QWORD *)(a1 + 1008) + (v16 << 9)), v38 << 9);
                  pthread_mutex_unlock(v30);
                  goto LABEL_43;
                }
                v20 = (char *)malloc_type_malloc(*(_QWORD *)(a1 + 1016), 0x8DD0383DuLL);
                if (!v20)
                {
LABEL_40:
                  LODWORD(v11) = 12;
                  goto LABEL_43;
                }
                v21 = v20;
                LODWORD(v11) = sub_2127FB6D0((uint64_t *)a1, v36, v20, (uint64_t)&v20[*(_QWORD *)(a1 + 1016) - v32]);
                if (!(_DWORD)v11)
                  memmove(a5, &v21[512 * v16], v38 << 9);
                goto LABEL_39;
              }
              if (v19)
                goto LABEL_36;
              if (!*(_BYTE *)(a1 + 1024) || *(_DWORD *)(a1 + 1028) != (_DWORD)v37)
              {
                pthread_mutex_unlock(v30);
LABEL_36:
                v23 = (char *)malloc_type_malloc(*((_QWORD *)v36 + 4), 0xF44FC1EuLL);
                if (!v23)
                  goto LABEL_40;
                v21 = v23;
                LODWORD(v11) = sub_2127FB6D0((uint64_t *)a1, v36, a5, (uint64_t)v23);
                if ((_DWORD)v11)
                  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "__decompressChunk() error: %d", v11);
LABEL_39:
                free(v21);
                goto LABEL_43;
              }
              memmove(a5, *(const void **)(a1 + 1008), v38 << 9);
              pthread_mutex_unlock(v30);
LABEL_25:
              LODWORD(v11) = 0;
LABEL_43:
              v10 += v38;
              if ((_DWORD)v11)
                v26 = 0;
              else
                v26 = v38 == 0;
              if (v26)
                v11 = 999;
              else
                v11 = v11;
              if ((_DWORD)v11)
                goto LABEL_54;
              a3 -= v38;
              a2 += v38;
              a5 += 512 * v38;
LABEL_51:
              if (!a3)
              {
                v11 = 0;
                goto LABEL_54;
              }
            }
          }
          v11 = 0;
          v10 = 0;
        }
      }
    }
    else
    {
      v11 = 999;
    }
  }
  else
  {
    v10 = 0;
    v11 = 22;
  }
LABEL_54:
  if (a4)
    *a4 = v10;
  pthread_rwlock_unlock(v28);
  return v11;
}

uint64_t sub_2127FB630(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9)
{
  int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  int v16;

  v9 = 0;
  v10 = **(_QWORD **)(result + 904);
  v11 = *(_DWORD *)(v10 + 200) >> 1;
  v12 = v10 + 204;
  while (1)
  {
    v13 = *(_QWORD *)(v12 + 8);
    if (v13 <= a2 && *(_QWORD *)(v12 + 16) + v13 > a2)
      break;
    v14 = v13 <= a2;
    if (v13 <= a2)
      v15 = v11;
    else
      v15 = -(uint64_t)v11;
    if (v14)
      v16 = v11;
    else
      v16 = -v11;
    v9 += v16;
    v12 += 40 * v15;
    v11 >>= v11 > 1;
  }
  *a4 = *(_DWORD *)v12;
  *a3 = v9;
  *a5 = v13;
  *a6 = *(_QWORD *)(v12 + 48) - *(_QWORD *)(v12 + 8);
  *a7 = *(_QWORD *)(v12 + 24);
  *a8 = *(_QWORD *)(v12 + 32);
  if (a9)
    *a9 = v12;
  return result;
}

uint64_t sub_2127FB6D0(uint64_t *a1, _DWORD *a2, const void *a3, uint64_t a4)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FILE **v15;
  uint64_t v16;
  uint64_t v18;

  v8 = sub_2127FB834((uint64_t)a1, *a2);
  if (!v8)
    return 999;
  v9 = v8;
  v18 = 0;
  v10 = (*(uint64_t (**)(uint64_t *))(*a1 + 296))(a1);
  v11 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)v10 + 328))(v10, *((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), &v18, a4);
  if ((_DWORD)v11)
  {
    v12 = v11;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "__decompressChunk: backing store read at offset %qd length %qd failed with error %d\n", *((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4), v11);
  }
  else
  {
    v13 = (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD, const void *, _QWORD))(*v9 + 48))(v9, a4, a2[8], a3, (a2[4] << 9));
    if ((_DWORD)v13)
    {
      v14 = v13;
      v15 = (FILE **)MEMORY[0x24BDAC8D8];
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CUDIFDiskImage::__decompressChunk()__decompressChunk: decompressData failed with error %d\n", v13);
      fprintf(*v15, "chunk: %p\n->runType: %#x\n->sectorStart: %qd\n->sectorCount: %qd\n->compOffset: %qd\n->compLength: %qd\n", a2, *a2, *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2), *((_QWORD *)a2 + 3), *((_QWORD *)a2 + 4));
      sub_2128140E0(a2[8], a4);
      return v14;
    }
    else
    {
      v16 = a1[46];
      if (v16)
      {
        sub_2127FD930(v16);
        sub_2127FD938(a1[46], *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 2), a3);
        sub_2127FD8BC(a1[46]);
      }
      return 0;
    }
  }
  return v12;
}

_QWORD *sub_2127FB834(uint64_t a1, int a2)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 376);
  if (!v2)
  {
    switch(a2)
    {
      case -2147483648:
      case -2147483644:
        v2 = (_QWORD *)operator new();
        sub_21280DDAC();
        goto LABEL_9;
      case -2147483647:
        v2 = (_QWORD *)operator new();
        sub_212810FC0(v2, 10240);
        goto LABEL_9;
      case -2147483646:
        v2 = (_QWORD *)operator new();
        sub_212815224((uint64_t)v2);
        goto LABEL_9;
      case -2147483645:
        v2 = (_QWORD *)operator new();
        sub_212815370((uint64_t)v2);
        goto LABEL_9;
      case -2147483643:
        v2 = (_QWORD *)operator new();
        sub_2127FB9E0((uint64_t)v2);
        goto LABEL_9;
      case -2147483641:
        v2 = (_QWORD *)operator new();
        sub_2127FBA00((uint64_t)v2);
        *v2 = &unk_24CE2AEE8;
LABEL_9:
        *(_QWORD *)(a1 + 376) = v2;
        break;
      default:
        return v2;
    }
  }
  return v2;
}

void sub_2127FB970(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C4069E7AED5);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127FB9E0(uint64_t a1)
{
  _QWORD *result;

  result = sub_2127FBA00(a1);
  *result = &off_24CE29E48;
  return result;
}

_QWORD *sub_2127FBA00(uint64_t a1)
{
  _QWORD *result;

  result = (_QWORD *)sub_2127F3014(a1);
  *result = off_24CE29B58;
  return result;
}

uint64_t sub_2127FBA20(uint64_t a1, Bytef *a2, int a3, Bytef *a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;

  v8 = a5;
  v5 = a3;
  v6 = sub_2127FBA8C(a4, &v8, a2, a3);
  if ((_DWORD)v6)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "decompression failed; compressed chunk size %ld\n", v5);
  return v6;
}

uint64_t sub_2127FBA8C(Bytef *a1, unint64_t *a2, Bytef *a3, uint64_t a4)
{
  unint64_t v5;
  Bytef *v6;
  BOOL v8;
  unsigned int v9;
  char v10;
  Bytef *v11;
  unint64_t v12;
  Bytef *next_out;
  uLong total_out;
  char *v15;
  uInt v16;
  size_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uLong v21;
  size_t v22;
  unint64_t v23;
  uLong v24;
  char *v25;
  size_t v26;
  int v27;
  int v28;
  Bytef *v29;
  int v30;
  uLong *v31;
  int v32;
  unint64_t *v33;
  Bytef *v34;
  z_stream strm;

  v5 = *a2;
  memset(&strm, 0, sizeof(strm));
  if (a3 < a1)
  {
    if (&a3[a4 - 1] >= a1)
      return 1000;
    goto LABEL_7;
  }
  v6 = &a1[v5];
  if (&a1[v5] <= a3)
  {
LABEL_7:
    strm.next_in = a3;
    strm.avail_in = a4;
    strm.next_out = a1;
    strm.avail_out = v5;
    *a2 = 0;
    if (inflateInit_(&strm, "1.2.12", 112))
      return 1000;
    if (inflate(&strm, 4) != 1)
      goto LABEL_38;
    *a2 = strm.total_out;
    v8 = inflateEnd(&strm) == 0;
    v9 = 1000;
LABEL_10:
    if (v8)
      return 0;
    else
      return v9;
  }
  strm.next_in = a3;
  strm.avail_in = a4;
  strm.next_out = a1;
  strm.avail_out = (_DWORD)a3 - (_DWORD)a1;
  if (inflateInit_(&strm, "1.2.12", 112))
    return 1001;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  next_out = 0;
  total_out = 0;
  v15 = 0;
  v33 = a2;
  v34 = v6 - 1;
  v16 = LODWORD(strm.next_in) - LODWORD(strm.next_out);
  v17 = v5 >> 4;
  v18 = 2;
  while (1)
  {
    strm.avail_out = v16;
    if (v16 > 0x64)
      goto LABEL_21;
    if (v15)
      break;
    if ((v10 & 1) == 0)
    {
      if (v5 < 0x10)
        goto LABEL_38;
      v29 = (Bytef *)malloc_type_calloc(v17, 1uLL, 0x100004077774924uLL);
      if (!v29)
        return 1001;
      v11 = v29;
      next_out = strm.next_out;
      total_out = strm.total_out;
      strm.next_out = v29;
      strm.avail_out = v17;
      v30 = inflate(&strm, v18);
      if (v30 == 1)
      {
        v31 = v33;
LABEL_44:
        memmove(next_out, v11, strm.total_out - total_out);
        free(v11);
LABEL_45:
        v32 = inflateEnd(&strm);
        *v31 = strm.total_out;
        v8 = v32 == 0;
        v9 = 1001;
        goto LABEL_10;
      }
      if (v30 | strm.avail_out)
        goto LABEL_38;
      v15 = 0;
      v12 = v17;
      goto LABEL_30;
    }
    v19 = v34 - next_out;
    if (v34 - next_out >= v5)
      goto LABEL_38;
    v20 = v19 + 1;
    if (v12 > v19 + 1)
      goto LABEL_38;
    v21 = total_out;
    v22 = v17;
    v23 = v12;
    v24 = strm.total_out;
    v25 = (char *)malloc_type_calloc(v19 + 1, 1uLL, 0x100004077774924uLL);
    if (!v25)
      return 1001;
    v15 = v25;
    v26 = v24 - v21;
    memmove(v25, v11, v26);
    free(v11);
    v10 = 0;
    strm.next_out = (Bytef *)&v15[v26];
    strm.avail_out = v20 - v26;
    v18 = 4;
    v12 = v23;
    v17 = v22;
    total_out = v21;
LABEL_21:
    v27 = inflate(&strm, v18);
    if (v27 == 1)
    {
      if (v15)
      {
        memmove(next_out, v15, strm.total_out - total_out);
        free(v15);
        v31 = v33;
      }
      else
      {
        v31 = v33;
        if ((v10 & 1) != 0)
          goto LABEL_44;
      }
      goto LABEL_45;
    }
    if (v27 | strm.avail_out)
      goto LABEL_38;
    if ((v10 & 1) == 0)
    {
      v28 = (int)strm.next_out;
      goto LABEL_32;
    }
LABEL_30:
    v16 = 0;
    v10 = 1;
    if (strm.next_in - next_out >= (int64_t)(strm.total_out - total_out))
    {
      memmove(next_out, v11, strm.total_out - total_out);
      free(v11);
      v28 = (_DWORD)next_out + LODWORD(strm.total_out) - total_out;
      strm.next_out = &next_out[strm.total_out - total_out];
LABEL_32:
      v10 = 0;
      v16 = LODWORD(strm.next_in) - v28;
    }
  }
  if ((v10 & 1) != 0)
    free(v11);
  free(v15);
LABEL_38:
  inflateEnd(&strm);
  return 1000;
}

uint64_t sub_2127FBDEC(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  if (a2)
  {
    v5 = (_QWORD *)(a1 + 128);
    v6 = *(_QWORD *)(a1 + 128);
    while (v6)
    {
      v7 = v6;
      v6 = *(_QWORD *)(v6 + 72);
      if (!v6)
      {
        v5 = (_QWORD *)(v7 + 72);
        break;
      }
    }
    *v5 = a2;
    v8 = *(_DWORD *)(a1 + 140);
    v9 = *(_DWORD *)(a1 + 136) + 1;
    *(_DWORD *)(a1 + 136) = v9;
    if (v8)
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "TAOQueue::enqueue: _count is now %d\n", v9);
  }
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 72));
  return pthread_mutex_unlock(v4);
}

void sub_2127FBE84(_QWORD *a1)
{
  sub_2127FBEDC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FBEB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4072491613);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FBEDC(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24CE2AE90;
  v2 = (void *)a1[13];
  if (v2)
    free(v2);
  return sub_2127FBF28((uint64_t)a1);
}

BOOL sub_2127FBF14(uint64_t a1, _QWORD *a2)
{
  return *(_QWORD *)(a1 + 88) != *a2;
}

uint64_t sub_2127FBF28(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2CA40;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

uLong sub_2127FBF58(uint64_t a1, const Bytef *a2, uInt a3)
{
  uLong result;

  result = crc32(*(unsigned int *)(a1 + 112), a2, a3);
  *(_DWORD *)(a1 + 112) = result;
  return result;
}

uint64_t sub_2127FBF80(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(uint64_t);
  int v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD);

  if (*(_BYTE *)(a1 + 128))
    return 1;
  v3 = *(uint64_t (**)(uint64_t))(a1 + 120);
  if (v3)
  {
    v4 = v3(a1);
  }
  else
  {
    result = sub_2127FA258(a1);
    if (!result)
      return result;
    v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))sub_2127FA258(a1);
    v4 = v5(2, a1, 0, 0, 0, 0);
  }
  return v4 != 0;
}

uint64_t sub_2127FBFFC(_DWORD *a1)
{
  a1[30] = 1;
  return (*(uint64_t (**)(_DWORD *, _QWORD))(*(_QWORD *)a1 + 24))(a1, 0);
}

void sub_2127FC018(uint64_t a1)
{
  sub_2127FC070(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FC04C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FC070(uint64_t a1)
{
  pthread_mutex_t *v2;
  _QWORD *v3;
  _QWORD *v4;

  *(_QWORD *)a1 = &off_24CE2C9F0;
  v2 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  v3 = *(_QWORD **)(a1 + 128);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)v3[9];
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
      --*(_DWORD *)(a1 + 136);
      v3 = v4;
    }
    while (v4);
  }
  *(_QWORD *)(a1 + 128) = 0;
  pthread_mutex_unlock(v2);
  pthread_mutex_destroy(v2);
  pthread_cond_destroy((pthread_cond_t *)(a1 + 72));
  return a1;
}

CFStringRef sub_2127FC0FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFAllocator *v9;
  uint64_t v10;
  CFStringRef v11;
  const __CFAllocator *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const __CFAllocator *v17;
  uint64_t v18;
  CFStringRef v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a2 && a3)
  {
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 152))(a2, a3);
    v6 = DIGetBundleRef();
    if (v5)
    {
      v7 = CFSTR("verified   %1$@ %2$@");
LABEL_7:
      v8 = (const __CFString *)sub_21281FFEC(v6, (int)v7, v7);
      v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2);
      v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 120))(a2);
      v11 = CFStringCreateWithFormat(v9, 0, v8, v10, v21);
      goto LABEL_11;
    }
    v8 = (const __CFString *)sub_21281FFEC(v6, (int)CFSTR("calculated %1$@ %2$@, expected   %3$@ %4$@"), CFSTR("calculated %1$@ %2$@, expected   %3$@ %4$@"));
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 104))(a3);
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 120))(a3);
    v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 104))(a2);
    v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 120))(a2);
    v11 = CFStringCreateWithFormat(v12, 0, v8, v13, v14, v15, v23);
  }
  else
  {
    if (a2)
    {
      v6 = DIGetBundleRef();
      v7 = CFSTR("expected   %1$@ %2$@");
      goto LABEL_7;
    }
    if (!a3)
      return 0;
    v16 = DIGetBundleRef();
    v8 = (const __CFString *)sub_21281FFEC(v16, (int)CFSTR("calculated %1$@ %2$@"), CFSTR("calculated %1$@ %2$@"));
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 104))(a3);
    v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 120))(a3);
    v11 = CFStringCreateWithFormat(v17, 0, v8, v18, v22);
  }
LABEL_11:
  v19 = v11;
  if (v8)
    CFRelease(v8);
  return v19;
}

uint64_t sub_2127FC2D0(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  BOOL v13;
  _BOOL8 v14;
  _BOOL8 v16;

  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1);
  if (v4 != (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 128))(a2))
    return 0;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  if (v5 != (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 88))(a2))
    return 0;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  v7 = v6 >> 3;
  if ((v6 & 7) != 0)
    v8 = v7 + 1;
  else
    v8 = v7;
  if (!(_DWORD)v8)
    return 1;
  v9 = v6;
  v10 = (char *)malloc_type_malloc(v8, 0xDE9EE13DuLL);
  v11 = (char *)malloc_type_malloc(v8, 0x25ECD364uLL);
  v12 = v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)a1 + 96))(a1, v10, v9);
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)a2 + 96))(a2, v12, v9);
    v16 = strncmp(v10, v12, v8) == 0;
LABEL_17:
    free(v10);
    v14 = v16;
    goto LABEL_18;
  }
  v16 = 0;
  v14 = 0;
  if (v10)
    goto LABEL_17;
LABEL_18:
  if (v12)
    free(v12);
  return v14;
}

void *sub_2127FC430(unsigned int *a1, void *a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v6;
  size_t v7;
  unsigned int __src;

  v3 = a3;
  __src = bswap32(a1[28]);
  if ((*(unsigned int (**)(unsigned int *))(*(_QWORD *)a1 + 88))(a1) < a3)
    v3 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)a1 + 88))(a1);
  v6 = v3 >> 3;
  if ((v3 & 7) != 0)
    v7 = v6 + 1;
  else
    v7 = v6;
  return memcpy(a2, &__src, v7);
}

const __CFString *sub_2127FC4B0()
{
  return CFSTR("CRC32");
}

CFMutableStringRef sub_2127FC4BC(CFMutableStringRef *a1)
{
  uint64_t v2;
  unsigned int v3;
  size_t v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  char __str[3];

  v2 = ((uint64_t (*)(CFMutableStringRef *))(*a1)[2].length)(a1);
  v3 = v2 >> 3;
  if ((v2 & 7) != 0)
    v4 = v3 + 1;
  else
    v4 = v3;
  CFStringReplaceAll(a1[13], &stru_24CE2CFF0);
  if ((_DWORD)v2)
  {
    v5 = (unsigned __int8 *)malloc_type_malloc(v4, 0x1EE5DCF9uLL);
    if (v5)
    {
      v6 = v5;
      CFStringAppend(a1[13], CFSTR("$"));
      ((void (*)(CFMutableStringRef *, unsigned __int8 *, uint64_t))(*a1)[3].isa)(a1, v6, v2);
      if ((_DWORD)v4)
      {
        v7 = v6;
        do
        {
          v8 = *v7++;
          snprintf(__str, 3uLL, "%02hX", v8);
          CFStringAppendCString(a1[13], __str, 0x600u);
          LODWORD(v4) = v4 - 1;
        }
        while ((_DWORD)v4);
      }
      free(v6);
    }
  }
  return a1[13];
}

CFStringRef sub_2127FC5AC(const __CFString *a1, uint64_t a2, const __CFBoolean *a3)
{
  CFIndex v6;
  CFIndex Length;
  CFIndex v8;
  const __CFAllocator *v9;
  __CFString *Mutable;
  __CFString *v11;
  CFIndex v13;
  int Value;
  const __CFAllocator *v15;
  CFStringRef Copy;
  CFRange v17;

  if (!a1 || !a2)
    return 0;
  if (a2 >= 0)
    v6 = a2;
  else
    v6 = -a2;
  Length = CFStringGetLength(a1);
  v8 = v6 - Length;
  if (v6 > Length)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], v6);
    if (Mutable)
    {
      v11 = Mutable;
      if (a2 < 0)
      {
        CFStringAppend(Mutable, a1);
        CFStringPad(v11, CFSTR(" "), v6, 1);
      }
      else
      {
        CFStringPad(Mutable, CFSTR(" "), v8, 1);
        CFStringAppend(v11, a1);
      }
      Copy = CFStringCreateCopy(v9, v11);
      CFRelease(v11);
      return Copy;
    }
    return 0;
  }
  v13 = Length;
  Value = CFBooleanGetValue(a3);
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!Value || v6 == v13)
    return CFStringCreateCopy(v15, a1);
  v17.location = 0;
  v17.length = v6;
  return CFStringCreateWithSubstring(v15, a1, v17);
}

void sub_2127FC6F0(uint64_t a1, _DWORD *a2)
{
  unsigned int v4;
  int v5;
  unsigned int v6;

  *a2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  if (v4 >= 0x400)
    v5 = 1024;
  else
    v5 = v4;
  a2[1] = v5;
  (*(void (**)(uint64_t, _DWORD *, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2 + 2, 1024);
  v6 = a2[1] + 7;
  if (v6 <= 0x3FF)
    bzero((char *)a2 + (v6 >> 3) + 8, 128 - (v6 >> 3));
}

CFStringRef sub_2127FC798(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFStringRef v7;
  CFTypeID TypeID;
  uint64_t v9;
  const void *v10;
  CFTypeID v11;
  uint64_t v12;
  const void *v13;
  CFTypeID v14;
  uint64_t v15;
  const void *v16;
  CFTypeID v17;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
  if (!v2)
    return 0;
  v3 = (char *)v2;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (!v4)
    goto LABEL_13;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 488))(v4);
  if (!v5)
    goto LABEL_13;
  v6 = v5;
  v7 = (CFStringRef)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)v5 + 24))(v5, CFSTR("bs-persistentID"));
  if (v7)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v7))
    {
      v9 = (*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)v6 + 24))(v6, CFSTR("bs-modtime"));
      if (v9)
      {
        v10 = (const void *)v9;
        v11 = CFStringGetTypeID();
        if (v11 == CFGetTypeID(v10))
        {
          v12 = (*(uint64_t (**)(char *))(*(_QWORD *)v3 + 104))(v3);
          if (v12)
          {
            v13 = (const void *)v12;
            v14 = CFStringGetTypeID();
            if (v14 == CFGetTypeID(v13))
            {
              v15 = (*(uint64_t (**)(char *))(*(_QWORD *)v3 + 120))(v3);
              if (v15)
              {
                v16 = (const void *)v15;
                v17 = CFStringGetTypeID();
                if (v17 == CFGetTypeID(v16))
                {
                  v7 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@ @ %@ - %@:%@"), v7, v10, v13, v16);
                  goto LABEL_14;
                }
              }
            }
          }
        }
      }
    }
LABEL_13:
    v7 = 0;
  }
LABEL_14:
  DIDiskImageObjectRelease(v3);
  return v7;
}

uint64_t sub_2127FC918()
{
  return 0;
}

uint64_t DIDiskImageCopyChecksumReportString(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 376))(a1);
}

uint64_t DIDiskImageObjectGetProperty(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
}

uint64_t sub_2127FC938()
{
  return 0;
}

uint64_t DIDiskImageIsKernelCompatible(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
}

uint64_t sub_2127FC94C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(a1);
  if ((_DWORD)result)
  {
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 96))(v3);
  }
  return result;
}

uint64_t sub_2127FC99C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  int *i;

  v1 = *(uint64_t **)(a1 + 904);
  if (v1)
  {
    v2 = *v1;
    v3 = *(_DWORD *)(*v1 + 200);
    if (!v3)
      return 1;
    for (i = (int *)(v2 + 204); *i >= -2147483639 || ((0x15Fu >> *i) & 1) == 0; i += 10)
    {
      if (!--v3)
        return 1;
    }
  }
  return 0;
}

uint64_t sub_2127FC9F0(_QWORD *a1)
{
  uint64_t v2;

  if ((*(unsigned int (**)(_QWORD *))(*a1 + 688))(a1) && (v2 = a1[25]) != 0)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 96))(v2);
  else
    return 0;
}

BOOL sub_2127FCA3C(uint64_t a1)
{
  return *(_BYTE *)(a1 + 778) && *(_BYTE *)(a1 + 779) && !*(_BYTE *)(a1 + 780) && *(_QWORD *)(a1 + 456) <= 0x400000;
}

uint64_t sub_2127FCA6C()
{
  return 1;
}

__CFDictionary *sub_2127FCA74(uint64_t a1)
{
  uint64_t v2;
  CFAllocatorRef *v3;
  __CFDictionary *Mutable;
  __CFBundle *v5;
  __CFBundle *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFDataRef v9;
  CFDataRef v10;
  const __CFAllocator *v11;
  CFNumberRef v12;
  const void *v13;
  const void *v14;
  int v15;
  const void *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  CFNumberRef v21;
  uint64_t v23;
  uint64_t valuePtr;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  v3 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (v2 && (Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 456))(v2)) != 0
    || (Mutable = CFDictionaryCreateMutable(*v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
  {
    v5 = sub_2127FCEA0();
    if (v5)
    {
      v6 = v5;
      v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        v8 = v7;
        v9 = sub_2127FCE84(v7, 0x8000100u);
        if (v9)
        {
          v10 = v9;
          CFDictionarySetValue(Mutable, CFSTR("icon-path"), v9);
          CFRelease(v8);
          v8 = (const __CFString *)v10;
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    valuePtr = 512;
    v11 = *v3;
    v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("blocksize"), v12);
    if (v12)
      CFRelease(v12);
    v13 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(Mutable, CFSTR("image-type"), v13);
      CFRelease(v14);
    }
    v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1);
    v16 = (const void *)*MEMORY[0x24BDBD268];
    v17 = (const void *)*MEMORY[0x24BDBD270];
    if (v15)
      v18 = (const void *)*MEMORY[0x24BDBD268];
    else
      v18 = (const void *)*MEMORY[0x24BDBD270];
    CFDictionarySetValue(Mutable, CFSTR("write-protected"), v18);
    v19 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
    if (v19)
      CFDictionarySetValue(Mutable, CFSTR("backingstore-id"), v19);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 384))(a1))
      v20 = v17;
    else
      v20 = v16;
    CFDictionarySetValue(Mutable, CFSTR("image-encrypted"), v20);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1))
    {
      v23 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 232))(a1);
      v21 = CFNumberCreate(v11, kCFNumberLongLongType, &v23);
      CFDictionarySetValue(Mutable, CFSTR("virtual-band-size"), v21);
      CFRelease(v21);
    }
  }
  return Mutable;
}

uint64_t sub_2127FCCB8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 456))(result);
  return result;
}

__CFDictionary *sub_2127FCCD0(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void *v3;

  Mutable = sub_2127FCD58(a1);
  if (Mutable
    || (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
  {
    v3 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("bs-apple-quarantine-info"));
    if (v3)
      CFDictionarySetValue(Mutable, CFSTR("bs-apple-quarantine-info"), v3);
  }
  return Mutable;
}

__CFDictionary *sub_2127FCD58(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
    sub_212814774(a1, Mutable);
  return Mutable;
}

uint64_t sub_2127FCDB0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

const __CFURL *sub_2127FCDB8(CFURLRef relativeURL)
{
  const __CFURL *v1;
  CFURLRef v2;
  CFURLRef v3;
  const __CFURL *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFAllocator *v7;
  const __CFString *v8;
  CFStringRef Copy;

  v1 = relativeURL;
  if (!relativeURL)
    return v1;
  v2 = CFURLCopyAbsoluteURL(relativeURL);
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = v1;
  v5 = CFURLCopyScheme(v4);
  v6 = v5;
  if (!v5 || CFStringCompare(v5, CFSTR("file"), 0) == kCFCompareEqualTo)
  {
    Copy = CFURLCopyFileSystemPath(v4, kCFURLPOSIXPathStyle);
LABEL_10:
    v1 = (const __CFURL *)Copy;
    if (!v3)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (CFURLGetString(v1))
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v8 = CFURLGetString(v1);
    Copy = CFStringCreateCopy(v7, v8);
    goto LABEL_10;
  }
  v1 = 0;
  if (v3)
LABEL_11:
    CFRelease(v3);
LABEL_12:
  if (v6)
    CFRelease(v6);
  return v1;
}

CFDataRef sub_2127FCE84(CFStringRef theString, CFStringEncoding encoding)
{
  return CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], theString, encoding, 0);
}

__CFBundle *sub_2127FCEA0()
{
  __CFBundle *result;

  result = (__CFBundle *)DIGetBundleRef();
  if (result)
    return CFBundleCopyResourceURL(result, CFSTR("CDiskImage"), CFSTR("icns"), 0);
  return result;
}

const __CFString *sub_2127FCED4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  int v3;
  const __CFString *result;
  int *i;
  int v6;

  v1 = *(uint64_t **)(a1 + 904);
  if (!v1)
    return CFSTR("UDIF read-only");
  v2 = *v1;
  v3 = *(_DWORD *)(*v1 + 200);
  if (!v3)
    return CFSTR("UDIF read-only");
  result = CFSTR("UDIF read-only compressed (bzip2)");
  for (i = (int *)(v2 + 204); ; i += 10)
  {
    v6 = *i;
    if (*i != -1)
      break;
LABEL_7:
    if (!--v3)
      return CFSTR("UDIF read-only");
  }
  switch(v6)
  {
    case -2147483644:
      result = CFSTR("UDIF read-only compressed (ADC)");
      break;
    case -2147483643:
      result = CFSTR("UDIF read-only compressed (zlib)");
      break;
    case -2147483642:
      return result;
    case -2147483641:
      result = CFSTR("UDIF read-only compressed (lzfse)");
      break;
    case -2147483640:
      result = CFSTR("UDIF read-only compressed (lzma)");
      break;
    default:
      if ((v6 & 0x80000000) == 0)
        goto LABEL_7;
      result = CFSTR("UDIF read-only compressed");
      break;
  }
  return result;
}

uint64_t sub_2127FCF94(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 148);
}

uint64_t sub_2127FCF9C(_QWORD *a1)
{
  uint64_t result;
  const void *v3;

  result = a1[19];
  if (!result)
  {
    v3 = (const void *)(*(uint64_t (**)(_QWORD *))(*a1 + 192))(a1);
    (*(void (**)(_QWORD *, const void *))(*a1 + 504))(a1, v3);
    if (v3)
      CFRelease(v3);
    return a1[19];
  }
  return result;
}

__CFDictionary *sub_2127FCFF8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFArray *v4;
  CFTypeID v5;
  CFTypeID TypeID;
  const __CFAllocator *v7;
  CFArrayRef v8;
  CFArrayRef v9;
  int v10;
  __CFDictionary *Mutable;
  __CFDictionary *v12;
  const __CFString *v13;
  void *values;

  if (!(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1))
    return 0;
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  v3 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  values = v3;
  if (!v3)
    return 0;
  v4 = (const __CFArray *)v3;
  v5 = CFGetTypeID(v3);
  TypeID = CFArrayGetTypeID();
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8 = v5 == TypeID
     ? CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v4)
     : CFArrayCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&values, 1, MEMORY[0x24BDBD690]);
  v9 = v8;
  if (!v8)
    return 0;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1);
  Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v12 = Mutable;
  if (Mutable)
  {
    if (v10)
      v13 = CFSTR("writeable-components");
    else
      v13 = CFSTR("readonly-components");
    CFDictionarySetValue(Mutable, v13, v9);
  }
  CFRelease(v9);
  return v12;
}

void sub_2127FD11C(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 152);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 152) = cf;
}

uint64_t sub_2127FD158(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 136);
  if (!v1)
    return 0;
  LOBYTE(v2) = 0;
  do
  {
    if ((_BYTE)v2)
      v2 = 1;
    else
      v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 104))(v1);
    v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 496))(v1);
  }
  while (v1);
  return v2;
}

uint64_t sub_2127FD1C4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 104))(result);
  return result;
}

uint64_t sub_2127FD1DC()
{
  return 0;
}

uint64_t sub_2127FD1E4()
{
  return 0;
}

__CFDictionary *sub_2127FD1EC(uint64_t a1)
{
  uint64_t v2;
  CFAllocatorRef *v3;
  __CFDictionary *Mutable;
  __CFBundle *v5;
  __CFBundle *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFDataRef v9;
  CFDataRef v10;
  const __CFAllocator *v11;
  CFNumberRef v12;
  CFNumberRef v13;
  const void *v14;
  const void *v15;
  int v16;
  const void *v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  CFNumberRef v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t valuePtr;

  v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  v3 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (v2 && (Mutable = (__CFDictionary *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 464))(v2)) != 0
    || (Mutable = CFDictionaryCreateMutable(*v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
  {
    v5 = sub_2127FCEA0();
    if (v5)
    {
      v6 = v5;
      v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
      if (v7)
      {
        v8 = v7;
        v9 = sub_2127FCE84(v7, 0x8000100u);
        if (v9)
        {
          v10 = v9;
          CFDictionarySetValue(Mutable, CFSTR("icon-path"), v9);
          CFRelease(v8);
          v8 = (const __CFString *)v10;
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    valuePtr = 512;
    v11 = *v3;
    v12 = CFNumberCreate(*v3, kCFNumberSInt64Type, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("blocksize"), v12);
    if (v12)
      CFRelease(v12);
    v13 = CFNumberCreate(v11, kCFNumberSInt64Type, &v25);
    CFDictionarySetValue(Mutable, CFSTR("blockcount"), v13);
    if (v13)
      CFRelease(v13);
    v14 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
    if (v14)
    {
      v15 = v14;
      CFDictionarySetValue(Mutable, CFSTR("image-type"), v14);
      CFRelease(v15);
    }
    v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
    if (v16 == 1430541391 || v16 == 1430538566)
    {
      v17 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(Mutable, CFSTR("image-format-read-only"), (const void *)*MEMORY[0x24BDBD270]);
      v18 = (const void *)*MEMORY[0x24BDBD268];
    }
    else
    {
      v18 = (const void *)*MEMORY[0x24BDBD268];
      CFDictionarySetValue(Mutable, CFSTR("image-format-read-only"), (const void *)*MEMORY[0x24BDBD268]);
      v17 = (const void *)*MEMORY[0x24BDBD270];
    }
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1))
      v19 = v18;
    else
      v19 = v17;
    CFDictionarySetValue(Mutable, CFSTR("write-protected"), v19);
    v20 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
    if (v20)
      CFDictionarySetValue(Mutable, CFSTR("backingstore-id"), v20);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 384))(a1))
      v21 = v17;
    else
      v21 = v18;
    CFDictionarySetValue(Mutable, CFSTR("image-encrypted"), v21);
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1))
    {
      v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 232))(a1);
      v22 = CFNumberCreate(v11, kCFNumberLongLongType, &v24);
      CFDictionarySetValue(Mutable, CFSTR("virtual-band-size"), v22);
      CFRelease(v22);
    }
  }
  return Mutable;
}

uint64_t sub_2127FD4EC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 464))(result);
  return result;
}

__CFDictionary *sub_2127FD504(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void *v3;

  Mutable = sub_2127FD5A4(a1);
  if (Mutable
    || (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
  {
    CFDictionaryAddValue(Mutable, CFSTR("Physical Interconnect Location"), CFSTR("File"));
    v3 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("bs-apple-quarantine-info"));
    if (v3)
      CFDictionarySetValue(Mutable, CFSTR("bs-apple-quarantine-info"), v3);
  }
  return Mutable;
}

__CFDictionary *sub_2127FD5A4(uint64_t a1)
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
    sub_212814774(a1, Mutable);
  return Mutable;
}

uint64_t sub_2127FD600(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = &off_24CE2BEE0;
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 8), 0);
  *(_DWORD *)(a1 + 208) = a2;
  *(_QWORD *)(a1 + 216) = malloc_type_calloc(a2, 8uLL, 0x2004093837F09uLL);
  if (*(int *)(a1 + 208) >= 1)
  {
    v4 = 0;
    do
    {
      v5 = operator new();
      *(_QWORD *)(v5 + 8) = 0;
      *(_QWORD *)(v5 + 16) = 0;
      *(_QWORD *)v5 = &off_24CE2BF00;
      *(_BYTE *)(v5 + 24) = 0;
      *(_QWORD *)(v5 + 40) = 0;
      *(_QWORD *)(v5 + 48) = 0;
      *(_QWORD *)(v5 + 32) = 0;
      *(_QWORD *)(v5 + 56) = malloc_type_malloc(0, 0x79FF33EAuLL);
      *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8 * v4++) = v5;
    }
    while (v4 < *(int *)(a1 + 208));
  }
  return a1;
}

void sub_2127FD6D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x1081C405D66F177);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FD6FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 200);
  if (!v2)
    return *(_BYTE *)(a1 + 192) != 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 664))(v2);
  *(_BYTE *)(a1 + 192) = result;
  return result;
}

uint64_t sub_2127FD740(_DWORD *a1, uint64_t a2)
{
  int v4;
  int v5;
  int v6;

  v4 = a1[80];
  if (v4 < 0
    || (v5 = fcntl(v4, 3, 0), v5 != -1)
    && (!(_DWORD)a2 ? (v6 = 0) : (v6 = 128), fcntl(a1[80], 4, v5 & 0xFFFFFF7F | v6) != -1))
  {
    sub_2127FD808((uint64_t)a1, a2);
    if ((*(unsigned int (**)(_DWORD *))(*(_QWORD *)a1 + 72))(a1))
    {
      if ((_DWORD)a2)
      {
        (*(void (**)(_DWORD *, uint64_t))(*(_QWORD *)a1 + 472))(a1, 1);
        sub_2127F3C0C((uint64_t)a1);
      }
      else
      {
        sub_2127F3128(a1, 4, 0x100000uLL);
      }
    }
  }
  return *((unsigned __int8 *)a1 + 192);
}

uint64_t sub_2127FD808(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a1 + 192) = a2;
  return a2;
}

uint64_t DIDiskImageReadSectors(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
}

uint64_t sub_2127FD820(uint64_t a1)
{
  return pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_2127FD828(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v5 = *(unsigned int *)(a1 + 208);
  if ((int)v5 < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 8 * v5;
    do
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + v6);
      if (v9 && *(_BYTE *)(v9 + 24))
      {
        v10 = *(_QWORD *)(v9 + 32);
        v11 = *(_QWORD *)(v9 + 40) + v10;
        ++*(_QWORD *)(v9 + 16);
        v12 = __OFSUB__(a2, v10);
        v13 = a2 - v10;
        if (v13 < 0 == v12 && v11 > a2)
        {
          if (v11 - a2 >= a3)
            v15 = a3;
          else
            v15 = v11 - a2;
          v16 = *(_QWORD *)(v9 + 56) + (v13 << 9);
          v7 = 1;
          ++*(_QWORD *)(v9 + 8);
          *(_QWORD *)(v9 + 16) = 1;
          *a4 = v15;
          *a5 = v16;
        }
      }
      v6 += 8;
    }
    while (v8 != v6);
  }
  return v7 & 1;
}

uint64_t sub_2127FD8BC(uint64_t a1)
{
  return pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_2127FD8C4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 1024) && *(_DWORD *)(a1 + 1028) == a3)
    return 0;
  *(_BYTE *)(a1 + 1024) = 0;
  result = sub_2127FB6D0((uint64_t *)a1, (_DWORD *)a2, *(const void **)(a1 + 1008), *(_QWORD *)(a1 + 1008) + *(_QWORD *)(a1 + 1016) - *(_QWORD *)(a2 + 32));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(a1 + 1028) = a3;
    *(_BYTE *)(a1 + 1024) = 1;
  }
  return result;
}

uint64_t sub_2127FD930(uint64_t a1)
{
  return pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 8));
}

uint64_t sub_2127FD938(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = sub_2127FD9F0(a1, a3);
  if (!v8)
    return 0;
  v9 = v8;
  *(_BYTE *)(v8 + 24) = 0;
  *(int64x2_t *)(v8 + 8) = vdupq_n_s64(1uLL);
  *(_QWORD *)(v8 + 32) = a2;
  v10 = sub_2127FDAF0(v8, a3);
  if ((_DWORD)v10)
  {
    fwrite("CUDIFCacheObject::cacheData: setLength failed\n", 0x2EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    sub_21281D730(a1);
  }
  else
  {
    memcpy(*(void **)(v9 + 56), a4, a3 << 9);
    *(_BYTE *)(v9 + 24) = 1;
  }
  return v10;
}

uint64_t sub_2127FD9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(unsigned int *)(a1 + 208);
  if ((int)v2 < 1)
    return 0;
  v5 = 0;
  v6 = *(_QWORD *)(a1 + 216);
  v7 = -1;
  v8 = 0x8000000000000000;
  while (1)
  {
    v9 = *(_QWORD *)(v6 + 8 * v5);
    if (v9)
      break;
LABEL_8:
    if (v2 == ++v5)
    {
      if ((v7 & 0x80000000) != 0)
        return 0;
      return *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8 * v7);
    }
  }
  if (*(_BYTE *)(v9 + 24) || *(_QWORD *)(v9 + 48) < a2)
  {
    v10 = sub_2127FDA98(v9);
    if (v10 > v8)
    {
      v7 = v5;
      v8 = v10;
    }
    goto LABEL_8;
  }
  v7 = v5;
  if ((v5 & 0x80000000) == 0)
    return *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8 * v7);
  return 0;
}

uint64_t sub_2127FDA98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  if (!*(_BYTE *)(a1 + 24))
    return *(_QWORD *)(a1 + 48) + 0x7FFFFFFFLL;
  v1 = 0;
  v2 = 0;
  v3 = *(_QWORD *)(a1 + 40);
  do
  {
    if ((v3 & 1) != 0)
      v2 = v1;
    ++v1;
    v3 >>= 1;
  }
  while (v1 != 64);
  if (*(_QWORD *)(a1 + 16) - (v2 + 2 * *(_QWORD *)(a1 + 8)) >= 0x7FFFFFFF)
    return 0x7FFFFFFFLL;
  else
    return *(_QWORD *)(a1 + 16) - (v2 + 2 * *(_QWORD *)(a1 + 8));
}

uint64_t sub_2127FDAF0(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD *v5;
  void *v6;
  uint64_t result;

  if (*(_QWORD *)(a1 + 48) >= a2)
  {
    v5 = (_QWORD *)(a1 + 40);
    goto LABEL_7;
  }
  v4 = *(void **)(a1 + 56);
  if (v4)
    free(v4);
  *(_QWORD *)(a1 + 40) = 0;
  v5 = (_QWORD *)(a1 + 40);
  *(_BYTE *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  v6 = malloc_type_malloc(a2 << 9, 0x290B651AuLL);
  if (v6)
  {
    *(_QWORD *)(a1 + 48) = a2;
    *(_QWORD *)(a1 + 56) = v6;
LABEL_7:
    result = 0;
    *v5 = a2;
    return result;
  }
  return 12;
}

uint64_t sub_2127FDB70(io_object_t object, CFStringRef *a2)
{
  const __CFAllocator *v4;
  CFTypeRef CFProperty;
  const void *v6;
  CFStringRef v7;
  uint64_t v8;

  if (!a2)
    return 22;
  *a2 = 0;
  if (!object)
    return 22;
  if (!IOObjectConformsTo(object, "IOMedia"))
    return 3758097090;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CFProperty = IORegistryEntryCreateCFProperty(object, CFSTR("BSD Name"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    v7 = CFStringCreateWithFormat(v4, 0, CFSTR("/dev/%@"), CFProperty);
    if (v7)
      v8 = 0;
    else
      v8 = 4294962336;
    *a2 = v7;
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
    *a2 = 0;
  }
  return v8;
}

uint64_t sub_2127FDC40(const void *a1, CFTypeRef *a2, _WORD *a3, _QWORD *a4)
{
  uint64_t v6;
  int v7;
  int v8;
  statfs *i;
  const __CFString *v10;
  const __CFString *v11;
  CFStringRef v12;
  CFStringRef v13;
  statfs *v15;

  v15 = 0;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a1)
    return 22;
  v6 = 2;
  v7 = getmntinfo(&v15, 2);
  if (v7 >= 1)
  {
    v8 = v7;
    for (i = v15; ; ++i)
    {
      v10 = sub_2128136C4((uint64_t)i);
      if (v10)
      {
        v11 = v10;
        if (CFEqual(v10, a1))
        {
          v12 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], i->f_mntonname, 0x8000100u);
          if (v12)
          {
            v13 = v12;
            if (a2)
              *a2 = CFRetain(v12);
            CFRelease(v11);
            v6 = 0;
          }
          else
          {
            v6 = 4294962336;
            v13 = v11;
          }
          CFRelease(v13);
          return v6;
        }
        CFRelease(v11);
      }
      if (!--v8)
        return 2;
    }
  }
  return v6;
}

void sub_2127FDD50(uint64_t a1)
{
  sub_2127FDDA8(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FDD84(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127FDDA8(uint64_t a1)
{
  void **v2;
  void *v3;
  uint64_t v4;
  char *v5;

  *(_QWORD *)a1 = &off_24CE2A988;
  v2 = *(void ***)(a1 + 904);
  if (v2)
    sub_212820098(v2);
  *(_QWORD *)(a1 + 904) = 0;
  sub_2127FDE44(a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 944));
  v3 = *(void **)(a1 + 1008);
  if (v3)
    free(v3);
  v4 = *(_QWORD *)(a1 + 368);
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = *(char **)(a1 + 376);
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    *(_QWORD *)(a1 + 376) = 0;
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 160));
  return sub_2127FE034((_QWORD *)a1);
}

void sub_2127FDE2C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

void sub_2127FDE44(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const void *v4;

  v2 = *(void **)(a1 + 928);
  if (v2)
  {
    if (*(__int16 *)(a1 + 912) >= 1)
    {
      v3 = 0;
      do
      {
        sub_212820098(*(void ***)(*(_QWORD *)(a1 + 928) + 8 * v3));
        *(_QWORD *)(*(_QWORD *)(a1 + 928) + 8 * v3++) = 0;
      }
      while (v3 < *(__int16 *)(a1 + 912));
      v2 = *(void **)(a1 + 928);
    }
    free(v2);
  }
  *(_QWORD *)(a1 + 928) = 0;
  v4 = *(const void **)(a1 + 936);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 936) = 0;
  }
  *(_DWORD *)(a1 + 912) = 0;
  *(_WORD *)(a1 + 916) = 0;
}

void sub_2127FDEC0(uint64_t a1)
{
  sub_2127FDF18(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FDEF4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x1081C406A7D350BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FDF18(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t i;
  uint64_t v5;

  *(_QWORD *)a1 = &off_24CE2BEE0;
  v2 = *(void **)(a1 + 216);
  if (v2)
  {
    v3 = *(_DWORD *)(a1 + 208);
    if (v3 >= 1)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = *(_QWORD *)(*(_QWORD *)(a1 + 216) + 8 * i);
        if (v5)
        {
          (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
          v3 = *(_DWORD *)(a1 + 208);
        }
      }
      v2 = *(void **)(a1 + 216);
    }
    free(v2);
  }
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 8));
  return a1;
}

void sub_2127FDF94(_QWORD *a1)
{
  void *v1;

  *a1 = &off_24CE2BF00;
  v1 = (void *)a1[7];
  if (v1)
    free(v1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FDFDC()
{
  sub_2127F8BD8();
  JUMPOUT(0x212BF43D0);
}

void sub_2127FE010(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127FE034(_QWORD *a1)
{
  char *v2;
  const void *v3;

  *a1 = off_24CE29EA8;
  v2 = (char *)a1[17];
  if (v2)
    DIDiskImageObjectRelease(v2);
  a1[17] = 0;
  v3 = (const void *)a1[19];
  if (v3)
  {
    CFRelease(v3);
    a1[19] = 0;
  }
  return sub_2127F3E08(a1);
}

void sub_2127FE080(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

void sub_2127FE098(uint64_t a1)
{
  sub_2127FE0F0(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2127FE0CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40C363EFF1);
  _Unwind_Resume(a1);
}

uint64_t sub_2127FE0F0(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2B890;
  if (sub_2127F3B98(a1))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 280))(a1, 1);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 592))(a1))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 368))(a1, 1);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 616))(a1))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 352))(a1, 1);
  *(_OWORD *)(a1 + 744) = 0u;
  *(_OWORD *)(a1 + 760) = 0u;
  return sub_2127FE1AC(a1);
}

void sub_2127FE194(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127FE1AC(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_2127FE1B0(char **a1)
{
  *a1 = (char *)&off_24CE2AF50;
  if (sub_2127F3B98((uint64_t)a1))
    (*((void (**)(char **, uint64_t))*a1 + 35))(a1, 1);
  if ((*((unsigned int (**)(char **))*a1 + 74))(a1))
    (*((void (**)(char **, uint64_t))*a1 + 46))(a1, 1);
  if ((*((unsigned int (**)(char **))*a1 + 77))(a1))
    (*((void (**)(char **, uint64_t))*a1 + 44))(a1, 1);
  sub_2127F38CC(a1[25]);
  return sub_2127F3D40((uint64_t)a1);
}

void sub_2127FE250(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3D40(v1);
  _Unwind_Resume(a1);
}

uint64_t DIGetPluginPropertyDicts()
{
  return qword_254B5AD48;
}

uint64_t sub_2127FE278(const __CFURL *a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  const __CFString *Value;
  const __CFString *v6;
  CFTypeID v7;
  CFTypeID v8;
  const __CFString *v10;
  const __CFString *v11;

  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CSparseDiskImage")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CSparseDiskImage")) > 0)
    return 1000;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("create-image-type"));
  if (Value)
  {
    v6 = Value;
    v7 = CFGetTypeID(Value);
    if (v7 == CFStringGetTypeID())
    {
      if (CFStringCompare(v6, CFSTR("SPARSE"), 0))
        return 4294966296;
      else
        return 1000;
    }
    v8 = CFGetTypeID(v6);
    if (v8 == CFStringGetTypeID())
    {
      CFStringCompare(v6, CFSTR("SPARSEBUNDLE"), 0);
      return 4294966296;
    }
  }
  v10 = CFURLCopyPathExtension(a1);
  if (!v10)
    return 1;
  v11 = v10;
  if (CFStringCompare(v10, CFSTR("sparseimage"), 1uLL))
    v4 = 1;
  else
    v4 = 1000;
  CFRelease(v11);
  return v4;
}

uint64_t sub_2127FE3A8(const __CFURL *a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  const __CFString *Value;
  const __CFString *v6;
  CFTypeID v7;
  const __CFString *v8;
  const __CFString *v9;

  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRawDiskImage")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CRawDiskImage")) > 0)
    return 1000;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("create-image-type"));
  if (Value && (v6 = Value, v7 = CFGetTypeID(Value), v7 == CFStringGetTypeID()))
  {
    v4 = 1000;
    if (CFStringCompare(v6, CFSTR("UDIF"), 0))
    {
      if (CFStringCompare(v6, CFSTR("UDTO"), 0))
        v4 = 4294966296;
      else
        v4 = 1000;
    }
    if (CFStringCompare(v6, CFSTR("UNIV"), 0) == kCFCompareEqualTo)
    {
      if (CFDictionaryGetValue(theDict, CFSTR("hybrid-image-source-array")))
        return 9999;
      else
        return 4294966296;
    }
  }
  else
  {
    v8 = CFURLCopyPathExtension(a1);
    if (v8)
    {
      v9 = v8;
      if (CFStringCompare(v8, CFSTR("dmg"), 1uLL) && CFStringCompare(v9, CFSTR("cdr"), 1uLL))
        v4 = 100;
      else
        v4 = 1000;
      CFRelease(v9);
    }
    else
    {
      return 100;
    }
  }
  return v4;
}

CFURLRef sub_2127FE518(CFURLRef url, const __CFString *a2, int a3)
{
  const __CFURL *v3;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v9;
  const __CFURL *v10;
  const __CFURL *v11;

  v3 = url;
  if (url)
  {
    v6 = CFURLCopyPathExtension(url);
    if (!v6)
      return sub_212806CBC(*MEMORY[0x24BDBD240], v3, a2, a3);
    v7 = v6;
    if (CFStringCompare(v6, a2, 1uLL))
    {
      v3 = sub_212806CBC(*MEMORY[0x24BDBD240], v3, a2, a3);
    }
    else if (CFURLHasDirectoryPath(v3) == a3)
    {
      CFRetain(v3);
    }
    else
    {
      v9 = *MEMORY[0x24BDBD240];
      v10 = CFURLCreateCopyDeletingPathExtension((CFAllocatorRef)*MEMORY[0x24BDBD240], v3);
      if (v10)
      {
        v11 = v10;
        v3 = sub_212806CBC(v9, v10, a2, a3);
        CFRelease(v11);
      }
      else
      {
        v3 = 0;
      }
    }
    CFRelease(v7);
  }
  return v3;
}

const void *sub_2127FE630(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_2127FE66C(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, _QWORD *a6, CFTypeRef *a7)
{
  uint64_t v14;
  CFMutableStringRef Mutable;
  __CFString *v16;
  unsigned int v17;
  char *v19;
  CFTypeRef cf;
  char *v21;

  cf = 0;
  v21 = 0;
  v19 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  v14 = 22;
  if (a1 && a2 && a6)
  {
    if (sub_2127F1434())
    {
      Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
      if (Mutable)
      {
        v16 = Mutable;
        v17 = 2;
        while (1)
        {
          if (((a3 >> v17) & 1) != 0)
          {
            if (cf)
            {
              CFRelease(cf);
              cf = 0;
            }
            v14 = sub_2127FE838(v17, a1, a2, a4, a5, (uint64_t)&v19, (uint64_t)&cf);
            if (cf)
              CFStringAppend(v16, (CFStringRef)cf);
            if ((_DWORD)v14 != 110)
              break;
          }
          if (--v17 == -1)
          {
            if (cf)
            {
              CFRelease(cf);
              cf = 0;
            }
            v14 = sub_2127FEA90(a1, a2, a4, a5, (uint64_t)&v21, (uint64_t)&cf);
            if (cf)
              CFStringAppend(v16, (CFStringRef)cf);
            if ((_DWORD)v14 && v21)
            {
              DIDiskImageObjectRelease(v21);
              v21 = 0;
            }
            goto LABEL_29;
          }
        }
        if (!(_DWORD)v14)
          v21 = v19;
LABEL_29:
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
        *a6 = v21;
        if (a7)
        {
          *a7 = v16;
          if (!CFStringGetLength(v16) && *a7)
          {
            CFRelease(*a7);
            *a7 = 0;
          }
        }
        else
        {
          CFRelease(v16);
        }
      }
      else
      {
        return 999;
      }
    }
    else
    {
      return 119;
    }
  }
  return v14;
}

uint64_t sub_2127FE838(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (**v7)();
  unsigned int v14;
  int v15;
  uint64_t *v16;
  unsigned int v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  uint64_t (*v21)();
  uint64_t v23;

  if (a1 > 2)
    return 110;
  v7 = off_24CE29010[a1];
  if (!v7[5])
    return 110;
  v14 = 0;
  v15 = 0;
  v23 = (int)a1;
  v16 = (uint64_t *)(v7 + 12);
  v17 = -1;
  do
  {
    v18 = (uint64_t (*)(uint64_t, uint64_t))*(v16 - 9);
    if (v18)
    {
      v19 = v18(a2, a3);
      if (v19 > v15)
      {
        v17 = v14;
        v15 = v19;
      }
    }
    ++v14;
    v20 = *v16;
    v16 += 7;
  }
  while (v20);
  if ((v17 & 0x80000000) != 0)
    return 110;
  v21 = off_24CE29010[v23][7 * v17 + 4];
  if (v21)
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21)(a2, a3, a4, a5, a6, a7);
  else
    return 78;
}

uint64_t sub_2127FE958(int a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v5;
  CFTypeID TypeID;
  char v7;

  if ((sub_2127F29C0(theDict, CFSTR("fileencoding-class"), CFSTR("CEncryptedEncoding")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("fileencoding-class"), CFSTR("CEncryptedEncoding")) > 0)
    return 1000;
  if (!theDict)
    return 4294966296;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("encryption-class"));
  if (!Value)
    return 4294966296;
  v5 = Value;
  v7 = 0;
  if (sub_2127F1508(Value, &v7))
  {
    if (v7)
      return 1000;
    else
      return 4294966296;
  }
  else
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v5))
    {
      if (CFStringCompare(v5, CFSTR("AES-128"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, CFSTR("CEncryptedEncoding"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v5, CFSTR("AES-256"), 1uLL) == kCFCompareEqualTo)
      {
        return 1000;
      }
      if (CFStringCompare(v5, &stru_24CE2CFF0, 1uLL))
        return 1;
      else
        return 4294966296;
    }
    else
    {
      return 1;
    }
  }
}

uint64_t sub_2127FEA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v11;
  unsigned int v12;
  __CFString **v13;
  unsigned int v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  int v16;
  __CFString *v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  if (!off_254B5A9A8)
    return 110;
  v11 = 0;
  v12 = 0;
  v13 = &off_254B5A9E0;
  v14 = -1;
  do
  {
    v15 = (uint64_t (*)(uint64_t, uint64_t))*(v13 - 9);
    if (v15)
    {
      v16 = v15(a1, a2);
      if (v16 > v11)
      {
        v14 = v12;
        v11 = v16;
      }
    }
    ++v12;
    v17 = *v13;
    v13 += 7;
  }
  while (v17);
  if ((v14 & 0x80000000) != 0)
    return 110;
  v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*(&off_254B5A980 + 7 * v14 + 4);
  if (v18)
    return v18(a1, a2, a3, a4, a5, a6);
  else
    return 78;
}

uint64_t sub_2127FEB8C(const __CFURL *a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;

  if ((sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CBSDBackingStore")) & 0x80000000) != 0)
    return 4294966296;
  if ((int)sub_2127F29C0(theDict, CFSTR("backingstore-class"), CFSTR("CBSDBackingStore")) > 0)
    return 1000;
  v5 = CFURLCopyScheme(a1);
  if (!v5)
    return 4294966296;
  v6 = v5;
  if (CFStringCompare(v5, CFSTR("file"), 0) || CFURLHasDirectoryPath(a1))
  {
    v4 = 4294966296;
  }
  else
  {
    v4 = 100;
    if (theDict)
    {
      if (CFDictionaryGetValueIfPresent(theDict, CFSTR("file-type"), 0))
        LODWORD(v4) = 200;
      else
        LODWORD(v4) = 100;
      if (CFDictionaryGetValueIfPresent(theDict, CFSTR("file-creator"), 0))
        v4 = (v4 + 100);
      else
        v4 = v4;
    }
  }
  CFRelease(v6);
  return v4;
}

uint64_t sub_2127FEC8C(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFString *Value;

  if (a1 && (Value = (const __CFString *)CFDictionaryGetValue(a1, a2)) != 0)
    return sub_2127FECC8(Value, a3);
  else
    return a3;
}

uint64_t sub_2127FECC8(const __CFString *a1, uint64_t a2)
{
  uint64_t v2;
  CFTypeID v4;
  unsigned int v5;
  CFTypeID v6;
  unsigned int valuePtr;

  v2 = a2;
  valuePtr = a2;
  if (a1)
  {
    v4 = CFGetTypeID(a1);
    if (v4 == CFStringGetTypeID())
    {
      v5 = sub_2127F820C(a1);
      if (v5)
        return v5;
      else
        return v2;
    }
    else
    {
      v6 = CFGetTypeID(a1);
      if (v6 == CFNumberGetTypeID())
      {
        if (CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr))
          return valuePtr;
        else
          return v2;
      }
    }
  }
  return v2;
}

const __CFNumber *sub_2127FED60(const char *a1, const __CFDictionary *a2)
{
  uid_t st_uid;
  gid_t st_gid;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *result;
  int v9;
  uid_t valuePtr;
  stat v11;

  if (!a2)
    return 0;
  if (stat(a1, &v11) < 0)
    return (const __CFNumber *)*__error();
  valuePtr = 0;
  st_uid = v11.st_uid;
  st_gid = v11.st_gid;
  v6 = (const __CFNumber *)sub_2127FE630(a2, CFSTR("uid"));
  if (v6 && CFNumberGetValue(v6, kCFNumberSInt32Type, &valuePtr))
    st_uid = valuePtr;
  v7 = (const __CFNumber *)sub_2127FE630(a2, CFSTR("gid"));
  if (v7 && CFNumberGetValue(v7, kCFNumberSInt32Type, &valuePtr))
    st_gid = valuePtr;
  if ((st_uid != v11.st_uid || st_gid != v11.st_gid) && chown(a1, st_uid, st_gid) < 0)
    return (const __CFNumber *)*__error();
  result = (const __CFNumber *)sub_2127FE630(a2, CFSTR("mode"));
  if (result)
  {
    result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    if ((_DWORD)result)
    {
      v9 = valuePtr & 0xFFF;
      if (v9 == (v11.st_mode & 0xFFF) || (chmod(a1, v9) & 0x80000000) == 0)
        return 0;
      return (const __CFNumber *)*__error();
    }
  }
  return result;
}

uint64_t sub_2127FEE8C(const char *a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t result;
  __int128 v6;
  __int128 v7;
  int v8;
  int v9;
  __int128 v10;
  int v11;
  statfs v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  if (!a1)
    return 22;
  if (statfs(a1, &v12) < 0)
    return *__error();
  v9 = 5;
  v10 = xmmword_212826A20;
  v11 = 0;
  result = getattrlist(v12.f_mntonname, &v9, &v6, 0x24uLL, 0);
  if ((result & 0x80000000) != 0)
    return *__error();
  if ((BYTE8(v7) & 0x40) != 0 && a2 && (BYTE8(v6) & 0x40) != 0)
    *a2 = 1;
  if ((BYTE4(v7) & 0x40) != 0 && a3 && (BYTE4(v6) & 0x40) != 0)
    *a3 = 1;
  return result;
}

CFURLRef sub_2127FEF98(char *__s)
{
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  size_t v5;
  BOOL v7;
  Boolean v8;
  size_t v9;
  const __CFURL *v10;
  CFURLRef v11;
  CFURLRef v12;
  stat v13;

  v1 = __s;
  if (__s)
  {
    v2 = strchr(__s, 58);
    v3 = strstr(v1, "://");
    v4 = strchr(v1, 47);
    if (v2 && v4 && v3 && v2 < v4 && v2 == v3)
    {
      v5 = strlen(v1);
      return CFURLCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v1, v5, 0x8000100u, 0);
    }
    memset(&v13, 0, sizeof(v13));
    if (stat(v1, &v13))
      v7 = 0;
    else
      v7 = (v13.st_mode & 0xF000) == 0x4000;
    v8 = v7;
    v9 = strlen(v1);
    v10 = CFURLCreateFromFileSystemRepresentation((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)v1, v9, v8);
    v1 = (char *)v10;
    if (v10)
    {
      v11 = CFURLCopyAbsoluteURL(v10);
      if (v11)
      {
        v12 = v11;
        CFRelease(v1);
        return v12;
      }
    }
  }
  return (CFURLRef)v1;
}

void sub_2127FF0E0(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  if (cf)
    CFRetain(cf);
  v4 = *(const void **)(a1 + 104);
  if (v4)
    CFRelease(v4);
  *(_QWORD *)(a1 + 104) = cf;
}

uint64_t sub_2127FF11C(_BYTE *a1, int a2)
{
  char v2;
  uint64_t result;

  v2 = a2;
  if (a2 && !(*(unsigned int (**)(_BYTE *))(*(_QWORD *)a1 + 152))(a1))
    return 78;
  result = 0;
  a1[128] = v2;
  return result;
}

BOOL sub_2127FF164(uint64_t a1)
{
  return (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1) == 3;
}

uint64_t sub_2127FF188(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t sub_2127FF190(uint64_t a1, const void *a2, uint64_t a3)
{
  double v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD __dst[65];

  __dst[64] = *MEMORY[0x24BDAC8D0];
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0;
  __dst[38] = 0;
  *(int8x8_t *)&v5 = sub_2127F5754((uint64_t)__dst);
  v6 = (*(uint64_t (**)(uint64_t, double))(*(_QWORD *)a1 + 272))(a1, v5);
  if (!(_DWORD)v6)
  {
    v8 = 0;
    v6 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)a1 + 336))(a1, a3, 512, &v8, __dst);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
  }
  return v6;
}

uint64_t sub_2127FF25C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  FILE *v10;
  pid_t v11;

  v10 = *(FILE **)(a1 + 328);
  if (v10)
  {
    v11 = getpid();
    fprintf(v10, "write\t%d\t%016qX\t%08X\n", v11, a2, a3);
    fflush(*(FILE **)(a1 + 328));
  }
  return sub_2127FF2E0(a1, a2, a3, a4, a5);
}

uint64_t sub_2127FF2E0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  pthread_mutex_t *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t v31;

  v31 = 0;
  v10 = (pthread_mutex_t *)(a1 + 216);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1))
  {
    v11 = 1;
    goto LABEL_15;
  }
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    v11 = 9;
    goto LABEL_15;
  }
  v11 = 22;
  if (a4 && a5)
  {
    v12 = a3 + a2;
    v13 = *(_QWORD *)(a1 + 200);
    if (a3 + a2 <= v13 || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 160))(a1) & 1) != 0)
    {
      v14 = *(_QWORD *)(a1 + 208);
      if (!v14)
      {
        v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 696))(a1, a2, a3, &v31, a5);
        goto LABEL_35;
      }
      v29 = v13;
      v30 = 0;
      v15 = sub_2127F4810(v14, a2, a3, &v30, 1);
      if (v15 < 1)
      {
        if (a3)
        {
          v28 = a3 + a2;
          v17 = 0;
          v22 = a2;
LABEL_28:
          v12 = v28;
          v13 = v29;
          v27 = v28 - v22;
          if (v28 <= v22)
          {
            v11 = 0;
          }
          else
          {
            v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 720))(a1);
            if (!(_DWORD)v11)
              v31 = v17 + v27;
          }
        }
        else
        {
          v11 = 0;
        }
        goto LABEL_35;
      }
      v16 = v15;
      v28 = a3 + a2;
      v17 = 0;
      v18 = v30;
      v19 = v15;
      do
      {
        memmove((void *)v18[2], (const void *)(a5 + *v18 - a2), v18[1]);
        v17 += v18[1];
        v31 = v17;
        v18 += 3;
        --v19;
      }
      while (v19);
      if (v17 == a3)
      {
        v11 = 0;
        goto LABEL_34;
      }
      v23 = v30;
      v22 = a2;
      while (1)
      {
        v24 = *v23;
        v25 = *v23 - v22;
        if (*v23 > v22)
        {
          v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 720))(a1);
          if ((_DWORD)v26)
          {
            v11 = v26;
LABEL_34:
            v12 = v28;
            v13 = v29;
LABEL_35:
            if (v12 > v13 && !(_DWORD)v11)
            {
              v11 = 0;
              if (v31 + a2 > *(_QWORD *)(a1 + 200))
                *(_QWORD *)(a1 + 200) = v31 + a2;
            }
            goto LABEL_15;
          }
          v17 += v25;
          v31 = v17;
          v24 = *v23;
        }
        v22 = v23[1] + v24;
        v23 += 3;
        if (!--v16)
          goto LABEL_28;
      }
    }
    pthread_mutex_unlock(v10);
    v20 = 0;
    v11 = 29;
    goto LABEL_17;
  }
LABEL_15:
  pthread_mutex_unlock(v10);
  if (a4)
  {
    v20 = v31;
LABEL_17:
    *a4 = v20;
  }
  return v11;
}

uint64_t sub_2127FF568(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 128);
}

uint64_t sub_2127FF570(_QWORD *a1, uint64_t a2, size_t a3, char *a4)
{
  char *v4;
  size_t v5;
  uint64_t v6;
  size_t v8;
  size_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a4;
  v5 = a3;
  v6 = a2;
  v8 = *(_QWORD *)(a1[26] + 8);
  v15 = 0;
  if (v8 <= a3)
  {
    v9 = a3 / v8 * v8;
    result = (*(uint64_t (**)(_QWORD *, uint64_t, size_t, uint64_t *, char *))(*a1 + 696))(a1, a2, v9, &v15, a4);
    if ((_DWORD)result)
      return result;
    v5 %= v8;
    v6 += v9;
    v4 += v9;
  }
  if (!v5)
    return 0;
  v11 = sub_2127F4A4C(a1[26]);
  v12 = v11;
  if (!*(_BYTE *)(v11 + 8) || !*(_BYTE *)(v11 + 16) || (result = sub_2127FF694(v11), !(_DWORD)result))
  {
    *(_BYTE *)(v12 + 8) = 0;
    *(_DWORD *)(v12 + 12) = 0;
    *(_BYTE *)(v12 + 16) = 0;
    *(_QWORD *)(v12 + 24) = 0;
    *(_QWORD *)(v12 + 32) = 0;
    if (v5 + v6 <= a1[25])
      v13 = v5 + v6 - 1;
    else
      v13 = v8 + v6 - 1;
    v14 = sub_2127F4A9C(a1[26], v6, v13);
    memmove(*(void **)(v12 + 40), v4, v5);
    result = 0;
    *(_QWORD *)(v12 + 24) = v6;
    *(_QWORD *)(v12 + 32) = v6 + v14 - 1;
    *(_BYTE *)(v12 + 8) = 1;
    *(_BYTE *)(v12 + 16) = 1;
  }
  return result;
}

uint64_t sub_2127FF694(uint64_t a1)
{
  uint64_t (*v2)(_QWORD);
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  if (!*(_BYTE *)(a1 + 8) || !*(_BYTE *)(a1 + 16))
    return 0;
  v2 = *(uint64_t (**)(_QWORD))(a1 + 56);
  if (!v2)
    return 999;
  v5 = 0;
  v3 = *(_QWORD *)(a1 + 32) - *(_QWORD *)(a1 + 24) + 1;
  result = v2(*(_QWORD *)(a1 + 48));
  if (!(_DWORD)result)
  {
    if (v3 == v5)
    {
      result = 0;
      *(_BYTE *)(a1 + 16) = 0;
    }
    else
    {
      return 5;
    }
  }
  return result;
}

uint64_t sub_2127FF720(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 696))(a1);
}

uint64_t sub_2127FF72C(uint64_t a1, off_t a2, size_t a3, ssize_t *a4, void *__buf)
{
  ssize_t v6;
  ssize_t v7;
  uint64_t result;

  ++*(_QWORD *)(a1 + 344);
  v6 = pwrite(*(_DWORD *)(a1 + 320), __buf, a3, a2);
  if (v6 < 0)
    return *__error();
  v7 = v6;
  result = 0;
  *a4 = v7;
  return result;
}

uint64_t sub_2127FF784(uint64_t a1)
{
  return a1 + 128;
}

uint64_t DIUDIFFileAccessOpenFile_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 112);
  if (!v2)
    return 4294967253;
  v11 = 0;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v2);
  if ((_DWORD)v3)
    return v3;
  v4 = (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 112) + 296))(*(_QWORD *)(a1 + 112), &v11);
  if ((_DWORD)v4)
  {
    v9 = v4;
LABEL_9:
    (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 112) + 280))(*(_QWORD *)(a1 + 112), 0);
    return v9;
  }
  v5 = *(_DWORD *)(a1 + 644);
  if (v5 == 1)
  {
    v6 = *(_QWORD *)(a1 + 112);
    v7 = (void *)(a1 + 128);
    v8 = v11 - 512;
  }
  else
  {
    if (v5)
      return 0;
    v6 = *(_QWORD *)(a1 + 112);
    v7 = (void *)(a1 + 128);
    v8 = 0;
  }
  v9 = sub_2127F567C(v6, v7, v8);
  if ((_DWORD)v9)
    goto LABEL_9;
  return v9;
}

uint64_t sub_2127FF858(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 112);
  if (!v2)
    return 4294967253;
  v3 = *(_DWORD *)(a1 + 644);
  if (v3 != 1)
  {
    if (v3)
      return 0;
    v4 = *(_QWORD *)(a1 + 160) + *(_QWORD *)(a1 + 152);
    if (v4 <= *(_QWORD *)(a1 + 352) + *(_QWORD *)(a1 + 344))
      v4 = *(_QWORD *)(a1 + 352) + *(_QWORD *)(a1 + 344);
    if (v4 <= *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 168))
      v4 = *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 168);
    v14 = v4 & ~(v4 >> 63);
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 312))(v2);
    if (!(_DWORD)v5)
    {
      v6 = (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 112) + 296))(*(_QWORD *)(a1 + 112), &v14);
      if (!(_DWORD)v6)
      {
        v7 = (const void *)(a1 + 128);
        v8 = *(_QWORD *)(a1 + 112);
        v9 = 0;
        return sub_2127FF190(v8, v7, v9);
      }
      return v6;
    }
LABEL_22:
    v11 = v5;
    v13 = (const char *)DIStrError(v5);
    warnx("updateHeader failed - %s", v13);
    return v11;
  }
  v10 = *(_QWORD *)(a1 + 160) + *(_QWORD *)(a1 + 152);
  if (v10 <= *(_QWORD *)(a1 + 352) + *(_QWORD *)(a1 + 344))
    v10 = *(_QWORD *)(a1 + 352) + *(_QWORD *)(a1 + 344);
  if (v10 <= *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 168))
    v10 = *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 168);
  v14 = (v10 & ~(v10 >> 63)) + 512;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 312))(v2);
  if ((_DWORD)v5)
    goto LABEL_22;
  v6 = (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 112) + 296))(*(_QWORD *)(a1 + 112), &v14);
  if (!(_DWORD)v6)
  {
    v7 = (const void *)(a1 + 128);
    v8 = *(_QWORD *)(a1 + 112);
    v9 = v14 - 512;
    return sub_2127FF190(v8, v7, v9);
  }
  return v6;
}

uint64_t sub_2127FF9A0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 200) == a2)
    return 0;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    if ((ftruncate(*(_DWORD *)(a1 + 320), a2) & 0x80000000) == 0)
    {
      if (*(_QWORD *)(a1 + 200) > a2)
      {
        v5 = *(_QWORD *)(a1 + 208);
        if (v5)
          sub_2127F4B98(v5, a2);
      }
      goto LABEL_9;
    }
  }
  else if ((truncate(*(const char **)(a1 + 296), a2) & 0x80000000) == 0)
  {
LABEL_9:
    result = 0;
    *(_QWORD *)(a1 + 200) = a2;
    return result;
  }
  return *__error();
}

uint64_t DIUDIFFileAccessCloseFile_0(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[8];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 112);
  if (!v2)
    return 4294967253;
  if (*(_BYTE *)(a1 + 640))
  {
    (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 120) + 72))(*(_QWORD *)(a1 + 120));
    (*(void (**)(_QWORD, _OWORD *))(**(_QWORD **)(a1 + 120) + 136))(*(_QWORD *)(a1 + 120), v10);
    v3 = v10[7];
    *(_OWORD *)(a1 + 304) = v10[6];
    *(_OWORD *)(a1 + 320) = v3;
    *(_QWORD *)(a1 + 336) = v11;
    v4 = v10[3];
    *(_OWORD *)(a1 + 240) = v10[2];
    *(_OWORD *)(a1 + 256) = v4;
    v5 = v10[5];
    *(_OWORD *)(a1 + 272) = v10[4];
    *(_OWORD *)(a1 + 288) = v5;
    v6 = v10[1];
    *(_OWORD *)(a1 + 208) = v10[0];
    *(_OWORD *)(a1 + 224) = v6;
    *(_BYTE *)(a1 + 640) = 0;
    v7 = sub_2127FF858(a1);
    v2 = *(_QWORD *)(a1 + 112);
  }
  else
  {
    v7 = 0;
  }
  v8 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 280))(v2, 0);
  if ((_DWORD)v8 && ((_DWORD)v7 == 5 || !(_DWORD)v7))
    return v8;
  return v7;
}

uint64_t DIUDIFFileAccessGetResourceFile_0(uint64_t a1, char **a2)
{
  char *v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  char *v9;

  v9 = 0;
  v4 = *(char **)(a1 + 664);
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v5 = sub_2128065E0(*(_QWORD *)(a1 + 112), a1 + 128, &v9);
    if (!(_DWORD)v5)
    {
      v6 = v9;
      *(_QWORD *)(a1 + 664) = v9;
      v5 = (*(uint64_t (**)(char *))(*(_QWORD *)v6 + 48))(v6);
    }
    v4 = v9;
    if ((_DWORD)v5)
      v7 = v9 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      DIDiskImageObjectRelease(v9);
      v4 = 0;
    }
  }
  if (a2)
    *a2 = v4;
  return v5;
}

uint64_t sub_2127FFBC8(_QWORD *a1)
{
  _QWORD **v2;
  uint64_t result;

  if (!a1)
    return 22;
  v2 = (_QWORD **)sub_212820064(204);
  result = sub_21281FFF4();
  if (!(_DWORD)result)
    **v2 = 0x16D697368;
  *a1 = v2;
  return result;
}

uint64_t sub_2127FFC18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;

  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 168))(a1, a2, a3, a4, a6);
  if (!(_DWORD)v13)
  {
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 232))(a1, a2, a5 & 0xFFFFFFF7);
    if ((_DWORD)v13)
      goto LABEL_3;
    if (a7)
    {
      v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 328))(a1, a2, a4, a6, a7);
      if ((_DWORD)v13)
        goto LABEL_3;
    }
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 176))(a1, a2);
    if ((_DWORD)v13)
      goto LABEL_3;
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 184))(a1, a2);
    if ((_DWORD)v13)
      goto LABEL_3;
    if ((a5 & 8) == 0)
      return 0;
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 232))(a1, a2, a5);
    if ((_DWORD)v13
      || (v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 264))(a1, 32), (_DWORD)v13))
    {
LABEL_3:
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 248))(a1, a2);
    }
  }
  return v13;
}

uint64_t sub_2127FFD60(uint64_t a1, _QWORD *a2, unsigned int a3, int a4, const unsigned __int8 *a5)
{
  uint64_t v5;
  CFStringRef v10;
  __CFString *v11;
  void *Value;
  const __CFAllocator *v13;
  CFMutableArrayRef Mutable;
  __CFDictionary *v15;
  __CFString *v16;

  v5 = 4294967246;
  if (a2 && *(_QWORD *)(a1 + 104) && *a2)
  {
    if (*(_BYTE *)(a1 + 114))
    {
      v10 = sub_2127F7B14(a3);
      if (v10)
      {
        v11 = (__CFString *)v10;
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 104), v10);
        v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        if (!Value)
        {
          Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
          if (!Mutable)
            goto LABEL_19;
          Value = Mutable;
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 104), v11, Mutable);
          CFRelease(Value);
        }
        v15 = CFDictionaryCreateMutable(v13, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (v15)
        {
          v16 = (__CFString *)v15;
          if (sub_2127F7F30((int)v15, v15, (uint64_t)a2)
            && sub_2127FFEF4((__CFDictionary *)v16, CFSTR("ID"), a4, 0)
            && sub_2127FFEF4((__CFDictionary *)v16, CFSTR("Attributes"), 2, 1)
            && sub_2127FFF8C(v16, a5))
          {
            CFArrayAppendValue((CFMutableArrayRef)Value, v16);
            v5 = 0;
            *(_WORD *)(a1 + 112) |= 0x20u;
          }
          else
          {
            v5 = 4294967246;
          }
          CFRelease(v11);
          goto LABEL_20;
        }
LABEL_19:
        v5 = 4294962336;
        v16 = v11;
LABEL_20:
        CFRelease(v16);
        return v5;
      }
      return 4294962336;
    }
    else
    {
      return 4294967242;
    }
  }
  return v5;
}

__CFDictionary *sub_2127FFEF4(__CFDictionary *result, const void *a2, int a3, int a4)
{
  __CFDictionary *v7;
  const __CFAllocator *v8;
  const void *v9;

  if (result)
  {
    v7 = result;
    CFDictionaryRemoveValue(result, a2);
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (a4)
      result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0, CFSTR("0x%04hX"), a3);
    else
      result = (__CFDictionary *)CFStringCreateWithFormat(v8, 0, CFSTR("%hd"), a3);
    if (result)
    {
      v9 = result;
      CFDictionarySetValue(v7, a2, result);
      CFRelease(v9);
      return (__CFDictionary *)1;
    }
  }
  return result;
}

__CFString *sub_2127FFF8C(__CFString *result, const unsigned __int8 *a2)
{
  __CFDictionary *v2;
  const void *v3;

  if (result)
  {
    v2 = (__CFDictionary *)result;
    if (!a2)
      a2 = (const unsigned __int8 *)&unk_212826F57;
    result = (__CFString *)CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0);
    if (result)
    {
      v3 = result;
      CFDictionarySetValue(v2, CFSTR("Name"), result);
      CFRelease(v3);
      return (__CFString *)1;
    }
  }
  return result;
}

uint64_t sub_2127FFFF8(uint64_t a1, uint64_t a2, int a3)
{
  __CFDictionary *v4;

  if (!*(_QWORD *)(a1 + 104))
    return 4294967097;
  if (!a2)
    return 4294967246;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  v4 = sub_2127F8098(a1, a2, 0);
  if (!v4)
    return 4294967104;
  if ((sub_2127FFEF4(v4, CFSTR("Attributes"), a3, 1) & 1) != 0)
    return 0;
  return 4294967097;
}

uint64_t sub_212800074(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const __CFDictionary *v4;
  __CFDictionary *v5;
  int v6;
  __int16 v7;
  int v8;

  result = 4294967246;
  if (a2 && *(_QWORD *)(a1 + 104))
  {
    if (*(_BYTE *)(a1 + 114))
    {
      v8 = 0;
      v4 = sub_2127F8098(a1, a2, &v8);
      if (v4)
      {
        v5 = v4;
        v7 = 0;
        if (sub_2127F74E4(v4, CFSTR("Attributes"), &v7)
          && (v6 = v7 | 2, v7 |= 2u, sub_2127FFEF4(v5, CFSTR("Attributes"), v6, 1)))
        {
          result = 0;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }
        else
        {
          return 4294967097;
        }
      }
      else
      {
        return 4294967104;
      }
    }
    else
    {
      return 4294967242;
    }
  }
  return result;
}

uint64_t sub_21280012C(uint64_t a1, const UInt8 **a2)
{
  const __CFDictionary *v3;
  unsigned int v5;

  if (!a2)
    return 4294967246;
  if (!*(_QWORD *)(a1 + 104))
    return 4294967246;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0)
    return 4294967098;
  v5 = 0;
  v3 = sub_2127F8098(a1, (uint64_t)a2, &v5);
  if (v3)
    return sub_2128001B4((uint64_t)v3, v3, v5, a2);
  else
    return 4294967104;
}

uint64_t sub_2128001B4(uint64_t a1, const __CFDictionary *a2, uint64_t a3, const UInt8 **a4)
{
  uint64_t result;
  __int16 v7;
  CFIndex v8;
  CFDataRef v9;
  __int16 v10;
  __int16 v11;

  result = 4294967246;
  if (a2 && a4)
  {
    if (*a4)
    {
      v11 = 0;
      if (!sub_2127F74E4(a2, CFSTR("ID"), &v11))
        return 4294967097;
      v10 = 0;
      if (!sub_2127F74E4(a2, CFSTR("Attributes"), &v10))
        return 4294967097;
      v7 = v10;
      if ((v10 & 2) == 0)
        return 0;
      v10 &= ~2u;
      if (sub_2127FFEF4(a2, CFSTR("Attributes"), (__int16)(v7 & 0xFFFD), 1))
      {
        v8 = sub_212820120((uint64_t)a4);
        sub_21282012C();
        nullsub_4(a4);
        sub_21281FFF4();
        v9 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], *a4, v8);
        sub_21281FFF4();
        nullsub_4(a4);
        if (v9)
        {
          CFDictionarySetValue(a2, CFSTR("Data"), v9);
          CFRelease(v9);
          return 0;
        }
        return 4294962336;
      }
      else
      {
        return 4294967097;
      }
    }
    else
    {
      return 4294967187;
    }
  }
  return result;
}

unsigned __int16 *sub_21280032C(unsigned __int16 *result)
{
  unsigned int v1;
  uint64_t v2;
  _WORD *v3;

  *result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  v1 = result[8];
  if (v1 <= 0x3D)
  {
    if (!result[8])
      goto LABEL_6;
  }
  else
  {
    v1 = 61;
  }
  v2 = v1;
  v3 = result + 12;
  do
  {
    *(_DWORD *)(v3 - 3) = bswap32(*(_DWORD *)(v3 - 3));
    *(v3 - 1) = bswap32((unsigned __int16)*(v3 - 1)) >> 16;
    *v3 = bswap32((unsigned __int16)*v3) >> 16;
    v3 += 4;
    --v2;
  }
  while (v2);
LABEL_6:
  result[8] = (_WORD)v1 << 8;
  return result;
}

uint64_t sub_2128003E4(uint64_t a1)
{
  const __CFDictionary *v2;
  size_t Count;
  int64_t v4;
  const void **v5;
  const void **v6;
  const void **v7;
  const void **v8;
  uint64_t v9;
  uint64_t v10;
  const __CFArray *v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *v16;
  uint64_t v17;
  uint64_t v18;
  const UInt8 **v20;

  v2 = *(const __CFDictionary **)(a1 + 104);
  if (!v2)
    goto LABEL_16;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  if ((*(_WORD *)(a1 + 112) & 0x80) != 0)
    return 4294967098;
  Count = CFDictionaryGetCount(v2);
  if (!Count)
  {
LABEL_16:
    v6 = 0;
    v8 = 0;
    goto LABEL_17;
  }
  v4 = Count;
  v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v5)
    return 4294967188;
  v6 = v5;
  v7 = (const void **)malloc_type_calloc(v4, 8uLL, 0x6004044C4A2DFuLL);
  if (!v7)
  {
    v18 = 4294967188;
    goto LABEL_20;
  }
  v8 = v7;
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v6, v7);
  if (v4 < 1)
  {
LABEL_17:
    v18 = 0;
    *(_WORD *)(a1 + 112) &= ~0x20u;
    if (!v8)
      goto LABEL_19;
    goto LABEL_18;
  }
  v9 = 0;
  while (1)
  {
    v10 = sub_2127F820C((const __CFString *)v6[v9]);
    v11 = (const __CFArray *)v8[v9];
    v12 = CFArrayGetCount(v11);
    if (v12 >= 1)
      break;
LABEL_14:
    if (++v9 == v4)
      goto LABEL_17;
  }
  v13 = v12;
  v14 = 0;
  while (1)
  {
    v20 = 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v14);
    v16 = sub_2127F7E88((int)ValueAtIndex, ValueAtIndex, &v20);
    if ((_DWORD)v16)
    {
      v17 = sub_2128001B4((uint64_t)v16, ValueAtIndex, v10, v20);
      if ((_DWORD)v17)
        break;
    }
    if (v13 == ++v14)
      goto LABEL_14;
  }
  v18 = v17;
LABEL_18:
  free(v8);
LABEL_19:
  if (v6)
LABEL_20:
    free(v6);
  return v18;
}

uint64_t sub_212800588(uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  unsigned int v20;
  int v21;
  _OWORD v22[16];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = 0;
  v19 = 0;
  v18 = 0;
  memset(v22, 0, sizeof(v22));
  v17 = 0;
  v8 = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)a2 + 64))(a2, (char *)&v21 + 2);
  if (!(_DWORD)v8)
  {
    if (SHIWORD(v21) < 1)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    LOWORD(v9) = 1;
    while (1)
    {
      v10 = (*(uint64_t (**)(uint64_t, unsigned int *, _QWORD))(*(_QWORD *)a2 + 72))(a2, &v20, (__int16)v9);
      if ((_DWORD)v10)
        return v10;
      v10 = (*(uint64_t (**)(uint64_t, _QWORD, int *))(*(_QWORD *)a2 + 96))(a2, v20, &v21);
      if ((_DWORD)v10)
        return v10;
      if ((__int16)v21 >= 1)
      {
        LOWORD(v11) = 1;
        do
        {
          v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 88))(a2);
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a2 + 80))(a2, 0);
          v8 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)a2 + 112))(a2, v20, (__int16)v11, &v19);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, v12);
          if ((_DWORD)v8)
            return v8;
          v10 = (*(uint64_t (**)(uint64_t, void *, char *, unsigned int *, _OWORD *, uint64_t *))(*(_QWORD *)a2 + 320))(a2, v19, (char *)&v18 + 2, &v20, v22, &v17);
          if ((_DWORD)v10)
            return v10;
          if (!a3 || a3(a4, v20, SHIWORD(v18)))
          {
            v10 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)a2 + 136))(a2, v19);
            if ((_DWORD)v10)
              return v10;
            v10 = (*(uint64_t (**)(uint64_t, void *, int *))(*(_QWORD *)a2 + 224))(a2, v19, &v18);
            if ((_DWORD)v10)
              return v10;
            v10 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)a2 + 248))(a2, v19);
            if ((_DWORD)v10)
              return v10;
            v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
            (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
            v16 = 0;
            if (!(*(unsigned int (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)a1 + 120))(a1, v20, SHIWORD(v18), &v16)&& v16)
            {
              (*(void (**)(uint64_t))(*(_QWORD *)a1 + 192))(a1);
              sub_212820098((void **)v16);
            }
            (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v13);
            v14 = (*(uint64_t (**)(uint64_t, void *, _QWORD, _QWORD, _QWORD, _OWORD *, uint64_t))(*(_QWORD *)a1 + 312))(a1, v19, v20, SHIWORD(v18), (__int16)v18, v22, v17);
            if ((_DWORD)v14)
            {
              v8 = v14;
              sub_212820098((void **)v19);
              return v8;
            }
          }
          v11 = (__int16)(v11 + 1);
        }
        while (v11 <= (__int16)v21);
      }
      v9 = (__int16)(v9 + 1);
      if (v9 > SHIWORD(v21))
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    }
  }
  return v8;
}

uint64_t sub_212800898(uint64_t a1, _WORD *a2)
{
  const __CFDictionary *v3;
  __int16 Count;
  uint64_t result;

  if (!a2)
    return 4294967246;
  v3 = *(const __CFDictionary **)(a1 + 104);
  if (v3)
  {
    Count = CFDictionaryGetCount(v3);
    result = 0;
  }
  else
  {
    Count = 0;
    result = 4294967097;
  }
  *a2 = Count;
  return result;
}

uint64_t sub_2128008E4(CFDictionaryRef *a1, _DWORD *a2, int a3)
{
  uint64_t result;
  const void **v7;
  const void **v8;
  int v9;
  __int16 v10;

  if (!a2)
    return 4294967246;
  if (a1[13])
  {
    v10 = 0;
    result = (*((uint64_t (**)(CFDictionaryRef *, __int16 *))*a1 + 8))(a1, &v10);
    if ((_DWORD)result)
    {
      v9 = 0;
    }
    else if (a3 < 1 || v10 < a3)
    {
      v9 = 0;
      result = 4294967246;
    }
    else
    {
      v7 = (const void **)malloc_type_calloc(v10, 8uLL, 0x6004044C4A2DFuLL);
      if (v7)
      {
        v8 = v7;
        CFDictionaryGetKeysAndValues(a1[13], v7, 0);
        v9 = sub_2127F820C((const __CFString *)v8[a3 - 1]);
        free(v8);
        result = 0;
      }
      else
      {
        v9 = 0;
        result = 12;
      }
    }
  }
  else
  {
    v9 = 0;
    result = 4294967097;
  }
  *a2 = v9;
  return result;
}

uint64_t sub_2128009E0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 115);
}

uint64_t sub_2128009E8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 115) = a2;
  return result;
}

uint64_t sub_2128009F0(uint64_t a1, unsigned int a2, int a3, _QWORD *a4)
{
  void *v6;
  const __CFArray *v9;
  const __CFArray *v10;
  const __CFDictionary *ValueAtIndex;
  uint64_t result;
  void *v13;

  v13 = 0;
  if (!a4)
    return 4294967246;
  v6 = *(void **)(a1 + 104);
  if (!v6)
    goto LABEL_13;
  v9 = (const __CFArray *)sub_2127F7ABC(a1, a2);
  if (!v9 || a3 < 1 || (v10 = v9, CFArrayGetCount(v9) < a3))
  {
    v6 = 0;
    result = 4294967104;
    goto LABEL_8;
  }
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, a3 - 1);
  if (!ValueAtIndex)
  {
    v6 = 0;
LABEL_13:
    result = 4294967097;
    goto LABEL_8;
  }
  result = sub_2127F7C8C(a1, a2, ValueAtIndex, &v13);
  v6 = v13;
LABEL_8:
  *a4 = v6;
  return result;
}

uint64_t sub_212800AB4(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  int v9;

  if (!a2)
    return 4294967246;
  v9 = 0;
  v3 = sub_2127F8098(a1, a2, &v9);
  if (!v3)
    return 4294967104;
  v4 = v3;
  v8 = 0;
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 1);
  v6 = sub_2127F7C8C(a1, v9, v4, &v8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v5);
  return v6;
}

uint64_t sub_212800B64(uint64_t a1, uint64_t a2, _WORD *a3)
{
  const __CFDictionary *v4;
  uint64_t result;
  __int16 v6;

  v6 = 0;
  if (!a3)
    return 4294967246;
  if (*(_QWORD *)(a1 + 104))
  {
    if (a2)
    {
      v4 = sub_2127F8098(a1, a2, 0);
      if (v4)
      {
        if ((sub_2127F74E4(v4, CFSTR("Attributes"), &v6) & 1) != 0)
          result = 0;
        else
          result = 4294967097;
      }
      else
      {
        result = 4294967104;
      }
    }
    else
    {
      result = 4294967246;
    }
  }
  else
  {
    result = 4294967097;
  }
  *a3 = v6;
  return result;
}

void sub_212800BEC(_QWORD *a1)
{
  sub_212800C44(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212800C20(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C400F414A5CLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212800C44(_QWORD *a1)
{
  const void *v2;
  char *v3;
  char *v4;
  char *v5;

  *a1 = &off_24CE29050;
  v2 = (const void *)a1[13];
  if (v2)
    CFRelease(v2);
  a1[13] = 0;
  v3 = (char *)a1[83];
  if (v3)
  {
    DIDiskImageObjectRelease(v3);
    a1[83] = 0;
  }
  v4 = (char *)a1[14];
  if (v4)
  {
    DIDiskImageObjectRelease(v4);
    a1[14] = 0;
  }
  v5 = (char *)a1[15];
  if (v5)
  {
    DIDiskImageObjectRelease(v5);
    a1[15] = 0;
  }
  return sub_2127F3E08(a1);
}

void sub_212800CB0(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

void sub_212800CC8(_QWORD *a1)
{
  sub_212800D20(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212800CFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212800D20(_QWORD *a1)
{
  const void *v2;

  *a1 = &off_24CE299C0;
  v2 = (const void *)a1[14];
  if (v2)
    CFRelease(v2);
  return sub_2127F9418(a1);
}

void sub_212800D58(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F9418(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_212800D70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2127FF11C((_BYTE *)a1, a2);
  if ((_DWORD)v4)
  {
LABEL_4:
    if (!(_DWORD)v4)
      return v4;
    goto LABEL_5;
  }
  v5 = *(_QWORD *)(a1 + 200);
  if (v5)
  {
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 168))(v5, a2);
    goto LABEL_4;
  }
  v4 = 999;
LABEL_5:
  if ((_DWORD)a2)
  {
    sub_2127FF11C((_BYTE *)a1, 0);
    v6 = *(_QWORD *)(a1 + 200);
    if (v6)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v6 + 168))(v6, 0);
  }
  return v4;
}

uint64_t sub_212800DFC(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[32];
  if (v1 >= a1[34] && v1 >= a1[56])
    return sub_212800E24((uint64_t)a1);
  else
    return 0;
}

uint64_t sub_212800E24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 152))(result);
  return result;
}

uint64_t sub_212800E3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  if (a6)
    *a6 = 0;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(a1);
}

uint64_t DIBackingStoreGetURLArray(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
}

uint64_t sub_212800E5C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 216))(result);
  return result;
}

uint64_t sub_212800E74(uint64_t a1)
{
  return *(_QWORD *)(a1 + 152);
}

uint64_t DIMediaKitCreateMKMediaRef(uint64_t a1, uint64_t a2, const __CFDictionary *a3, uint64_t *a4)
{
  uint64_t result;
  const __CFAllocator *v7;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v9;
  __CFDictionary *Mutable;
  CFNumberRef v11;
  int valuePtr;
  unsigned int v13;

  result = 22;
  v13 = 22;
  if (a4)
  {
    *a4 = 0;
    if (a1)
    {
      v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (a3)
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a3);
      else
        MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v9 = MutableCopy;
      Mutable = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      valuePtr = 16;
      v11 = CFNumberCreate(v7, kCFNumberSInt32Type, &valuePtr);
      CFDictionarySetValue(Mutable, CFSTR("attributes"), v11);
      CFDictionarySetValue(Mutable, CFSTR("valid"), v11);
      CFRelease(v11);
      CFDictionarySetValue(v9, CFSTR("Characteristics"), Mutable);
      CFRelease(Mutable);
      *a4 = MKMediaCreate();
      CFRelease(v9);
      return v13;
    }
  }
  return result;
}

uint64_t sub_212800FC0(uint64_t a1)
{
  if (!a1)
    return 999;
  DIDiskImageObjectRetain();
  return 0;
}

__CFDictionary *sub_212800FE4(uint64_t a1, CFTypeRef cf1)
{
  __CFDictionary *Mutable;
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  int v12;
  uint64_t v13;
  uint64_t valuePtr;

  Mutable = 0;
  if (a1 && cf1)
  {
    if (CFEqual(cf1, CFSTR("Geometry")))
    {
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      valuePtr = DIDiskImageGetSectorCount(a1);
      v6 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(Mutable, CFSTR("Sector Count"), v6);
        CFRelease(v7);
      }
      valuePtr = 512;
      v8 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(Mutable, CFSTR("Block Size"), v8);
        CFRelease(v9);
      }
      valuePtr = 2048;
      v10 = CFNumberCreate(v5, kCFNumberLongLongType, &valuePtr);
      if (v10)
      {
        v11 = v10;
        CFDictionarySetValue(Mutable, CFSTR("Maximum Transfer Sector Count"), v10);
        CFRelease(v11);
      }
    }
    else if (CFEqual(cf1, CFSTR("Writable")))
    {
      v12 = DIDiskImageIsWriteEnabled(a1);
      v13 = MEMORY[0x24BDBD270];
      if (!v12)
        v13 = MEMORY[0x24BDBD268];
      return *(__CFDictionary **)v13;
    }
    else
    {
      return 0;
    }
  }
  return Mutable;
}

uint64_t DIDiskImageGetSectorCount(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

uint64_t DIDiskImageIsWriteEnabled(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 288))(a1);
}

uint64_t sub_212801188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  result = DIDiskImageWriteSectors(a1);
  if (a5)
    *a5 = 0;
  return result;
}

uint64_t DIDiskImageWriteSectors(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
}

char *sub_2128011D4(char *a1)
{
  if (a1)
    return (char *)DIDiskImageObjectRelease(a1);
  return a1;
}

uint64_t sub_2128011E0(uint64_t a1, char a2)
{
  uint64_t result;

  if ((*(_DWORD *)(a1 + 320) & 0x80000000) == 0)
  {
    result = sub_21280125C(a1);
    if ((_DWORD)result)
      return result;
    if (!*(_BYTE *)(a1 + 304)
      && ((a2 & 1) == 0 || fcntl(*(_DWORD *)(a1 + 320), 51, 1) == -1)
      && fsync(*(_DWORD *)(a1 + 320)) < 0)
    {
      return *__error();
    }
  }
  return 0;
}

uint64_t sub_21280125C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (!*(_QWORD *)(a1 + 208) || !(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1))
    return 0;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 216));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 208) + 16);
  if (v2)
  {
    while (!*(_BYTE *)(v2 + 8) || !*(_BYTE *)(v2 + 16))
    {
      v2 = *(_QWORD *)(v2 + 72);
      if (!v2)
        goto LABEL_7;
    }
    v3 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 704))(a1, *(_QWORD *)(a1 + 200));
    if (!(_DWORD)v3)
      v3 = sub_2127F4B4C(*(_QWORD *)(a1 + 208), *(_QWORD *)(a1 + 200));
  }
  else
  {
LABEL_7:
    v3 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 216));
  return v3;
}

uint64_t sub_21280130C(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 496))(a1);
  v7 = a1[94];
  if (v7 == a2)
    return 0;
  v9 = v6;
  if (!v6)
    return 999;
  if (v7 < a2 && !(*(unsigned int (**)(_QWORD *))(*a1 + 160))(a1))
    return 78;
  if (*((_BYTE *)a1 + 777))
  {
    v10 = a1[32] + a2;
  }
  else if (*((_BYTE *)a1 + 776))
  {
    v10 = a1[32] + a2 + 512;
  }
  else
  {
    v10 = a1[32] + a2;
  }
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 320))(v9, v10, a3);
  if (!(_DWORD)result)
  {
    a1[94] = a2;
    a1[33] = a2;
    result = (*(uint64_t (**)(_QWORD *, _QWORD *))(*a1 + 776))(a1, a1 + 29);
    if (!(_DWORD)result)
    {
      sub_2127F5B90((uint64_t)a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t sub_212801400(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 160))(result);
  return result;
}

uint64_t sub_212801418(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 312))(a1);
}

uint64_t sub_212801424(_BYTE *a1, const void *a2)
{
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD __dst[65];

  __dst[64] = *MEMORY[0x24BDAC8D0];
  if (!a1[777] && !a1[776])
    return 78;
  v4 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 496))(a1);
  v10 = 0;
  v11 = 0;
  memcpy(__dst, a2, 0x200uLL);
  __dst[37] = 0;
  __dst[38] = 0;
  v5.n128_u64[0] = (unint64_t)sub_2127F5754((uint64_t)__dst);
  v6 = 0;
  if (!a1[777])
  {
    v7 = (*(uint64_t (**)(uint64_t, uint64_t *, double))(*(_QWORD *)v4 + 296))(v4, &v11, v5.n128_f64[0]);
    if ((_DWORD)v7)
      return v7;
    v6 = v11 - 512;
  }
  v11 = v6;
  v7 = (*(uint64_t (**)(uint64_t, __n128))(*(_QWORD *)v4 + 272))(v4, v5);
  if ((_DWORD)v7)
    return v7;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)v4 + 336))(v4, v11, 512, &v10, __dst);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 280))(v4, 0);
  if (!(_DWORD)v8)
    memcpy(a1 + 232, a2, 0x200uLL);
  return v8;
}

uint64_t sub_212801570(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v7;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  if (!a5)
    return 22;
  v7 = a1[94];
  if ((uint64_t)v7 >= a2)
  {
    v11 = a3 + a2;
    if (a3 + a2 <= v7)
    {
LABEL_6:
      v13 = (*(uint64_t (**)(_QWORD *))(*a1 + 496))(a1);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v13 + 336))(v13, a1[93] + a2, a3, a4, a5);
    }
    if ((*(unsigned int (**)(_QWORD *))(*a1 + 160))(a1))
    {
      result = (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD))(*a1 + 320))(a1, v11, 0);
      if ((_DWORD)result)
        return result;
      goto LABEL_6;
    }
  }
  return 29;
}

uint64_t sub_212801644(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (v3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v3 + 472))(v3, a2);
  else
    return 78;
}

uint64_t sub_21280168C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 472))(v1);
  else
    return 78;
}

uint64_t sub_2128016A8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  if ((_DWORD)a2 != -536870288 && (_DWORD)a2 != -536870144 && (_DWORD)a2 != -536870272)
    return 22;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (result)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 440))(v5, a2);
  }
  return result;
}

uint64_t sub_212801738(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 440))(result);
  return result;
}

uint64_t sub_212801750(uint64_t a1, int a2)
{
  if (a2 == -536870288 || a2 == -536870272 || a2 == -536870144)
    return 0;
  else
    return 22;
}

uint64_t sub_212801780(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  size_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  size_t size;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a5)
    return 22;
  *a5 = 0;
  v10 = 22;
  if (a3 && a4)
  {
    v29 = 0;
    v26 = 0;
    v27 = 0;
    size = 0;
    v25 = 0;
    sub_2127FB630(a1, a2, &v28, &v29, &v27, &v26, &v25, &size, 0);
    if (v29 > -2147483640)
    {
      return 78;
    }
    else
    {
      v11 = sub_2127FB834(a1, v29);
      if (v11)
      {
        v12 = v11;
        v13 = size;
        v23 = 0;
        v14 = v26;
        v15 = malloc_type_malloc(size, 0x497959ADuLL);
        if (v15)
        {
          v16 = v15;
          v22 = v14;
          v17 = v14 << 9;
          v18 = malloc_type_malloc(v14 << 9, 0xED8498E3uLL);
          if (v18)
          {
            v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
            v20 = (*(uint64_t (**)(uint64_t, uint64_t, size_t, uint64_t *, void *))(*(_QWORD *)v19 + 328))(v19, v25, v13, &v23, v16);
            if ((_DWORD)v20)
            {
              v10 = v20;
            }
            else
            {
              v10 = (*(uint64_t (**)(_QWORD *, void *, _QWORD, void *, uint64_t))(*v12 + 48))(v12, v16, v23, v18, v17);
              if ((_DWORD)v10)
                fprintf((FILE *)*MEMORY[0x24BDAC8D8], "readSectorChunk: decompressData failed with error %ld (inStartSector: %qd)\n", v10, a2);
            }
          }
          else
          {
            v10 = 12;
          }
          free(v16);
          if (v18 && (_DWORD)v10)
          {
            free(v18);
          }
          else if (v18)
          {
            *a3 = v27;
            *a4 = v22;
            *a5 = v18;
          }
        }
        else
        {
          return 12;
        }
      }
      else
      {
        return 999;
      }
    }
  }
  return v10;
}

uint64_t sub_212801970(char *a1, const __CFDictionary *a2)
{
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const __CFNumber *v9;
  int v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  const __CFDictionary *v17;
  uint64_t v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFArray *v22;
  const void *v23;
  uint64_t v24;
  const __CFDictionary *v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFNumber *v30;
  const __CFNumber *v31;
  const __CFNumber *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  CFIndex v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  const __CFBoolean *Value;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t MKMediaRef;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  const __CFAllocator *v52;
  __CFDictionary *Mutable;
  const __CFArray *v55;
  CFIndex Count;
  CFIndex v57;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *v60;
  CFIndex v61;
  CFIndex v62;
  CFIndex v63;
  const __CFDictionary *v64;
  __CFDictionary *v65;
  CFNumberRef v66;
  CFNumberRef v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  char v71;
  uint64_t v72;
  const __CFAllocator *allocator;
  int v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  uint64_t valuePtr;
  int v81;
  uint64_t v82;
  uint64_t v83;
  CFNumberRef number;
  const void *v85;
  const void *v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const __CFDictionary *v96;
  const __CFArray *v97;
  CFTypeRef v98;
  uint64_t v99;
  char *v100;
  int v101;
  uint64_t v102;

  valuePtr = 0;
  v79 = -1;
  v78 = -1;
  v4 = sub_2127F2A48(a2, CFSTR("inhibit-apm-final-gap"), 0);
  if (v4)
    v5 = 35;
  else
    v5 = 3;
  v6 = sub_2127F2A48(a2, CFSTR("freeze-file-system"), 0);
  v7 = (*(uint64_t (**)(char *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 456))(a1, v5, 0, 0);
  if (!v7)
    return 999;
  v8 = (const __CFDictionary *)v7;
  v9 = (const __CFNumber *)sub_2127FE630(a2, CFSTR("content-new-length"));
  if (v9)
  {
    CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
    v10 = sub_2127F2A48(a2, CFSTR("freeze-image-size"), 0);
    v11 = (const __CFNumber *)sub_2127FE630(a2, CFSTR("partition-ID"));
    v12 = v11;
    if (v11)
      CFNumberGetValue(v11, kCFNumberSInt32Type, &v79);
    v13 = (const __CFNumber *)sub_2127FE630(a2, CFSTR("content-min-length"));
    if (v13)
      CFNumberGetValue(v13, kCFNumberLongLongType, &v78);
    if (sub_212802380(v8, CFSTR("subcontent-list")))
    {
      if (v12)
      {
        v14 = v78;
        v102 = valuePtr;
        v101 = v79;
        v99 = 0;
        v100 = 0;
        v97 = 0;
        v98 = 0;
        v95 = 0;
        v96 = 0;
        v93 = 0;
        v94 = 0;
        v91 = 0;
        v92 = 0;
        v89 = 0;
        v90 = 0;
        v88 = 0;
        if (v10)
          v15 = 7;
        else
          v15 = 3;
        if (v4)
          v16 = v15 | 0x20;
        else
          v16 = v15;
        v17 = (const __CFDictionary *)(*(uint64_t (**)(char *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 456))(a1, v16, 0, 0);
        if (!v17)
        {
          v26 = 0;
          v27 = 999;
          goto LABEL_103;
        }
        v93 = 1;
        v18 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
        v94 = v18;
        v95 = v18;
        v19 = (const __CFNumber *)sub_2127FE630(v17, CFSTR("content-min-length"));
        if (v19)
          CFNumberGetValue(v19, kCFNumberLongLongType, &v95);
        v20 = (const __CFNumber *)sub_2127FE630(v17, CFSTR("content-max-length"));
        if (v20)
          CFNumberGetValue(v20, kCFNumberLongLongType, &v94);
        v21 = (const __CFNumber *)sub_2127FE630(v17, CFSTR("content-granularity"));
        if (v21)
          CFNumberGetValue(v21, kCFNumberLongLongType, &v93);
        v22 = (const __CFArray *)sub_212802380(v17, CFSTR("subcontent-list"));
        v23 = sub_2128023F8(v17, CFSTR("content-hint"));
        if (!v4 && v23 && CFEqual(v23, CFSTR("APM")))
        {
          v24 = 10 / v93;
          if (10 / v93 * v93 != 10)
            ++v24;
          v99 = v24 * v93;
        }
        if (v101 != -1)
        {
          v25 = sub_2128219E0(v22, v101);
          if (!v25)
          {
LABEL_33:
            v26 = 0;
            v27 = 22;
LABEL_103:
            if (v100)
            {
              DIDiskImageObjectRelease(v100);
              v100 = 0;
            }
            if (v17)
              CFRelease(v17);
            if (v98)
            {
              CFRelease(v98);
              v98 = 0;
            }
            if (v26)
              CFRelease(v26);
            goto LABEL_111;
          }
LABEL_42:
          v89 = 1;
          v32 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("postamble"));
          if (v32)
            CFNumberGetValue(v32, kCFNumberSInt64Type, &v99);
          v33 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("content-length"));
          CFNumberGetValue(v33, kCFNumberLongLongType, &v90);
          v91 = v90;
          v92 = v90;
          v34 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("content-start"));
          CFNumberGetValue(v34, kCFNumberLongLongType, &v88);
          if (v14 < 0)
          {
            v36 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("content-min-length"));
            if (v36)
              CFNumberGetValue(v36, kCFNumberLongLongType, &v92);
          }
          else
          {
            v92 = v14;
          }
          v37 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("content-max-length"));
          if (v37)
            CFNumberGetValue(v37, kCFNumberLongLongType, &v91);
          v38 = (const __CFNumber *)sub_2127FE630(v25, CFSTR("content-granularity"));
          if (v38)
            CFNumberGetValue(v38, kCFNumberLongLongType, &v89);
          Value = (const __CFBoolean *)CFDictionaryGetValue(v25, CFSTR("can-trigger-image-resize"));
          if (Value)
            v40 = CFBooleanGetValue(Value) != 0;
          else
            v40 = 0;
          v41 = v102;
          if (v102 == -1)
          {
            v41 = v92;
            v102 = v92;
          }
          if (v41 == 1)
          {
            v41 = v91;
            v102 = v91;
          }
          if (v14 == -1 && v41 < v92)
          {
            warnx("resize request %qd is below minimum size %qd allowed.");
            goto LABEL_33;
          }
          if (v41 > v91)
          {
            warnx("resize request %qd is above maximum size %qd allowed.");
            goto LABEL_33;
          }
          if (v41 <= v90)
          {
            v42 = (v90 - v41) / v89 * v89;
            v43 = v90 - v42;
          }
          else
          {
            v42 = (v41 - v90) / v89 * v89;
            v43 = v42 + v90;
          }
          v102 = v43;
          if (!v42)
          {
            v26 = 0;
            goto LABEL_83;
          }
          v77 = v14;
          MKMediaRef = sub_212802440(a1, v88, v90, (uint64_t *)&v100);
          if (!(_DWORD)MKMediaRef)
          {
            v45 = !v40;
            if (v10)
              v45 = 1;
            if ((v45 & 1) != 0)
            {
              v50 = 0;
              v46 = v18 - v88;
              v75 = v18;
              goto LABEL_100;
            }
            v46 = v99 + v102;
            v47 = v99 + v102 + v88;
            v48 = v47 - v18;
            if (v47 <= v18)
            {
              if (v99 + v102 + v88 < v18)
              {
                if ((v18 - v47) % v93)
                  v51 = (v18 - v47) / v93 + 1;
                else
                  v51 = (v18 - v47) / v93;
                v47 = v18 - v51 * v93;
              }
            }
            else
            {
              if (v48 % v93)
                v49 = v48 / v93 + 1;
              else
                v49 = v48 / v93;
              v47 = v18 + v49 * v93;
            }
            if (v47 <= v18)
            {
              v75 = v47;
              v50 = 0;
LABEL_100:
              v52 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
              MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)a1, *MEMORY[0x24BDBD240], 0, (uint64_t *)&v98);
              if ((_DWORD)MKMediaRef)
                goto LABEL_101;
              v72 = v46;
              v74 = v50;
              v87 = 0;
              allocator = v52;
              Mutable = CFDictionaryCreateMutable(v52, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionarySetValue(Mutable, CFSTR("Include most"), (const void *)*MEMORY[0x24BDBD270]);
              v26 = (const void *)MKCFReadMedia();
              CFRelease(Mutable);
              v27 = v87;
              if (v87)
                goto LABEL_103;
              v27 = sub_212820924((const __CFDictionary *)v26, &v96, &v97);
              if ((_DWORD)v27)
                goto LABEL_103;
              v55 = (const __CFArray *)sub_212802380((const __CFDictionary *)v26, CFSTR("Schemes"));
              Count = CFArrayGetCount(v55);
              if (Count >= 1)
              {
                v57 = Count;
                for (i = 0; i < v57; ++i)
                {
                  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v55, i);
                  v60 = sub_2128023F8(ValueAtIndex, CFSTR("ID"));
                  if (v60 && CFEqual(v60, CFSTR("ISO9660")))
                  {
                    CFArrayRemoveValueAtIndex(v55, i--);
                    --v57;
                  }
                }
              }
              v61 = CFArrayGetCount(v97);
              if (v61 < 1)
              {
LABEL_130:
                if (v74)
                {
                  v27 = sub_212821254((uint64_t)a1, v18, v4 == 0, 0);
                  if ((_DWORD)v27)
                    goto LABEL_103;
                }
              }
              else
              {
                v62 = v61;
                v63 = 0;
                while (1)
                {
                  v85 = 0;
                  v86 = 0;
                  v83 = 0;
                  number = 0;
                  v82 = 0;
                  v64 = (const __CFDictionary *)sub_2128023BC(v97, v63);
                  if (v64)
                  {
                    v65 = v64;
                    if (sub_212820E5C(v64, (const void **)&number, &v86, &v85, &v83, &v82, 0))
                    {
                      v81 = 0;
                      if (CFNumberGetValue(number, kCFNumberIntType, &v81))
                      {
                        if (v81 == v101 && v83 == v88)
                        {
                          v66 = CFNumberCreate(allocator, kCFNumberLongLongType, &v102);
                          if (v66)
                            break;
                        }
                      }
                    }
                  }
                  if (v62 == ++v63)
                    goto LABEL_130;
                }
                v67 = v66;
                CFDictionarySetValue(v65, CFSTR("Size"), v66);
                CFRelease(v67);
                v68 = sub_212821734((uint64_t)v100, v102, v72, 1, v6 != 0, v77);
                if ((_DWORD)v68)
                {
                  v27 = v68;
                  if (!v74)
                    goto LABEL_103;
LABEL_137:
                  sub_212821254((uint64_t)a1, v18, v4 == 0, 0);
                  goto LABEL_103;
                }
                if (v100)
                {
                  DIDiskImageObjectRelease(v100);
                  v100 = 0;
                }
                v69 = MKCFWriteMedia();
                if ((_DWORD)v69)
                {
                  v27 = v69;
                  if (sub_212802440(a1, v88, v102, (uint64_t *)&v100))
                    goto LABEL_103;
                  v70 = sub_212821734((uint64_t)v100, v90, v18, 1, 0, -1);
                  v71 = v74 ^ 1;
                  if (v70)
                    v71 = 1;
                  if ((v71 & 1) != 0)
                    goto LABEL_103;
                  goto LABEL_137;
                }
                if (v75 < v18)
                {
                  v27 = sub_212821254((uint64_t)a1, v75, v4 == 0, 0);
                  goto LABEL_103;
                }
              }
LABEL_83:
              v27 = 0;
              goto LABEL_103;
            }
            MKMediaRef = sub_212821254((uint64_t)a1, v47, v4 == 0, 0);
            if (!(_DWORD)MKMediaRef)
            {
              v75 = v47;
              v50 = 1;
              goto LABEL_100;
            }
          }
LABEL_101:
          v27 = MKMediaRef;
          goto LABEL_102;
        }
        v76 = v18;
        v29 = v14;
        v30 = (const __CFNumber *)sub_2127FE630(v17, CFSTR("partition-resize-id-hint"));
        v31 = (const __CFNumber *)sub_2127FE630(v17, CFSTR("partition-resize-hint"));
        LODWORD(v86) = 0;
        if (v30 && CFNumberGetValue(v30, kCFNumberSInt32Type, &v101))
        {
          v25 = sub_2128219E0(v22, v101);
          if (v25)
          {
LABEL_41:
            v14 = v29;
            v18 = v76;
            goto LABEL_42;
          }
          v27 = 999;
        }
        else
        {
          if (v31 && CFNumberGetValue(v31, kCFNumberSInt32Type, &v86))
          {
            v27 = 999;
            if (!v22)
              goto LABEL_102;
            v35 = v86;
            if ((v86 & 0x80000000) != 0)
              goto LABEL_102;
            if (CFArrayGetCount(v22) <= v35)
              goto LABEL_102;
            v25 = (const __CFDictionary *)sub_2128023BC(v22, v35);
            if (!v25)
              goto LABEL_102;
            goto LABEL_41;
          }
          if (!v10)
          {
            MKMediaRef = sub_212821254((uint64_t)a1, v102, v4 == 0, 1);
            goto LABEL_101;
          }
          v27 = 0;
        }
LABEL_102:
        v26 = 0;
        goto LABEL_103;
      }
      v28 = sub_212821254((uint64_t)a1, valuePtr, v4 == 0, 1);
    }
    else
    {
      v28 = sub_212821734((uint64_t)a1, valuePtr, 0, 0, 0, -1);
    }
    v27 = v28;
  }
  else
  {
    v27 = 22;
  }
LABEL_111:
  CFRelease(v8);
  return v27;
}

uint64_t sub_212802340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  result = DIDiskImageReadSectors(a1);
  if (a5)
    *a5 = 0;
  return result;
}

const void *sub_212802380(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    TypeID = CFArrayGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

const void *sub_2128023BC(const __CFArray *a1, CFIndex a2)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  result = CFArrayGetValueAtIndex(a1, a2);
  if (result)
  {
    v3 = result;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

const void *sub_2128023F8(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_212802434(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

uint64_t sub_212802440(char *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  if (!a4)
    return 22;
  *a4 = 0;
  if (!a1)
    return 22;
  v8 = operator new();
  sub_2127F6A04(v8);
  *(_QWORD *)v8 = &off_24CE2A728;
  *(_QWORD *)(v8 + 176) = 0;
  if ((*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) < a2
    || a3 && a3 + a2 > (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1))
  {
    DIDiskImageObjectRelease((char *)v8);
    v8 = 0;
    result = 29;
  }
  else
  {
    *(_QWORD *)(v8 + 176) = a1;
    DIDiskImageObjectRetain_0(a1);
    *(_QWORD *)(v8 + 160) = a2;
    v10 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 288))(a1);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 520))(v8, v10);
    v11 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 296))(a1);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 512))(v8, v11);
    if (!a3)
      a3 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) - a2;
    *(_QWORD *)(v8 + 168) = a3;
    result = (*(uint64_t (**)(char *, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("thread-safe"));
    if (result)
    {
      (*(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)v8 + 32))(v8, CFSTR("thread-safe"), result);
      result = 0;
    }
  }
  *a4 = v8;
  return result;
}

void sub_2128025BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40CFA280B7);
  _Unwind_Resume(a1);
}

uint64_t sub_2128025E0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 168);
}

uint64_t sub_2128025E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3)
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 176) + 48))(*(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 160) + a2);
  else
    return 22;
}

void sub_212802620(_QWORD *a1)
{
  sub_212802678(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212802654(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40CFA280B7);
  _Unwind_Resume(a1);
}

_QWORD *sub_212802678(_QWORD *a1)
{
  char *v2;

  *a1 = &off_24CE2A728;
  v2 = (char *)a1[22];
  if (v2)
  {
    DIDiskImageObjectRelease(v2);
    a1[22] = 0;
  }
  return sub_2127FE034(a1);
}

void sub_2128026B4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2128026CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3)
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 176) + 64))(*(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 160) + a2);
  else
    return 22;
}

uint64_t sub_212802704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 160) + a2;
  if (v4 > (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 96))(*(_QWORD *)(a1 + 176)))
    return 29;
  result = 0;
  *(_QWORD *)(a1 + 168) = a2;
  return result;
}

__CFDictionary *sub_21280275C(char *a1, uint64_t a2)
{
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  void *v6;
  int v7;
  int i;
  char *v9;
  uint64_t v10;
  const void *v11;
  int v12;
  const void *v13;
  char *v14;
  const void *v15;
  __CFDictionary *v16;
  const void *v17;
  __CFDictionary *v18;
  const void *v19;
  const __CFArray *Value;
  const __CFArray *MutableCopy;
  const void *v22;
  unint64_t v23;
  uint64_t v24;
  CFStringRef v25;
  __CFDictionary *v26;
  char *v27;
  const void *v28;
  const void *v29;
  const __CFAllocator *allocator;
  int v32;
  CFTypeRef cf;
  int v34;

  v34 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    goto LABEL_52;
  allocator = v4;
  v6 = 0;
  v7 = 0;
  for (i = 0; ; ++i)
  {
    if (i == 2)
    {
      v9 = (char *)operator new();
      sub_212805294((uint64_t)v9, a1);
      goto LABEL_9;
    }
    if (i != 1)
      break;
    v9 = (char *)operator new();
    sub_212804BE8((uint64_t)v9, a1);
LABEL_9:
    v34 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)v9 + 56))(v9, a2);
    if (v34 > v7)
    {
      cf = 0;
      v10 = (*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(_QWORD *)v9 + 64))(v9, &v34, a2, &cf);
      if (v10)
      {
        v11 = (const void *)v10;
        v12 = v34;
        if (v34 > v7)
        {
          v13 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v9 + 48))(v9);
          CFDictionarySetValue(Mutable, CFSTR("partition-scheme"), v13);
          CFDictionarySetValue(Mutable, CFSTR("partitions"), v11);
          if (v6)
            CFRelease(v6);
          v6 = (void *)cf;
          cf = 0;
          v7 = v12;
        }
        CFRelease(v11);
      }
      if (cf)
        CFRelease(cf);
    }
    DIDiskImageObjectRelease(v9);
  }
  if (!i)
  {
    v9 = (char *)operator new();
    sub_212802D34((uint64_t)v9, a1);
    goto LABEL_9;
  }
  v32 = 0;
  cf = 0;
  v14 = (char *)operator new();
  sub_212805DE0((uint64_t)v14, a1);
  v15 = (const void *)(*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(_QWORD *)v14 + 64))(v14, &v32, a2, &cf);
  if (!v15)
    goto LABEL_22;
  if (v7)
  {
    v16 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v17 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v14 + 48))(v14);
    CFDictionarySetValue(v16, CFSTR("partition-scheme"), v17);
    CFDictionarySetValue(v16, CFSTR("partitions"), v15);
    sub_2127F0E84(v16, (CFDictionaryRef)cf, 0);
    CFDictionarySetValue(Mutable, CFSTR("hybrid-data"), v16);
    CFRelease(v16);
    if ((a2 & 4) != 0)
    {
      Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("partitions"));
      MutableCopy = CFArrayCreateMutableCopy(allocator, 0, Value);
      v22 = CFDictionaryGetValue(Mutable, CFSTR("partition-scheme"));
      v23 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
      sub_21281D8DC(MutableCopy, (CFArrayRef)v15, v23, a2);
      v24 = (*(uint64_t (**)(char *))(*(_QWORD *)v14 + 48))(v14);
      v25 = CFStringCreateWithFormat(allocator, 0, CFSTR("%@/%@"), v22, v24);
      CFDictionarySetValue(Mutable, CFSTR("partition-scheme"), v25);
      CFDictionarySetValue(Mutable, CFSTR("partitions"), MutableCopy);
      CFRelease(MutableCopy);
      CFRelease(v25);
      if (v6)
        v26 = CFDictionaryCreateMutableCopy(allocator, 0, (CFDictionaryRef)v6);
      else
        v26 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v18 = v26;
      CFDictionarySetValue(v26, CFSTR("burnable"), (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(v18, CFSTR("appendable"), (const void *)*MEMORY[0x24BDBD268]);
      if (v6)
        CFRelease(v6);
      v7 += v32;
    }
    else
    {
LABEL_22:
      v18 = (__CFDictionary *)v6;
    }
  }
  else
  {
    v19 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v14 + 48))(v14);
    CFDictionarySetValue(Mutable, CFSTR("partition-scheme"), v19);
    CFDictionarySetValue(Mutable, CFSTR("partitions"), v15);
    if (v6)
      CFRelease(v6);
    v18 = (__CFDictionary *)cf;
    cf = 0;
    v7 = v32;
  }
  DIDiskImageObjectRelease(v14);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v15)
    CFRelease(v15);
  if (!v7)
  {
    v32 = 0;
    cf = 0;
    v27 = (char *)operator new();
    sub_21280C3C4((uint64_t)v27, a1);
    v28 = (const void *)(*(uint64_t (**)(char *, int *, uint64_t, CFTypeRef *))(*(_QWORD *)v27 + 64))(v27, &v32, a2, &cf);
    if (v28)
    {
      v29 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v27 + 48))(v27);
      CFDictionarySetValue(Mutable, CFSTR("partition-scheme"), v29);
      CFDictionarySetValue(Mutable, CFSTR("partitions"), v28);
      if (v18)
        CFRelease(v18);
      v18 = (__CFDictionary *)cf;
      cf = 0;
      v7 = v32;
    }
    else
    {
      v7 = 0;
    }
    DIDiskImageObjectRelease(v27);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
    if (v28)
      CFRelease(v28);
  }
  if (v7 && v18)
  {
    sub_2127F0E84(Mutable, v18, 0);
    CFRelease(v18);
    return Mutable;
  }
  if (v18)
    CFRelease(v18);
  if (!v7)
  {
LABEL_52:
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

void sub_212802CF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

_QWORD *sub_212802D34(uint64_t a1, char *a2)
{
  _QWORD *result;

  result = (_QWORD *)sub_212802D54(a1, a2);
  *result = &off_24CE2BFC8;
  return result;
}

uint64_t sub_212802D54(uint64_t a1, char *a2)
{
  _QWORD *v4;

  v4 = (_QWORD *)sub_2127F3014(a1);
  *v4 = off_24CE2C0C8;
  v4[13] = 0;
  sub_212802DAC((uint64_t)v4, a2);
  return a1;
}

void sub_212802D94(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

char *sub_212802DAC(uint64_t a1, char *a2)
{
  char *result;

  if (a2)
    DIDiskImageObjectRetain_0(a2);
  result = *(char **)(a1 + 104);
  if (result)
    result = (char *)sub_2127F38CC(result);
  *(_QWORD *)(a1 + 104) = a2;
  return result;
}

uint64_t sub_212802DE8(uint64_t a1, uint64_t a2)
{
  const __CFArray *v2;
  const __CFArray *v3;
  unsigned int v5;

  v5 = 0;
  v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2))
      v5 = 0;
    CFRelease(v3);
  }
  return v5;
}

__CFArray *sub_212802E50(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  _OWORD *v8;
  _OWORD *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  CFDataRef v25;
  const __CFString *v26;
  const __CFString *v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  CFNumberRef v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  const void *Value;
  __CFDictionary **v39;
  const __CFAllocator *allocator;
  __CFDictionary *cf;
  int v43;
  __CFArray *theArray;
  uint64_t v45;
  uint64_t valuePtr;
  UInt8 __dst[512];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  valuePtr = 512;
  if (a4)
    *a4 = 0;
  v45 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = malloc_type_malloc(0x200uLL, 0x14CD3861uLL);
  v9 = v8;
  if (!v8)
    goto LABEL_59;
  v8[30] = 0u;
  v8[31] = 0u;
  v8[28] = 0u;
  v8[29] = 0u;
  v8[26] = 0u;
  v8[27] = 0u;
  v8[24] = 0u;
  v8[25] = 0u;
  v8[22] = 0u;
  v8[23] = 0u;
  v8[20] = 0u;
  v8[21] = 0u;
  v8[18] = 0u;
  v8[19] = 0u;
  v8[16] = 0u;
  v8[17] = 0u;
  v8[14] = 0u;
  v8[15] = 0u;
  v8[12] = 0u;
  v8[13] = 0u;
  v8[10] = 0u;
  v8[11] = 0u;
  v8[8] = 0u;
  v8[9] = 0u;
  v8[6] = 0u;
  v8[7] = 0u;
  v8[4] = 0u;
  v8[5] = 0u;
  v8[2] = 0u;
  v8[3] = 0u;
  *v8 = 0u;
  v8[1] = 0u;
  theArray = CFArrayCreateMutable(v6, 0, MEMORY[0x24BDBD690]);
  if (!theArray)
  {
LABEL_59:
    if (Mutable)
      CFRelease(Mutable);
    if (v9)
      free(v9);
    return 0;
  }
  allocator = v6;
  cf = Mutable;
  v39 = a4;
  v10 = 0;
  v11 = 0;
  LODWORD(v12) = 0;
  v43 = 0;
  v13 = 0;
  do
  {
    v14 = sub_2128033A4(a1);
    v15 = v10;
    if ((*(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t *, _OWORD *))(*(_QWORD *)v14 + 48))(v14, v10, 1, &v45, v9))
    {
      goto LABEL_58;
    }
    memcpy(__dst, v9, sizeof(__dst));
    if (*((unsigned __int16 *)v9 + 255) != 43605)
      goto LABEL_58;
    v16 = 0;
    v10 = 0;
    v17 = (uint64_t)v9 + 446;
    do
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, v17))
      {
        if (!v10)
        {
          v20 = *(_DWORD *)(v17 + 8) + v11;
          v21 = sub_2128033A4(a1);
          if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 96))(v21) <= v20)
            v10 = 0;
          else
            v10 = v20;
        }
      }
      else if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v17) & 1) != 0
             || !v16 && *(_DWORD *)((char *)v9 + 458) && (a3 & 8) != 0 && !*((_BYTE *)v9 + 450))
      {
        if ((_DWORD)v15)
          v22 = v12;
        else
          v22 = v16;
        v12 = (v22 + 1);
        if (((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 88))(a1, v17, v12, v15) & 1) != 0)
          goto LABEL_58;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, v17, v12, v15))
        {
          ++v13;
        }
        else
        {
          v23 = sub_212803468(a1, v17, v12, v15);
          if (v23)
          {
            v24 = v23;
            ++v43;
            CFArrayAppendValue(theArray, v23);
            CFRelease(v24);
          }
        }
      }
      ++v16;
      v17 += 16;
    }
    while (v16 != 4);
    if ((a3 & 1) != 0)
    {
      if ((_DWORD)v15)
      {
        v25 = 0;
        v26 = CFSTR("Extended Partition Record");
        v27 = CFSTR("XPR");
      }
      else
      {
        v25 = CFDataCreate(allocator, __dst, 446);
        v26 = CFSTR("Master Boot Record");
        v27 = CFSTR("MBR");
      }
      v28 = sub_21280368C(v15, 1, 0, v27, v26, 0, v18, v19);
      v29 = v28;
      if (v28 && v25)
      {
        CFDictionarySetValue(v28, CFSTR("boot-code"), v25);
      }
      else if (!v28)
      {
        goto LABEL_38;
      }
      CFArrayAppendValue(theArray, v29);
      CFRelease(v29);
LABEL_38:
      if (v25)
        CFRelease(v25);
    }
    if (!(_DWORD)v15)
    {
      v11 = v10;
      LODWORD(v12) = 4;
    }
  }
  while (v10);
  if (!v43)
    goto LABEL_58;
  v30 = sub_2128033A4(a1);
  v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 96))(v30);
  if ((sub_212804580(theArray, v31) & 1) != 0)
    goto LABEL_58;
  if ((a3 & 2) != 0)
  {
    v32 = sub_2128033A4(a1);
    v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v32 + 96))(v32);
    sub_212804910(theArray, v33, 0);
  }
  else
  {
    sub_212807A28(theArray);
  }
  v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(cf, CFSTR("block-size"), v34);
  CFRelease(v34);
  CFDictionarySetValue(cf, CFSTR("burnable"), (const void *)*MEMORY[0x24BDBD268]);
  if (v13)
  {
    sub_2128033A4(a1);
    v35 = sub_2128036D4();
    if (v35)
    {
      v36 = v35;
      if (CFDictionaryGetValue(v35, CFSTR("NTFS"))
        || CFDictionaryGetValue(v36, CFSTR("HFS+"))
        || CFDictionaryGetValue(v36, CFSTR("HFSX"))
        || CFDictionaryGetValue(v36, CFSTR("ProDOS"))
        || CFDictionaryGetValue(v36, CFSTR("NTFS"))
        || CFDictionaryGetValue(v36, CFSTR("FAT12"))
        || CFDictionaryGetValue(v36, CFSTR("FAT16")))
      {
        CFRelease(v36);
LABEL_58:
        CFRelease(theArray);
        Mutable = cf;
        goto LABEL_59;
      }
      Value = CFDictionaryGetValue(v36, CFSTR("FAT32"));
      CFRelease(v36);
      if (Value)
        goto LABEL_58;
    }
  }
  if (v39)
    *v39 = cf;
  else
    CFRelease(cf);
  free(v9);
  return theArray;
}

uint64_t sub_2128033A4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

BOOL sub_2128033AC(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a2 + 4);
  return v2 == 5 || v2 == 15 || v2 == 133;
}

BOOL sub_2128033CC(uint64_t a1, uint64_t a2)
{
  return *(_BYTE *)(a2 + 4) && *(_DWORD *)(a2 + 12) != 0;
}

uint64_t sub_2128033EC()
{
  return 0;
}

BOOL sub_2128033F4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_DWORD *)(a2 + 8);
  if (!v4)
    return 1;
  v6 = (v4 + a4);
  v7 = *(unsigned int *)(a2 + 12);
  v8 = sub_2128033A4(a1);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v8 + 96))(v8) <= v6)
    return 1;
  v9 = sub_2128033A4(a1);
  return v6 + v7 > (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 96))(v9);
}

__CFDictionary *sub_212803468(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  const __CFDictionary *v13;
  CFStringRef v14;
  CFStringRef v15;
  const __CFString *Value;
  CFStringRef v17;
  uint64_t v18;
  uint64_t v19;
  __CFDictionary *v20;
  __CFDictionary *v21;
  char *v22;
  int v23;
  char *v24;
  __CFDictionary *v25;
  __CFDictionary *v26;
  char *v28;

  v7 = *(unsigned int *)(a2 + 12);
  v8 = (*(_DWORD *)(a2 + 8) + a4);
  v9 = sub_2128033A4(a1);
  if (v8 + v7 > (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 96))(v9))
  {
    v10 = sub_2128033A4(a1);
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 96))(v10) - v8;
  }
  v11 = sub_212803618();
  v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v11)
  {
    v13 = (const __CFDictionary *)v11;
    v14 = CFStringCreateWithFormat(v12, 0, CFSTR("0x%02hX"), *(unsigned __int8 *)(a2 + 4));
    if (!v14)
      return 0;
    v15 = v14;
    Value = (const __CFString *)CFDictionaryGetValue(v13, v14);
    if (Value)
    {
      v17 = Value;
      CFRetain(Value);
      CFRelease(v15);
      goto LABEL_9;
    }
    CFRelease(v15);
  }
  v17 = CFStringCreateWithFormat(v12, 0, CFSTR("Type %02hX"), *(unsigned __int8 *)(a2 + 4));
LABEL_9:
  v20 = sub_21280368C(v8, v7, a3, v17, 0, 0, v18, v19);
  if (!v20)
  {
    if (v17)
      CFRelease(v17);
    return 0;
  }
  v21 = v20;
  v28 = 0;
  v22 = (char *)sub_2128033A4(a1);
  v23 = sub_212802440(v22, v8, v7, (uint64_t *)&v28);
  v24 = v28;
  if (!v23 && v28)
  {
    v25 = sub_2128036D4();
    if (v25)
    {
      v26 = v25;
      CFDictionarySetValue(v21, CFSTR("partition-filesystems"), v25);
      CFRelease(v26);
    }
    v24 = v28;
  }
  if (v24)
    DIDiskImageObjectRelease(v24);
  if (v17)
    CFRelease(v17);
  return v21;
}

uint64_t sub_212803618()
{
  uint64_t result;
  const __CFAllocator *v1;
  const __CFData *v2;

  result = qword_254B5ADB0;
  if (!qword_254B5ADB0)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple Computer//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>0x01</key>\n\t<string>DOS_FAT_12</string>\n\t<key>0x04</key>\n\t<string>DOS_FAT_16_S</string>\n\t<key>0x05</key>\n\t<string>DOS_Extended</string>\n\t<key>0x06</key>\n\t<string>DOS_FAT_16</string>\n\t<key>0x07</key>\n\t<string>Windows_NTFS</string>\n\t<key>0x0A</key>\n\t<string>Boot_Manager</string>\n\t<key>0x0B</key>\n"
                          "\t<string>DOS_FAT_32</string>\n"
                          "\t<key>0x0C</key>\n"
                          "\t<string>Windows_FAT_32</string>\n"
                          "\t<key>0x0E</key>\n"
                          "\t<string>Windows_FAT_16</string>\n"
                          "\t<key>0x0F</key>\n"
                          "\t<string>Windows_Extended</string>\n"
                          "\t<key>0x11</key>\n"
                          "\t<string>DOS_FAT_12_Hidden</string>\n"
                          "\t<key>0x14</key>\n"
                          "\t<string>DOS_FAT_16_S_Hidden</string>\n"
                          "\t<key>0x16</key>\n"
                          "\t<string>DOS_FAT_16_Hidden</string>\n"
                          "\t<key>0x17</key>\n"
                          "\t<string>Windows_NTFS_Hidden</string>\n"
                          "\t<key>0x1B</key>\n"
                          "\t<string>DOS_FAT_32_Hidden</string>\n"
                          "\t<key>0x1C</key>\n"
                          "\t<string>Windows_FAT_32_Hidden</string>\n"
                          "\t<key>0x1E</key>\n"
                          "\t<string>Windows_FAT_16_Hidden</string>\n"
                          "\t<key>0x63</key>\n"
                          "\t<string>UNIX</string>\n"
                          "\t<key>0x82</key>\n"
                          "\t<string>Linux_Swap</string>\n"
                          "\t<key>0x83</key>\n"
                          "\t<string>Linux_Ext2FS</string>\n"
                          "\t<key>0x84</key>\n"
                          "\t<string>Hibernation</string>\n"
                          "\t<key>0x85</key>\n"
                          "\t<string>Linux_Extended</string>\n"
                          "\t<key>0x86</key>\n"
                          "\t<string>Windows_FAT_16_FT</string>\n"
                          "\t<key>0x87</key>\n"
                          "\t<string>Windows_NTFS_FT</string>\n"
                          "\t<key>0xA5</key>\n"
                          "\t<string>FreeBSD</string>\n"
                          "\t<key>0xA6</key>\n"
                          "\t<string>OpenBSD</string>\n"
                          "\t<key>0xA7</key>\n"
                          "\t<string>NeXTSTEP</string>\n"
                          "\t<key>0xA8</key>\n"
                          "\t<string>Apple_UFS</string>\n"
                          "\t<key>0xA9</key>\n"
                          "\t<string>NetBSD</string>\n"
                          "\t<key>0xAB</key>\n"
                          "\t<string>Apple_Boot</string>\n"
                          "\t<key>0xAF</key>\n"
                          "\t<string>Apple_HFS</string>\n"
                          "\t<key>0xB7</key>\n"
                          "\t<string>BSDI</string>\n"
                          "\t<key>0xB8</key>\n"
                          "\t<string>BSDI_Swap</string>\n"
                          "\t<key>0xC6</key>\n"
                          "\t<string>Windows_FAT_16_FT_Corrupt</string>\n"
                          "\t<key>0xC7</key>\n"
                          "\t<string>Windows_NTFS_FT_Corrupt</string>\n"
                          "\t<key>0xEB</key>\n"
                          "\t<string>BeOS</string>\n"
                          "\t<key>0xF2</key>\n"
                          "\t<string>DOS_Secondary</string>\n"
                          "\t<key>0xFD</key>\n"
                          "\t<string>Linux_RAID</string>\n"
                          "</dict>\n"
                          "</plist>\n",
           2045);
    qword_254B5ADB0 = (uint64_t)CFPropertyListCreateFromXMLData(v1, v2, 0, 0);
    CFRelease(v2);
    return qword_254B5ADB0;
  }
  return result;
}

__CFDictionary *sub_21280368C(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8)
{
  return sub_2128036AC(a1, a2, a3, a4, a5, a6, a7, a8, 0);
}

__CFDictionary *sub_2128036AC(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, uint64_t a7, uint64_t a8, const __CFString *a9)
{
  return sub_21281DC14(a1, a2, a3, a4, a5, a6, &a9);
}

__CFDictionary *sub_2128036D4()
{
  uint64_t v0;
  const __CFAllocator *v1;
  __CFDictionary *Mutable;
  void *v3;
  void *v4;
  BOOL v5;
  const __CFDictionary *v8;
  int8x8_t v9;
  const __CFDictionary *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v15;
  char *v16;
  _OWORD *v17;
  unint64_t v18;
  int v20;
  uint64_t j;
  const __CFString *v25;
  const __CFDictionary *v26;
  const void *Value;
  const __CFString *v28;
  const __CFString *v29;
  unint64_t v30;
  uint8x8_t v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  __CFString *v38;
  int v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  int v44;
  uint64_t v45;
  int v46;
  const __CFDictionary *v48;
  const void *v49;
  const __CFString *v50;
  const __CFString *v51;
  CFStringRef v52;
  const __CFString *v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  _BOOL4 v57;
  BOOL v58;
  CFStringRef v60;
  const __CFString *v61;
  uint64_t SectorCount;
  uint64_t v63;
  unint64_t v64;
  CFStringRef v65;
  const __CFString *v66;
  unsigned int v67;
  char *v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  int v73;
  uint64_t v75;
  int v76;
  unint64_t v77;
  uint64_t v78;
  unsigned int v79;
  unsigned int v80;
  BOOL v81;
  int i;
  uid_t v83;
  int v84;
  int v85;
  ssize_t v86;
  int v87;
  CFStringEncoding v88;
  CFStringRef v89;
  int v90;
  __CFString *key;
  int v92;
  char buffer[2048];
  char v94;
  CFTypeRef cf[2];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char cStr[12];
  uint64_t v100;

  v0 = MEMORY[0x24BDAC7A8]();
  v100 = *MEMORY[0x24BDAC8D0];
  v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = malloc_type_malloc(0x10000uLL, 0xD923056DuLL);
  v4 = v3;
  if (Mutable)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
    goto LABEL_6;
  DIDiskImageGetSectorCount(v0);
  if (DIDiskImageReadSectors(v0))
    goto LABEL_9;
  *(_DWORD *)buffer = 0;
  cf[0] = 0;
  v8 = 0;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0, (uint64_t *)cf))
  {
    v26 = (const __CFDictionary *)MKCFCreateFSInfo();
    v8 = v26;
    if (v26)
    {
      if (CFDictionaryGetCount(v26))
      {
        Value = CFDictionaryGetValue(v8, CFSTR("Filesystem"));
        if (Value)
        {
          if (CFEqual(Value, CFSTR("APFS")))
          {
            v28 = (const __CFString *)CFDictionaryGetValue(v8, CFSTR("Volume name"));
            if (v28)
              v29 = v28;
            else
              v29 = CFSTR("Untitled");
            CFDictionarySetValue(Mutable, CFSTR("APFS"), v29);
          }
        }
      }
    }
  }
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  if (v8)
    CFRelease(v8);
  if (!sub_2128044AC(v0, (uint64_t)v4, 2, 1, (char *)cf))
  {
    if (LOWORD(cf[0]) == 11080 && (DWORD2(v97) & 0xFF010000) == 0 && bswap32(WORD1(cf[0])) >> 16 >= 4)
      CFDictionarySetValue(Mutable, CFSTR("HFS+"), &stru_24CE2CFF0);
    if (!sub_2128044AC(v0, (uint64_t)v4, 2, 1, (char *)cf)
      && LOWORD(cf[0]) == 22600
      && (DWORD2(v97) & 0xFF010000) == 0
      && bswap32(WORD1(cf[0])) >> 16 >= 5)
    {
      CFDictionarySetValue(Mutable, CFSTR("HFSX"), &stru_24CE2CFF0);
    }
  }
  if (sub_2128044AC(v0, (uint64_t)v4, 0, 4, (char *)cf)
    || LOBYTE(cf[0]) != 233 && (LOBYTE(cf[0]) != 235 || BYTE2(cf[0]) != 144))
  {
    goto LABEL_21;
  }
  v30 = *(unsigned __int16 *)((char *)&cf[1] + 3);
  if (*(unsigned __int16 *)((char *)&cf[1] + 3) < 0x200u)
    goto LABEL_21;
  if (*(unsigned __int16 *)((char *)&cf[1] + 3) > 0x800u)
    goto LABEL_21;
  v9.i32[0] = *(unsigned __int16 *)((char *)&cf[1] + 3);
  v31 = (uint8x8_t)vcnt_s8(v9);
  v31.i16[0] = vaddlv_u8(v31);
  if (v31.i32[0] > 1u)
    goto LABEL_21;
  v32 = BYTE5(cf[1]);
  if (!BYTE5(cf[1]) || ((BYTE5(cf[1]) - 1) & BYTE5(cf[1])) != 0)
    goto LABEL_21;
  v33 = (32 * *(unsigned __int16 *)((char *)&v96 + 1)
       + (unint64_t)(*(unsigned __int16 *)((char *)&cf[1] + 3) - 1))
      / *(unsigned __int16 *)((char *)&cf[1] + 3);
  if (WORD3(v96))
    v34 = WORD3(v96);
  else
    v34 = DWORD1(v97);
  if (*(_WORD *)((char *)&v96 + 3))
    v35 = *(unsigned __int16 *)((char *)&v96 + 3);
  else
    v35 = v97;
  v36 = (uint64_t)(v35 - (v33 + HIWORD(cf[1]) + v34 * (unint64_t)v96)) / BYTE5(cf[1]);
  v37 = CFSTR("FAT32");
  if (v36 < 65525)
    v37 = CFSTR("FAT16");
  v38 = v36 >= 4085 ? (__CFString *)v37 : CFSTR("FAT12");
  key = v38;
  v92 = (32 * *(unsigned __int16 *)((char *)&v96 + 1)
       + (unint64_t)(*(unsigned __int16 *)((char *)&cf[1] + 3) - 1))
      / *(unsigned __int16 *)((char *)&cf[1] + 3);
  v94 = 0;
  if ((_DWORD)v33)
  {
    v39 = 0;
    v40 = HIWORD(cf[1]) + v96 * WORD3(v96);
    v41 = (unint64_t)*(unsigned __int16 *)((char *)&cf[1] + 3) >> 9;
    while (2)
    {
      v42 = v40;
      v43 = v41;
      v44 = sub_2128044AC(v0, (uint64_t)v4, ((v40 + v39) * v30) >> 9, v41, buffer);
      if (v44)
      {
        v76 = v44;
      }
      else
      {
        v45 = 0;
        do
        {
          if (buffer[v45] != 229)
          {
            if (!buffer[v45])
              goto LABEL_188;
            v46 = buffer[v45 + 11];
            if (v46 != 15 && (v46 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_188;
            }
          }
          v45 += 32;
        }
        while (v45 < v30);
        ++v39;
        v40 = v42;
        v41 = v43;
        if (v39 != v92)
          continue;
LABEL_188:
        v76 = 0;
      }
      break;
    }
  }
  else
  {
    v67 = BYTE5(cf[1]) * *(unsigned __int16 *)((char *)&cf[1] + 3);
    v68 = (char *)malloc_type_malloc(v67, 0xFF9723F5uLL);
    v69 = HIDWORD(v97);
    if ((HIDWORD(v97) - 2) >= 0xFFFFFF4)
    {
LABEL_194:
      v76 = 0;
    }
    else
    {
      v70 = v67 >> 9;
      while (1)
      {
        v71 = sub_2128044AC(v0, (uint64_t)v4, ((HIWORD(cf[1]) + DWORD1(v97) * v96 + (v69 - 2) * v32) * v30) >> 9, v70, v68);
        if (v71)
          break;
        v72 = 0;
        do
        {
          if (v68[v72] != 229)
          {
            if (!v68[v72])
              goto LABEL_194;
            v73 = v68[v72 + 11];
            if (v73 != 15 && (v73 & 8) != 0)
            {
              __strncat_chk();
              goto LABEL_194;
            }
          }
          v72 += 32;
        }
        while (v72 < v67);
        v90 = 4 * v69;
        v75 = 4 * v69 / v30;
        v76 = sub_2128044AC(v0, (uint64_t)v4, ((v75 + HIWORD(cf[1])) * v30) >> 9, v30 >> 9, v68);
        if (!v76)
        {
          v69 = *(_DWORD *)&v68[(v90 - v75 * v30)] & 0xFFFFFFF;
          v70 = v67 >> 9;
          if (v69 - 2 < 0xFFFFFF4)
            continue;
        }
        goto LABEL_195;
      }
      v76 = v71;
    }
LABEL_195:
    free(v68);
  }
  if (v76)
    goto LABEL_21;
  if (!v94 && (!*(_WORD *)((char *)&v96 + 1) || BYTE6(v97) == 41))
    __strncat_chk();
  __strlcpy_chk();
  if (cStr[0] == 5)
    cStr[0] = -27;
  v78 = 0;
  while (1)
  {
    v79 = cStr[v78];
    v80 = (_DWORD)v78 ? 32 : 33;
    if (v80 > v79 || memchr("\"*+,./:;<=>?[\\]|", cStr[v78], 0x11uLL))
      break;
    if ((_DWORD)++v78 == 12)
    {
      LODWORD(v78) = 1;
      break;
    }
  }
  if (v79)
    v81 = 1;
  else
    v81 = (_DWORD)v78 == 0;
  if (v81)
    cStr[0] = 0;
  for (i = 10; i != -1; --i)
  {
    if (cStr[i] != 32)
      break;
    cStr[i] = 0;
  }
  v83 = getuid();
  if (getpwuid(v83))
  {
    __strlcpy_chk();
    __strlcat_chk();
    v84 = open(buffer, 0, 0);
    if ((v84 & 0x80000000) == 0)
    {
      v85 = v84;
      v86 = read(v84, buffer, 0x400uLL);
      buffer[v86 & ~(v86 >> 63)] = 0;
      close(v85);
      v87 = strtol(buffer, 0, 0);
      if (v87 <= 24)
      {
        v88 = 1056;
        switch(v87)
        {
          case 0:
            goto LABEL_243;
          case 1:
            goto LABEL_242;
          case 2:
            v88 = 1059;
            goto LABEL_242;
          case 3:
            v88 = 1058;
            goto LABEL_242;
          case 4:
            v88 = 1049;
            goto LABEL_242;
          case 5:
            v88 = 1047;
            goto LABEL_242;
          case 6:
            v88 = 1029;
            goto LABEL_242;
          case 7:
            goto LABEL_230;
          case 21:
            v88 = 1053;
            goto LABEL_242;
          default:
            goto LABEL_240;
        }
      }
      switch(v87)
      {
        case 25:
          v88 = 1057;
          break;
        case 26:
        case 27:
        case 28:
        case 30:
        case 31:
        case 32:
        case 33:
        case 34:
          goto LABEL_240;
        case 29:
        case 36:
        case 38:
          v88 = 1042;
          break;
        case 35:
          v88 = 1044;
          break;
        case 37:
          v88 = 1046;
          break;
        default:
          if (v87 == 140)
          {
            v88 = 1049;
          }
          else if (v87 == 152)
          {
LABEL_230:
            v88 = 1043;
          }
          else
          {
LABEL_240:
            v88 = -1;
          }
          break;
      }
LABEL_242:
      v89 = CFStringCreateWithCString(0, cStr, v88);
      if (v89)
        goto LABEL_244;
    }
  }
LABEL_243:
  v89 = CFStringCreateWithCString(0, cStr, 0x410u);
  if (v89)
  {
LABEL_244:
    CFDictionarySetValue(Mutable, key, v89);
    CFRelease(v89);
    goto LABEL_21;
  }
  CFDictionarySetValue(Mutable, key, CFSTR("UNTITLED"));
LABEL_21:
  cf[0] = 0;
  v10 = 0;
  if (!DIMediaKitCreateMKMediaRef(v0, (uint64_t)v1, 0, (uint64_t *)cf))
  {
    *(_DWORD *)buffer = 0;
    v48 = (const __CFDictionary *)MKCFCreateFSInfo();
    v10 = v48;
    if (!*(_DWORD *)buffer)
    {
      if (v48)
      {
        if (CFDictionaryGetCount(v48))
        {
          v49 = CFDictionaryGetValue(v10, CFSTR("Filesystem"));
          if (v49)
          {
            if (CFEqual(v49, CFSTR("NTFS")))
            {
              v50 = (const __CFString *)CFDictionaryGetValue(v10, CFSTR("Volume name"));
              if (v50)
                v51 = v50;
              else
                v51 = CFSTR("UNTITLED");
              CFDictionarySetValue(Mutable, CFSTR("NTFS"), v51);
              CFDictionaryRemoveValue(Mutable, CFSTR("FAT12"));
              CFDictionaryRemoveValue(Mutable, CFSTR("FAT16"));
              CFDictionaryRemoveValue(Mutable, CFSTR("FAT32"));
            }
          }
        }
      }
    }
  }
  if (cf[0])
  {
    CFRelease(cf[0]);
    cf[0] = 0;
  }
  if (v10)
    CFRelease(v10);
  v11 = (char *)malloc_type_calloc(0x800uLL, 0x10uLL, 0x9E45C449uLL);
  if (v11)
  {
    v12 = v11;
    if (!sub_2128044AC(v0, (uint64_t)v4, 64, 64, v11))
    {
      v13 = 0;
      while (v12[v13] || *(_WORD *)&v12[v13 + 1] != 21326 || v12[v13 + 3] != 82)
      {
        v13 += 2048;
        if ((_DWORD)v13 == 0x8000)
          goto LABEL_35;
      }
      SectorCount = DIDiskImageGetSectorCount(v0);
      v63 = SectorCount - 256;
      if (SectorCount >= 256)
      {
        v64 = SectorCount;
        if (sub_21280CD44(v0, (uint64_t)v4, 512, 256, (char *)cf)
          || sub_21280CD44(v0, (uint64_t)v4, 512, v63, (char *)cf)
          || sub_21280CD44(v0, (uint64_t)v4, 512, v64 - 1, (char *)cf)
          || v64 >= 0x400
          && (sub_21280CD44(v0, (uint64_t)v4, 2048, 256, (char *)cf)
           || (v77 = v64 >> 2, sub_21280CD44(v0, (uint64_t)v4, 2048, v77 - 256, (char *)cf))
           || sub_21280CD44(v0, (uint64_t)v4, 2048, v77 - 1, (char *)cf)))
        {
          v65 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
          if (v65)
            v66 = v65;
          else
            v66 = &stru_24CE2CFF0;
          CFDictionarySetValue(Mutable, CFSTR("UDF"), v66);
          CFRelease(v66);
        }
      }
    }
LABEL_35:
    free(v12);
  }
  v97 = 0u;
  v98 = 0u;
  *(_OWORD *)cf = 0u;
  v96 = 0u;
  v15 = (char *)malloc_type_malloc(0x800uLL, 0xD88B8BEDuLL);
  if (!v15)
    goto LABEL_138;
  v16 = v15;
  if (sub_2128044AC(v0, (uint64_t)v4, 64, 4, v15))
    goto LABEL_137;
  v17 = v16 + 40;
  v18 = 16;
  while (*(_DWORD *)(v16 + 1) == 808469571 && v16[5] == 49)
  {
    v20 = *v16;
    if (v20 == 1)
    {
      v16[120] = 0;
      *(_OWORD *)cf = *v17;
      v96 = *(_OWORD *)(v16 + 56);
      LOBYTE(v97) = 0;
      goto LABEL_49;
    }
    if (v20 != 2)
    {
      if (v20 == 255)
        goto LABEL_133;
LABEL_49:
      if (v18 > 0x72)
        goto LABEL_133;
      goto LABEL_71;
    }
    if ((*((_WORD *)v16 + 44) != 12069 || v16[90] != 64)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 67)
      && (*((_WORD *)v16 + 44) != 12069 || v16[90] != 69))
    {
      goto LABEL_49;
    }
    for (j = 0; j != 16; ++j)
    {
      if (!*((_WORD *)v17 + j))
        break;
      *((_WORD *)v17 + j) = __rev16(*((unsigned __int16 *)v17 + j));
    }
    v25 = CFStringCreateWithCharacters(v1, (const UniChar *)v16 + 20, j);
    if (CFStringGetCString(v25, buffer, 32, 0x8000100u))
    {
      strlen(buffer);
      __memmove_chk();
    }
    CFRelease(v25);
    if (v18 > 0x72 || LOBYTE(cf[0]))
      goto LABEL_133;
LABEL_71:
    ++v18;
    if (sub_2128044AC(v0, (uint64_t)v4, 4 * v18, 4, v16))
      goto LABEL_137;
  }
  if (!LOBYTE(cf[0]))
    goto LABEL_137;
LABEL_133:
  v52 = CFStringCreateWithCString(v1, (const char *)cf, 0x8000100u);
  if (v52)
    v53 = v52;
  else
    v53 = &stru_24CE2CFF0;
  CFDictionarySetValue(Mutable, CFSTR("ISO9660"), v53);
  CFRelease(v53);
LABEL_137:
  free(v16);
LABEL_138:
  if (!sub_2128044AC(v0, (uint64_t)v4, 2, 1, (char *)cf)
    && !(LOBYTE(cf[0]) | BYTE1(cf[0]))
    && (~BYTE4(cf[0]) & 0xF0) == 0
    && (BYTE4(cf[0]) & 0xF) != 0)
  {
    v54 = BYTE4(cf[0]) & 0xF;
    while (1)
    {
      v55 = *((unsigned __int8 *)cf + v54 + 4);
      if ((v55 - 97) < 0x1A)
        LOBYTE(v55) = v55 & 0xDF;
      v56 = (v55 - 65);
      v57 = v56 < 0x1A;
      if (!--v54)
        break;
      v58 = v56 >= 0x1A && (v55 - 48) >= 0xAu;
      if (v58 && v55 != 46 && v55 != 32)
        goto LABEL_6;
      if (!(_WORD)v54)
      {
        v57 = 1;
        break;
      }
    }
    if (v57 && BYTE3(v97) == 39 && BYTE4(v97) == 13)
    {
      v60 = CFStringCreateWithPascalString(v1, (ConstStr255Param)cf + 4, 0x600u);
      if (v60)
        v61 = v60;
      else
        v61 = &stru_24CE2CFF0;
      CFDictionarySetValue(Mutable, CFSTR("ProDOS"), v61);
      CFRelease(v61);
    }
  }
LABEL_6:
  if (Mutable)
  {
LABEL_9:
    if (!CFDictionaryGetCount(Mutable))
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
  }
  if (v4)
    free(v4);
  return Mutable;
}

uint64_t sub_2128044AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *__dst)
{
  uint64_t v6;
  char *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a4)
    return 0;
  v6 = a4;
  v14 = 0;
  v10 = __dst;
  while (1)
  {
    if (a3 < 128)
    {
      v13 = v6 << 9;
      memmove(__dst, (const void *)(a2 + (a3 << 9)), v6 << 9);
      v14 = v6;
      v12 = v6;
      goto LABEL_8;
    }
    DIDiskImageGetSectorCount(a1);
    result = DIDiskImageReadSectors(a1);
    if ((_DWORD)result)
      return result;
    v12 = v14;
    if (!v14)
      return 999;
    v13 = v14 << 9;
LABEL_8:
    v10 += v13;
    a3 += v12;
    v6 -= v12;
    if (!v6)
      return 0;
  }
}

uint64_t sub_212804580(CFArrayRef theArray, unint64_t a2)
{
  const __CFArray *MutableCopy;
  CFIndex Count;
  unint64_t v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v8;
  CFTypeID v9;
  uint64_t v10;
  uint64_t v12;
  unint64_t v13;
  CFRange v14;

  MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theArray);
  Count = CFArrayGetCount(MutableCopy);
  v12 = 0;
  v13 = 0;
  v14.length = CFArrayGetCount(MutableCopy);
  v14.location = 0;
  CFArraySortValues(MutableCopy, v14, (CFComparatorFunction)sub_2128046A0, 0);
  if (Count < 1)
  {
LABEL_10:
    v10 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, v6);
      if (!ValueAtIndex)
        break;
      v8 = ValueAtIndex;
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 != CFDictionaryGetTypeID() || !sub_212804784(v8, &v13, &v12, 0, 0, 0) || v5 > v13)
        break;
      v5 = v12 + v13;
      if (Count == ++v6)
      {
        if (v5 <= a2)
          goto LABEL_10;
        break;
      }
    }
    v10 = 1;
  }
  CFRelease(MutableCopy);
  return v10;
}

const __CFDictionary *sub_2128046A0(const __CFDictionary *result, const void *a2)
{
  const __CFDictionary *v3;
  CFTypeID v4;
  CFTypeID v5;
  CFTypeID TypeID;
  CFTypeID v7;
  CFTypeID v8;
  CFTypeRef cf;
  void *value;

  cf = 0;
  value = 0;
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 != CFDictionaryGetTypeID()
      || !CFDictionaryGetValueIfPresent(v3, CFSTR("partition-start"), (const void **)&value))
    {
      return 0;
    }
    v5 = CFGetTypeID(value);
    TypeID = CFNumberGetTypeID();
    result = 0;
    if (a2 && v5 == TypeID)
    {
      v7 = CFGetTypeID(a2);
      if (v7 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)a2, CFSTR("partition-start"), &cf))
        {
          v8 = CFGetTypeID(cf);
          if (v8 == CFNumberGetTypeID())
            return (const __CFDictionary *)CFNumberCompare((CFNumberRef)value, (CFNumberRef)cf, 0);
        }
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_212804784(CFDictionaryRef theDict, void *a2, void *a3, _DWORD *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t result;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFNumber *Value;
  const __CFNumber *v18;
  CFTypeID v19;
  uint64_t v20;
  CFTypeID v21;
  uint64_t v22;
  CFTypeID v23;

  if (a2)
  {
    result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("partition-start"));
    if (!result)
      return result;
    v13 = (const __CFNumber *)result;
    v14 = CFGetTypeID((CFTypeRef)result);
    if (v14 != CFNumberGetTypeID())
      return 0;
    result = CFNumberGetValue(v13, kCFNumberLongLongType, a2);
    if (!(_DWORD)result)
      return result;
  }
  if (a3)
  {
    result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("partition-length"));
    if (!result)
      return result;
    v15 = (const __CFNumber *)result;
    v16 = CFGetTypeID((CFTypeRef)result);
    if (v16 != CFNumberGetTypeID())
      return 0;
    result = CFNumberGetValue(v15, kCFNumberLongLongType, a3);
    if (!(_DWORD)result)
      return result;
  }
  if (a4)
  {
    *a4 = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("partition-number"));
    if (Value)
    {
      v18 = Value;
      v19 = CFGetTypeID(Value);
      if (v19 != CFNumberGetTypeID())
        return 0;
      result = CFNumberGetValue(v18, kCFNumberSInt32Type, a4);
      if (!(_DWORD)result)
        return result;
    }
  }
  if (a6)
  {
    result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("partition-name"));
    if (!result)
      return result;
    v20 = result;
    v21 = CFGetTypeID((CFTypeRef)result);
    if (v21 != CFStringGetTypeID())
      return 0;
    *a6 = v20;
  }
  if (!a5)
    return 1;
  result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("partition-hint"));
  if (!result)
    return result;
  v22 = result;
  v23 = CFGetTypeID((CFTypeRef)result);
  if (v23 == CFStringGetTypeID())
  {
    *a5 = v22;
    return 1;
  }
  return 0;
}

void sub_212804910(const __CFArray *a1, unint64_t a2, char a3)
{
  __CFArray *v4;
  const __CFArray *v5;
  CFRange v6;
  CFRange v7;

  v4 = sub_212804984(a1, a2, a3);
  if (v4)
  {
    v5 = v4;
    if (CFArrayGetCount(v4))
    {
      v7.length = CFArrayGetCount(v5);
      v7.location = 0;
      CFArrayAppendArray(a1, v5, v7);
    }
    CFRelease(v5);
  }
  v6.length = CFArrayGetCount(a1);
  v6.location = 0;
  CFArraySortValues(a1, v6, (CFComparatorFunction)sub_2128046A0, 0);
}

__CFArray *sub_212804984(const __CFArray *a1, unint64_t a2, char a3)
{
  CFIndex Count;
  __CFArray *Mutable;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  unint64_t v11;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v13;
  CFTypeID v14;
  unint64_t v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  uint64_t v19;
  unint64_t v20;
  CFRange v21;

  Count = CFArrayGetCount(a1);
  v19 = 0;
  v20 = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v21.length = CFArrayGetCount(a1);
  v21.location = 0;
  CFArraySortValues(a1, v21, (CFComparatorFunction)sub_2128046A0, 0);
  if (Count < 1)
  {
    v11 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v10);
      if (ValueAtIndex)
      {
        v13 = ValueAtIndex;
        v14 = CFGetTypeID(ValueAtIndex);
        if (v14 == CFDictionaryGetTypeID())
        {
          if (sub_212804784(v13, &v20, &v19, 0, 0, 0))
          {
            v15 = v20;
            if (v20 > v11)
            {
              v16 = sub_2128036AC(v11, v20 - v11, 0, CFSTR("Apple_Free"), &stru_24CE2CFF0, 0, v8, v9, 0);
              CFArrayAppendValue(Mutable, v16);
              CFRelease(v16);
              v15 = v20;
            }
            v11 = v19 + v15;
          }
        }
      }
      ++v10;
    }
    while (Count != v10);
  }
  if (a2 > v11 && (a3 & 1) == 0)
  {
    v17 = sub_2128036AC(v11, a2 - v11, 0, CFSTR("Apple_Free"), &stru_24CE2CFF0, 0, v8, v9, 0);
    CFArrayAppendValue(Mutable, v17);
    CFRelease(v17);
  }
  return Mutable;
}

const __CFString *sub_212804B30()
{
  return CFSTR("fdisk");
}

void sub_212804B3C(_QWORD *a1)
{
  sub_212804B94(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212804B70(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

_QWORD *sub_212804B94(_QWORD *a1)
{
  char *v2;

  *a1 = off_24CE2C0C8;
  v2 = (char *)a1[13];
  if (v2)
    sub_2127F38CC(v2);
  a1[13] = 0;
  return sub_2127F3E08(a1);
}

void sub_212804BD0(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F3E08(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_212804BE8(uint64_t a1, char *a2)
{
  _QWORD *result;

  result = (_QWORD *)sub_212802D54(a1, a2);
  *result = &off_24CE2BF40;
  return result;
}

uint64_t sub_212804C08(uint64_t a1, uint64_t a2)
{
  const __CFArray *v2;
  const __CFArray *v3;
  unsigned int v5;

  v5 = 0;
  v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    v3 = v2;
    v5 += 100;
    if (!CFArrayGetCount(v2))
      v5 = 0;
    CFRelease(v3);
  }
  return v5;
}

const __CFArray *sub_212804C70(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  const __CFAllocator *v8;
  CFMutableDictionaryRef Mutable;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  CFMutableArrayRef v12;
  uint64_t v13;
  const __CFArray *v14;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  BOOL v19;
  unsigned int v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  const void *v29;
  const void *v30;
  CFDataRef v31;
  uint64_t v32;
  uint64_t v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  CFNumberRef v40;
  const void *v41;
  __CFDictionary **v42;
  const __CFAllocator *allocator;
  __CFDictionary *theDict;
  unsigned int v45;
  char v46;
  __CFArray *cf;
  unsigned int v48;
  __int16 valuePtr;
  uint64_t v50;
  _WORD __dst[256];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  v50 = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xD56A321AuLL);
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  *((_OWORD *)v10 + 30) = 0u;
  *((_OWORD *)v10 + 31) = 0u;
  *((_OWORD *)v10 + 28) = 0u;
  *((_OWORD *)v10 + 29) = 0u;
  *((_OWORD *)v10 + 26) = 0u;
  *((_OWORD *)v10 + 27) = 0u;
  *((_OWORD *)v10 + 24) = 0u;
  *((_OWORD *)v10 + 25) = 0u;
  *((_OWORD *)v10 + 22) = 0u;
  *((_OWORD *)v10 + 23) = 0u;
  *((_OWORD *)v10 + 20) = 0u;
  *((_OWORD *)v10 + 21) = 0u;
  *((_OWORD *)v10 + 18) = 0u;
  *((_OWORD *)v10 + 19) = 0u;
  *((_OWORD *)v10 + 16) = 0u;
  *((_OWORD *)v10 + 17) = 0u;
  *((_OWORD *)v10 + 14) = 0u;
  *((_OWORD *)v10 + 15) = 0u;
  *((_OWORD *)v10 + 12) = 0u;
  *((_OWORD *)v10 + 13) = 0u;
  *((_OWORD *)v10 + 10) = 0u;
  *((_OWORD *)v10 + 11) = 0u;
  *((_OWORD *)v10 + 8) = 0u;
  *((_OWORD *)v10 + 9) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 7) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  v12 = CFArrayCreateMutable(v8, 0, MEMORY[0x24BDBD690]);
  if (!v12)
    goto LABEL_7;
  cf = v12;
  allocator = v8;
  theDict = Mutable;
  v42 = a4;
  v13 = sub_2128033A4(a1);
  if (!(*(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)v13 + 48))(v13, 0, 1, &v50, v11))
  {
    v16 = 512;
    memcpy(__dst, v11, sizeof(__dst));
    if (*v11 == 21061)
    {
      v17 = v11[1];
      *a2 += 2000;
      if (v17 == 8)
      {
        v18 = sub_2128033A4(a1);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)v18 + 48))(v18, 1, 1, &v50, v11))
        {
          goto LABEL_6;
        }
        v19 = *v11 == 19792;
        v20 = 512;
        if (*v11 == 19792)
          v16 = 512;
        else
          v16 = 2048;
      }
      else
      {
        v20 = 0;
        v19 = 0;
        v16 = __rev16(v17);
      }
    }
    else
    {
      v20 = 0;
      v19 = 0;
    }
    v21 = 1;
    v45 = 0;
    v46 = !v19;
    v22 = v16;
    v48 = 1;
    do
    {
      if ((unint64_t)v22 + 512 <= v20 + 512)
      {
        v25 = v20;
      }
      else
      {
        v23 = sub_2128033A4(a1);
        v24 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)v23 + 48))(v23, v22 >> 9, 1, &v50, v11);
        v25 = v22;
        v20 = v22;
        if (v24)
          goto LABEL_6;
      }
      v26 = (char *)v11 + v22 - v25;
      if (*(_WORD *)v26 != 19792)
        goto LABEL_6;
      if (!strcmp(v26 + 48, "Apple_partition_map")
        || !strcmp(v26 + 48, "Apple_Partition_Map")
        || !strcmp(v26 + 48, "Apple_patition_map"))
      {
        v48 = bswap32(*((_DWORD *)v26 + 1));
        v45 = bswap32(*((_DWORD *)v26 + 3));
        strcpy(v26 + 48, "Apple_partition_map");
      }
      else if (v48 == 1)
      {
        v48 = bswap32(*((_DWORD *)v26 + 1));
      }
      v27 = v46;
      if ((v21 & 3) != 0)
        v27 = 1;
      v28 = v16;
      if ((v27 & 1) == 0)
      {
        if (!strcmp(v26 + 48, "Apple_Driver")
          || !strcmp(v26 + 48, "Apple_Driver43")
          || !strcmp(v26 + 48, "Apple_Driver43_CD")
          || !strcmp(v26 + 48, "Apple_Driver_ATA")
          || !strcmp(v26 + 48, "Apple_Driver_ATAPI")
          || (v28 = v16, !strcmp(v26 + 48, "Apple_Patches")))
        {
          v28 = 2048;
        }
      }
      if (((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)a1 + 72))(a1, v26, v21, v28) & 1) != 0)
        goto LABEL_6;
      if (!(_DWORD)a3
        || ((*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v26, v21, v28) & 1) == 0)
      {
        v29 = (const void *)(*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 88))(a1, v26, v21, v28, a3);
        if (v29)
        {
          v30 = v29;
          CFArrayAppendValue(cf, v29);
          CFRelease(v30);
        }
      }
      v21 = (v21 + 1);
      v22 += v16;
    }
    while (v21 <= v48);
    if (!v45)
      goto LABEL_6;
    if ((a3 & 1) != 0)
    {
      v31 = CFDataCreate(allocator, (const UInt8 *)__dst, 512);
      v34 = sub_21280368C(0, 1, 0, CFSTR("DDM"), CFSTR("Driver Descriptor Map"), v31, v32, v33);
      v14 = cf;
      if (v34)
      {
        v35 = v34;
        CFArrayAppendValue(cf, v34);
        CFRelease(v35);
      }
      if (v31)
        CFRelease(v31);
    }
    else
    {
      v14 = cf;
      if (!(_DWORD)a3)
        goto LABEL_59;
    }
    v36 = sub_2128033A4(a1);
    v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v36 + 96))(v36);
    if ((sub_212804580(v14, v37) & 1) != 0)
      goto LABEL_6;
    v14 = cf;
    if ((a3 & 2) != 0)
    {
      v38 = sub_2128033A4(a1);
      v39 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 96))(v38);
      sub_212804910(cf, v39, 0);
LABEL_61:
      valuePtr = bswap32(__dst[1]) >> 16;
      v40 = CFNumberCreate(allocator, kCFNumberSInt16Type, &valuePtr);
      CFDictionarySetValue(theDict, CFSTR("block-size"), v40);
      CFRelease(v40);
      v41 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(theDict, CFSTR("appendable"), (const void *)*MEMORY[0x24BDBD270]);
      CFDictionarySetValue(theDict, CFSTR("burnable"), v41);
      free(v11);
      if (v42)
        *v42 = theDict;
      else
        CFRelease(theDict);
      return v14;
    }
LABEL_59:
    sub_212807A28(v14);
    goto LABEL_61;
  }
LABEL_6:
  CFRelease(cf);
  Mutable = theDict;
LABEL_7:
  if (Mutable)
    CFRelease(Mutable);
  if (v11)
    free(v11);
  return 0;
}

void sub_21280523C(_QWORD *a1)
{
  sub_212804B94(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212805270(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

_QWORD *sub_212805294(uint64_t a1, char *a2)
{
  _QWORD *result;

  result = (_QWORD *)sub_212802D54(a1, a2);
  *result = &off_24CE2CAF8;
  return result;
}

uint64_t sub_2128052B4(uint64_t a1, uint64_t a2)
{
  const __CFArray *v2;
  const __CFArray *v3;
  unsigned int v5;

  v5 = 0;
  v2 = (const __CFArray *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 64))(a1, &v5, a2, 0);
  if (v2)
  {
    v3 = v2;
    v5 += 101;
    if (!CFArrayGetCount(v2))
      v5 = 0;
    CFRelease(v3);
  }
  return v5;
}

__CFArray *sub_21280531C(uint64_t a1, uint64_t a2, char a3, __CFDictionary **a4)
{
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  _OWORD *v9;
  _QWORD *v10;
  CFMutableArrayRef v11;
  __CFArray *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uInt v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  __CFDictionary *v31;
  __CFDictionary *v32;
  uint64_t v33;
  uint64_t v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v53;
  unint64_t v54;
  CFNumberRef v55;
  uint64_t v56;
  uint64_t v57;
  uInt len[2];
  __CFDictionary *lena;
  uint64_t v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t valuePtr;

  valuePtr = 512;
  if (a4)
    *a4 = 0;
  v64 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v9 = malloc_type_malloc(0x200uLL, 0xD8C951D1uLL);
  v10 = v9;
  if (v9)
  {
    v9[30] = 0u;
    v9[31] = 0u;
    v9[28] = 0u;
    v9[29] = 0u;
    v9[26] = 0u;
    v9[27] = 0u;
    v9[24] = 0u;
    v9[25] = 0u;
    v9[22] = 0u;
    v9[23] = 0u;
    v9[20] = 0u;
    v9[21] = 0u;
    v9[18] = 0u;
    v9[19] = 0u;
    v9[16] = 0u;
    v9[17] = 0u;
    v9[14] = 0u;
    v9[15] = 0u;
    v9[12] = 0u;
    v9[13] = 0u;
    v9[10] = 0u;
    v9[11] = 0u;
    v9[8] = 0u;
    v9[9] = 0u;
    v9[6] = 0u;
    v9[7] = 0u;
    v9[4] = 0u;
    v9[5] = 0u;
    v9[2] = 0u;
    v9[3] = 0u;
    *v9 = 0u;
    v9[1] = 0u;
    v11 = CFArrayCreateMutable(v7, 8, MEMORY[0x24BDBD690]);
    if (v11)
    {
      v12 = v11;
      v13 = sub_2128033A4(a1);
      if (!(*(unsigned int (**)(uint64_t, _QWORD, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)v13 + 48))(v13, 0, 1, &v64, v10)&& *((unsigned __int16 *)v10 + 255) == 43605)
      {
        v14 = 0;
        v15 = 0;
        do
        {
          if (BYTE2(v10[2 * v14 + 56]) == 238)
          {
            if (v15)
              goto LABEL_48;
            v15 = ++v14;
          }
          else
          {
            ++v14;
          }
        }
        while (v14 != 4);
        if (v15)
        {
          v16 = sub_2128033A4(a1);
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)v16 + 48))(v16, 1, 1, &v64, v10)&& *v10 == 0x5452415020494645)
          {
            v17 = *((_DWORD *)v10 + 3);
            if (v17 - 513 >= 0xFFFFFE5B)
            {
              v18 = *((unsigned int *)v10 + 4);
              *((_DWORD *)v10 + 4) = 0;
              if (crc32(0, (const Bytef *)v10, v17) == v18)
              {
                v19 = *((unsigned int *)v10 + 21);
                if ((v19 - 0x10000) >= 0xFFFF0080)
                {
                  v20 = *((unsigned int *)v10 + 20);
                  if (!WORD1(v20))
                  {
                    v60 = *((unsigned int *)v10 + 22);
                    v62 = v10[9];
                    free(v10);
                    *(_QWORD *)len = (unsigned __int16)v20 * v19;
                    if (((*(_QWORD *)len + 511) & 0xFFFFFE00) != 0)
                    {
                      v10 = malloc_type_malloc((*(_QWORD *)len + 511) & 0xFFFFFE00, 0x5030E679uLL);
                      if (v10)
                      {
                        v21 = sub_2128033A4(a1);
                        v56 = v62 & 0x7FFFFFFFFFFFFFLL;
                        v57 = (len[0] + 511) >> 9;
                        if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v21 + 48))(v21)
                          && crc32(0, (const Bytef *)v10, len[0]) == v60
                          && (_DWORD)v20)
                        {
                          v61 = 0;
                          v63 = v20 + 1;
                          v22 = 1;
                          v23 = v10;
                          do
                          {
                            sub_21281FEE0(v23);
                            *(int8x8_t *)&v24 = sub_21281FEE0(v23 + 2);
                            if ((*(unsigned int (**)(uint64_t, uint64_t *, double))(*(_QWORD *)a1 + 72))(a1, v23, v24))
                            {
                              if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 80))(a1, v23, v22) & 1) != 0)goto LABEL_48;
                              if (((*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)a1 + 88))(a1, v23, v22) & 1) == 0)
                              {
                                v27 = sub_212805948(a1, (uint64_t)v23, v22);
                                if (v27)
                                {
                                  ++v61;
                                  lena = v27;
                                  CFArrayAppendValue(v12, v27);
                                  CFRelease(lena);
                                }
                              }
                            }
                            ++v22;
                            v23 = (uint64_t *)((char *)v23 + v19);
                          }
                          while (v63 != v22);
                          if (v61)
                          {
                            if ((a3 & 1) != 0)
                            {
                              v28 = sub_21280368C(0, 1, 0, CFSTR("MBR"), CFSTR("Protective Master Boot Record"), 0, v25, v26);
                              if (v28)
                              {
                                v31 = v28;
                                CFArrayAppendValue(v12, v28);
                                CFRelease(v31);
                              }
                              v32 = sub_21280368C(1, 1, 0, CFSTR("Primary GPT Header"), CFSTR("GPT Header"), 0, v29, v30);
                              if (v32)
                              {
                                v35 = v32;
                                CFArrayAppendValue(v12, v32);
                                CFRelease(v35);
                              }
                              v36 = sub_21280368C(v56, v57, 0, CFSTR("Primary GPT Table"), CFSTR("GPT Partition Data"), 0, v33, v34);
                              if (v36)
                              {
                                v37 = v36;
                                CFArrayAppendValue(v12, v36);
                                CFRelease(v37);
                              }
                              v38 = sub_2128033A4(a1);
                              v39 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v38 + 96))(v38);
                              v42 = sub_21280368C(v39 + ~v57, v57, 0, CFSTR("Backup GPT Table"), CFSTR("GPT Partition Data"), 0, v40, v41);
                              if (v42)
                              {
                                v43 = v42;
                                CFArrayAppendValue(v12, v42);
                                CFRelease(v43);
                              }
                              v44 = sub_2128033A4(a1);
                              v45 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v44 + 96))(v44);
                              v48 = sub_21280368C(v45 - 1, 1, 0, CFSTR("Backup GPT Header"), CFSTR("GPT Header"), 0, v46, v47);
                              if (v48)
                              {
                                v49 = v48;
                                CFArrayAppendValue(v12, v48);
                                CFRelease(v49);
                              }
                            }
                            v50 = sub_2128033A4(a1);
                            v51 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v50 + 96))(v50);
                            if ((sub_212804580(v12, v51) & 1) == 0)
                            {
                              if ((a3 & 2) != 0)
                              {
                                v53 = sub_2128033A4(a1);
                                v54 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v53 + 96))(v53);
                                sub_212804910(v12, v54, 0);
                              }
                              else
                              {
                                sub_212807A28(v12);
                              }
                              v55 = CFNumberCreate(v7, kCFNumberLongLongType, &valuePtr);
                              CFDictionarySetValue(Mutable, CFSTR("block-size"), v55);
                              CFRelease(v55);
                              CFDictionarySetValue(Mutable, CFSTR("burnable"), (const void *)*MEMORY[0x24BDBD268]);
                              free(v10);
                              if (a4)
                                *a4 = Mutable;
                              else
                                CFRelease(Mutable);
                              return v12;
                            }
                          }
                        }
                      }
                    }
                    else
                    {
                      v10 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_48:
      CFRelease(v12);
    }
  }
  if (Mutable)
    CFRelease(Mutable);
  if (v10)
    free(v10);
  return 0;
}

BOOL sub_2128058D8(int a1, unsigned __int8 *uu)
{
  return uuid_is_null(uu) == 0;
}

uint64_t sub_2128058F8()
{
  return 0;
}

BOOL sub_212805900(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a2 + 40);
  if (*(_QWORD *)(a2 + 32) == v2)
    return 1;
  v4 = v2 + 1;
  v5 = sub_2128033A4(a1);
  return v4 > (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 96))(v5);
}

__CFDictionary *sub_212805948(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const UInt8 *v7;
  const __CFAllocator *v8;
  const __CFString *v9;
  const __CFString *v10;
  CFIndex Length;
  CFIndex v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  CFStringRef v17;
  CFStringRef v18;
  CFStringRef v19;
  const __CFDictionary *Value;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  __CFDictionary *v24;
  char *v25;
  int v26;
  char *v27;
  __CFDictionary *v28;
  const __CFDictionary *v29;
  const __CFString *v30;
  CFStringRef v31;
  uint64_t cStr[6];
  char __dst[109];
  uuid_string_t out;
  uint64_t v36;

  v6 = 0;
  v36 = *MEMORY[0x24BDAC8D0];
  __dst[0] = 0;
  v7 = (const UInt8 *)(a2 + 56);
  do
  {
    if (!*(_WORD *)(a2 + 2 * v6 + 56))
      break;
    ++v6;
  }
  while (v6 != 72);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD240], v7, 2 * v6, 0x14000100u, 0);
  if (v9)
  {
    v10 = v9;
    Length = CFStringGetLength(v9);
    v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    v13 = (char *)malloc_type_malloc(v12, 0x2096BE47uLL);
    if (v13)
    {
      v14 = v13;
      if (CFStringGetCString(v10, v13, v12, 0x8000100u) && strlen(v14) <= 0x6D)
        strlcpy(__dst, v14, 0x6DuLL);
      CFRelease(v10);
      free(v14);
    }
    else
    {
      CFRelease(v10);
    }
  }
  uuid_unparse((const unsigned __int8 *)a2, out);
  v15 = *(_QWORD *)(a2 + 32);
  v16 = *(_QWORD *)(a2 + 40) - v15 + 1;
  if (__dst[0])
    v17 = CFStringCreateWithCString(v8, __dst, 0x8000100u);
  else
    v17 = CFStringCreateWithFormat(v8, 0, CFSTR("Untitled %u"), a3);
  v18 = v17;
  v19 = CFStringCreateWithCString(v8, out, 0x8000100u);
  Value = (const __CFDictionary *)sub_212805D00();
  if (Value)
    Value = (const __CFDictionary *)CFDictionaryGetValue(Value, v19);
  if (Value)
    v21 = (const __CFString *)Value;
  else
    v21 = v19;
  CFRetain(v21);
  v24 = sub_21280368C(v15, v16, a3, v21, v18, 0, v22, v23);
  if (v24)
  {
    cStr[0] = 0;
    v25 = (char *)sub_2128033A4(a1);
    v26 = sub_212802440(v25, v15, v16, cStr);
    v27 = (char *)cStr[0];
    if (v26 || !cStr[0])
      goto LABEL_31;
    v28 = sub_2128036D4();
    if (!v28)
    {
LABEL_30:
      v27 = (char *)cStr[0];
LABEL_31:
      if (v27)
        DIDiskImageObjectRelease(v27);
      uuid_unparse((const unsigned __int8 *)(a2 + 16), (char *)cStr);
      v31 = CFStringCreateWithCString(v8, (const char *)cStr, 0x8000100u);
      CFDictionarySetValue(v24, CFSTR("partition-UUID"), v31);
      CFDictionarySetValue(v24, CFSTR("partition-hint-UUID"), v19);
      if (v31)
        CFRelease(v31);
      goto LABEL_35;
    }
    v29 = v28;
    CFDictionarySetValue(v24, CFSTR("partition-filesystems"), v28);
    if (CFStringCompare(v21, CFSTR("Apple_HFS"), 0))
    {
      if (CFDictionaryGetValue(v29, CFSTR("NTFS")))
      {
        v30 = CFSTR("Windows_NTFS");
      }
      else
      {
        if (CFStringCompare(v21, CFSTR("DOS_FAT"), 0))
          goto LABEL_29;
        if (CFDictionaryGetValue(v29, CFSTR("FAT12")))
        {
          v30 = CFSTR("DOS_FAT_12");
        }
        else if (CFDictionaryGetValue(v29, CFSTR("FAT16")))
        {
          v30 = CFSTR("DOS_FAT_16");
        }
        else
        {
          if (!CFDictionaryGetValue(v29, CFSTR("FAT32")))
            goto LABEL_29;
          v30 = CFSTR("DOS_FAT_32");
        }
      }
    }
    else
    {
      if (!CFDictionaryGetValue(v29, CFSTR("HFSX")))
      {
LABEL_29:
        CFRelease(v29);
        goto LABEL_30;
      }
      v30 = CFSTR("Apple_HFSX");
    }
    CFDictionarySetValue(v24, CFSTR("partition-hint"), v30);
    goto LABEL_29;
  }
LABEL_35:
  if (v19)
    CFRelease(v19);
  if (v21)
    CFRelease(v21);
  if (v18)
    CFRelease(v18);
  return v24;
}

uint64_t sub_212805D00()
{
  uint64_t result;
  const __CFAllocator *v1;
  const __CFData *v2;
  const __CFData *v3;

  result = qword_254B5ADC0;
  if (!qword_254B5ADC0)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n\t<key>48465300-0000-11AA-AA11-00306543ECAC</key>\n\t<string>Apple_HFS</string>\n\t<key>7C3457EF-0000-11AA-AA11-00306543ECAC</key>\n\t<string>Apple_APFS</string>\n\t<key>EBD0A0A2-B9E5-4433-87C0-68B6B72699C7</key>\n\t<string>DOS_FAT</string>\n</dict>\n</plist>\n", 418);
    if (v2)
    {
      v3 = v2;
      qword_254B5ADC0 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0, 0, 0);
      CFRelease(v3);
    }
    return qword_254B5ADC0;
  }
  return result;
}

const __CFString *sub_212805D7C()
{
  return CFSTR("GUID");
}

void sub_212805D88(_QWORD *a1)
{
  sub_212804B94(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212805DBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

_QWORD *sub_212805DE0(uint64_t a1, char *a2)
{
  _QWORD *result;

  result = (_QWORD *)sub_212802D54(a1, a2);
  *result = &off_24CE2CA88;
  return result;
}

uint64_t sub_212805E00(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  const __CFAllocator *v6;
  CFMutableArrayRef Mutable;
  uint64_t v8;
  CFMutableDictionaryRef v9;
  CFTypeRef cf;
  __int16 valuePtr;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v8 = sub_2128033A4(a1);
  cf = 0;
  if (a4)
    *a4 = 0;
  valuePtr = 0;
  v9 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!DIMediaKitCreateMKMediaRef(v8, 0, 0, (uint64_t *)&cf))
    MKDetectISO();
  if (cf)
    CFRelease(cf);
  if (Mutable)
    CFRelease(Mutable);
  if (v9)
    CFRelease(v9);
  return 0;
}

void sub_212806158(_QWORD *a1)
{
  sub_212804B94(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280618C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

void sub_2128061B0(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6;

  v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
    CFDictionaryAddValue((CFMutableDictionaryRef)cf, a1, a2);
}

uint64_t sub_212806210(const __CFArray *a1, CFIndex a2, _QWORD *a3, _QWORD *a4, void **a5, void **a6)
{
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  CFTypeID v12;
  CFTypeID v13;
  uint64_t result;
  CFTypeID v15;
  void *value;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = &stru_24CE2CFF0;
  if (a6)
    *a6 = &stru_24CE2CFF0;
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (!ValueAtIndex)
    return 999;
  v11 = ValueAtIndex;
  v12 = CFGetTypeID(ValueAtIndex);
  if (v12 != CFDictionaryGetTypeID())
    return 999;
  value = 0;
  if (a3)
  {
    if (!CFDictionaryGetValueIfPresent(v11, CFSTR("partition-start"), (const void **)&value)
      || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a3))
    {
      return 999;
    }
  }
  if (a4
    && (!CFDictionaryGetValueIfPresent(v11, CFSTR("partition-length"), (const void **)&value)
     || !CFNumberGetValue((CFNumberRef)value, kCFNumberLongLongType, a4)))
  {
    return 999;
  }
  if (a5 && CFDictionaryGetValueIfPresent(v11, CFSTR("partition-hint"), (const void **)&value))
  {
    v13 = CFGetTypeID(value);
    if (v13 == CFStringGetTypeID())
      *a5 = value;
  }
  if (!a6)
    return 0;
  result = CFDictionaryGetValueIfPresent(v11, CFSTR("partition-name"), (const void **)&value);
  if ((_DWORD)result)
  {
    v15 = CFGetTypeID(value);
    if (v15 == CFStringGetTypeID())
    {
      result = 0;
      *a6 = value;
      return result;
    }
    return 0;
  }
  return result;
}

uLong sub_212806388(uLong result, int a2, unsigned int a3)
{
  unint64_t v3;
  uLong v4;
  uint64_t v5;
  unsigned int v6;
  Bytef buf[4];

  *(_DWORD *)buf = 16843009 * a2;
  v3 = a3;
  if (a3)
  {
    v4 = result;
    result = *(unsigned int *)(result + 112);
    do
    {
      if (v3 >= 5)
        v5 = 4;
      else
        v5 = v3;
      v6 = crc32(result, buf, v5);
      result = v6;
      *(_DWORD *)(v4 + 112) = v6;
      v3 -= v5;
    }
    while (v3);
  }
  return result;
}

uint64_t sub_2128063F8(uint64_t a1, uint64_t a2, int a3, const unsigned __int8 *a4, const void *a5)
{
  const __CFDictionary *v8;
  __CFDictionary *v9;
  CFTypeID TypeID;
  __int16 v12;
  int v13;

  if (!a2)
    return 4294967246;
  if (!*(_QWORD *)(a1 + 104))
    return 4294967097;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  v13 = 0;
  v8 = sub_2127F8098(a1, a2, &v13);
  if (!v8)
    return 4294967104;
  v9 = v8;
  v12 = 0;
  if (!sub_2127F74E4(v8, CFSTR("Attributes"), &v12))
    return 4294967097;
  if ((v12 & 8) != 0)
    return 4294967098;
  if (!sub_2127FFEF4(v9, CFSTR("ID"), a3, 0))
    return 4294962336;
  CFDictionaryRemoveValue(v9, CFSTR("Name"));
  if (!sub_2127FFF8C((__CFString *)v9, a4))
    return 4294962336;
  CFDictionaryRemoveValue(v9, CFSTR("CFName"));
  if (a5)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a5))
      CFDictionarySetValue(v9, CFSTR("CFName"), a5);
  }
  return 0;
}

uint64_t sub_212806524(uint64_t a1, void **a2)
{
  uint64_t result;

  if (!a2)
    return 4294967246;
  LODWORD(result) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 248))(a1);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == -198)
      return 0;
    else
      return result;
  }
  else
  {
    sub_212820098(a2);
    return 0;
  }
}

uint64_t sub_212806574(_BYTE *a1)
{
  if (a1[114])
    (*(void (**)(_BYTE *))(*(_QWORD *)a1 + 200))(a1);
  sub_2127F8A94((uint64_t)a1);
  return 0;
}

BOOL sub_2128065B4(_DWORD *a1)
{
  return *a1 == 1802464377 && a1[1] == 4;
}

uint64_t sub_2128065E0(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t Code;
  size_t v7;
  UInt8 *v8;
  UInt8 *v9;
  uint64_t v10;
  char *v11;
  const __CFAllocator *v13;
  const __CFData *v14;
  const __CFData *v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  CFTypeID v18;
  __CFDictionary *v19;
  uint64_t v20;
  CFIndex length;
  CFTypeRef cf;
  char *v23;

  v23 = 0;
  Code = 22;
  if (!a1 || !a2 || !a3)
    goto LABEL_22;
  if ((*(_BYTE *)(a2 + 12) & 1) == 0)
  {
    cf = 0;
    Code = (*(uint64_t (**)(uint64_t, CFTypeRef *))(*(_QWORD *)a1 + 344))(a1, &cf);
    if (!(_DWORD)Code)
    {
      Code = sub_2127F7174(0, 3, (uint64_t *)&v23);
      if (!(_DWORD)Code)
      {
        Code = (*(uint64_t (**)(char *))(*(_QWORD *)v23 + 48))(v23);
        if (!(_DWORD)Code)
        {
          Code = (*(uint64_t (**)(char *, CFTypeRef, _QWORD, _QWORD))(*(_QWORD *)v23 + 304))(v23, cf, 0, 0);
          if (!(_DWORD)Code)
            Code = (*(uint64_t (**)(char *))(*(_QWORD *)v23 + 56))(v23);
        }
      }
    }
    if (cf)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 352))(a1, 0);
    goto LABEL_22;
  }
  v7 = *(_QWORD *)(a2 + 224);
  if (!v7)
  {
    Code = sub_2127F7174(0, 3, (uint64_t *)&v23);
    goto LABEL_22;
  }
  cf = 0;
  v8 = (UInt8 *)malloc_type_malloc(v7, 0x9D8B048BuLL);
  if (!v8)
  {
    Code = *__error();
    goto LABEL_20;
  }
  v9 = v8;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
  if (!(_DWORD)v10)
  {
    length = 0;
    Code = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFIndex *, UInt8 *))(*(_QWORD *)a1 + 328))(a1, *(_QWORD *)(a2 + 216), *(_QWORD *)(a2 + 224), &length, v9);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
    if ((_DWORD)Code)
      goto LABEL_19;
    v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v14 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, length);
    if (!v14)
    {
      Code = 4294962336;
      goto LABEL_19;
    }
    v15 = v14;
    v20 = 0;
    v16 = (const __CFDictionary *)CFPropertyListCreateWithData(v13, v14, 0, (CFPropertyListFormat *)&v20, (CFErrorRef *)&cf);
    v17 = v16;
    if (v16)
    {
      v18 = CFGetTypeID(v16);
      if (v18 != CFDictionaryGetTypeID())
      {
        Code = 107;
        goto LABEL_38;
      }
      v19 = (__CFDictionary *)sub_212812A3C(v17, CFSTR("resource-fork"));
      if (v19)
      {
        Code = sub_2127F7174(v19, 3, (uint64_t *)&v23);
        goto LABEL_38;
      }
    }
    else if (cf)
    {
      Code = CFErrorGetCode((CFErrorRef)cf);
      goto LABEL_38;
    }
    Code = 4294962336;
LABEL_38:
    free(v9);
    CFRelease(v15);
    if (v17)
      CFRelease(v17);
    goto LABEL_20;
  }
  Code = v10;
LABEL_19:
  free(v9);
LABEL_20:
  if (cf)
    CFRelease(cf);
LABEL_22:
  v11 = v23;
  if ((_DWORD)Code && v23)
  {
    DIDiskImageObjectRelease(v23);
    v11 = 0;
  }
  if (a3)
    *a3 = v11;
  return Code;
}

uint64_t sub_212806878(uint64_t a1, unsigned int (*a2)(uint64_t, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t result;

  if (!*(_QWORD *)(a1 + 104))
    return 4294967246;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  if (a2)
  {
    result = sub_21281CD0C(a1, a2, a3);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    sub_2127F8A94(a1);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 104));
  }
  result = 0;
  *(_WORD *)(a1 + 112) |= 0x20u;
  return result;
}

CFDictionaryRef sub_2128068E4(uint64_t a1)
{
  CFDictionaryRef Copy;
  char *v3;
  const __CFDictionary *v5;
  char *v6;

  v6 = 0;
  Copy = 0;
  if (!sub_2127F7174(0, 3, (uint64_t *)&v6))
  {
    if ((*(unsigned int (**)(char *))(*(_QWORD *)v6 + 48))(v6))
    {
LABEL_3:
      Copy = 0;
      goto LABEL_5;
    }
    Copy = 0;
    if (!(*(unsigned int (**)(char *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v6 + 304))(v6, a1, 0, 0))
    {
      if ((*(unsigned int (**)(char *))(*(_QWORD *)v6 + 56))(v6))
        goto LABEL_3;
      v3 = v6;
      v5 = (const __CFDictionary *)*((_QWORD *)v6 + 13);
      if (!v5)
      {
        Copy = 0;
        goto LABEL_6;
      }
      Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v5);
    }
  }
LABEL_5:
  v3 = v6;
  if (v6)
LABEL_6:
    DIDiskImageObjectRelease(v3);
  return Copy;
}

uint64_t sub_2128069B4(uint64_t result, int a2)
{
  int v2;
  int v4;

  v2 = *(_DWORD *)(result + 172);
  if (v2 > 0 || a2 != 0)
  {
    v4 = v2 - 1;
    if (a2)
      v4 = 0;
    *(_DWORD *)(result + 172) = v4;
  }
  return result;
}

uint64_t DIDeinitialize()
{
  uint64_t result;

  result = pthread_mutex_lock(&stru_254B5ACC0);
  if (!(_DWORD)result)
  {
    byte_254B5AD88 = 0;
    dword_254B5AD8C = 0;
    if (qword_254B5AD48)
    {
      CFRelease((CFTypeRef)qword_254B5AD48);
      qword_254B5AD48 = 0;
    }
    if (sub_212806A70())
    {
      printf("\x1B[7m\x1B[5m\a\aDIDeinitialize: objects have leaked\a\a\n\x1B[0m");
      sub_212814BFC();
    }
    if (getenv("DISKIMAGEOBJECTTRACKING"))
    {
      printf("\x1B[7mDIDeinitialize: stopping DiskImageObject tracking\n\x1B[0m");
      sub_212814CA8();
    }
    return pthread_mutex_unlock(&stru_254B5ACC0);
  }
  return result;
}

uint64_t sub_212806A70()
{
  uint64_t result;

  result = qword_254B5ADA0;
  if (qword_254B5ADA0)
    return CFArrayGetCount((CFArrayRef)qword_254B5ADA0) > 0;
  return result;
}

uint64_t sub_212806A98(const __CFString *a1, CFNumberType a2, void *a3)
{
  CFTypeID v6;
  const char *v7;
  char *v8;
  uint64_t Value;
  const __CFAllocator *v10;
  double *p_valuePtr;
  CFNumberType v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFNumber *v18;
  const __CFNumber *v19;
  char *v20;
  unint64_t v21;
  double valuePtr;
  int v23;

  v6 = CFGetTypeID(a1);
  if (v6 == CFStringGetTypeID())
  {
    v23 = 0;
    v21 = 0;
    valuePtr = 0.0;
    v7 = (const char *)sub_2127F2B30(a1, 0x600u);
    if (v7)
    {
      v8 = (char *)v7;
      v20 = 0;
      if (!*v7)
        goto LABEL_20;
      if (!(((unint64_t)a2 > kCFNumberDoubleType) | (0xF9Fu >> a2) & 1))
      {
        valuePtr = strtod(v7, &v20);
        if (*v20)
          goto LABEL_20;
        v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        p_valuePtr = &valuePtr;
        v12 = kCFNumberDoubleType;
        goto LABEL_18;
      }
      if (((unint64_t)a2 > kCFNumberDoubleType) | (0x37EFu >> a2) & 1)
      {
        Value = 0;
        v23 = strtol(v7, &v20, 0);
        if (!*v20)
        {
          v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          p_valuePtr = (double *)&v23;
          v12 = kCFNumberSInt32Type;
          goto LABEL_18;
        }
      }
      else
      {
        Value = 0;
        v21 = strtouq(v7, &v20, 0);
        if (!*v20)
        {
          v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          p_valuePtr = (double *)&v21;
          v12 = kCFNumberSInt64Type;
LABEL_18:
          v18 = CFNumberCreate(v10, v12, p_valuePtr);
          v19 = v18;
          if (v18)
          {
            Value = CFNumberGetValue(v18, a2, a3);
            CFRelease(v19);
            goto LABEL_21;
          }
LABEL_20:
          Value = 0;
        }
      }
LABEL_21:
      free(v8);
      return Value;
    }
    return 0;
  }
  v13 = CFGetTypeID(a1);
  if (v13 != CFBooleanGetTypeID())
  {
    v16 = CFGetTypeID(a1);
    if (v16 == CFNumberGetTypeID())
      return CFNumberGetValue((CFNumberRef)a1, a2, a3);
    return 0;
  }
  LODWORD(valuePtr) = CFBooleanGetValue((CFBooleanRef)a1) != 0;
  v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v14)
    return 0;
  v15 = v14;
  Value = CFNumberGetValue(v14, a2, a3);
  CFRelease(v15);
  return Value;
}

CFURLRef sub_212806CBC(int a1, CFURLRef anURL, const __CFString *a3, int a4)
{
  Boolean v6;
  CFStringRef PathComponent;
  const __CFAllocator *v9;
  const __CFURL *v10;
  const __CFString *v11;
  CFURLRef v12;

  if (!anURL)
    return anURL;
  if (!a3)
  {
    CFRetain(anURL);
    return anURL;
  }
  v6 = a4;
  if (CFURLHasDirectoryPath(anURL) == a4)
    return CFURLCreateCopyAppendingPathExtension((CFAllocatorRef)*MEMORY[0x24BDBD240], anURL, a3);
  PathComponent = CFURLCopyLastPathComponent(anURL);
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], anURL);
  v11 = CFStringCreateWithFormat(v9, 0, CFSTR("%@.%@"), PathComponent, a3);
  v12 = CFURLCreateCopyAppendingPathComponent(v9, v10, v11, v6);
  CFRelease(v11);
  CFRelease(v10);
  CFRelease(PathComponent);
  return v12;
}

void *sub_212806DC4(const __CFString *a1)
{
  CFIndex v2;
  void *v3;

  v2 = CFStringGetMaximumSizeOfFileSystemRepresentation(a1) + 1;
  v3 = malloc_type_malloc(v2, 0x1F3DA98AuLL);
  if (v3 && !CFStringGetFileSystemRepresentation(a1, (char *)v3, v2))
  {
    free(v3);
    return 0;
  }
  return v3;
}

uint64_t sub_212806E2C()
{
  return 78;
}

uint64_t sub_212806E34()
{
  pid_t v0;
  uint64_t result;
  rlimit v2;

  if (dword_254B5AD9C)
    warnx("DiskImages secure mode enabled");
  v0 = getpid();
  result = ptrace(31, v0, 0, 0);
  if (!(_DWORD)result)
  {
    v2.rlim_cur = 0;
    v2.rlim_max = 0;
    return setrlimit(4, &v2);
  }
  return result;
}

uint64_t sub_212806E94(uint64_t a1, const __CFString *a2, const __CFString *a3)
{
  const __CFAllocator *v5;
  uint64_t v6;
  CFTypeRef cf[2];
  CFStringRef v9;

  v9 = 0;
  *(_OWORD *)cf = 0u;
  if (a1)
  {
    if (_CFURLCopyComponents())
    {
      v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (a2)
        cf[1] = CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 0, CFSTR(";/?:@&=+$,"),
                  0x8000100u);
      if (a3)
        v9 = CFURLCreateStringByAddingPercentEscapes(v5, a3, 0, CFSTR(";/?:@&=+$,"), 0x8000100u);
      v6 = _CFURLCreateFromComponents();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  if (cf[1])
    CFRelease(cf[1]);
  if (v9)
    CFRelease(v9);
  return v6;
}

uint64_t sub_212807018(uint64_t a1, uint64_t a2, char **a3, _QWORD *a4)
{
  uint64_t MKMediaRef;
  char *v8;
  int v9;
  const __CFAllocator *v10;
  __CFDictionary *Mutable;
  const __CFDictionary *v12;
  CFTypeRef cf;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  MKMediaRef = 22;
  if (a1 && a3)
  {
    v8 = (char *)operator new();
    sub_212807248((uint64_t)v8);
    MKMediaRef = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)v8 + 560))(v8, a1, a2);
    if ((_DWORD)MKMediaRef)
    {
LABEL_8:
      sub_2127F38CC(v8);
      v8 = 0;
LABEL_21:
      *a3 = v8;
      return MKMediaRef;
    }
    if ((*(unsigned int (**)(char *))(*(_QWORD *)v8 + 288))(v8))
    {
      v9 = sub_2127F3728(a2);
      MKMediaRef = 0;
      if (!(*(unsigned int (**)(char *, _QWORD))(*(_QWORD *)v8 + 440))(v8, 0) || v9)
        goto LABEL_21;
      cf = 0;
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)v8, *MEMORY[0x24BDBD240], 0, (uint64_t *)&cf);
      if ((_DWORD)MKMediaRef)
        goto LABEL_8;
      Mutable = CFDictionaryCreateMutable(v10, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, CFSTR("Include data"), (const void *)*MEMORY[0x24BDBD270]);
      v12 = (const __CFDictionary *)MKCFReadMedia();
      CFRelease(Mutable);
      CFRelease(cf);
      sub_212802380(v12, CFSTR("Schemes"));
      if (!sub_2128143C4())
      {
        if (v12)
          CFRelease(v12);
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, 1);
        (*(void (**)(char *, _QWORD))(*(_QWORD *)v8 + 520))(v8, 0);
        MKMediaRef = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
        if (!(_DWORD)MKMediaRef)
          goto LABEL_21;
        goto LABEL_8;
      }
      CFRelease(v12);
    }
    MKMediaRef = 0;
    goto LABEL_21;
  }
  return MKMediaRef;
}

void sub_212807224(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C407FD252BCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_212807248(uint64_t a1)
{
  _QWORD *v2;

  v2 = (_QWORD *)sub_2127F6A04(a1);
  *v2 = &off_24CE2A170;
  sub_2127F6BAC((uint64_t)v2, CFSTR("thread-safe"), (const __CFString *)*MEMORY[0x24BDBD270]);
  return a1;
}

void sub_212807290(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

void sub_2128072A8(_QWORD *a1)
{
  sub_212807300(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2128072DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C407FD252BCLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212807300(_QWORD *a1)
{
  uint64_t v2;

  *a1 = &off_24CE2A170;
  if (sub_2127F6D88((uint64_t)a1))
  {
    v2 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 280))(v2, 0);
  }
  return sub_2127FE034(a1);
}

void sub_212807354(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef sub_21280736C(io_registry_entry_t a1)
{
  kern_return_t v1;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = IORegistryEntryCreateCFProperties(a1, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!v1)
    return properties;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CFDictionaryCreateMutableFromIOKitObject: unable to get object properties: error 0x%08X (%d)\n", v1, v1);
  return 0;
}

uint64_t sub_2128073D0(const __CFArray *a1, const __CFArray *a2)
{
  CFIndex Count;

  Count = CFArrayGetCount(a1);
  if (Count == CFArrayGetCount(a2))
    return sub_21280742C(a1, a2);
  else
    return 0;
}

uint64_t sub_21280742C(const __CFArray *a1, CFArrayRef theArray)
{
  int Count;
  CFIndex v5;
  uint64_t result;
  CFIndex v7;
  const void *ValueAtIndex;
  CFRange v9;

  Count = CFArrayGetCount(theArray);
  v5 = CFArrayGetCount(a1);
  result = 0;
  if (a1 && theArray && Count)
  {
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      v7 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
        if (ValueAtIndex)
        {
          v9.location = 0;
          v9.length = v5;
          result = CFArrayContainsValue(a1, v9, ValueAtIndex);
          if (!(_DWORD)result)
            break;
        }
        if (Count == ++v7)
          return 1;
      }
    }
  }
  return result;
}

uint64_t sub_2128074CC(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (result)
  {
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 448))(v3);
  }
  return result;
}

uint64_t sub_21280751C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 448))(result);
  return result;
}

uint64_t sub_212807534()
{
  return 0;
}

BOOL sub_21280753C(uint64_t a1)
{
  return sub_212807564(*(const char **)(a1 + 296), 0, 0) == 0;
}

uint64_t sub_212807564(const char *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  _OWORD v6[2];
  int v7;
  _QWORD v8[3];

  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v8[1] = 0;
  v8[2] = 0;
  v8[0] = 0x400000000005;
  result = getattrlist(a1, v8, v6, 0x24uLL, 0);
  if (!(_DWORD)result)
  {
    if (a2)
      *a2 = bswap32(DWORD1(v6[0]));
    if (a3)
      *a3 = bswap32(DWORD2(v6[0]));
  }
  return result;
}

uint64_t sub_2128075E0(uint64_t a1, _DWORD *a2)
{
  return sub_212807564(*(const char **)(a1 + 296), a2, 0);
}

BOOL sub_2128075EC(uint64_t a1)
{
  return sub_212807564(*(const char **)(a1 + 296), 0, 0) == 0;
}

uint64_t sub_212807614(uint64_t a1, _DWORD *a2)
{
  return sub_212807564(*(const char **)(a1 + 296), 0, a2);
}

uint64_t sub_212807624(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
}

uint64_t sub_212807634(uint64_t a1, _DWORD *a2)
{
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  int v7;
  uint64_t v9;

  *a2 = 0;
  v9 = 0;
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 248))(a1)
    && (*(unsigned int (**)(uint64_t, char *))(*(_QWORD *)a1 + 264))(a1, (char *)&v9 + 4))
  {
    return 0;
  }
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 224))(a1) & 1) != 0)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)a1 + 240))(a1, &v9))
      return 0;
    v4 = HIDWORD(v9) == 1061109567;
    v5 = v9 == 1061109567;
    if (v4 && v5)
      v6 = 0;
    else
      v6 = v9;
    if (v4 && v5)
      v7 = 0;
    else
      v7 = HIDWORD(v9);
  }
  else
  {
    v6 = 0;
    v7 = HIDWORD(v9);
  }
  if (v7 | v6)
    return sub_21281686C(v7, v6, a2);
  return 0;
}

uint64_t sub_212807700(uint64_t a1, _DWORD *a2)
{
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;

  v3 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 208))(a1);
  *a2 = 0;
  if (!v3)
    return 0;
  v4 = v3;
  *a2 = -1000;
  if (CFStringCompare(v3, CFSTR("sparseimage"), 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, CFSTR("shadow"), 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, CFSTR("dmgpart"), 1uLL) == kCFCompareEqualTo)
  {
    return 0;
  }
  v5 = 1430541391;
  *a2 = 100;
  if (CFStringCompare(v4, CFSTR("dmg"), 1uLL) == kCFCompareEqualTo
    || CFStringCompare(v4, CFSTR("img"), 1uLL) == kCFCompareEqualTo)
  {
    return 1430540887;
  }
  if (CFStringCompare(v4, CFSTR("iso"), 1uLL)
    && CFStringCompare(v4, CFSTR("toast"), 1uLL)
    && CFStringCompare(v4, CFSTR("cdr"), 1uLL)
    && CFStringCompare(v4, CFSTR("dvdr"), 1uLL))
  {
    v5 = 0;
    *a2 = 0;
  }
  return v5;
}

uint64_t sub_212807848(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  BOOL v14;
  unint64_t v15;

  v10 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
  if (a4)
    *a4 = 0;
  if (!v10)
    return 999;
  v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11)
    return 22;
  v15 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(_QWORD *)v10 + 328))(v10, a2 << 9, a3 << 9, &v15, a5);
  if ((_DWORD)result)
    v14 = 1;
  else
    v14 = a4 == 0;
  if (!v14)
  {
    result = 0;
    *a4 = v15 >> 9;
  }
  return result;
}

uint64_t sub_212807904(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v1 + 296))(v1, &v3);
  return v3 >> 9;
}

uint64_t sub_212807944(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  unsigned int v5;
  uint64_t v7;
  char v8;
  __int16 v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v2 = 16;
  v3 = 64;
  while (1)
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(_QWORD *)a1 + 48))(a1, v3, 4, &v7, &v8))
    {
      v5 = 0;
      goto LABEL_12;
    }
    if (!v8 && v9 == 21326 && v10 == 82)
      break;
    ++v2;
    v3 += 4;
    if (v3 == 128)
    {
      v5 = 0;
      v2 = 32;
      goto LABEL_12;
    }
  }
  v5 = 1;
LABEL_12:
  if (v2 < 0x20)
    return v5;
  else
    return 0;
}

void sub_212807A28(const __CFArray *a1)
{
  CFRange v2;

  v2.length = CFArrayGetCount(a1);
  v2.location = 0;
  CFArraySortValues(a1, v2, (CFComparatorFunction)sub_2128046A0, 0);
}

const __CFString *sub_212807A60()
{
  return CFSTR("ISO9660");
}

uint64_t sub_212807A6C(uint64_t a1, _QWORD *a2)
{
  if (!a2)
    return 22;
  *a2 = 0;
  return 78;
}

uint64_t sub_212807A84()
{
  uint64_t v0;

  v0 = operator new();
  sub_212814FD8(v0, 0);
  return v0;
}

void sub_212807AC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_212807AE8(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 120))
    return 10;
  else
    return 0;
}

uint64_t sub_212807AFC()
{
  return 1;
}

CFTypeRef sub_212807B04()
{
  int v0;

  v0 = DIGetBundleRef();
  return sub_21281FFEC(v0, (int)CFSTR("read/write"), CFSTR("read/write"));
}

uint64_t sub_212807B2C(uint64_t a1, const __CFDictionary *a2, _QWORD *a3, _QWORD *a4)
{
  const __CFString *v8;
  int v9;
  uint64_t result;
  _BYTE *v11;
  const void *Value;
  uint64_t v13;
  int v14;

  v8 = (const __CFString *)sub_2127F14C0();
  v9 = sub_2127F14C8(v8, 0);
  if (v8)
    CFRelease(v8);
  if (v9)
    return 118;
  if (!a3)
    return 22;
  *a3 = 0;
  if (a4)
    *a4 = 0;
  if (!a1)
    return 22;
  v11 = (_BYTE *)operator new();
  sub_212807D74((uint64_t)v11);
  if (a2)
  {
    v11[2048] = sub_2127F2A48(a2, CFSTR("enable-keychain"), 1u);
    v11[545] = sub_2127F2A48(a2, CFSTR("allow-tty-prompt"), 1u) != 0;
    if (sub_2128023F8(a2, CFSTR("use-filename-for-prompt")))
    {
      Value = CFDictionaryGetValue(a2, CFSTR("use-filename-for-prompt"));
      (*(void (**)(_BYTE *, const __CFString *, const void *))(*(_QWORD *)v11 + 32))(v11, CFSTR("use-filename-for-prompt"), Value);
    }
  }
  sub_212809A3C(v11, a1, a2);
  v13 = sub_2127F3728((uint64_t)a2);
  v14 = (*(uint64_t (**)(_BYTE *, uint64_t))(*(_QWORD *)v11 + 80))(v11, v13);
  if (v14)
    sub_212807E8C(v14, (uint64_t)"setPermission() failed");
  (*(void (**)(_BYTE *))(*(_QWORD *)v11 + 704))(v11);
  result = 0;
  *a3 = v11;
  return result;
}

void sub_212807CAC(void *a1, int a2)
{
  uint64_t v2;
  void *v5;

  MEMORY[0x212BF43D0](v2, 0x10F1C40DD922216);
  v5 = __cxa_begin_catch(a1);
  if (a2 == 2)
    (*(void (**)(void *))(*(_QWORD *)v5 + 24))(v5);
  __cxa_end_catch();
  JUMPOUT(0x212807C88);
}

void sub_212807D50(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_212807D74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_2127F5974(a1);
  *(_QWORD *)v2 = &off_24CE2B590;
  *(_BYTE *)(a1 + 2048) = 0;
  *(_OWORD *)(v2 + 520) = 0u;
  bzero((void *)(v2 + 546), 0x4FCuLL);
  v3 = *MEMORY[0x24BDBD270];
  sub_2127F32D4(a1, CFSTR("thread-safe"), (const void *)*MEMORY[0x24BDBD270]);
  pthread_rwlock_init((pthread_rwlock_t *)(a1 + 208), 0);
  (*(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)a1 + 32))(a1, CFSTR("bs-supports-proxy-encoding"), v3);
  *(_QWORD *)(a1 + 472) = 0;
  pthread_mutex_init((pthread_mutex_t *)(a1 + 408), 0);
  return a1;
}

void sub_212807E18(_Unwind_Exception *a1)
{
  char **v1;

  sub_2127FE1B0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_212807E30(uint64_t a1, const __CFString *a2)
{
  uint64_t result;

  if (!a2)
  {
    if (*(_BYTE *)(a1 + 545))
    {
      result = sub_212809758(a1);
      if (!(_DWORD)result)
        return result;
      if ((_DWORD)result == 80)
        sub_212807E8C(80, (uint64_t)"unable to unlock image.");
    }
    sub_212807E8C(80, (uint64_t)"unable to unlock image.");
  }
  result = sub_21281B92C(a1, a2);
  if ((_DWORD)result)
    sub_212807E8C(result, (uint64_t)"cannot unlock image with specified passphrase");
  return result;
}

void sub_212807E8C(int a1, uint64_t a2)
{
  _DWORD *exception;

  exception = __cxa_allocate_exception(0x18uLL);
  *(_QWORD *)exception = &off_24CE2B520;
  exception[3] = a1;
  *((_QWORD *)exception + 2) = a2;
  __cxa_throw(exception, (struct type_info *)&unk_24CE2B550, (void (*)(void *))std::exception::~exception);
}

void sub_212807ED0(char **a1)
{
  sub_212807F28(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212807F04(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10F1C40DD922216);
  _Unwind_Resume(a1);
}

_QWORD *sub_212807F28(char **a1)
{
  char *v2;
  char *v3;
  char *v4;

  *a1 = (char *)&off_24CE2B590;
  if (sub_2127F3B98((uint64_t)a1))
    (*((void (**)(char **, uint64_t))*a1 + 35))(a1, 1);
  if ((*((unsigned int (**)(char **))*a1 + 74))(a1))
    (*((void (**)(char **, uint64_t))*a1 + 46))(a1, 1);
  if ((*((unsigned int (**)(char **))*a1 + 77))(a1))
    (*((void (**)(char **, uint64_t))*a1 + 44))(a1, 1);
  v2 = a1[59];
  if (v2)
    free(v2);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 51));
  v3 = a1[65];
  if (v3)
    free(v3);
  v4 = a1[66];
  if (v4)
    free(v4);
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 26));
  return sub_2127FE1B0(a1);
}

void sub_212807FF4(_Unwind_Exception *a1)
{
  char **v1;

  sub_2127FE1B0(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21280800C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

void sub_212808018(_BYTE *a1, uint64_t a2, char *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const char *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const char *v19;
  int v20;
  int v21;
  const __CFString *v22;
  const char *v23;
  const char *v24;
  char __s2[1024];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a1[545])
  {
    v5 = (*(uint64_t (**)(_BYTE *, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("use-filename-for-prompt"));
    v6 = *(_QWORD *)a1;
    if (v5)
      v7 = (*(uint64_t (**)(_BYTE *, const __CFString *))(v6 + 24))(a1, CFSTR("use-filename-for-prompt"));
    else
      v7 = (*(uint64_t (**)(_BYTE *))(v6 + 192))(a1);
    v8 = v7;
    v9 = DIGetBundleRef();
    v10 = (const __CFString *)sub_21281FFEC(v9, (int)CFSTR("Enter a new password to secure \"%1$@\": "), CFSTR("Enter a new password to secure \"%1$@\": "));
    v11 = CFStringCreateWithFormat(0, 0, v10, v8);
    v12 = sub_2127F2B30(v11, 0x8000100u);
    v13 = v12;
    if (v12)
      v14 = (const char *)v12;
    else
      v14 = "Enter new password: ";
    v15 = DIGetBundleRef();
    v16 = (const __CFString *)sub_21281FFEC(v15, (int)CFSTR("Re-enter new password: "), CFSTR("Re-enter new password: "));
    v17 = sub_2127F2B30(v16, 0x8000100u);
    v18 = v17;
    if (v17)
      v19 = (const char *)v17;
    else
      v19 = "Re-enter new password: ";
    v20 = sub_212809904(v14, a3, 1024, 1);
    if (!v20)
    {
      v20 = sub_212809904(v19, __s2, 1024, 1);
      if (!v20)
      {
        v20 = strncmp(a3, __s2, 0x400uLL);
        bzero(__s2, 0x400uLL);
        if (v20)
        {
          v21 = DIGetBundleRef();
          v22 = (const __CFString *)sub_21281FFEC(v21, (int)CFSTR("Passwords must match."), CFSTR("Passwords must match."));
          v23 = (const char *)sub_2127F2B30(v22, 0x8000100u);
          v24 = "Passwords must match.";
          if (v23)
            v24 = v23;
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v24);
          if (v22)
            CFRelease(v22);
          v20 = 80;
        }
      }
    }
    if (v18)
      free(v18);
    if (v13)
      free(v13);
    if (v20)
    {
      bzero(a3, 0x400uLL);
      sub_212807E8C(v20, (uint64_t)"cannot get passphrase.");
    }
    if (v16)
      CFRelease(v16);
    if (v11)
      CFRelease(v11);
    if (v10)
      CFRelease(v10);
  }
}

void sub_212808298(_Unwind_Exception *exception_object)
{
  const void *v1;
  const void *v2;
  const void *v3;
  const void *v4;

  if (v4)
    CFRelease(v4);
  if (v3)
    CFRelease(v3);
  if (v2)
    CFRelease(v2);
  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

void sub_212808314(uint64_t a1)
{
  uint64_t v2;
  int v3;
  BOOL v4;
  int *v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  CFTypeRef v12;
  const void *v13;
  const __CFString *v16;
  uint64_t v17;
  const UInt8 *BytePtr;
  unsigned int Length;
  unsigned int v20;
  uint64_t v21;
  _BYTE *v22;
  const UInt8 *v23;
  char v24;
  int v25;
  CC_SHA1_CTX *v26;
  CC_SHA1_CTX *v27;
  uint64_t v28;
  _BYTE *v29;
  char v30;
  _BYTE data[64];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 566;
  v3 = *(_DWORD *)(a1 + 480);
  v4 = v3 == 1;
  if (v3 == 1)
    v5 = (int *)(a1 + 642);
  else
    v5 = (int *)(a1 + 566);
  v6 = 4;
  if (v4)
    v6 = 80;
  v7 = *(_DWORD *)(v2 + v6);
  v8 = *v5;
  v9 = 8;
  if (v4)
    v9 = 376;
  v10 = *(_DWORD *)(v2 + v9);
  v11 = DIGetBundleRef();
  v12 = sub_21281FFEC(v11, (int)CFSTR("(CSSM non-standard algorithm)"), CFSTR("(CSSM non-standard algorithm)"));
  if (v12)
  {
    v13 = v12;
    (*(void (**)(uint64_t, const __CFString *, CFTypeRef))(*(_QWORD *)a1 + 32))(a1, CFSTR("encryption-class"), v12);
    CFRelease(v13);
  }
  if ((v10 == 91 || v10 == 0) && (!v8 || v8 == -2147483647))
  {
    if (v7 == 128)
    {
      v16 = CFSTR("AES-128");
      v17 = 16;
    }
    else
    {
      if (v7 != 256)
        goto LABEL_25;
      v16 = CFSTR("AES-256");
      v17 = 32;
    }
    *(_QWORD *)(a1 + 2032) = v17;
    (*(void (**)(uint64_t, const __CFString *, const __CFString *))(*(_QWORD *)a1 + 32))(a1, CFSTR("encryption-class"), v16);
LABEL_25:
    *(_QWORD *)(a1 + 2040) = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2016));
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 2024));
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 2024));
    v20 = Length;
    if (!Length)
      goto LABEL_29;
    v21 = Length;
    v22 = data;
    v23 = BytePtr;
    do
    {
      v24 = *v23++;
      *v22++ = v24 ^ 0x36;
      --v21;
    }
    while (v21);
    if (Length > 0x3F)
    {
      v25 = 0;
    }
    else
    {
LABEL_29:
      memset(&data[Length], 54, 64 - Length);
      v25 = 1;
    }
    v26 = (CC_SHA1_CTX *)(a1 + 1824);
    CC_SHA1_Init((CC_SHA1_CTX *)(a1 + 1824));
    v27 = (CC_SHA1_CTX *)(a1 + 1920);
    CC_SHA1_Init(v27);
    CC_SHA1_Update(v26, data, 0x40u);
    if (v20)
    {
      v28 = v20;
      v29 = data;
      do
      {
        v30 = *BytePtr++;
        *v29++ = v30 ^ 0x5C;
        --v28;
      }
      while (v28);
    }
    if (v25)
      memset(&data[v20], 92, 64 - v20);
    CC_SHA1_Update(v27, data, 0x40u);
  }
}

uint64_t sub_212808548(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  __n128 v8;
  uint64_t v9;
  int8x16_t v10;
  int8x16_t v11;
  uint64_t v13;
  uint64_t v14;
  int8x16_t __dst[80];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  if (!v2)
    return 999;
  v3 = v2;
  v14 = 0;
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v2);
  if (!(_DWORD)v4)
  {
    v5 = *(_DWORD *)(a1 + 480);
    if (v5 == 2)
    {
      *(_DWORD *)(a1 + 598) = *(_QWORD *)(a1 + 488);
      *(_OWORD *)(a1 + 602) = *(_OWORD *)(a1 + 496);
      v10 = *(int8x16_t *)(a1 + 562);
      __dst[0] = *(int8x16_t *)(a1 + 546);
      __dst[1] = v10;
      v11 = *(int8x16_t *)(a1 + 594);
      __dst[2] = *(int8x16_t *)(a1 + 578);
      __dst[3] = v11;
      __dst[4].i64[0] = *(_QWORD *)(a1 + 610);
      __dst[0] = vrev32q_s8(__dst[0]);
      __dst[1] = vrev32q_s8(__dst[1]);
      __dst[2].i32[0] = bswap32(__dst[2].u32[0]);
      __dst[3].i32[1] = bswap32(v11.u32[1]);
      *(int8x16_t *)((char *)&__dst[3] + 8) = vrev64q_s8(*(int8x16_t *)((char *)&__dst[3] + 8));
      v9 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, int8x16_t *, __n128))(*(_QWORD *)v3 + 336))(v3, 0, 72, &v14, __dst, *(__n128 *)((char *)&__dst[3] + 8));
    }
    else
    {
      if (v5 != 1)
      {
        v4 = 999;
        goto LABEL_11;
      }
      v13 = 0;
      v4 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 296))(v3, &v13);
      if ((_DWORD)v4)
      {
LABEL_11:
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v3 + 280))(v3, 0);
        return v4;
      }
      v6 = *(_QWORD *)(a1 + 496);
      *(_DWORD *)(a1 + 562) = *(_QWORD *)(a1 + 488);
      *(_QWORD *)(a1 + 1802) = v6;
      memcpy(__dst, (const void *)(a1 + 546), 0x4FCuLL);
      v7 = v13 - 1276;
      v8.n128_u64[0] = (unint64_t)sub_21281C024((uint64_t)__dst);
      v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, int8x16_t *, __n128))(*(_QWORD *)v3 + 336))(v3, v7, 1276, &v14, __dst, v8);
    }
    v4 = v9;
    goto LABEL_11;
  }
  return v4;
}

uint64_t sub_212808704(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  unint64_t v7;

  if (a4 && a5 && (v6 = *(_QWORD *)(a1 + 488), v7 = a2 / v6, a2 == v7 * v6) && !(a3 % v6))
    return sub_21280873C(a1, v7, a3 / v6, a4, a5);
  else
    return 22;
}

uint64_t sub_21280873C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  size_t v11;
  const void *v12;
  size_t v13;
  CCCryptorStatus v14;
  uint64_t result;
  FILE **v16;
  size_t dataOutMoved;
  unsigned __int8 iv[20];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a3 < 1)
    return 0;
  v10 = 0;
  while (1)
  {
    sub_212808960((_OWORD *)a1, a2 + v10, iv);
    v11 = *(_QWORD *)(a1 + 488);
    v12 = *(const void **)(a1 + 2040);
    v13 = *(_QWORD *)(a1 + 2032);
    dataOutMoved = 0;
    v14 = CCCrypt(0, 0, 0, v12, v13, iv, (const void *)(a4 + v11 * v10), v11, (void *)(a5 + v11 * v10), v11, &dataOutMoved);
    if (v14)
      break;
    if (a3 == ++v10)
      return 0;
  }
  v16 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CEncryptedEncoding::encrypt CCCrypt() returned error %d\n", v14);
  result = 999;
  if (v14 > -4301)
  {
    if (v14 == -4300 || v14 == -1)
      return 22;
  }
  else if (v14 == -4302)
  {
    return 12;
  }
  else if (v14 == -4301)
  {
    fprintf(*v16, "CEncryptedEncoding::encrypt output buffer should be %zu bytes\n", dataOutMoved);
    return 999;
  }
  return result;
}

#error "21280892C: call analysis failed (funcsize=32)"

uint64_t sub_212808960(_OWORD *a1, unsigned int a2, unsigned __int8 *a3)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CC_SHA1_CTX v12;
  unsigned int data;

  data = bswap32(a2);
  v5 = a1[117];
  *(_OWORD *)&v12.data[1] = a1[116];
  *(_OWORD *)&v12.data[5] = v5;
  v6 = a1[119];
  *(_OWORD *)&v12.data[9] = a1[118];
  *(_OWORD *)&v12.data[13] = v6;
  v7 = a1[115];
  *(_OWORD *)&v12.h0 = a1[114];
  *(_OWORD *)&v12.h4 = v7;
  CC_SHA1_Update(&v12, &data, 4u);
  CC_SHA1_Final(a3, &v12);
  v8 = a1[123];
  *(_OWORD *)&v12.data[1] = a1[122];
  *(_OWORD *)&v12.data[5] = v8;
  v9 = a1[125];
  *(_OWORD *)&v12.data[9] = a1[124];
  *(_OWORD *)&v12.data[13] = v9;
  v10 = a1[121];
  *(_OWORD *)&v12.h0 = a1[120];
  *(_OWORD *)&v12.h4 = v10;
  CC_SHA1_Update(&v12, a3, 0x14u);
  return CC_SHA1_Final(a3, &v12);
}

uint64_t sub_212808A10()
{
  return 1;
}

uint64_t sub_212808A18(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v6;

  if (a4 && (v5 = *(_QWORD *)(a1 + 488), v6 = a2 / v5, a2 == v6 * v5) && !(a3 % v5))
    return sub_212808A4C(a1, v6, a3 / v5, a4);
  else
    return 22;
}

uint64_t sub_212808A4C(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  size_t v9;
  const void *v10;
  size_t v11;
  CCCryptorStatus v12;
  uint64_t result;
  FILE **v14;
  size_t dataOutMoved;
  unsigned __int8 iv[20];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 < 1)
    return 0;
  v8 = 0;
  while (1)
  {
    sub_212808960((_OWORD *)a1, a2 + v8, iv);
    v9 = *(_QWORD *)(a1 + 488);
    v10 = *(const void **)(a1 + 2040);
    v11 = *(_QWORD *)(a1 + 2032);
    dataOutMoved = 0;
    v12 = CCCrypt(1u, 0, 0, v10, v11, iv, (const void *)(a4 + v9 * v8), v9, (void *)(a4 + v9 * v8), v9, &dataOutMoved);
    if (v12)
      break;
    if (a3 == ++v8)
      return 0;
  }
  v14 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "CEncryptedEncoding::decrypt CCCrypt() returned error %d\n", v12);
  result = 999;
  if (v12 > -4301)
  {
    if (v12 == -4300 || v12 == -1)
      return 22;
  }
  else if (v12 == -4302)
  {
    return 12;
  }
  else if (v12 == -4301)
  {
    fprintf(*v14, "CEncryptedEncoding::decrypt output buffer should be %zu bytes\n", dataOutMoved);
    return 999;
  }
  return result;
}

#error "212808C30: call analysis failed (funcsize=32)"

uint64_t sub_212808C64(uint64_t a1, _QWORD *a2)
{
  unsigned int *v2;
  unint64_t v3;
  uint64_t v4;
  const UInt8 *v6;
  const __CFAllocator *v9;

  v2 = (unsigned int *)(a1 + 570);
  v3 = *(unsigned int *)(a1 + 570);
  v4 = ((*(_DWORD *)(a1 + 578) + v3) >> 3) + 5;
  if (*a2 != v4)
    return 0;
  v6 = (const UInt8 *)a2[1];
  if (*(_DWORD *)&v6[v4 - 5] ^ 0x45494B43 | v6[v4 - 1])
    return 0;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *(_QWORD *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, v3 >> 3);
  *(_QWORD *)(a1 + 2024) = CFDataCreate(v9, (const UInt8 *)(a2[1] + ((unint64_t)*v2 >> 3)), (unint64_t)v2[2] >> 3);
  return 1;
}

uint64_t sub_212808D1C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 80))(v1);
  else
    return 999;
}

void sub_212808D38(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  char *v11;
  const char *v12;
  int v13;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  v3 = (uint64_t *)(a1 + 512);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 296))(v2, a1 + 512))
  {
    v4 = 0;
LABEL_3:
    *v3 = v4;
    return;
  }
  v6 = *(_QWORD *)(a1 + 488);
  v5 = *(_QWORD *)(a1 + 496);
  v7 = v5 % v6;
  v8 = v6 - v5 % v6;
  if (!v7)
    v8 = 0;
  v9 = v8 + v5;
  if (*(_DWORD *)(a1 + 480) == 1)
    v4 = v9 + 1276;
  else
    v4 = *(_QWORD *)(a1 + 504) + v9;
  if (v4 != *v3)
  {
    v10 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192))(a1);
    if (v10)
      v11 = (char *)sub_2127F2B30(v10, 0x8000100u);
    else
      v11 = 0;
    v12 = "";
    if (v11)
      v12 = v11;
    syslog(5, "CEncryptedEncoding: need to repair %s", v12);
    syslog(5, "expected length: %qd, actual length: %qd", v4, *v3);
    if (v11)
      free(v11);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 312))(v2, v4);
    syslog(6, "setting length returned %d", v13);
    if (!v13 && !(*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 472))(a1, 1))
      goto LABEL_3;
  }
}

uint64_t sub_212808EA0(uint64_t a1, unint64_t a2, size_t a3, _QWORD *a4, char *a5)
{
  uint64_t v10;
  uint64_t v11;
  pthread_rwlock_t *v12;
  size_t v14;
  size_t v15;
  size_t v16;
  int64_t v17;
  int64_t v18;
  size_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  BOOL v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  pthread_mutex_t *v32;
  size_t v33;
  uint64_t v34;

  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  if (a4)
    *a4 = 0;
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 208));
  v33 = a3;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    v11 = 9;
    goto LABEL_9;
  }
  if (!a5)
  {
    v11 = 22;
    goto LABEL_9;
  }
  if ((int64_t)(a3 + a2) > *(_QWORD *)(a1 + 496))
  {
    v11 = 29;
LABEL_9:
    v12 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_10;
  }
  if (!a3)
  {
    v11 = 0;
    v12 = (pthread_rwlock_t *)(a1 + 208);
    goto LABEL_10;
  }
  v29 = v10;
  v30 = a4;
  v31 = 0;
  v32 = (pthread_mutex_t *)(a1 + 408);
  while (1)
  {
    v14 = *(_QWORD *)(a1 + 488);
    v15 = a2 % v14;
    if (a3 < v14 || v15)
    {
      if (pthread_mutex_trylock(v32))
      {
        v21 = v31;
        if (v31)
          goto LABEL_34;
        v21 = (char *)malloc_type_malloc(32 * *(_QWORD *)(a1 + 488), 0x2B500DEAuLL);
        v31 = v21;
      }
      else
      {
        v21 = *(char **)(a1 + 472);
      }
      if (!v21)
      {
        v11 = 12;
        goto LABEL_67;
      }
LABEL_34:
      v22 = *(_QWORD *)(a1 + 512);
      v23 = *(_QWORD *)(a1 + 504) + a2 - v15;
      v24 = *(_QWORD *)(a1 + 488);
      if (v22 <= v23)
      {
        v25 = 0;
      }
      else
      {
        if ((uint64_t)(v24 + v23) <= v22)
          v25 = *(_QWORD *)(a1 + 488);
        else
          v25 = v22 - v23;
        if (v25)
        {
          v34 = 0;
          v26 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, char *))(*(_QWORD *)v29 + 328))(v29, v23, v25, &v34, v21);
          if (v34 == v25)
            v27 = 0;
          else
            v27 = 5;
          if (v26)
            v11 = v26;
          else
            v11 = v27;
          if (v26)
            v28 = 0;
          else
            v28 = v34 == v25;
          if (!v28)
          {
            v16 = 0;
            goto LABEL_58;
          }
          v24 = *(_QWORD *)(a1 + 488);
LABEL_52:
          if (v24 != v25)
          {
            bzero(&v21[v25], v24 - v25);
            v24 = *(_QWORD *)(a1 + 488);
          }
          sub_212808A4C(a1, (v23 - *(_QWORD *)(a1 + 504)) / v24, 1, (uint64_t)v21);
          if (*(_QWORD *)(a1 + 488) - v15 >= a3)
            v16 = a3;
          else
            v16 = *(_QWORD *)(a1 + 488) - v15;
          memcpy(a5, &v21[v15], v16);
LABEL_58:
          a4 = v30;
          if (v21 == *(char **)(a1 + 472))
            pthread_mutex_unlock(v32);
          if ((_DWORD)v11)
            goto LABEL_67;
          goto LABEL_61;
        }
      }
      v11 = 0;
      goto LABEL_52;
    }
    v16 = a3 / v14 * v14;
    v17 = *(_QWORD *)(a1 + 512);
    v18 = *(_QWORD *)(a1 + 504) + a2;
    if (v17 > v18)
      break;
    v19 = 0;
LABEL_29:
    if (v16 != v19)
      bzero(&a5[v19], v16 - v19);
    sub_212808A4C(a1, (unint64_t)(v18 - *(_QWORD *)(a1 + 504)) / *(_QWORD *)(a1 + 488), v16 / *(_QWORD *)(a1 + 488), (uint64_t)a5);
LABEL_61:
    a2 += v16;
    a5 += v16;
    a3 -= v16;
    if (!a3)
    {
      v11 = 0;
      goto LABEL_67;
    }
  }
  if ((uint64_t)(v18 + v16) <= v17)
    v19 = v16;
  else
    v19 = v17 - v18;
  if (!v19)
    goto LABEL_29;
  v34 = 0;
  v20 = (*(uint64_t (**)(uint64_t, int64_t, size_t, uint64_t *, char *))(*(_QWORD *)v29 + 328))(v29, v18, v19, &v34, a5);
  if (!(_DWORD)v20)
  {
    if (v34 != v19)
    {
      v11 = 5;
      goto LABEL_67;
    }
    goto LABEL_29;
  }
  v11 = v20;
LABEL_67:
  v12 = (pthread_rwlock_t *)(a1 + 208);
  if (v31)
    free(v31);
LABEL_10:
  pthread_rwlock_unlock(v12);
  if (a4)
    *a4 = v33 - a3;
  return v11;
}

uint64_t sub_2128091C0(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2)
    return 22;
  result = 0;
  *a2 = *(_QWORD *)(a1 + 496);
  return result;
}

uint64_t sub_2128091E0(_QWORD *a1, int64_t a2, size_t a3, _QWORD *a4, char *a5)
{
  uint64_t v10;
  pthread_rwlock_t *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t v15;
  size_t v16;
  size_t v17;
  uint64_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v25;
  _QWORD *v26;
  size_t v27;
  uint64_t v28;
  unint64_t v29;

  v10 = (*(uint64_t (**)(_QWORD *))(*a1 + 496))(a1);
  if (a4)
    *a4 = 0;
  v11 = (pthread_rwlock_t *)(a1 + 26);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 26));
  v12 = a1[59];
  if (!(*(unsigned int (**)(_QWORD *))(*a1 + 568))(a1))
  {
    v13 = 9;
    goto LABEL_38;
  }
  if (!a5)
  {
    v13 = 22;
    goto LABEL_38;
  }
  v25 = a3 + a2;
  if ((int64_t)(a3 + a2) > a1[62])
  {
    if ((*(unsigned int (**)(_QWORD *))(*a1 + 160))(a1))
    {
      if (a1[62] < a2)
        (*(void (**)(_QWORD *, int64_t, uint64_t))(*a1 + 320))(a1, a2, 1);
      v13 = (*(uint64_t (**)(_QWORD *, size_t, _QWORD))(*a1 + 320))(a1, v25, 0);
      v14 = a3;
      if ((_DWORD)v13)
        goto LABEL_39;
      goto LABEL_10;
    }
    v13 = 29;
LABEL_38:
    v14 = a3;
    goto LABEL_39;
  }
LABEL_10:
  if (!a3)
  {
LABEL_32:
    if ((int64_t)(v25 + a1[63]) > a1[64])
      (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v10 + 296))(v10, a1 + 64);
    v13 = 0;
    v14 = 0;
    goto LABEL_39;
  }
  v14 = a3;
  v26 = a4;
  v27 = a3;
  while (1)
  {
    v15 = a1[61];
    v16 = a2 % v15;
    if (v14 < v15 || v16)
      break;
    if (v14 / v15 * v15 >= 32 * v15)
      v17 = 32 * v15;
    else
      v17 = v14 / v15 * v15;
    sub_21280873C((uint64_t)a1, a2 / v15, v17 / v15, (uint64_t)a5, v12);
    v29 = 0;
    v18 = (*(uint64_t (**)(uint64_t, int64_t, size_t, unint64_t *, uint64_t))(*(_QWORD *)v10
                                                                                                  + 336))(v10, a1[63] + a2, v17, &v29, v12);
    if ((_DWORD)v18)
    {
      v13 = v18;
      v11 = (pthread_rwlock_t *)(a1 + 26);
      goto LABEL_44;
    }
    v19 = v29 == v17;
LABEL_29:
    v11 = (pthread_rwlock_t *)(a1 + 26);
    if (!v19)
    {
      v13 = 5;
LABEL_44:
      a3 = v27;
      goto LABEL_39;
    }
    a2 += v17;
    a5 += v17;
    v14 -= v17;
    a3 = v27;
    if (!v14)
      goto LABEL_32;
  }
  v20 = a2 - v16;
  v29 = 0;
  v21 = a1[63];
  if ((int64_t)(a2 - v16 + v15 + v21) > a1[64])
  {
    v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v10 + 312))(v10);
    if ((_DWORD)v22)
      goto LABEL_42;
    v21 = a1[63];
    v15 = a1[61];
  }
  v22 = (*(uint64_t (**)(uint64_t, unint64_t, size_t, unint64_t *, uint64_t))(*(_QWORD *)v10
                                                                                                  + 328))(v10, v21 + v20, v15, &v29, v12);
  if ((_DWORD)v22)
  {
LABEL_42:
    v13 = v22;
    goto LABEL_46;
  }
  if (v29 == a1[61])
  {
    sub_212808A4C((uint64_t)a1, v20 / v29, 1, v12);
    if (a1[61] - v16 >= v14)
      v17 = v14;
    else
      v17 = a1[61] - v16;
    memcpy((void *)(v12 + v16), a5, v17);
    sub_21280873C((uint64_t)a1, v20 / a1[61], 1, v12, v12);
    v28 = 0;
    v23 = (*(uint64_t (**)(uint64_t, unint64_t, _QWORD, uint64_t *, uint64_t))(*(_QWORD *)v10 + 336))(v10, a1[63] + v20, a1[61], &v28, v12);
    if ((_DWORD)v23)
    {
      v13 = v23;
      a4 = v26;
      a3 = v27;
      goto LABEL_48;
    }
    v19 = v28 == a1[61];
    a4 = v26;
    goto LABEL_29;
  }
  v13 = 5;
LABEL_46:
  a4 = v26;
LABEL_48:
  v11 = (pthread_rwlock_t *)(a1 + 26);
LABEL_39:
  pthread_rwlock_unlock(v11);
  if (a4)
    *a4 = a3 - v14;
  return v13;
}

uint64_t sub_21280951C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 248))(result);
  return result;
}

uint64_t sub_212809534(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 264))(v1);
  else
    return 999;
}

uint64_t sub_212809550(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 224))(result);
  return result;
}

uint64_t sub_212809568(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 240))(v1);
  else
    return 999;
}

const __CFDictionary *sub_212809584(uint64_t a1)
{
  uint64_t v1;
  CFAllocatorRef *v2;
  const __CFDictionary *Mutable;
  const __CFAllocator *v4;
  const __CFNumber *Value;
  int v6;
  CFNumberRef v7;
  CFNumberRef v8;
  __int16 valuePtr;

  valuePtr = 0;
  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  v2 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (v1 && (Mutable = (const __CFDictionary *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 464))(v1)) != 0
    || (v4 = *v2, (Mutable = CFDictionaryCreateMutable(*v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0))
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("owner-mode"));
    if (Value)
    {
      v6 = CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      v4 = *v2;
      if (v6)
      {
        valuePtr &= 0x1C0u;
        v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
        if (v7)
          goto LABEL_11;
      }
    }
    else
    {
      v4 = *v2;
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
      return Mutable;
  }
  valuePtr = 448;
  v7 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
  if (v7)
  {
LABEL_11:
    v8 = v7;
    CFDictionarySetValue(Mutable, CFSTR("owner-mode"), v7);
    CFRelease(v8);
  }
  return Mutable;
}

uint64_t sub_2128096BC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 184))(result);
  return result;
}

uint64_t sub_2128096D4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 344))(v1);
  else
    return 999;
}

BOOL sub_2128096F0(_DWORD *a1)
{
  char *v1;
  int v2;
  uint64_t v3;
  _DWORD *v4;
  BOOL v5;
  uint64_t v6;

  v1 = (char *)a1 + 566;
  v2 = a1[120];
  v3 = 8;
  if (v2 == 1)
    v3 = 376;
  if (*(_DWORD *)&v1[v3] != 91)
    return 0;
  v4 = (_DWORD *)((char *)a1 + 642);
  if (v2 != 1)
    v4 = (_DWORD *)((char *)a1 + 566);
  if (*v4 != -2147483647)
    return 0;
  v5 = v2 == 1;
  v6 = 4;
  if (v5)
    v6 = 80;
  return *(_DWORD *)&v1[v6] == 128;
}

uint64_t sub_212809758(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  const char *v9;
  char *v10;
  uint64_t v11;
  size_t v12;
  char __s[1024];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = (*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("use-filename-for-prompt"));
  v3 = *(_QWORD *)a1;
  if (v2)
    v4 = (*(uint64_t (**)(uint64_t, const __CFString *))(v3 + 24))(a1, CFSTR("use-filename-for-prompt"));
  else
    v4 = (*(uint64_t (**)(uint64_t))(v3 + 192))(a1);
  v5 = v4;
  v6 = DIGetBundleRef();
  v7 = (const __CFString *)sub_21281FFEC(v6, (int)CFSTR("Enter password to access \"%1$@\": "), CFSTR("Enter password to access \"%1$@\": "));
  v8 = CFStringCreateWithFormat(0, 0, v7, v5);
  v9 = (const char *)sub_2127F2B30(v8, 0x8000100u);
  v10 = (char *)v9;
  if (!v9)
    v9 = "Enter password: ";
  v11 = sub_212809904(v9, __s, 1024, 1);
  if (!(_DWORD)v11)
  {
    v12 = strlen(__s);
    v11 = sub_21281B4BC(a1, (uint64_t)__s, v12) ? 0 : 80;
    if (v10)
      free(v10);
  }
  if (v8)
    CFRelease(v8);
  if (v7)
    CFRelease(v7);
  return v11;
}

void sub_2128098B8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_212809904(const char *a1, char *a2, int a3, int a4)
{
  uint64_t v6;

  v6 = 22;
  if (a2 && a3 >= 2)
  {
    if (!a1)
      a1 = "";
    if (readpassphrase(a1, a2, a3, a4 ^ 1 | 2u))
      return 0;
    v6 = *__error();
  }
  if (a2 && (_DWORD)v6)
    bzero(a2, a3);
  return v6;
}

const char *sub_21280998C()
{
  return "CEncryptedEncoding";
}

uint64_t sub_212809998(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (a2)
    *a2 = *(_QWORD *)(a1 + 496);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  if (result)
  {
    v7 = 0;
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
    result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v5 + 304))(v5, &v7);
    if (a2)
    {
      if (!(_DWORD)result)
      {
        if (*(_DWORD *)(a1 + 480) == 1)
          v6 = v7 - 1276;
        else
          v6 = v7 - *(_QWORD *)(a1 + 504);
        *a2 = v6 / *(_QWORD *)(a1 + 488) * *(_QWORD *)(a1 + 488);
      }
    }
  }
  return result;
}

void sub_212809A3C(_DWORD *a1, uint64_t a2, const __CFDictionary *a3)
{
  int v5;
  int v6;
  int v7;
  const void *Value;
  const __CFString *v9;
  CFTypeID TypeID;
  CFTypeID v11;
  const char *v12;

  v5 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)a1 + 696))(a1);
  if (v5)
    sub_212807E8C(v5, (uint64_t)"setBackingStore() failed");
  v6 = sub_212809BB8((uint64_t)a1);
  if (v6)
    sub_212807E8C(v6, (uint64_t)"loadHeaderAndKeys() failed");
  v7 = sub_212806E34();
  if (v7)
    sub_212807E8C(v7, (uint64_t)"DIEnableSecureMode() failed");
  if (!a3)
  {
    if (a1[120] != 2)
    {
      v9 = 0;
      goto LABEL_13;
    }
LABEL_17:
    v12 = "unlock with passphrase failed";
    goto LABEL_20;
  }
  Value = CFDictionaryGetValue(a3, CFSTR("recovery-key"));
  v9 = (const __CFString *)CFDictionaryGetValue(a3, CFSTR("passphrase"));
  if (Value)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(Value))
    {
      v12 = "recovery-key was not a CFStringRef";
      goto LABEL_20;
    }
  }
  if (v9)
  {
    v11 = CFStringGetTypeID();
    if (v11 == CFGetTypeID(v9))
      goto LABEL_13;
    v12 = "passphrase was not a CFStringRef";
LABEL_20:
    sub_212807E8C(80, (uint64_t)v12);
  }
  if (a1[120] == 2)
    goto LABEL_17;
LABEL_13:
  sub_212807E30((uint64_t)a1, v9);
  sub_212808314((uint64_t)a1);
}

uint64_t sub_212809B74(uint64_t a1, char *a2)
{
  uint64_t result;

  result = sub_2127F5BB8(a1, a2);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)a2 + 296))(a2, a1 + 512);
  return result;
}

uint64_t sub_212809BB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  uint64_t v5;
  unsigned int v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  _QWORD *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  v3 = sub_212809F1C(a1);
  if (!(_DWORD)v3)
  {
    if (*(_DWORD *)(a1 + 480) != 2)
      return 0;
    v31 = 0;
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v2);
    if (!(_DWORD)v3)
    {
      v4 = (unsigned int *)malloc_type_malloc(0x54uLL, 0x90CCB427uLL);
      if (!v4)
        goto LABEL_15;
      v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(_QWORD *)v2 + 328))(v2, 72, 84, &v31, v4);
      if ((_DWORD)v5)
      {
        v3 = v5;
        goto LABEL_16;
      }
      v7 = bswap32(*v4);
      if (v7 > 0x800)
      {
        v3 = 107;
        goto LABEL_16;
      }
      v8 = 20 * v7 + 4;
      v9 = (unsigned int *)malloc_type_realloc(v4, v8, 0xF9FC029uLL);
      if (!v9)
      {
LABEL_15:
        v3 = 12;
        goto LABEL_16;
      }
      v10 = v9;
      if (v7 >= 5)
      {
        v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned int *))(*(_QWORD *)v2 + 328))(v2, 72, v8, &v31, v9);
        if ((_DWORD)v11)
        {
LABEL_14:
          v3 = v11;
          goto LABEL_50;
        }
      }
      sub_2128119FC(v10, v8);
      *(_QWORD *)(a1 + 536) = 0;
      v12 = *v10;
      if (*v10)
      {
        v13 = 0;
        v12 = 0;
        v14 = 0;
        v15 = 1;
        do
        {
          v16 = v10[v15];
          if (v16 == 2)
          {
            *(_DWORD *)(a1 + 536) = ++v12;
          }
          else if (v16 == 1)
          {
            *(_DWORD *)(a1 + 540) = ++v13;
          }
          ++v14;
          v15 += 5;
        }
        while (v14 < *v10);
      }
      v17 = malloc_type_malloc(564 * v12, 0x1000040185CD20FuLL);
      *(_QWORD *)(a1 + 520) = v17;
      if (!v17
        || (v18 = malloc_type_malloc(616 * *(unsigned int *)(a1 + 540), 0x10000409E51EDBFuLL),
            (*(_QWORD *)(a1 + 528) = v18) == 0))
      {
        v3 = 12;
        goto LABEL_50;
      }
      v19 = *v10;
      if (!(_DWORD)v19)
      {
LABEL_41:
        if (*(_DWORD *)(a1 + 536))
        {
          v27 = 0;
          v28 = 0;
          do
          {
            sub_21281B484(*(_QWORD *)(a1 + 520) + v27);
            ++v28;
            v27 += 564;
          }
          while (v28 < *(unsigned int *)(a1 + 536));
        }
        if (!*(_DWORD *)(a1 + 540))
        {
LABEL_48:
          v3 = 0;
          goto LABEL_50;
        }
        v29 = 0;
        v30 = 0;
        while (1)
        {
          v11 = sub_212811A50(*(_QWORD *)(a1 + 528) + v29);
          if ((_DWORD)v11)
            goto LABEL_14;
          ++v30;
          v29 += 616;
          if (v30 >= *(unsigned int *)(a1 + 540))
            goto LABEL_48;
        }
      }
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = v10 + 2;
      while (1)
      {
        v24 = *((_DWORD *)v23 - 1);
        v25 = *v23;
        v26 = v23[1];
        if (v24 == 2)
          break;
        if (v24 == 1)
        {
          if (v26 != 616)
            goto LABEL_51;
          v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v2 + 328))(v2, v25, 616, &v31, *(_QWORD *)(a1 + 528) + 616 * v21);
          if (!(_DWORD)v3)
            ++v21;
LABEL_38:
          if ((_DWORD)v3)
            goto LABEL_50;
          v19 = *v10;
        }
        v23 = (_QWORD *)((char *)v23 + 20);
        if (++v20 >= v19)
          goto LABEL_41;
      }
      if (v26 != 564)
      {
LABEL_51:
        v3 = 107;
LABEL_50:
        v4 = v10;
LABEL_16:
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 280))(v2, 0);
        if (v4)
          free(v4);
        return v3;
      }
      v3 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v2 + 328))(v2, v25, 564, &v31, *(_QWORD *)(a1 + 520) + 564 * v22);
      if (!(_DWORD)v3)
        ++v22;
      goto LABEL_38;
    }
  }
  return v3;
}

uint64_t sub_212809F1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFNumberRef v8;
  CFNumberRef v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  v12 = 0;
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 272))(v2);
  if (!(_DWORD)v3)
  {
    v11 = 0;
    v3 = (*(uint64_t (**)(uint64_t, unint64_t *))(*(_QWORD *)v2 + 296))(v2, &v11);
    if ((_DWORD)v3)
    {
LABEL_3:
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 280))(v2, 0);
      return v3;
    }
    if ((v11 & 0x8000000000000000) == 0)
    {
      if (v11 >= 0x4FC)
      {
        v3 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v2 + 328))(v2, v11 - 1276, 1276, &v12, a1 + 546);
        if ((_DWORD)v3)
          goto LABEL_3;
        if (!sub_2127F5358(a1 + 546)
          && *(_DWORD *)(a1 + 1818) == 1701733234
          && *(_DWORD *)(a1 + 1814) == 1667527521
          && *(_DWORD *)(a1 + 1810) == 1)
        {
          v5 = 0;
          *(_DWORD *)(a1 + 480) = 1;
          v6 = *(unsigned int *)(a1 + 562);
          v7 = *(_QWORD *)(a1 + 1802);
LABEL_19:
          *(_QWORD *)(a1 + 488) = v6;
          *(_QWORD *)(a1 + 496) = v7;
          *(_QWORD *)(a1 + 504) = v5;
          v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, (const void *)(a1 + 488));
          if (v8)
          {
            v9 = v8;
            (*(void (**)(uint64_t, const __CFString *, CFNumberRef))(*(_QWORD *)a1 + 32))(a1, CFSTR("bs-proxy-encoding-blocksize"), v8);
            CFRelease(v9);
          }
          v10 = malloc_type_malloc(32 * *(_QWORD *)(a1 + 488), 0xA503D6CAuLL);
          *(_QWORD *)(a1 + 472) = v10;
          if (v10)
            v3 = 0;
          else
            v3 = 12;
          goto LABEL_3;
        }
      }
      v3 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v2 + 328))(v2, 0, 72, &v12, a1 + 546);
      if ((_DWORD)v3)
        goto LABEL_3;
      v3 = sub_2127F5428(a1 + 546);
      if ((_DWORD)v3)
        goto LABEL_3;
      if (*(_DWORD *)(a1 + 546) != 1701733234 || *(_DWORD *)(a1 + 550) != 1667527521)
      {
        v3 = 110;
        goto LABEL_3;
      }
      if (*(_DWORD *)(a1 + 554) == 2)
      {
        *(_DWORD *)(a1 + 480) = 2;
        v6 = *(unsigned int *)(a1 + 598);
        v7 = *(_QWORD *)(a1 + 602);
        v5 = *(_QWORD *)(a1 + 610);
        goto LABEL_19;
      }
    }
    v3 = 107;
    goto LABEL_3;
  }
  return v3;
}

uint64_t sub_21280A140(const __CFURL *a1, CFDictionaryRef theDict, unsigned int (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a4, uint64_t *a5, _QWORD *a6)
{
  _QWORD *v6;
  const __CFURL *v11;
  const __CFNumber *Value;
  const __CFNumber *v13;
  const __CFString *v14;
  char *v15;
  int v16;
  uint64_t v17;
  float v18;
  statfs *v19;
  unsigned int *v20;
  const char *v21;
  const __CFNumber *v22;
  uint64_t v23;
  int v24;
  int64_t v25;
  void *v26;
  uint64_t v28;
  time_t v29;
  off_t v30;
  time_t v31;
  size_t v32;
  ssize_t v33;
  const __CFURL *v34;
  _QWORD *v35;
  unsigned int (*v36)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v37;
  float v38;
  __int16 v39;
  uint64_t v40;
  off_t valuePtr;
  statfs v42;
  uint64_t v43;

  v6 = a6;
  v11 = a1;
  v43 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  valuePtr = 0;
  v39 = 0;
  if (a6)
    *a6 = 0;
  if (!a5)
    return 22;
  *a5 = 0;
  if (!a1)
    return 22;
  if (theDict)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("size"));
    if (Value && !CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      valuePtr = 0;
    v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("max-size"));
    if (v13)
    {
      if (!CFNumberGetValue(v13, kCFNumberSInt64Type, &v40))
        goto LABEL_12;
    }
  }
  if (!v40)
LABEL_12:
    v40 = valuePtr;
  v14 = sub_2127F2AEC(v11);
  if (!v14)
    return 999;
  v15 = (char *)v14;
  if (sub_2127F2A48(theDict, CFSTR("overwrite"), 0))
    unlink(v15);
  v16 = sub_2127F4264(v15, 3586, 0, 438);
  if (v16 < 0)
  {
    v17 = *__error();
    if ((_DWORD)v17)
    {
      if (v16 != -1)
        close(v16);
      goto LABEL_50;
    }
  }
  if (theDict)
  {
    v42.f_bsize = 0;
    v42.f_bsize = sub_2127FEC8C(theDict, CFSTR("file-type"), 0);
    LODWORD(v18) = sub_2127FEC8C(theDict, CFSTR("file-creator"), 0);
    v38 = v18;
    if (!v42.f_bsize || v18 == 0.0)
    {
      if (v42.f_bsize)
      {
        v19 = &v42;
        v21 = v15;
        v20 = 0;
      }
      else
      {
        if (v18 == 0.0)
          goto LABEL_29;
        v20 = (unsigned int *)&v38;
        v21 = v15;
        v19 = 0;
      }
    }
    else
    {
      v19 = &v42;
      v20 = (unsigned int *)&v38;
      v21 = v15;
    }
    if ((sub_21281494C(v21, &v19->f_bsize, v20) & 0x80000000) != 0)
    {
      v17 = *__error();
      if ((_DWORD)v17)
        goto LABEL_69;
    }
  }
LABEL_29:
  v22 = sub_2127FED60(v15, theDict);
  if ((_DWORD)v22)
  {
    v17 = (uint64_t)v22;
LABEL_69:
    v26 = 0;
    goto LABEL_34;
  }
  v23 = v40;
  v24 = statfs(v15, &v42);
  v25 = v42.f_bavail * v42.f_bsize;
  if (v24)
    v25 = v23;
  if (v40 > v25)
  {
    v26 = 0;
    v17 = 28;
    goto LABEL_34;
  }
  v37 = a4;
  sub_2127FEE8C(v15, (_BYTE *)&v39 + 1, &v39);
  if (v40 && HIBYTE(v39))
    sub_21280CB28(v16, v40);
  v26 = 0;
  if (a3 && valuePtr && !(_BYTE)v39)
  {
    if (sub_2127F2A48(theDict, CFSTR("skip-zeroing"), 0))
    {
      v26 = 0;
    }
    else
    {
      v34 = v11;
      v35 = v6;
      *(_QWORD *)&v42.f_bsize = 0;
      fcntl(v16, 48, 1);
      v26 = malloc_type_calloc(0x100000uLL, 1uLL, 0x4704EC30uLL);
      if (!v26)
      {
        v17 = 12;
        goto LABEL_34;
      }
      v38 = 0.0;
      v36 = a3;
      a3(1, v37, &v38, 0, 0, 0);
      lseek(v16, 0, 0);
      v28 = valuePtr;
      v29 = time(0);
      if (v28)
      {
        v30 = 0;
        v31 = v29 - 1;
        while (1)
        {
          v32 = v28 >= 0x100000 ? 0x100000 : v28;
          v33 = pwrite(v16, v26, v32, v30);
          if (v33 < 0)
          {
            v17 = *__error();
            if ((_DWORD)v17)
              goto LABEL_34;
          }
          v28 -= v33;
          if (v28 < 1)
            break;
          v30 += v33;
          if (time((time_t *)&v42) > v31)
          {
            v38 = (float)((float)v30 * 100.0) / (float)valuePtr;
            v36(1, v37, &v38, 0, 0, 0);
            if (v36(2, v37, 0, 0, 0, 0))
              goto LABEL_65;
            v31 = *(_QWORD *)&v42.f_bsize;
          }
        }
      }
      v38 = 100.0;
      v36(1, v37, &v38, 0, 0, 0);
      if (v36(2, v37, 0, 0, 0, 0))
      {
LABEL_65:
        v17 = 111;
        goto LABEL_34;
      }
      v38 = -1.0;
      v36(1, v37, &v38, 0, 0, 0);
      v11 = v34;
      v6 = v35;
    }
  }
  if (sub_2127F2A48(theDict, CFSTR("skip-file-size-set"), 0)
    || (ftruncate(v16, valuePtr) & 0x80000000) == 0
    || (v17 = *__error(), !(_DWORD)v17))
  {
    close(v16);
    v17 = sub_2127F2C84(v11, theDict, a5, v6);
    if (!(_DWORD)v17)
      goto LABEL_49;
    goto LABEL_48;
  }
LABEL_34:
  if (v16 != -1)
    close(v16);
LABEL_48:
  unlink(v15);
LABEL_49:
  free(v15);
  v15 = (char *)v26;
  if (v26)
LABEL_50:
    free(v15);
  return v17;
}

uint64_t sub_21280A650(const __CFArray *a1, CFArrayRef theArray)
{
  int Count;
  CFIndex v5;
  uint64_t result;
  CFIndex v7;
  const void *ValueAtIndex;
  CFRange v9;

  Count = CFArrayGetCount(theArray);
  v5 = CFArrayGetCount(a1);
  result = 0;
  if (a1 && theArray && Count > 0)
  {
    v7 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v7);
      if (ValueAtIndex)
      {
        v9.location = 0;
        v9.length = v5;
        if (CFArrayContainsValue(a1, v9, ValueAtIndex))
          break;
      }
      if (Count == ++v7)
        return 0;
    }
    return 1;
  }
  return result;
}

uint64_t sub_21280A6F8()
{
  return 0;
}

__CFDictionary *sub_21280A700(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5)
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFAllocator *v16;
  const __CFDictionary *v17;
  CFStringRef v18;
  CFStringRef v19;
  const __CFString *Value;
  CFStringRef v21;
  const char *v22;
  int v23;
  CFStringRef v24;
  uint64_t v25;
  uint64_t v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  char *v29;
  int v30;
  char *v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  CFStringRef v34;
  CFStringRef v35;
  char *v37;

  if (!a2)
    return 0;
  v10 = (const char *)(a2 + 48);
  if (strnlen((const char *)(a2 + 48), 0x20uLL) >= 0x20)
  {
    if (*(_BYTE *)(a2 + 79))
      return 0;
  }
  if (strnlen((const char *)(a2 + 16), 0x20uLL) >= 0x20 && *(_BYTE *)(a2 + 47))
    return 0;
  v11 = bswap32(*(_DWORD *)(a2 + 8)) * (unint64_t)(a4 >> 9);
  v12 = bswap32(*(_DWORD *)(a2 + 12)) * (unint64_t)(a4 >> 9);
  if (a5)
  {
    v13 = sub_2128033A4(a1);
    if (v12 + v11 > (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 96))(v13))
    {
      v14 = sub_2128033A4(a1);
      v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v14 + 96))(v14) - v11;
    }
  }
  v15 = sub_21280A9D8();
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (!v15)
    goto LABEL_14;
  v17 = (const __CFDictionary *)v15;
  v18 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, 0);
  if (!v18)
    return 0;
  v19 = v18;
  Value = (const __CFString *)CFDictionaryGetValue(v17, v18);
  if (!Value)
  {
    CFRelease(v19);
LABEL_14:
    v21 = CFStringCreateWithCString(v16, v10, 0);
    if (v21)
      goto LABEL_15;
    return 0;
  }
  v21 = Value;
  CFRetain(Value);
  CFRelease(v19);
LABEL_15:
  v22 = (const char *)(a2 + 15);
  do
    v23 = *(unsigned __int8 *)++v22;
  while (v23 == 32);
  v24 = CFStringCreateWithCString(v16, v22, 0);
  if (!v24
    || CFStringCompare(v21, CFSTR("Apple_Free"), 1uLL) == kCFCompareEqualTo
    || (v27 = sub_21280368C(v11, v12, a3, v21, v24, 0, v25, v26)) == 0)
  {
    if (v21)
      CFRelease(v21);
    if (v24)
      CFRelease(v24);
    return 0;
  }
  v28 = v27;
  v37 = 0;
  v29 = (char *)sub_2128033A4(a1);
  v30 = sub_212802440(v29, v11, v12, (uint64_t *)&v37);
  v31 = v37;
  if (!v30 && v37)
  {
    v32 = sub_2128036D4();
    if (v32)
    {
      v33 = v32;
      CFDictionarySetValue(v28, CFSTR("partition-filesystems"), v32);
      CFRelease(v33);
    }
    v31 = v37;
  }
  if (v31)
    DIDiskImageObjectRelease(v31);
  if (*(_DWORD *)(a2 + 508))
  {
    v34 = CFStringCreateWithFormat(v16, 0, CFSTR("%4.4s"), a2 + 508);
    CFDictionarySetValue(v28, CFSTR("toast-signature"), v34);
    CFRelease(v34);
  }
  if (*(_DWORD *)(a2 + 296))
  {
    v35 = CFStringCreateWithFormat(v16, 0, CFSTR("%4.4s"), a2 + 296);
    CFDictionarySetValue(v28, CFSTR("drive-setup-signature"), v35);
    CFRelease(v35);
  }
  CFRelease(v21);
  CFRelease(v24);
  return v28;
}

uint64_t sub_21280A9D8()
{
  uint64_t result;
  const __CFAllocator *v1;
  const __CFData *v2;
  const __CFData *v3;

  result = qword_254B5ADA8;
  if (!qword_254B5ADA8)
  {
    v1 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UInt8 *)"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n</dict>\n</plist>\n", 188);
    if (v2)
    {
      v3 = v2;
      qword_254B5ADA8 = (uint64_t)CFPropertyListCreateWithData(v1, v2, 0, 0, 0);
      CFRelease(v3);
    }
    return qword_254B5ADA8;
  }
  return result;
}

const __CFString *sub_21280AA54()
{
  return CFSTR("Apple");
}

UInt8 *sub_21280AA64(int *a1)
{
  UInt8 *v2;
  UInt8 *result;

  v2 = (UInt8 *)qword_254B5ADB8;
  if (qword_254B5ADB8)
    return sub_21280AAC0(a1, 0, v2, 80);
  result = (UInt8 *)malloc_type_malloc(0x50uLL, 0x959BD508uLL);
  v2 = result;
  qword_254B5ADB8 = (uint64_t)result;
  if (result)
    return sub_21280AAC0(a1, 0, v2, 80);
  return result;
}

UInt8 *sub_21280AAC0(int *a1, char a2, UInt8 *a3, int a4)
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFData *ExternalRepresentation;
  CFIndex Length;
  CFIndex v10;
  CFRange v12;

  v6 = sub_21280AB60(a1, a2);
  if (!v6)
    return 0;
  v7 = v6;
  ExternalRepresentation = CFStringCreateExternalRepresentation(0, v6, 0x8000100u, 0x3Fu);
  CFRelease(v7);
  if (!ExternalRepresentation)
    return 0;
  Length = CFDataGetLength(ExternalRepresentation);
  if (Length >= a4)
    v10 = a4 - 1;
  else
    v10 = Length;
  v12.location = 0;
  v12.length = v10;
  CFDataGetBytes(ExternalRepresentation, v12, a3);
  a3[v10] = 0;
  CFRelease(ExternalRepresentation);
  return a3;
}

const __CFString *sub_21280AB60(int *a1, char a2)
{
  int *v3;
  char *v4;
  CFStringRef v5;
  CFStringRef v6;
  CFTypeRef v7;
  uint64_t v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  CFStringRef v13;

  v3 = a1;
  if ((_DWORD)a1 == -1 && (a2 & 1) == 0)
    LODWORD(a1) = *__error();
  if (a1 >= 0x6B)
  {
    if ((a2 & 2) == 0)
    {
      v9 = 0;
      v10 = -19;
      do
      {
        if ((_DWORD)a1 == v10)
        {
          a1 = (int *)((char *)&unk_2128270E0 + v9 + 4);
          goto LABEL_25;
        }
        v10 = *(_DWORD *)((char *)&unk_2128270E0 + v9 + 8);
        v9 += 8;
      }
      while (v9 != 192);
      if ((a1 & 0x80000000) != 0 && *__error() && *__error() != 2 && *__error() != 1)
      {
        a1 = __error();
LABEL_25:
        LODWORD(a1) = *a1;
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v4 = strerror((int)a1);
    v5 = CFStringCreateWithCString(0, v4, 0x8000100u);
    if (v5)
    {
      v6 = v5;
      v7 = CFRetain(v5);
      CFRelease(v6);
      return (const __CFString *)v7;
    }
  }
  if ((a2 & 4) != 0)
    return 0;
  if ((int)v3 >= -100000000)
    v11 = CFSTR("error %1$d");
  else
    v11 = CFSTR("error %1$#x");
  v12 = (const __CFString *)CFRetain(v11);
  v13 = CFStringCreateWithFormat(0, 0, v12, v3);
  CFRelease(v12);
  if (v13)
    return v13;
  else
    return &stru_24CE2CFF0;
}

uint64_t sub_21280ACCC()
{
  return 0;
}

uint64_t sub_21280ACD4()
{
  return 0;
}

uint64_t sub_21280ACDC(uint64_t a1, uint64_t a2, char **a3, _QWORD *a4)
{
  char *v8;
  uint64_t v9;

  if (a4)
    *a4 = 0;
  if (!a3)
    return 22;
  *a3 = 0;
  if (!a1)
    return 22;
  v8 = (char *)operator new();
  sub_21280ADB0((uint64_t)v8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)v8 + 560))(v8, a1, a2);
  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease(v8);
    v8 = 0;
  }
  *a3 = v8;
  if (a4)
    *a4 = 0;
  return v9;
}

void sub_21280AD8C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40B7E68147);
  _Unwind_Resume(a1);
}

uint64_t sub_21280ADB0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2127F6A04(a1);
  *(_QWORD *)v2 = &off_24CE2A3D0;
  *(_QWORD *)(v2 + 160) = 0;
  pthread_rwlock_init((pthread_rwlock_t *)(v2 + 168), 0);
  (*(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)a1 + 32))(a1, CFSTR("thread-safe"), *MEMORY[0x24BDBD270]);
  return a1;
}

void sub_21280AE14(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21280AE2C(char *a1, uint64_t *a2, char a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFURL *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  char v17;

  v6 = operator new();
  *(_QWORD *)v6 = &off_24CE2A638;
  *(_QWORD *)(v6 + 8) = 0;
  *(_DWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 96) = 0;
  *(_DWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  *(_QWORD *)(v6 + 48) = 0;
  *(_DWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 80) = 0;
  *(_WORD *)(v6 + 104) = 1;
  *(_BYTE *)(v6 + 106) = 1;
  *(_QWORD *)(v6 + 112) = 0;
  v7 = (_QWORD *)(v6 + 112);
  *(_QWORD *)(v6 + 120) = 0;
  *(_QWORD *)(v6 + 24) = a1;
  DIDiskImageObjectRetain_0(a1);
  *(_BYTE *)(v6 + 104) = a3;
  v8 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 272))(a1);
  if ((_DWORD)v8)
  {
    v12 = v8;
    v9 = 0;
  }
  else if ((*(unsigned int (**)(char *))(*(_QWORD *)a1 + 72))(a1)
         && (v9 = 1, v10 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)a1 + 168))(a1, 1), (_DWORD)v10))
  {
    v12 = v10;
  }
  else
  {
    *v7 = 0;
    *(_QWORD *)(v6 + 120) = 0;
    v11 = (*(uint64_t (**)(_QWORD, _QWORD *))(**(_QWORD **)(v6 + 24) + 296))(*(_QWORD *)(v6 + 24), v7);
    if ((_DWORD)v11
      || (*(_QWORD *)(v6 + 120) = *(_QWORD *)(v6 + 112),
          v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 112))(v6),
          (_DWORD)v11))
    {
      v12 = v11;
      v9 = 1;
    }
    else
    {
      v12 = sub_21280B5DC(v6);
      v9 = v12 != 0;
    }
  }
  if (!*(_BYTE *)(v6 + 104) || !*(_BYTE *)(v6 + 105))
    goto LABEL_22;
  v13 = (const __CFURL *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 176))(a1);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_14;
  }
  v14 = (const __CFString *)sub_2127FCDB8(v13);
  v15 = v14;
  if (!v14)
  {
LABEL_14:
    v16 = 0;
    v17 = 1;
    goto LABEL_15;
  }
  v16 = sub_2127F2B30(v14, 0x8000100u);
  v17 = 0;
LABEL_15:
  if (*(_BYTE *)(v6 + 106))
    sub_212818390("\x1B[32m\x1B[1mThe sparse disk image \"%s\" was repaired.\x1B[0m");
  else
    sub_212818390("\x1B[31m\x1B[1mThe sparse disk image \"%s\" was not repaired.\x1B[0m");
  if (v16)
    free(v16);
  if ((v17 & 1) == 0)
    CFRelease(v15);
LABEL_22:
  if (v9)
    (*(void (**)(char *, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
  if ((_DWORD)v12)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
    v6 = 0;
  }
  *a2 = v6;
  return v12;
}

uint64_t sub_21280B064(_QWORD *a1)
{
  unint64_t v2;
  uint64_t result;
  int v4;
  unint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  void *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void *v35;
  _BYTE v36[4];
  int v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  (*(void (**)(_QWORD *))(*a1 + 128))(a1);
  v2 = a1[14];
  result = sub_2127F6308(a1[3], (uint64_t)v36, 64);
  if ((_DWORD)result)
    return result;
  if (!sub_212818334((uint64_t)v36))
    return 107;
  v4 = v37;
  if ((v37 - 1) >= 2)
  {
    if (v37 == 3)
    {
      a1[5] = v40;
      *((_DWORD *)a1 + 12) = v38;
      *((_DWORD *)a1 + 22) = 3;
      goto LABEL_9;
    }
  }
  else
  {
    a1[5] = v39;
  }
  *((_DWORD *)a1 + 12) = v38;
  *((_DWORD *)a1 + 22) = v4;
  if (v4 == 1)
  {
    v5 = 512;
    goto LABEL_11;
  }
  if (v4 == 2)
  {
LABEL_9:
    v5 = 4096;
LABEL_11:
    a1[8] = v5;
    goto LABEL_13;
  }
  v5 = a1[8];
LABEL_13:
  *(int32x2_t *)((char *)a1 + 52) = vshrn_n_s64(vaddq_s64(vdupq_n_s64(v5), (int64x2_t)xmmword_212826E00), 2uLL);
  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
  v7 = malloc_type_malloc(v6, 0x65507881uLL);
  a1[9] = v7;
  if (!v7)
    return 12;
  v8 = (uint64_t)v7;
  v9 = a1[3];
  v10 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
  result = sub_2127F6308(v9, v8, v10);
  if (!(_DWORD)result)
  {
    v11 = a1[9];
    v12 = *(_DWORD *)(v11 + 12);
    *(_DWORD *)(v11 + 12) = v12 & 0xFFFFFFFE;
    if (*(_DWORD *)(v11 + 4) == 2)
    {
      *(_DWORD *)(v11 + 4) = 3;
      *(_QWORD *)(v11 + 28) = *(unsigned int *)(v11 + 16);
      *(_DWORD *)(v11 + 12) = v12 | 1;
    }
    v13 = *(_QWORD *)(v11 + 20);
    if (v13)
    {
      v14 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
      v15 = (*(unsigned int (**)(_QWORD *))(*a1 + 88))(a1);
      v16 = v14 + ((v15 * (*(uint64_t (**)(_QWORD *))(*a1 + 64))(a1)) << 9);
      if ((*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) + v13 <= v2 && v13 == v16)
      {
        while (1)
        {
          v17 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
          v18 = (void *)a1[10];
          if (v18)
          {
            v19 = (char *)malloc_type_realloc(v18, v17 * (*((_DWORD *)a1 + 8) + 1), 0xA091F3E4uLL);
            if (!v19)
              return 12;
            v20 = v19;
            a1[10] = v19;
          }
          else
          {
            v20 = (char *)malloc_type_malloc(v17, 0xF7285F5DuLL);
            a1[10] = v20;
            if (!v20)
            {
              *((_DWORD *)a1 + 8) = 0;
              return 12;
            }
          }
          v21 = *((unsigned int *)a1 + 8);
          *((_DWORD *)a1 + 8) = v21 + 1;
          if ((_DWORD)v21 == -1)
            v22 = 0;
          else
            v22 = &v20[(*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) * v21];
          bzero(v22, v17);
          result = sub_2128183C0((_QWORD **)a1, v13, (uint64_t)v22);
          if ((_DWORD)result)
            return result;
          if (*(_DWORD *)v22 != 1936749171)
            break;
          *((_DWORD *)v22 + 2) &= ~1u;
          v23 = *(_QWORD *)(v22 + 12);
          if (!v23)
            return 0;
          v24 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) + v13;
          v25 = (*(unsigned int (**)(_QWORD *))(*a1 + 96))(a1);
          v26 = v24 + ((v25 * (*(uint64_t (**)(_QWORD *))(*a1 + 64))(a1)) << 9);
          if ((*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) + v23 <= v2)
          {
            v13 = v23;
            if (v23 == v26)
              continue;
          }
          v27 = v22 + 12;
          sub_212818390("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node's i-node link is out of bounds.\x1B[0m", *((_DWORD *)a1 + 8));
          sub_21281844C((uint64_t)a1, (uint64_t)v22, 0);
          v28 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
          sub_212818390("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v23, v28, v2);
          sub_212818390("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v23, v26);
          sub_212818390("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
          *((_DWORD *)v22 + 2) |= 1u;
          goto LABEL_35;
        }
        sub_212818390("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: #%d i-node is invalid.\x1B[0m", *((_DWORD *)a1 + 8));
        sub_21281844C((uint64_t)a1, (uint64_t)v22, 0);
        v31 = *((_DWORD *)a1 + 8) - 1;
        *((_DWORD *)a1 + 8) = v31;
        if (v31)
        {
          sub_212818390("\x1B[33mremoving previous i-node's i-node link.\x1B[0m");
          v32 = (char *)malloc_type_realloc((void *)a1[10], v17 * *((unsigned int *)a1 + 8), 0x26B9AB4DuLL);
          a1[10] = v32;
          v33 = (*((_DWORD *)a1 + 8) - 1);
          v34 = &v32[(*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) * v33];
          *((_DWORD *)v34 + 2) |= 1u;
          v27 = v34 + 12;
          goto LABEL_35;
        }
        sub_212818390("\x1B[33mremoving h-node's i-node link.\x1B[0m");
        v35 = (void *)a1[10];
        if (v35)
        {
          free(v35);
          a1[10] = 0;
        }
      }
      else
      {
        sub_212818390("\x1B[33mCSparseFile::loadHeaderAndIndexNodes: h-node's i-node link is invalid.\x1B[0m");
        v29 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
        sub_212818390("\x1B[33mi-node offset %qd + node size %d should be <= logEOF %qd.\x1B[0m", v13, v29, v2);
        sub_212818390("\x1B[33mi-node offset %qd should be == expected offset %qd.\x1B[0m", v13, v16);
        sub_212818390("\x1B[33mremoving h-node's i-node link.\x1B[0m");
      }
      v30 = a1[9];
      *(_DWORD *)(v30 + 12) |= 1u;
      v27 = (_QWORD *)(v30 + 20);
LABEL_35:
      *v27 = 0;
      *((_BYTE *)a1 + 105) = 1;
      if (!*((_BYTE *)a1 + 104) || (*(unsigned int (**)(_QWORD *))(*a1 + 120))(a1))
        *((_BYTE *)a1 + 106) = 0;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)a1[3] + 472))(a1[3], 1);
    }
    return 0;
  }
  return result;
}

void sub_21280B594(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 72);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 72) = 0;
  }
  v3 = *(void **)(a1 + 80);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 80) = 0;
  }
  *(_DWORD *)(a1 + 32) = 0;
}

uint64_t sub_21280B5D4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t sub_21280B5DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;

  v2 = *(_QWORD *)(a1 + 112);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v5 = *(void **)(a1 + 8);
  if (v5)
  {
    free(v5);
    *(_QWORD *)(a1 + 8) = 0;
  }
  *(_DWORD *)(a1 + 16) = 0;
  v6 = *(_QWORD *)(a1 + 40);
  *(_DWORD *)(a1 + 16) = v6 / (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v9 = *(_DWORD *)(a1 + 16);
  if (v7 % v8)
    *(_DWORD *)(a1 + 16) = ++v9;
  v10 = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  *(_QWORD *)(a1 + 8) = v10;
  if (!v10)
    return 12;
  v11 = v3 << 9;
  v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1))
  {
    v13 = 16;
    while (1)
    {
      v14 = *(_QWORD *)(a1 + 72);
      v15 = *(_DWORD *)(v14 + 4 * v13);
      if (v15 != -1)
      {
        if (!v15 && *(_QWORD *)(v14 + 20))
        {
          sub_212818390("\x1B[33mCSparseFile::generateSparseTable: h-node has no more bands but i-node link is non-zero.\x1B[0m");
          sub_212818390("\x1B[33mzeroing i-node link.\x1B[0m");
          v35 = *(_QWORD *)(a1 + 72);
          v34 = *(void **)(a1 + 80);
          *(_QWORD *)(v35 + 20) = 0;
          *(_DWORD *)(v35 + 12) |= 1u;
          *(_DWORD *)(a1 + 32) = 0;
          if (v34)
          {
            free(v34);
            *(_QWORD *)(a1 + 80) = 0;
          }
          goto LABEL_57;
        }
        v16 = *(_DWORD *)(a1 + 16);
        if (v15 <= v16)
        {
          if (!v15)
            goto LABEL_57;
          v18 = v4 + v11;
          if (v4 + v11 > v2)
            goto LABEL_52;
          v19 = *(_QWORD *)(a1 + 8);
          if (v19 && *(_QWORD *)(v19 + 8 * (v15 - 1)))
          {
            sub_212818390("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m", v13 - 16, v15);
            sub_212818390("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
            v20 = *(_QWORD *)(a1 + 72);
            *(_DWORD *)(v20 + 4 * v13) = -1;
            *(_DWORD *)(v20 + 12) |= 1u;
          }
          else
          {
            v21 = *(_QWORD *)(a1 + 8);
            if (!v21 || *(_DWORD *)(a1 + 16) < v15)
              return 999;
            *(_QWORD *)(v21 + 8 * (v15 - 1)) = v12;
          }
          goto LABEL_23;
        }
        sub_212818390("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m", v13 - 16, v15, v16);
        sub_212818390("\x1B[33msparing %u-th slot.\x1B[0m", v13 - 16);
        v17 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)(v17 + 4 * v13) = -1;
        *(_DWORD *)(v17 + 12) |= 1u;
      }
      v18 = v4 + v11;
      if (v4 + v11 > v2)
      {
        v15 = -1;
LABEL_52:
        sub_212818390("\x1B[33mCSparseFile::generateSparseTable: h-node %u-th slot (band %u) ending offset %qd is too large (should be <= %qd).\x1B[0m", v13 - 16, v15, v18, v2);
        sub_212818390("\x1B[33mmarking %u-th slot unused.\x1B[0m", v13 - 16);
        v33 = *(_QWORD *)(a1 + 72);
        *(_DWORD *)(v33 + 4 * v13) = 0;
        *(_DWORD *)(v33 + 12) |= 1u;
        goto LABEL_57;
      }
LABEL_23:
      v12 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) << 9;
      v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
      v23 = v13 - 15;
      ++v13;
      v4 = v18;
      if (v23 >= v22)
        goto LABEL_26;
    }
  }
  v18 = v4;
LABEL_26:
  if (!*(_DWORD *)(a1 + 32))
    goto LABEL_56;
  v24 = 0;
  v4 = v18;
  while (1)
  {
    v25 = *(_QWORD *)(a1 + 80);
    v26 = v25 ? v25 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v24 : 0;
    v12 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    v4 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    v40 = v24;
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
      break;
LABEL_49:
    ++v24;
    if (v40 + 1 >= (unint64_t)*(unsigned int *)(a1 + 32))
      goto LABEL_57;
  }
  v27 = 0;
  v28 = v26 + 56;
  while (1)
  {
    v18 = v4;
    v29 = *(_DWORD *)(v28 + 4 * v27);
    if (v29 == -1)
      goto LABEL_39;
    if (!v29)
      break;
    v30 = *(_DWORD *)(a1 + 16);
    if (v29 > v30)
    {
      sub_212818390("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is out of bounds (should be <= %u).\x1B[0m", v24, v27, *(_DWORD *)(v28 + 4 * v27), v30);
      sub_212818390("\x1B[33msparing %u-th slot.\x1B[0m", v27);
      v29 = -1;
      *(_DWORD *)(v28 + 4 * v27) = -1;
      *(_DWORD *)(v26 + 8) |= 1u;
    }
LABEL_39:
    v4 += v11;
    if (v18 + v11 > v2)
    {
      sub_212818390("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) ending offset %qd is too large (should be <= %qd).\x1B[0m", v24, v27, v29, v18 + v11, v2);
      sub_212818390("\x1B[33mmarking %u-th slot unused.\x1B[0m", v27);
      *(_DWORD *)(v26 + 4 * v27 + 56) = 0;
      *(_DWORD *)(v26 + 8) |= 1u;
      goto LABEL_56;
    }
    if (v29 != -1)
    {
      v31 = *(_QWORD *)(a1 + 8);
      if (v31 && *(_DWORD *)(a1 + 16) >= v29 && *(_QWORD *)(v31 + 8 * (v29 - 1)))
      {
        sub_212818390("\x1B[33mCSparseFile::generateSparseTable: #%u i-node %u-th slot (band %u) is a duplicate band reference.\x1B[0m", v24, v27, v29);
        sub_212818390("\x1B[33msparing %u-th slot.\x1B[0m", v27);
        *(_DWORD *)(v28 + 4 * v27) = -1;
        *(_DWORD *)(v26 + 8) |= 1u;
      }
      else
      {
        v32 = *(_QWORD *)(a1 + 8);
        if (!v32 || *(_DWORD *)(a1 + 16) < v29)
          return 999;
        *(_QWORD *)(v32 + 8 * (v29 - 1)) = v12;
      }
    }
    v12 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) << 9;
    if (++v27 >= (unint64_t)(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
      goto LABEL_49;
  }
  if (*(_QWORD *)(v26 + 12))
  {
    sub_212818390("\x1B[33mCSparseFile::generateSparseTable: #%u i-node has no more bands but i-node link is non-zero.\x1B[0m", v24);
    sub_212818390("\x1B[33mzeroing i-node link.\x1B[0m");
    *(_QWORD *)(v26 + 12) = 0;
    *(_DWORD *)(v26 + 8) |= 1u;
    *(_DWORD *)(a1 + 32) = v24 + 1;
    v36 = *(void **)(a1 + 80);
    v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    *(_QWORD *)(a1 + 80) = malloc_type_realloc(v36, v37 * *(unsigned int *)(a1 + 32), 0xF437BC1FuLL);
  }
LABEL_56:
  v4 = v18;
LABEL_57:
  if (v2 == v4)
    return 0;
  if (*(_BYTE *)(a1 + 104))
  {
    sub_212818390("\x1B[33mCSparseFile::generateSparseTable: expected EOF %qd, actual EOF %qd.\x1B[0m", v4, v2);
    v39 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 312))(*(_QWORD *)(a1 + 24), v4);
    if ((_DWORD)v39)
    {
      *(_BYTE *)(a1 + 106) = 0;
      DIStrError(v39);
      sub_212818390("\x1B[31m\x1B[1madjusting EOF failed (%d - %s).\x1B[0m");
    }
    else
    {
      *(_QWORD *)(a1 + 112) = v4;
      *(_QWORD *)(a1 + 120) = v4;
      sub_212818390("\x1B[33mEOF was adjusted.\x1B[0m");
    }
  }
  else
  {
    *(_BYTE *)(a1 + 106) = 0;
  }
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
  *(_BYTE *)(a1 + 105) = 1;
  if (!*(_BYTE *)(a1 + 104)
    || (result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1), (_DWORD)result))
  {
    result = 0;
    *(_BYTE *)(a1 + 106) = 0;
  }
  return result;
}

uint64_t sub_21280BBF0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 48);
}

uint64_t sub_21280BBF8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 52);
}

uint64_t sub_21280BC00(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 64))(*(_QWORD *)(a1 + 160));
}

uint64_t sub_21280BC10()
{
  return 1;
}

const __CFString *sub_21280BC18()
{
  return CFSTR("sparse disk image");
}

uint64_t sub_21280BC24(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 160);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
  return result;
}

uint64_t sub_21280BC3C(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t sub_21280BC44(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, char *a5)
{
  pthread_rwlock_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v22 = 0;
  v23 = 0;
  v21 = 0;
  v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_24:
    v14 = 0;
    v19 = 22;
    goto LABEL_20;
  }
  v11 = *(_QWORD *)(a1 + 160);
  if (v11)
  {
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 48))(v11);
    if (v12 < a2 || a3 + a2 > v12)
      goto LABEL_24;
    if (a3)
    {
      v14 = 0;
      v15 = a3 << 9;
      while (1)
      {
        v16 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, char *))(**(_QWORD **)(a1 + 160) + 24))(*(_QWORD *)(a1 + 160), a2, a3, &v23, &v21);
        if ((_DWORD)v16)
        {
LABEL_18:
          v19 = v16;
          goto LABEL_20;
        }
        v17 = v23;
        v18 = v23 << 9;
        if (v23 << 9 > v15)
          break;
        if (v21)
        {
          v16 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, char *))(**(_QWORD **)(a1 + 160) + 32))(*(_QWORD *)(a1 + 160), a2, v23, &v22, a5);
          if ((_DWORD)v16)
            goto LABEL_18;
          v17 = v22;
          v18 = v22 << 9;
        }
        else
        {
          bzero(a5, v23 << 9);
          v22 = v17;
        }
        a5 += v18;
        a2 += v17;
        v14 += v17;
        a3 -= v17;
        if (!a3)
        {
          v19 = 0;
          goto LABEL_20;
        }
      }
      v19 = 29;
    }
    else
    {
      v19 = 0;
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v19 = 999;
  }
LABEL_20:
  if (a4)
    *a4 = v14;
  pthread_rwlock_unlock(v10);
  return v19;
}

uint64_t sub_21280BDBC(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _BYTE *a5)
{
  unsigned int v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 136))(a1);
  v11 = *(_QWORD *)(a1 + 8);
  if (v10)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12 || *(_DWORD *)(a1 + 16) < v10 || (v13 = *(_QWORD *)(v11 + 8 * (v10 - 1))) == 0)
  {
    *a5 = 0;
    v15 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 144))(a1, v10 + 1) - a2;
  }
  else
  {
    *a5 = 1;
    v14 = v10 + 1;
    do
    {
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 144))(a1, v14) - a2;
      if (v15 >= a3)
        break;
      if (!(_DWORD)v14)
        break;
      v16 = *(_QWORD *)(a1 + 8);
      if (!v16)
        break;
      if (*(_DWORD *)(a1 + 16) < v14)
        break;
      v17 = *(_QWORD *)(v16 + 8 * (v14 - 1));
      if (!v17)
        break;
      v18 = v13 + ((unint64_t)*(unsigned int *)(a1 + 48) << 9);
      v14 = (v14 + 1);
      v13 = v17;
    }
    while (v17 == v18);
  }
  if (v15 >= a3)
    v15 = a3;
  *a4 = v15;
  return 0;
}

uint64_t sub_21280BEC4(uint64_t a1, uint64_t a2)
{
  return (a2 / (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1)) + 1;
}

uint64_t sub_21280BEF4(uint64_t a1, int a2)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) * (a2 - 1);
}

uint64_t sub_21280BF20(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  if (!a4)
    return 22;
  *a4 = 0;
  if (!a5)
    return 22;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 136))(a1);
  v11 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 144))(a1, (v10 + 1)) - a2;
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 144))(a1, v10);
  if (v11 < a3)
    a3 = v11;
  v13 = *(_QWORD *)(a1 + 8);
  if (!(_DWORD)v10 || v13 == 0)
    return 22;
  if (*(_DWORD *)(a1 + 16) < v10)
    return 22;
  v17 = 0;
  v15 = *(_QWORD *)(v13 + 8 * (v10 - 1));
  if (!v15)
    return 22;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t))(**(_QWORD **)(a1 + 24) + 328))(*(_QWORD *)(a1 + 24), v15 + ((a2 - v12) << 9), a3 << 9, &v17, a5);
  if (!(_DWORD)result)
    *a4 = a3;
  return result;
}

void sub_21280C024(uint64_t a1)
{
  sub_21280C07C(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280C058(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40B7E68147);
  _Unwind_Resume(a1);
}

_QWORD *sub_21280C07C(uint64_t a1)
{
  uint64_t v2;

  *(_QWORD *)a1 = &off_24CE2A3D0;
  v2 = *(_QWORD *)(a1 + 160);
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *(_QWORD *)(a1 + 160) = 0;
  pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 168));
  return sub_2127FE034((_QWORD *)a1);
}

void sub_21280C0C8(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127FE034(v1);
  _Unwind_Resume(a1);
}

void sub_21280C0E0(uint64_t a1)
{
  sub_21280C138(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280C114(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C40B0449CAELL);
  _Unwind_Resume(a1);
}

uint64_t sub_21280C138(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char *v6;

  *(_QWORD *)a1 = &off_24CE2A638;
  sub_21280C1F4(a1);
  v2 = *(_QWORD *)(a1 + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 112);
    if (v3 && v3 != *(_QWORD *)(a1 + 120) && !(*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 312))(v2))
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a1 + 112);
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
  }
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 128))(a1);
  v4 = *(void **)(a1 + 8);
  if (v4)
  {
    free(v4);
    *(_QWORD *)(a1 + 8) = 0;
  }
  *(_DWORD *)(a1 + 16) = 0;
  v5 = *(void **)(a1 + 96);
  if (v5)
  {
    free(v5);
    *(_QWORD *)(a1 + 96) = 0;
  }
  v6 = *(char **)(a1 + 24);
  if (v6)
  {
    DIDiskImageObjectRelease(v6);
    *(_QWORD *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t sub_21280C1F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;

  v2 = sub_21280C288((_QWORD *)a1);
  if ((_DWORD)v2)
  {
    v3 = v2;
    v4 = (const char *)DIStrError(v2);
    sub_212818390("\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating header node failed (%d - %s).\x1B[0m", v3, v4);
  }
  else
  {
    v5 = sub_21280C300(a1);
    v3 = v5;
    if ((_DWORD)v5)
    {
      if (*(_DWORD *)(a1 + 32) <= 1u)
        v6 = "node";
      else
        v6 = "nodes";
      v7 = (const char *)DIStrError(v5);
      sub_212818390("\x1B[31m\x1B[1mCSparseFile::writeHeaderAndIndexNodes: updating index %s failed (%d - %s).\x1B[0m", v6, v3, v7);
    }
  }
  return v3;
}

uint64_t sub_21280C288(_QWORD *a1)
{
  _BYTE *v1;
  uint64_t v3;
  size_t v4;
  uint64_t result;

  v1 = (_BYTE *)a1[9];
  if (!v1)
    return 22;
  if ((v1[12] & 1) == 0)
    return 0;
  v3 = a1[3];
  v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1);
  result = sub_21280D4FC(v3, v1, v4);
  if (!(_DWORD)result)
    *(_DWORD *)(a1[9] + 12) &= ~1u;
  return result;
}

uint64_t sub_21280C300(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t result;

  if (!*(_QWORD *)(a1 + 80))
    return 0;
  if (!*(_DWORD *)(a1 + 32))
    return 0;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  if (!*(_DWORD *)(a1 + 32))
    return 0;
  v2 = 0;
  v3 = (uint64_t *)(*(_QWORD *)(a1 + 72) + 20);
  while (1)
  {
    v4 = *v3;
    if (!*v3)
      break;
    v5 = *(_QWORD *)(a1 + 80);
    if (!v5)
      break;
    v6 = (_DWORD *)(v5 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v2);
    if ((v6[2] & 1) != 0)
    {
      result = sub_2128185A8((_QWORD **)a1, v4, v6);
      if ((_DWORD)result)
        return result;
      v6[2] &= ~1u;
    }
    v3 = (uint64_t *)(v6 + 3);
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 32))
      return 0;
  }
  return 22;
}

_QWORD *sub_21280C3C4(uint64_t a1, char *a2)
{
  _QWORD *result;

  result = (_QWORD *)sub_212802D54(a1, a2);
  *result = &off_24CE2C058;
  return result;
}

__CFArray *sub_21280C3E4(uint64_t a1, _DWORD *a2, uint64_t a3, __CFDictionary **a4)
{
  const __CFAllocator *v7;
  __CFArray *Mutable;
  uint64_t v9;
  const void *v10;
  __CFDictionary *v11;
  __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFString *v14;
  const void *v15;
  int v16;
  int v17;
  CFTypeRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  CFNumberRef v25;
  _DWORD *v27;
  __int16 valuePtr;

  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v9 = sub_2128033A4(a1);
  v10 = (const void *)*MEMORY[0x24BDBD268];
  if (a4)
    *a4 = 0;
  v11 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 96))(v9);
  v12 = sub_2128036D4();
  v13 = v12;
  v27 = a2;
  if (!v12)
    goto LABEL_24;
  if (!CFDictionaryGetValue(v12, CFSTR("APFS")))
  {
    if (CFDictionaryGetValue(v13, CFSTR("HFS+")))
    {
      v10 = (const void *)*MEMORY[0x24BDBD270];
      v14 = CFSTR("Apple_HFS");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("HFSX")))
    {
      v10 = (const void *)*MEMORY[0x24BDBD270];
      v14 = CFSTR("Apple_HFSX");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("UDF")))
    {
      v15 = (const void *)*MEMORY[0x24BDBD270];
      v14 = CFSTR("UDF");
      goto LABEL_26;
    }
    if (CFDictionaryGetValue(v13, CFSTR("UFS")))
    {
      v10 = (const void *)*MEMORY[0x24BDBD270];
      v14 = CFSTR("Apple_UFS");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("ProDOS")))
    {
      v14 = CFSTR("Apple_ProDOS");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("NTFS")))
    {
      v14 = CFSTR("Windows_NTFS");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("FAT12")))
    {
      v14 = CFSTR("DOS_FAT_12");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("FAT16")))
    {
      v14 = CFSTR("DOS_FAT_16");
      goto LABEL_25;
    }
    if (CFDictionaryGetValue(v13, CFSTR("FAT32")))
    {
      v14 = CFSTR("DOS_FAT_32");
      goto LABEL_25;
    }
LABEL_24:
    v16 = DIGetBundleRef();
    v14 = (const __CFString *)sub_21281FFEC(v16, (int)CFSTR("unknown partition"), CFSTR("unknown partition"));
    goto LABEL_25;
  }
  v14 = CFSTR("Apple_APFS");
LABEL_25:
  v15 = v10;
LABEL_26:
  v17 = DIGetBundleRef();
  v18 = sub_21281FFEC(v17, (int)CFSTR("whole disk"), CFSTR("whole disk"));
  v19 = sub_2128033A4(a1);
  v20 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v19 + 96))(v19);
  v23 = sub_21280368C(0, v20, 0, v14, v18, 0, v21, v22);
  if (v23)
  {
    v24 = v23;
    if (v13)
    {
      CFDictionarySetValue(v23, CFSTR("partition-filesystems"), v13);
      CFRelease(v13);
    }
    CFArrayAppendValue(Mutable, v24);
    CFRelease(v24);
    valuePtr = 512;
    v25 = CFNumberCreate(v7, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(v11, CFSTR("block-size"), v25);
    CFRelease(v25);
    CFDictionarySetValue(v11, CFSTR("burnable"), v15);
    CFDictionarySetValue(v11, CFSTR("appendable"), v10);
    if (a4)
      *a4 = v11;
    else
      CFRelease(v11);
    ++*v27;
    if (v18)
      CFRelease(v18);
    if (v14)
      CFRelease(v14);
  }
  else
  {
    if (v18)
      CFRelease(v18);
    if (v14)
      CFRelease(v14);
    if (Mutable)
      CFRelease(Mutable);
    if (v11)
      CFRelease(v11);
    return 0;
  }
  return Mutable;
}

const __CFString *sub_21280C7B0()
{
  return CFSTR("none");
}

void sub_21280C7BC(_QWORD *a1)
{
  sub_212804B94(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280C7F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C401CCC6CC1);
  _Unwind_Resume(a1);
}

uint64_t sub_21280C814(const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, char **a5, CFTypeRef *a6)
{
  uint64_t v12;
  const __CFString *v14;
  const __CFString *v15;
  CFTypeID v16;
  int v17;
  const __CFString *v18;
  CFURLRef v19;
  const __CFAllocator *v20;
  __CFDictionary *MutableCopy;
  CFNumberRef v22;
  uint64_t v23;
  __CFDictionary *v24;
  char *v25;
  uint64_t v26;
  uint64_t valuePtr;
  void *value;

  value = 0;
  v25 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v12 = 22;
  if (!a1 || !theDict || !a5)
    return v12;
  if (CFDictionaryGetValue(theDict, CFSTR("hybrid-image-source-array")))
    return sub_21281FFDC();
  v26 = 0;
  valuePtr = 0;
  if (!CFDictionaryGetValueIfPresent(theDict, CFSTR("blockcount"), (const void **)&value))
  {
    MutableCopy = 0;
    v22 = 0;
    v19 = 0;
    goto LABEL_25;
  }
  CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &valuePtr);
  value = 0;
  v14 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("create-image-type"));
  if (v14
    && (v15 = v14, v16 = CFGetTypeID(v14), v16 == CFStringGetTypeID())
    && CFStringCompare(v15, CFSTR("UDTO"), 0) == kCFCompareEqualTo)
  {
    v17 = 0;
    v18 = CFSTR("cdr");
  }
  else
  {
    v17 = 1;
    v18 = CFSTR("dmg");
  }
  v19 = sub_2127FE518(a1, v18, 0);
  if (!v19)
  {
    MutableCopy = 0;
    goto LABEL_23;
  }
  v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theDict);
  if (!MutableCopy)
  {
LABEL_23:
    v22 = 0;
LABEL_24:
    v12 = 999;
    goto LABEL_25;
  }
  v26 = valuePtr << 9;
  v22 = CFNumberCreate(v20, kCFNumberSInt64Type, &v26);
  CFDictionaryRemoveValue(MutableCopy, CFSTR("diskimage-class"));
  CFDictionarySetValue(MutableCopy, CFSTR("writeable"), (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(MutableCopy, CFSTR("size"), v22);
  if (v17)
  {
    CFDictionaryAddValue(MutableCopy, CFSTR("file-type"), CFSTR("devr"));
    CFDictionaryAddValue(MutableCopy, CFSTR("file-creator"), CFSTR("ddsk"));
  }
  v23 = sub_2127FE66C((uint64_t)v19, (uint64_t)MutableCopy, 7u, a3, a4, &v25, a6);
  if ((_DWORD)v23)
  {
    v12 = v23;
    goto LABEL_25;
  }
  CFRelease(MutableCopy);
  v24 = CFDictionaryCreateMutableCopy(v20, 0, theDict);
  MutableCopy = v24;
  if (!v24)
    goto LABEL_24;
  CFDictionarySetValue(v24, CFSTR("diskimage-class"), CFSTR("CRawDiskImage"));
  v12 = sub_212807018((uint64_t)v25, (uint64_t)MutableCopy, a5, a6);
  if (!(_DWORD)v12)
  {
LABEL_27:
    if (v25)
    {
      DIDiskImageObjectRelease(v25);
      v25 = 0;
    }
    goto LABEL_29;
  }
LABEL_25:
  if (v25)
  {
    (*(void (**)(char *))(*(_QWORD *)v25 + 416))(v25);
    goto LABEL_27;
  }
LABEL_29:
  if (MutableCopy)
    CFRelease(MutableCopy);
  if (v22)
    CFRelease(v22);
  if (v19)
    CFRelease(v19);
  return v12;
}

uint64_t sub_21280CB28(int a1, uint64_t a2)
{
  _QWORD v3[4];

  v3[0] = 0x300000000;
  v3[1] = 0;
  v3[2] = a2;
  v3[3] = 0;
  if (fcntl(a1, 42, v3) < 0)
    return *__error();
  else
    return 0;
}

BOOL sub_21280CB74(uint64_t a1, _QWORD *a2)
{
  int MKMediaRef;
  CFTypeRef cf;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  if (a2)
    *a2 = 0;
  MKMediaRef = DIMediaKitCreateMKMediaRef(a1, 0, 0, (uint64_t *)&cf);
  if (!MKMediaRef)
  {
    MKDetectISO();
    MKMediaRef = -5343;
  }
  if (cf)
    CFRelease(cf);
  return MKMediaRef == 0;
}

uint64_t sub_21280CC5C(_QWORD *a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  BOOL v14;
  unint64_t v15;

  v10 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
  if (a4)
    *a4 = 0;
  if (!v10)
    return 999;
  v11 = a1[20];
  if (v11 < a2 || a3 + a2 > v11)
    return 22;
  v15 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))(*(_QWORD *)v10 + 336))(v10, a2 << 9, a3 << 9, &v15, a5);
  if ((_DWORD)result)
    v14 = 1;
  else
    v14 = a4 == 0;
  if (!v14)
  {
    result = 0;
    *a4 = v15 >> 9;
  }
  return result;
}

uint64_t sub_21280CD18(uint64_t a1, off_t a2)
{
  if (ftruncate(*(_DWORD *)(a1 + 320), a2) < 0)
    return *__error();
  else
    return 0;
}

uint64_t sub_21280CD44(uint64_t a1, uint64_t a2, int64_t size, uint64_t a4, char *a5)
{
  char *v10;
  char *v11;
  uint8x8_t v12;
  char v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  unsigned int v19;
  unsigned int v20;
  int64_t v21;
  int v22;
  uint64_t v23;
  int v25;
  int v26;
  int v28;
  uint64_t v29;
  const UniChar *v30;
  uint64_t v31;
  int v32;
  const __CFString *v33;
  const __CFString *v34;
  char *v35;
  int v36;
  int v37;
  int v39;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v10 = (char *)malloc_type_malloc(size, 0xCC202748uLL);
  if (!v10)
    return 0;
  v11 = v10;
  if (sub_2128044AC(a1, a2, (a4 * size) >> 9, (unint64_t)size >> 9, v10))
    goto LABEL_8;
  if (*(_WORD *)v11 != 2)
    goto LABEL_8;
  v13 = 0;
  v12.i32[0] = *(_DWORD *)v11;
  v14 = vaddvq_s32((int32x4_t)vmovl_u16((uint16x4_t)*(_OWORD *)&vmovl_u8(v12)));
  v15 = 5;
  do
    v13 += v11[v15++];
  while ((_DWORD)v15 != 16);
  if (v11[4] != (v13 + v14))
    goto LABEL_8;
  v16 = *((unsigned int *)v11 + 4);
  if (v16 < size)
    goto LABEL_8;
  v19 = *((_DWORD *)v11 + 5);
  v20 = v16 - size;
  while (1)
  {
    if (sub_2128044AC(a1, a2, ((unint64_t)v19 * size) >> 9, (unint64_t)size >> 9, v11))
      goto LABEL_8;
    if (*(_WORD *)v11 == 1)
      break;
    v17 = 0;
    ++v19;
    v21 = v20;
    v20 -= size;
    if (v21 < size)
      goto LABEL_9;
  }
  if (v11[55])
  {
    v22 = v11[55] - 1;
  }
  else
  {
    v23 = 0;
    while (v23 != -29)
    {
      if (v11[v23-- + 54])
      {
        v25 = (_DWORD)v11 + v23 + 55;
        goto LABEL_24;
      }
    }
    v25 = (_DWORD)v11 + 25;
LABEL_24:
    v22 = v25 - ((_DWORD)v11 + 25) + 1;
  }
  if ((v22 - 33) >= 0xFFFFFFE0)
  {
    v26 = v11[24];
    if (v26 != 16 && v26 != 8)
    {
      *(_QWORD *)a5 = 0x6E776F6E6B6E55;
      v32 = 7;
      goto LABEL_40;
    }
    MEMORY[0x24BDAC7A8]();
    v30 = (const UniChar *)((char *)v41 - v29);
    if (v11[24] == 8)
    {
      v31 = 0;
      do
      {
        v30[v31] = v11[v31 + 25];
        ++v31;
      }
      while (v28 != v31);
    }
    else
    {
      v30 = (const UniChar *)(v11 + 25);
      v28 = v28 >> 1;
    }
    v33 = CFStringCreateWithCharacters(0, v30, v28);
    if (!v33)
    {
      *(_QWORD *)a5 = 0x6E776F6E6B6E55;
      v32 = 7;
      goto LABEL_40;
    }
    v34 = v33;
    CFStringGetCString(v33, a5, 136, 0x8000100u);
    CFRelease(v34);
    v32 = strlen(a5);
    if (v32 >= 1)
    {
LABEL_40:
      v35 = a5;
      do
      {
        --v32;
        v37 = *v35++;
        v36 = v37;
        if (v37 == 47 || v36 == 0)
        {
          if (!v32)
          {
LABEL_56:
            *a5++ = 95;
            break;
          }
          while (1)
          {
            v39 = *v35;
            if (v39 != 47 && v39 != 0)
              break;
            ++v35;
            if (!--v32)
              goto LABEL_56;
          }
          LOBYTE(v36) = 95;
        }
        *a5++ = v36;
      }
      while (v32 > 0);
    }
    *a5 = 0;
    v17 = 1;
  }
  else
  {
LABEL_8:
    v17 = 0;
  }
LABEL_9:
  free(v11);
  return v17;
}

uint64_t sub_21280D070(const __CFURL *a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, char **a5, CFTypeRef *a6)
{
  uint64_t v12;
  const __CFURL *PathComponent;
  const __CFURL *v14;
  CFURLRef v15;
  CFURLRef v16;
  char *v17;
  char *v19;
  void *value;
  int64_t v21;
  uint64_t v22;
  statfs v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = 0;
  v19 = 0;
  value = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  v12 = 22;
  if (a1 && theDict && a5)
  {
    if (!CFDictionaryGetValueIfPresent(theDict, CFSTR("blockcount"), (const void **)&value))
      goto LABEL_11;
    if (!sub_212806A98((const __CFString *)value, kCFNumberSInt64Type, &v22))
      return v12;
    if (!v22)
    {
LABEL_11:
      PathComponent = CFURLCreateCopyDeletingLastPathComponent((CFAllocatorRef)*MEMORY[0x24BDBD240], a1);
      if (!PathComponent)
        return v12;
      v14 = PathComponent;
      v12 = sub_212810150(PathComponent, &v23);
      CFRelease(v14);
      if ((_DWORD)v12)
        return v12;
      v22 = v23.f_blocks * (((unint64_t)v23.f_bsize >> 8) & 0xFFFFFE);
    }
    value = 0;
    if (CFDictionaryGetValueIfPresent(theDict, CFSTR("sparse-band-size"), (const void **)&value)
      && !sub_212806A98((const __CFString *)value, kCFNumberSInt64Type, &v21))
    {
      return 22;
    }
    else
    {
      value = 0;
      v15 = sub_2127FE518(a1, CFSTR("sparseimage"), 0);
      if (v15)
      {
        v16 = v15;
        v12 = sub_21280D26C((uint64_t)v15, theDict, a3, a4, v22, v21, (uint64_t *)&v19, a6);
        v17 = v19;
        if (!(_DWORD)v12)
        {
          v12 = sub_21280ACDC((uint64_t)v19, (uint64_t)theDict, a5, a6);
          v17 = v19;
        }
        if ((_DWORD)v12 && v17)
        {
          (*(void (**)(char *))(*(_QWORD *)v17 + 416))(v17);
          v17 = v19;
        }
        if (v17)
        {
          DIDiskImageObjectRelease(v17);
          v19 = 0;
        }
        CFRelease(v16);
      }
      else
      {
        return 999;
      }
    }
  }
  return v12;
}

uint64_t sub_21280D26C(uint64_t a1, CFDictionaryRef theDict, uint64_t a3, uint64_t a4, uint64_t a5, int64_t a6, uint64_t *a7, CFTypeRef *a8)
{
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v23;
  uint64_t v24;
  int v25;
  size_t v26;
  char *v27;
  void *v28;
  int v29;
  int v31[2];

  *(_QWORD *)v31 = 0;
  if (a6)
    v14 = a6;
  else
    v14 = 2048;
  v15 = a5 / v14;
  if (a5 % v14)
    ++v15;
  if (v15 >= 134217729)
  {
    if (a6)
    {
      v16 = 0;
      v17 = 115;
      goto LABEL_44;
    }
    v18 = sqrt((double)a5) * 0.125;
    v14 = (uint64_t)v18;
    if ((uint64_t)v18)
      v19 = ((uint64_t)v18 & 0x7FF) == 0;
    else
      v19 = 0;
    if (!v19)
    {
      v20 = v14 + 2047;
      if (v14 >= 0)
        v20 = (uint64_t)v18;
      v14 = (v20 & 0xFFFFFFFFFFFFF800) + 2048;
    }
  }
  v21 = a5 / v14;
  if (a5 % v14)
    ++v21;
  v17 = 115;
  if (v21 > 0x8000000 || (a6 ? (v17 = 22) : (v17 = 115), v14 > 0x200000))
  {
LABEL_43:
    v16 = 0;
    goto LABEL_44;
  }
  if (theDict)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v23 = MutableCopy;
  if (!MutableCopy)
  {
    v16 = 0;
    v17 = 0;
    goto LABEL_44;
  }
  v17 = sub_2127FE66C(a1, (uint64_t)MutableCopy, 1u, a3, a4, v31, a8);
  if ((_DWORD)v17)
    goto LABEL_28;
  v24 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)v31 + 168))(*(_QWORD *)v31, 1);
  if ((_DWORD)v24
    || (v24 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)v31 + 272))(*(_QWORD *)v31), (_DWORD)v24))
  {
    v17 = v24;
LABEL_28:
    CFRelease(v23);
    v16 = *(_QWORD *)v31;
LABEL_41:
    if (!v16)
      goto LABEL_44;
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
    goto LABEL_43;
  }
  v25 = sub_2127F2A48(v23, CFSTR("di-sparse-puma-compatible"), 0);
  if (v25)
    v26 = 512;
  else
    v26 = 4096;
  v27 = (char *)malloc_type_calloc(1uLL, v26, 0xF120F10FuLL);
  if (!v27)
  {
    v17 = 12;
    goto LABEL_28;
  }
  v28 = v27;
  if (v25)
    v29 = 1;
  else
    v29 = 3;
  *(_DWORD *)v27 = 1936749171;
  *((_DWORD *)v27 + 1) = v29;
  *((_DWORD *)v27 + 2) = v14;
  *(_QWORD *)(v27 + 28) = a5;
  *((_DWORD *)v27 + 4) = a5;
  v17 = sub_21280D4FC(*(uint64_t *)v31, v27, v26);
  if (!(_DWORD)v17)
    (*(void (**)(_QWORD, _QWORD))(**(_QWORD **)v31 + 280))(*(_QWORD *)v31, 0);
  CFRelease(v23);
  free(v28);
  v16 = *(_QWORD *)v31;
  if ((_DWORD)v17)
    goto LABEL_41;
LABEL_44:
  *a7 = v16;
  return v17;
}

uint64_t sub_21280D4FC(uint64_t a1, const void *a2, size_t size)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;

  v6 = malloc_type_malloc(size, 0x90A104EAuLL);
  if (!v6)
    return 12;
  v7 = v6;
  v10 = 0;
  memmove(v6, a2, size);
  sub_2127F641C((uint64_t)v7, (size + 0x3FFFFFFC0) >> 2);
  v8 = (*(uint64_t (**)(uint64_t, _QWORD, size_t, uint64_t *, void *))(*(_QWORD *)a1 + 336))(a1, 0, size, &v10, v7);
  free(v7);
  return v8;
}

uint64_t sub_21280D5B0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  pthread_rwlock_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;

  v19 = 0;
  v20 = 0;
  v18 = 0;
  v10 = (pthread_rwlock_t *)(a1 + 168);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 168));
  if (!a5)
  {
LABEL_21:
    v14 = 0;
    v16 = 22;
    goto LABEL_18;
  }
  v11 = *(_QWORD *)(a1 + 160);
  if (v11)
  {
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 48))(v11);
    if (v12 < a2 || a3 + a2 > v12)
      goto LABEL_21;
    if (a3)
    {
      v14 = 0;
      while (1)
      {
        v15 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, char *))(**(_QWORD **)(a1 + 160) + 24))(*(_QWORD *)(a1 + 160), a2, a3, &v20, &v18);
        if ((_DWORD)v15)
          break;
        if (!v18)
        {
          v15 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 160) + 16))(*(_QWORD *)(a1 + 160), a2);
          if ((_DWORD)v15)
            break;
        }
        v15 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t))(**(_QWORD **)(a1 + 160) + 40))(*(_QWORD *)(a1 + 160), a2, v20, &v19, a5);
        if ((_DWORD)v15)
          break;
        a5 += v19 << 9;
        a2 += v19;
        v14 += v19;
        a3 -= v19;
        if (!a3)
        {
          v16 = 0;
          goto LABEL_18;
        }
      }
      v16 = v15;
    }
    else
    {
      v16 = 0;
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v16 = 999;
  }
LABEL_18:
  if (a4)
    *a4 = v14;
  pthread_rwlock_unlock(v10);
  return v16;
}

uint64_t sub_21280D704(uint64_t a1)
{
  uint64_t v2;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 136))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 152))(a1, v2);
}

uint64_t sub_21280D73C(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1))
  {
LABEL_5:
    v8 = 0;
    v9 = 1;
    while (1)
    {
      v10 = *(_DWORD *)(a1 + 32);
      if (v9 > v10)
        break;
      v11 = v9 - 1;
      v12 = *(_QWORD *)(a1 + 80);
      if (v12)
        v13 = v10 > v11;
      else
        v13 = 0;
      if (v13)
        v14 = v12 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v11;
      else
        v14 = 0;
      v7 = v14 + 56;
      v15 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
      {
        v16 = 0;
        while ((*(_DWORD *)v7 + 1) > 1)
        {
          ++v16;
          v7 += 4;
          if (v16 >= (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
            goto LABEL_17;
        }
        v18 = *(_QWORD *)(a1 + 80);
        v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
        v17 = 0;
        *(_DWORD *)(v18 + v19 * v11 + 8) |= 1u;
        if (*(_DWORD *)v7 == -1)
          v8 = 1;
      }
      else
      {
LABEL_17:
        v17 = 1;
      }
      v5 += v15 + ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) << 9);
      ++v9;
      if ((v17 & 1) == 0)
      {
        if (v8)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    result = sub_21281866C(a1);
    if ((_DWORD)result)
      return result;
    v21 = *(_DWORD *)(a1 + 32);
    v22 = *(_QWORD *)(a1 + 80);
    if (v21)
    {
      v23 = v22 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v21 - 1);
      v22 = *(_QWORD *)(a1 + 80);
      v7 = v23 + 56;
      v21 = *(_DWORD *)(a1 + 32);
    }
    else
    {
      v7 = 56;
    }
    v24 = (v21 - 1);
    v25 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    *(_DWORD *)(v22 + v25 * v24 + 8) |= 1u;
    goto LABEL_30;
  }
  v6 = 0;
  v7 = v4 + 64;
  while ((*(_DWORD *)v7 + 1) >= 2)
  {
    v5 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1) << 9;
    ++v6;
    v7 += 4;
    if (v6 >= (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1))
      goto LABEL_5;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 72) + 12) |= 1u;
  if (*(_DWORD *)v7 != -1)
  {
LABEL_30:
    v5 = *(_QWORD *)(a1 + 112);
    v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
    result = sub_21280D9F8(a1, v5 + (v26 << 9));
    if ((_DWORD)result)
      return result;
  }
LABEL_31:
  result = 999;
  if (a2)
  {
    v27 = *(_QWORD *)(a1 + 8);
    if (v27)
    {
      if (*(_DWORD *)(a1 + 16) >= a2)
      {
        *(_QWORD *)(v27 + 8 * (a2 - 1)) = v5;
        *(_DWORD *)v7 = a2;
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
      }
    }
  }
  return result;
}

uint64_t sub_21280D9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 112);
  if (v2 == a2)
    return 0;
  if (v2 > a2 || *(_QWORD *)(a1 + 120) >= a2)
    goto LABEL_10;
  v6 = *(_DWORD *)(a1 + 48);
  v7 = 10 * v6;
  if (10 * v6 >= 0x32000)
    v7 = 204800;
  v8 = a2 + ((v6 * (unint64_t)(v7 / v6)) << 9);
  if (!(*(unsigned int (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1 + 24) + 320))(*(_QWORD *)(a1 + 24), v8, 0)|| (result = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(**(_QWORD **)(a1 + 24) + 320))(*(_QWORD *)(a1 + 24), a2, 0), v8 = a2, !(_DWORD)result))
  {
    *(_QWORD *)(a1 + 120) = v8;
LABEL_10:
    result = 0;
    *(_QWORD *)(a1 + 112) = a2;
  }
  return result;
}

uint64_t sub_21280DAB4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  if (!a4)
    return 22;
  *a4 = 0;
  if (!a5)
    return 22;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 136))(a1);
  v11 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 144))(a1, (v10 + 1)) - a2;
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 144))(a1, v10);
  if (v11 < a3)
    a3 = v11;
  v13 = *(_QWORD *)(a1 + 8);
  if (!(_DWORD)v10 || v13 == 0)
    return 22;
  if (*(_DWORD *)(a1 + 16) < v10)
    return 22;
  v17 = 0;
  v15 = *(_QWORD *)(v13 + 8 * (v10 - 1));
  if (!v15)
    return 22;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, uint64_t))(**(_QWORD **)(a1 + 24) + 336))(*(_QWORD *)(a1 + 24), v15 + ((a2 - v12) << 9), a3 << 9, &v17, a5);
  if (!(_DWORD)result)
    *a4 = a3;
  return result;
}

uint64_t sub_21280DBB8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 160);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 104))(v1);
  else
    return 78;
}

uint64_t sub_21280DBD4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
  if (!(_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 112);
    if (v5 && v5 != *(_QWORD *)(a1 + 120))
    {
      result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 312))(*(_QWORD *)(a1 + 24));
      if ((_DWORD)result)
        return result;
      *(_QWORD *)(a1 + 120) = *(_QWORD *)(a1 + 112);
    }
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), a2);
  }
  return result;
}

uint64_t sub_21280DC50(const __CFURL *a1)
{
  char *v1;
  char *v2;
  FTS *v3;
  FTS *v4;
  FTSENT *v5;
  unsigned int fts_info;
  uint64_t fts_errno;
  uint64_t v8;
  unsigned int v9;
  char *v11[3];

  v11[2] = *(char **)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v1 = (char *)sub_2127F2AEC(a1);
  if (!v1)
    return 4294962336;
  v2 = v1;
  v11[0] = v1;
  v11[1] = 0;
  v3 = fts_open(v11, 21, 0);
  if (!v3)
  {
    v9 = *__error();
    if (v9)
      fts_errno = v9;
    else
      fts_errno = 0xFFFFFFFFLL;
    goto LABEL_25;
  }
  v4 = v3;
  while (1)
  {
    v5 = fts_read(v4);
    if (!v5)
      break;
    fts_info = v5->fts_info;
    if (fts_info > 0xA)
      goto LABEL_14;
    if (((1 << fts_info) & 0x490) != 0)
    {
      fts_errno = v5->fts_errno;
      if ((_DWORD)fts_errno)
        goto LABEL_24;
    }
    else if (((1 << fts_info) & 6) == 0)
    {
      if (fts_info != 6)
      {
LABEL_14:
        v8 = unlink(v5->fts_accpath);
        goto LABEL_15;
      }
      v8 = rmdir(v5->fts_accpath);
LABEL_15:
      fts_errno = v8;
      if ((v8 & 0x80000000) != 0)
      {
        fts_errno = *__error();
        if ((_DWORD)fts_errno)
          goto LABEL_24;
      }
      else if ((_DWORD)v8)
      {
        goto LABEL_24;
      }
    }
  }
  fts_errno = *__error();
LABEL_24:
  fts_close(v4);
LABEL_25:
  free(v2);
  return fts_errno;
}

uint64_t DIDiskImageValidateChecksumWithFlags(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 168))(a1);
}

_QWORD *sub_21280DDB0(_QWORD *a1)
{
  _QWORD *v2;

  v2 = sub_2127FBA00((uint64_t)a1) + 13;
  sub_21280DE58((uint64_t)v2);
  sub_21280DE84(a1 + 21);
  *a1 = &off_24CE29BE8;
  a1[13] = &unk_24CE29C30;
  a1[21] = &unk_24CE29C50;
  sub_21280DE94((uint64_t)v2, 0x10000u);
  return a1;
}

void sub_21280DE1C(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v4 = v3;
  nullsub_4(v4);
  sub_21280E148(v2);
  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_21280DE58(uint64_t result)
{
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)result = &off_24CE29CB8;
  *(_DWORD *)(result + 24) = 133114;
  *(_QWORD *)(result + 32) = 0;
  *(_DWORD *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  return result;
}

_QWORD *sub_21280DE84(_QWORD *result)
{
  *result = &off_24CE29BB8;
  return result;
}

uint64_t sub_21280DE94(uint64_t result, unsigned int a2)
{
  unsigned int v2;

  if (a2 >= 0x30000)
    v2 = 196608;
  else
    v2 = a2;
  if (v2 <= 0x800)
    v2 = 2048;
  *(_DWORD *)(result + 20) = v2;
  return result;
}

uint64_t sub_21280DEB4(int a1, char *__src, int a3, unint64_t __dst, int a5)
{
  int v8;
  char *v9;
  char *v10;
  unsigned int v11;
  BOOL v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;
  uint64_t result;
  char *v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  unsigned int v26;

  if (a5 < 1)
    return 0;
  v8 = 0;
  v9 = (char *)__dst;
  while (a3 >= 1)
  {
    v10 = __src + 1;
    if ((*__src & 0x80000000) == 0)
    {
      v11 = *__src;
      if ((v11 & 0x40) != 0)
      {
        v12 = a3 >= 3;
        a3 -= 3;
        if (!v12)
          return 1000;
        v13 = (v11 & 0x3F) + 4;
        v15 = (bswap32(*(unsigned __int16 *)(__src + 1)) >> 16) + 1;
        __src += 3;
      }
      else
      {
        v12 = a3 >= 2;
        a3 -= 2;
        if (!v12)
          return 1000;
        v13 = (v11 >> 2) + 3;
        v14 = *(unsigned __int16 *)__src;
        __src += 2;
        v15 = (bswap32(v14 & 0xFFFFFF03) >> 16) + 1;
      }
      v8 += v13;
      if (v8 <= a5)
      {
        v19 = &v9[-v15];
        if ((unint64_t)v19 >= __dst)
        {
          while (2)
          {
            switch((__int16)v13)
            {
              case 1:
                *v9++ = *v19;
                goto LABEL_24;
              case 2:
                *v9 = *v19;
                v9[1] = v19[1];
                v9 += 2;
                goto LABEL_24;
              case 3:
                goto LABEL_23;
              case 4:
                goto LABEL_22;
              case 5:
                goto LABEL_21;
              case 6:
                goto LABEL_20;
              case 7:
                goto LABEL_19;
              default:
                v20 = *v19++;
                *v9++ = v20;
LABEL_19:
                v21 = *v19++;
                *v9++ = v21;
LABEL_20:
                v22 = *v19++;
                *v9++ = v22;
LABEL_21:
                v23 = *v19++;
                *v9++ = v23;
LABEL_22:
                v24 = *v19++;
                *v9++ = v24;
LABEL_23:
                *v9 = *v19;
                v9[1] = v19[1];
                v25 = v19[2];
                v19 += 3;
                v9[2] = v25;
                v9 += 3;
                v26 = (unsigned __int16)v13;
                LOWORD(v13) = v13 - 8;
                if (v26 <= 8)
                  goto LABEL_24;
                continue;
            }
          }
        }
      }
      return 1000;
    }
    v16 = *__src & 0x7F;
    v17 = v16 + 1;
    v8 += v16 + 1;
    result = 1000;
    if (v8 > a5)
      return result;
    a3 += ~(_DWORD)v17;
    if (a3 < 0)
      return result;
    memcpy(v9, __src + 1, v17);
    __src = &v10[v17];
    v9 += v17;
LABEL_24:
    if (v8 >= a5)
      return 0;
  }
  return 1000;
}

uint64_t DIDiskImageCallProgressMessageProc(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 336))(a1);
}

void sub_21280E094(uint64_t a1)
{
  sub_21280E0EC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280E0C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4010E1D886);
  _Unwind_Resume(a1);
}

uint64_t sub_21280E0EC(uint64_t a1)
{
  nullsub_4(a1 + 168);
  sub_21280E148((_QWORD *)(a1 + 104));
  return sub_2127F8BD8(a1);
}

void sub_21280E11C(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_21280E148(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24CE29CB8;
  v2 = (void *)a1[4];
  if (v2)
    free(v2);
  a1[4] = 0;
  return a1;
}

uint64_t DIChecksumGetShortName(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
}

uint64_t DIChecksumGetValueString(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
}

uint64_t sub_21280E19C(int a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v3;
  CFTypeID v4;
  uint64_t v5;

  if (!theDict)
    return 4294966296;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("checksum-image-type"));
  if (!Value)
    return 4294966296;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 4294966296;
  if (CFStringCompare(v3, CFSTR("UDIF-CRC32"), 0) == kCFCompareEqualTo)
    return 1000;
  v5 = 1000;
  if (CFStringCompare(v3, CFSTR("UDIF-MD5"), 0))
  {
    if (CFStringCompare(v3, CFSTR("IPOD"), 0))
      return 4294966296;
    else
      return 1000;
  }
  return v5;
}

uint64_t sub_21280E24C(int a1, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v3;
  CFTypeID v4;
  uint64_t v5;

  if (!theDict)
    return 4294966296;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("checksum-image-type"));
  if (!Value)
    return 4294966296;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 4294966296;
  if (CFStringCompare(v3, CFSTR("CRC32"), 0) == kCFCompareEqualTo
    || CFStringCompare(v3, CFSTR("MD5"), 0) == kCFCompareEqualTo
    || CFStringCompare(v3, CFSTR("SHA1"), 0) == kCFCompareEqualTo
    || CFStringCompare(v3, CFSTR("SHA256"), 0) == kCFCompareEqualTo)
  {
    return 1000;
  }
  v5 = 1000;
  if (CFStringCompare(v3, CFSTR("SHA384"), 0))
  {
    if (CFStringCompare(v3, CFSTR("SHA512"), 0))
      return 4294966296;
    else
      return 1000;
  }
  return v5;
}

uint64_t sub_21280E344(char *a1, CFDictionaryRef theDict, char **a3)
{
  const __CFString *Value;
  const __CFString *v6;
  CFTypeID v7;
  uint64_t v8;
  char *v10;

  if (!a3)
    return 22;
  *a3 = 0;
  if (!theDict)
    return 22;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("checksum-image-type"));
  if (!Value)
    return 22;
  v6 = Value;
  v7 = CFGetTypeID(Value);
  if (v7 != CFStringGetTypeID())
    return 22;
  if (CFStringCompare(v6, CFSTR("CRC32"), 0))
  {
    if (CFStringCompare(v6, CFSTR("MD5"), 0))
    {
      if (CFStringCompare(v6, CFSTR("SHA1"), 0))
      {
        if (CFStringCompare(v6, CFSTR("SHA256"), 0))
        {
          if (CFStringCompare(v6, CFSTR("SHA384"), 0))
          {
            if (CFStringCompare(v6, CFSTR("SHA512"), 0))
              return 22;
            v10 = (char *)operator new();
            sub_21281E790();
          }
          else
          {
            v10 = (char *)operator new();
            sub_21281E660();
          }
        }
        else
        {
          v10 = (char *)operator new();
          sub_21281E530();
        }
      }
      else
      {
        v10 = (char *)operator new();
        sub_2128150A0();
      }
    }
    else
    {
      v10 = (char *)operator new();
      sub_212810BB8();
    }
  }
  else
  {
    v10 = (char *)operator new();
    sub_2127F92B0((uint64_t)v10);
  }
  v8 = sub_21280E58C(a1, v10);
  if ((_DWORD)v8)
  {
    DIDiskImageObjectRelease(v10);
    v10 = 0;
  }
  *a3 = v10;
  return v8;
}

void sub_21280E53C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21280E58C(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  int v7;
  int v8;
  const __CFString *v9;
  const __CFString *v10;
  size_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  int v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  BOOL v23;
  timespec v25;
  void *v26;
  int v27;
  __int128 v28;
  char *v29;
  char *v30;
  __int128 v31;
  void *v32[2];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[10];
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v26 = 0;
  (*(void (**)(char *, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
  (*(void (**)(char *))(*(_QWORD *)a2 + 48))(a2);
  v40 = 0;
  memset(v39, 0, sizeof(v39));
  v37 = 0u;
  v38 = 0u;
  memset(v36, 0, sizeof(v36));
  v34 = 0u;
  v35 = 0u;
  *(_OWORD *)v32 = 0u;
  v33 = 0u;
  v31 = 0u;
  v28 = 0u;
  v30 = a2;
  DIDiskImageObjectRetain_0(a2);
  v29 = a1;
  DIDiskImageObjectRetain_0(a1);
  *(_QWORD *)&v38 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
  pthread_mutex_init((pthread_mutex_t *)&v32[1], 0);
  pthread_cond_init((pthread_cond_t *)((char *)v36 + 8), 0);
  pthread_mutex_init((pthread_mutex_t *)((char *)&v36[3] + 8), 0);
  pthread_cond_init((pthread_cond_t *)((char *)&v36[7] + 8), 0);
  BYTE8(v37) = 0;
  *((_QWORD *)&v38 + 1) = 0;
  *(_QWORD *)&v39[0] = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)v39 + 8), 0);
  v4 = operator new();
  sub_2127FAA3C(v4);
  *(_QWORD *)&v28 = v4;
  v5 = operator new();
  sub_2127FAA3C(v5);
  *((_QWORD *)&v28 + 1) = v5;
  LODWORD(v31) = 1;
  v6 = (const __CFString *)(*(uint64_t (**)(char *, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("thread-safe"));
  if (sub_2127F14C8(v6, 0))
  {
    v27 = 0;
    v25.tv_sec = 4;
    v7 = sysctlbyname("hw.ncpu", &v27, (size_t *)&v25, 0, 0);
    v8 = 2 * v27;
    if (v7)
      v8 = 2;
    LODWORD(v31) = v8;
    v9 = (const __CFString *)sub_2127F14C0();
    v10 = v9;
    if (v9)
    {
      LODWORD(v25.tv_sec) = 4;
      if (sub_212806A98(v9, kCFNumberSInt32Type, &v25)
        && SLODWORD(v25.tv_sec) >= 1
        && (int)v31 > SLODWORD(v25.tv_sec))
      {
        LODWORD(v31) = v25.tv_sec;
      }
      CFRelease(v10);
    }
  }
  v11 = (int)v31 + 1;
  LODWORD(v31) = v31 + 1;
  DWORD1(v31) = 2 * v11;
  DWORD2(v31) = v11;
  v32[0] = malloc_type_calloc(v11, 8uLL, 0x2004093837F09uLL);
  if (v32[0])
  {
    if (SDWORD1(v31) >= 1)
    {
      v12 = 0;
      do
      {
        v13 = (_QWORD *)operator new();
        sub_2127FAA88((uint64_t)v13);
        *v13 = &off_24CE2A100;
        v13[11] = 0;
        v13[12] = 0;
        (*(void (**)(_QWORD, _QWORD *))(*(_QWORD *)v28 + 16))(v28, v13);
        ++v12;
      }
      while (v12 < SDWORD1(v31));
    }
    if ((int)v31 <= 1)
    {
      v15 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      do
      {
        pthread_create((pthread_t *)((char *)v32[0] + v14), 0, (void *(__cdecl *)(void *))sub_21280EB58, &v28);
        ++v15;
        v14 += 8;
      }
      while (v15 < (int)v31 - 1);
    }
    pthread_create((pthread_t *)v32[0] + v15, 0, (void *(__cdecl *)(void *))sub_21280ECFC, &v28);
    pthread_mutex_lock((pthread_mutex_t *)&v32[1]);
    while (DWORD2(v31))
      pthread_cond_wait((pthread_cond_t *)((char *)v36 + 8), (pthread_mutex_t *)&v32[1]);
    pthread_mutex_unlock((pthread_mutex_t *)&v32[1]);
    v25.tv_sec = time(0) + 1;
    v25.tv_nsec = 0;
    pthread_mutex_lock((pthread_mutex_t *)((char *)&v36[3] + 8));
    while (1)
    {
      pthread_cond_timedwait((pthread_cond_t *)((char *)&v36[7] + 8), (pthread_mutex_t *)((char *)&v36[3] + 8), &v25);
      if ((_QWORD)v38)
        v17.n128_f32[0] = (float)((float)*((uint64_t *)&v38 + 1) * 100.0) / (float)(uint64_t)v38;
      else
        v17.n128_u32[0] = 1120403456;
      (*(void (**)(char *, __n128))(*(_QWORD *)a1 + 344))(a1, v17);
      v18 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 352))(a1);
      v19 = v18;
      v20 = BYTE8(v37) ? 1 : v18;
      if (v20 == 1)
        break;
      ++v25.tv_sec;
    }
    BYTE8(v37) = 1;
    if ((int)v31 >= 1)
    {
      v21 = 0;
      do
      {
        (*(void (**)(_QWORD))(**((_QWORD **)&v28 + 1) + 48))(*((_QWORD *)&v28 + 1));
        (*(void (**)(_QWORD))(*(_QWORD *)v28 + 48))(v28);
        ++v21;
      }
      while (v21 < (int)v31);
    }
    if (v19)
      v16 = 111;
    else
      v16 = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)&v36[3] + 8));
    if ((int)v31 >= 1)
    {
      v22 = 0;
      do
      {
        pthread_join(*((pthread_t *)v32[0] + v22), &v26);
        if ((_DWORD)v16)
          v23 = 1;
        else
          v23 = v26 == 0;
        if (v23)
          v16 = v16;
        else
          v16 = v26;
        ++v22;
      }
      while (v22 < (int)v31);
    }
  }
  else
  {
    v16 = 12;
  }
  (*(void (**)(char *))(*(_QWORD *)a2 + 72))(a2);
  (*(void (**)(char *, float))(*(_QWORD *)a1 + 344))(a1, 100.0);
  sub_2127F38CC(v30);
  v30 = 0;
  sub_2127F38CC(v29);
  v29 = 0;
  if ((_QWORD)v28)
    (*(void (**)(_QWORD))(*(_QWORD *)v28 + 8))(v28);
  if (*((_QWORD *)&v28 + 1))
    (*(void (**)(_QWORD))(**((_QWORD **)&v28 + 1) + 8))(*((_QWORD *)&v28 + 1));
  pthread_mutex_destroy((pthread_mutex_t *)&v32[1]);
  pthread_cond_destroy((pthread_cond_t *)((char *)v36 + 8));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)&v36[3] + 8));
  pthread_cond_destroy((pthread_cond_t *)((char *)&v36[7] + 8));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)v39 + 8));
  if (v32[0])
    free(v32[0]);
  return v16;
}

void sub_21280EB14(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C406BED2C62);
  _Unwind_Resume(a1);
}

uint64_t sub_21280EB58(_QWORD *a1)
{
  pthread_mutex_t *v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  int v11;
  BOOL v12;
  uint64_t v14;
  _QWORD *v15;

  v14 = 0;
  v15 = 0;
  v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  v3 = (*(uint64_t (**)(_QWORD, _QWORD **, _QWORD))(*(_QWORD *)*a1 + 32))(*a1, &v15, 0);
  if (v3)
    v4 = 1;
  else
    v4 = v15 == 0;
  if (!v4)
  {
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 39));
      v5 = a1[38];
      v6 = a1[36];
      if (v5 + 2048 < v6)
        v6 = v5 + 2048;
      a1[38] = v6;
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 39));
      v7 = a1[36];
      if (v7 <= v5)
      {
        v3 = 0;
        goto LABEL_25;
      }
      if (v5 + 2048 <= v7)
        v8 = 2048;
      else
        v8 = v7 - v5;
      v9 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, _QWORD *))(*(_QWORD *)a1[2] + 48))(a1[2], v5, v8, &v14, v15 + 13);
      if (v9)
      {
        v3 = v9;
        goto LABEL_24;
      }
      if (v14 != v8)
        break;
      v10 = v15;
      v15[11] = v5;
      v10[12] = v8;
      (*(void (**)(_QWORD))(*(_QWORD *)a1[1] + 24))(a1[1]);
      v15 = 0;
      v11 = (*(uint64_t (**)(_QWORD, _QWORD **, _QWORD))(*(_QWORD *)*a1 + 32))(*a1, &v15, 0);
      if (v11)
        v12 = 1;
      else
        v12 = v15 == 0;
      if (v12)
      {
        v3 = v11;
        goto LABEL_19;
      }
    }
    v3 = 5;
    goto LABEL_24;
  }
LABEL_19:
  if (v3)
  {
LABEL_24:
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
    *((_BYTE *)a1 + 280) = 1;
    pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  }
LABEL_25:
  if (v15)
    (*(void (**)(_QWORD *))(*v15 + 8))(v15);
  return v3;
}

uint64_t sub_21280ECFC(_QWORD *a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  int v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  _QWORD *v13;

  v13 = 0;
  v2 = (pthread_mutex_t *)(a1 + 7);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7));
  --*((_DWORD *)a1 + 10);
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 15));
  pthread_mutex_unlock(v2);
  v3 = a1[36];
  v12 = a1[37];
  if (v12 >= v3)
  {
LABEL_9:
    v10 = 0;
  }
  else
  {
    while (1)
    {
      v4 = (*(uint64_t (**)(_QWORD, BOOL (*)(uint64_t, _QWORD *), uint64_t *, _QWORD **))(*(_QWORD *)a1[1] + 40))(a1[1], sub_21280EE38, &v12, &v13);
      v5 = v13;
      if (v4 || v13 == 0)
        break;
      v7 = a1[37] + 2048;
      if (v7 >= a1[36])
        v7 = a1[36];
      a1[37] = v7;
      (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)a1[3] + 56))(a1[3], v5 + 13, v5[12] << 9);
      v8 = v13;
      v13[11] = 0;
      v8[12] = 0;
      (*(void (**)(_QWORD))(*(_QWORD *)*a1 + 16))(*a1);
      v9 = a1[36];
      v12 = a1[37];
      v13 = 0;
      if (v12 >= v9)
        goto LABEL_9;
    }
    v10 = v4;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 21));
  *((_BYTE *)a1 + 280) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 29));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 21));
  if (v13)
    (*(void (**)(_QWORD *))(*v13 + 8))(v13);
  return v10;
}

BOOL sub_21280EE38(uint64_t a1, _QWORD *a2)
{
  return *(_QWORD *)(a1 + 88) != *a2;
}

void sub_21280EE4C(uint64_t a1)
{
  sub_2127FBF28(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21280EE80(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C400DD98C08);
  _Unwind_Resume(a1);
}

uint64_t sub_21280EEA4(char *a1, CFDictionaryRef theDict, char **a3)
{
  const __CFString *v6;
  const __CFString *v7;
  CFTypeID v8;
  uint64_t v9;
  char *v11;
  unsigned int v12;
  unint64_t v13;
  CFIndex v14;
  const __CFAllocator *v15;
  _QWORD *v16;
  char *v17;
  const __CFString *ValueAtIndex;
  const __CFString *v19;
  int v20;
  const __CFString *v21;
  CFStringRef v22;
  const void *v23;
  int v24;
  const __CFString *v25;
  CFStringRef v26;
  CFStringRef v27;
  int v28;
  const __CFString *v29;
  CFStringRef v30;
  CFStringRef v31;
  const __CFBoolean *v32;
  CFArrayRef theArray;
  int v34;
  void *v35;
  uint64_t v36;
  void *value;
  _QWORD v38[18];

  v38[16] = *MEMORY[0x24BDAC8D0];
  v35 = 0;
  v36 = -1;
  v34 = 0;
  theArray = 0;
  if (!a3)
    return 22;
  *a3 = 0;
  if (!theDict)
    return 22;
  v6 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("checksum-image-type"));
  if (!v6)
    return 22;
  v7 = v6;
  v8 = CFGetTypeID(v6);
  if (v8 != CFStringGetTypeID())
    return 22;
  if (CFStringCompare(v7, CFSTR("UDIF-CRC32"), 0))
  {
    if (CFStringCompare(v7, CFSTR("UDIF-MD5"), 0))
    {
      if (CFStringCompare(v7, CFSTR("IPOD"), 0))
        return 22;
      v11 = (char *)operator new();
      sub_2127F92B0((uint64_t)v11);
      v12 = 6;
    }
    else
    {
      v11 = (char *)operator new();
      sub_212810BB8();
      v12 = 3;
    }
  }
  else
  {
    v11 = (char *)operator new();
    sub_2127F92B0((uint64_t)v11);
    v12 = 1;
  }
  value = 0;
  if (CFDictionaryGetValueIfPresent(theDict, CFSTR("udif-chunk-size"), (const void **)&value)
    && !sub_212806A98((const __CFString *)value, kCFNumberSInt64Type, &v36))
  {
    v9 = 999;
  }
  else
  {
    v13 = v36;
    if (v36 < 0)
    {
      v13 = 2048;
      v36 = 2048;
    }
    v9 = sub_21281E81C(a1, v12, 1, v13, 0, (void ****)&v35, &v34, &theArray, 1);
    if (!(_DWORD)v9)
    {
      (*(void (**)(char *))(*(_QWORD *)v11 + 48))(v11);
      (*(void (**)(char *, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
      if (v34 < 1)
      {
LABEL_39:
        v9 = 0;
      }
      else
      {
        v14 = 0;
        v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v32 = (const __CFBoolean *)*MEMORY[0x24BDBD270];
        while (1)
        {
          v16 = (_QWORD *)*((_QWORD *)v35 + v14);
          if (!v16)
          {
            v9 = 22;
            goto LABEL_50;
          }
          v17 = (char *)sub_2127F9D14((uint64_t)v11);
          if (!v17)
          {
            v9 = 999;
            goto LABEL_50;
          }
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v14);
          if (ValueAtIndex)
            v19 = ValueAtIndex;
          else
            v19 = &stru_24CE2CFF0;
          v20 = DIGetBundleRef();
          v21 = (const __CFString *)sub_21281FFEC(v20, (int)CFSTR("Checksumming %1$@\\U2026"), CFSTR("Checksumming %1$@\\U2026"));
          v22 = CFStringCreateWithFormat(v15, 0, v21, v19);
          (*(void (**)(char *, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v22, 16);
          if (v22)
            CFRelease(v22);
          if (v21)
            CFRelease(v21);
          v9 = sub_2127FA4F8(a1, v16, v17);
          (*(void (**)(char *, const __CFString *, uint64_t))(*(_QWORD *)a1 + 336))(a1, &stru_24CE2CFF0, 16);
          if ((_DWORD)v9)
            break;
          v23 = (const void *)(*(uint64_t (**)(char *, _QWORD, char *))(*(_QWORD *)a1 + 376))(a1, 0, v17);
          v24 = DIGetBundleRef();
          v25 = (const __CFString *)sub_21281FFEC(v24, (int)CFSTR("%1$@: %2$@"), CFSTR("%1$@: %2$@"));
          v26 = sub_2127FC5AC(v19, 36, v32);
          v27 = CFStringCreateWithFormat(v15, 0, v25, v26, v23);
          (*(void (**)(char *, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v27, 8);
          if (v26)
            CFRelease(v26);
          if (v27)
            CFRelease(v27);
          if (v25)
            CFRelease(v25);
          if (v23)
            CFRelease(v23);
          (*(void (**)(char *, void **))(*(_QWORD *)v17 + 136))(v17, &value);
          (*(void (**)(char *, _QWORD *, unint64_t))(*(_QWORD *)v11 + 56))(v11, v38, (unint64_t)HIDWORD(value) >> 3);
          DIDiskImageObjectRelease(v17);
          if (++v14 >= v34)
            goto LABEL_39;
        }
        v28 = DIGetBundleRef();
        v29 = (const __CFString *)sub_21281FFEC(v28, (int)CFSTR("%1$@: checksum failed with error %2$ld."), CFSTR("%1$@: checksum failed with error %2$ld."));
        v30 = sub_2127FC5AC(v19, 36, v32);
        v31 = CFStringCreateWithFormat(v15, 0, v29, v30, v9);
        (*(void (**)(char *, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v31, 8);
        if (v30)
          CFRelease(v30);
        if (v31)
          CFRelease(v31);
        if (v29)
          CFRelease(v29);
        DIDiskImageObjectRelease(v17);
      }
LABEL_50:
      (*(void (**)(char *))(*(_QWORD *)v11 + 72))(v11);
      (*(void (**)(char *, float))(*(_QWORD *)a1 + 344))(a1, 100.0);
    }
  }
  sub_21280F418((void ***)v35, v34);
  v35 = 0;
  if (theArray)
  {
    CFRelease(theArray);
    theArray = 0;
  }
  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease(v11);
    v11 = 0;
  }
  *a3 = v11;
  return v9;
}

void sub_21280F3CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C40DF96ECBCLL);
  _Unwind_Resume(a1);
}

void sub_21280F418(void ***a1, int a2)
{
  uint64_t v3;
  void ***v4;

  if (a1)
  {
    if (a2 >= 1)
    {
      v3 = a2;
      v4 = a1;
      do
      {
        sub_212820098(*v4);
        *v4++ = 0;
        --v3;
      }
      while (v3);
    }
    free(a1);
  }
}

BOOL sub_21280F46C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int64_t v4;
  uint64_t v5;

  if (!(bswap32(*(_DWORD *)(a2 + 12)) * (unint64_t)(a4 >> 9)))
    return 1;
  v4 = (a4 >> 9) * (unint64_t)bswap32(*(_DWORD *)(a2 + 8));
  v5 = sub_2128033A4(a1);
  return v4 >= (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 96))(v5);
}

uint64_t sub_21280F4C4(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  int v3;
  uint64_t result;
  int v5;

  if (!a3)
    return 4294966296;
  v3 = sub_2127FEC8C(a3, CFSTR("convert-image-type"), 0);
  result = 4294966296;
  if (v3 > 1430542926)
  {
    if (v3 != 1430542927 && v3 != 1431062095)
    {
      v5 = 1430667849;
LABEL_10:
      if (v3 != v5)
        return result;
    }
  }
  else if (v3 != 1229999940 && v3 != 1430537039)
  {
    v5 = 1430540879;
    goto LABEL_10;
  }
  return 100;
}

uint64_t sub_21280F56C(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3;

  v3 = 4294966296;
  if (a3)
  {
    if (sub_2127FEC8C(a3, CFSTR("convert-image-type"), 0) == 1430541136)
      return 100;
    else
      return 4294966296;
  }
  return v3;
}

uint64_t sub_21280F5B8(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  uint64_t v3;
  int v4;

  v3 = 4294966296;
  if (a3)
  {
    v4 = sub_2127FEC8C(a3, CFSTR("convert-image-type"), 0);
    if (v4 == 1430540887 || v4 == 1430541391)
      return 100;
    else
      return 4294966296;
  }
  return v3;
}

uint64_t sub_21280F60C(const __CFURL *a1, char *a2, const __CFDictionary *a3, _QWORD *a4)
{
  int v8;
  int v9;
  int v10;
  const __CFNumber *v11;
  uint64_t v12;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  void ***v17;
  void *value;
  uint64_t v19;
  CFTypeRef v20;
  CFTypeRef cf;
  int v22;
  void *v23;
  char *v24;
  int valuePtr;

  valuePtr = 8;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  v20 = 0;
  cf = 0;
  v19 = -1;
  if (!a2)
    goto LABEL_7;
  DIDiskImageObjectRetain_0(a2);
  if (!a3)
    goto LABEL_7;
  v8 = sub_2127FEC8C(a3, CFSTR("convert-image-type"), 0);
  if (!v8)
    goto LABEL_7;
  v9 = v8;
  v10 = sub_2127F2A48(a3, CFSTR("convert-add-partition-map"), 0);
  v11 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("convert-alignment"));
  if (v11)
    CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
  if (v10)
  {
LABEL_7:
    v12 = 22;
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a3, CFSTR("udif-chunk-size"), (const void **)&value))
    goto LABEL_18;
  if (!sub_212806A98((const __CFString *)value, kCFNumberSInt64Type, &v19))
  {
    v12 = 999;
    goto LABEL_8;
  }
  v14 = v19;
  if (v19 < 0)
  {
LABEL_18:
    v14 = 2048;
    v19 = 2048;
  }
  if (v9 == 1430541391)
    v15 = 5;
  else
    v15 = 1;
  v16 = sub_21281E81C(a2, v15, 1, v14, (__CFDictionary **)&v20, (void ****)&v23, &v22, (__CFArray **)&cf, 1);
  v17 = (void ***)v23;
  if (!(_DWORD)v16)
  {
    v12 = sub_212816B2C((uint64_t)a2, a3, v9, (uint64_t)v23, v22, (const __CFArray *)cf, a1, &v24);
    v17 = (void ***)v23;
    if (!v23)
      goto LABEL_8;
    goto LABEL_26;
  }
  v12 = v16;
  if (v23)
LABEL_26:
    sub_21280F418(v17, v22);
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v20)
  {
    CFRelease(v20);
    v20 = 0;
  }
  if (a2)
    DIDiskImageObjectRelease(a2);
  *a4 = v24;
  return v12;
}

_QWORD *sub_21280F7DC(_QWORD *result)
{
  *result = &off_24CE2A140;
  return result;
}

uint64_t sub_21280F7EC(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 8), 0);
}

uint64_t sub_21280F7F8(uint64_t a1)
{
  return gettimeofday((timeval *)(a1 + 24), 0);
}

uint64_t sub_21280F804(uint64_t a1)
{
  return 1000 * (1000000 * (*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 8)) - *(int *)(a1 + 16) + *(int *)(a1 + 32));
}

void sub_21280F838()
{
  JUMPOUT(0x212BF43D0);
}

uint64_t DIDiskImageCopyImageInformation(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
}

__CFDictionary *sub_21280F858(char *a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  int v5;
  CFTypeRef v6;
  unsigned int v7;
  CFStringRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  __CFDictionary *Value;
  uint64_t v17;
  uint64_t valuePtr;

  v2 = sub_21280FB28(a1);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(v2, CFSTR("Size Information"), Mutable);
    v5 = DIGetBundleRef();
    v6 = sub_21281FFEC(v5, (int)CFSTR("raw read/write"), CFSTR("raw read/write"));
    CFDictionaryAddValue(v2, CFSTR("Format Description"), v6);
    if (v6)
      CFRelease(v6);
    v7 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 88))(a1);
    v8 = sub_2127F7B14(v7);
    CFDictionaryAddValue(v2, CFSTR("Format"), v8);
    if (v8)
      CFRelease(v8);
    v17 = 0;
    valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
    v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("Total Bytes"), v9);
    if (v9)
      CFRelease(v9);
    valuePtr = 0;
    v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("Total Empty Bytes"), v10);
    if (v10)
      CFRelease(v10);
    valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
    v11 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("Total Non-Empty Bytes"), v11);
    if (v11)
      CFRelease(v11);
    valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
    v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("Compressed Bytes"), v12);
    if (v12)
      CFRelease(v12);
    v17 = 0x3FF0000000000000;
    v13 = CFNumberCreate(v3, kCFNumberDoubleType, &v17);
    CFDictionaryAddValue(Mutable, CFSTR("Compressed Ratio"), v13);
    if (v13)
      CFRelease(v13);
    valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
    v14 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("Sector Count"), v14);
    if (v14)
      CFRelease(v14);
    Value = (__CFDictionary *)CFDictionaryGetValue(v2, CFSTR("Properties"));
    CFDictionaryAddValue(Value, CFSTR("Compressed"), CFSTR("no"));
    if (Mutable)
      CFRelease(Mutable);
  }
  return v2;
}

__CFDictionary *sub_21280FB28(char *a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  const CFDictionaryKeyCallBacks *v5;
  const CFDictionaryValueCallBacks *v6;
  CFMutableDictionaryRef v7;
  CFMutableDictionaryRef v8;
  const CFDictionaryValueCallBacks *v9;
  const char *v10;
  CFStringRef v11;
  const __CFURL *v12;
  CFStringRef v13;
  const void *v14;
  const void *v15;
  uint64_t v16;
  CFMutableDictionaryRef v17;
  const void *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  char *v27;
  const void *v28;
  const void *v29;
  const char *v30;
  CFStringRef v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  int v35;
  int v36;
  __CFDictionary *theDict;
  __CFDictionary *v38;

  v2 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 296))(a1);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v5 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v7 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v8 = CFDictionaryCreateMutable(v3, 0, v5, v6);
    CFDictionaryAddValue(Mutable, CFSTR("Backing Store Information"), v7);
    v38 = Mutable;
    theDict = v8;
    CFDictionaryAddValue(Mutable, CFSTR("Properties"), v8);
    CFRelease(v7);
    v35 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 384))(a1);
    v36 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 200))(a1);
    if (v2)
    {
      v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      while (1)
      {
        v10 = (const char *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
        v11 = CFStringCreateWithCString(v3, v10, 0x8000100u);
        CFDictionaryAddValue(v7, CFSTR("Class Name"), v11);
        if (v11)
          CFRelease(v11);
        v12 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 176))(v2);
        v13 = CFURLGetString(v12);
        CFDictionaryAddValue(v7, CFSTR("URL"), v13);
        v14 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 192))(v2);
        CFDictionaryAddValue(v7, CFSTR("Name"), v14);
        if ((*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)v2 + 24))(v2, CFSTR("encryption-class")))
        {
          v15 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)v2 + 24))(v2, CFSTR("encryption-class"));
          CFDictionaryAddValue(v7, CFSTR("Encryption"), v15);
        }
        v16 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 496))(v2);
        if (!v16)
          break;
        v2 = v16;
        v17 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], v9);
        CFDictionaryAddValue(v7, CFSTR("Backing Store Information"), v17);
        CFRelease(v17);
        v7 = v17;
      }
    }
    v18 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 304))(a1);
    v19 = v18;
    if (v18)
      CFRelease(v18);
    v20 = (const void *)*MEMORY[0x24BDBD270];
    v21 = (const void *)*MEMORY[0x24BDBD268];
    if (v35)
      v22 = (const void *)*MEMORY[0x24BDBD270];
    else
      v22 = (const void *)*MEMORY[0x24BDBD268];
    CFDictionaryAddValue(theDict, CFSTR("Encrypted"), v22);
    if ((*(unsigned int (**)(char *))(*(_QWORD *)a1 + 400))(a1))
      v23 = v20;
    else
      v23 = v21;
    CFDictionaryAddValue(theDict, CFSTR("Partitioned"), v23);
    if (v19)
      v24 = v20;
    else
      v24 = v21;
    CFDictionaryAddValue(theDict, CFSTR("Software License Agreement"), v24);
    if ((*(unsigned int (**)(char *))(*(_QWORD *)a1 + 272))(a1))
      v25 = v20;
    else
      v25 = v21;
    CFDictionaryAddValue(theDict, CFSTR("Checksummed"), v25);
    if (v36)
      v26 = v20;
    else
      v26 = v21;
    CFDictionaryAddValue(theDict, CFSTR("Kernel Compatible"), v26);
    v27 = (char *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 176))(a1);
    v28 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v27 + 104))(v27);
    Mutable = v38;
    CFDictionaryAddValue(v38, CFSTR("Checksum Type"), v28);
    v29 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v27 + 120))(v27);
    CFDictionaryAddValue(v38, CFSTR("Checksum Value"), v29);
    sub_2127F38CC(v27);
    v30 = (const char *)(*(uint64_t (**)(char *))(*(_QWORD *)a1 + 16))(a1);
    v31 = CFStringCreateWithCString(v3, v30, 0x8000100u);
    CFDictionaryAddValue(v38, CFSTR("Class Name"), v31);
    if (v31)
      CFRelease(v31);
    v32 = sub_21280275C(a1, 23);
    if (v32)
    {
      v33 = v32;
      CFDictionaryAddValue(v38, CFSTR("partitions"), v32);
      CFRelease(v33);
    }
    if (theDict)
      CFRelease(theDict);
  }
  return Mutable;
}

const char *sub_21280FF6C()
{
  return "CBSDBackingStore";
}

BOOL sub_21280FF78(char *a1)
{
  __CFDictionary *v1;
  __CFDictionary *v2;
  const __CFString *v3;
  _BOOL8 v4;

  v1 = sub_21280275C(a1, 23);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (const __CFString *)sub_2128023F8(v1, CFSTR("partition-scheme"));
  if (v3)
    v4 = CFStringCompare(v3, CFSTR("Apple"), 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

uint64_t sub_21280FFE4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t sub_21280FFEC()
{
  return 0;
}

const char *sub_21280FFF4()
{
  return "CRawDiskImage";
}

uint64_t sub_212810000(uint64_t a1)
{
  return *(unsigned int *)(a1 + 144);
}

uint64_t sub_212810008(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (v3)
  {
    v5 = 0;
    if (!(*(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 304))(v3, &v5))
    {
      v2 = v5 >> 9;
      if (v2 < (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
    }
  }
  return v2;
}

uint64_t sub_2128100A0(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t result;
  statfs v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 200);
  if (statfs(*(const char **)(a1 + 296), &v5) < 0)
  {
    result = *__error();
    if (!a2)
      return result;
  }
  else if (v5.f_bavail == -1)
  {
    result = 0;
    if (!a2)
      return result;
  }
  else
  {
    result = 0;
    v3 += v5.f_bavail * v5.f_bsize;
    if (!a2)
      return result;
  }
  *a2 = v3;
  return result;
}

uint64_t sub_212810148()
{
  return 22;
}

uint64_t sub_212810150(const __CFURL *a1, statfs *a2)
{
  const char *v3;
  char *v4;
  uint64_t v5;

  if (!a2)
    return 0xFFFFFFFFLL;
  v3 = (const char *)sub_2127F2AEC(a1);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = (char *)v3;
  v5 = statfs(v3, a2);
  if ((v5 & 0x80000000) != 0)
    v5 = *__error();
  free(v4);
  return v5;
}

__CFDictionary *sub_2128101A8(uint64_t a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  uint64_t *v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFMutableDictionaryRef v34;
  CFIndex v35;
  __CFDictionary *v36;
  CFNumberRef v37;
  CFNumberRef v38;
  char *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  const void *ValueAtIndex;
  const void *v44;
  uint64_t v45;
  int v46;
  const __CFString *v47;
  uint64_t v48;
  const void *v49;
  const void *v50;
  CFStringRef v51;
  int v52;
  CFTypeRef v53;
  const __CFString *v54;
  CFNumberRef v55;
  __CFDictionary *Value;
  const void **v57;
  const void *v58;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  const __CFString *v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  __CFDictionary *v71;
  __CFDictionary *theDict;
  double v73;
  uint64_t valuePtr;
  uint64_t v75;

  v2 = sub_21280FB28((char *)a1);
  if (!v2)
    return v2;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(v2, CFSTR("Size Information"), Mutable);
  v75 = 0;
  v5 = *(_DWORD *)(**(_QWORD **)(a1 + 904) + 200);
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v6 + 296))(v6, &v75);
  theDict = v2;
  if (v5)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = **(_QWORD **)(a1 + 904) + 204;
    do
    {
      v19 = *(_DWORD *)v18;
      v20 = *(_QWORD *)(v18 + 32);
      if (v20)
        v21 = 0;
      else
        v21 = *(_QWORD *)(v18 + 16);
      if (v20)
        v22 = *(_QWORD *)(v18 + 16);
      else
        v22 = 0;
      switch(v19)
      {
        case -2147483644:
          v17 = 1;
          v12 = 1;
          break;
        case -2147483643:
          v17 = 1;
          v16 = 1;
          break;
        case -2147483642:
          v17 = 1;
          v15 = 1;
          break;
        case -2147483641:
          v17 = 1;
          v14 = 1;
          break;
        case -2147483640:
          v17 = 1;
          v13 = 1;
          break;
        default:
          v23 = v19 + 1;
          if (v19 < 0)
            v24 = 1;
          else
            v24 = v17;
          if (v23 >= 3)
            v17 = v24;
          break;
      }
      v7 += v20;
      v9 += *(_QWORD *)(v18 + 16);
      v8 += v20;
      v11 += v21;
      v10 += v22;
      v18 += 40;
      --v5;
    }
    while (v5);
  }
  else
  {
    LOBYTE(v17) = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
  }
  v69 = v14;
  v70 = v16;
  v67 = v15;
  v68 = v13;
  v66 = v12;
  v73 = 0.0;
  valuePtr = v75 - v7;
  v25 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("CUDIFEncoding-bytes-wasted"), v25);
  if (v25)
    CFRelease(v25);
  valuePtr = v75;
  v26 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("CUDIFEncoding-bytes-total"), v26);
  if (v26)
    CFRelease(v26);
  valuePtr = v7;
  v27 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("CUDIFEncoding-bytes-in-use"), v27);
  if (v27)
    CFRelease(v27);
  valuePtr = v9 << 9;
  v28 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("Total Bytes"), v28);
  if (v28)
    CFRelease(v28);
  valuePtr = v11 << 9;
  v29 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("Total Empty Bytes"), v29);
  v30 = (uint64_t *)(a1 + 904);
  if (v29)
    CFRelease(v29);
  valuePtr = v10 << 9;
  v31 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("Total Non-Empty Bytes"), v31);
  if (v31)
    CFRelease(v31);
  valuePtr = v8;
  v32 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
  CFDictionaryAddValue(Mutable, CFSTR("Compressed Bytes"), v32);
  if (v32)
    CFRelease(v32);
  v73 = (double)(v8 >> 9) / (double)v10;
  v33 = CFNumberCreate(v3, kCFNumberDoubleType, &v73);
  v71 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("Compressed Ratio"), v33);
  if (v33)
    CFRelease(v33);
  valuePtr = 0;
  v34 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(theDict, CFSTR("Partition Information"), v34);
  valuePtr = *(__int16 *)(a1 + 914);
  if (*(__int16 *)(a1 + 912) >= 1)
  {
    v35 = 0;
    while (1)
    {
      v36 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v37 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
      if (v37)
      {
        v38 = v37;
        CFDictionaryAddValue(v36, CFSTR("Partition Number"), v37);
        CFRelease(v38);
      }
      if (valuePtr >= -2)
      {
        v40 = v30;
        if (valuePtr == -2)
          goto LABEL_49;
        v41 = valuePtr - *(__int16 *)(a1 + 914);
        if (v41 < *(__int16 *)(a1 + 912))
          break;
      }
      v39 = 0;
LABEL_59:
      v51 = CFStringCreateWithFormat(0, 0, CFSTR("%ld"), valuePtr);
      CFDictionaryAddValue(v34, v51, v36);
      if (v51)
        CFRelease(v51);
      if (v39)
        DIDiskImageObjectRelease(v39);
      if (v36)
        CFRelease(v36);
      ++v35;
      ++valuePtr;
      if (v35 >= *(__int16 *)(a1 + 912))
        goto LABEL_69;
    }
    v40 = (uint64_t *)(*(_QWORD *)(a1 + 928) + 8 * v41);
LABEL_49:
    v42 = *v40;
    if (!*v40)
    {
      v39 = 0;
LABEL_58:
      v30 = (uint64_t *)(a1 + 904);
      goto LABEL_59;
    }
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 936), v35);
    if (ValueAtIndex)
    {
      v44 = ValueAtIndex;
      CFRetain(ValueAtIndex);
    }
    else
    {
      v45 = valuePtr;
      v46 = DIGetBundleRef();
      if (v45 == -1)
      {
        v44 = sub_21281FFEC(v46, (int)CFSTR("Driver Descriptor Map"), CFSTR("Driver Descriptor Map"));
        if (!v44)
        {
LABEL_56:
          v48 = sub_2127FA29C((_DWORD *)(*(_QWORD *)v42 + 64));
          v39 = (char *)v48;
          if (v48)
          {
            v49 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 104))(v48);
            CFDictionaryAddValue(v36, CFSTR("Checksum Type"), v49);
            v50 = (const void *)(*(uint64_t (**)(char *))(*(_QWORD *)v39 + 120))(v39);
            CFDictionaryAddValue(v36, CFSTR("Checksum Value"), v50);
          }
          goto LABEL_58;
        }
      }
      else
      {
        v47 = (const __CFString *)sub_21281FFEC(v46, (int)CFSTR("partition %d"), CFSTR("partition %d"));
        v44 = CFStringCreateWithFormat(v3, 0, v47, valuePtr);
        CFRelease(v47);
        if (!v44)
          goto LABEL_56;
      }
    }
    CFDictionaryAddValue(v36, CFSTR("Name"), v44);
    CFRelease(v44);
    goto LABEL_56;
  }
LABEL_69:
  if (v34)
    CFRelease(v34);
  if (!(_BYTE)v17)
  {
    v60 = DIGetBundleRef();
    v53 = sub_21281FFEC(v60, (int)CFSTR("UDIF read-only"), CFSTR("UDIF read-only"));
    v2 = theDict;
    CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
    v54 = CFSTR("UDRO");
    if (!v53)
      goto LABEL_75;
    goto LABEL_74;
  }
  if (!v70)
  {
    v2 = theDict;
    if (v69)
    {
      v61 = DIGetBundleRef();
      v53 = sub_21281FFEC(v61, (int)CFSTR("UDIF read-only compressed (lzfse)"), CFSTR("UDIF read-only compressed (lzfse)"));
      CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
      v54 = CFSTR("ULFO");
      if (!v53)
        goto LABEL_75;
    }
    else if (v68)
    {
      v62 = DIGetBundleRef();
      v53 = sub_21281FFEC(v62, (int)CFSTR("UDIF read-only compressed (lzma)"), CFSTR("UDIF read-only compressed (lzma)"));
      CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
      v54 = CFSTR("ULMO");
      if (!v53)
        goto LABEL_75;
    }
    else if (v67)
    {
      v63 = DIGetBundleRef();
      v53 = sub_21281FFEC(v63, (int)CFSTR("UDIF read-only compressed (bzip2)"), CFSTR("UDIF read-only compressed (bzip2)"));
      CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
      v54 = CFSTR("UDBZ");
      if (!v53)
        goto LABEL_75;
    }
    else
    {
      v64 = DIGetBundleRef();
      if (v66)
        v65 = CFSTR("UDIF read-only compressed (ADC)");
      else
        v65 = CFSTR("UDIF read-only compressed");
      v53 = sub_21281FFEC(v64, (int)v65, v65);
      CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
      v54 = CFSTR("UDCO");
      if (!v53)
        goto LABEL_75;
    }
    goto LABEL_74;
  }
  v52 = DIGetBundleRef();
  v53 = sub_21281FFEC(v52, (int)CFSTR("UDIF read-only compressed (zlib)"), CFSTR("UDIF read-only compressed (zlib)"));
  v2 = theDict;
  CFDictionaryAddValue(theDict, CFSTR("Format Description"), v53);
  v54 = CFSTR("UDZO");
  if (v53)
LABEL_74:
    CFRelease(v53);
LABEL_75:
  CFDictionaryAddValue(v2, CFSTR("Format"), v54);
  v75 = *(_QWORD *)(*(_QWORD *)*v30 + 16);
  v55 = CFNumberCreate(v3, kCFNumberLongLongType, &v75);
  CFDictionaryAddValue(v71, CFSTR("Sector Count"), v55);
  if (v55)
    CFRelease(v55);
  Value = (__CFDictionary *)CFDictionaryGetValue(v2, CFSTR("Properties"));
  v57 = (const void **)MEMORY[0x24BDBD270];
  if (!(_BYTE)v17)
    v57 = (const void **)MEMORY[0x24BDBD268];
  CFDictionaryAddValue(Value, CFSTR("Compressed"), *v57);
  if (v71)
    CFRelease(v71);
  v58 = (const void *)(*(uint64_t (**)(uint64_t, const __CFString *))(*(_QWORD *)a1 + 24))(a1, CFSTR("udif-ordered-chunks"));
  if (v58)
    CFDictionaryAddValue(v2, CFSTR("udif-ordered-chunks"), v58);
  return v2;
}

const char *sub_212810AC4()
{
  return "CUDIFEncoding";
}

uint64_t sub_212810AD0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 176))(result);
  return result;
}

uint64_t sub_212810AE8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 192))(result);
  return result;
}

const char *sub_212810B00()
{
  return "CUDIFDiskImage";
}

BOOL sub_212810B0C(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  unsigned int v3;
  _BOOL8 result;
  uint64_t v5;
  _QWORD *v6;
  unsigned int v7;
  int v8;

  v1 = (uint64_t *)a1[113];
  v2 = *v1;
  v3 = *(_DWORD *)(*v1 + 200);
  if (__dynamic_cast(a1, (const struct __class_type_info *)&unk_24CE2ABF0, (const struct __class_type_info *)&unk_24CE2AEC0, 0))
  {
    return 0;
  }
  if (!v3)
    return 1;
  v5 = 0;
  v6 = (_QWORD *)(v2 + 228);
  v7 = 1;
  do
  {
    v8 = *((_DWORD *)v6 - 6);
    if (v8 < -2147483639 || v8 == 1)
    {
      result = *v6 >= v5;
      v5 = *v6;
      if (!result)
        return result;
    }
    else
    {
      result = 1;
    }
    v6 += 5;
  }
  while (v7++ < v3);
  return result;
}

_QWORD *sub_212810BBC(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  sub_212810C60((uint64_t)a1);
  *v2 = &off_24CE298F0;
  v2[16] = 16;
  a1[15] = malloc_type_calloc(1uLL, 0x10uLL, 0x52C2C228uLL);
  a1[14] = malloc_type_malloc(0x5CuLL, 0x100004034A301B9uLL);
  v3 = MEMORY[0x24BDAC318];
  a1[17] = MEMORY[0x24BDAC310];
  a1[18] = v3;
  a1[19] = MEMORY[0x24BDAC308];
  return a1;
}

void sub_212810C48(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_212810DAC(v1);
  _Unwind_Resume(a1);
}

double sub_212810C60(uint64_t a1)
{
  uint64_t v1;
  double result;

  v1 = sub_2127F92D4(a1);
  *(_QWORD *)v1 = off_24CE2CBB0;
  result = 0.0;
  *(_OWORD *)(v1 + 112) = 0u;
  *(_OWORD *)(v1 + 128) = 0u;
  *(_OWORD *)(v1 + 144) = 0u;
  return result;
}

uint64_t sub_212810C8C(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 136))(*(_QWORD *)(a1 + 112));
}

uint64_t sub_212810C98()
{
  return 4;
}

uint64_t sub_212810CA0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 144))(*(_QWORD *)(a1 + 112));
}

uint64_t sub_212810CAC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 152))(*(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 112));
}

uint64_t sub_212810CBC(uint64_t a1)
{
  return (8 * *(_DWORD *)(a1 + 128));
}

const void **sub_212810CC8(const void **result, void *a2, unsigned int a3)
{
  unsigned int v3;
  const void **v5;
  unsigned int v6;
  size_t v7;

  if (result[14])
  {
    v3 = a3;
    v5 = result;
    if ((*((unsigned int (**)(const void **))*result + 11))(result) < a3)
      v3 = (*((uint64_t (**)(const void **))*v5 + 11))(v5);
    v6 = v3 >> 3;
    if ((v3 & 7) != 0)
      v7 = v6 + 1;
    else
      v7 = v6;
    return (const void **)memcpy(a2, v5[15], v7);
  }
  return result;
}

const __CFString *sub_212810D48()
{
  return CFSTR("MD5");
}

void sub_212810D54(_QWORD *a1)
{
  sub_212810DAC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212810D88(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212810DAC(_QWORD *a1)
{
  void *v2;
  void *v3;

  *a1 = off_24CE2CBB0;
  v2 = (void *)a1[14];
  if (v2)
    free(v2);
  v3 = (void *)a1[15];
  if (v3)
    free(v3);
  return sub_2127F9418(a1);
}

void *sub_212810DF0(uint64_t a1, const void *a2)
{
  return memcpy(*(void **)(a1 + 120), a2, *(_QWORD *)(a1 + 128));
}

uint64_t sub_212810DFC(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
}

BOOL sub_212810E08(uint64_t a1)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  _BOOL8 v4;
  uint64_t v6;

  v2 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0xB41857C9uLL);
  if (!v2)
    return 0;
  v3 = v2;
  v6 = 0;
  v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1, 2, 1, &v6, v2)&& (sub_212810EB8(v3), *v3 == 18475)&& (v3[20] & 0x1FF) == 0&& v3[1] > 3u;
  free(v3);
  return v4;
}

double sub_212810EB8(unsigned __int16 *a1)
{
  double result;

  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *(int8x16_t *)(a1 + 18) = vrev32q_s8(*(int8x16_t *)(a1 + 18));
  *(int8x16_t *)(a1 + 26) = vrev32q_s8(*(int8x16_t *)(a1 + 26));
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  *((_QWORD *)a1 + 9) = bswap64(*((_QWORD *)a1 + 9));
  sub_212810F60((uint64_t)(a1 + 56));
  sub_212810F60((uint64_t)(a1 + 96));
  sub_212810F60((uint64_t)(a1 + 136));
  sub_212810F60((uint64_t)(a1 + 176));
  *(_QWORD *)&result = sub_212810F60((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 sub_212810F60(uint64_t a1)
{
  uint64_t v1;
  float *v2;
  float32x4x2_t v4;
  float32x4x2_t v5;

  v1 = 0;
  *(_QWORD *)a1 = bswap64(*(_QWORD *)a1);
  *(int8x8_t *)(a1 + 8) = vrev32_s8(*(int8x8_t *)(a1 + 8));
  do
  {
    v2 = (float *)(a1 + 16 + v1);
    v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
    v1 += 32;
  }
  while (v1 != 64);
  return (__n128)v4.val[0];
}

uint64_t sub_212810FB0()
{
  return 0;
}

uint64_t sub_212810FB8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 184);
}

_QWORD *sub_212810FC4(_QWORD *a1, unsigned int a2)
{
  _QWORD *v4;

  v4 = sub_2127FBA00((uint64_t)a1) + 13;
  sub_21280DE58((uint64_t)v4);
  *a1 = &off_24CE29CE8;
  a1[13] = &unk_24CE29D30;
  sub_21280DE94((uint64_t)v4, a2);
  return a1;
}

void sub_212811020(_Unwind_Exception *a1)
{
  uint64_t v1;
  _QWORD *v2;

  sub_21280E148(v2);
  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_212811048(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned int a5)
{
  unsigned int v8;
  uint64_t v9;
  char *v10;
  char *v11;
  int v12;
  uint64_t result;
  char *v14;
  BOOL v15;
  __int16 v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  int v27;
  int v28;

  v26 = 1;
  *(_DWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 112) = a2;
  *(_DWORD *)(a1 + 144) = 8 * a5;
  if (!a5)
    return 0;
  v8 = 0;
  v9 = a1 + 104;
  v27 = 0;
  v28 = 0;
  v10 = &a4[a5];
  v11 = a4;
  while (1)
  {
    sub_2128111E8(a1, &v28, &v27, (_WORD *)&v28 + 1, v8, (BOOL *)&v26);
    v12 = (__int16)v28;
    if ((__int16)v28 >= 1)
      break;
    v12 = SHIWORD(v28);
    sub_2128115C8(v9, v11, SHIWORD(v28));
    v11 += SHIWORD(v28);
LABEL_24:
    v8 += v12;
    if (v8 >= a5)
      return 0;
  }
  result = 1000;
  if (v11 >= a4)
  {
    v14 = &v11[-v27];
    v15 = v14 < a4 || &v11[(__int16)v28] > v10;
    if (!v15 && v14 <= a4)
    {
      v17 = v28;
      while (2)
      {
        switch(v17)
        {
          case 1:
            goto LABEL_21;
          case 2:
            goto LABEL_20;
          case 3:
            goto LABEL_19;
          case 4:
            goto LABEL_18;
          case 5:
            goto LABEL_17;
          case 6:
            goto LABEL_16;
          case 7:
            goto LABEL_15;
          default:
            v18 = *v14++;
            *v11++ = v18;
LABEL_15:
            v19 = *v14++;
            *v11++ = v19;
LABEL_16:
            v20 = *v14++;
            *v11++ = v20;
LABEL_17:
            v21 = *v14++;
            *v11++ = v21;
LABEL_18:
            v22 = *v14++;
            *v11++ = v22;
LABEL_19:
            v23 = *v14++;
            *v11++ = v23;
LABEL_20:
            v24 = *v14++;
            *v11++ = v24;
LABEL_21:
            v25 = *v14++;
            *v11++ = v25;
            LOWORD(v28) = v28 - 8;
            v17 = v28;
            if ((__int16)v28 <= 0)
              goto LABEL_24;
            continue;
        }
      }
    }
  }
  return result;
}

uint64_t sub_2128111E8(uint64_t a1, _WORD *a2, _DWORD *a3, _WORD *a4, unsigned int a5, BOOL *a6)
{
  uint64_t v11;
  int v12;
  __int16 v13;
  uint64_t result;

  v11 = a1 + 104;
  v12 = sub_212811290(a1 + 104);
  *a2 = v12;
  if (v12 <= 0)
  {
    if (*a6)
    {
      result = sub_212811500(v11);
      *a4 = result;
      *a6 = (_DWORD)result << 16 > 4063232;
      return result;
    }
    goto LABEL_6;
  }
  if (!*a6)
  {
LABEL_6:
    v13 = v12 + 3;
    goto LABEL_7;
  }
  v13 = v12 + 2;
LABEL_7:
  *a2 = v13;
  *a6 = 1;
  result = sub_212811654(v11, a5);
  *a3 = result;
  return result;
}

uint64_t sub_212811290(uint64_t a1)
{
  __int16 v2;

  switch(sub_2128113F4(a1, 0xAu))
  {
    case 0u:
      v2 = sub_212811468(a1, 1);
      break;
    case 1u:
      if ((unsigned __int16)sub_212811468(a1, 1))
        v2 = sub_212811468(a1, 1) + 3;
      else
        v2 = 2;
      break;
    case 2u:
      if ((unsigned __int16)sub_212811468(a1, 1))
        v2 = sub_212811468(a1, 2) + 7;
      else
        v2 = sub_212811468(a1, 1) + 5;
      break;
    case 3u:
      v2 = sub_212811468(a1, 3) + 11;
      break;
    case 4u:
      v2 = sub_212811468(a1, 3) + 19;
      break;
    case 5u:
      v2 = sub_212811468(a1, 5) + 27;
      break;
    case 6u:
      v2 = sub_212811468(a1, 6) + 59;
      break;
    case 7u:
      v2 = sub_212811468(a1, 7) + 123;
      break;
    case 8u:
      v2 = sub_212811468(a1, 8) + 251;
      break;
    case 9u:
      v2 = sub_212811468(a1, 9) + 507;
      break;
    default:
      v2 = sub_212811468(a1, 10) + 1019;
      break;
  }
  return v2;
}

uint64_t sub_2128113F4(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v3;
  _BYTE *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  v2 = *(unsigned int *)(a1 + 16);
  if (a2)
  {
    v3 = 0x80u >> (v2 & 7);
    v4 = (_BYTE *)(*(_QWORD *)(a1 + 8) + (v2 >> 3));
    v5 = 1;
    while (1)
    {
      v6 = v5;
      if ((*v4 & v3) == 0)
        break;
      if (v3 >= 2)
      {
        v3 >>= 1;
      }
      else
      {
        ++v4;
        v3 = 128;
      }
      ++v5;
      if (v6 >= a2)
      {
        v7 = v6;
        goto LABEL_11;
      }
    }
    v7 = (v5 - 1);
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
LABEL_11:
  *(_DWORD *)(a1 + 16) = v6 + v2;
  return v7;
}

uint64_t sub_212811468(uint64_t a1, int a2)
{
  unint64_t v2;
  _DWORD *exception;

  if (!a2)
    return 0;
  v2 = *(unsigned int *)(a1 + 16);
  *(_DWORD *)(a1 + 16) = v2 + a2;
  if ((v2 + a2) > *(_DWORD *)(a1 + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  return (bswap32(*(_DWORD *)(*(_QWORD *)(a1 + 8) + (v2 >> 3))) >> (32 - a2 - (v2 & 7))) & (0xFFFFFFFF >> -(char)a2);
}

void sub_2128114F4(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0)
    __cxa_call_unexpected(a1);
  _Unwind_Resume(a1);
}

uint64_t sub_212811500(uint64_t a1)
{
  uint64_t v2;
  int v3;
  signed int v4;

  v2 = 1;
  if (sub_212811468(a1, 1))
  {
    v2 = 2;
    v3 = sub_212811468(a1, 2);
    if (v3)
    {
      if (v3 == 2)
      {
        return sub_212811468(a1, 2) + 4;
      }
      else if (v3 == 1)
      {
        return 3;
      }
      else
      {
        v4 = sub_212811468(a1, 4) << 16;
        if (v4 >= 0x80000)
        {
          if (v4 >> 18 > 2)
            return sub_212811468(a1, 3) + (v4 >> 13) - 64;
          else
            return sub_212811468(a1, 2) + (v4 >> 14) - 16;
        }
        else
        {
          return ((v4 >> 16) + 8);
        }
      }
    }
  }
  return v2;
}

uint64_t sub_2128115C8(uint64_t result, _BYTE *a2, int a3)
{
  uint64_t v3;
  unint64_t v4;
  unsigned int v5;
  unsigned __int16 *v6;
  unsigned int v7;
  _DWORD *exception;

  v3 = *(_QWORD *)(result + 8);
  v4 = *(unsigned int *)(result + 16);
  v5 = v4 + 8 * a3;
  *(_DWORD *)(result + 16) = v5;
  if (v5 > *(_DWORD *)(result + 40))
  {
    exception = __cxa_allocate_exception(4uLL);
    *exception = 1000;
    __cxa_throw(exception, MEMORY[0x24BEDB798], 0);
  }
  if (a3)
  {
    v6 = (unsigned __int16 *)(v3 + (v4 >> 3));
    do
    {
      v7 = *v6;
      v6 = (unsigned __int16 *)((char *)v6 + 1);
      *a2++ = bswap32(v7) >> 16 >> (8 - (v4 & 7));
      --a3;
    }
    while (a3);
  }
  return result;
}

void sub_212811648(_Unwind_Exception *a1, int a2)
{
  if (a2 < 0)
    __cxa_call_unexpected(a1);
  _Unwind_Resume(a1);
}

uint64_t sub_212811654(uint64_t a1, unsigned int a2)
{
  __int16 v2;
  unsigned int v3;

  if (a2 >= 0xB)
  {
    if (a2 >= 0x15)
    {
      if (a2 >= 0x29)
      {
        if (a2 >= 0x51)
        {
          if (a2 >= 0xA1)
          {
            if (a2 >= 0x2A1)
            {
              if (a2 >= 0x3E9)
              {
                v2 = 7;
                if (a2 >= 0xA81)
                {
                  v3 = *(_DWORD *)(a1 + 20);
                  if (v3 >= 0x801)
                  {
                    v2 = 8;
                    if (a2 >= 0x1501 && v3 > 0x1000)
                    {
                      v2 = 9;
                      if (a2 >= 0x2A01 && v3 > 0x2000)
                      {
                        v2 = 10;
                        if (a2 >= 0x5401 && v3 > 0x4000)
                        {
                          v2 = 11;
                          if (a2 >= 0xA801 && v3 > 0x8000)
                          {
                            v2 = 12;
                            if (a2 >= 0x11171 && v3 > 0x10000)
                            {
                              if (v3 >= 0x20001 && a2 >= 0x2A001)
                                v2 = 14;
                              else
                                v2 = 13;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                v2 = 6;
              }
            }
            else
            {
              v2 = 5;
            }
          }
          else
          {
            v2 = 4;
          }
        }
        else
        {
          v2 = 3;
        }
      }
      else
      {
        v2 = 2;
      }
    }
    else
    {
      v2 = 1;
    }
  }
  else
  {
    v2 = 0;
  }
  return sub_212811780(a1, a2, v2);
}

uint64_t sub_212811780(uint64_t a1, unsigned int a2, int a3)
{
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  int v14;

  v6 = 1;
  if (!sub_212811468(a1, 1))
  {
    v12 = a1;
    v13 = a3;
LABEL_20:
    v14 = sub_212811468(v12, v13);
    return (v14 + v6);
  }
  if (!sub_212811468(a1, 1))
  {
    v6 = 1 << a3;
    goto LABEL_16;
  }
  v6 = (5 << a3) + 1;
  if ((5 << a3) + 2 >= a2)
  {
    v12 = a1;
    v13 = 1;
    goto LABEL_20;
  }
  v7 = (5 << a3) + 4;
  if (v7 >= a2)
  {
    v12 = a1;
    v13 = 2;
    goto LABEL_20;
  }
  v8 = (__int16)(a3 + 4);
  if (v8 >= 3)
  {
    v9 = 4;
    LOWORD(v10) = 3;
    while (1)
    {
      v7 += v9;
      v11 = v7 == 1664 ? 1644 : v7;
      if ((unsigned __int16)v10 == (unsigned __int16)v8 || v11 >= a2)
        break;
      v9 *= 2;
      v10 = (__int16)(v10 + 1);
      if (v10 > v8)
        goto LABEL_16;
    }
    v13 = (__int16)v10;
    v12 = a1;
    goto LABEL_20;
  }
LABEL_16:
  v14 = v6 + 1;
  v6 = sub_212811468(a1, a3 + 2);
  return (v14 + v6);
}

void sub_212811898(uint64_t a1)
{
  sub_2128118F0(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2128118CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C40F7BC2A52);
  _Unwind_Resume(a1);
}

uint64_t sub_2128118F0(uint64_t a1)
{
  sub_21280E148((_QWORD *)(a1 + 104));
  return sub_2127F8BD8(a1);
}

void sub_212811918(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F8BD8(v1);
  _Unwind_Resume(a1);
}

unsigned __int16 *sub_212811930(unsigned __int16 *result)
{
  uint64_t v1;
  _WORD *v2;

  *result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[4] = bswap32(result[4]) >> 16;
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  LODWORD(v1) = bswap32(result[8]) >> 16;
  if (v1 >= 0x3D)
    v1 = 61;
  else
    v1 = v1;
  result[8] = v1;
  if ((_DWORD)v1)
  {
    v2 = result + 12;
    do
    {
      *(_DWORD *)(v2 - 3) = bswap32(*(_DWORD *)(v2 - 3));
      *(v2 - 1) = bswap32((unsigned __int16)*(v2 - 1)) >> 16;
      *v2 = bswap32((unsigned __int16)*v2) >> 16;
      v2 += 4;
      --v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_2128119E4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 88))(result);
  return result;
}

int8x16_t sub_2128119FC(unsigned int *a1, uint64_t a2)
{
  unint64_t v2;
  int8x16_t *v3;
  int8x16_t result;

  v2 = bswap32(*a1);
  *a1 = v2;
  if ((a2 - 4) / 0x14uLL < v2)
    v2 = (a2 - 4) / 0x14uLL;
  if (v2)
  {
    v3 = (int8x16_t *)(a1 + 2);
    do
    {
      v3[-1].i32[3] = bswap32(v3[-1].u32[3]);
      result = vrev64q_s8(*v3);
      *v3 = result;
      v3 = (int8x16_t *)((char *)v3 + 20);
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_212811A50(uint64_t a1)
{
  int8x16_t v1;
  unsigned int v2;
  int8x16_t v3;
  unsigned int v4;
  uint32x4_t v5;

  v1 = vrev32q_s8(*(int8x16_t *)a1);
  *(int8x16_t *)a1 = v1;
  v2 = bswap32(*(_DWORD *)(a1 + 48));
  *(_DWORD *)(a1 + 48) = v2;
  v3 = vrev32q_s8(*(int8x16_t *)(a1 + 84));
  *(int8x16_t *)(a1 + 84) = v3;
  v4 = bswap32(*(_DWORD *)(a1 + 100));
  *(_DWORD *)(a1 + 100) = v4;
  v5 = (uint32x4_t)vextq_s8(v1, v3, 8uLL);
  v5.i32[0] = v2;
  v5.i32[3] = v4;
  if ((vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcgtq_u32(v5, (uint32x4_t)xmmword_212826EE0), (int8x16_t)xmmword_212826EF0)) & 0xF) != 0)return 107;
  else
    return 0;
}

CFDictionaryRef sub_212811ABC(uint64_t a1, int a2)
{
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v6;
  CFMutableArrayRef v7;
  const __CFDictionary *v8;
  __CFSet *v9;
  CFDictionaryRef Copy;
  mach_port_t v11;
  const __CFDictionary *v12;
  io_object_t v14;
  io_registry_entry_t v15;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  __CFSet *v18;
  CFTypeRef CFProperty;
  __CFDictionary *v20;
  __CFDictionary *v21;
  CFTypeRef cf;
  CFTypeRef v23;
  io_iterator_t existing;

  existing = 0;
  cf = 0;
  v23 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    Copy = 0;
    goto LABEL_19;
  }
  v6 = Mutable;
  v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x24BDBD690]);
  if (v7)
  {
    v8 = (const __CFDictionary *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 280))(a1);
    v9 = v8;
    if ((a2 & 1) != 0)
    {
      v9 = sub_212811DF4(v8);
      if (!v9)
      {
LABEL_10:
        if (CFArrayGetCount(v7))
          CFDictionarySetValue(v6, CFSTR("system-entities"), v7);
        goto LABEL_12;
      }
    }
    else
    {
      if (!v8)
        goto LABEL_10;
      CFRetain(v8);
    }
    v11 = *MEMORY[0x24BDD8B20];
    v12 = IOServiceMatching("IOMedia");
    if (!IOServiceGetMatchingServices(v11, v12, &existing))
    {
      if (!IOIteratorIsValid(existing))
        MEMORY[0x212BF42BC](existing);
      v14 = IOIteratorNext(existing);
      if (v14)
      {
        v15 = v14;
        do
        {
          v16 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(v15, "IOService", CFSTR("backingstore-id"), v4, 3u);
          v17 = v16;
          if (a2)
          {
            v18 = sub_212811DF4(v16);
            if (v17)
              CFRelease(v17);
          }
          else
          {
            v18 = v16;
          }
          if (v18)
          {
            if (CFEqual(v9, v18))
            {
              if (sub_2127FDB70(v15, (CFStringRef *)&v23))
              {
                CFProperty = 0;
              }
              else
              {
                CFProperty = IORegistryEntryCreateCFProperty(v15, CFSTR("Content"), v4, 0);
                sub_2127FDC40(v23, &cf, 0, 0);
                v20 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                if (v20)
                {
                  v21 = v20;
                  if (v23)
                    CFDictionarySetValue(v20, CFSTR("dev-entry"), v23);
                  if (cf)
                    CFDictionarySetValue(v21, CFSTR("mount-point"), cf);
                  if (CFProperty)
                    CFDictionarySetValue(v21, CFSTR("content-hint"), CFProperty);
                  if (CFDictionaryGetCount(v21))
                    CFArrayAppendValue(v7, v21);
                  CFRelease(v21);
                }
              }
              if (v23)
              {
                CFRelease(v23);
                v23 = 0;
              }
              if (cf)
              {
                CFRelease(cf);
                cf = 0;
              }
              if (CFProperty)
                CFRelease(CFProperty);
            }
            CFRelease(v18);
          }
          IOObjectRelease(v15);
          v15 = IOIteratorNext(existing);
        }
        while (v15);
      }
    }
    goto LABEL_10;
  }
LABEL_12:
  if (CFDictionaryGetCount(v6))
    Copy = CFDictionaryCreateCopy(v4, v6);
  else
    Copy = 0;
  CFRelease(v6);
  if (v7)
    CFRelease(v7);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
LABEL_19:
  if (v23)
  {
    CFRelease(v23);
    v23 = 0;
  }
  if (existing)
    IOObjectRelease(existing);
  return Copy;
}

__CFSet *sub_212811DF4(const __CFDictionary *a1)
{
  __CFSet *Mutable;
  const __CFArray *Value;
  const __CFArray *v4;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6B8]);
  if (a1)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("writeable-components"));
    sub_212811E70(Mutable, Value);
    v4 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("readonly-components"));
    sub_212811E70(Mutable, v4);
  }
  return Mutable;
}

void sub_212811E70(__CFSet *a1, CFArrayRef theArray)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex i;
  const void *ValueAtIndex;

  if (a1)
  {
    if (theArray)
    {
      Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        v5 = Count;
        for (i = 0; i != v5; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
          CFSetAddValue(a1, ValueAtIndex);
        }
      }
    }
  }
}

__CFDictionary *sub_212811EDC(uint64_t a1)
{
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  __CFDictionary *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;

  if (!a1)
    return 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v3 = sub_212800FE4(a1, CFSTR("Geometry"));
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(Mutable, CFSTR("Geometry"), v3);
    CFRelease(v4);
  }
  v5 = sub_212800FE4(a1, CFSTR("Writable"));
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(Mutable, CFSTR("Writable"), v5);
    CFRelease(v6);
  }
  return Mutable;
}

__CFDictionary *sub_212811FA0(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v2;
  char *v3;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  const CFArrayCallBacks *v6;
  CFMutableArrayRef v7;
  __CFArray *v8;
  char *v9;
  uint64_t v10;
  io_object_t v11;
  CFIndex Count;
  CFIndex v13;
  CFIndex v14;
  const CFDictionaryValueCallBacks *v15;
  const __CFDictionary *ValueAtIndex;
  const void *v17;
  CFStringRef v18;
  const __CFString *v19;
  __CFDictionary *v20;
  __CFDictionary *v22;
  CFStringRef theString;

  v1 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  v2 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 192))(v1);
  v3 = (char *)sub_2127F2B30(v2, 0x8000100u);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
  v7 = CFArrayCreateMutable(v4, 0, MEMORY[0x24BDBD690]);
  CFDictionarySetValue(Mutable, CFSTR("system-entities"), v7);
  CFRelease(v7);
  if (*v3 == 114)
    ++v3;
  v8 = CFArrayCreateMutable(v4, 0, v6);
  if (*v3 == 114)
    v9 = v3 + 1;
  else
    v9 = v3;
  v10 = sub_2127F167C(v9);
  if ((_DWORD)v10)
  {
    v11 = v10;
    sub_212817274(v10, v8);
    IOObjectRelease(v11);
  }
  if (v8)
  {
    v22 = Mutable;
    Count = CFArrayGetCount(v8);
    if (Count >= 1)
    {
      v13 = Count;
      v14 = 0;
      v15 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
      do
      {
        theString = 0;
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, v14);
        v17 = sub_2128023F8(ValueAtIndex, CFSTR("BSD Name"));
        v18 = CFStringCreateWithFormat(v4, 0, CFSTR("/dev/%@"), v17);
        v19 = (const __CFString *)sub_2128023F8(ValueAtIndex, CFSTR("Content"));
        sub_2127FDC40(v18, (CFTypeRef *)&theString, 0, 0);
        v20 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], v15);
        CFDictionarySetValue(v20, CFSTR("dev-entry"), v18);
        if (v19 && CFStringGetLength(v19))
          CFDictionarySetValue(v20, CFSTR("content-hint"), v19);
        if (theString && CFStringGetLength(theString))
          CFDictionarySetValue(v20, CFSTR("mount-point"), theString);
        CFArrayAppendValue(v7, v20);
        if (v20)
          CFRelease(v20);
        if (v18)
          CFRelease(v18);
        ++v14;
      }
      while (v13 != v14);
    }
    CFRelease(v8);
    return v22;
  }
  return Mutable;
}

uint64_t DIDiskImageGetImageFormat(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
}

uint64_t sub_212812210(const void *a1, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t v6;
  const __CFAllocator *v7;
  __CFDictionary *MutableCopy;
  uint64_t v9;
  __CFDictionary *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v14;

  if (!a3)
    return 22;
  v14 = 0;
  *a3 = 0;
  v6 = operator new();
  sub_2127F3014(v6);
  *(_QWORD *)v6 = &off_24CE29050;
  *(_QWORD *)(v6 + 112) = 0;
  *(_QWORD *)(v6 + 120) = 0;
  *(_QWORD *)(v6 + 104) = 0;
  *(_QWORD *)(v6 + 648) = 0x7FFFFFFFLL;
  *(_QWORD *)(v6 + 664) = 0;
  bzero((void *)(v6 + 128), 0x201uLL);
  sub_2127FF0E0(v6, a1);
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a2)
    MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, a2);
  else
    MutableCopy = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = MutableCopy;
  CFDictionarySetValue(MutableCopy, CFSTR("writeable"), (const void *)*MEMORY[0x24BDBD270]);
  v11 = (uint64_t *)(v6 + 112);
  v12 = DIResolveURLToBackingStore((uint64_t)a1, (uint64_t)v10, 1u, (_QWORD *)(v6 + 112), 0);
  if ((_DWORD)v12
    || (v12 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)*v11 + 296))(*v11, &v14), (_DWORD)v12))
  {
    v9 = v12;
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (!sub_2127F567C(*v11, (void *)(v6 + 128), v14 - 512) && sub_2128065B4((_DWORD *)(v6 + 128)))
  {
    v9 = 0;
    *(_DWORD *)(v6 + 644) = 1;
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  v9 = sub_2127F567C(*v11, (void *)(v6 + 128), 0);
  if (!(_DWORD)v9 && sub_2128065B4((_DWORD *)(v6 + 128)))
  {
    v9 = 0;
    *(_DWORD *)(v6 + 644) = 0;
    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)*v11 + 280))(*v11, 0);
  if (v10)
LABEL_17:
    CFRelease(v10);
LABEL_18:
  if ((_DWORD)v9)
  {
    DIDiskImageObjectRelease((char *)v6);
    v6 = 0;
  }
  *a3 = v6;
  return v9;
}

void sub_2128123F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C400F414A5CLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21281241C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 192);
}

uint64_t sub_212812424(uint64_t result)
{
  ++*(_DWORD *)(result + 172);
  return result;
}

__CFDictionary *sub_212812434(uint64_t a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  uint64_t v5;
  CFTypeRef v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  __CFDictionary *Value;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t valuePtr;
  uint64_t v22;

  v2 = sub_21280FB28((char *)a1);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(v2, CFSTR("Size Information"), Mutable);
    v5 = DIGetBundleRef();
    if (v5)
    {
      v6 = sub_21281FFEC(v5, (int)CFSTR("sparse"), CFSTR("sparse"));
      CFDictionaryAddValue(v2, CFSTR("Format Description"), v6);
      if (v6)
        CFRelease(v6);
      CFDictionaryAddValue(v2, CFSTR("Format"), CFSTR("SPRS"));
      v22 = 0;
      v18 = 0;
      v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) << 9;
      valuePtr = v7;
      v8 = sub_212812710(*(_QWORD *)(a1 + 160));
      v9 = ((*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 64))(*(_QWORD *)(a1 + 160)) * v8) << 9;
      if (v9 >= v7)
        v9 = v7;
      v20 = v9;
      v19 = v7 - v9;
      v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Total Bytes"), v10);
      if (v10)
        CFRelease(v10);
      v11 = CFNumberCreate(v3, kCFNumberLongLongType, &v19);
      CFDictionaryAddValue(Mutable, CFSTR("Total Empty Bytes"), v11);
      if (v11)
        CFRelease(v11);
      v12 = CFNumberCreate(v3, kCFNumberLongLongType, &v20);
      CFDictionaryAddValue(Mutable, CFSTR("Total Non-Empty Bytes"), v12);
      if (v12)
        CFRelease(v12);
      v13 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Compressed Bytes"), v13);
      if (v13)
        CFRelease(v13);
      v18 = 0x3FF0000000000000;
      v14 = CFNumberCreate(v3, kCFNumberDoubleType, &v18);
      CFDictionaryAddValue(Mutable, CFSTR("Compressed Ratio"), v14);
      if (v14)
        CFRelease(v14);
      v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
      v15 = CFNumberCreate(v3, kCFNumberLongLongType, &v22);
      CFDictionaryAddValue(Mutable, CFSTR("Sector Count"), v15);
      if (v15)
        CFRelease(v15);
      Value = (__CFDictionary *)CFDictionaryGetValue(v2, CFSTR("Properties"));
      CFDictionaryAddValue(Value, CFSTR("Compressed"), CFSTR("no"));
      if (Mutable)
        CFRelease(Mutable);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

const char *sub_212812704()
{
  return "CSparseDiskImage";
}

uint64_t sub_212812710(uint64_t a1)
{
  _QWORD *v1;
  int v2;
  uint64_t result;

  v1 = *(_QWORD **)(a1 + 8);
  if (!v1)
    return 0;
  v2 = *(_DWORD *)(a1 + 16);
  if (!v2)
    return 0;
  LODWORD(result) = 0;
  do
  {
    if (*v1++)
      result = (result + 1);
    else
      result = result;
    --v2;
  }
  while (v2);
  return result;
}

uint64_t sub_212812744(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 64))(*(_QWORD *)(a1 + 160)) << 27;
}

uint64_t DIBackingStoreGetDataForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
}

uint64_t sub_212812774(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 212);
  return 0;
}

uint64_t DIBackingStoreReadDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 328))(a1);
}

uint64_t DIBackingStoreOpenResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 344))(a1);
}

uint64_t DIResourceFileChangedResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
}

uint64_t DIResourceFileUpdateResFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
}

uint64_t DIBackingStoreCloseResourceFile(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 352))(a1, 0);
}

uint64_t sub_2128127D0()
{
  return 1;
}

uint64_t sub_2128127D8(uint64_t a1, int a2, CFURLRef *a3)
{
  const char *v6;
  char *v7;
  DIR *v8;
  DIR *v9;
  int v10;
  dirent *v11;
  dirent *v12;
  BOOL v13;
  uint64_t v14;
  char __dst[1024];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 22;
  *a3 = 0;
  if (a2 < 1)
    return 22;
  v6 = *(const char **)(a1 + 296);
  if (!v6)
    return 9;
  strlcpy(__dst, v6, 0x400uLL);
  v7 = &__dst[strlen(*(const char **)(a1 + 296)) - 1];
  if (v7 > __dst)
  {
    while (*v7 == 47)
    {
      *v7-- = 0;
      if (v7 <= __dst)
      {
LABEL_11:
        v7 = __dst;
        goto LABEL_12;
      }
    }
  }
  if (v7 > __dst)
  {
    while (*v7 != 47)
    {
      if (--v7 <= __dst)
        goto LABEL_11;
    }
  }
LABEL_12:
  *v7 = 0;
  if (!__dst[0])
    strcpy(__dst, ".");
  v8 = opendir(__dst);
  if (!v8)
    return 999;
  v9 = v8;
  v10 = a2 + 1;
  do
  {
    v11 = readdir(v9);
    v12 = v11;
    v13 = v10-- != 0;
  }
  while (v13 && v11);
  if (v11)
  {
    strlcat(__dst, "/", 0x400uLL);
    strlcat(__dst, v12->d_name, 0x400uLL);
    v14 = sub_21281296C(__dst, a3);
  }
  else
  {
    v14 = 0;
  }
  closedir(v9);
  return v14;
}

uint64_t sub_21281296C(char *cStr, CFURLRef *a2)
{
  const __CFAllocator *v4;
  CFStringRef v5;
  const __CFString *v6;
  Boolean v7;
  stat v9;

  if (!a2)
    return 22;
  *a2 = 0;
  if (!cStr)
    return 22;
  if (!*cStr)
    return 22;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (!v5)
    return 22;
  v6 = v5;
  memset(&v9, 0, sizeof(v9));
  v7 = stat(cStr, &v9) >= 0 && (v9.st_mode & 0x4000) != 0;
  *a2 = CFURLCreateWithFileSystemPath(v4, v6, kCFURLPOSIXPathStyle, v7);
  CFRelease(v6);
  return 0;
}

const void *sub_212812A3C(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID TypeID;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v3))
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t sub_212812A78(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  if (a1[20] == a2)
    return 0;
  v5 = a2 << 9;
  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 312))(v6, v5);
  if (!(_DWORD)result)
    a1[20] = a2;
  return result;
}

uint64_t DIBackingStoreGetURL(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
}

uint64_t sub_212812AE8(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  const __CFString *v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
  v5 = (const __CFString *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 192))(v4);
  v6 = (char *)sub_2127F2B30(v5, 0x8000100u);
  syslog(6, "compaction requested for %s", v6);
  free(v6);
  (*(void (**)(_QWORD *, const __CFString *, _QWORD))(*a1 + 32))(a1, CFSTR("on IO thread"), *MEMORY[0x24BDBD270]);
  if (((*(uint64_t (**)(_QWORD *))(*a1 + 288))(a1) & 1) != 0)
  {
    v7 = a1[17];
    if (v7 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)v7 + 432))(v7))
    {
      syslog(4, "compaction rejected because image is in use");
      return 16;
    }
    else
    {
      v9 = operator new();
      sub_212812C48(v9, a1, a2);
      v10 = sub_212812CC4(v9);
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 8))(v9);
      return v10;
    }
  }
  else
  {
    syslog(4, "compaction rejected because image is not write-enabled");
    return 1;
  }
}

void sub_212812C24(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40A0872A6ALL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212812C4C(_QWORD *a1, char *a2, const void *a3)
{
  uint64_t v6;

  *a1 = &off_24CE2CB80;
  a1[1] = a2;
  DIDiskImageObjectRetain_0(a2);
  v6 = (*(uint64_t (**)(char *))(*(_QWORD *)a2 + 96))(a2);
  a1[6] = 0;
  a1[7] = v6;
  a1[4] = 0;
  a1[5] = 0;
  a1[2] = sub_21280275C(a2, 23);
  a1[3] = a3;
  if (a3)
    CFRetain(a3);
  return a1;
}

uint64_t sub_212812CC4(uint64_t a1)
{
  int v2;
  CFTypeRef v3;
  uint64_t result;
  int v5;
  int v6;
  CFTypeRef v7;
  int v8;
  CFTypeRef v9;
  CFStringRef v10;
  CFStringRef v11;
  int v12;
  const __CFString *v13;
  const __CFString *v14;
  char *v15;

  v2 = DIGetBundleRef();
  v3 = sub_21281FFEC(v2, (int)CFSTR("Starting to compact\\U2026"), CFSTR("Starting to compact\\U2026"));
  (*(void (**)(_QWORD, CFTypeRef, uint64_t))(**(_QWORD **)(a1 + 8) + 336))(*(_QWORD *)(a1 + 8), v3, 16);
  if (v3)
    CFRelease(v3);
  (*(void (**)(_QWORD, float))(**(_QWORD **)(a1 + 8) + 344))(*(_QWORD *)(a1 + 8), -1.0);
  (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 360))(*(_QWORD *)(a1 + 8), 2);
  result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 8) + 128))(*(_QWORD *)(a1 + 8), 0);
  if (!(_DWORD)result)
  {
    if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 352))(*(_QWORD *)(a1 + 8)))
    {
      v5 = 222;
LABEL_6:
      syslog(5, "CDiskImageCompactor::compact: line %d: returning kDI_USERCANCELED", v5);
      return 111;
    }
    v6 = DIGetBundleRef();
    v7 = sub_21281FFEC(v6, (int)CFSTR("Reclaiming free space\\U2026"), CFSTR("Reclaiming free space\\U2026"));
    (*(void (**)(_QWORD, CFTypeRef, uint64_t))(**(_QWORD **)(a1 + 8) + 336))(*(_QWORD *)(a1 + 8), v7, 16);
    if (v7)
      CFRelease(v7);
    result = sub_212812FD8(a1);
    if (!(_DWORD)result)
    {
      if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 352))(*(_QWORD *)(a1 + 8)))
      {
        v5 = 241;
        goto LABEL_6;
      }
      v8 = DIGetBundleRef();
      v9 = sub_21281FFEC(v8, (int)CFSTR("Finishing compaction\\U2026"), CFSTR("Finishing compaction\\U2026"));
      (*(void (**)(_QWORD, CFTypeRef, uint64_t))(**(_QWORD **)(a1 + 8) + 336))(*(_QWORD *)(a1 + 8), v9, 16);
      if (v9)
        CFRelease(v9);
      (*(void (**)(_QWORD, float))(**(_QWORD **)(a1 + 8) + 344))(*(_QWORD *)(a1 + 8), -1.0);
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 360))(*(_QWORD *)(a1 + 8), 2);
      result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 8) + 136))(*(_QWORD *)(a1 + 8), 0);
      if (!(_DWORD)result)
      {
        v10 = sub_2128134AC(*(_QWORD *)(a1 + 40) << 9);
        v11 = sub_2128134AC(*(_QWORD *)(a1 + 48) << 9);
        v12 = DIGetBundleRef();
        v13 = (const __CFString *)sub_21281FFEC(v12, (int)CFSTR("Reclaimed %1$@ out of %2$@ possible."), CFSTR("Reclaimed %1$@ out of %2$@ possible."));
        v14 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v13, v10, v11);
        (*(void (**)(_QWORD, const __CFString *, uint64_t))(**(_QWORD **)(a1 + 8) + 336))(*(_QWORD *)(a1 + 8), v14, 8);
        v15 = (char *)sub_2127F2B30(v14, 0x8000100u);
        syslog(5, "%s", v15);
        free(v15);
        if (v14)
          CFRelease(v14);
        if (v13)
          CFRelease(v13);
        if (v10)
          CFRelease(v10);
        if (v11)
          CFRelease(v11);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_212812F80(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD);

  result = sub_2127FA258(a1);
  if (result)
  {
    v5 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))sub_2127FA258(a1);
    return v5(3, a1, a2, 0, 0, 0);
  }
  return result;
}

uint64_t sub_212812FD8(uint64_t a1)
{
  const __CFArray *Value;
  const __CFArray *v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const __CFString *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  uint64_t v16;
  uint64_t valuePtr;

  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("partitions"));
  if (!Value)
    return 22;
  v3 = Value;
  Count = CFArrayGetCount(Value);
  if (Count >= 1)
  {
    v5 = Count;
    v6 = 0;
    v16 = 0;
    valuePtr = 0;
    do
    {
      v15 = 0;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v6);
      v8 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("partition-hint"));
      if (CFStringCompare(v8, CFSTR("Apple_HFS"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, CFSTR("Apple_HFSX"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, CFSTR("Apple_APFS"), 1uLL) == kCFCompareEqualTo
        || CFStringCompare(v8, CFSTR("not partitioned"), 1uLL) == kCFCompareEqualTo)
      {
        if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 352))(*(_QWORD *)(a1 + 8)) & 1) != 0)
          return 111;
        v9 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("partition-start"));
        if (v9)
        {
          CFNumberGetValue(v9, kCFNumberLongLongType, &valuePtr);
          v10 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("partition-length"));
          if (v10)
          {
            CFNumberGetValue(v10, kCFNumberLongLongType, &v16);
            v11 = sub_212802440(*(char **)(a1 + 8), valuePtr, v16, (uint64_t *)&v15);
            if ((_DWORD)v11)
              return v11;
            v12 = sub_2128131D0(a1, (uint64_t)v15, valuePtr);
            if (v15)
            {
              DIDiskImageObjectRelease(v15);
              v15 = 0;
            }
            if ((_DWORD)v12)
              return v12;
            v13 = v16 + valuePtr;
            *(_QWORD *)(a1 + 32) = v16 + valuePtr;
            (*(void (**)(_QWORD, float))(**(_QWORD **)(a1 + 8) + 344))(*(_QWORD *)(a1 + 8), (float)((float)v13 * 100.0) / (float)*(uint64_t *)(a1 + 56));
          }
        }
      }
      ++v6;
    }
    while (v5 != v6);
  }
  return 0;
}

uint64_t sub_2128131D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const __CFAllocator *v6;
  __CFDictionary *Mutable;
  const __CFDictionary *v8;
  const void *v9;
  unsigned int MKMediaRef;
  __CFDictionary *v11;
  __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFDictionary *Value;
  const __CFArray *v17;
  const __CFArray *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v23;
  const __CFNumber *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  uint64_t v27;
  CFTypeRef cf;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 valuePtr;
  unsigned int v33;

  cf = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return 12;
  v8 = Mutable;
  valuePtr = 0;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  v9 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(Mutable, CFSTR("Writable"), (const void *)*MEMORY[0x24BDBD270]);
  MKMediaRef = DIMediaKitCreateMKMediaRef(a2, 0, v8, (uint64_t *)&cf);
  v33 = MKMediaRef;
  CFRelease(v8);
  if (!MKMediaRef)
  {
    v11 = CFDictionaryCreateMutable(v6, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue(v11, CFSTR("Record Off Bits"), v9);
      v13 = (const __CFDictionary *)MKCFCreateFSInfo();
      CFRelease(v12);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (v33)
      {
LABEL_7:
        if (!v13)
          return v33;
        goto LABEL_33;
      }
      if (v13)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v13, CFSTR("Attributes"));
        if (sub_2127F2A48(Value, CFSTR("Dirty"), 0)
          && !sub_2127F2A48(*(const __CFDictionary **)(a1 + 24), CFSTR("allow-compact-busy-filesystem"), 0))
        {
          syslog(4, "cannot compact filesystem because it was not unmounted cleanly.");
        }
        else
        {
          v17 = (const __CFArray *)CFDictionaryGetValue(v13, CFSTR("Data Runs"));
          if (v17)
          {
            v18 = v17;
            Count = CFArrayGetCount(v17);
            if (Count >= 1)
            {
              v20 = Count;
              for (i = 0; i != v20; ++i)
              {
                v30 = 0;
                v31 = 0;
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v18, i);
                if (!ValueAtIndex)
                  break;
                v23 = ValueAtIndex;
                v24 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Type"));
                if (v24)
                {
                  CFNumberGetValue(v24, kCFNumberSInt16Type, &valuePtr);
                  v25 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("Origin"));
                  if (v25)
                    CFNumberGetValue(v25, kCFNumberSInt64Type, &v31);
                  v31 += a3;
                  if (valuePtr <= 1u)
                  {
                    v26 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("Length"));
                    if (v26)
                      CFNumberGetValue(v26, kCFNumberSInt64Type, &v30);
                    if (!valuePtr)
                    {
                      v27 = v31;
                      *(_QWORD *)(a1 + 48) += v30;
                      v33 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 8) + 144))(*(_QWORD *)(a1 + 8), v27);
                      if (!v33)
                        *(_QWORD *)(a1 + 40) += v29;
                    }
                  }
                }
              }
              goto LABEL_7;
            }
LABEL_33:
            CFRelease(v13);
            return v33;
          }
        }
        v33 = 999;
        goto LABEL_33;
      }
      return 999;
    }
    return 12;
  }
  return v33;
}

uint64_t sub_2128134A4()
{
  return 0;
}

CFStringRef sub_2128134AC(unint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  const __CFAllocator *v6;
  const __CFAllocator *v7;
  const __CFAllocator *v8;
  const __CFAllocator *v9;

  v1 = (double)a1 * 0.0009765625;
  v2 = v1 * 0.0009765625;
  v3 = v1 * 0.0009765625 * 0.0009765625;
  v4 = v3 * 0.0009765625;
  if (v3 * 0.0009765625 >= 1.0)
  {
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v4 == floor(v4))
      return CFStringCreateWithFormat(v6, 0, CFSTR("%qd TB"), (unint64_t)v4);
    else
      return CFStringCreateWithFormat(v6, 0, CFSTR("%.1f TB"), v3 * 0.0009765625);
  }
  else if (v3 >= 1.0)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v3 == floor(v3))
      return CFStringCreateWithFormat(v7, 0, CFSTR("%qd GB"), (unint64_t)v3);
    else
      return CFStringCreateWithFormat(v7, 0, CFSTR("%.1f GB"), *(_QWORD *)&v3);
  }
  else if (v2 >= 1.0)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v2 == floor(v2))
      return CFStringCreateWithFormat(v8, 0, CFSTR("%qd MB"), (unint64_t)v2);
    else
      return CFStringCreateWithFormat(v8, 0, CFSTR("%.1f MB"), *(_QWORD *)&v2);
  }
  else if (v1 >= 1.0)
  {
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v1 == floor(v1))
      return CFStringCreateWithFormat(v9, 0, CFSTR("%qd KB"), (unint64_t)v1);
    else
      return CFStringCreateWithFormat(v9, 0, CFSTR("%.1f KB"), *(_QWORD *)&v1);
  }
  else
  {
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%qd bytes"), a1);
  }
}

void sub_21281361C(_QWORD *a1)
{
  sub_212813674(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212813650(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40A0872A6ALL);
  _Unwind_Resume(a1);
}

_QWORD *sub_212813674(_QWORD *a1)
{
  char *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_24CE2CB80;
  v2 = (char *)a1[1];
  if (v2)
    sub_2127F38CC(v2);
  v3 = (const void *)a1[2];
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[3];
  if (v4)
    CFRelease(v4);
  return a1;
}

const __CFString *sub_2128136C4(uint64_t a1)
{
  const __CFString *v1;
  int HasPrefix;
  BOOL v3;
  char v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (!a1 || sub_212821B88(a1, v5, 0x400uLL))
    return 0;
  v1 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("/dev/%s"), v5);
  HasPrefix = CFStringHasPrefix(v1, CFSTR("/dev/disk"));
  if (v1)
    v3 = HasPrefix == 0;
  else
    v3 = 0;
  if (v3)
  {
    CFRelease(v1);
    return 0;
  }
  return v1;
}

void *sub_212813774(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  const __CFString *v5;
  void *v6;
  CFRange v8;

  v1 = sub_2128136C4(a1);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v8.length = CFStringGetLength(v1) - 5;
  v8.location = 5;
  v4 = CFStringCreateWithSubstring(v3, v2, v8);
  if (v4)
  {
    v5 = v4;
    v6 = sub_212806DC4(v4);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(v2);
  return v6;
}

uint64_t DIBackingStoreGetRsrcForkLength(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 376))(a1);
}

uint64_t DIBackingStoreOpenDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1);
}

uint64_t DIBackingStoreCloseDataFork(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
}

uint64_t DIChecksumGetValue(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

uint64_t sub_212813834(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
}

uint64_t DIShadowedDiskImageCopyDefaultShadowFileURL()
{
  return 0;
}

uint64_t DIResourceFileAddResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 168))(a1);
}

uint64_t DIResourceFileGetResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
}

uint64_t DIResourceFileReleaseResource(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 240))(a1);
}

__CFBundle *DIGetDriverVersion()
{
  __CFBundle *result;

  result = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.AppleDiskImageController"));
  if (result)
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  return result;
}

__CFBundle *DIGetFrameworkVersion()
{
  __CFBundle *result;

  result = (__CFBundle *)DIGetBundleRef();
  if (result)
    return (__CFBundle *)CFBundleGetVersionNumber(result);
  return result;
}

BOOL DIIsPotentiallyValidDiskImage(char *a1, int a2)
{
  const __CFDictionary *Mutable;
  int v5;
  CFURLRef v6;
  _BOOL8 v7;
  int v9[2];
  char *v10;

  if (!a1 || !sub_2127F1434())
    return 0;
  v10 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)v9 = 0;
  if (a2)
  {
    v5 = DIResolvePathsToDiskImageWithOptions(a1, 0, Mutable, 7u, 1, &v10, 0);
    v6 = 0;
    v7 = v5 == 0;
    if (!Mutable)
      goto LABEL_14;
    goto LABEL_13;
  }
  v6 = sub_2127FEF98(a1);
  if (v6)
  {
    if (DIHLDiskImageProbeURL())
      goto LABEL_9;
    CFDictionarySetValue(Mutable, CFSTR("DIIsPotentiallyValidDiskImage"), (const void *)*MEMORY[0x24BDBD270]);
    if (!DIResolveURLToBackingStore((uint64_t)v6, (uint64_t)Mutable, 1u, v9, 0))
    {
      if ((int)sub_2127F5478(*(uint64_t *)v9, 0) > 0 || (int)sub_2127F4BEC(*(uint64_t *)v9, 0) > 0)
      {
LABEL_9:
        v7 = 1;
        if (!Mutable)
          goto LABEL_14;
        goto LABEL_13;
      }
      v7 = (int)sub_2127F5F9C(*(uint64_t *)v9, 0) > 0;
      if (!Mutable)
        goto LABEL_14;
LABEL_13:
      CFRelease(Mutable);
      goto LABEL_14;
    }
  }
  v7 = 0;
  if (Mutable)
    goto LABEL_13;
LABEL_14:
  if (v6)
    CFRelease(v6);
  if (*(_QWORD *)v9)
  {
    DIDiskImageObjectRelease(*(char **)v9);
    *(_QWORD *)v9 = 0;
  }
  if (v10)
    DIDiskImageObjectRelease(v10);
  return v7;
}

uint64_t DIResolvePathsToDiskImageWithOptions(char *a1, const char *a2, const __CFDictionary *a3, unsigned int a4, int a5, _QWORD *a6, CFTypeRef *a7)
{
  uint64_t v14;
  CFURLRef v15;
  CFURLRef v16;
  const __CFAllocator *v17;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v19;
  CFStringRef v20;

  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  v14 = 22;
  if (a1 && a6)
  {
    if (!sub_2127F1434())
      return 119;
    v15 = sub_2127FEF98(a1);
    if (!v15)
    {
      v14 = 999;
LABEL_27:
      if (a7 && *a7 && !CFStringGetLength((CFStringRef)*a7) && *a7)
      {
        CFRelease(*a7);
        *a7 = 0;
      }
      return v14;
    }
    v16 = v15;
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (a3)
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a3);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v19 = MutableCopy;
    v20 = CFStringCreateWithCString(v17, a1, 0x8000100u);
    if (v20)
    {
      CFDictionarySetValue(v19, CFSTR("image-path"), v20);
      DIAddPermission(v19, a5);
      if (!a2)
        goto LABEL_18;
      a2 = (const char *)CFStringCreateWithCString(v17, a2, 0x8000100u);
      if (a2)
      {
        CFDictionarySetValue(v19, CFSTR("shadow-file"), a2);
LABEL_18:
        v14 = DIResolveURLToDiskImage((uint64_t)v16, v19, a4, a6, a7);
        if (!v19)
          goto LABEL_23;
        goto LABEL_22;
      }
    }
    else
    {
      a2 = 0;
    }
    v14 = 999;
    if (!v19)
    {
LABEL_23:
      if (v20)
        CFRelease(v20);
      CFRelease(v16);
      if (a2)
        CFRelease(a2);
      goto LABEL_27;
    }
LABEL_22:
    CFRelease(v19);
    goto LABEL_23;
  }
  return v14;
}

uint64_t DIResolvePathsToDiskImage(char *a1, const char *a2, unsigned int a3, int a4, _QWORD *a5, CFTypeRef *a6)
{
  if (sub_2127F1434())
    return DIResolvePathsToDiskImageWithOptions(a1, a2, 0, a3, a4, a5, a6);
  else
    return 119;
}

uint64_t sub_212813C9C(uint64_t a1, const uint8_t *a2, int a3, uint8_t *a4, int a5)
{
  compression_algorithm v10;
  size_t v11;
  void *v12;
  void *v13;
  compression_algorithm v14;
  uint64_t v15;

  if (!a3)
    return 0;
  v10 = (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  v11 = compression_decode_scratch_buffer_size(v10);
  v12 = malloc_type_malloc(v11, 0xBC9E6D18uLL);
  if (!v12)
    return 12;
  v13 = v12;
  v14 = (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
  if (compression_decode_buffer(a4, a5, a2, a3, v13, v14))
    v15 = 0;
  else
    v15 = 1000;
  free(v13);
  return v15;
}

const char *sub_212813D5C()
{
  return "CDecompressor";
}

void sub_212813D68(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t DIUDIFFileAccessWriteResourceFile_0(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  const __CFAllocator *v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  const __CFData *Data;
  const __CFData *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __CFDictionary *v17;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  CFIndex v23;
  CFIndex v24;
  uint64_t v25;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v28;
  uint64_t v29;

  v29 = 0;
  if (*(_DWORD *)(a1 + 644) > 1u)
    return 78;
  v2 = *(_DWORD *)(a1 + 140);
  v3 = DIUDIFFileAccessOpenFile_0(a1);
  if (!(_DWORD)v3)
  {
    v28 = 0;
    v4 = *(_QWORD *)(a1 + 664);
    if (v4)
    {
      v5 = sub_2128068E4(v4);
      if (v5)
      {
        v6 = v5;
        v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (Mutable)
        {
          v9 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("resource-fork"), v6);
          CFRelease(v6);
          Data = CFPropertyListCreateData(v7, v9, kCFPropertyListXMLFormat_v1_0, 0, 0);
          if (Data)
          {
            v11 = Data;
            Length = CFDataGetLength(Data);
            v13 = *(_QWORD *)(a1 + 168);
            v14 = *(_QWORD *)(a1 + 176);
            v12 = (uint64_t *)(a1 + 168);
            v15 = *(_QWORD *)(a1 + 344);
            v16 = *(_QWORD *)(a1 + 352);
            v3 = (*(uint64_t (**)(_QWORD, uint64_t *))(**(_QWORD **)(a1 + 112) + 296))(*(_QWORD *)(a1 + 112), &v29);
            if ((_DWORD)v3)
            {
LABEL_8:
              CFRelease(v9);
              CFRelease(v11);
LABEL_14:
              DIUDIFFileAccessCloseFile_0(a1);
              return v3;
            }
            v19 = v14 + v13;
            if (*(_DWORD *)(a1 + 644) == 1)
              v29 -= 512;
            if (v19 && v19 == v29)
            {
              v29 = *(_QWORD *)(a1 + 168);
              v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 312))(*(_QWORD *)(a1 + 112));
              if ((_DWORD)v3)
                goto LABEL_8;
              v19 = 0;
              *v12 = 0;
              *(_QWORD *)(a1 + 176) = 0;
            }
            v20 = (uint64_t *)(a1 + 344);
            v21 = v16 + v15;
            if (v21 && v21 == v29)
            {
              v29 = *(_QWORD *)(a1 + 344);
              v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 312))(*(_QWORD *)(a1 + 112));
              if ((_DWORD)v3)
                goto LABEL_8;
              v21 = 0;
              *v20 = 0;
              *(_QWORD *)(a1 + 352) = 0;
            }
            if (!v19)
              goto LABEL_30;
            if (v19 == v29)
            {
              v29 = *(_QWORD *)(a1 + 168);
              v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 312))(*(_QWORD *)(a1 + 112));
              if ((_DWORD)v3)
                goto LABEL_8;
              *v12 = 0;
              *(_QWORD *)(a1 + 176) = 0;
LABEL_30:
              if (!v21)
              {
                v22 = 0;
                v23 = 0;
                v24 = Length;
                goto LABEL_44;
              }
              v22 = *v20;
              v23 = v21 - *v20;
LABEL_43:
              v24 = Length;
              *v20 = 0;
              v20[1] = 0;
LABEL_44:
              if (v23 < v24)
              {
                v22 = v29;
                v29 += v24;
                v3 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 112) + 312))(*(_QWORD *)(a1 + 112));
                if ((_DWORD)v3)
                  goto LABEL_8;
                v24 = Length;
              }
              v25 = *(_QWORD *)(a1 + 112);
              BytePtr = CFDataGetBytePtr(v11);
              v3 = (*(uint64_t (**)(uint64_t, uint64_t, CFIndex, uint64_t *, const UInt8 *))(*(_QWORD *)v25
                                                                                                  + 336))(v25, v22, v24, &v28, BytePtr);
              if (!(_DWORD)v3)
              {
                *(_QWORD *)(a1 + 344) = v22;
                *(_QWORD *)(a1 + 352) = Length;
                *(_DWORD *)(a1 + 140) = *(_DWORD *)(a1 + 140) & 0xFFFFFFFC | 1;
                v3 = sub_2127FF858(a1);
                if (!(v3 | v2 & 1))
                {
                  if (*(_QWORD *)(a1 + 176))
                    v3 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 112) + 392))(*(_QWORD *)(a1 + 112), 0);
                  else
                    v3 = 0;
                }
              }
              goto LABEL_8;
            }
            if (!v21)
            {
              v22 = *v12;
              v23 = v19 - *v12;
              v20 = (uint64_t *)(a1 + 168);
              goto LABEL_43;
            }
            v22 = *v12;
            v23 = v19 - *v20;
            if (v19 == *v20)
            {
              v23 = v21 - v22;
LABEL_42:
              *v12 = 0;
              *(_QWORD *)(a1 + 176) = 0;
              goto LABEL_43;
            }
            if (v21 != v22)
            {
              if (*(_QWORD *)(a1 + 176) > *(_QWORD *)(a1 + 352))
              {
                v23 = v19 - v22;
                goto LABEL_42;
              }
              v23 = v21 - *v20;
            }
            v22 = *v20;
            goto LABEL_42;
          }
          v17 = v9;
        }
        else
        {
          v17 = v6;
        }
        CFRelease(v17);
      }
    }
    v3 = 999;
    goto LABEL_14;
  }
  return v3;
}

const char *sub_2128140D4()
{
  return "CUDIFFileAccess";
}

void sub_2128140E0(int a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  FILE **v12;
  uint64_t v13;
  char *__s2;
  int v15;
  int v16;
  char __str[3];

  if (a1)
  {
    v2 = a2;
    if (a2)
    {
      v3 = a1;
      v4 = (char *)malloc_type_malloc(0x80uLL, 0x8CFC6A6uLL);
      v5 = (char *)malloc_type_malloc(0x80uLL, 0x58A26965uLL);
      *v4 = 0;
      *v5 = 0;
      LODWORD(v6) = v3 / 16;
      if ((v3 & 0xF) != 0)
        v6 = (v6 + 1);
      else
        v6 = v6;
      v13 = v6;
      __s2 = v5;
      if ((int)v6 >= 1)
      {
        v7 = 0;
        v15 = 0;
        while (1)
        {
          v8 = 0;
          if (v3 >= 16)
            v9 = 16;
          else
            v9 = v3;
          *v4 = 0;
          v10 = v9;
          do
          {
            if (v8 < v10)
              snprintf(__str, 3uLL, "%02X", *(unsigned __int8 *)(v2 + v8));
            __strlcat_chk();
            if ((v8 & 1) != 0)
              __strlcat_chk();
            ++v8;
          }
          while (v8 != 16);
          v16 = v3;
          __strlcat_chk();
          for (i = 0; i != 16; ++i)
          {
            if (i < v10 && *(char *)(v2 + i) < 0)
              __maskrune(*(char *)(v2 + i), 0x40000uLL);
            __strlcat_chk();
          }
          __strlcat_chk();
          if (v7)
          {
            if (!strcmp(v4, __s2))
            {
              ++v15;
              goto LABEL_32;
            }
            v12 = (FILE **)MEMORY[0x24BDAC8D8];
            if (v15)
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "(repeated %d times)\n", v15);
            fprintf(*v12, "%08lX: ", 16 * v7);
          }
          else
          {
            v12 = (FILE **)MEMORY[0x24BDAC8D8];
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%08lX: ", 0);
          }
          fputs(v4, *v12);
          __strlcpy_chk();
          v15 = 0;
LABEL_32:
          v3 = v16 - v10;
          v2 += v10;
          if (++v7 == v13)
          {
            if (v15)
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "(repeated %d times)\n", v15);
            break;
          }
        }
      }
      free(__s2);
      free(v4);
    }
  }
}

uint64_t sub_2128143B0()
{
  return 78;
}

uint64_t sub_2128143B8(uint64_t a1)
{
  if (a1)
    return sub_212813834(a1);
  return a1;
}

BOOL sub_2128143C4()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  BOOL v2;
  const __CFDictionary *v3;
  const __CFArray *Value;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;
  unint64_t v8;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFDictionary *v13;
  const __CFArray *v14;
  CFIndex v15;
  CFIndex v16;
  char v17;
  CFIndex i;
  const __CFDictionary *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  uint64_t v24;
  uint64_t valuePtr;

  v0 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  v1 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  if (v0)
    v2 = v1 == 0;
  else
    v2 = 1;
  if (v2)
    return 0;
  CFDictionaryGetValue(v1, CFSTR("Sections"));
  v3 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  Value = (const __CFArray *)CFDictionaryGetValue(v3, CFSTR("Partitions"));
  Count = CFArrayGetCount(Value);
  if (Count < 1)
    return 0;
  v6 = Count;
  v7 = 0;
  v8 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v7);
    v24 = 0;
    valuePtr = 0;
    v10 = (const __CFNumber *)sub_2127FE630(ValueAtIndex, CFSTR("Offset"));
    v11 = (const __CFNumber *)sub_2127FE630(ValueAtIndex, CFSTR("Size"));
    if (v10)
    {
      v12 = v11;
      if (v11)
      {
        CFNumberGetValue(v10, kCFNumberSInt64Type, &valuePtr);
        CFNumberGetValue(v12, kCFNumberSInt64Type, &v24);
        if (v24 + valuePtr > v8)
          v8 = v24 + valuePtr;
      }
    }
    ++v7;
  }
  while (v6 != v7);
  if (!v8)
    return 0;
  CFDictionaryGetValue(v0, CFSTR("Sections"));
  v13 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
  v14 = (const __CFArray *)CFDictionaryGetValue(v13, CFSTR("Partitions"));
  v15 = CFArrayGetCount(v14);
  if (v15 < 1)
  {
    v17 = 0;
  }
  else
  {
    v16 = v15;
    v17 = 0;
    for (i = 0; i != v16; ++i)
    {
      v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, i);
      v24 = 0;
      valuePtr = 0;
      v20 = (const __CFNumber *)sub_2127FE630(v19, CFSTR("Offset"));
      v21 = (const __CFNumber *)sub_2127FE630(v19, CFSTR("Size"));
      if (v20)
      {
        v22 = v21;
        if (v21)
        {
          CFNumberGetValue(v20, kCFNumberSInt64Type, &valuePtr);
          CFNumberGetValue(v22, kCFNumberSInt64Type, &v24);
          if ((uint64_t)v8 > valuePtr)
            v17 = 1;
        }
      }
    }
  }
  return v17 == 0;
}

uint64_t sub_212814620()
{
  return 0;
}

uint64_t sub_212814628()
{
  return 0;
}

uint64_t sub_212814630()
{
  return 0;
}

uint64_t sub_212814638(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (a3)
    *a3 = 0;
  return 78;
}

uint64_t sub_212814648()
{
  return 0;
}

uint64_t sub_212814650(uint64_t a1)
{
  return *(_QWORD *)(a1 + 136);
}

uint64_t sub_212814658()
{
  return 78;
}

uint64_t sub_212814660(uint64_t a1, _DWORD *a2)
{
  if (a2)
    *a2 = 0;
  return 78;
}

uint64_t sub_212814670()
{
  return 78;
}

uint64_t sub_212814678(uint64_t a1, _DWORD *a2)
{
  if (a2)
    *a2 = 0;
  return 78;
}

uint64_t sub_212814688()
{
  return 78;
}

uint64_t sub_212814690()
{
  return 78;
}

uint64_t sub_212814698()
{
  return 0;
}

uint64_t sub_2128146A0(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = 0;
  return 78;
}

uint64_t sub_2128146B0(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
}

uint64_t sub_2128146BC()
{
  return 78;
}

uint64_t sub_2128146C4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a4)
    *a4 = 0;
  return 78;
}

uint64_t sub_2128146D4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a4)
    *a4 = 0;
  return 78;
}

uint64_t sub_2128146E8()
{
  return 78;
}

uint64_t sub_2128146F0()
{
  return 78;
}

uint64_t sub_2128146F8(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = 0;
  return 78;
}

uint64_t sub_212814708(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = 0;
  return 78;
}

uint64_t sub_212814718()
{
  return 78;
}

uint64_t sub_212814720(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a4)
    *a4 = 0;
  return 78;
}

uint64_t sub_212814730(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  if (a4)
    *a4 = 0;
  return 78;
}

uint64_t sub_212814740()
{
  return 78;
}

uint64_t sub_212814748()
{
  return 0;
}

uint64_t sub_212814750()
{
  return 78;
}

uint64_t sub_212814758(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  if (a2)
    *a2 = 0;
  if (*a3)
    *a3 = 0;
  return 78;
}

void sub_212814774(uint64_t a1, __CFDictionary *a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFDataRef v7;
  CFDataRef v8;
  const char *v9;
  char *v10;
  mach_port_t v11;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  io_object_t v14;
  CFTypeRef CFProperty;
  const void *v16;
  CFTypeID v17;
  statfs v18;
  UInt8 buffer[1024];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (const __CFURL *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 176))(a1);
  if (v3)
  {
    v4 = v3;
    v5 = (const __CFString *)sub_2127FCDB8(v3);
    if (v5)
    {
      v6 = v5;
      v7 = sub_2127FCE84(v5, 0x8000100u);
      if (v7)
      {
        v8 = v7;
        CFDictionarySetValue(a2, CFSTR("image-path"), v7);
        if (CFURLGetFileSystemRepresentation(v4, 1u, buffer, 1024))
        {
          if (!statfs((const char *)buffer, &v18))
          {
            v9 = (const char *)sub_212813774((uint64_t)&v18);
            if (v9)
            {
              v10 = (char *)v9;
              v11 = *MEMORY[0x24BDD8B20];
              v12 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, v9);
              free(v10);
              if (v12)
              {
                MatchingService = IOServiceGetMatchingService(v11, v12);
                if (MatchingService)
                {
                  v14 = MatchingService;
                  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("BSD Unit"), 0, 0);
                  if (CFProperty)
                  {
                    v16 = CFProperty;
                    v17 = CFGetTypeID(CFProperty);
                    if (v17 == CFNumberGetTypeID())
                      CFDictionarySetValue(a2, CFSTR("throttle-unit"), v16);
                    CFRelease(v16);
                  }
                  IOObjectRelease(v14);
                }
              }
            }
          }
        }
        CFRelease(v8);
      }
      CFRelease(v6);
    }
  }
}

const char *sub_212814904()
{
  return "CBackingStore";
}

uint64_t sub_212814910()
{
  return 0;
}

uint64_t sub_212814918()
{
  return 78;
}

uint64_t sub_212814920()
{
  return 78;
}

uint64_t sub_212814928()
{
  return 78;
}

uint64_t sub_212814930()
{
  return 78;
}

uint64_t sub_212814938()
{
  return 78;
}

uint64_t sub_212814940()
{
  return 78;
}

uint64_t sub_21281494C(const char *a1, unsigned int *a2, unsigned int *a3)
{
  uint64_t result;
  _OWORD v7[2];
  int v8;
  _QWORD v9[3];

  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v9[1] = 0;
  v9[2] = 0;
  v9[0] = 0x400000000005;
  result = getattrlist(a1, v9, v7, 0x24uLL, 0);
  if (!(_DWORD)result)
  {
    if (a2)
      DWORD1(v7[0]) = bswap32(*a2);
    if (a3)
      DWORD2(v7[0]) = bswap32(*a3);
    return setattrlist(a1, v9, (char *)v7 + 4, 0x20uLL, 0);
  }
  return result;
}

uint64_t sub_2128149F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 320) = a2;
  return result;
}

uint64_t sub_2128149F8(uint64_t a1)
{
  uint64_t result;

  result = unlink(*(const char **)(a1 + 296));
  if ((result & 0x80000000) != 0)
    return *__error();
  return result;
}

BOOL sub_212814A1C(uint64_t a1)
{
  __darwin_time_t v2;
  _BOOL8 result;
  stat v4;

  result = 1;
  if (!stat(*(const char **)(a1 + 296), &v4))
  {
    v2 = *(_QWORD *)(a1 + 352);
    if (v4.st_mtimespec.tv_sec <= v2
      && (v4.st_mtimespec.tv_sec != v2 || v4.st_mtimespec.tv_nsec <= *(_QWORD *)(a1 + 360)))
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_212814A80()
{
  return 1;
}

uint64_t sub_212814A88(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  v3 = a2;
  return sub_21281494C(*(const char **)(a1 + 296), 0, &v3);
}

uint64_t sub_212814AB4(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  v3 = a2;
  return sub_21281494C(*(const char **)(a1 + 296), &v3, 0);
}

uint64_t sub_212814AE0()
{
  return 0;
}

void sub_212814AE8()
{
  CFArrayCallBacks callBacks;

  if (!qword_254B5ADA0)
  {
    memset(&callBacks, 0, 24);
    callBacks.copyDescription = (CFArrayCopyDescriptionCallBack)sub_212814B6C;
    callBacks.equal = (CFArrayEqualCallBack)sub_212814BF0;
    fwrite("DIDiskImageBeginRetainCountTracking\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    qword_254B5ADA0 = (uint64_t)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &callBacks);
  }
}

CFStringRef sub_212814B6C(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v4 = *(unsigned int *)(a1 + 8);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return CFStringCreateWithFormat(v2, 0, CFSTR("%s %p (%d)"), v3, a1, v4);
}

BOOL sub_212814BF0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_212814BFC()
{
  FILE **v0;
  CFIndex Count;
  CFIndex v2;
  CFIndex i;
  const void *ValueAtIndex;
  FILE *v5;
  const __CFString *v6;

  if (qword_254B5ADA0)
  {
    v0 = (FILE **)MEMORY[0x24BDAC8D8];
    fwrite("DIDiskImageDisplayRetainCountTracking\n", 0x26uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    Count = CFArrayGetCount((CFArrayRef)qword_254B5ADA0);
    if (Count >= 1)
    {
      v2 = Count;
      for (i = 0; i != v2; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_254B5ADA0, i);
        v5 = *v0;
        v6 = sub_212814B6C((uint64_t)ValueAtIndex);
        sub_21281D5CC(v5, v6, 0x8000100u);
        fputc(10, *v0);
      }
    }
  }
}

void sub_212814CA8()
{
  if (qword_254B5ADA0)
  {
    CFRelease((CFTypeRef)qword_254B5ADA0);
    qword_254B5ADA0 = 0;
  }
}

void sub_212814CD8(_QWORD *a1)
{
  sub_2127F3E08(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_212814D0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_212814D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 88);
  if (v7)
    return v7(a2, a3, a4, a5, a6, a7);
  else
    return 0;
}

const char *sub_212814D5C()
{
  return "<generic object>";
}

uint64_t sub_212814D68(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  _DWORD v7[128];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 272))(a1))
    return 0;
  v6 = 0;
  v5 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, _DWORD *))(*(_QWORD *)a1 + 328))(a1, 0, 512, &v6, v7);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 280))(a1, 0);
  result = 0;
  if (!v5)
  {
    if (v7[0] != 2003069043)
      return 0;
    *a2 = 1000;
    return 1314079817;
  }
  return result;
}

uint64_t sub_212814E48(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v4;
  unsigned int v6;

  v4 = 4294966296;
  v6 = -1000;
  if ((sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CNotSupportedDiskImage")) & 0x80000000) == 0)
  {
    if ((int)sub_2127F29C0(theDict, CFSTR("diskimage-class"), CFSTR("CNotSupportedDiskImage")) <= 0)
    {
      sub_212814D68(a1, &v6);
      return v6;
    }
    else
    {
      return 1000;
    }
  }
  return v4;
}

const char *sub_212814EE0()
{
  return "CChecksum";
}

uint64_t sub_212814EEC()
{
  return 0xFFFFFFFFLL;
}

const __CFString *sub_212814EF8()
{
  return CFSTR("CRC-32");
}

const char *sub_212814F04()
{
  return "CCRC32Checksum";
}

const char *sub_212814F14()
{
  return "CMD5Checksum";
}

const __CFString *sub_212814F20()
{
  return CFSTR("MD5");
}

uint64_t sub_212814F2C(uint64_t a1, int a2)
{
  uint64_t v4;
  const __CFString *v5;
  int v6;
  CFTypeRef v7;

  v4 = sub_2127F92D4(a1);
  *(_QWORD *)v4 = &off_24CE299C0;
  *(_BYTE *)(v4 + 120) = a2;
  if (a2)
    v5 = CFSTR("skip");
  else
    v5 = CFSTR("none");
  v6 = DIGetBundleRef();
  v7 = sub_21281FFEC(v6, (int)v5, v5);
  *(_QWORD *)(a1 + 112) = v7;
  if (!v7)
  {
    CFRetain(v5);
    *(_QWORD *)(a1 + 112) = v5;
  }
  return a1;
}

void sub_212814FC0(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_2127F9418(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_212814FE4(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

const char *sub_212814FF0()
{
  return "CNoneChecksum";
}

_QWORD *sub_212814FFC(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t (*v3)(_QWORD, _QWORD, _QWORD);

  sub_212810C60((uint64_t)a1);
  *v2 = &off_24CE29A88;
  v2[16] = 20;
  a1[15] = malloc_type_calloc(1uLL, 0x14uLL, 0x4329567DuLL);
  a1[14] = malloc_type_malloc(0x60uLL, 0x1000040565EDBD2uLL);
  v3 = MEMORY[0x24BDAC338];
  a1[17] = MEMORY[0x24BDAC330];
  a1[18] = v3;
  a1[19] = MEMORY[0x24BDAC328];
  return a1;
}

void sub_212815088(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_212810DAC(v1);
  _Unwind_Resume(a1);
}

void sub_2128150A8(_QWORD *a1)
{
  sub_212810DAC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_2128150DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_212815100()
{
  return "CSHA1Checksum";
}

uint64_t sub_21281510C()
{
  return 6;
}

const __CFString *sub_212815114()
{
  return CFSTR("SHA1");
}

const __CFString *sub_212815120()
{
  return CFSTR("SHA-1");
}

void sub_212815138()
{
  JUMPOUT(0x212BF43D0);
}

uint64_t sub_212815150(uint64_t a1)
{
  return sub_21280E0EC(a1 - 104);
}

uint64_t sub_212815158(uint64_t a1)
{
  return sub_21280E0EC(a1 - 168);
}

void sub_212815160(uint64_t a1)
{
  sub_21280E094(a1 - 104);
}

void sub_212815168(uint64_t a1)
{
  sub_21280E094(a1 - 168);
}

const char *sub_212815170()
{
  return "CADCDecompressor";
}

_QWORD *sub_21281517C(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24CE29CB8;
  v2 = (void *)a1[4];
  if (v2)
    free(v2);
  a1[4] = 0;
  return a1;
}

void sub_2128151B8(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24CE29CB8;
  v2 = (void *)a1[4];
  if (v2)
    free(v2);
  a1[4] = 0;
  JUMPOUT(0x212BF43D0);
}

uint64_t sub_212815208(uint64_t a1)
{
  return sub_2128118F0(a1 - 104);
}

void sub_212815210(uint64_t a1)
{
  sub_212811898(a1 - 104);
}

const char *sub_212815218()
{
  return "CKenCodeDecompressor";
}

_QWORD *sub_212815224(uint64_t a1)
{
  _QWORD *result;

  result = sub_2127FBA00(a1);
  *result = &off_24CE29D88;
  return result;
}

void sub_212815248()
{
  sub_2127F8BD8();
  JUMPOUT(0x212BF43D0);
}

void sub_21281527C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

uint64_t sub_2128152A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  __int16 v11;
  int v12;
  int v13;
  int v14;

  if ((a5 & 1) != 0)
    return 22;
  if (a5 >= 0)
    v5 = a5;
  else
    v5 = a5 + 1;
  if (a5 >= 2)
  {
    v6 = 0;
    LOWORD(v7) = 0;
    v8 = 0;
    LOWORD(v9) = 0;
    v10 = 0;
    v11 = 0;
    v12 = v5 >> 1;
    do
    {
      if (!(_WORD)v7)
      {
        v8 += v10;
        v13 = bswap32(*(unsigned __int16 *)(a2 + 2 * v8));
        v7 = v13 >> 16;
        if (v13 >> 16 >= 0)
          LOWORD(v14) = HIWORD(v13);
        else
          v14 = -v7;
        if (v12 < (__int16)v14)
          return 22;
        LOWORD(v9) = v8 + 1;
        if (v7 < 0)
        {
          v7 = -HIWORD(v13);
          v6 = 1;
          v10 = 2;
        }
        else
        {
          v6 = 0;
          v10 = v7 + 1;
        }
      }
      *(_WORD *)(a4 + 2 * v11) = *(_WORD *)(a2 + 2 * (__int16)v9);
      v9 = (__int16)(v9 + ((a5 > (__int16)v9) & (v6 ^ 1)));
      if (v9 < 1 || v9 > a5)
        return 22;
      LOWORD(v7) = v7 - 1;
      ++v11;
    }
    while (v12 > v11);
  }
  return 0;
}

double sub_212815370(uint64_t a1)
{
  _QWORD *v1;
  double result;

  v1 = sub_2127FBA00(a1);
  *v1 = &off_24CE29DD0;
  *(_OWORD *)(v1 + 37) = xmmword_212826BEA;
  qmemcpy(v1 + 39, "  !!\"\"##$$%%&&''(())**++,,--..//0123456789:;<=>?", 48);
  *(_OWORD *)(v1 + 29) = xmmword_212826BAA;
  *(_OWORD *)(v1 + 31) = unk_212826BBA;
  *(_OWORD *)(v1 + 33) = xmmword_212826BCA;
  *(_OWORD *)(v1 + 35) = unk_212826BDA;
  *(_OWORD *)(v1 + 21) = xmmword_212826B6A;
  *(_OWORD *)(v1 + 23) = unk_212826B7A;
  *(_OWORD *)(v1 + 25) = xmmword_212826B8A;
  *(_OWORD *)(v1 + 27) = unk_212826B9A;
  *(_OWORD *)(v1 + 13) = xmmword_212826B2A;
  *(_OWORD *)(v1 + 15) = unk_212826B3A;
  *(_OWORD *)(v1 + 17) = xmmword_212826B4A;
  *(_OWORD *)(v1 + 19) = unk_212826B5A;
  memset(v1 + 69, 7, 48);
  *(_OWORD *)(v1 + 75) = *(_OWORD *)"\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b20CDARTRLEDecompressor";
  *(_OWORD *)(v1 + 61) = xmmword_212826CAA;
  *(_OWORD *)(v1 + 63) = unk_212826CBA;
  *(_OWORD *)(v1 + 65) = xmmword_212826CCA;
  *(_OWORD *)(v1 + 67) = unk_212826CDA;
  *(_OWORD *)(v1 + 53) = xmmword_212826C6A;
  *(_OWORD *)(v1 + 55) = unk_212826C7A;
  *(_OWORD *)(v1 + 57) = xmmword_212826C8A;
  *(_OWORD *)(v1 + 59) = unk_212826C9A;
  *(_OWORD *)(v1 + 45) = xmmword_212826C2A;
  *(_OWORD *)(v1 + 47) = unk_212826C3A;
  result = 2.56734753e-289;
  *(_OWORD *)(v1 + 49) = xmmword_212826C4A;
  *(_OWORD *)(v1 + 51) = unk_212826C5A;
  return result;
}

void sub_212815440()
{
  sub_2127F8BD8();
  JUMPOUT(0x212BF43D0);
}

void sub_212815474(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C4069E7AED5);
  _Unwind_Resume(a1);
}

uint64_t sub_212815498(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  __int16 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  __int16 v17;
  uint64_t v18;

  v1 = MEMORY[0x24BDAC7A8](a1);
  v18 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  v12 = v2;
  v13 = v3;
  v9 = 0;
  v8 = 0;
  v17 = 0;
  v16 = 0;
  v7[0] = v4;
  v7[1] = v5;
  v14 = v1 + 104;
  v15 = v1 + 360;
  sub_21281554C(v1, (uint64_t)v7);
  if (v8)
    return 1001;
  else
    return 0;
}

void sub_21281554C(uint64_t a1, uint64_t a2)
{
  void *v3;
  unsigned int v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  sub_2128157B0(a1, (_WORD *)a2);
  bzero((void *)(a2 + 48), 0xFC4uLL);
  if (*(_DWORD *)(a2 + 44))
  {
    v4 = 0;
    v5 = 4036;
    while (*(_DWORD *)(a2 + 32) <= *(_DWORD *)(a2 + 40))
    {
      v3 = (void *)sub_212815AB4(v3, a2);
      v6 = (__int16)v3;
      if ((int)v3 > 255)
      {
        v3 = (void *)sub_212815B14((uint64_t)v3, (uint64_t *)a2);
        v9 = 0;
        v10 = 0;
        v11 = v5 + ~(_WORD)v3;
        while (1)
        {
          v12 = *(_BYTE *)(a2 + ((v9 + v11) & 0xFFF) + 48);
          v13 = *(_QWORD *)(a2 + 8);
          v14 = *(unsigned int *)(a2 + 36);
          *(_DWORD *)(a2 + 36) = v14 + 1;
          if ((v14 + 1) > *(_DWORD *)(a2 + 44))
            break;
          *(_BYTE *)(v13 + v14) = v12;
          *(_BYTE *)(a2 + (__int16)v5 + 48) = v12;
          v5 = (v5 + 1) & 0xFFF;
          ++v4;
          v9 = ++v10;
          if ((__int16)v10 >= (int)(unsigned __int16)(v6 - 253))
            goto LABEL_10;
        }
LABEL_14:
        ++*(_WORD *)(a2 + 16);
        return;
      }
      v7 = *(_QWORD *)(a2 + 8);
      v8 = *(unsigned int *)(a2 + 36);
      *(_DWORD *)(a2 + 36) = v8 + 1;
      if ((v8 + 1) > *(_DWORD *)(a2 + 44))
        goto LABEL_14;
      *(_BYTE *)(v7 + v8) = (_BYTE)v3;
      *(_BYTE *)(a2 + (__int16)v5 + 48) = (_BYTE)v3;
      v5 = (v5 + 1) & 0xFFF;
      ++v4;
LABEL_10:
      v15 = *(_DWORD *)(a2 + 28);
      if (v4 > v15)
        *(_DWORD *)(a2 + 28) = v15 + 16;
      if (v4 >= *(_DWORD *)(a2 + 44))
        return;
    }
  }
}

uint64_t sub_212815694(uint64_t a1, uint64_t *a2)
{
  _WORD *v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  __int16 v10;
  int v11;

  v2 = a2 + 1077;
  v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    v7 = (unsigned __int16)*v2;
  }
  else
  {
    v4 = *a2;
    v5 = *((_DWORD *)a2 + 10);
    v6 = *((_DWORD *)a2 + 8);
    v7 = (unsigned __int16)*v2;
    do
    {
      v8 = v3;
      v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5)
        v10 = *(unsigned __int8 *)(v4 + v6);
      else
        v10 = -1;
      v11 = v10 & ~(v10 >> 31);
      v3 = 8;
      v7 |= v11 << (8 - v8);
      *v2 = v7;
      *((_BYTE *)a2 + 8620) = v8 + 8;
      v6 = v9;
    }
    while (!v8);
    LOBYTE(v3) = v8 + 8;
  }
  *v2 = 2 * v7;
  *((_BYTE *)a2 + 8620) = v3 - 1;
  return (v7 >> 15) & 1;
}

uint64_t sub_212815728(uint64_t a1, uint64_t *a2)
{
  _WORD *v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v2 = a2 + 1077;
  v3 = *((unsigned __int8 *)a2 + 8620);
  if (v3 >= 9)
  {
    LOWORD(v7) = *v2;
    LOBYTE(v8) = v3 - 8;
  }
  else
  {
    v4 = *a2;
    v5 = *((_DWORD *)a2 + 10);
    v6 = *((_DWORD *)a2 + 8);
    v7 = (unsigned __int16)*v2;
    do
    {
      v8 = v3;
      v9 = v6 + 1;
      *((_DWORD *)a2 + 8) = v6 + 1;
      if (v6 + 1 <= v5)
        v10 = *(unsigned __int8 *)(v4 + v6);
      else
        v10 = 0xFFFF;
      v3 = 8;
      v7 |= v10 << (8 - v8);
      *v2 = v7;
      *((_BYTE *)a2 + 8620) = v8 + 8;
      v6 = v9;
    }
    while (!v8);
  }
  *v2 = (_WORD)v7 << 8;
  *((_BYTE *)a2 + 8620) = v8;
  return BYTE1(v7);
}

void sub_2128157B0(uint64_t a1, _WORD *a2)
{
  _WORD *v3;
  uint64_t v4;
  uint64_t v6;
  _WORD *v7;
  uint64_t v8;
  _WORD *v9;

  memset_pattern16(a2 + 2112, &unk_212826D60, 0x274uLL);
  v3 = a2 + 3367;
  v4 = -314;
  do
  {
    v3[314] = v4 + 941;
    *v3++ = v4 + 314;
  }
  while (!__CFADD__(v4++, 1));
  v6 = 0;
  v7 = a2 + 2112;
  v8 = 314;
  do
  {
    v9 = &a2[v6 + 2426];
    *v9 = v7[1] + *v7;
    v9[1569] = v6 * 2;
    v7[629] = v8;
    v7[628] = v8;
    ++v6;
    ++v8;
    v7 += 2;
  }
  while (v6 != 313);
  a2[2739] = -1;
  a2[3366] = 0;
}

void *sub_212815860(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  void *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = 0;
  v4 = 0;
  do
  {
    v5 = a2 + v3;
    if (*(__int16 *)(a2 + v3 + 7362) >= 627)
    {
      v6 = a2 + 2 * (__int16)v4;
      *(_WORD *)(v6 + 4224) = (*(unsigned __int16 *)(v5 + 4224) + 1) >> 1;
      *(_WORD *)(v6 + 7362) = *(_WORD *)(v5 + 7362);
      ++v4;
    }
    v3 += 2;
  }
  while (v3 != 1254);
  v7 = 0;
  v8 = 314;
  v9 = a2 + 4224;
  v10 = a2 + 7362;
  do
  {
    v11 = *(_WORD *)(v9 + ((2 * v7) | 2)) + *(_WORD *)(v9 + 2 * v7);
    *(_WORD *)(v9 + 2 * v8) = v11;
    v12 = v8;
    do
      v13 = v12--;
    while (*(unsigned __int16 *)(a2 + 2 * (__int16)v12 + 4224) > v11);
    v14 = 2 * v13 + 2;
    memcpy((void *)(a2 + 4224 + 2 * v13), (const void *)(a2 + 4224 + v14), 2 * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(a2 + 4224 + 2 * v13) = v11;
    result = memcpy((void *)(v10 + 2 * v13), (const void *)(v10 + v14), 2 * (((_WORD)v8 - v13) & 0x7FFF));
    *(_WORD *)(v10 + 2 * v13) = v7;
    v7 += 2;
    ++v8;
  }
  while (v8 != 627);
  v16 = 0;
  v17 = a2 + 7362;
  do
  {
    v18 = *(unsigned __int16 *)(v17 + 2 * v16);
    if (*(__int16 *)(v17 + 2 * v16) < 627)
    {
      v19 = a2 + 2 * (__int16)v18;
      *(_WORD *)(v19 + 5482) = v16;
    }
    else
    {
      v19 = a2 + 2 * v18;
    }
    *(_WORD *)(v19 + 5480) = v16++;
  }
  while (v16 != 627);
  return result;
}

void *sub_2128159C0(void *result, uint64_t a2, int a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  _WORD *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (*(__int16 *)(a2 + 5476) == -32768)
    result = sub_212815860((uint64_t)result, a2);
  v5 = *(unsigned __int16 *)(a2 + 2 * a3 + 6734);
  v6 = a2 + 4224;
  do
  {
    v7 = (__int16)v5;
    v8 = (_WORD *)(v6 + 2 * (__int16)v5);
    v9 = *v8 + 1;
    *v8 = v9;
    if (v9 > (int)*(unsigned __int16 *)(v6 + 2 * (__int16)(v5 + 1)))
    {
      v10 = v5 + 1;
      do
        v11 = v10++;
      while (v9 > (int)*(unsigned __int16 *)(a2 + 2 * (__int16)v10 + 4224));
      v12 = a2 + 2 * v11;
      *v8 = *(_WORD *)(v12 + 4224);
      *(_WORD *)(v12 + 4224) = v9;
      v13 = a2 + 2 * (__int16)v5;
      v14 = *(__int16 *)(v13 + 7362);
      v15 = a2 + 2 * v14;
      *(_WORD *)(v15 + 5480) = v11;
      if (v14 <= 626)
        *(_WORD *)(v15 + 5482) = v11;
      v7 = v11;
      v16 = a2 + 2 * v11;
      v17 = *(__int16 *)(v16 + 7362);
      *(_WORD *)(v16 + 7362) = v14;
      v18 = a2 + 2 * v17;
      *(_WORD *)(v18 + 5480) = v5;
      if (v17 <= 626)
        *(_WORD *)(v18 + 5482) = v5;
      *(_WORD *)(v13 + 7362) = v17;
    }
    v5 = *(unsigned __int16 *)(a2 + 2 * v7 + 5480);
  }
  while (*(_WORD *)(a2 + 2 * v7 + 5480));
  return result;
}

uint64_t sub_212815AB4(void *a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;

  v3 = *(unsigned __int16 *)(a2 + 8614);
  if (v3 <= 0x272)
  {
    do
    {
      a1 = (void *)sub_212815694((uint64_t)a1, (uint64_t *)a2);
      v3 = *(unsigned __int16 *)(a2 + 2 * (unsigned __int16)((_WORD)a1 + v3) + 7362);
    }
    while (v3 < 0x273);
  }
  v4 = (__int16)(v3 - 627);
  sub_2128159C0(a1, a2, v4);
  return v4;
}

uint64_t sub_212815B14(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  int v5;
  int v6;
  int v7;

  v3 = sub_212815728(a1, a2);
  v4 = v3;
  v5 = *(char *)(a2[526] + (unsigned __int16)v3);
  v6 = *(char *)(a2[527] + (unsigned __int16)v3);
  v7 = v6 - 2;
  if (v6 != 2)
  {
    do
    {
      --v7;
      v3 = sub_212815694(v3, a2);
      v4 = v3 | (2 * v4);
    }
    while ((_WORD)v7);
  }
  return v4 & 0x3F | (v5 << 6);
}

const char *sub_212815B84()
{
  return "CDARTRLEDecompressor";
}

const char *sub_212815B90()
{
  return "CDARTLZHDecompressor";
}

const char *sub_212815BA0()
{
  return "CZlibDecompressor";
}

uint64_t sub_212815BB4(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1[17];
  if (!v2)
    return 78;
  while (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v2 + 104))(v2))
  {
    v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 496))(v2);
    if (!v2)
      return 78;
  }
  v6 = (*(uint64_t (**)(_QWORD *))(*a1 + 296))(a1);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 72))(v6);
  v8 = *(_QWORD *)v2;
  if (v7)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 112))(v2, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 80))(v2, 1003);
  if (!(_DWORD)result)
  {
    v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 112))(v2, a2);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 80))(v2, 1);
    return v9;
  }
  return result;
}

uint64_t sub_212815C9C()
{
  return 78;
}

const __CFString *sub_212815CA4()
{
  return CFSTR("<unknown>");
}

uint64_t sub_212815CB0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 104) = a2;
  return result;
}

uint64_t sub_212815CB8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 112) = a2;
  return result;
}

uint64_t sub_212815CC0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 120) = a2;
  return result;
}

uint64_t sub_212815CC8(uint64_t result)
{
  *(_BYTE *)(result + 128) = 1;
  return result;
}

uint64_t sub_212815CD4(uint64_t a1, __CFDictionary *a2)
{
  const void *v4;
  const void *v6;
  CFNumberRef v7;
  uint64_t valuePtr;

  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1)
    && ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 256))(a1) & 1) == 0)
  {
    v4 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 304))(a1);
    if (!v4)
    {
      v6 = (const void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 216))(a1);
      CFDictionaryAddValue(a2, CFSTR("kernel-dict"), v6);
      valuePtr = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 232))(a1);
      v7 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      CFDictionaryAddValue(a2, CFSTR("sparse-band-size"), v7);
      return 0;
    }
    CFRelease(v4);
  }
  return 78;
}

uint64_t sub_212815DA0(_QWORD **a1, CFDictionaryRef theDict)
{
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v4;
  uint64_t v5;
  const void *v6;

  if (theDict)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, theDict);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = MutableCopy;
  if (!MutableCopy)
    return 999;
  if (((unsigned int (*)(_QWORD **, CFMutableDictionaryRef))(*a1)[66])(a1, MutableCopy)
    || (v5 = DIHLDiskImageAttach(), (_DWORD)v5 == 45))
  {
    CFDictionaryRemoveValue(v4, CFSTR("kernel-dict"));
    v6 = (const void *)(*(uint64_t (**)(_QWORD *))(*a1[17] + 176))(a1[17]);
    CFDictionaryAddValue(v4, CFSTR("main-url"), v6);
    v5 = DIHLDiskImageAttach();
  }
  CFRelease(v4);
  return v5;
}

__CFArray *sub_212815EA0(char *a1, char a2)
{
  uint64_t v4;
  unint64_t v5;
  int v6;
  __CFArray *Mutable;
  const __CFAllocator *v8;
  uint64_t i;
  const UInt8 **v10;
  CFIndex v11;
  CFDataRef v12;
  void *v14;
  int v15;

  v15 = 0;
  v14 = 0;
  v4 = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 240))(a1);
  if (v4 >= 513)
    v5 = v4;
  else
    v5 = 2048;
  v6 = sub_21281E81C(a1, 1u, 1, v5, 0, (void ****)&v14, &v15, 0, a2);
  Mutable = 0;
  if (!v6)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    if (v15 >= 1)
    {
      for (i = 0; i < v15; ++i)
      {
        v10 = (const UInt8 **)*((_QWORD *)v14 + i);
        sub_21282012C();
        nullsub_4(v10);
        v11 = sub_212820120((uint64_t)v10);
        v12 = CFDataCreate(v8, *v10, v11);
        CFArrayAppendValue(Mutable, v12);
        CFRelease(v12);
        nullsub_4(v10);
      }
    }
  }
  if (v14)
    sub_21280F418((void ***)v14, v15);
  return Mutable;
}

uint64_t sub_212815FD4(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  unsigned int v5;
  BOOL v6;

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
  {
    *a5 = 0;
    v5 = 78;
  }
  else
  {
    v5 = 22;
  }
  if (a4)
    v6 = a3 == 0;
  else
    v6 = 1;
  if (v6)
    return 22;
  else
    return v5;
}

uint64_t sub_21281600C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
  if (v5)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v5 + 480))(v5, a2, a3);
  else
    return 78;
}

uint64_t sub_21281605C(uint64_t a1, const char *a2)
{
  const char *v2;

  v2 = "";
  if (a2)
    v2 = a2;
  return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s%qd at %qd\n", v2, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 88));
}

void sub_2128160AC(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7)
{
  __CFDictionary *Mutable;
  int v13;
  CFTypeRef v14;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = DIGetBundleRef();
  v14 = sub_21281FFEC(v13, (int)a2, a2);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-convert-name"), v14);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-convert-key"), a5);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-convert-extension"), a6);
  CFDictionaryAddValue(Mutable, CFSTR("expert-mode"), a7);
  CFArrayAppendValue(a1, Mutable);
  if (v14)
    CFRelease(v14);
  if (Mutable)
    CFRelease(Mutable);
}

void sub_2128161BC(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6, const void *a7, const void *a8, const void *a9)
{
  __CFDictionary *Mutable;
  int v16;
  CFTypeRef v17;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = DIGetBundleRef();
  v17 = sub_21281FFEC(v16, (int)a2, a2);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create-name"), v17);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create-key"), a5);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create-extension"), a6);
  CFDictionaryAddValue(Mutable, CFSTR("expert-mode"), a7);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create-virtual-size"), a8);
  if (a9)
    CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-create-hide-from-ui"), a9);
  CFArrayAppendValue(a1, Mutable);
  if (v17)
    CFRelease(v17);
  if (Mutable)
    CFRelease(Mutable);
}

void sub_21281630C(__CFArray *a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, const void *a6)
{
  __CFDictionary *Mutable;
  int v11;
  CFTypeRef v12;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v11 = DIGetBundleRef();
  v12 = sub_21281FFEC(v11, (int)a2, a2);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-checksum-name"), v12);
  CFDictionaryAddValue(Mutable, CFSTR("plugin-diskimage-checksum-key"), a5);
  CFDictionaryAddValue(Mutable, CFSTR("expert-mode"), a6);
  CFArrayAppendValue(a1, Mutable);
  if (v12)
    CFRelease(v12);
  if (Mutable)
    CFRelease(Mutable);
}

const char *sub_2128163F8()
{
  return "CDiskImage";
}

uint64_t sub_212816404()
{
  return 78;
}

uint64_t sub_21281640C()
{
  return 78;
}

uint64_t sub_212816414()
{
  return -1;
}

BOOL sub_212816420(uint64_t a1)
{
  unsigned __int16 *v2;
  unsigned __int16 *v3;
  _BOOL8 v4;
  uint64_t v6;

  v2 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x14F51CFEuLL);
  if (!v2)
    return 0;
  v3 = v2;
  v6 = 0;
  v4 = !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1, 2, 1, &v6, v2)&& (sub_212810EB8(v3), *v3 == 18520)&& (v3[20] & 0x1FF) == 0&& v3[1] > 4u;
  free(v3);
  return v4;
}

uint64_t sub_2128164D0()
{
  return 0;
}

BOOL sub_2128164D8(uint64_t a1)
{
  _BOOL8 result;
  uint64_t v2;
  int v3;
  char v4;
  unsigned int v5;
  _BOOL4 v6;
  BOOL v7;
  _BOOL4 v8;
  uint64_t v9;
  _BYTE v10[4];
  _BYTE v11[508];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t *, _BYTE *))(*(_QWORD *)a1 + 48))(a1, 2, 1, &v9, v10)|| v10[0] | v10[1])
  {
    return 0;
  }
  result = 0;
  if ((~v11[0] & 0xF0) == 0 && (v11[0] & 0xF) != 0)
  {
    v2 = v11[0] & 0xF;
    while (1)
    {
      v3 = v11[v2];
      v4 = (v3 - 97) >= 0x1A ? v11[v2] : v3 & 0xDF;
      v5 = (v4 - 65);
      v6 = v5 < 0x1A;
      if (!--v2)
        break;
      v7 = v5 >= 0x1A && (v4 - 48) >= 0xAu;
      if (v7 && v4 != 46 && v4 != 32)
      {
        v6 = 0;
        break;
      }
      if (!(_WORD)v2)
      {
        v6 = 1;
        break;
      }
    }
    v8 = v11[31] == 39 && v6;
    return v11[32] == 13 && v8;
  }
  return result;
}

CFStringRef sub_212816610(uint64_t a1)
{
  long double v1;
  double v2;
  long double v3;
  double v4;
  long double v5;
  double v6;
  long double v7;
  double v8;
  long double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  const __CFAllocator *v16;

  v1 = (double)(unint64_t)(1000
                                * (1000000 * (*(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 8))
                                 - *(int *)(a1 + 16)
                                 + *(int *)(a1 + 32)));
  v2 = fmod(v1, 1000.0);
  v3 = floor(v1 / 1000.0);
  v4 = fmod(v3, 1000.0);
  v5 = floor(v3 / 1000.0);
  v6 = fmod(v5, 1000.0);
  v7 = floor(v5 / 1000.0);
  v8 = fmod(v7, 60.0);
  v9 = floor(v7 / 60.0);
  v10 = fmod(v9, 60.0);
  v11 = floor(v9 / 60.0);
  v12 = fmod(v11, 24.0);
  v13 = floor(v11 / 24.0);
  v14 = fmod(v13, 365.25);
  v15 = floor(v13 / 365.25);
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v15 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%2hdy %3hdd %2hdh"), (int)v15, (int)v14, (int)v10);
  if (v14 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%3hdd %2hdh %02hdm %02hds"), (int)v14, (int)v12, (int)v10, (int)v8);
  if (v12 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%2hdh %2hdm %02hd.%03hds"), (int)v12, (int)v10, (int)v8, (int)v6);
  if (v10 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%2hdm %2hd.%03hds"), (int)v10, (int)v8, (int)v6);
  if (v8 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%2hd.%03hds"), (int)v8, (int)v6);
  if (v6 > 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%3hd.%03hdms"), (int)v6, (int)v4);
  if (v4 <= 0.0)
    return CFStringCreateWithFormat(v16, 0, CFSTR("%2hdns"), (int)v2);
  return CFStringCreateWithFormat(v16, 0, CFSTR("%3hd.%03hdus"), (int)v4, (int)v2);
}

uint64_t sub_21281686C(int a1, int a2, _DWORD *a3)
{
  uint64_t result;

  result = 0;
  *a3 = 0;
  if (a1 > 1346586691)
  {
    if (a1 > 1684371057)
    {
      if (a1 == 1684371058)
      {
        result = 1430540887;
        goto LABEL_22;
      }
      if (a1 != 1751413366)
      {
        if (a1 != 1885554756)
          return result;
        goto LABEL_18;
      }
      goto LABEL_10;
    }
    if (a1 == 1346586692)
    {
LABEL_18:
      result = 1144675390;
      goto LABEL_22;
    }
    if (a1 != 1346989415)
      return result;
LABEL_17:
    result = 1430541391;
    goto LABEL_22;
  }
  if (a1 > 1195994470)
  {
    if (a1 == 1195994471)
      goto LABEL_17;
    if (a1 != 1330660164)
      return result;
    if (a2 == 1330660128)
      goto LABEL_18;
    return 0;
  }
  if (a1 == 1095782476)
  {
    result = 1144675390;
    if (a2 == 1450461252 || a2 == 1144675390)
      goto LABEL_22;
    return 0;
  }
  if (a1 != 1145334125)
    return result;
LABEL_10:
  result = 1380013866;
LABEL_22:
  *a3 = 100;
  return result;
}

uint64_t sub_2128169B8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  int v12;

  v5 = sub_2127F3728(a3);
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1))
    return 78;
  v12 = 0;
  if (a2
    && __dynamic_cast(a2, (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2BBB0, 0))
  {
    return 110;
  }
  v7 = sub_212807634((uint64_t)a2, &v12);
  if (v12 < 0)
    return 110;
  if (!v7)
  {
    v7 = sub_212807700((uint64_t)a2, &v12);
    if (v12 < 0)
      return 110;
  }
  if (v7)
    v8 = v7;
  else
    v8 = 1380013866;
  *(_DWORD *)(a1 + 144) = v8;
  v11 = 0;
  v6 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)a2 + 80))(a2, v5);
  if (!(_DWORD)v6)
  {
    v9 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 72))(a2);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 520))(a1, v9);
    v6 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 272))(a2);
    if (!(_DWORD)v6)
    {
      v6 = (*(uint64_t (**)(void *, uint64_t *))(*(_QWORD *)a2 + 296))(a2, &v11);
      if ((_DWORD)v6)
      {
        (*(void (**)(void *, _QWORD))(*(_QWORD *)a2 + 280))(a2, 0);
      }
      else
      {
        *(_QWORD *)(a1 + 160) = v11 >> 9;
        sub_2127F8C58(a1, (char *)a2);
      }
    }
  }
  return v6;
}

uint64_t sub_212816B2C(uint64_t a1, const __CFDictionary *a2, int a3, uint64_t a4, int a5, const __CFArray *a6, const __CFURL *a7, char **a8)
{
  const __CFAllocator *v13;
  CFMutableDictionaryRef Mutable;
  _QWORD *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  unsigned int v19;
  char **v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t *v28;
  uint64_t v29;
  double v30;
  CFURLRef v31;
  const __CFAllocator *v32;
  CFNumberRef v33;
  CFNumberRef v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  const __CFArray *v39;
  const __CFArray *v40;
  CFIndex Count;
  CFIndex v42;
  CFIndex i;
  const __CFURL *v44;
  BOOL v45;
  char *v46;
  CFIndex v48;
  uint64_t v49;
  float v50;
  const __CFString *ValueAtIndex;
  const __CFString *v52;
  CFTypeID TypeID;
  int v54;
  const __CFString *v55;
  CFStringRef v56;
  uint64_t *v57;
  uint64_t v58;
  int v59;
  int *v60;
  int v61;
  BOOL v62;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFIndex v69;
  uint64_t v70;
  int v71;
  uint64_t *v72;
  _QWORD *v74;
  int v75;
  void *v76;
  const __CFAllocator *allocator;
  unint64_t v80;
  uint64_t v81;
  uint64_t valuePtr;
  char *v83;
  char *v84;

  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v84 = 0;
  valuePtr = 0;
  v83 = 0;
  v15 = (_QWORD *)operator new();
  sub_21280F7DC(v15);
  allocator = v13;
  v16 = malloc_type_malloc(0x40000uLL, 0x77D125D6uLL);
  v17 = v16;
  if (a3 == 1430541391)
    v18 = CFSTR("cdr");
  else
    v18 = CFSTR("dmg");
  v71 = a5;
  if (a5 < 1)
  {
    v22 = 0;
    v23 = 0;
    v30 = 100.0;
  }
  else
  {
    v19 = a5;
    v74 = v15;
    v76 = v16;
    v20 = a8;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = v19;
    do
    {
      v25 = *(uint64_t **)(a4 + 8 * v21);
      if (!v25)
        goto LABEL_100;
      if (!*v25)
      {
        LODWORD(v25) = 0;
LABEL_100:
        v31 = 0;
        v36 = 22;
        a8 = v20;
        v15 = v74;
        goto LABEL_103;
      }
      nullsub_4(*(_QWORD *)(a4 + 8 * v21));
      v26 = *v25;
      v27 = *(_DWORD *)(*v25 + 200);
      if (v27)
      {
        v28 = (uint64_t *)(v26 + 220);
        do
        {
          v29 = *v28;
          v28 += 5;
          v22 += v29;
          --v27;
        }
        while (v27);
      }
      v23 += *(_QWORD *)(v26 + 16);
      ++v21;
    }
    while (v21 != v24);
    if (v23)
      v30 = (double)(v23 - v22) * 100.0 / (double)v23;
    else
      v30 = 100.0;
    a8 = v20;
    v15 = v74;
    v17 = v76;
  }
  v31 = sub_2127FE518(a7, v18, 0);
  if (!v31)
  {
    LODWORD(v25) = 0;
    v36 = 999;
    goto LABEL_28;
  }
  sub_21280F7EC((uint64_t)v15);
  (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
  sub_2127F0E84(Mutable, a2, 1uLL);
  valuePtr = v23 << 9;
  v32 = allocator;
  v33 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("max-size"), v33);
  if (v33)
    CFRelease(v33);
  valuePtr = 0;
  v34 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("size"), v34);
  if (v34)
    CFRelease(v34);
  v35 = sub_2127FE66C((uint64_t)v31, (uint64_t)Mutable, 7u, 0, 0, &v84, 0);
  if ((_DWORD)v35)
  {
    v36 = v35;
    LODWORD(v25) = 0;
    goto LABEL_28;
  }
  LODWORD(v25) = 1;
  v37 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)v84 + 168))(v84, 1);
  if ((_DWORD)v37 || (v37 = (*(uint64_t (**)(char *))(*(_QWORD *)v84 + 272))(v84), (_DWORD)v37))
  {
    v36 = v37;
    goto LABEL_28;
  }
  v76 = v17;
  if (Mutable)
    CFRelease(Mutable);
  valuePtr = 0;
  if (v71 >= 1)
  {
    v48 = 0;
    v49 = 0;
    v50 = (float)v22;
    v70 = v71;
    while (1)
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a6, v48);
      if (!ValueAtIndex || (v52 = ValueAtIndex, TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v52)))
        v52 = &stru_24CE2CFF0;
      v54 = DIGetBundleRef();
      v55 = (const __CFString *)sub_21281FFEC(v54, (int)CFSTR("Reading %1$@\\U2026"), CFSTR("Reading %1$@\\U2026"));
      v56 = CFStringCreateWithFormat(v32, 0, v55, v52);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v56, 16);
      if (v56)
        CFRelease(v56);
      if (v55)
        CFRelease(v55);
      v57 = *(uint64_t **)(a4 + 8 * v48);
      if (!v57 || !*v57)
      {
        Mutable = 0;
        v36 = 22;
        goto LABEL_102;
      }
      nullsub_4(*(_QWORD *)(a4 + 8 * v48));
      v58 = *v57;
      if (*(_DWORD *)(*v57 + 200))
        break;
LABEL_94:
      if (++v48 == v70)
        goto LABEL_95;
    }
    v72 = v57;
    v59 = 0;
    v60 = (int *)(v58 + 204);
    while (1)
    {
      v75 = v59;
      v61 = *v60;
      v62 = !*v60 || v61 == 0x7FFFFFFF;
      if (!v62 && v61 != 2)
        break;
      v64 = (*(uint64_t (**)(char *, _QWORD))(*(_QWORD *)v84 + 312))(v84, (*(_QWORD *)(v58 + 8) + *((_QWORD *)v60 + 1) + *((_QWORD *)v60 + 2)) << 9);
      if ((_DWORD)v64)
      {
        v36 = v64;
        Mutable = 0;
        goto LABEL_102;
      }
      valuePtr += *((_QWORD *)v60 + 2);
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 352))(a1) & 1) != 0)
      {
        Mutable = 0;
        v36 = 111;
        goto LABEL_102;
      }
LABEL_83:
      v59 = v75 + 1;
      v60 += 10;
      v58 = *v72;
      if ((v75 + 1) >= *(_DWORD *)(*v72 + 200))
        goto LABEL_94;
    }
    v69 = v48;
    v65 = *((_QWORD *)v60 + 2);
    v66 = *(_QWORD *)(v58 + 8) + *((_QWORD *)v60 + 1);
    v80 = 0;
    while (1)
    {
      if (!v65)
      {
        valuePtr += *((_QWORD *)v60 + 2);
        v32 = allocator;
        v48 = v69;
        goto LABEL_83;
      }
      v67 = v65 >= 512 ? 512 : v65;
      v81 = v67;
      v68 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 48))(a1, v66);
      if ((_DWORD)v68)
        break;
      v68 = (*(uint64_t (**)(char *, uint64_t, uint64_t, unint64_t *, void *))(*(_QWORD *)v84 + 336))(v84, v66 << 9, v81 << 9, &v80, v76);
      if ((_DWORD)v68)
        break;
      v81 = v80 >> 9;
      v65 -= v80 >> 9;
      v49 += v80 >> 9;
      v66 += v80 >> 9;
      (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, (float)((float)v49 * 100.0) / v50);
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 352))(a1))
      {
        v36 = 111;
        goto LABEL_101;
      }
    }
    v36 = v68;
LABEL_101:
    Mutable = 0;
    valuePtr += *((_QWORD *)v60 + 2);
LABEL_102:
    LODWORD(v25) = 1;
    goto LABEL_103;
  }
LABEL_95:
  (*(void (**)(char *, _QWORD))(*(_QWORD *)v84 + 280))(v84, 0);
  sub_21280F7F8((uint64_t)v15);
  sub_212817380(a1, (uint64_t)v15, v30);
  v36 = sub_212807018((uint64_t)v84, (uint64_t)a2, &v83, 0);
  Mutable = 0;
  LODWORD(v25) = 1;
  if ((_DWORD)v36)
  {
LABEL_103:
    v17 = v76;
    goto LABEL_28;
  }
  v17 = v76;
  if (v84)
  {
    DIDiskImageObjectRelease(v84);
    Mutable = 0;
    v36 = 0;
    v84 = 0;
  }
LABEL_28:
  (*(void (**)(_QWORD *))(*v15 + 8))(v15);
  if (v17)
    free(v17);
  if (Mutable)
    CFRelease(Mutable);
  if (v31)
    CFRelease(v31);
  if ((_DWORD)v36)
  {
    v38 = v84 ? (int)v25 : 0;
    if (v38 == 1)
    {
      v39 = (const __CFArray *)(*(uint64_t (**)(char *))(*(_QWORD *)v84 + 216))(v84);
      if (v39)
      {
        v40 = v39;
        CFRetain(v39);
        if (v84)
        {
          DIDiskImageObjectRelease(v84);
          v84 = 0;
        }
        Count = CFArrayGetCount(v40);
        if (Count >= 1)
        {
          v42 = Count;
          for (i = 0; i != v42; ++i)
          {
            v44 = (const __CFURL *)CFArrayGetValueAtIndex(v40, i);
            sub_21280DC50(v44);
          }
        }
        CFRelease(v40);
      }
      if (v84)
      {
        DIDiskImageObjectRelease(v84);
        v84 = 0;
      }
    }
  }
  if ((_DWORD)v36)
    v45 = 1;
  else
    v45 = a8 == 0;
  v46 = v83;
  if (v45 && v83)
  {
    DIDiskImageObjectRelease(v83);
    v46 = 0;
  }
  if (a8)
    *a8 = v46;
  return v36;
}

void sub_212817250(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x1081C40C16B1325);
  _Unwind_Resume(a1);
}

void sub_212817274(uint64_t a1, __CFArray *a2)
{
  BOOL v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *value;
  io_iterator_t iterator;

  iterator = 0;
  if (!IOObjectConformsTo(a1, "IOMedia")
    || ((value = 0,
         !IORegistryEntryCreateCFProperties(a1, (CFMutableDictionaryRef *)&value, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0))? (v4 = value == 0): (v4 = 1), v4|| (CFArrayAppendValue(a2, value), v5 = sub_2127F2A48((const __CFDictionary *)value, CFSTR("Leaf"), 0), CFRelease(value), !v5)))
  {
    if (!MEMORY[0x212BF42F8](a1, "IOService", &iterator))
    {
      if (!IOIteratorIsValid(iterator))
        MEMORY[0x212BF42BC](iterator);
      v6 = IOIteratorNext(iterator);
      if ((_DWORD)v6)
      {
        v7 = v6;
        do
        {
          sub_212817274(v7, a2);
          IOObjectRelease(v7);
          v7 = IOIteratorNext(iterator);
        }
        while ((_DWORD)v7);
      }
      if (iterator)
        IOObjectRelease(iterator);
    }
  }
}

void sub_212817380(uint64_t a1, uint64_t a2, double a3)
{
  int v6;
  const __CFString *v7;
  CFStringRef v8;
  const __CFAllocator *v9;
  CFStringRef v10;
  double v11;
  double v12;
  unsigned int v13;
  uint64_t v14;
  double v15;
  int v16;
  const __CFString *v17;
  CFStringRef v18;
  int v19;
  const __CFString *v20;
  CFStringRef v21;

  v6 = DIGetBundleRef();
  v7 = (const __CFString *)sub_21281FFEC(v6, (int)CFSTR("Elapsed Time: %1$@"), CFSTR("Elapsed Time: %1$@"));
  v8 = sub_212816610(a2);
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v10 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v7, v8);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v10, 8);
  if (v10)
    CFRelease(v10);
  if (v7)
    CFRelease(v7);
  if (v8)
    CFRelease(v8);
  v11 = (100.0 - a3)
      * (double)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1)
      / 100.0
      * 512.0
      * 1000000000.0;
  v12 = v11 / (double)(unint64_t)sub_21280F804(a2);
  if (v12 >= 1024.0)
    v13 = 75;
  else
    v13 = 32;
  if (v12 >= 1024.0)
    v12 = v12 * 0.0009765625;
  if (v12 >= 1024.0)
  {
    v13 = 77;
    v12 = v12 * 0.0009765625;
  }
  if (v12 >= 1024.0)
    v14 = 71;
  else
    v14 = v13;
  if (v12 >= 1024.0)
    v15 = v12 * 0.0009765625;
  else
    v15 = v12;
  v16 = DIGetBundleRef();
  v17 = (const __CFString *)sub_21281FFEC(v16, (int)CFSTR("Speed: %1$.1f%2$cB/s"), CFSTR("Speed: %1$.1f%2$cB/s"));
  v18 = CFStringCreateWithFormat(v9, 0, v17, *(_QWORD *)&v15, v14);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v18, 8);
  if (v18)
    CFRelease(v18);
  if (v17)
    CFRelease(v17);
  v19 = DIGetBundleRef();
  v20 = (const __CFString *)sub_21281FFEC(v19, (int)CFSTR("Savings: %1$.1f%%"), CFSTR("Savings: %1$.1f%%"));
  v21 = CFStringCreateWithFormat(v9, 0, v20, *(_QWORD *)&a3);
  (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v21, 8);
  if (v21)
    CFRelease(v21);
  if (v20)
    CFRelease(v20);
}

uint64_t sub_2128175E0(uint64_t *a1, char *a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;

  sub_2127F8C58((uint64_t)a1, a2);
  v4 = sub_2127F8C98((uint64_t)a1);
  v5 = sub_21280AE2C(a2, a1 + 20, v4 ^ 1u);
  if (!(_DWORD)v5)
  {
    v6 = (*(uint64_t (**)(char *))(*(_QWORD *)a2 + 72))(a2);
    (*(void (**)(uint64_t *, uint64_t))(*a1 + 520))(a1, v6);
  }
  return v5;
}

uint64_t sub_212817654()
{
  return 1936749171;
}

uint64_t sub_212817660(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = (*(uint64_t (**)(_QWORD *))(*a1 + 112))(a1);
  result = 22;
  if (a2 && v4 >= a2)
  {
    v6 = a1[20];
    if (v6)
      return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 56))(v6, a2);
    else
      return 999;
  }
  return result;
}

uint64_t sub_2128176C4(const __CFURL *a1, char *a2, const __CFDictionary *a3, _QWORD *a4)
{
  int v8;
  const __CFNumber *v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  void ***v14;
  void *value;
  uint64_t v16;
  CFTypeRef v17;
  CFTypeRef cf;
  int v19;
  void *v20;
  char *v21;
  int valuePtr;

  valuePtr = 8;
  v20 = 0;
  v21 = 0;
  v19 = 0;
  v17 = 0;
  cf = 0;
  v16 = -1;
  if (!a2)
    goto LABEL_7;
  DIDiskImageObjectRetain_0(a2);
  if (!a3 || !sub_2127FEC8C(a3, CFSTR("convert-image-type"), 0))
    goto LABEL_7;
  v8 = sub_2127F2A48(a3, CFSTR("convert-add-partition-map"), 0);
  v9 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("convert-alignment"));
  if (v9)
    CFNumberGetValue(v9, kCFNumberIntType, &valuePtr);
  if (v8)
  {
LABEL_7:
    v10 = 22;
    goto LABEL_8;
  }
  value = 0;
  if (!CFDictionaryGetValueIfPresent(a3, CFSTR("udif-chunk-size"), (const void **)&value))
    goto LABEL_18;
  if (!sub_212806A98((const __CFString *)value, kCFNumberSInt64Type, &v16))
  {
    v10 = 999;
    goto LABEL_8;
  }
  v12 = v16;
  if (v16 < 0)
  {
LABEL_18:
    v12 = 2048;
    v16 = 2048;
  }
  v13 = sub_21281E81C(a2, 1u, 1, v12, (__CFDictionary **)&v17, (void ****)&v20, &v19, (__CFArray **)&cf, 1);
  v14 = (void ***)v20;
  if (!(_DWORD)v13)
  {
    v10 = sub_21281787C((uint64_t)a2, a3, (uint64_t)v20, v19, (const __CFArray *)cf, a1, &v21);
    v14 = (void ***)v20;
    if (!v20)
      goto LABEL_8;
    goto LABEL_23;
  }
  v10 = v13;
  if (v20)
LABEL_23:
    sub_21280F418(v14, v19);
LABEL_8:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v17)
  {
    CFRelease(v17);
    v17 = 0;
  }
  if (a2)
    DIDiskImageObjectRelease(a2);
  *a4 = v21;
  return v10;
}

uint64_t sub_21281787C(uint64_t a1, const __CFDictionary *a2, uint64_t a3, int a4, const __CFArray *a5, const __CFURL *a6, char **a7)
{
  CFMutableDictionaryRef Mutable;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  _QWORD *v21;
  int v22;
  BOOL v23;
  double v25;
  CFNumberRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  float v30;
  CFIndex v31;
  const __CFString *ValueAtIndex;
  const __CFString *v33;
  CFTypeID TypeID;
  int v35;
  const __CFString *v36;
  CFStringRef v37;
  uint64_t *v38;
  uint64_t v39;
  unsigned int v40;
  int *v41;
  int v42;
  BOOL v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  const __CFString *v50;
  CFStringRef v51;
  CFStringRef v52;
  double v53;
  double v54;
  unsigned int v55;
  uint64_t v56;
  double v57;
  int v58;
  const __CFString *v59;
  CFStringRef v60;
  int v61;
  const __CFString *v62;
  CFStringRef v63;
  char *v64;
  char v65;
  uint64_t v66;
  const __CFArray *v67;
  const __CFArray *v68;
  CFIndex Count;
  CFIndex v70;
  CFIndex i;
  const __CFURL *v72;
  BOOL v73;
  uint64_t v75;
  const __CFURL *v76;
  CFIndex v77;
  _QWORD *v79;
  char **v80;
  const __CFAllocator *allocator;
  void *v82;
  uint64_t v83;
  uint64_t valuePtr;
  char *v85;

  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v85 = 0;
  v14 = (_QWORD *)operator new();
  sub_21280F7DC(v14);
  v82 = malloc_type_malloc(0x40000uLL, 0xC94C817CuLL);
  valuePtr = 0;
  v80 = a7;
  if (a4 < 1)
  {
    v16 = 0;
    v25 = 100.0;
  }
  else
  {
    v76 = a6;
    v79 = v14;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = *(_QWORD *)(a3 + 8 * v15);
      if (!v18)
      {
        v28 = 4294967246;
        goto LABEL_93;
      }
      if (!*(_QWORD *)v18)
      {
        LOBYTE(v18) = 0;
        v28 = 4294967187;
        goto LABEL_93;
      }
      nullsub_4(*(_QWORD *)(a3 + 8 * v15));
      v19 = *(_QWORD *)v18;
      v20 = *(_DWORD *)(*(_QWORD *)v18 + 200);
      if (v20)
      {
        v21 = (_QWORD *)(v19 + 220);
        do
        {
          v22 = *((_DWORD *)v21 - 4);
          if (v22)
            v23 = v22 == 2;
          else
            v23 = 1;
          if (!v23 && v22 != 0x7FFFFFFF)
            v16 += *v21;
          v21 += 5;
          --v20;
        }
        while (v20);
      }
      v17 += *(_QWORD *)(v19 + 16);
      valuePtr = v17;
      ++v15;
    }
    while (v15 != a4);
    if (v17)
      v25 = (double)(v17 - v16) * 100.0 / (double)v17;
    else
      v25 = 100.0;
    a7 = v80;
    a6 = v76;
  }
  sub_21280F7EC((uint64_t)v14);
  (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
  sub_2127F0E84(Mutable, a2, 1uLL);
  v26 = CFNumberCreate(allocator, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("blockcount"), v26);
  if (v26)
    CFRelease(v26);
  v27 = sub_21280D070(a6, Mutable, 0, 0, &v85, 0);
  if ((_DWORD)v27)
  {
    v28 = v27;
    LOBYTE(v18) = 0;
  }
  else
  {
    if (Mutable)
      CFRelease(Mutable);
    if (a4 < 1)
    {
LABEL_62:
      sub_21280F7F8((uint64_t)v14);
      v49 = DIGetBundleRef();
      v50 = (const __CFString *)sub_21281FFEC(v49, (int)CFSTR("Elapsed Time: %1$@"), CFSTR("Elapsed Time: %1$@"));
      v51 = sub_212816610((uint64_t)v14);
      v52 = CFStringCreateWithFormat(allocator, 0, v50, v51);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v52, 8);
      if (v52)
        CFRelease(v52);
      if (v50)
        CFRelease(v50);
      if (v51)
        CFRelease(v51);
      v53 = (100.0 - v25)
          * (double)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1)
          / 100.0
          * 512.0
          * 1000000000.0;
      v54 = v53 / (double)(unint64_t)sub_21280F804((uint64_t)v14);
      if (v54 >= 1024.0)
        v55 = 75;
      else
        v55 = 32;
      if (v54 >= 1024.0)
        v54 = v54 * 0.0009765625;
      if (v54 >= 1024.0)
      {
        v55 = 77;
        v54 = v54 * 0.0009765625;
      }
      if (v54 >= 1024.0)
        v56 = 71;
      else
        v56 = v55;
      if (v54 >= 1024.0)
        v57 = v54 * 0.0009765625;
      else
        v57 = v54;
      v58 = DIGetBundleRef();
      v59 = (const __CFString *)sub_21281FFEC(v58, (int)CFSTR("Speed: %1$.1f%2$cB/s"), CFSTR("Speed: %1$.1f%2$cB/s"));
      v60 = CFStringCreateWithFormat(allocator, 0, v59, *(_QWORD *)&v57, v56);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v60, 8);
      if (v60)
        CFRelease(v60);
      if (v59)
        CFRelease(v59);
      v61 = DIGetBundleRef();
      v62 = (const __CFString *)sub_21281FFEC(v61, (int)CFSTR("Savings: %1$.1f%%"), CFSTR("Savings: %1$.1f%%"));
      v63 = CFStringCreateWithFormat(allocator, 0, v62, *(_QWORD *)&v25);
      (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v63, 8);
      if (v63)
        CFRelease(v63);
      if (v62)
        CFRelease(v62);
      Mutable = 0;
      v28 = 0;
      LOBYTE(v18) = 1;
LABEL_90:
      a7 = v80;
    }
    else
    {
      v29 = 0;
      v30 = (float)v16;
      v31 = 0;
      v75 = a4;
      v79 = v14;
      while (1)
      {
        ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a5, v31);
        if (!ValueAtIndex || (v33 = ValueAtIndex, TypeID = CFStringGetTypeID(), TypeID != CFGetTypeID(v33)))
          v33 = &stru_24CE2CFF0;
        v35 = DIGetBundleRef();
        v36 = (const __CFString *)sub_21281FFEC(v35, (int)CFSTR("Reading %1$@\\U2026"), CFSTR("Reading %1$@\\U2026"));
        v37 = CFStringCreateWithFormat(allocator, 0, v36, v33);
        (*(void (**)(uint64_t, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v37, 16);
        if (v37)
          CFRelease(v37);
        if (v36)
          CFRelease(v36);
        v38 = *(uint64_t **)(a3 + 8 * v31);
        if (!v38)
        {
          Mutable = 0;
          LOBYTE(v18) = 1;
          v28 = 4294967246;
          goto LABEL_90;
        }
        if (!*v38)
        {
          Mutable = 0;
          LOBYTE(v18) = 1;
          v28 = 4294967187;
          goto LABEL_90;
        }
        v77 = v31;
        nullsub_4(v38);
        v39 = *v38;
        if (*(_DWORD *)(*v38 + 200))
          break;
LABEL_61:
        v31 = v77 + 1;
        if (v77 + 1 == v75)
          goto LABEL_62;
      }
      v40 = 0;
      v41 = (int *)(v39 + 204);
      while (1)
      {
        v42 = *v41;
        v43 = !*v41 || v42 == 0x7FFFFFFF;
        if (!v43 && v42 != 2)
          break;
        if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 352))(a1) & 1) != 0)
        {
          Mutable = 0;
          LOBYTE(v18) = 1;
          v28 = 111;
          goto LABEL_90;
        }
LABEL_50:
        ++v40;
        v41 += 10;
        v39 = *v38;
        if (v40 >= *(_DWORD *)(*v38 + 200))
          goto LABEL_61;
      }
      v45 = *((_QWORD *)v41 + 2);
      v46 = *(_QWORD *)(v39 + 8) + *((_QWORD *)v41 + 1);
      while (1)
      {
        if (!v45)
        {
          v14 = v79;
          goto LABEL_50;
        }
        v47 = v45 >= 512 ? 512 : v45;
        v83 = v47;
        v48 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 48))(a1, v46);
        if ((_DWORD)v48)
          break;
        v48 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t *, void *))(*(_QWORD *)v85 + 64))(v85, v46, v83, &v83, v82);
        if ((_DWORD)v48)
          break;
        v45 -= v83;
        v29 += v83;
        v46 += v83;
        (*(void (**)(uint64_t, float))(*(_QWORD *)a1 + 344))(a1, (float)((float)v29 * 100.0) / v30);
        if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 352))(a1))
        {
          v28 = 111;
          goto LABEL_92;
        }
      }
      v28 = v48;
LABEL_92:
      Mutable = 0;
      LOBYTE(v18) = 1;
LABEL_93:
      v14 = v79;
      a7 = v80;
    }
  }
  (*(void (**)(_QWORD *))(*v14 + 8))(v14);
  if (v82)
    free(v82);
  if (Mutable)
    CFRelease(Mutable);
  v64 = v85;
  v65 = v18 ^ 1;
  if (!(_DWORD)v28)
    v65 = 1;
  if ((v65 & 1) != 0 || !v85)
  {
    if ((_DWORD)v28)
      v73 = 1;
    else
      v73 = a7 == 0;
    if (!v73 || !v85)
    {
      if (a7)
        goto LABEL_122;
      return v28;
    }
  }
  else
  {
    v66 = (*(uint64_t (**)(void))(*(_QWORD *)v85 + 296))();
    if (v66)
    {
      v67 = (const __CFArray *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v66 + 216))(v66);
      if (v67)
      {
        v68 = v67;
        CFRetain(v67);
        if (v85)
        {
          DIDiskImageObjectRelease(v85);
          v85 = 0;
        }
        Count = CFArrayGetCount(v68);
        if (Count >= 1)
        {
          v70 = Count;
          for (i = 0; i != v70; ++i)
          {
            v72 = (const __CFURL *)CFArrayGetValueAtIndex(v68, i);
            sub_21280DC50(v72);
          }
        }
        CFRelease(v68);
      }
    }
    v64 = v85;
    if (!v85)
    {
      if (!a7)
        return v28;
      goto LABEL_120;
    }
  }
  DIDiskImageObjectRelease(v64);
  if (a7)
  {
LABEL_120:
    v64 = 0;
LABEL_122:
    *a7 = v64;
  }
  return v28;
}

void sub_212818030(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x1081C40C16B1325);
  _Unwind_Resume(a1);
}

uint64_t sub_212818054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  unsigned int v10;

  v10 = 0;
  v6 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 160))(*(_QWORD *)(a1 + 160));
  if (!(_DWORD)v6)
  {
    v9 = v10;
    v7 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 64))(*(_QWORD *)(a1 + 160)) * v9;
    if (!a4)
      return v6;
    goto LABEL_3;
  }
  v7 = 0;
  if (a4)
LABEL_3:
    *a4 = v7;
  return v6;
}

uint64_t sub_2128180DC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 160) + 168))(*(_QWORD *)(a1 + 160), a1);
}

uint64_t sub_2128180F0(uint64_t a1, void ***a2)
{
  void **v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  if (!a2)
  {
    sub_212820098(0);
    return 22;
  }
  *a2 = 0;
  v4 = (void **)sub_212820064(204);
  v5 = sub_21281FFF4();
  if (!(_DWORD)v5)
  {
    *(_QWORD *)*v4 = 0x16D697368;
    v18 = 0;
    v17 = 0;
    v8 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 160) + 48))(*(_QWORD *)(a1 + 160));
    if (!v8)
    {
LABEL_18:
      v16 = sub_212818260((uint64_t)v4, -1, 0);
LABEL_19:
      v6 = v16;
      if (!(_DWORD)v16)
        goto LABEL_5;
      goto LABEL_4;
    }
    v9 = v8;
    v10 = 0;
    v11 = -1;
    while (1)
    {
      v5 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, char *))(**(_QWORD **)(a1 + 160) + 24))(*(_QWORD *)(a1 + 160), v10, v9, &v18, &v17);
      if ((_DWORD)v5)
        break;
      if (v17)
        v12 = 1;
      else
        v12 = 2;
      v13 = v18;
      if (v12 == v11)
      {
        v14 = *v4;
        v14[2] = *((_QWORD *)*v4 + 2) + v18;
        v15 = &v14[5 * *((unsigned int *)v14 + 50)];
        *(_QWORD *)((char *)v15 + 180) += v13;
      }
      else
      {
        v16 = sub_212818260((uint64_t)v4, v12, v18);
        v11 = v12;
        if ((_DWORD)v16)
          goto LABEL_19;
      }
      v10 += v18;
      v9 -= v18;
      if (!v9)
        goto LABEL_18;
    }
  }
  v6 = v5;
LABEL_4:
  sub_212820098(v4);
  v4 = 0;
LABEL_5:
  *a2 = v4;
  return v6;
}

uint64_t sub_212818260(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_21282012C();
  nullsub_4(a1);
  v6 = sub_212820120(a1);
  v7 = sub_21281FFF4();
  if ((_DWORD)v7)
  {
    v8 = v7;
  }
  else
  {
    sub_2128200C8(a1, v6 + 40);
    v8 = sub_21281FFF4();
    if (!(_DWORD)v8)
    {
      v9 = *(_QWORD *)a1;
      v10 = *(_DWORD *)(*(_QWORD *)a1 + 200);
      *(_DWORD *)(v9 + 200) = v10 + 1;
      v11 = v9 + 40 * v10;
      *(_OWORD *)(v11 + 208) = 0u;
      *(_OWORD *)(v11 + 224) = 0u;
      *(_DWORD *)(v11 + 240) = 0;
      *(_DWORD *)(v11 + 204) = a2;
      *(_QWORD *)(v11 + 220) = a3;
      v12 = *(_QWORD *)a1;
      v13 = *(_QWORD *)(*(_QWORD *)a1 + 16);
      *(_QWORD *)(v11 + 212) = v13;
      *(_QWORD *)(v12 + 16) = v13 + a3;
    }
  }
  nullsub_4(a1);
  return v8;
}

uint64_t sub_212818328()
{
  return 0;
}

BOOL sub_212818334(uint64_t a1)
{
  int v1;

  if (*(_DWORD *)a1 != 1936749171)
    return 0;
  if (!*(_DWORD *)(a1 + 8))
    return 0;
  v1 = *(_DWORD *)(a1 + 4);
  if ((v1 - 1) > 2)
    return 0;
  if ((v1 - 1) >= 2)
    return v1 != 3 || *(_QWORD *)(a1 + 28);
  return *(_DWORD *)(a1 + 16) != 0;
}

void sub_212818390(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vsyslog(5, a1, va);
}

uint64_t sub_2128183C0(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v10;

  v6 = ((uint64_t (*)(_QWORD **))(*a1)[10])(a1);
  v10 = 0;
  v7 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t *, uint64_t))(*a1[3] + 328))(a1[3], a2, v6, &v10, a3);
  if (!(_DWORD)v7)
  {
    v8 = ((uint64_t (*)(_QWORD **))(*a1)[12])(a1);
    sub_21281D854(a3, v8);
  }
  return v7;
}

uint64_t sub_21281844C(uint64_t a1, uint64_t a2, int a3)
{
  FILE **v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  FILE *v10;

  v6 = (FILE **)MEMORY[0x24BDAC8D8];
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "index node %p\n", (const void *)a2);
  fprintf(*v6, "   fSignature           %4.4s\n", (const char *)a2);
  fprintf(*v6, "   fIndexNodeNumber     %u\n", *(_DWORD *)(a2 + 4));
  fprintf(*v6, "   fNextIndexNodeOffset 0x%016qX (%qd)\n", *(_QWORD *)(a2 + 12), *(_QWORD *)(a2 + 12));
  result = fprintf(*v6, "   fFlags               0x%08X\n", *(_DWORD *)(a2 + 8));
  if (a3)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
    if ((_DWORD)result)
    {
      v8 = 0;
      v9 = a2 + 56;
      do
      {
        if (*(_DWORD *)(v9 + 4 * v8))
        {
          fprintf(*v6, "   fBandNumber[%3d]     ", v8);
          v10 = *v6;
          if (*(_DWORD *)(v9 + 4 * v8) == -1)
            fwrite("(spare)\n", 8uLL, 1uLL, v10);
          else
            fprintf(v10, "%u\n", *(_DWORD *)(v9 + 4 * v8));
        }
        ++v8;
        result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
      }
      while (v8 < result);
    }
  }
  return result;
}

uint64_t sub_2128185A8(_QWORD **a1, uint64_t a2, const void *a3)
{
  size_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;

  v6 = ((uint64_t (*)(_QWORD **))(*a1)[10])(a1);
  v7 = malloc_type_malloc(v6, 0xFF56DE4CuLL);
  if (!v7)
    return 12;
  v8 = v7;
  v12 = 0;
  memmove(v7, a3, v6);
  v9 = ((uint64_t (*)(_QWORD **))(*a1)[12])(a1);
  sub_21281D854((uint64_t)v8, v9);
  v10 = (*(uint64_t (**)(_QWORD *, uint64_t, size_t, uint64_t *, void *))(*a1[3] + 336))(a1[3], a2, v6, &v12, v8);
  free(v8);
  return v10;
}

uint64_t sub_21281866C(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v3 = *(_QWORD *)(a1 + 112);
  result = sub_21280D9F8(a1, v3 + v2);
  if ((_DWORD)result)
    return result;
  v5 = *(void **)(a1 + 80);
  if (!v5)
  {
    v7 = (char *)malloc_type_malloc(v2, 0xDE16A9B1uLL);
    *(_QWORD *)(a1 + 80) = v7;
    if (v7)
      goto LABEL_6;
    return 12;
  }
  v6 = (char *)malloc_type_realloc(v5, v2 * (*(_DWORD *)(a1 + 32) + 1), 0xEDBD7A32uLL);
  if (!v6)
    return 12;
  v7 = v6;
  *(_QWORD *)(a1 + 80) = v6;
LABEL_6:
  v8 = *(unsigned int *)(a1 + 32);
  *(_DWORD *)(a1 + 32) = v8 + 1;
  if ((_DWORD)v8 == -1)
    v9 = 0;
  else
    v9 = &v7[(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v8];
  v15 = 0;
  bzero(v9, v2);
  v10 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)v9 = 1936749171;
  *((_DWORD *)v9 + 1) = v10 - 1;
  if (v10 < 2)
  {
    v14 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(v14 + 20) = v3;
    v13 = (_DWORD *)(v14 + 12);
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 80);
    v12 = v11 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v10 - 2);
    *(_QWORD *)(v12 + 12) = v3;
    v13 = (_DWORD *)(v12 + 8);
  }
  *v13 |= 1u;
  result = (*(uint64_t (**)(_QWORD, uint64_t, size_t, uint64_t *, char *))(**(_QWORD **)(a1 + 24) + 336))(*(_QWORD *)(a1 + 24), v3, v2, &v15, v9);
  if (!(_DWORD)result)
  {
    *((_DWORD *)v9 + 2) &= ~1u;
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
  }
  return result;
}

uint64_t sub_2128187EC(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v23;
  uint64_t v24;
  BOOL v25;
  unsigned int v26;
  unsigned int i;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  uint64_t v40;
  BOOL v41;

  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  *a4 = 0;
  if (a2 >= a3)
    return 0;
  v9 = v8;
  if (a2 % v8)
    a2 = (v8 + a2) / v8 * v8;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 136))(a1, a2);
  if (*(_QWORD *)(a1 + 40) == a3)
  {
    if (a3 % v9)
      v11 = v9;
    else
      v11 = 0;
    a3 = (v11 + a3) / v9 * v9;
  }
  v12 = a3 / v9 * v9;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 136))(a1, v12 - 1);
  if (v12 - a2 < v9 || v10 > v13)
    return 0;
  v16 = v13;
  v17 = *(_QWORD *)(a1 + 72);
  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1))
  {
    v18 = 0;
    v19 = v17 + 64;
    do
    {
      v20 = *(_DWORD *)(v19 + 4 * v18);
      if (v20 + 1 >= 2 && v20 >= v10 && v20 <= v16)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 72) + 12) |= 1u;
        v23 = *(_DWORD *)(v19 + 4 * v18);
        v24 = *(_QWORD *)(a1 + 8);
        if (v23)
          v25 = v24 == 0;
        else
          v25 = 1;
        if (!v25 && *(_DWORD *)(a1 + 16) >= v23)
          *(_QWORD *)(v24 + 8 * (v23 - 1)) = 0;
        *(_DWORD *)(v19 + 4 * v18) = -1;
        ++*a4;
      }
      ++v18;
    }
    while (v18 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1));
  }
  v26 = *(_DWORD *)(a1 + 32);
  if (v26)
  {
    for (i = 1; i <= v26; ++i)
    {
      v28 = i - 1;
      v29 = *(_QWORD *)(a1 + 80);
      if (v26 <= v28 || v29 == 0)
        v31 = 0;
      else
        v31 = v29 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v28;
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
      {
        v32 = 0;
        v33 = v31 + 56;
        do
        {
          v34 = *(_DWORD *)(v33 + 4 * v32);
          if (v34 + 1 >= 2 && v34 >= v10 && v34 <= v16)
          {
            v37 = *(_QWORD *)(a1 + 80);
            v38 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
            *(_DWORD *)(v37 + v38 * v28 + 8) |= 1u;
            v39 = *(_DWORD *)(v33 + 4 * v32);
            v40 = *(_QWORD *)(a1 + 8);
            if (v39)
              v41 = v40 == 0;
            else
              v41 = 1;
            if (!v41 && *(_DWORD *)(a1 + 16) >= v39)
              *(_QWORD *)(v40 + 8 * (v39 - 1)) = 0;
            *(_DWORD *)(v33 + 4 * v32) = -1;
            ++*a4;
          }
          ++v32;
        }
        while (v32 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1));
      }
      v26 = *(_DWORD *)(a1 + 32);
    }
  }
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
}

uint64_t sub_212818AB0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = a1[9];
  v5 = *(_QWORD *)(v4 + 28);
  *(_QWORD *)(v4 + 28) = a2;
  *(_DWORD *)(v4 + 12) |= 1u;
  *(_DWORD *)(v4 + 16) = a2;
  if (v5 > a2)
  {
    v6 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a1 + 160))(a1, a2);
    if ((_DWORD)v6 || (v6 = (*(uint64_t (**)(_QWORD *, _QWORD))(*a1 + 168))(a1, 0), (_DWORD)v6))
    {
      v7 = v6;
      goto LABEL_15;
    }
  }
  v7 = (*(uint64_t (**)(_QWORD *))(*a1 + 120))(a1);
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)a1[3] + 472))(a1[3], 1);
  if ((_DWORD)v7)
  {
LABEL_15:
    v13 = a1[5];
    v14 = a1[9];
    *(_QWORD *)(v14 + 28) = v13;
    *(_DWORD *)(v14 + 16) = v13;
    return v7;
  }
  v8 = a2 / (*(uint64_t (**)(_QWORD *))(*a1 + 64))(a1);
  if (a2 % (*(uint64_t (**)(_QWORD *))(*a1 + 64))(a1))
    v9 = v8 + 1;
  else
    v9 = v8;
  v10 = (char *)malloc_type_realloc((void *)a1[1], 8 * v9, 0x100004000313F17uLL);
  if (!v10)
  {
    v7 = 12;
    goto LABEL_15;
  }
  a1[1] = v10;
  v11 = *((unsigned int *)a1 + 4);
  if (v9 > v11)
    bzero(&v10[8 * v11], 8 * (v9 - v11));
  v7 = 0;
  *((_DWORD *)a1 + 4) = v9;
  a1[5] = a2;
  return v7;
}

uint64_t sub_212818C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int Count;
  unsigned int v6;
  unsigned int v7;
  float v8;
  unsigned int v9;
  unsigned int v10;
  float v11;
  const __CFNumber *ValueAtIndex;
  uint64_t v13;
  uint64_t v14;
  int v15;
  unsigned int valuePtr;
  char v18;
  unsigned int v19;
  CFArrayRef theArray;

  theArray = 0;
  v19 = 0;
  v18 = 0;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, unsigned int *, CFArrayRef *))(*(_QWORD *)a1 + 176))(a1, a2, &v19, &theArray);
  if (!(_DWORD)v4)
  {
    if (v19)
    {
      Count = CFArrayGetCount(theArray);
      v6 = Count;
      if (Count)
      {
        if (v19 >= Count)
          v7 = Count;
        else
          v7 = v19;
        if (a2)
          (*(void (**)(uint64_t, float))(*(_QWORD *)a2 + 344))(a2, 0.0);
        if (v7)
        {
          v9 = v6 - 1;
          v10 = 1;
          v11 = -1.0;
          do
          {
            valuePtr = 0;
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v9);
            CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr);
            v13 = (*(uint64_t (**)(uint64_t, _QWORD, char *))(*(_QWORD *)a1 + 184))(a1, valuePtr, &v18);
            if ((_DWORD)v13)
              goto LABEL_34;
            if (a2 && v18)
            {
              v8 = (float)v7;
              if ((float)((float)((float)((float)v10 * 100.0) / (float)v7) - v11) >= 1.0)
              {
                (*(void (**)(uint64_t, float))(*(_QWORD *)a2 + 344))(a2, (float)((float)v10 * 100.0) / v8);
                v11 = (float)((float)v10 * 100.0) / v8;
              }
              if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 352))(a2) & 1) != 0)
              {
                v15 = 2714;
                goto LABEL_30;
              }
            }
            else if (!v18)
            {
              break;
            }
            ++v10;
            --v9;
          }
          while (v10 <= v7);
        }
      }
    }
    if (a2)
    {
      (*(void (**)(uint64_t, float))(*(_QWORD *)a2 + 344))(a2, 100.0);
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 352))(a2))
      {
        v15 = 2728;
LABEL_30:
        syslog(5, "CSparseFile::compact(): line %d: returning kDI_USERCANCELED", v15);
        v4 = 111;
        goto LABEL_31;
      }
    }
    v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 192))(a1);
    if ((_DWORD)v13)
    {
LABEL_34:
      v4 = v13;
      goto LABEL_31;
    }
    if (a2 && (*(unsigned int (**)(uint64_t))(*(_QWORD *)a2 + 352))(a2))
    {
      v15 = 2739;
      goto LABEL_30;
    }
    v14 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    v4 = v14;
    if (a2 && !(_DWORD)v14)
      (*(void (**)(uint64_t, float))(*(_QWORD *)a2 + 344))(a2, 100.0);
  }
LABEL_31:
  if (theArray)
    CFRelease(theArray);
  return v4;
}

uint64_t sub_212818E54(_QWORD *a1, uint64_t a2, _DWORD *a3, CFMutableArrayRef *a4)
{
  const __CFAllocator *v8;
  CFMutableArrayRef Mutable;
  int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int *v14;
  uint64_t result;
  CFNumberRef v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int *v22;
  CFNumberRef v23;
  CFMutableArrayRef *v24;

  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (a2 && ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 352))(a2) & 1) != 0)
  {
    v10 = 2775;
LABEL_30:
    syslog(5, "CSparseFile::buildSortedBandList(): line %d: returning kDI_USERCANCELED", v10);
    if (Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    v12 = 0;
    result = 111;
    goto LABEL_33;
  }
  v24 = a4;
  v11 = a1[9];
  v12 = 0;
  if ((*(unsigned int (**)(_QWORD *))(*a1 + 88))(a1))
  {
    v13 = 0;
    v14 = (unsigned int *)(v11 + 64);
    do
    {
      result = *v14;
      if ((_DWORD)result == -1)
      {
        ++v12;
      }
      else
      {
        if (!(_DWORD)result)
          goto LABEL_28;
        v16 = CFNumberCreate(v8, kCFNumberSInt32Type, v14);
        CFArrayAppendValue(Mutable, v16);
        CFRelease(v16);
      }
      ++v13;
      ++v14;
    }
    while (v13 < (*(unsigned int (**)(_QWORD *))(*a1 + 88))(a1));
  }
  if (*((_DWORD *)a1 + 8))
  {
    v17 = 1;
    while (!a2 || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 352))(a2) & 1) == 0)
    {
      v18 = a1[10];
      if (v18 && (v19 = (v17 - 1), *((_DWORD *)a1 + 8) > v19))
        v20 = v18 + (*(uint64_t (**)(_QWORD *))(*a1 + 80))(a1) * v19;
      else
        v20 = 0;
      if ((*(unsigned int (**)(_QWORD *))(*a1 + 96))(a1))
      {
        v21 = 0;
        v22 = (unsigned int *)(v20 + 56);
        do
        {
          result = *v22;
          if ((_DWORD)result == -1)
          {
            ++v12;
          }
          else
          {
            if (!(_DWORD)result)
              goto LABEL_28;
            v23 = CFNumberCreate(v8, kCFNumberSInt32Type, v22);
            CFArrayAppendValue(Mutable, v23);
            CFRelease(v23);
          }
          ++v21;
          ++v22;
        }
        while (v21 < (*(unsigned int (**)(_QWORD *))(*a1 + 96))(a1));
      }
      if (++v17 > *((_DWORD *)a1 + 8))
        goto LABEL_27;
    }
    v10 = 2797;
    a4 = v24;
    goto LABEL_30;
  }
LABEL_27:
  result = 0;
LABEL_28:
  a4 = v24;
LABEL_33:
  *a3 = v12;
  *a4 = Mutable;
  return result;
}

uint64_t sub_21281909C(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned int v13;
  int *v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  unsigned int v23;
  int *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v40;
  uint64_t v41;
  int *v42;
  int *v43;
  _DWORD *v44;
  _DWORD *v45;
  uint64_t v46;

  v46 = 0;
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v40 = a3;
  v41 = 0;
  *a3 = 0;
  if (a2)
  {
    v7 = *(_QWORD *)(a1 + 8);
    if (v7)
    {
      if (*(_DWORD *)(a1 + 16) < a2)
        v41 = 0;
      else
        v41 = *(_QWORD *)(v7 + 8 * (a2 - 1));
    }
  }
  v8 = v6 << 9;
  v9 = *(_QWORD *)(a1 + 72);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
  v11 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1))
  {
    v44 = 0;
    v45 = 0;
    v12 = 0;
    v42 = 0;
    v43 = 0;
    goto LABEL_22;
  }
  v44 = 0;
  v45 = 0;
  v12 = 0;
  v42 = 0;
  v43 = 0;
  v13 = 0;
  v14 = (int *)(v9 + 64);
  do
  {
    v15 = *v14;
    if (!*v14)
      goto LABEL_57;
    if (!(v11 & 1 | (v15 != -1)))
    {
      v44 = (_DWORD *)(*(_QWORD *)(a1 + 72) + 12);
      v11 = 1;
      v42 = v14;
    }
    if (v15 == a2)
    {
      v45 = (_DWORD *)(*(_QWORD *)(a1 + 72) + 12);
      v12 = 1;
      v43 = v14;
    }
    if ((v11 & 1) != 0)
      v16 = 0;
    else
      v16 = v8;
    v10 += v16;
    if ((v11 & v12 & 1) != 0)
    {
      v12 = 1;
      v11 = 1;
      goto LABEL_21;
    }
    ++v13;
    ++v14;
  }
  while (v13 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1));
  if ((v11 & 1) == 0)
  {
LABEL_22:
    v17 = 1;
    while (1)
    {
      v18 = *(_DWORD *)(a1 + 32);
      if (v17 > v18)
        goto LABEL_57;
      v19 = v17 - 1;
      v20 = *(_QWORD *)(a1 + 80);
      if (v20 && v18 > v19)
        break;
      v22 = 0;
      if ((v11 & 1) == 0)
        goto LABEL_31;
LABEL_32:
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
      {
        v23 = 0;
        v24 = (int *)(v22 + 56);
        do
        {
          v25 = *v24;
          if (!*v24)
            goto LABEL_57;
          if (!(v11 & 1 | (v25 != -1)))
          {
            v26 = *(_QWORD *)(a1 + 80);
            if (v26 && *(_DWORD *)(a1 + 32) > v19)
            {
              v27 = v26 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v19;
              v25 = *v24;
            }
            else
            {
              v27 = 0;
              v25 = -1;
            }
            v44 = (_DWORD *)(v27 + 8);
            v11 = 1;
            v42 = v24;
          }
          if (v25 == a2)
          {
            v28 = *(_QWORD *)(a1 + 80);
            if (v28 && *(_DWORD *)(a1 + 32) > v19)
              v29 = v28 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v19;
            else
              v29 = 0;
            v45 = (_DWORD *)(v29 + 8);
            v12 = 1;
            v43 = v24;
          }
          if ((v11 & 1) != 0)
            v30 = 0;
          else
            v30 = v8;
          v10 += v30;
          if ((v11 & v12 & 1) != 0)
          {
            v12 = 1;
            v11 = 1;
            break;
          }
          ++v23;
          ++v24;
        }
        while (v23 < (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1));
      }
      ++v17;
      if ((v11 & 1) != 0 && (v12 & 1) != 0)
        goto LABEL_56;
    }
    v22 = v20 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * v19;
    if ((v11 & 1) != 0)
      goto LABEL_32;
LABEL_31:
    v10 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    goto LABEL_32;
  }
LABEL_21:
  if ((v12 & 1) == 0)
    goto LABEL_22;
LABEL_56:
  LOBYTE(v12) = 1;
  LOBYTE(v11) = 1;
LABEL_57:
  v31 = 999;
  if ((v11 & 1) != 0 && (v12 & 1) != 0)
  {
    if (v10 >= v41)
      return 0;
    if (v8 >= 0x100000)
      v32 = 0x100000;
    else
      v32 = v8;
    v33 = malloc_type_malloc(v32, 0x1C990A5FuLL);
    if (!v33)
      return 12;
    v34 = v33;
    if (v8)
    {
      v35 = 0;
      while (1)
      {
        v36 = v8 >= v32 ? v32 : v8;
        v37 = (*(uint64_t (**)(_QWORD, uint64_t, int64_t, uint64_t *, void *))(**(_QWORD **)(a1 + 24)
                                                                                            + 328))(*(_QWORD *)(a1 + 24), v35 + v41, v36, &v46, v34);
        if ((_DWORD)v37)
          break;
        if (!v46)
          goto LABEL_80;
        v37 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t *, void *))(**(_QWORD **)(a1 + 24) + 336))(*(_QWORD *)(a1 + 24), v35 + v10, v46, &v46, v34);
        if ((_DWORD)v37)
          break;
        if (!v46)
        {
LABEL_80:
          v31 = 999;
          goto LABEL_81;
        }
        v35 += v46;
        v8 -= v46;
        if (!v8)
          goto LABEL_74;
      }
    }
    else
    {
LABEL_74:
      *v43 = -1;
      *v45 |= 1u;
      *v42 = a2;
      *v44 |= 1u;
      v37 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
      if (!(_DWORD)v37)
      {
        (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
        if (a2)
        {
          v38 = *(_QWORD *)(a1 + 8);
          if (v38)
          {
            if (*(_DWORD *)(a1 + 16) >= a2)
              *(_QWORD *)(v38 + 8 * (a2 - 1)) = v10;
          }
        }
        v31 = 0;
        *v40 = 1;
        goto LABEL_81;
      }
    }
    v31 = v37;
LABEL_81:
    free(v34);
  }
  return v31;
}

uint64_t sub_2128194F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t result;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(unsigned int *)(a1 + 32);
  if (!(_DWORD)v1)
    return 0;
  while (1)
  {
    v3 = v1 - 1;
    v4 = *(_QWORD *)(a1 + 80);
    if (v4 && *(_DWORD *)(a1 + 32) > v3)
      v5 = v4 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v1 - 1);
    else
      v5 = 0;
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
    {
      v6 = 0;
      v7 = v5 + 56;
      while ((*(_DWORD *)(v7 + 4 * v6) + 1) <= 1)
      {
        if (++v6 >= (*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1))
          goto LABEL_10;
      }
      return 0;
    }
LABEL_10:
    if (v1 == 1)
      break;
    v8 = *(_QWORD *)(a1 + 80);
    v9 = v8 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v1 - 2);
    v10 = *(_QWORD *)(v9 + 12);
    *(_QWORD *)(v9 + 12) = 0;
    *(_DWORD *)(v9 + 8) |= 1u;
    v11 = *(void **)(a1 + 80);
    v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    v13 = malloc_type_realloc(v11, v12 * (*(_DWORD *)(a1 + 32) - 1), 0xFD5C7576uLL);
    if (!v13)
      return 12;
    *(_QWORD *)(a1 + 80) = v13;
    --*(_DWORD *)(a1 + 32);
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
    if ((_DWORD)result)
      return result;
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 312))(*(_QWORD *)(a1 + 24), v10);
    if ((_DWORD)result)
      return result;
    *(_QWORD *)(a1 + 112) = v10;
    *(_QWORD *)(a1 + 120) = v10;
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
    v1 = v3;
    if (!(_DWORD)v3)
      return 0;
  }
  v16 = *(_QWORD *)(a1 + 72);
  v15 = *(void **)(a1 + 80);
  v17 = *(_QWORD *)(v16 + 20);
  *(_DWORD *)(v16 + 12) |= 1u;
  *(_QWORD *)(v16 + 20) = 0;
  if (v15)
  {
    free(v15);
    *(_QWORD *)(a1 + 80) = 0;
  }
  *(_DWORD *)(a1 + 32) = 0;
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
  if (!(_DWORD)result)
  {
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 312))(*(_QWORD *)(a1 + 24), v17);
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a1 + 112) = v17;
      *(_QWORD *)(a1 + 120) = v17;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2128196E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;
  int v15;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  _DWORD *v25;
  int v26;
  int v27;
  uint64_t result;

  v2 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
  v3 = v2 << 9;
  v4 = *(_DWORD *)(a1 + 32);
  if (!v4)
  {
    v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
    if (!v8)
      goto LABEL_27;
    v9 = *(_QWORD *)(a1 + 72);
    v10 = v7 + ((v2 * v8) << 9);
    v11 = v8 - 1;
    while (1)
    {
      v12 = v9 + 4 * v11;
      v15 = *(_DWORD *)(v12 + 64);
      v13 = (_DWORD *)(v12 + 64);
      v14 = v15;
      if (v15)
      {
        if (v14 != -1)
        {
          v7 = v10;
          goto LABEL_27;
        }
        *v13 = 0;
        *(_DWORD *)(v9 + 12) |= 1u;
      }
      v10 -= v3;
      if (!(unint64_t)v11--)
        goto LABEL_27;
    }
  }
  v5 = *(_QWORD *)(a1 + 80);
  if (v5)
  {
    v6 = v5 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v4 - 1);
    v4 = *(_DWORD *)(a1 + 32);
  }
  else
  {
    v6 = 0;
  }
  if (v4 == 1)
  {
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 72) + 20);
  }
  else
  {
    v18 = 0;
    if (v4)
    {
      v19 = *(_QWORD *)(a1 + 80);
      if (v19)
        v18 = v19 + (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) * (v4 - 2);
    }
    v17 = (uint64_t *)(v18 + 12);
  }
  v20 = *v17;
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1) + v20;
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  if (v21)
  {
    v22 = v7 + ((v2 * v21) << 9);
    v23 = v21 - 1;
    do
    {
      v24 = v6 + 4 * v23;
      v27 = *(_DWORD *)(v24 + 56);
      v25 = (_DWORD *)(v24 + 56);
      v26 = v27;
      if (v27)
      {
        if (v26 != -1)
        {
          v7 = v22;
          break;
        }
        *v25 = 0;
        *(_DWORD *)(v6 + 8) |= 1u;
      }
      v22 -= v3;
    }
    while ((unint64_t)v23--);
  }
LABEL_27:
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 120))(a1);
  if (!(_DWORD)result)
  {
    result = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 312))(*(_QWORD *)(a1 + 24), v7);
    if (!(_DWORD)result)
    {
      *(_QWORD *)(a1 + 112) = v7;
      *(_QWORD *)(a1 + 120) = v7;
      (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 472))(*(_QWORD *)(a1 + 24), 1);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2128198D8(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_2128198E0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t sub_2128198EC()
{
  return 0;
}

const __CFDictionary *sub_2128198F4(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v5;
  CFStringRef v6;
  CFStringRef v7;
  CFDictionaryRef Copy;

  v2 = (const __CFDictionary *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 192))(*(_QWORD *)(a1 + 176));
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v2);
    if (MutableCopy)
    {
      v5 = MutableCopy;
      v6 = CFStringCreateWithFormat(v3, 0, CFSTR("sectors %qd-%qd"), *(_QWORD *)(a1 + 160), *(_QWORD *)(a1 + 160) + *(_QWORD *)(a1 + 168) - 1);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(v5, CFSTR("sector-range"), v6);
        Copy = CFDictionaryCreateCopy(v3, v5);
        CFRelease(v7);
      }
      else
      {
        Copy = CFDictionaryCreateCopy(v3, v5);
      }
      CFRelease(v2);
      v2 = Copy;
    }
    else
    {
      v5 = v2;
    }
    CFRelease(v5);
  }
  return v2;
}

uint64_t sub_2128199E8(uint64_t a1)
{
  uint64_t result;
  const void *v2;
  CFStringRef v3;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 72))(*(_QWORD *)(a1 + 176));
  if (result)
  {
    v2 = (const void *)result;
    v3 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%1$@ (part)"), result);
    CFRelease(v2);
    return (uint64_t)v3;
  }
  return result;
}

uint64_t sub_212819A50(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 128))(*(_QWORD *)(a1 + 176));
}

uint64_t sub_212819A60(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 136))(*(_QWORD *)(a1 + 176));
}

uint64_t sub_212819A70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 168);
  if (v3 >= a2 && a3 + a2 <= v3)
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 176) + 144))(*(_QWORD *)(a1 + 176), *(_QWORD *)(a1 + 160) + a2);
  else
    return 22;
}

uint64_t sub_212819AAC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 96))(*(_QWORD *)(a1 + 176))
       - *(_QWORD *)(a1 + 160);
}

__CFDictionary *sub_212819AE0(char *a1)
{
  __CFDictionary *v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  uint64_t v5;
  CFTypeRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  __CFDictionary *Value;
  uint64_t v15;
  uint64_t valuePtr;

  v2 = sub_21280FB28(a1);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFDictionaryAddValue(v2, CFSTR("Size Information"), Mutable);
    v5 = DIGetBundleRef();
    if (v5)
    {
      v6 = sub_21281FFEC(v5, (int)CFSTR("partial"), CFSTR("partial"));
      CFDictionaryAddValue(v2, CFSTR("Format Description"), v6);
      if (v6)
        CFRelease(v6);
      CFDictionaryAddValue(v2, CFSTR("Format"), CFSTR("SUBB"));
      v15 = 0;
      valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
      v7 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Total Bytes"), v7);
      if (v7)
        CFRelease(v7);
      valuePtr = 0;
      v8 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Total Empty Bytes"), v8);
      if (v8)
        CFRelease(v8);
      valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
      v9 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Total Non-Empty Bytes"), v9);
      if (v9)
        CFRelease(v9);
      valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1) << 9;
      v10 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Compressed Bytes"), v10);
      if (v10)
        CFRelease(v10);
      v15 = 0x3FF0000000000000;
      v11 = CFNumberCreate(v3, kCFNumberDoubleType, &v15);
      CFDictionaryAddValue(Mutable, CFSTR("Compressed Ratio"), v11);
      if (v11)
        CFRelease(v11);
      valuePtr = (*(uint64_t (**)(char *))(*(_QWORD *)a1 + 96))(a1);
      v12 = CFNumberCreate(v3, kCFNumberLongLongType, &valuePtr);
      CFDictionaryAddValue(Mutable, CFSTR("Sector Count"), v12);
      if (v12)
        CFRelease(v12);
      Value = (__CFDictionary *)CFDictionaryGetValue(v2, CFSTR("Properties"));
      CFDictionaryAddValue(Value, CFSTR("Compressed"), CFSTR("no"));
      if (Mutable)
        CFRelease(Mutable);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_212819D9C(uint64_t a1, uint64_t a2)
{
  if (sub_2127FA258(a1))
    return sub_212812F80(a1, a2);
  else
    return (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 176) + 360))(*(_QWORD *)(a1 + 176), a2);
}

uint64_t sub_212819DE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_QWORD *)(a1 + 104) || sub_2127FA258(a1))
    return sub_2127FA468(a1, a2, a3);
  else
    return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(a1 + 176) + 336))(*(_QWORD *)(a1 + 176), a2, a3);
}

uint64_t sub_212819E58(uint64_t a1, float a2)
{
  if (*(_QWORD *)(a1 + 112) || sub_2127FA258(a1))
    return sub_2127FA1E0(a1, a2);
  else
    return (*(uint64_t (**)(_QWORD, float))(**(_QWORD **)(a1 + 176) + 344))(*(_QWORD *)(a1 + 176), a2);
}

uint64_t sub_212819EBC(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 120) || sub_2127FA258(a1))
    return sub_2127FBF80(a1);
  else
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 176) + 352))(*(_QWORD *)(a1 + 176));
}

uint64_t sub_212819F08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;

  v13 = a1;
  if (!sub_2127FA258(a1))
    v13 = *(_QWORD *)(v13 + 176);
  return sub_212814D30(v13, a2, a3, a4, a5, a6, a7);
}

const char *sub_212819F7C()
{
  return "CSubDiskImage";
}

uint64_t sub_212819F8C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  pthread_rwlock_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  pthread_rwlock_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;

  v28 = 0;
  v10 = (pthread_rwlock_t *)(a1 + 160);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 160));
  if (!a5)
  {
LABEL_33:
    v13 = 0;
    v17 = 22;
    goto LABEL_30;
  }
  if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1))
  {
    v11 = *(_QWORD *)(a1 + 360);
    if (v11 < a2 || a3 + a2 > v11)
      goto LABEL_33;
    v21 = v10;
    v13 = 0;
    while (a3)
    {
      v27 = 0;
      v24 = 0;
      v25 = 0;
      v23 = 0;
      sub_2127FB630(a1, a2, &v26, &v27, &v25, &v24, &v23, &v22, 0);
      if (v24 - (a2 - v25) >= a3)
        v14 = a3;
      else
        v14 = v24 - (a2 - v25);
      v15 = 1;
      if (v27 >= -2147483639)
      {
        switch(v27)
        {
          case -1:
            v15 = 999;
            break;
          case 0:
          case 2:
            break;
          case 1:
            v18 = v23 + ((a2 - v25) << 9);
            v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1);
            v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))(*(_QWORD *)v19 + 336))(v19, v18, v14 << 9, &v28, a5);
            break;
          default:
            if (v27 == 2147483646)
              v15 = 1;
            else
              v15 = 107;
            break;
        }
      }
      a3 -= v14;
      v13 += v14;
      a2 += v14;
      a5 += v14 << 9;
      if (v15)
        v16 = 0;
      else
        v16 = v14 == 0;
      if (v16)
        v17 = 999;
      else
        v17 = v15;
      if ((_DWORD)v17)
        goto LABEL_29;
    }
    v17 = 0;
LABEL_29:
    v10 = v21;
  }
  else
  {
    v13 = 0;
    v17 = 999;
  }
LABEL_30:
  if (a4)
    *a4 = v13;
  pthread_rwlock_unlock(v10);
  return v17;
}

uint64_t DIUDIFDiskImageGetBLKXStartingAt_0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(uint64_t **)(a1 + 928);
  if (!v2 || *(__int16 *)(a1 + 912) < 1)
    return 0;
  v3 = *(unsigned __int16 *)(a1 + 912);
  while (1)
  {
    result = *v2;
    if (*v2)
    {
      if (*(_QWORD *)(*(_QWORD *)result + 8) == a2)
        break;
    }
    ++v2;
    if (!--v3)
      return 0;
  }
  return result;
}

uint64_t sub_21281A1A8(uint64_t a1)
{
  return *(_QWORD *)(a1 + 920);
}

uint64_t sub_21281A1B0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = sub_2127F3728(a3);
  v15 = 0;
  if (!(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 296))(a1))
  {
    if (!a2
      || !__dynamic_cast(a2, (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2BBB0, 0))
    {
      return 110;
    }
    *(_DWORD *)(a1 + 144) = 1430538566;
    v7 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)a2 + 80))(a2, v5);
    if ((_DWORD)v7
      || (v8 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 72))(a2),
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 520))(a1, v8),
          v7 = (*(uint64_t (**)(void *))(*(_QWORD *)a2 + 272))(a2),
          (_DWORD)v7))
    {
      v6 = v7;
      v9 = 0;
    }
    else if (__dynamic_cast(a2, (const struct __class_type_info *)&unk_24CE293B8, (const struct __class_type_info *)&unk_24CE2BBB0, 0))
    {
      (*(void (**)(void *, uint64_t))(*(_QWORD *)a2 + 704))(a2, a1 + 392);
      v10 = (*(uint64_t (**)(void *, uint64_t *))(*(_QWORD *)a2 + 344))(a2, &v15);
      if (v10)
      {
        v15 = 0;
        if (v10 == 78 || v10 == 2)
          v6 = 107;
        else
          v6 = v10;
LABEL_22:
        (*(void (**)(void *, _QWORD))(*(_QWORD *)a2 + 280))(a2, 0);
        return v6;
      }
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 584))(a1, v15);
      if ((_DWORD)v13
        || (v14 = 0,
            v13 = (*(uint64_t (**)(void *, uint64_t *))(*(_QWORD *)a2 + 296))(a2, &v14),
            (_DWORD)v13)
        || (v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 592))(a1, v14), (_DWORD)v13)
        || (v13 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 600))(a1), (_DWORD)v13))
      {
        v6 = v13;
      }
      else
      {
        nullsub_4(*(_QWORD *)(a1 + 904));
        if (v15)
        {
          (*(void (**)(void *, _QWORD))(*(_QWORD *)a2 + 352))(a2, 0);
          v15 = 0;
        }
        v6 = sub_2127F8BDC(a1);
        if (!(_DWORD)v6)
        {
          sub_2127F8C58(a1, (char *)a2);
          *(_QWORD *)(a1 + 360) = *(_QWORD *)(**(_QWORD **)(a1 + 904) + 16);
          return v6;
        }
      }
      v9 = 1;
    }
    else
    {
      v9 = 1;
      v6 = 107;
    }
    if (v15)
    {
      (*(void (**)(void *, _QWORD))(*(_QWORD *)a2 + 352))(a2, 0);
      v15 = 0;
      if ((v9 & 1) == 0)
        return v6;
    }
    else if (!v9)
    {
      return v6;
    }
    goto LABEL_22;
  }
  return 78;
}

uint64_t sub_21281A414(uint64_t a1, const char *a2)
{
  const char *v2;
  const char *v3;
  const char *v4;

  v2 = "";
  if (a2)
    v2 = a2;
  v3 = "YES";
  if (*(_QWORD *)(a1 + 104))
    v4 = "YES";
  else
    v4 = "NO";
  if (!*(_BYTE *)(a1 + 112))
    v3 = "NO";
  return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s%qd at %qd (read %s, zero %s)\n", v2, *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 88), v4, v3);
}

BOOL sub_21281A490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 160))(a1, a2, a3, 0) == 0;
}

uint64_t sub_21281A4B8()
{
  return 78;
}

void sub_21281A4C0(uint64_t a1, const __CFString *a2)
{
  const char *v4;
  char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  const __CFAllocator *v14;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v16;
  CFNumberRef v17;
  CFNumberRef v18;
  const void *v19;
  CFMutableArrayRef v20;
  CFMutableArrayRef v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  CFMutableDictionaryRef v25;
  __CFDictionary *v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  _BOOL4 v30;
  _BOOL4 v31;
  int v32;
  int v33;
  int v34;
  const __CFAllocator *v35;
  CFNumberRef v36;
  CFNumberRef v37;
  CFNumberRef v38;
  uint64_t v39;
  CFMutableDictionaryRef theDict;
  char *v41;
  const __CFString *v42;
  void *value;
  __CFArray *v44;
  int v45;
  uint64_t valuePtr;
  char *__endptr;

  v4 = (const char *)sub_2127F2B30(a2, 0x8000100u);
  if (v4)
  {
    v5 = (char *)v4;
    v6 = v4 + 14;
    if (v4[14])
    {
      if (!strcmp(v4 + 14, "global"))
      {
LABEL_10:
        v10 = (uint64_t **)(a1 + 904);
        v11 = -2;
LABEL_15:
        v13 = *v10;
        if (*v10)
        {
          v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          if (Mutable)
          {
            v16 = Mutable;
            v42 = a2;
            v17 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*v13 + 8));
            CFDictionarySetValue(v16, CFSTR("sector-start"), v17);
            if (v17)
              CFRelease(v17);
            v18 = CFNumberCreate(v14, kCFNumberLongLongType, (const void *)(*v13 + 16));
            CFDictionarySetValue(v16, CFSTR("sector-count"), v18);
            if (v18)
              CFRelease(v18);
            v19 = sub_2127FA26C(a1, v11);
            if (v19)
              CFDictionarySetValue(v16, CFSTR("name"), v19);
            v20 = CFArrayCreateMutable(v14, 0, MEMORY[0x24BDBD690]);
            if (!v20)
            {
              free(v5);
              CFRelease(v16);
              return;
            }
            v21 = v20;
            v39 = a1;
            theDict = v16;
            v41 = v5;
            v22 = *v13;
            v23 = *(_DWORD *)(*v13 + 200);
            valuePtr = 0;
            __endptr = 0;
            if (v23)
            {
              v24 = v22 + 208;
              value = (void *)*MEMORY[0x24BDBD270];
              v44 = v20;
              do
              {
                v25 = CFDictionaryCreateMutable(v14, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                if (!v25)
                {
                  free(v41);
                  CFRelease(theDict);
                  CFRelease(v21);
                  return;
                }
                v26 = v25;
                v27 = 0;
                v28 = *(_DWORD *)(v24 - 4);
                __endptr = *(char **)(v24 + 4);
                valuePtr = *(_QWORD *)(v24 + 12);
                v29 = v28 >> 28;
                if (v28 >> 28 > 7)
                {
                  if (v29 == 8)
                  {
                    v30 = 0;
                    v31 = 0;
                    v32 = 0;
                    v34 = 0;
                    v27 = 1;
LABEL_38:
                    v33 = 1;
                    goto LABEL_39;
                  }
                  v30 = 0;
                  v31 = 0;
                  v32 = 0;
                  v33 = 0;
                  v34 = 0;
                  if (v29 == 15)
                  {
                    v27 = 0;
                    v30 = 0;
                    v31 = 0;
                    v32 = 0;
                    v33 = 0;
                    v34 = 1;
                  }
                }
                else
                {
                  if (!v29)
                  {
                    if (v28 <= 2)
                    {
                      v27 = 0;
                      v32 = 0;
                      v34 = 0;
                      v31 = (v28 & 7) == 0;
                      v30 = (v28 & 7) == 2;
                      v33 = v28 & 1;
                      goto LABEL_39;
                    }
                    v27 = 0;
                    v30 = 0;
                    v31 = 0;
                    v32 = 0;
                    v34 = 0;
                    goto LABEL_38;
                  }
                  v30 = 0;
                  v31 = 0;
                  v32 = 0;
                  v33 = 0;
                  v34 = 0;
                  if (v29 == 7)
                  {
                    v27 = 0;
                    v30 = 0;
                    v31 = 0;
                    v33 = 0;
                    v34 = 0;
                    v32 = 1;
                  }
                }
LABEL_39:
                v45 = v33;
                v35 = v14;
                v36 = CFNumberCreate(v14, kCFNumberLongLongType, &__endptr);
                CFDictionarySetValue(v26, CFSTR("sector-start"), v36);
                if (v36)
                  CFRelease(v36);
                v37 = CFNumberCreate(v35, kCFNumberLongLongType, &valuePtr);
                CFDictionarySetValue(v26, CFSTR("sector-count"), v37);
                if (v37)
                  CFRelease(v37);
                if (v32)
                {
                  v38 = CFNumberCreate(v35, kCFNumberSInt32Type, (const void *)v24);
                  CFDictionarySetValue(v26, CFSTR("comment"), v38);
                  if (v38)
                    CFRelease(v38);
                }
                if (v34)
                  CFDictionarySetValue(v26, CFSTR("terminator"), value);
                v14 = v35;
                if (v45)
                  CFDictionarySetValue(v26, CFSTR("data"), value);
                v21 = v44;
                if (v31)
                {
                  CFDictionarySetValue(v26, CFSTR("zero"), value);
                  if (v30)
                    goto LABEL_57;
                }
                else if (v30)
                {
LABEL_57:
                  CFDictionarySetValue(v26, CFSTR("ignored"), value);
                  if (!v27)
                    goto LABEL_54;
LABEL_53:
                  CFDictionarySetValue(v26, CFSTR("compressed"), value);
                  goto LABEL_54;
                }
                if (v27)
                  goto LABEL_53;
LABEL_54:
                CFArrayAppendValue(v44, v26);
                CFRelease(v26);
                v24 += 40;
                --v23;
              }
              while (v23);
            }
            CFDictionarySetValue(theDict, CFSTR("runs"), v21);
            CFRelease(v21);
            (*(void (**)(uint64_t, const __CFString *, CFMutableDictionaryRef))(*(_QWORD *)v39 + 32))(v39, v42, theDict);
            CFRelease(theDict);
            v5 = v41;
          }
        }
        goto LABEL_60;
      }
      if (!strcmp(v6, "ddm"))
      {
        v11 = -1;
      }
      else
      {
        __endptr = 0;
        v7 = strtol(v6, &__endptr, 0);
        v8 = v7 << 32;
        if (*__endptr)
          v9 = 1;
        else
          v9 = v8 < (uint64_t)0xFFFFFFFE00000000;
        if (v9)
          goto LABEL_60;
        if (v8 == 0xFFFFFFFE00000000)
          goto LABEL_10;
        v11 = (int)v7;
      }
      v12 = v11 - *(__int16 *)(a1 + 914);
      if (v12 < *(__int16 *)(a1 + 912))
      {
        v10 = (uint64_t **)(*(_QWORD *)(a1 + 928) + 8 * v12);
        goto LABEL_15;
      }
    }
LABEL_60:
    free(v5);
  }
}

void sub_21281A9F4(uint64_t a1)
{
  sub_2127FDDA8(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281AA28(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C40FE8C5686);
  _Unwind_Resume(a1);
}

uint64_t sub_21281AA4C(uint64_t a1, uint64_t a2)
{
  void *v4;
  const __CFAllocator *v5;
  CFMutableArrayRef Mutable;
  uint64_t v7;
  uint64_t v8;
  const void *v9;
  CFStringRef v10;
  uint64_t v11;
  unint64_t v12;
  int v14;
  const __CFString *v15;
  CFTypeRef cf;
  int v17;
  __int16 v18;
  uint64_t *v19;
  unsigned __int8 pStr[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a1 + 912) = 1;
  *(_WORD *)(a1 + 916) = 0;
  v4 = malloc_type_calloc(8uLL, 1uLL, 0x49666C96uLL);
  *(_QWORD *)(a1 + 928) = v4;
  if (!v4)
    return 12;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  *(_QWORD *)(a1 + 936) = Mutable;
  if (!Mutable)
    return 12;
  v19 = 0;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  *(_OWORD *)pStr = 0u;
  v18 = 0;
  v17 = 0;
  cf = 0;
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t **))(*(_QWORD *)a2 + 120))(a2, 1651272547, 0, &v19);
  **(_QWORD **)(a1 + 928) = v19;
  if ((_DWORD)v7)
    return v7;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t *, __int16 *, int *, unsigned __int8 *, CFTypeRef *))(*(_QWORD *)a2 + 320))(a2, v19, &v18, &v17, pStr, &cf);
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)a2 + 248))(a2, v19);
  if (!(_DWORD)v8)
  {
    if (cf)
    {
      v9 = CFRetain(cf);
    }
    else
    {
      v10 = CFStringCreateWithPascalString(v5, pStr, 0);
      if (v10)
      {
        v9 = v10;
        CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v10);
        goto LABEL_11;
      }
      v14 = DIGetBundleRef();
      v15 = (const __CFString *)sub_21281FFEC(v14, (int)CFSTR("restricted segment %d"), CFSTR("restricted segment %d"));
      v9 = CFStringCreateWithFormat(v5, 0, v15, *(unsigned int *)(a1 + 448));
      CFRelease(v15);
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 936), v9);
    if (!v9)
    {
LABEL_12:
      nullsub_4(v19);
      v11 = *v19;
      v12 = sub_212820120((uint64_t)v19);
      if (sub_2127F8360(v11, v12))
        return 107;
      else
        return 0;
    }
LABEL_11:
    CFRelease(v9);
    goto LABEL_12;
  }
  return v8;
}

uint64_t sub_21281AC84(uint64_t a1)
{
  const void **v1;
  size_t v3;
  void **v4;
  uint64_t result;

  v1 = **(const void ****)(a1 + 928);
  if (!v1)
    return 22;
  v3 = 40 * (*((_DWORD *)*v1 + 50) - 1) + 244;
  v4 = (void **)sub_212820064(v3);
  *(_QWORD *)(a1 + 904) = v4;
  if (v4)
  {
    memcpy(*v4, *v1, v3);
    result = 0;
    *(_QWORD *)(**(_QWORD **)(a1 + 904) + 8) = 0;
  }
  else if (sub_21281FFF4())
  {
    return 12;
  }
  else
  {
    return 0;
  }
  return result;
}

__CFDictionary *sub_21281AD18(uint64_t a1)
{
  __CFDictionary *v1;
  int v2;
  CFTypeRef v3;
  const void *Value;
  CFStringRef v5;

  v1 = sub_2128101A8(a1);
  v2 = DIGetBundleRef();
  v3 = sub_21281FFEC(v2, (int)CFSTR("[restricted segment]"), CFSTR("[restricted segment]"));
  Value = CFDictionaryGetValue(v1, CFSTR("Format Description"));
  v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@ %@"), Value, v3);
  CFDictionarySetValue(v1, CFSTR("Format Description"), v5);
  if (v5)
    CFRelease(v5);
  if (v3)
    CFRelease(v3);
  return v1;
}

uint64_t sub_21281ADD0(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_2127FA29C((_DWORD *)(**(_QWORD **)(a1 + 904) + 64));
  if (!v1)
  {
    v1 = operator new();
    sub_212814FD8(v1, 0);
  }
  return v1;
}

void sub_21281AE28(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406CA3838BLL);
  _Unwind_Resume(a1);
}

uint64_t sub_21281AE4C(unsigned int *a1, char *a2)
{
  int v4;
  const __CFString *v5;
  CFStringRef v6;
  uint64_t v7;

  (*(void (**)(unsigned int *, float))(*(_QWORD *)a1 + 344))(a1, 0.0);
  v4 = DIGetBundleRef();
  v5 = (const __CFString *)sub_21281FFEC(v4, (int)CFSTR("Checksumming restricted segment %1$d\\U2026"), CFSTR("Checksumming restricted segment %1$d\\U2026"));
  v6 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v5, a1[112]);
  (*(void (**)(unsigned int *, CFStringRef, uint64_t))(*(_QWORD *)a1 + 336))(a1, v6, 16);
  if (v6)
    CFRelease(v6);
  if (v5)
    CFRelease(v5);
  v7 = sub_2127FA4F8((char *)a1, *((_QWORD **)a1 + 113), a2);
  (*(void (**)(unsigned int *, const __CFString *, uint64_t))(*(_QWORD *)a1 + 336))(a1, &stru_24CE2CFF0, 16);
  (*(void (**)(unsigned int *, float))(*(_QWORD *)a1 + 344))(a1, 100.0);
  return v7;
}

uint64_t sub_21281AF4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 107;
}

uint64_t sub_21281AF58()
{
  return 0;
}

const char *sub_21281AF64()
{
  return "CRestrictedUDIFDiskImage";
}

uint64_t sub_21281AF70(uint64_t a1, int a2)
{
  uint64_t v4;
  void *v5;

  v4 = sub_2127FAA88(a1);
  *(_QWORD *)v4 = &off_24CE2AE90;
  *(_BYTE *)(v4 + 112) = 0;
  *(_QWORD *)(v4 + 88) = 0;
  *(_QWORD *)(v4 + 96) = 0;
  if (a2)
    v5 = malloc_type_malloc(0x100000uLL, 0x318C0A67uLL);
  else
    v5 = 0;
  *(_QWORD *)(a1 + 104) = v5;
  return a1;
}

void sub_21281AFCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127FBF28(v1);
  _Unwind_Resume(a1);
}

void sub_21281AFE8()
{
  sub_2127F8BD8();
  JUMPOUT(0x212BF43D0);
}

void sub_21281B01C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C405BFDFBFCLL);
  _Unwind_Resume(a1);
}

const char *sub_21281B040()
{
  return "CLZFSEDecompressor";
}

uint64_t sub_21281B04C()
{
  return 2049;
}

void sub_21281B058(char **a1)
{
  sub_2127FE1B0(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281B08C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C408CA8AB75);
  _Unwind_Resume(a1);
}

uint64_t sub_21281B0B0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 416))(v1);
  else
    return 999;
}

uint64_t sub_21281B0CC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 424))(v1);
  else
    return 999;
}

uint64_t sub_21281B0E8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 56))(result);
  return result;
}

uint64_t sub_21281B100(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 112))(v1);
  else
    return 999;
}

uint64_t sub_21281B11C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 136))(result);
  return result;
}

uint64_t sub_21281B134(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 200);
  if (v3)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 144))(v3);
  if (!a3)
    return 22;
  *a3 = 0;
  return 999;
}

uint64_t sub_21281B160(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 200))(result);
  return result;
}

uint64_t sub_21281B178(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 232))(v1);
  else
    return 999;
}

uint64_t sub_21281B194(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 256))(v1);
  else
    return 999;
}

uint64_t sub_21281B1B0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 288))(result);
  return result;
}

uint64_t sub_21281B1C8(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 296))(v1);
  else
    return 999;
}

uint64_t sub_21281B1E4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 312))(v1);
  else
    return 999;
}

uint64_t sub_21281B200(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 328))(v1);
  else
    return 999;
}

uint64_t sub_21281B21C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 336))(v1);
  else
    return 999;
}

uint64_t sub_21281B238(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 200);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 352))(result);
  return result;
}

uint64_t sub_21281B250(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (((*(uint64_t (**)(_QWORD *))(*a1 + 592))(a1) & 1) != 0 || (v2 = a1[25]) == 0)
    v3 = 0;
  else
    v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 360))(v2);
  (*(void (**)(_QWORD *))(*a1 + 600))(a1);
  return v3;
}

uint64_t sub_21281B2B0(_QWORD *a1)
{
  uint64_t v2;

  (*(void (**)(_QWORD *))(*a1 + 608))(a1);
  if (((*(uint64_t (**)(_QWORD *))(*a1 + 592))(a1) & 1) == 0)
  {
    v2 = a1[25];
    if (v2)
      (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v2 + 368))(v2, 0);
  }
  return 0;
}

uint64_t sub_21281B308(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 376))(v1);
  else
    return 999;
}

uint64_t sub_21281B324(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 384))(v1);
  else
    return 999;
}

uint64_t sub_21281B340(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 392))(v1);
  else
    return 999;
}

uint64_t sub_21281B35C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 400))(v1);
  else
    return 999;
}

uint64_t sub_21281B378(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 200);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 408))(v1);
  else
    return 999;
}

const char *sub_21281B394()
{
  return "CFileEncoding";
}

uint64_t sub_21281B3A0()
{
  return 0;
}

void sub_21281B3AC(char **a1)
{
  sub_2127FE1B0(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281B3E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C405C90840ALL);
  _Unwind_Resume(a1);
}

uint64_t sub_21281B404()
{
  return 78;
}

uint64_t sub_21281B40C()
{
  return 78;
}

BOOL sub_21281B414(uint64_t a1)
{
  return *(_QWORD *)(a1 + 216) != 0;
}

uint64_t sub_21281B424()
{
  return 78;
}

uint64_t sub_21281B42C(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 224);
  return 0;
}

uint64_t sub_21281B440(uint64_t a1, _QWORD *a2)
{
  if (a2)
    *a2 = *(_QWORD *)(a1 + 224);
  return 0;
}

uint64_t sub_21281B454()
{
  return 78;
}

uint64_t sub_21281B45C()
{
  return 0;
}

const char *sub_21281B464()
{
  return "CFlatFileEncoding";
}

uint64_t sub_21281B470(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t sub_21281B478(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t sub_21281B484(uint64_t a1)
{
  unsigned int v1;
  int8x16_t v2;

  v1 = bswap32(*(_DWORD *)a1);
  *(_DWORD *)a1 = v1;
  v2 = vrev32q_s8(*(int8x16_t *)(a1 + 36));
  *(int8x16_t *)(a1 + 36) = v2;
  if (v2.i32[3] > 0x200u || v1 > 0x20)
    return 107;
  else
    return 0;
}

uint64_t sub_21281B4BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[2];

  if (*(_DWORD *)(a1 + 480) != 2)
    return 0;
  if (*(_DWORD *)(a1 + 540))
  {
    v6 = 0;
    v7 = 0;
    while ((sub_21281B570(a1, a2, a3, (unsigned int *)(*(_QWORD *)(a1 + 528) + v6)) & 1) == 0)
    {
      ++v7;
      v6 += 616;
      if (v7 >= *(unsigned int *)(a1 + 540))
        goto LABEL_6;
    }
    return 1;
  }
  else
  {
LABEL_6:
    v9[0] = a3;
    v9[1] = a2;
    return sub_21281B734(a1, v9);
  }
}

uint64_t sub_21281B570(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  size_t dataOutAvailable;
  char *v18;
  unsigned int v19;
  CCAlgorithm v20;
  _QWORD v22[2];
  size_t v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v6 = ((unint64_t)a4[21] >> 3);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)v22 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v22 - ((v11 + 15) & 0x1FFFFFFF0);
  v26[0] = *(unsigned int *)(v13 + 48);
  v26[1] = v12;
  v25[0] = v6;
  v25[1] = v9;
  v24[0] = v15;
  v24[1] = v14;
  v16 = sub_21281BDA4(v10, v24, (uint64_t)a4, (uint64_t)v25, (uint64_t)v26);
  if ((v16 & 1) == 0)
    return 0;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0);
  v23 = 0;
  v19 = a4[22];
  if (v19 == -2147483647)
  {
    v20 = 0;
  }
  else
  {
    if (v19 != 17)
      sub_212807E8C(45, (uint64_t)"Unsupported key encryption algorithm.");
    v20 = 2;
  }
  if (CCCrypt(1u, v20, 1u, v9, v6, v12, a4 + 26, dataOutAvailable, (char *)v22 - ((dataOutAvailable + 15) & 0x1FFFFFFF0), dataOutAvailable, &v23))
  {
    return 0;
  }
  v22[0] = v23;
  v22[1] = v18;
  return sub_212808C64(a1, v22);
}

uint64_t sub_21281B734(uint64_t a1, _QWORD *a2)
{
  unsigned int *v2;
  unint64_t v3;
  const char *v5;
  CFIndex v6;
  uint64_t v7;
  uint64_t v8;
  const UInt8 *v9;
  CFIndex v10;
  unsigned int v11;
  uint64_t v12;
  const UInt8 *v13;
  unint64_t v14;
  const char *v15;
  unint64_t v16;
  const __CFAllocator *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v2 = (unsigned int *)(a1 + 570);
  v3 = *(unsigned int *)(a1 + 570);
  if (*a2 != (((*(_DWORD *)(a1 + 578) + v3) >> 2) & 0x3FFFFFFE))
    return 0;
  v5 = (const char *)a2[1];
  v6 = v3 >> 3;
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (const UInt8 *)v19 - v8;
  v10 = (unint64_t)v2[2] >> 3;
  MEMORY[0x24BDAC7A8](v7);
  v13 = (const UInt8 *)v19 - v12;
  if (*v2 < 8)
  {
LABEL_7:
    if (v11 < 8)
    {
LABEL_11:
      v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      *(_QWORD *)(a1 + 2016) = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, v6);
      *(_QWORD *)(a1 + 2024) = CFDataCreate(v17, v13, v10);
      return 1;
    }
    else
    {
      v16 = 0;
      while (sscanf(&v5[((unint64_t)*v2 >> 2) & 0x3FFFFFFE], "%02hhx", &v13[v16]) == 1)
      {
        ++v16;
        v5 += 2;
        if (v16 >= (unint64_t)v2[2] >> 3)
          goto LABEL_11;
      }
      return 0;
    }
  }
  else
  {
    v19[0] = v19;
    v14 = 0;
    v15 = v5;
    while (sscanf(v15, "%02hhx", &v9[v14]) == 1)
    {
      ++v14;
      v15 += 2;
      if (v14 >= (unint64_t)*v2 >> 3)
      {
        v11 = v2[2];
        goto LABEL_7;
      }
    }
    return 0;
  }
}

uint64_t sub_21281B92C(uint64_t a1, const __CFString *a2)
{
  CFTypeID v4;
  size_t v5;
  char buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 22;
  bzero(buffer, 0x400uLL);
  v4 = CFGetTypeID(a2);
  if (v4 != CFStringGetTypeID() || !CFStringGetCString(a2, buffer, 1023, 0x8000100u))
    return 22;
  v5 = strlen(buffer);
  if (sub_21281B4BC(a1, (uint64_t)buffer, v5))
    return 0;
  else
    return 80;
}

uint64_t sub_21281B9F8(_DWORD *a1, const __CFDictionary *a2)
{
  const void *Value;
  CFTypeID TypeID;
  __CFArray *Mutable;
  CFTypeRef v7;
  CFTypeID v8;
  const __CFString *v9;
  CFTypeID v10;
  int v11;
  CFTypeRef v12;
  const __CFAllocator *v13;
  CFStringRef v14;
  __CFArray *v15;
  int v16;
  const char *v18;
  int v19;
  const char *v20;
  int v21;
  unsigned int v22;
  char cStr[1024];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  bzero(cStr, 0x400uLL);
  if (!a2)
    goto LABEL_14;
  Value = CFDictionaryGetValue(a2, CFSTR("new-passphrase"));
  if (!Value)
  {
    v7 = 0;
    goto LABEL_10;
  }
  TypeID = CFStringGetTypeID();
  if (TypeID != CFGetTypeID(Value))
  {
    v8 = CFArrayGetTypeID();
    if (v8 == CFGetTypeID(Value) && a1[120] != 1)
    {
      v7 = CFRetain(Value);
      goto LABEL_10;
    }
    v20 = "key specified, but wrong type.";
    v21 = 22;
LABEL_26:
    sub_212807E8C(v21, (uint64_t)v20);
  }
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (!Mutable)
  {
    v20 = "cannot create passphrase array.\n";
    v21 = -4960;
    goto LABEL_26;
  }
  v7 = Mutable;
  CFArrayAppendValue(Mutable, Value);
LABEL_10:
  v9 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("new-passphrase-index"));
  if (v9)
  {
    v10 = CFNumberGetTypeID();
    if (v10 == CFGetTypeID(v9))
      sub_212806A98(v9, kCFNumberSInt32Type, &v22);
  }
  if (!v7)
  {
LABEL_14:
    v11 = DIGetBundleRef();
    v12 = sub_21281FFEC(v11, (int)CFSTR("Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved."), CFSTR("Enter a new password to secure %1$@. If you forget this password you will not be able to access the files stored on this image. Forgotten passwords cannot be retrieved."));
    (*(void (**)(_DWORD *, CFTypeRef, char *))(*(_QWORD *)a1 + 712))(a1, v12, cStr);
    v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v14 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    bzero(cStr, 0x400uLL);
    if (v14)
    {
      v15 = CFArrayCreateMutable(v13, 0, MEMORY[0x24BDBD690]);
      v7 = v15;
      if (v15)
      {
        CFArrayAppendValue(v15, v14);
        CFRelease(v14);
        if (v12)
          CFRelease(v12);
        goto LABEL_18;
      }
      v18 = "cannot create passphrase array.\n";
      v19 = -4960;
    }
    else
    {
      v18 = "passphrase is not valid UTF-8 string.";
      v19 = 999;
    }
    sub_212807E8C(v19, (uint64_t)v18);
  }
LABEL_18:
  v16 = (*(uint64_t (**)(_DWORD *, CFTypeRef, _QWORD))(*(_QWORD *)a1 + 720))(a1, v7, v22);
  if (v16)
    sub_212807E8C(v16, (uint64_t)"unable to change keys.");
  CFRelease(v7);
  return 0;
}

void sub_21281BCB4(_Unwind_Exception *exception_object, int a2)
{
  const void *v2;
  void *v5;

  if (a2)
  {
    if (v2)
      CFRelease(v2);
    v5 = __cxa_begin_catch(exception_object);
    if (a2 == 2)
      (*(uint64_t (**)(void *))(*(_QWORD *)v5 + 24))(v5);
    __cxa_end_catch();
    JUMPOUT(0x21281BC1CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21281BD9C()
{
  return 78;
}

uint64_t sub_21281BDA4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v5;
  int v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  const char *v12;
  int v13;
  unint64_t v14;
  BOOL v15;
  uint64_t result;

  v5 = *(_DWORD *)(a3 + 84);
  v6 = *(_DWORD *)(a3 + 48);
  if (*a2 != 2 * (v6 + (v5 >> 3)))
    return 0;
  v8 = a2[1];
  v9 = *(_QWORD *)(a5 + 8);
  if (v5 >= 8)
  {
    v10 = 0;
    v11 = *(_QWORD *)(a4 + 8);
    v12 = (const char *)a2[1];
    while (sscanf(v12, "%02hhx", v11 + v10) == 1)
    {
      ++v10;
      v12 += 2;
      if (v10 >= (unint64_t)*(unsigned int *)(a3 + 84) >> 3)
      {
        v6 = *(_DWORD *)(a3 + 48);
        goto LABEL_7;
      }
    }
    return 0;
  }
LABEL_7:
  if (!v6)
    return 1;
  v13 = 0;
  v14 = 0;
  do
  {
    v15 = sscanf((const char *)(v8 + (v13 & 0xFFFFFFFE) + (((unint64_t)*(unsigned int *)(a3 + 84) >> 2) & 0x3FFFFFFE)), "%02hhx", v9 + v14) == 1;
    result = v15;
    if (!v15)
      break;
    ++v14;
    v13 += 2;
  }
  while (v14 < *(unsigned int *)(a3 + 48));
  return result;
}

uint64_t sub_21281BEC0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 320))(a1, a2, 1);
}

uint64_t sub_21281BED0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  uint64_t v21;

  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  v7 = *(_QWORD *)(a1 + 488);
  v8 = *(_QWORD *)(a1 + 496);
  v9 = a2 % v7;
  v10 = v7 - a2 % v7;
  if (!v9)
    v10 = 0;
  v11 = v10 + a2;
  if (*(_DWORD *)(a1 + 480) == 1)
    v12 = v11 + 1276;
  else
    v12 = *(_QWORD *)(a1 + 504) + v11;
  if (a2 == v8)
    return 0;
  if (!v6)
    return 999;
  result = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v6 + 312))(v6, v12);
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a1 + 512) = v12;
    *(_QWORD *)(a1 + 496) = a2;
    result = sub_212808548(a1);
    if (!(_DWORD)result && a2 > v8 && a3)
    {
      v14 = malloc_type_calloc(1uLL, 32 * *(_QWORD *)(a1 + 488), 0x60D7344BuLL);
      v21 = 0;
      if (v14)
      {
        v15 = v14;
        v16 = a2 - v8;
        if (v16)
        {
          do
          {
            if (32 * *(_QWORD *)(a1 + 488) >= v16)
              v17 = v16;
            else
              v17 = 32 * *(_QWORD *)(a1 + 488);
            v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t *, void *))(*(_QWORD *)a1 + 336))(a1, v8, v17, &v21, v15);
            v16 -= v21;
            v8 += v21;
            if (v18)
              v19 = 1;
            else
              v19 = v21 == 0;
          }
          while (!v19 && v16 != 0);
        }
        free(v15);
        return 0;
      }
      return 12;
    }
  }
  return result;
}

int8x8_t sub_21281C024(uint64_t a1)
{
  int8x16_t v1;
  int8x8_t result;

  v1 = vrev32q_s8(*(int8x16_t *)(a1 + 32));
  *(int8x16_t *)(a1 + 16) = vrev32q_s8(*(int8x16_t *)(a1 + 16));
  *(int8x16_t *)(a1 + 32) = v1;
  *(int8x8_t *)(a1 + 48) = vrev32_s8(*(int8x8_t *)(a1 + 48));
  *(int8x16_t *)(a1 + 88) = vrev32q_s8(*(int8x16_t *)(a1 + 88));
  *(_DWORD *)(a1 + 136) = bswap32(*(_DWORD *)(a1 + 136));
  *(int8x8_t *)(a1 + 396) = vrev32_s8(*(int8x8_t *)(a1 + 396));
  *(_DWORD *)(a1 + 436) = bswap32(*(_DWORD *)(a1 + 436));
  *(int8x8_t *)(a1 + 696) = vrev32_s8(*(int8x8_t *)(a1 + 696));
  *(_DWORD *)(a1 + 736) = bswap32(*(_DWORD *)(a1 + 736));
  *(_DWORD *)(a1 + 996) = bswap32(*(_DWORD *)(a1 + 996));
  *(_QWORD *)(a1 + 1256) = bswap64(*(_QWORD *)(a1 + 1256));
  result = vrev32_s8(*(int8x8_t *)(a1 + 1264));
  *(int8x8_t *)(a1 + 1264) = result;
  *(_DWORD *)(a1 + 1272) = bswap32(*(_DWORD *)(a1 + 1272));
  return result;
}

const __CFDictionary *sub_21281C0C0(uint64_t a1)
{
  const __CFDictionary *Mutable;
  CFAllocatorRef *v2;
  const __CFNumber *Value;
  __int16 v4;
  CFNumberRef v5;
  __int16 valuePtr;

  Mutable = (const __CFDictionary *)sub_2127FCCB8(a1);
  v2 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (Mutable
    || (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) != 0)
  {
    valuePtr = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("owner-mode"));
    if (Value && CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr))
      v4 = valuePtr & 0x1C0;
    else
      v4 = 448;
    valuePtr = v4;
    v5 = CFNumberCreate(*v2, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("owner-mode"), v5);
    CFRelease(v5);
  }
  return Mutable;
}

void sub_21281C188(std::exception *a1)
{
  std::exception::~exception(a1);
  JUMPOUT(0x212BF43D0);
}

uint64_t sub_21281C1B0()
{
  return 78;
}

uint64_t sub_21281C1B8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 592))(a1) & 1) != 0)
    goto LABEL_4;
  if (*(_BYTE *)(a1 + 778))
  {
    result = sub_21281B250((_QWORD *)a1);
    if ((_DWORD)result)
      return result;
    goto LABEL_4;
  }
  v3 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 360))(v3);
  if (!(_DWORD)result)
  {
LABEL_4:
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 600))(a1);
    return 0;
  }
  return result;
}

uint64_t sub_21281C230(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  uint64_t v8;

  (*(void (**)(unsigned __int8 *))(*(_QWORD *)a1 + 608))(a1);
  if (((*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a1 + 592))(a1) & 1) != 0)
    return 0;
  v5 = a1[778];
  v6 = (*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a1 + 496))(a1);
  if (v5)
  {
    if (!v6)
      return 999;
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a1 + 496))(a1)
                             + 280);
    return v7();
  }
  if (!v6
    || (v8 = (*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a1 + 496))(a1),
        result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 368))(v8, a2),
        !(_DWORD)result))
  {
    v7 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(unsigned __int8 *))(*(_QWORD *)a1 + 496))(a1)
                             + 368);
    return v7();
  }
  return result;
}

uint64_t sub_21281C314(_BYTE *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1[778])
    return sub_21281B42C((uint64_t)a1, a2);
  v4 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 496))(a1);
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 376))(v4, a2);
}

uint64_t sub_21281C360(_BYTE *a1, _QWORD *a2)
{
  uint64_t v4;

  if (a1[778])
    return sub_21281B440((uint64_t)a1, a2);
  v4 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 496))(a1);
  return (*(uint64_t (**)(uint64_t, _QWORD *))(*(_QWORD *)v4 + 384))(v4, a2);
}

uint64_t sub_21281C3AC(_BYTE *a1, uint64_t a2)
{
  uint64_t v4;

  if (a1[778])
    return 78;
  v4 = (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 496))(a1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 392))(v4, a2);
}

uint64_t sub_21281C3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t result;
  uint64_t (*v11)(void);

  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 592))(a1))
    return 9;
  if (!*(_BYTE *)(a1 + 778))
  {
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1) + 400);
    return v11();
  }
  if (!a5)
    return 22;
  v9 = *(_QWORD *)(a1 + 768);
  result = 29;
  if ((uint64_t)v9 >= a2 && a3 + a2 <= v9)
  {
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1) + 328);
    return v11();
  }
  return result;
}

uint64_t sub_21281C4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9;
  uint64_t result;
  uint64_t (*v11)(void);

  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 592))(a1))
    return 9;
  if (!*(_BYTE *)(a1 + 778))
  {
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1) + 408);
    return v11();
  }
  if (!a5)
    return 22;
  v9 = *(_QWORD *)(a1 + 768);
  result = 29;
  if ((uint64_t)v9 >= a2 && a3 + a2 <= v9)
  {
    v11 = *(uint64_t (**)(void))(*(_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1) + 336);
    return v11();
  }
  return result;
}

BOOL sub_21281C5B8(uint64_t a1)
{
  return *(_DWORD *)(a1 + 292) > 1u;
}

__n128 sub_21281C5C8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a2 = *(_OWORD *)(a1 + 584);
  v2 = *(_OWORD *)(a1 + 600);
  v3 = *(_OWORD *)(a1 + 616);
  v4 = *(_OWORD *)(a1 + 648);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 632);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  result = *(__n128 *)(a1 + 664);
  v6 = *(_OWORD *)(a1 + 680);
  v7 = *(_OWORD *)(a1 + 696);
  *(_QWORD *)(a2 + 128) = *(_QWORD *)(a1 + 712);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

__n128 sub_21281C600(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a2 = *(_OWORD *)(a1 + 312);
  v2 = *(_OWORD *)(a1 + 328);
  v3 = *(_OWORD *)(a1 + 344);
  v4 = *(_OWORD *)(a1 + 376);
  *(_OWORD *)(a2 + 48) = *(_OWORD *)(a1 + 360);
  *(_OWORD *)(a2 + 64) = v4;
  *(_OWORD *)(a2 + 16) = v2;
  *(_OWORD *)(a2 + 32) = v3;
  result = *(__n128 *)(a1 + 392);
  v6 = *(_OWORD *)(a1 + 408);
  v7 = *(_OWORD *)(a1 + 424);
  *(_QWORD *)(a2 + 128) = *(_QWORD *)(a1 + 440);
  *(_OWORD *)(a2 + 96) = v6;
  *(_OWORD *)(a2 + 112) = v7;
  *(__n128 *)(a2 + 80) = result;
  return result;
}

uint64_t sub_21281C638(uint64_t a1)
{
  return *(unsigned int *)(a1 + 720);
}

uint64_t sub_21281C640(uint64_t a1)
{
  return *(_QWORD *)(a1 + 724);
}

uint64_t sub_21281C64C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, float, float))(*(_QWORD *)a1 + 792))(a1, 0.0, 100.0);
}

uint64_t sub_21281C664(_QWORD *a1, _QWORD *a2, _QWORD *a3, float a4, float a5)
{
  int v8;
  const __CFString *v9;
  const __CFAllocator *v10;
  uint64_t v11;
  CFStringRef v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;
  CFStringRef v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  CFStringRef v33;
  CFStringRef v34;
  uint64_t v36;
  float v37;
  int v38[34];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = a4;
  if (a2)
    *a2 = 0;
  if (a3)
    *a3 = 0;
  v8 = DIGetBundleRef();
  v9 = (const __CFString *)sub_21281FFEC(v8, (int)CFSTR("Validating \"%1$@\"\\U2026"), CFSTR("Validating \"%1$@\"\\U2026"));
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v11 = (*(uint64_t (**)(_QWORD *))(*a1 + 192))(a1);
  v12 = CFStringCreateWithFormat(v10, 0, v9, v11);
  sub_212814D30((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v12, 16, 0, 0);
  if (v12)
    CFRelease(v12);
  if (v9)
    CFRelease(v9);
  (*(void (**)(_QWORD *, int *))(*a1 + 744))(a1, v38);
  v13 = sub_2127F90FC(v38[0]);
  if (v13)
  {
    v14 = (char *)v13;
    v15 = (char *)sub_2127FA29C(v38);
    sub_212814D30((uint64_t)a1, 3, (uint64_t)a1, 2, 0, 0, 0);
    (*(void (**)(char *))(*(_QWORD *)v14 + 48))(v14);
    sub_212814D30((uint64_t)a1, 1, (uint64_t)a1, (uint64_t)&v37, 0, 0, 0);
    v36 = 0;
    v16 = (*(uint64_t (**)(_QWORD *))(*a1 + 272))(a1);
    if ((_DWORD)v16)
    {
      v17 = v16;
    }
    else
    {
      v22 = malloc_type_malloc(0x100000uLL, 0xAA107E25uLL);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v25 = 0;
        v26 = a5 - a4;
        v27 = a1[33];
        v28 = a4;
        v29 = v27;
        while (1)
        {
          if (!v29)
          {
            v32 = 0;
            goto LABEL_31;
          }
          v30 = v29 >= 0x100000 ? 0x100000 : v29;
          v31 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t *, void *))(*a1 + 328))(a1, v24, v30, &v36, v23);
          if (v31)
            break;
          (*(void (**)(char *, void *, uint64_t))(*(_QWORD *)v14 + 56))(v14, v23, v30);
          v25 += v30;
          v37 = a4 + (float)((float)(v25 / v27) * v26);
          if ((float)(v37 - v28) >= 1.0)
          {
            sub_212814D30((uint64_t)a1, 1, (uint64_t)a1, (uint64_t)&v37, 0, 0, 0);
            v28 = v37;
          }
          v24 += v30;
          v29 -= v30;
          if (sub_212814D30((uint64_t)a1, 2, (uint64_t)a1, 0, 0, 0, 0))
          {
            v32 = 111;
            goto LABEL_31;
          }
        }
        v32 = v31;
LABEL_31:
        free(v23);
        (*(void (**)(char *))(*(_QWORD *)v14 + 72))(v14);
        v33 = sub_2127FC0FC((uint64_t)a1, (uint64_t)v15, (uint64_t)v14);
        if (v33)
        {
          v34 = v33;
          sub_212814D30((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v33, 16, 0, 0);
          CFRelease(v34);
        }
        if ((*(unsigned int (**)(char *, char *))(*(_QWORD *)v15 + 152))(v15, v14))
          v17 = v32;
        else
          v17 = 116;
      }
      else
      {
        v17 = 12;
      }
      (*(void (**)(_QWORD *, _QWORD))(*a1 + 280))(a1, 0);
    }
    DIDiskImageObjectRelease(v14);
    if (v15)
      DIDiskImageObjectRelease(v15);
  }
  else
  {
    v18 = DIGetBundleRef();
    v19 = (const __CFString *)sub_21281FFEC(v18, (int)CFSTR("Unknown checksum type %1$ld."), CFSTR("Unknown checksum type %1$ld."));
    v20 = (*(uint64_t (**)(_QWORD *))(*a1 + 192))(a1);
    v21 = CFStringCreateWithFormat(v10, 0, v19, v20);
    sub_212814D30((uint64_t)a1, 0, (uint64_t)a1, (uint64_t)v21, 16, 0, 0);
    if (v21)
      CFRelease(v21);
    if (v19)
      CFRelease(v19);
    return 0;
  }
  return v17;
}

uint64_t sub_21281CA64(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 320))(a1, a2, 1);
}

uint64_t sub_21281CA74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  const void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v13 = 0;
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 592))(a1) & 1) != 0
    || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 616))(a1) & 1) != 0)
  {
    return 16;
  }
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 48))(a2);
  if (!(_DWORD)v6)
  {
    if (DIUDIFFileAccessGetResourceFile_0(a3, &v13))
    {
      v6 = 999;
    }
    else
    {
      v6 = (*(uint64_t (**)(char *, _QWORD, _QWORD))(*(_QWORD *)v13 + 288))(v13, 0, 0);
      if (!(_DWORD)v6)
      {
        v6 = (*(uint64_t (**)(char *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v13 + 304))(v13, a2, 0, 0);
        if (!(_DWORD)v6)
        {
          v6 = (*(uint64_t (**)(char *))(*(_QWORD *)v13 + 200))(v13);
          if (!(_DWORD)v6)
          {
            v6 = DIUDIFFileAccessWriteResourceFile_0(a3);
            if (!(_DWORD)v6)
            {
              v8 = (const void *)sub_2127FF784(a3);
              memcpy((void *)(a1 + 232), v8, 0x200uLL);
              v9 = *(_DWORD *)(a1 + 244);
              *(_BYTE *)(a1 + 778) = v9 & 1;
              if ((v9 & 1) != 0)
              {
                v11 = *(_QWORD *)(a1 + 272);
                v10 = *(_QWORD *)(a1 + 280);
                *(_QWORD *)(a1 + 768) = v10;
                *(_QWORD *)(a1 + 760) = v11;
                sub_2127F5B98(a1, v10);
                v12 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 496))(a1);
                (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v12 + 392))(v12, 0);
              }
              v6 = 0;
            }
          }
        }
      }
    }
    (*(void (**)(uint64_t))(*(_QWORD *)a2 + 56))(a2);
  }
  return v6;
}

uint64_t sub_21281CBF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  __int16 v11;

  v11 = 0;
  v10 = 0;
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, __int16 *))(*(_QWORD *)a1 + 96))(a1, a2, &v11);
  if ((_DWORD)v4)
    v5 = 1;
  else
    v5 = v11 == 0;
  if (!v5)
  {
    if (v11 < 1)
    {
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    }
    else
    {
      LOWORD(v6) = 1;
      while (1)
      {
        v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
        (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
        v4 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, void **))(*(_QWORD *)a1 + 112))(a1, a2, (__int16)v6, &v10);
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v7);
        if ((_DWORD)v4)
          break;
        v8 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)a1 + 192))(a1, v10);
        if ((_DWORD)v8)
          return v8;
        sub_212820098((void **)v10);
        v6 = (__int16)(v6 + 1);
        if (v6 > v11)
          return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
      }
    }
  }
  return v4;
}

uint64_t sub_21281CD0C(uint64_t a1, unsigned int (*a2)(uint64_t, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v12;
  void *v13;
  unsigned int v14;
  int v15;
  _OWORD v16[16];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15 = 0;
  v13 = 0;
  v12 = 0;
  memset(v16, 0, sizeof(v16));
  v6 = (*(uint64_t (**)(uint64_t, char *))(*(_QWORD *)a1 + 64))(a1, (char *)&v15 + 2);
  if (!(_DWORD)v6)
  {
    if (SHIWORD(v15) < 1)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    LOWORD(v7) = 1;
    while (1)
    {
      v8 = (*(uint64_t (**)(uint64_t, unsigned int *, _QWORD))(*(_QWORD *)a1 + 72))(a1, &v14, (__int16)v7);
      if ((_DWORD)v8)
        return v8;
      v8 = (*(uint64_t (**)(uint64_t, _QWORD, int *))(*(_QWORD *)a1 + 96))(a1, v14, &v15);
      if ((_DWORD)v8)
        return v8;
      if ((__int16)v15 >= 1)
      {
        LOWORD(v9) = 1;
        do
        {
          v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
          (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(a1, 0);
          v6 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, void **))(*(_QWORD *)a1 + 112))(a1, v14, (__int16)v9, &v13);
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 80))(a1, v10);
          if ((_DWORD)v6)
            return v6;
          v8 = (*(uint64_t (**)(uint64_t, void *, __int16 *, unsigned int *, _OWORD *))(*(_QWORD *)a1 + 208))(a1, v13, &v12, &v14, v16);
          if ((_DWORD)v8)
            return v8;
          if (!a2 || a2(a3, v14, v12))
          {
            v8 = (*(uint64_t (**)(uint64_t, void *))(*(_QWORD *)a1 + 192))(a1, v13);
            if ((_DWORD)v8)
              return v8;
            sub_212820098((void **)v13);
            v13 = 0;
          }
          v9 = (__int16)(v9 + 1);
        }
        while (v9 <= (__int16)v15);
      }
      v7 = (__int16)(v7 + 1);
      if (v7 > SHIWORD(v15))
        return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 200))(a1);
    }
  }
  return v6;
}

const char *sub_21281CF24()
{
  return "CResourceFile";
}

uint64_t sub_21281CF34(uint64_t a1, _BYTE *a2, uint64_t a3, int a4)
{
  uint64_t result;
  unsigned __int8 *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v14 = 0;
  if (!a2)
    return 4294967246;
  v13 = 0;
  *a2 = 0;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD **))(*(_QWORD *)a1 + 120))(a1, 1398034979, a3, &v14);
  if (!(_DWORD)result)
  {
    if (!v14)
      return 4294967104;
    result = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t *))(*(_QWORD *)a1 + 160))(a1, v14, &v13);
    if (!(_DWORD)result)
    {
      if (a4 >= 1 && *(__int16 *)*v14 >= a4)
      {
        v8 = (unsigned __int8 *)(*v14 + 2);
        if (a4 < 2)
        {
          v9 = 0;
        }
        else
        {
          v9 = 0;
          LOWORD(v10) = 1;
          do
          {
            v11 = *v8 + 1;
            v8 += v11;
            v9 += v11;
            v10 = (__int16)(v10 + 1);
          }
          while (v10 < a4);
        }
        v12 = *v8;
        if (v9 + v12 >= v13)
          return 4294967106;
        memmove(a2, v8, v12 + 1);
      }
      return 0;
    }
  }
  return result;
}

uint64_t sub_21281D048(uint64_t a1, unsigned int a2, const unsigned __int8 *a3, _QWORD *a4)
{
  void *v6;
  const __CFDictionary *v8;
  uint64_t result;
  void *v10;

  v10 = 0;
  if (a3 && a4)
  {
    v6 = *(void **)(a1 + 104);
    if (v6)
    {
      v8 = sub_21281D0DC(a1, a2, a3);
      if (v8)
      {
        result = sub_2127F7C8C(a1, a2, v8, &v10);
        v6 = v10;
      }
      else
      {
        v6 = 0;
        result = 4294967104;
      }
    }
    else
    {
      result = 4294967097;
    }
    goto LABEL_6;
  }
  result = 4294967246;
  if (a4)
  {
    v6 = 0;
LABEL_6:
    *a4 = v6;
  }
  return result;
}

const __CFDictionary *sub_21281D0DC(uint64_t a1, unsigned int a2, const unsigned __int8 *a3)
{
  const __CFArray *v4;
  const __CFArray *v5;
  CFIndex Count;
  CFStringRef v7;
  const __CFString *v8;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFString *Value;
  const __CFString *v13;
  CFTypeID v14;

  if (!*(_QWORD *)(a1 + 104))
    return 0;
  v4 = (const __CFArray *)sub_2127F7ABC(a1, a2);
  if (!v4)
    return 0;
  v5 = v4;
  Count = CFArrayGetCount(v4);
  v7 = CFStringCreateWithPascalString((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, 0);
  if (!v7)
    return 0;
  v8 = v7;
  if (Count < 1)
  {
LABEL_11:
    v11 = 0;
  }
  else
  {
    v9 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v9);
      if (ValueAtIndex)
      {
        v11 = ValueAtIndex;
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Name"));
        if (Value)
        {
          v13 = Value;
          v14 = CFGetTypeID(Value);
          if (v14 == CFStringGetTypeID() && CFStringCompare(v13, v8, 0) == kCFCompareEqualTo)
            break;
        }
      }
      if (Count == ++v9)
        goto LABEL_11;
    }
  }
  CFRelease(v8);
  return v11;
}

uint64_t sub_21281D1D0(uint64_t a1, uint64_t a2)
{
  nullsub_4(a2);
  return sub_21281FFF4();
}

uint64_t sub_21281D1EC(uint64_t a1, uint64_t a2)
{
  nullsub_4(a2);
  return sub_21281FFF4();
}

uint64_t sub_21281D208(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t result;

  result = 4294967246;
  if (a2)
  {
    if (a3)
    {
      *a3 = sub_212820120(a2);
      return sub_21281FFF4();
    }
  }
  return result;
}

uint64_t sub_21281D240(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v3;
  size_t Count;
  int64_t v6;
  const void **v7;
  const void **v8;
  const void **v9;
  const void **v10;
  uint64_t v11;
  const __CFArray *v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  const __CFDictionary *ValueAtIndex;
  uint64_t v17;
  __int16 v19;
  uint64_t v20;

  if (!a2)
    return 4294967246;
  v3 = *(const __CFDictionary **)(a1 + 104);
  if (!v3)
    return 4294967246;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  Count = CFDictionaryGetCount(v3);
  if (!Count)
    return 0;
  v6 = Count;
  v7 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  if (!v7)
    return 4294967188;
  v8 = v7;
  v9 = (const void **)malloc_type_calloc(v6, 8uLL, 0x6004044C4A2DFuLL);
  if (v9)
  {
    v10 = v9;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 104), v8, v9);
    if (v6 < 1)
    {
      v17 = 0;
    }
    else
    {
      v11 = 0;
      while (1)
      {
        sub_2127F820C((const __CFString *)v8[v11]);
        v12 = (const __CFArray *)v10[v11];
        v13 = CFArrayGetCount(v12);
        if (v13 >= 1)
          break;
LABEL_14:
        if (++v11 >= v6)
        {
          v17 = 4294967104;
          goto LABEL_30;
        }
      }
      v14 = v13;
      v15 = 0;
      while (1)
      {
        v20 = 0;
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v15);
        if (sub_2127F7E88((int)ValueAtIndex, ValueAtIndex, &v20))
        {
          if (v20 == a2)
            break;
        }
        if (v14 == ++v15)
          goto LABEL_14;
      }
      v19 = 0;
      if (sub_2127F74E4(ValueAtIndex, CFSTR("Attributes"), &v19))
      {
        if ((v19 & 8) != 0)
        {
          v17 = 4294967100;
        }
        else
        {
          CFArrayRemoveValueAtIndex(v12, v15);
          if (v14 == 1)
            CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), v8[v11]);
          v17 = 0;
          *(_WORD *)(a1 + 112) |= 0x20u;
        }
      }
      else
      {
        v17 = 4294967097;
      }
    }
LABEL_30:
    free(v10);
  }
  else
  {
    v17 = 4294967188;
  }
  free(v8);
  return v17;
}

uint64_t sub_21281D424(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  const void *v4;

  if (!*(_QWORD *)(a1 + 104))
    return 4294967246;
  if (!*(_BYTE *)(a1 + 114))
    return 4294967242;
  result = (uint64_t)sub_2127F7B14(a2);
  if (result)
  {
    v4 = (const void *)result;
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 104), (const void *)result);
    *(_WORD *)(a1 + 112) |= 0x20u;
    CFRelease(v4);
    return 0;
  }
  return result;
}

uint64_t sub_21281D494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  v6 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)a1 + 320))(a1, a2, a3, a4, a5, &v6);
}

uint64_t sub_21281D4C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 328))(a1, a2, a3, a4, 0);
}

uint64_t sub_21281D4D0(uint64_t a1, _WORD *a2)
{
  if (a2)
    *a2 = *(_WORD *)(a1 + 112);
  return 0;
}

uint64_t sub_21281D4E4(uint64_t a1, __int16 a2)
{
  *(_WORD *)(a1 + 112) = a2;
  return 0;
}

const __CFArray *sub_21281D4F0(uint64_t a1, unsigned int a2, _WORD *a3)
{
  const __CFArray *result;
  const __CFArray *v5;
  CFIndex Count;
  __int16 v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  __int16 v10;

  if (!a3)
    return (const __CFArray *)4294967246;
  *a3 = 0;
  if (!*(_QWORD *)(a1 + 104))
    return 0;
  result = (const __CFArray *)sub_2127F7ABC(a1, a2);
  if (result)
  {
    v5 = result;
    Count = CFArrayGetCount(result);
    while (1)
    {
      v7 = random();
      if (Count < 1)
        break;
      v8 = 0;
      while (1)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
        if (ValueAtIndex)
        {
          v10 = 0;
          if (sub_2127F74E4(ValueAtIndex, CFSTR("ID"), &v10))
          {
            if (v10 == v7)
              break;
          }
        }
        if (Count == ++v8)
          goto LABEL_11;
      }
    }
LABEL_11:
    result = 0;
    *a3 = v7;
  }
  return result;
}

uint64_t sub_21281D5B8()
{
  return 4294967246;
}

const char *sub_21281D5C0()
{
  return "CXMLResourceFile";
}

void sub_21281D5CC(FILE *a1, const __CFString *a2, CFStringEncoding a3)
{
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  UInt8 *v8;
  UInt8 *v9;
  int v10;
  CFIndex usedBufLen;
  CFRange v12;

  fflush(a1);
  if (a2)
  {
    Length = CFStringGetLength(a2);
    MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, a3);
    v8 = (UInt8 *)malloc_type_malloc(MaximumSizeForEncoding, 0xC448D259uLL);
    if (v8)
    {
      v9 = v8;
      usedBufLen = 0;
      v12.length = CFStringGetLength(a2);
      v12.location = 0;
      CFStringGetBytes(a2, v12, a3, 0, 0, v9, MaximumSizeForEncoding, &usedBufLen);
      v10 = fileno(a1);
      write(v10, v9, usedBufLen);
      fflush(a1);
      free(v9);
    }
  }
}

void sub_21281D694(const void *a1, const void *a2, void *cf)
{
  CFTypeID v6;

  v6 = CFGetTypeID(cf);
  if (v6 == CFDictionaryGetTypeID())
    CFDictionaryReplaceValue((CFMutableDictionaryRef)cf, a1, a2);
}

uint64_t sub_21281D6F4(char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  return vfprintf((FILE *)*MEMORY[0x24BDAC8D8], a1, va);
}

size_t sub_21281D730(uint64_t a1)
{
  FILE **v2;
  size_t result;
  int v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  FILE *v8;
  const char *v9;
  uint64_t v10;

  v2 = (FILE **)MEMORY[0x24BDAC8D8];
  result = fwrite("## ? ...score.. ...age... ...use... ...start ... ...length...\n", 0x3EuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
  v4 = *(_DWORD *)(a1 + 208);
  if (v4 >= 1)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = *(_QWORD *)(a1 + 216);
      v7 = *(_QWORD *)(v6 + 8 * i);
      if (v7)
      {
        v8 = *v2;
        if (*(_BYTE *)(v7 + 24))
          v9 = "+";
        else
          v9 = " ";
        v10 = sub_2127FDA98(*(_QWORD *)(v6 + 8 * i));
        result = fprintf(v8, "%2d %1.1s %+9qd %9qd %9qd %12qd %12qd\n", i, v9, v10, *(_QWORD *)(v7 + 16), *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 32), *(_QWORD *)(v7 + 40));
        v4 = *(_DWORD *)(a1 + 208);
      }
    }
  }
  return result;
}

_QWORD *sub_21281D814(_QWORD *a1)
{
  void *v2;

  *a1 = &off_24CE2BF00;
  v2 = (void *)a1[7];
  if (v2)
    free(v2);
  return a1;
}

const __CFString *DICopyStrError(int *a1)
{
  return sub_21280AB60(a1, 0);
}

uint64_t sub_21281D854(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  unsigned int *v3;

  *(int8x8_t *)result = vrev32_s8(*(int8x8_t *)result);
  *(_DWORD *)(result + 8) = bswap32(*(_DWORD *)(result + 8));
  *(_QWORD *)(result + 12) = bswap64(*(_QWORD *)(result + 12));
  if (a2)
  {
    v2 = a2;
    v3 = (unsigned int *)(result + 56);
    do
    {
      *v3 = bswap32(*v3);
      ++v3;
      --v2;
    }
    while (v2);
  }
  return result;
}

const char *sub_21281D8A0()
{
  return "CDIApplePartitionScheme";
}

const char *sub_21281D8B0()
{
  return "CDIFDiskPartitionScheme";
}

uint64_t sub_21281D8C0()
{
  return 1;
}

const char *sub_21281D8C8()
{
  return "CDINoPartitionScheme";
}

void sub_21281D8DC(const __CFArray *a1, CFArrayRef theArray, unint64_t a3, char a4)
{
  const __CFArray *MutableCopy;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  CFTypeID v12;
  unint64_t v13;
  uint64_t v14;
  __CFArray *v15;
  CFIndex v16;
  unint64_t v17;
  unint64_t v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFDictionary *v27;
  const void *v29;
  const void *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  CFRange v35;
  CFRange v36;

  v33 = 0;
  v34 = 0;
  MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theArray);
  sub_21281DB30(a1, 1);
  sub_21281DB30(MutableCopy, 1);
  v35.length = CFArrayGetCount(a1);
  v35.location = 0;
  CFArraySortValues(a1, v35, (CFComparatorFunction)sub_2128046A0, 0);
  v31 = 0;
  v32 = 0;
  v29 = 0;
  v30 = 0;
  Count = CFArrayGetCount(MutableCopy);
  if (Count >= 1)
  {
    v8 = Count;
    for (i = 0; i != v8; ++i)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(MutableCopy, i);
      if (ValueAtIndex)
      {
        v11 = ValueAtIndex;
        v12 = CFGetTypeID(ValueAtIndex);
        if (v12 == CFDictionaryGetTypeID())
        {
          if (sub_212804784(v11, &v32, &v31, 0, (uint64_t *)&v30, (uint64_t *)&v29))
          {
            v14 = v31;
            v13 = v32;
            v15 = sub_212804984(a1, a3, 0);
            v16 = CFArrayGetCount(v15);
            if (v16 >= 1)
            {
              v17 = v13 + v14 - 1;
              v18 = v16 + 1;
              do
              {
                v19 = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v18 - 2);
                if (v19)
                {
                  v20 = v19;
                  v21 = CFGetTypeID(v19);
                  if (v21 == CFDictionaryGetTypeID())
                  {
                    if (sub_212804784(v20, &v34, &v33, 0, 0, 0))
                    {
                      if (v34 <= v17)
                      {
                        v24 = v34 + v33 - 1;
                        if (v24 >= v32)
                        {
                          if (v34 <= v32)
                            v25 = v32;
                          else
                            v25 = v34;
                          if (v24 >= v17)
                            v26 = v17;
                          else
                            v26 = v34 + v33 - 1;
                          v27 = sub_2128036AC(v25, v26 - v25 + 1, 0, v30, v29, 0, v22, v23, 0);
                          CFArrayAppendValue(a1, v27);
                          CFRelease(v27);
                        }
                      }
                    }
                  }
                }
                --v18;
              }
              while (v18 > 1);
            }
            CFRelease(v15);
          }
        }
      }
    }
  }
  if ((a4 & 2) != 0)
  {
    sub_212804910(a1, a3, (a4 & 0x10) != 0);
  }
  else
  {
    v36.length = CFArrayGetCount(a1);
    v36.location = 0;
    CFArraySortValues(a1, v36, (CFComparatorFunction)sub_2128046A0, 0);
  }
  CFRelease(MutableCopy);
}

void sub_21281DB30(const __CFArray *a1, int a2)
{
  CFIndex Count;
  unint64_t v5;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  CFTypeID v8;
  int v9;
  CFStringRef theString1;

  Count = CFArrayGetCount(a1);
  if (Count >= 1)
  {
    theString1 = 0;
    v9 = 0;
    v5 = Count + 1;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5 - 2);
      if (ValueAtIndex)
      {
        v7 = ValueAtIndex;
        v8 = CFGetTypeID(ValueAtIndex);
        if (v8 == CFDictionaryGetTypeID()
          && sub_212804784(v7, 0, 0, &v9, (uint64_t *)&theString1, 0)
          && CFStringCompare(theString1, CFSTR("Apple_Free"), 1uLL) == kCFCompareEqualTo
          && (!a2 || !v9))
        {
          CFArrayRemoveValueAtIndex(a1, v5 - 2);
        }
      }
      --v5;
    }
    while (v5 > 1);
  }
}

__CFDictionary *sub_21281DC14(uint64_t a1, uint64_t a2, int a3, const void *a4, const void *a5, const void *a6, const __CFString **a7)
{
  const __CFAllocator *v11;
  __CFDictionary *Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  const __CFString *v19;
  __CFDictionary *v20;
  const void *v21;
  const __CFString **v22;
  const void **v23;
  const void **v26;
  int v27;
  uint64_t v28;
  uint64_t valuePtr;

  v28 = a2;
  valuePtr = a1;
  v27 = a3;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return Mutable;
  v13 = CFNumberCreate(v11, kCFNumberLongLongType, &valuePtr);
  if (!v13)
    goto LABEL_8;
  v14 = v13;
  CFDictionarySetValue(Mutable, CFSTR("partition-start"), v13);
  CFRelease(v14);
  v15 = CFNumberCreate(v11, kCFNumberLongLongType, &v28);
  if (!v15)
    goto LABEL_8;
  v16 = v15;
  CFDictionarySetValue(Mutable, CFSTR("partition-length"), v15);
  CFRelease(v16);
  if (!a3)
  {
    CFDictionarySetValue(Mutable, CFSTR("partition-synthesized"), (const void *)*MEMORY[0x24BDBD270]);
    if (!a4)
      goto LABEL_11;
    goto LABEL_10;
  }
  v17 = CFNumberCreate(v11, kCFNumberSInt32Type, &v27);
  if (!v17)
  {
LABEL_8:
    CFRelease(Mutable);
    return 0;
  }
  v18 = v17;
  CFDictionarySetValue(Mutable, CFSTR("partition-number"), v17);
  CFRelease(v18);
  if (a4)
LABEL_10:
    CFDictionarySetValue(Mutable, CFSTR("partition-hint"), a4);
LABEL_11:
  if (a5)
    CFDictionarySetValue(Mutable, CFSTR("partition-name"), a5);
  if (!a6)
    goto LABEL_16;
  v19 = CFSTR("partition-data");
  v20 = Mutable;
  v21 = a6;
  while (1)
  {
    CFDictionarySetValue(v20, v19, v21);
LABEL_16:
    v22 = a7;
    v26 = (const void **)(a7 + 1);
    v19 = *v22;
    if (!*v22)
      break;
    v23 = v26;
    a7 = (const __CFString **)(v26 + 1);
    v21 = *v23;
    v20 = Mutable;
  }
  return Mutable;
}

const char *sub_21281DDE4()
{
  return "CDIPartitionScheme";
}

uint64_t sub_21281DDF0(uint64_t a1)
{
  uint64_t v2;

  sub_2127F2FD0(a1);
  *(_QWORD *)v2 = &off_24CE2C138;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  sub_2127F32D4(v2, CFSTR("thread-safe"), (const void *)*MEMORY[0x24BDBD270]);
  return a1;
}

void sub_21281DE54(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3D40(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_21281DE6C(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2C138;
  sub_2127F3B74(a1, 1);
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1) & 1) == 0)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(a1 + 256))(a1, *(_QWORD *)(a1 + 272), 1);
  *(_OWORD *)(a1 + 248) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  return sub_2127F3D40(a1);
}

void sub_21281DEE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_2127F3D40(v1);
  _Unwind_Resume(a1);
}

void sub_21281DF00(uint64_t a1)
{
  sub_21281DE6C(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281DF34(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406D51CF38);
  _Unwind_Resume(a1);
}

uint64_t sub_21281DF58(uint64_t a1, CFDictionaryRef theDict, char **a3, _QWORD *a4)
{
  const void *Value;
  const void *v8;
  CFTypeID TypeID;
  char *v10;
  __n128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a4)
    *a4 = 0;
  if (a1 && theDict && a3)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("VectoredBackingStoreCallbackData"));
    if (!Value)
      return 22;
    v8 = Value;
    TypeID = CFDataGetTypeID();
    if (TypeID != CFGetTypeID(v8))
      return 22;
    v10 = (char *)operator new();
    sub_21281DDF0((uint64_t)v10);
    v11 = sub_21281E090((uint64_t)v10, (CFDataRef)v8);
    v13 = v12;
    if (!(_DWORD)v12)
    {
      v13 = (*(uint64_t (**)(char *, uint64_t, __n128))(*(_QWORD *)v10 + 696))(v10, a1, v11);
      if (!(_DWORD)v13)
      {
        v14 = sub_2127F3728((uint64_t)theDict);
        v13 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)v10 + 80))(v10, v14);
        if (!(_DWORD)v13)
          goto LABEL_14;
      }
    }
    sub_2127F38CC(v10);
LABEL_13:
    v10 = 0;
LABEL_14:
    *a3 = v10;
    return v13;
  }
  v13 = 22;
  if (a3)
    goto LABEL_13;
  return v13;
}

void sub_21281E06C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10E1C406D51CF38);
  _Unwind_Resume(a1);
}

__n128 sub_21281E090(uint64_t a1, CFDataRef theData)
{
  __n128 result;
  uint64_t v5;
  __int128 v6;
  UInt8 buffer[8];
  CFRange v8;

  *(_QWORD *)buffer = 0;
  if (theData && CFDataGetLength(theData) == 8)
  {
    v8.location = 0;
    v8.length = 8;
    CFDataGetBytes(theData, v8, buffer);
    v5 = *(_QWORD *)buffer;
    if (!**(_DWORD **)buffer)
    {
      v6 = *(_OWORD *)(*(_QWORD *)buffer + 8);
      *(_QWORD *)(a1 + 272) = v6;
      *(_OWORD *)(a1 + 208) = v6;
      *(_OWORD *)(a1 + 224) = *(_OWORD *)(v5 + 24);
      *(_OWORD *)(a1 + 240) = *(_OWORD *)(v5 + 40);
      result = *(__n128 *)(v5 + 56);
      *(__n128 *)(a1 + 256) = result;
    }
  }
  return result;
}

uint64_t sub_21281E120(_QWORD *a1, const __CFURL *a2)
{
  sub_2127F3404(a1, a2);
  return (*(uint64_t (**)(_QWORD *))(*a1 + 688))(a1);
}

uint64_t sub_21281E14C(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t v3;
  CFStringRef v4;
  CFStringRef v5;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = getpid();
  v4 = CFStringCreateWithFormat(v2, 0, CFSTR("%d:%p"), v3, a1);
  if (!v4)
    return 999;
  v5 = v4;
  (*(void (**)(uint64_t, CFStringRef))(*(_QWORD *)a1 + 552))(a1, v4);
  CFRelease(v5);
  return 0;
}

uint64_t sub_21281E1C8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
  {
    if ((_DWORD)a2)
    {
      if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1) == (_DWORD)a2)
        return 0;
      else
        return 13;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a1 + 216))(a1, *(_QWORD *)(a1 + 272), a2);
    if (!(_DWORD)result)
      return sub_2127F4354(a1, a2);
  }
  return result;
}

uint64_t sub_21281E24C(uint64_t a1)
{
  uint64_t result;

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1) & 1) != 0
    || (result = (*(uint64_t (**)(uint64_t, _QWORD))(a1 + 224))(a1, *(_QWORD *)(a1 + 272)), !(_DWORD)result))
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 576))(a1);
    return 0;
  }
  return result;
}

uint64_t sub_21281E2A0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 584))(a1);
  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1) & 1) != 0)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a1 + 256))(a1, *(_QWORD *)(a1 + 272), a2);
}

uint64_t sub_21281E300(uint64_t a1, _QWORD *a2)
{
  if (!a2)
    return 22;
  *a2 = 0;
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD *))(a1 + 264))(a1, *(_QWORD *)(a1 + 272), a2);
}

uint64_t sub_21281E31C(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;

  if (a4)
    *a4 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
    return 9;
  result = 22;
  if (a4)
  {
    if (a5)
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t))(a1 + 232))(a1, *(_QWORD *)(a1 + 272), a2, a3, a4, a5);
  }
  return result;
}

uint64_t sub_21281E3B4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  uint64_t result;

  if (a4)
    *a4 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 568))(a1))
    return 9;
  result = 22;
  if (a4 && a5)
  {
    if ((*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1))
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t, _QWORD *, uint64_t))(a1 + 240))(a1, *(_QWORD *)(a1 + 272), a2, a3, a4, a5);
    else
      return 1;
  }
  return result;
}

uint64_t sub_21281E468(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(a1 + 248))(a1, *(_QWORD *)(a1 + 272), a2);
}

const char *sub_21281E478()
{
  return "CVectoredBackingStore";
}

uint64_t sub_21281E484()
{
  return 1;
}

_QWORD *sub_21281E48C(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  sub_212810C60((uint64_t)a1);
  *v2 = &off_24CE2C420;
  v2[16] = 32;
  a1[15] = malloc_type_calloc(1uLL, 0x20uLL, 0x4F440149uLL);
  a1[14] = malloc_type_malloc(0x68uLL, 0x1000040ED882C02uLL);
  v3 = MEMORY[0x24BDAC370];
  a1[17] = MEMORY[0x24BDAC368];
  a1[18] = v3;
  a1[19] = MEMORY[0x24BDAC360];
  return a1;
}

void sub_21281E518(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_212810DAC(v1);
  _Unwind_Resume(a1);
}

void sub_21281E538(_QWORD *a1)
{
  sub_212810DAC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281E56C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21281E590()
{
  return "CSHA256Checksum";
}

uint64_t sub_21281E59C()
{
  return 7;
}

const __CFString *sub_21281E5A4()
{
  return CFSTR("SHA256");
}

const __CFString *sub_21281E5B0()
{
  return CFSTR("SHA-256");
}

_QWORD *sub_21281E5BC(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  sub_212810C60((uint64_t)a1);
  *v2 = &off_24CE2C4F0;
  v2[16] = 48;
  a1[15] = malloc_type_calloc(1uLL, 0x30uLL, 0xD3DCB291uLL);
  a1[14] = malloc_type_malloc(0xD0uLL, 0x10000400F93440CuLL);
  v3 = MEMORY[0x24BDAC390];
  a1[17] = MEMORY[0x24BDAC388];
  a1[18] = v3;
  a1[19] = MEMORY[0x24BDAC380];
  return a1;
}

void sub_21281E648(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_212810DAC(v1);
  _Unwind_Resume(a1);
}

void sub_21281E668(_QWORD *a1)
{
  sub_212810DAC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281E69C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21281E6C0()
{
  return "CSHA384Checksum";
}

uint64_t sub_21281E6CC()
{
  return 8;
}

const __CFString *sub_21281E6D4()
{
  return CFSTR("SHA384");
}

const __CFString *sub_21281E6E0()
{
  return CFSTR("SHA-384");
}

_QWORD *sub_21281E6EC(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;

  sub_212810C60((uint64_t)a1);
  *v2 = &off_24CE2C5C0;
  v2[16] = 64;
  a1[15] = malloc_type_calloc(1uLL, 0x40uLL, 0xEC171A1AuLL);
  a1[14] = malloc_type_malloc(0xD0uLL, 0x10000400F93440CuLL);
  v3 = MEMORY[0x24BDAC3B0];
  a1[17] = MEMORY[0x24BDAC3A8];
  a1[18] = v3;
  a1[19] = MEMORY[0x24BDAC3A0];
  return a1;
}

void sub_21281E778(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_212810DAC(v1);
  _Unwind_Resume(a1);
}

void sub_21281E798(_QWORD *a1)
{
  sub_212810DAC(a1);
  JUMPOUT(0x212BF43D0);
}

void sub_21281E7CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10B1C4065FB450FLL);
  _Unwind_Resume(a1);
}

const char *sub_21281E7F0()
{
  return "CSHA512Checksum";
}

uint64_t sub_21281E7FC()
{
  return 9;
}

const __CFString *sub_21281E804()
{
  return CFSTR("SHA512");
}

const __CFString *sub_21281E810()
{
  return CFSTR("SHA-512");
}

uint64_t sub_21281E81C(char *a1, unsigned int a2, int a3, unint64_t a4, __CFDictionary **a5, void ****a6, int *a7, __CFArray **a8, char a9)
{
  __CFArray *Mutable;
  uint64_t v18;
  __CFDictionary *v19;
  CFTypeID v20;
  uint64_t v21;
  CFTypeID v22;
  CFTypeID TypeID;
  _BOOL4 v24;
  int v25;
  void ***v26;
  char v27;
  const __CFString *v29;
  _BOOL4 v30;
  int Count;
  int v32;
  CFIndex v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  const __CFString *v40;
  char *v41;
  uint64_t *v42;
  uint64_t MKMediaRef;
  const void *v44;
  char *v45;
  uint64_t *v46;
  uint64_t v47;
  const __CFDictionary *v48;
  unint64_t v49;
  unsigned int v50;
  uint64_t v51;
  char *v52;
  uint64_t *v53;
  uint64_t v54;
  __CFDictionary *v55;
  const __CFNumber *v56;
  const __CFArray *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unsigned int v63;
  unint64_t v64;
  __CFDictionary *v65;
  BOOL v66;
  __CFDictionary *v67;
  BOOL v68;
  const __CFNumber *v69;
  const __CFArray *v70;
  const __CFNumber *v71;
  const __CFArray *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  __CFDictionary *v76;
  const __CFNumber *v77;
  const __CFArray *v78;
  int v79;
  const __CFString *v80;
  CFStringRef v81;
  uint64_t v82;
  unint64_t v83;
  int v84;
  unint64_t v85;
  const __CFDictionary *v86;
  const __CFDictionary *v87;
  _BOOL4 v88;
  void *v89;
  int v90;
  int v91;
  __CFArray *v92;
  unint64_t v93;
  int v94;
  uint64_t v95;
  void ***v96;
  const __CFArray *theArray;
  char *v98;
  unsigned int v99;
  const __CFAllocator *allocator;
  int *v101;
  uint64_t *v102;
  void *v103;
  const __CFString *v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v109;
  int64_t valuePtr;
  void *value[2];

  allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  if (a8)
    *a8 = 0;
  v101 = a7;
  if (!a1)
  {
    v19 = 0;
    v25 = 0;
    v26 = 0;
    v21 = 22;
    goto LABEL_32;
  }
  v99 = a2;
  if (a2 == 6)
    v18 = 31;
  else
    v18 = 23;
  value[0] = 0;
  v98 = a1;
  v19 = sub_21280275C(a1, v18);
  v20 = CFGetTypeID(v19);
  if (v20 == CFDictionaryGetTypeID())
  {
    v21 = 999;
    if (CFDictionaryGetValueIfPresent(v19, CFSTR("partitions"), (const void **)value))
    {
      v22 = CFGetTypeID(value[0]);
      TypeID = CFArrayGetTypeID();
      v24 = v22 != TypeID;
      if (v22 == TypeID)
        v21 = 0;
      else
        v21 = 999;
      if (!v19)
        goto LABEL_25;
LABEL_23:
      if (v24)
      {
        CFRelease(v19);
        v19 = 0;
      }
      goto LABEL_25;
    }
  }
  else
  {
    v21 = 999;
  }
  v24 = 1;
  if (v19)
    goto LABEL_23;
LABEL_25:
  if ((_DWORD)v21)
  {
LABEL_26:
    v26 = 0;
    goto LABEL_27;
  }
  theArray = (const __CFArray *)CFDictionaryGetValue(v19, CFSTR("partitions"));
  v29 = (const __CFString *)CFDictionaryGetValue(v19, CFSTR("partition-scheme"));
  if (v29)
    v30 = CFStringCompare(v29, CFSTR("Apple"), 0) == kCFCompareEqualTo;
  else
    v30 = 0;
  Count = CFArrayGetCount(theArray);
  if (v99 == 5)
  {
    value[0] = &stru_24CE2CFF0;
    v32 = CFArrayGetCount(theArray);
    sub_212806210(theArray, v32 - 1, 0, 0, value, 0);
    if (value[0])
      v32 -= CFStringCompare((CFStringRef)value[0], CFSTR("Apple_Free"), 0) == kCFCompareEqualTo;
    v99 = 2;
  }
  else
  {
    v32 = Count;
  }
  v96 = (void ***)malloc_type_calloc(v32, 8uLL, 0x80040B8603338uLL);
  if (!v96)
  {
    v26 = 0;
    v25 = 0;
    v27 = 0;
    v21 = 12;
    goto LABEL_28;
  }
  v105 = 0;
  v107 = 0;
  v91 = v32;
  if (v32 < 1)
  {
LABEL_211:
    v21 = 0;
LABEL_212:
    if (!a6)
      goto LABEL_219;
LABEL_217:
    if ((_DWORD)v21)
      goto LABEL_219;
    v26 = v96;
    v25 = v91;
LABEL_220:
    v27 = 1;
    if (!a5)
      goto LABEL_28;
    goto LABEL_30;
  }
  v90 = a3;
  v33 = 0;
  v95 = v32;
  v106 = 0;
  v34 = -2;
  if (v32 != 1)
    v34 = 0;
  v104 = 0;
  v88 = a9 != 0;
  v102 = 0;
  v103 = 0;
  v35 = -1;
  if (!v30)
    v35 = v34;
  v93 = a4;
  v94 = v35;
  v89 = (void *)*MEMORY[0x24BDBD270];
  v92 = Mutable;
  while (1)
  {
    v36 = sub_212806210(theArray, v33, &v107, &v106, (void **)&v104, &v103);
    if ((_DWORD)v36)
    {
LABEL_214:
      v21 = v36;
LABEL_215:
      sub_21280F418(v96, v95);
      goto LABEL_26;
    }
    v37 = sub_2127FFBC8(&v102);
    if ((_DWORD)v37)
      break;
    v38 = v102;
    v96[v33] = (void **)v102;
    v39 = *v38;
    *(_QWORD *)(v39 + 8) = v107;
    *(_QWORD *)(v39 + 16) = 0;
    *(_DWORD *)(v39 + 36) = v94 + v33;
    if (CFStringCompare(v104, CFSTR("Apple_HFS"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("Apple_HFSX"), 0) == kCFCompareEqualTo)
    {
      v36 = sub_212802440(v98, v107, v106, (uint64_t *)&v105);
      if ((_DWORD)v36)
        goto LABEL_214;
      v41 = v105;
      v42 = v102;
      v109 = 0;
      valuePtr = 0;
      value[0] = 0;
      v108 = 0;
      MKMediaRef = DIMediaKitCreateMKMediaRef((uint64_t)v105, (uint64_t)allocator, 0, (uint64_t *)value);
      if ((_DWORD)MKMediaRef)
      {
        v21 = MKMediaRef;
        v44 = 0;
        a4 = v93;
LABEL_124:
        if (value[0])
        {
          CFRelease(value[0]);
          value[0] = 0;
        }
        if (v44)
          CFRelease(v44);
        Mutable = v92;
        goto LABEL_185;
      }
      v49 = (*(uint64_t (**)(char *))(*(_QWORD *)v41 + 96))(v41);
      v44 = 0;
      v50 = 0;
      if (v99 <= 6)
      {
        if (((1 << v99) & 0x2C) != 0)
        {
          v108 = v49;
          v51 = (uint64_t)v42;
          a4 = v93;
          v50 = sub_21281F6C4(v51, v49, v90, v93);
          v44 = 0;
          if (!v50)
            v49 = 0;
          goto LABEL_118;
        }
        if (((1 << v99) & 0x42) != 0)
        {
          v55 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          CFDictionarySetValue(v55, CFSTR("Record Runs"), v89);
          CFDictionarySetValue(v55, CFSTR("Record Container"), v89);
          CFDictionarySetValue(v55, CFSTR("Record Markers"), v89);
          v44 = (const void *)MKCFCreateFSInfo();
          if (v55)
            CFRelease(v55);
          v50 = v109;
          if (!v109)
          {
            if (v44)
            {
              v56 = (const __CFNumber *)sub_2127FE630((const __CFDictionary *)v44, CFSTR("Volume block size"));
              if (v56)
              {
                if (CFNumberGetValue(v56, kCFNumberSInt64Type, &valuePtr))
                {
                  valuePtr >>= 9;
                  v57 = (const __CFArray *)sub_212802380((const __CFDictionary *)v44, CFSTR("Data Runs"));
                  if (v57)
                  {
                    v50 = sub_21281F89C(v42, v57, v49, v90, v93, v88, (unint64_t *)&v108);
                    if (v50)
                    {
                      a4 = v93;
                    }
                    else
                    {
                      v49 -= v108;
                      v108 = v49;
                      v50 = sub_21281F6C4((uint64_t)v42, v49, 2, v93);
                      a4 = v93;
                      if (!v50)
                        v49 -= v108;
                    }
                    goto LABEL_118;
                  }
                }
              }
            }
            v50 = 999;
          }
        }
      }
      a4 = v93;
LABEL_118:
      if (v49)
        v66 = v50 == 0;
      else
        v66 = 0;
      if (v66)
        v21 = 115;
      else
        v21 = v50;
      goto LABEL_124;
    }
    if (CFStringCompare(v104, CFSTR("Apple_APFS"), 0) == kCFCompareEqualTo)
    {
      v36 = sub_212802440(v98, v107, v106, (uint64_t *)&v105);
      if ((_DWORD)v36)
        goto LABEL_214;
      v52 = v105;
      v53 = v102;
      v109 = 0;
      valuePtr = 0;
      value[0] = 0;
      v108 = 0;
      v54 = DIMediaKitCreateMKMediaRef((uint64_t)v105, (uint64_t)allocator, 0, (uint64_t *)value);
      if ((_DWORD)v54)
      {
        v21 = v54;
        v48 = 0;
        Mutable = v92;
        goto LABEL_181;
      }
      v62 = (*(uint64_t (**)(char *))(*(_QWORD *)v52 + 96))(v52);
      v48 = 0;
      v63 = 0;
      if (v99 <= 6)
      {
        if (((1 << v99) & 0x2C) != 0)
        {
          v108 = v62;
          v63 = sub_21281F6C4((uint64_t)v53, v62, v90, a4);
          v48 = 0;
          if (!v63)
            v62 = 0;
        }
        else if (((1 << v99) & 0x42) != 0)
        {
          v67 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
          CFDictionarySetValue(v67, CFSTR("Record Runs"), v89);
          CFDictionarySetValue(v67, CFSTR("Record Container"), v89);
          CFDictionarySetValue(v67, CFSTR("Record Markers"), v89);
          v87 = (const __CFDictionary *)MKCFCreateFSInfo();
          if (v67)
            CFRelease(v67);
          v63 = v109;
          if (v109)
          {
            Mutable = v92;
            v48 = v87;
            goto LABEL_134;
          }
          v48 = v87;
          if (v87
            && (v71 = (const __CFNumber *)sub_2127FE630(v87, CFSTR("Volume block size"))) != 0
            && CFNumberGetValue(v71, kCFNumberSInt64Type, &valuePtr)
            && (valuePtr >>= 9, (v72 = (const __CFArray *)sub_212802380(v87, CFSTR("Data Runs"))) != 0))
          {
            v63 = sub_21281F89C(v53, v72, v62, v90, a4, v88, (unint64_t *)&v108);
            if (!v63)
            {
              v62 -= v108;
              v108 = v62;
              v63 = sub_21281F6C4((uint64_t)v53, v62, 2, a4);
              if (!v63)
                v62 -= v108;
            }
          }
          else
          {
            v63 = 999;
          }
        }
      }
      Mutable = v92;
LABEL_134:
      if (v62)
        v68 = v63 == 0;
      else
        v68 = 0;
      if (v68)
        v21 = 115;
      else
        v21 = v63;
      goto LABEL_181;
    }
    if (CFStringCompare(v104, CFSTR("DOS_FAT_32"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("DOS_FAT_16"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("DOS_FAT_16_S"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("Windows_FAT_16"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("Windows_FAT_32"), 0) == kCFCompareEqualTo
      || CFStringCompare(v104, CFSTR("DOS_FAT_12"), 0) == kCFCompareEqualTo)
    {
      v36 = sub_212802440(v98, v107, v106, (uint64_t *)&v105);
      if ((_DWORD)v36)
        goto LABEL_214;
      v45 = v105;
      v46 = v102;
      value[0] = 0;
      v47 = DIMediaKitCreateMKMediaRef((uint64_t)v105, (uint64_t)allocator, 0, (uint64_t *)value);
      if (!(_DWORD)v47)
      {
        v58 = (*(uint64_t (**)(char *))(*(_QWORD *)v45 + 96))(v45);
        v59 = v58;
        valuePtr = 0;
        if (v99 > 6)
          goto LABEL_178;
        if (((1 << v99) & 0x2C) == 0)
        {
          if (((1 << v99) & 0x42) != 0)
          {
            v64 = v58;
            v65 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            CFDictionarySetValue(v65, CFSTR("Record On Bits"), v89);
            v109 = 0;
            v86 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v65)
              CFRelease(v65);
            v21 = v109;
            if (v109)
            {
              v59 = v64;
            }
            else
            {
              v59 = v64;
              if (v86
                && (v108 = 0, (v69 = (const __CFNumber *)sub_2127FE630(v86, CFSTR("Volume block size"))) != 0))
              {
                if (CFNumberGetValue(v69, kCFNumberSInt64Type, &v108)
                  && (v108 >>= 9, (v70 = (const __CFArray *)sub_212802380(v86, CFSTR("Data Runs"))) != 0))
                {
                  v21 = sub_21281F89C(v46, v70, v64, v90, v93, 0, (unint64_t *)&valuePtr);
                  if (!(_DWORD)v21)
                  {
                    v59 = v64 - valuePtr;
                    valuePtr = v59;
                    v21 = sub_21281F6C4((uint64_t)v46, v59, 2, v93);
                    if (!(_DWORD)v21)
                      v59 -= valuePtr;
                  }
                }
                else
                {
                  v21 = 999;
                }
              }
              else
              {
                v21 = 999;
              }
            }
            goto LABEL_155;
          }
LABEL_178:
          a4 = v93;
          if (v59)
          {
            v48 = 0;
            v21 = 115;
            goto LABEL_181;
          }
LABEL_180:
          v21 = 0;
          v48 = 0;
          goto LABEL_181;
        }
LABEL_104:
        v60 = (uint64_t)v46;
        a4 = v93;
        v61 = sub_21281F6C4(v60, v59, v90, v93);
        if ((_DWORD)v61)
        {
          v21 = v61;
          v86 = 0;
LABEL_156:
          if (v59)
            v73 = 115;
          else
            v73 = 0;
          if (!(_DWORD)v21)
            v21 = v73;
          v48 = v86;
          goto LABEL_181;
        }
        goto LABEL_180;
      }
      goto LABEL_83;
    }
    if (CFStringCompare(v104, CFSTR("Windows_NTFS"), 0) == kCFCompareEqualTo)
    {
      v36 = sub_212802440(v98, v107, v106, (uint64_t *)&v105);
      if ((_DWORD)v36)
        goto LABEL_214;
      v74 = v105;
      v46 = v102;
      value[0] = 0;
      v47 = DIMediaKitCreateMKMediaRef((uint64_t)v105, (uint64_t)allocator, 0, (uint64_t *)value);
      if (!(_DWORD)v47)
      {
        v75 = (*(uint64_t (**)(char *))(*(_QWORD *)v74 + 96))(v74);
        v59 = v75;
        valuePtr = 0;
        if (v99 > 6)
          goto LABEL_178;
        if (((1 << v99) & 0x2C) == 0)
        {
          if (((1 << v99) & 0x42) != 0)
          {
            v85 = v75;
            v76 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            CFDictionarySetValue(v76, CFSTR("Record On Bits"), v89);
            v109 = 0;
            v86 = (const __CFDictionary *)MKCFCreateFSInfo();
            if (v76)
              CFRelease(v76);
            v21 = v109;
            if (!v109)
            {
              if (v86)
              {
                v108 = 0;
                v77 = (const __CFNumber *)sub_2127FE630(v86, CFSTR("Volume block size"));
                if (v77
                  && CFNumberGetValue(v77, kCFNumberSInt64Type, &v108)
                  && (v108 >>= 9, (v78 = (const __CFArray *)sub_212802380(v86, CFSTR("Data Runs"))) != 0))
                {
                  v21 = sub_21281F89C(v46, v78, v85, v90, v93, 0, (unint64_t *)&valuePtr);
                  if (!(_DWORD)v21)
                  {
                    valuePtr = v85 - valuePtr;
                    v85 = valuePtr;
                    v21 = sub_21281F6C4((uint64_t)v46, valuePtr, 2, v93);
                    if (!(_DWORD)v21)
                      v85 -= valuePtr;
                  }
                }
                else
                {
                  v21 = 999;
                }
                Mutable = v92;
              }
              else
              {
                v21 = 999;
              }
            }
            v59 = v85;
LABEL_155:
            a4 = v93;
            goto LABEL_156;
          }
          goto LABEL_178;
        }
        goto LABEL_104;
      }
LABEL_83:
      v21 = v47;
      v48 = 0;
      a4 = v93;
LABEL_181:
      if (value[0])
      {
        CFRelease(value[0]);
        value[0] = 0;
      }
      if (v48)
        CFRelease(v48);
LABEL_185:
      if ((_DWORD)v21)
        goto LABEL_215;
      if (v105)
      {
        DIDiskImageObjectRelease(v105);
        v105 = 0;
      }
      goto LABEL_188;
    }
    v40 = v104;
    if (v104
      && (CFStringCompare(v104, CFSTR("Apple_Free"), 0) == kCFCompareEqualTo
       || CFStringCompare(v40, CFSTR("Apple_Void"), 0) == kCFCompareEqualTo
       || CFStringCompare(v40, CFSTR("Apple_Scratch"), 0) == kCFCompareEqualTo
       || CFStringCompare(v40, CFSTR("Linux_Swap"), 0) == kCFCompareEqualTo
       || CFStringCompare(v40, CFSTR("0657FD6D-A4AB-43C4-84E5-0933C84B4F4F"), 0) == kCFCompareEqualTo))
    {
      switch(v99)
      {
        case 6u:
          goto LABEL_198;
        case 3u:
          v82 = (uint64_t)v102;
          v83 = v106;
          v84 = 1;
          break;
        case 1u:
LABEL_198:
          v82 = (uint64_t)v102;
          v83 = v106;
          v84 = 2;
          break;
        default:
          v82 = (uint64_t)v102;
          v83 = v106;
          v84 = 0x7FFFFFFF;
          break;
      }
      v21 = sub_21281F6C4(v82, v83, v84, a4);
      if ((_DWORD)v21)
        goto LABEL_212;
      goto LABEL_188;
    }
    v37 = sub_21281F6C4((uint64_t)v102, v106, v90, a4);
    if ((_DWORD)v37)
      break;
LABEL_188:
    v37 = sub_21281F6C4((uint64_t)v102, 0, -1, a4);
    if ((_DWORD)v37)
      break;
    nullsub_4(v102);
    v107 += v106;
    v79 = DIGetBundleRef();
    v80 = (const __CFString *)sub_21281FFEC(v79, (int)CFSTR("%1$@ (%2$@ : %3$d)"), CFSTR("%1$@ (%2$@ : %3$d)"));
    v81 = CFStringCreateWithFormat(allocator, 0, v80, v103, v104, v33);
    CFArrayAppendValue(Mutable, v81);
    if (v81)
      CFRelease(v81);
    if (v80)
      CFRelease(v80);
    if (v95 == ++v33)
      goto LABEL_211;
  }
  v21 = v37;
  if (a6)
    goto LABEL_217;
LABEL_219:
  v25 = v91;
  sub_21280F418(v96, v91);
  v26 = 0;
  if (!(_DWORD)v21)
    goto LABEL_220;
LABEL_27:
  v25 = 0;
  v27 = 0;
LABEL_28:
  if (v19)
  {
    CFRelease(v19);
    v19 = 0;
  }
LABEL_30:
  if (!a8 || (v27 & 1) == 0)
  {
LABEL_32:
    if (Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
  }
  if (a6)
    *a6 = v26;
  if (v101)
    *v101 = v25;
  if (a5)
    *a5 = v19;
  if (a8)
    *a8 = Mutable;
  return v21;
}

uint64_t sub_21281F6C4(uint64_t a1, unint64_t a2, int a3, unint64_t a4)
{
  uint64_t v5;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  if (!a1)
    return 22;
  v5 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
    return 22;
  v7 = a2;
  result = 22;
  if (a3 > -2)
  {
    v9 = 0;
    v10 = 1;
    if (a3 > 2147483645)
    {
      if (a3 == 2147483646)
        goto LABEL_24;
    }
    else if (a3 >= 3)
    {
      if (a3 != -1)
        return result;
      goto LABEL_24;
    }
    v9 = a2;
    if (a2)
      goto LABEL_20;
    return 0;
  }
  v9 = a4;
  if ((a3 + 2147483644) < 5 || a3 == 0x80000000)
  {
    if (a2)
    {
      if (!a4)
      {
        v10 = 1;
        goto LABEL_24;
      }
      goto LABEL_20;
    }
    return 0;
  }
  if (a3 != -2147483647)
    return result;
  if (!a2)
    return 0;
  v9 = 20;
LABEL_20:
  if (a2 % v9)
    v10 = a2 / v9 + 1;
  else
    v10 = a2 / v9;
  if (!v10)
    return 0;
LABEL_24:
  v11 = *(_DWORD *)(v5 + 200);
  v12 = *(_QWORD *)(v5 + 16);
  nullsub_4(a1);
  v13 = sub_212820120(a1);
  result = sub_21281FFF4();
  if (!(_DWORD)result)
  {
    sub_2128200C8(a1, v13 + 40 * v10);
    result = sub_21281FFF4();
    if (!(_DWORD)result)
    {
      v14 = *(_QWORD *)a1;
      *(_DWORD *)(v14 + 200) = *(_DWORD *)(*(_QWORD *)a1 + 200) + v10;
      *(_QWORD *)(v14 + 16) += v7;
      if (a3 + 0x80000000 <= 8 && ((1 << a3) & 0x1F3) != 0 && (uint64_t)v9 > *(unsigned int *)(v14 + 32))
        *(_DWORD *)(v14 + 32) = v9;
      v15 = v14 + 40 * v11 + 204;
      do
      {
        result = 0;
        if ((uint64_t)v9 >= v7)
          v16 = v7;
        else
          v16 = v9;
        *(_DWORD *)v15 = a3;
        *(_DWORD *)(v15 + 4) = 0;
        *(_QWORD *)(v15 + 8) = v12;
        *(_QWORD *)(v15 + 16) = v16;
        v12 += v16;
        v7 -= v16;
        *(_QWORD *)(v15 + 24) = 0;
        *(_QWORD *)(v15 + 32) = 0;
        v15 += 40;
        --v10;
      }
      while (v10);
    }
  }
  return result;
}

uint64_t sub_21281F89C(_QWORD *a1, const __CFArray *a2, unint64_t a3, int a4, unint64_t a5, int a6, unint64_t *a7)
{
  CFIndex Count;
  __int16 v10;
  unint64_t v11;
  CFIndex v12;
  unint64_t v13;
  uint64_t v14;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  unsigned int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v32;
  unint64_t v34;
  unsigned int v35;
  unsigned __int16 v36;
  unint64_t v37;
  unint64_t v38;
  __int16 valuePtr;
  void *value;

  if (!a1 || !*a1)
    return 22;
  sub_21282012C();
  v32 = (uint64_t)a1;
  nullsub_4(a1);
  Count = CFArrayGetCount(a2);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v34 = 0;
  v13 = 0;
  v14 = Count & ~(Count >> 63);
  v35 = 2048;
  while (v14 != v12)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, v12);
    valuePtr = -1;
    if (!ValueAtIndex)
      goto LABEL_10;
    v16 = ValueAtIndex;
    value = (void *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Type"));
    CFDictionaryGetValueIfPresent(v16, CFSTR("Type"), (const void **)&value);
    if (!value)
      goto LABEL_10;
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt16Type, &valuePtr);
    v36 = valuePtr;
    value = (void *)CFDictionaryGetValue(v16, CFSTR("Origin"));
    CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v37);
    v17 = v36;
    if (v36 < 2u)
    {
      value = (void *)CFDictionaryGetValue(v16, CFSTR("Length"));
      CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v38);
      goto LABEL_9;
    }
    if (v36 == 2)
    {
      v38 = 0;
      v24 = (void *)sub_2128023F8(v16, CFSTR("Marker"));
      value = v24;
      if (v24)
      {
        if (CFEqual(v24, CFSTR("Embedded Start")))
        {
          v10 = 1;
        }
        else if (CFEqual(value, CFSTR("Embedded End")))
        {
          v10 = 2;
        }
        else if (CFEqual(value, CFSTR("Volume Start")))
        {
          v10 = 3;
        }
        else if (CFEqual(value, CFSTR("Volume End")))
        {
          v10 = 4;
        }
        else
        {
          v10 = -1;
        }
      }
      else
      {
LABEL_9:
        v10 = 0;
      }
LABEL_10:
      v17 = v36;
      goto LABEL_11;
    }
    v10 = 0;
LABEL_11:
    if (v17 == 2)
    {
      v21 = 0;
      v22 = v10 == 4 && a6 == 1;
      v23 = v35;
      if (v22)
        v23 = 0;
      v35 = v23;
      goto LABEL_37;
    }
    if (v17 == 1)
    {
      v18 = v37;
      if (v11 > v37)
        goto LABEL_53;
      v19 = v11;
      v20 = v37 - v34;
      if (v37 - v34 < v35)
      {
        v13 += v20;
        v21 = 0;
        if (v38)
        {
          v13 += v38;
          v34 = v38 + v37;
        }
        else
        {
          v34 = v37;
        }
        goto LABEL_36;
      }
      if (v13)
      {
        v25 = sub_21281F6C4(v32, v13, a4, a5);
        if ((_DWORD)v25)
        {
          v21 = v25;
LABEL_36:
          v11 = v19;
          goto LABEL_37;
        }
        v19 += v13;
      }
      v21 = sub_21281F6C4(v32, v20, 2, a5);
      if (!(_DWORD)v21)
      {
        v11 = v19 + v20;
        v13 = v38;
        v34 = v38 + v18;
        goto LABEL_37;
      }
      v13 = 0;
      goto LABEL_36;
    }
    v21 = 0;
LABEL_37:
    ++v12;
    if ((_DWORD)v21)
      goto LABEL_57;
  }
  if (v13)
  {
    v26 = sub_21281F6C4(v32, v13, a4, a5);
    if ((_DWORD)v26)
    {
      v21 = v26;
      goto LABEL_57;
    }
    v11 += v13;
  }
  if (a3 < v11)
  {
LABEL_53:
    v21 = 999;
    goto LABEL_57;
  }
  if (a3 == v11 || (v21 = sub_21281F6C4(v32, a3 - v11, 2, a5), !(_DWORD)v21))
  {
    v21 = 0;
    v11 = a3;
  }
LABEL_57:
  nullsub_4(v32);
  if (a7)
    *a7 = v11;
  return v21;
}

uint64_t sub_21281FC24(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2C998;
  free(*(void **)(a1 + 40));
  *(_QWORD *)(a1 + 40) = 0;
  return a1;
}

const char *sub_21281FC5C()
{
  return "CCachedBackingStore";
}

uint64_t sub_21281FC68()
{
  return 78;
}

uint64_t sub_21281FC74(uint64_t a1, char *a2)
{
  FILE **v3;
  pthread_mutex_t *v4;
  int v5;
  const char *v6;
  uint64_t result;
  _QWORD *i;

  v3 = (FILE **)MEMORY[0x24BDAC8D8];
  if (a2)
    fputs(a2, (FILE *)*MEMORY[0x24BDAC8D8]);
  v4 = (pthread_mutex_t *)(a1 + 8);
  v5 = pthread_mutex_trylock((pthread_mutex_t *)(a1 + 8));
  v6 = "<locked>";
  if (!v5)
    v6 = "<unlocked>";
  result = fprintf(*v3, "%s (items %d, reserve %d)\n", v6, *(_DWORD *)(a1 + 136), *(_DWORD *)(a1 + 144));
  if (*(_DWORD *)(a1 + 120))
    result = puts("<aborting>");
  for (i = *(_QWORD **)(a1 + 128); i; i = (_QWORD *)i[9])
    result = (*(uint64_t (**)(_QWORD *, _QWORD))(*i + 16))(i, 0);
  if (!v5)
    return pthread_mutex_unlock(v4);
  return result;
}

uint64_t sub_21281FD58(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2CA40;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  return a1;
}

void sub_21281FD88(uint64_t a1)
{
  *(_QWORD *)a1 = &off_24CE2CA40;
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 8));
  JUMPOUT(0x212BF43D0);
}

void sub_21281FDC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BF43D0](v1, 0x10A1C4039AEBF7ALL);
  _Unwind_Resume(a1);
}

uint64_t sub_21281FDEC(uint64_t a1, char *a2)
{
  FILE **v3;
  pthread_mutex_t *v4;
  int v5;
  const char *v6;
  uint64_t result;

  v3 = (FILE **)MEMORY[0x24BDAC8D8];
  if (a2)
    fputs(a2, (FILE *)*MEMORY[0x24BDAC8D8]);
  v4 = (pthread_mutex_t *)(a1 + 8);
  v5 = pthread_mutex_trylock(v4);
  v6 = "<locked>";
  if (!v5)
    v6 = "<unlocked>";
  result = fprintf(*v3, "%s\n", v6);
  if (!v5)
    return pthread_mutex_unlock(v4);
  return result;
}

uint64_t sub_21281FE90(uint64_t a1, uint64_t a2)
{
  const void *v2;
  unsigned int v4;

  v4 = 0;
  v2 = (const void *)(*(uint64_t (**)(uint64_t, unsigned int *, uint64_t, _QWORD))(*(_QWORD *)a1 + 64))(a1, &v4, a2, 0);
  if (v2)
    CFRelease(v2);
  return v4;
}

const char *sub_21281FED0()
{
  return "CDIISOPartitionScheme";
}

int8x8_t sub_21281FEE0(uint64_t *a1)
{
  int8x16_t v1;
  int8x8_t result;

  v1.i64[0] = *a1;
  v1.i64[1] = *a1;
  result = vqtbl1_s8(v1, (int8x8_t)0x607040500010203);
  *a1 = (uint64_t)result;
  return result;
}

const char *sub_21281FEFC()
{
  return "CDIGUIDPartitionScheme";
}

uint64_t sub_21281FF14(uint64_t result, int a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _BOOL4 v9;

  if (*(_QWORD *)(result + 112))
  {
    v4 = result;
    v5 = a3 >> 2;
    v9 = a2 != 0;
    if (a3 >= 4)
    {
      do
      {
        result = (*(uint64_t (**)(_QWORD, _BOOL4 *, uint64_t))(v4 + 144))(*(_QWORD *)(v4 + 112), &v9, 4);
        --v5;
      }
      while (v5);
      v6 = -1;
    }
    else
    {
      v6 = v5 - 1;
    }
    v7 = a3 - 4 * v6;
    v8 = v7 - 2;
    if (v7 >= 2)
    {
      result = (*(uint64_t (**)(_QWORD, _BOOL4 *, uint64_t))(v4 + 144))(*(_QWORD *)(v4 + 112), &v9, 2);
      v7 = v8;
    }
    if (v7)
      return (*(uint64_t (**)(_QWORD, _BOOL4 *, uint64_t))(v4 + 144))(*(_QWORD *)(v4 + 112), &v9, 1);
  }
  return result;
}

uint64_t sub_21281FFC8(_DWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_DWORD *, uint64_t, _QWORD))(*(_QWORD *)a1 + 96))(a1, a2, (8 * a1[32]));
}

uint64_t sub_21281FFDC()
{
  return 45;
}

uint64_t DIHLDiskImageProbeURL()
{
  return 1;
}

CFTypeRef sub_21281FFEC(int a1, int a2, CFTypeRef cf)
{
  return CFRetain(cf);
}

uint64_t sub_21281FFF4()
{
  return 0;
}

_QWORD *sub_21281FFFC(uint64_t a1)
{
  _QWORD *v2;
  char *v3;

  v2 = malloc_type_calloc(1uLL, 0x10uLL, 0x100004000313F17uLL);
  if (a1)
  {
    v3 = (char *)malloc_type_calloc(1uLL, a1 + 4, 0x847AC88FuLL);
    *(_DWORD *)&v3[a1] = a1;
  }
  else
  {
    v3 = 0;
  }
  *v2 = v3;
  v2[1] = a1;
  return v2;
}

_QWORD *sub_212820068()
{
  _QWORD *result;

  result = malloc_type_calloc(1uLL, 0x10uLL, 0x100004000313F17uLL);
  *result = 0;
  result[1] = 0;
  return result;
}

void sub_212820098(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (*a1)
      free(v2);
  }
  free(a1);
}

char *sub_2128200C8(uint64_t a1, uint64_t a2)
{
  void *v4;
  char *result;

  v4 = *(void **)a1;
  if (v4)
    result = (char *)malloc_type_realloc(v4, a2 + 4, 0xF9C1DEE4uLL);
  else
    result = (char *)malloc_type_calloc(1uLL, a2 + 4, 0x847AC88FuLL);
  *(_DWORD *)&result[a2] = a2;
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = a2;
  return result;
}

uint64_t sub_212820120(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t sub_21282012C()
{
  return 7;
}

__CFDictionary *sub_212820134(uint64_t *a1, char a2, uint64_t a3, int a4)
{
  const __CFAllocator *v7;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v9;
  __CFDictionary *v10;
  __CFDictionary *v11;
  void *v12;
  const __CFDictionary *v13;
  int v14;
  int v15;
  const __CFString *v16;
  uint64_t v18;
  CFIndex Count;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  CFIndex v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  const __CFNumber *v26;
  int v27;
  __CFDictionary *v28;
  __CFDictionary *v29;
  CFNumberRef v30;
  CFNumberRef v31;
  uint64_t v32;
  uint64_t v33;
  const __CFNumber *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  CFIndex v43;
  CFIndex v44;
  const __CFDictionary *v45;
  uint64_t v46;
  uint64_t valuePtr;
  uint64_t v48;
  uint64_t v49;
  void *value;
  void *v51;
  const void *v52;
  const __CFString *v53;
  char *v54;
  const __CFDictionary *v55;
  const __CFArray *v56;
  int v57;
  uint64_t v58;
  CFTypeRef v59;
  unint64_t v60;
  uint64_t v61;

  v61 = a3;
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  v58 = 0;
  v59 = 0;
  if (!Mutable)
    return 0;
  v9 = Mutable;
  v60 = 0;
  if (!DIMediaKitCreateMKMediaRef((uint64_t)a1, (uint64_t)v7, 0, (uint64_t *)&v59))
  {
    v57 = 0;
    v11 = CFDictionaryCreateMutable(v7, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v12 = (void *)*MEMORY[0x24BDBD270];
    CFDictionarySetValue(v11, CFSTR("Include most"), (const void *)*MEMORY[0x24BDBD270]);
    v13 = (const __CFDictionary *)MKCFReadMedia();
    CFRelease(v11);
    if (!v13)
    {
      v10 = sub_2128206CC((uint64_t)a1, a2, 0, 0, 0, 0, 0, 1, v61, 0);
      if (v10)
        v14 = 0;
      else
        v14 = 999;
      goto LABEL_12;
    }
    v55 = 0;
    v56 = 0;
    v15 = sub_212820924(v13, &v55, &v56);
    if (v15
      || (v16 = (const __CFString *)sub_2128023F8(v55, CFSTR("ID")),
          (v15 = sub_212820A48(a2, a1, (uint64_t)v59, v55, &v61, (uint64_t *)&v60)) != 0))
    {
      v14 = v15;
      v10 = 0;
LABEL_12:
      if (v14 && v10)
      {
        CFRelease(v10);
        v10 = 0;
      }
      if (v13)
        CFRelease(v13);
      goto LABEL_17;
    }
    v18 = (*(uint64_t (**)(uint64_t *))(*a1 + 96))(a1);
    v40 = v61;
    v41 = v18;
    v10 = sub_212820CF4(v16, 0, 0, 0, a2, 0, v18, v18, v61, v60, 0);
    Count = CFArrayGetCount(v56);
    v20 = (const __CFDictionary *)sub_2128023BC(v56, 0);
    v43 = Count;
    v44 = Count - 1;
    if (Count < 1)
    {
      v14 = 0;
LABEL_70:
      if (CFArrayGetCount(v9))
      {
        CFDictionarySetValue(v10, CFSTR("subcontent-list"), v9);
        CFRelease(v9);
        v9 = 0;
      }
      goto LABEL_12;
    }
    v21 = v20;
    v39 = v12;
    v22 = 0;
    v14 = 0;
    v42 = a4 | ((a2 & 0x10) >> 4);
    while (1)
    {
      if (v22 >= v44)
        v45 = 0;
      else
        v45 = (const __CFDictionary *)sub_2128023BC(v56, v22 + 1);
      v53 = 0;
      v54 = 0;
      v51 = 0;
      v52 = 0;
      v49 = 0;
      value = 0;
      valuePtr = 0;
      v48 = 0;
      if (!sub_212820E5C(v21, (const void **)&value, (const void **)&v53, &v52, &v49, &v48, (const void **)&v51))goto LABEL_65;
      v23 = v48;
      if ((v42 & 1) != 0)
      {
        v24 = v48;
        v25 = a2 & 0xF8 | 4;
      }
      else
      {
        if (v45)
        {
          valuePtr = 0;
          v26 = (const __CFNumber *)sub_2127FE630(v45, CFSTR("Offset"));
          if (v26)
          {
            v27 = CFNumberGetValue(v26, kCFNumberLongLongType, &valuePtr);
            v24 = v48;
            if (v27)
            {
              v58 = valuePtr - (v49 + v48);
              v23 = v48;
            }
          }
          else
          {
            v24 = v48;
          }
        }
        else
        {
          v58 = v41 - (v48 + v49);
          v24 = v48;
          if (v61 - (v41 - v48) > v48)
            v23 = v61 - (v41 - v48);
        }
        v25 = a2;
      }
      v14 = sub_212802440((char *)a1, v49, v24, (uint64_t *)&v54);
      if (v14)
        goto LABEL_65;
      v28 = sub_2128206CC((uint64_t)v54, v25, value, v53, v53, v52, v49, v60, v23, v51);
      if (v28)
        break;
      v14 = 0;
LABEL_65:
      v21 = v45;
      if (v54)
        DIDiskImageObjectRelease(v54);
      if (v43 == ++v22)
        goto LABEL_70;
    }
    v29 = v28;
    if (v58)
    {
      v30 = CFNumberCreate(0, kCFNumberSInt64Type, &v58);
      CFDictionarySetValue(v29, CFSTR("postamble"), v30);
      CFRelease(v30);
    }
    if ((v25 & 0x10) != 0 || !sub_212820F98(v29))
    {
      if (v44 != v22)
      {
LABEL_63:
        v14 = 0;
        goto LABEL_64;
      }
      v35 = v41;
      v36 = v41;
      if ((a2 & 4) == 0)
      {
        v37 = v48;
        v38 = v49;
        v14 = sub_2128211A0(v55, (unint64_t *)&v58);
        if (v14)
        {
LABEL_64:
          CFArrayAppendValue(v9, v29);
          CFRelease(v29);
          goto LABEL_65;
        }
        v36 = v37 + v38 + v58;
        v35 = v41;
      }
    }
    else
    {
      if (value)
      {
        CFDictionarySetValue(v10, CFSTR("partition-resize-id-hint"), value);
        LODWORD(v46) = v22;
        v31 = CFNumberCreate(v7, kCFNumberIntType, &v46);
        CFDictionarySetValue(v10, CFSTR("partition-resize-hint"), v31);
        CFRelease(v31);
      }
      if (v44 != v22)
        goto LABEL_63;
      if ((a2 & 4) == 0)
        CFDictionarySetValue(v29, CFSTR("can-trigger-image-resize"), v39);
      v33 = v48;
      v32 = v49;
      v46 = 0;
      v34 = (const __CFNumber *)sub_2127FE630(v29, CFSTR("content-min-length"));
      if (v34 && CFNumberGetValue(v34, kCFNumberLongLongType, &v46))
        v33 = v46;
      else
        v46 = v33;
      v35 = v41;
      if ((a2 & 4) != 0)
        v36 = v41;
      else
        v36 = v33 + v32 + v58;
    }
    sub_212820FD0(v10, a2, v36, v35, v40, v60);
    goto LABEL_63;
  }
  v10 = 0;
LABEL_17:
  if (v59)
  {
    CFRelease(v59);
    v59 = 0;
  }
  if (v9)
    CFRelease(v9);
  return v10;
}

__CFDictionary *sub_2128206CC(uint64_t a1, char a2, const void *a3, const __CFString *a4, const void *a5, const void *a6, uint64_t a7, int64_t a8, uint64_t a9, void *a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFComparisonResult v20;
  int MKMediaRef;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __CFDictionary *v25;
  uint64_t v26;
  unint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v37;
  uint64_t v38;
  unsigned int v39;
  CFTypeRef cf;

  cf = 0;
  if (!a1)
    return 0;
  v17 = a9;
  if (!a9)
  {
    v18 = 96;
    if ((a2 & 4) == 0)
      v18 = 112;
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + v18))(a1);
  }
  v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  if (!a4)
  {
    if ((a2 & 8) == 0)
      goto LABEL_9;
LABEL_15:
    v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
    if ((unint64_t)a8 <= 1)
      a8 = 1;
    v24 = a7;
    goto LABEL_18;
  }
  v20 = CFStringCompare(a4, CFSTR("Apple_APFS"), 0);
  if ((a2 & 8) != 0 || v20 == kCFCompareEqualTo)
    goto LABEL_15;
LABEL_9:
  MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x24BDBD240], 0, (uint64_t *)&cf);
  if (cf && !MKMediaRef && !MKHFSGetResizeLimits())
  {
    v26 = v38;
    v28 = v39 | (unint64_t)a8;
    if (a8 && v39)
    {
      if ((v28 & 1) != 0)
      {
        v29 = 0;
        v31 = v39;
        v30 = a8;
      }
      else
      {
        v29 = 0;
        v30 = a8;
        v31 = v39;
        do
        {
          v31 >>= 1;
          v30 >>= 1;
          ++v29;
        }
        while (((v31 | v30) & 1) == 0);
      }
      do
      {
        v32 = v31;
        v31 >>= 1;
      }
      while ((v32 & 1) == 0);
      do
      {
        do
        {
          v33 = v30;
          v30 >>= 1;
        }
        while ((v33 & 1) == 0);
        v34 = v32 - v33;
        if (v32 < v33)
        {
          v35 = v33 - v32;
        }
        else
        {
          v32 = v33;
          v35 = v34;
        }
        v30 = v35 >> 1;
      }
      while (v35 > 1);
      v28 = v32 << v29;
    }
    v24 = a7;
    if (a8 / v28 * v39 <= 1)
      a8 = 1;
    else
      a8 = a8 / v28 * v39;
    if (v37 < v17)
      v17 = v37;
LABEL_18:
    if (v19 - (v19 - v26) / a8 * a8 >= v19)
      v22 = v19;
    else
      v22 = v19 - (v19 - v26) / a8 * a8;
    v23 = (((v17 - v19) / a8 * a8) & ~(((v17 - v19) / a8 * a8) >> 63)) + v19;
    goto LABEL_22;
  }
  v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  a4 = CFSTR("unknown");
  v23 = v22;
  v19 = v22;
  v24 = a7;
LABEL_22:
  v25 = sub_212820CF4(a4, a3, a5, a6, a2, v24, v22, v19, v23, a8, a10);
  if (cf)
    CFRelease(cf);
  return v25;
}

uint64_t sub_212820924(const __CFDictionary *a1, const __CFDictionary **a2, const __CFArray **a3)
{
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFDictionary *v7;
  uint64_t result;
  const __CFDictionary *v9;
  const void *v10;
  const __CFArray *v11;
  const __CFDictionary *v12;
  const __CFArray *v13;
  const __CFArray *v14;

  if (a3)
    *a3 = 0;
  if (a2)
    *a2 = 0;
  v5 = (const __CFArray *)sub_212802380(a1, CFSTR("Schemes"));
  if (!v5)
    return 45;
  v6 = v5;
  if (!CFArrayGetCount(v5))
    return 45;
  if (CFArrayGetCount(v6) < 2)
  {
    v7 = (const __CFDictionary *)sub_2128023BC(v6, 0);
    goto LABEL_12;
  }
  if (!sub_2128143C4())
    return 45;
  v7 = (const __CFDictionary *)CFArrayDictionarySearchWithIndexOptions();
LABEL_12:
  v9 = v7;
  if (!v7)
    return 22;
  v10 = sub_2128023F8(v7, CFSTR("ID"));
  if (!v10)
    return 22;
  if (CFEqual(v10, CFSTR("ISO9660")))
    return 22;
  v11 = (const __CFArray *)sub_212802380(v9, CFSTR("Sections"));
  v12 = sub_212821AA8(v11);
  if (!v12)
    return 22;
  v13 = (const __CFArray *)sub_212802380(v12, CFSTR("Partitions"));
  if (!v13)
    return 22;
  v14 = v13;
  if (!CFArrayGetCount(v13))
    return 22;
  if (a3)
    *a3 = v14;
  result = 0;
  if (a2)
    *a2 = v9;
  return result;
}

uint64_t sub_212820A48(char a1, uint64_t *a2, uint64_t a3, const __CFDictionary *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v11;
  const void *v12;
  CFTypeID TypeID;
  const __CFArray *v14;
  const __CFDictionary *v15;
  const __CFNumber *v16;
  const void *v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t valuePtr;
  unsigned __int16 v28[256];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a6)
    *a6 = 0;
  if (a5)
  {
    v11 = MKMediaCopyProperty();
    if (v11)
    {
      v12 = (const void *)v11;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v12)
        || (v14 = (const __CFArray *)sub_212802380(a4, CFSTR("Sections")), (v15 = sub_212821AA8(v14)) == 0))
      {
        v20 = 22;
        goto LABEL_16;
      }
      valuePtr = 0;
      v16 = (const __CFNumber *)sub_2127FE630(v15, CFSTR("Media Block Size"));
      if (!v16 || !CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr))
        valuePtr = 512;
      v17 = sub_2128023F8(a4, CFSTR("ID"));
      v18 = v17;
      if (v17 && CFEqual(v17, CFSTR("APM")))
      {
        v26 = 0;
        v19 = (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t, uint64_t *, unsigned __int16 *))(*a2 + 48))(a2, 0, 1, &v26, v28);
        if ((_DWORD)v19)
        {
          v20 = v19;
LABEL_16:
          CFRelease(v12);
          return v20;
        }
        sub_212811930(v28);
      }
      if (a6)
        *a6 = valuePtr / 512;
      if (*a5)
      {
        v20 = 0;
        goto LABEL_16;
      }
      v22 = *a2;
      if ((a1 & 4) == 0)
      {
        v23 = (*(uint64_t (**)(uint64_t *))(v22 + 112))(a2);
        if (v23 < (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2))
          v23 = (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2);
        v24 = v23;
        if (!v18)
          goto LABEL_31;
        if (CFEqual(v18, CFSTR("APM")))
        {
          v24 = 0xFFFFFFFFLL * valuePtr / 512;
LABEL_31:
          if (v24 < (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2))
            v24 = (*(uint64_t (**)(uint64_t *))(*a2 + 96))(a2);
          v20 = 0;
          if (v23 >= v24)
            v25 = v24;
          else
            v25 = v23;
          *a5 = v25;
          goto LABEL_16;
        }
        v24 = v23;
        if (CFEqual(v18, CFSTR("GPT")))
          goto LABEL_31;
        v24 = v23;
        if (CFEqual(v18, CFSTR("MBR")))
          goto LABEL_31;
        v22 = *a2;
      }
      v20 = 0;
      *a5 = (*(uint64_t (**)(uint64_t *))(v22 + 96))(a2);
      goto LABEL_16;
    }
  }
  return 22;
}

__CFDictionary *sub_212820CF4(const __CFString *a1, const void *a2, const void *a3, const void *a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, void *value)
{
  __CFDictionary *Mutable;
  const __CFString *v19;
  CFNumberRef v20;
  const __CFAllocator *v22;
  uint64_t valuePtr;

  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  sub_212820FD0(Mutable, a5, a7, a8, a9, a10);
  if (a1)
    v19 = a1;
  else
    v19 = CFSTR("unknown");
  CFDictionarySetValue(Mutable, CFSTR("content-hint"), v19);
  if (a3)
    CFDictionarySetValue(Mutable, CFSTR("partition-type"), a3);
  if (a4)
    CFDictionarySetValue(Mutable, CFSTR("partition-name"), a4);
  if (a2)
    CFDictionarySetValue(Mutable, CFSTR("partition-ID"), a2);
  if (value)
    CFDictionarySetValue(Mutable, CFSTR("partition-UUID"), value);
  valuePtr = a6;
  v20 = CFNumberCreate(v22, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("content-start"), v20);
  if (v20)
    CFRelease(v20);
  return Mutable;
}

uint64_t sub_212820E5C(const __CFDictionary *a1, const void **a2, const void **a3, const void **a4, _QWORD *a5, _QWORD *a6, const void **a7)
{
  uint64_t result;

  if (a3)
    *a3 = 0;
  if (a2)
    *a2 = 0;
  if (a4)
    *a4 = 0;
  if (a7)
    *a7 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (!a1)
    return 0;
  if (a2)
    *a2 = sub_2127FE630(a1, CFSTR("Partition ID"));
  if (a3)
    *a3 = sub_2128023F8(a1, CFSTR("Type"));
  if (a4)
    *a4 = sub_2128023F8(a1, CFSTR("Name"));
  if (a7)
    *a7 = sub_2128023F8(a1, CFSTR("GUID"));
  if (!a5
    || (result = (uint64_t)sub_2127FE630(a1, CFSTR("Offset"))) != 0
    && (result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a5), (_DWORD)result))
  {
    if (!a6)
      return 1;
    result = (uint64_t)sub_2127FE630(a1, CFSTR("Size"));
    if (result)
    {
      result = CFNumberGetValue((CFNumberRef)result, kCFNumberLongLongType, a6);
      if ((_DWORD)result)
        return 1;
    }
  }
  return result;
}

const __CFString *sub_212820F98(const __CFDictionary *a1)
{
  const __CFString *result;

  result = (const __CFString *)sub_2128023F8(a1, CFSTR("content-hint"));
  if (result)
    return (const __CFString *)(CFStringCompare(result, CFSTR("unknown"), 0) != kCFCompareEqualTo);
  return result;
}

void sub_212820FD0(__CFDictionary *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFAllocator *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  uint64_t valuePtr;

  if (a1)
  {
    valuePtr = 0;
    if (a5 < a4 || (a2 & 1) == 0)
      v9 = a4;
    else
      v9 = a5;
    if (a3 > a4 || (a2 & 2) == 0)
      v11 = a4;
    else
      v11 = a3;
    if (a6 <= 1)
      v12 = 1;
    else
      v12 = a6;
    v13 = a4 - (a4 - v11) / v12 * v12;
    if (v13 >= a4)
      v13 = a4;
    if ((a4 - v11) % v12)
      v14 = v13;
    else
      v14 = v11;
    v15 = (v9 - a4) / v12 * v12;
    if (v9 - a4 == v15)
      v16 = v9;
    else
      v16 = (v15 & ~(v15 >> 63)) + a4;
    CFDictionaryRemoveValue(a1, CFSTR("content-min-length"));
    v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (v14 != a4)
    {
      valuePtr = v14;
      v18 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, CFSTR("content-min-length"), v18);
      CFRelease(v18);
    }
    CFDictionaryRemoveValue(a1, CFSTR("content-max-length"));
    if (v16 != a4)
    {
      valuePtr = v16;
      v19 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, CFSTR("content-max-length"), v19);
      CFRelease(v19);
    }
    CFDictionaryRemoveValue(a1, CFSTR("content-granularity"));
    if (v14 != v16)
    {
      valuePtr = v12;
      v20 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
      CFDictionarySetValue(a1, CFSTR("content-granularity"), v20);
      CFRelease(v20);
    }
    valuePtr = a4;
    v21 = CFNumberCreate(v17, kCFNumberLongLongType, &valuePtr);
    CFDictionarySetValue(a1, CFSTR("content-length"), v21);
    CFRelease(v21);
  }
}

uint64_t sub_2128211A0(const __CFDictionary *a1, unint64_t *a2)
{
  const __CFArray *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t valuePtr;

  v9 = 0;
  valuePtr = 0;
  if (!a2)
    return 22;
  v3 = (const __CFArray *)sub_212802380(a1, CFSTR("Sections"));
  v4 = sub_212821AA8(v3);
  if (!v4)
    return 2;
  v5 = v4;
  v6 = (const __CFNumber *)sub_2127FE630(v4, CFSTR("Overhead"));
  if (!v6)
    return 2;
  CFNumberGetValue(v6, kCFNumberLongLongType, &valuePtr);
  v7 = (const __CFNumber *)sub_2127FE630(v5, CFSTR("Offset"));
  if (!v7)
    return 2;
  CFNumberGetValue(v7, kCFNumberLongLongType, &v9);
  if (valuePtr - v9 < 0)
    return 2;
  result = 0;
  *a2 = (valuePtr - v9 + 8 * (((valuePtr - v9) & 7) != 0)) & 0xFFFFFFFFFFFFFFF8;
  return result;
}

uint64_t sub_212821254(uint64_t a1, uint64_t a2, int a3, int a4)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  uint64_t v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  const __CFAllocator *v20;
  uint64_t MKMediaRef;
  uint64_t v22;
  const __CFDictionary *v23;
  __CFDictionary *Mutable;
  const void *v26;
  const void *v27;
  const void *v28;
  const __CFString *v29;
  const __CFArray *v30;
  CFIndex Count;
  CFIndex v32;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const void *v35;
  __CFDictionary *v36;
  uint64_t v37;
  uint64_t v38;
  CFTypeRef cf1;
  uint64_t v40;
  const __CFDictionary *v41;
  const __CFArray *v42;
  int v43;
  CFTypeRef cf;
  uint64_t v45;
  uint64_t v46;
  uint64_t valuePtr;
  unsigned __int16 v48;
  unsigned __int16 v49;
  unsigned int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  if (a4)
    v6 = 19;
  else
    v6 = 3;
  if (a3)
    v7 = v6;
  else
    v7 = v6 | 0x20;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)a1 + 456))(a1, v7, 0, 1);
  if (!v8)
    return 999;
  v9 = (const __CFDictionary *)v8;
  v45 = 1;
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  v46 = v10;
  valuePtr = v10;
  v11 = (const __CFNumber *)sub_2127FE630(v9, CFSTR("content-min-length"));
  if (v11)
    CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
  v12 = (const __CFNumber *)sub_2127FE630(v9, CFSTR("content-max-length"));
  if (v12)
    CFNumberGetValue(v12, kCFNumberLongLongType, &v46);
  v13 = (const __CFNumber *)sub_2127FE630(v9, CFSTR("content-granularity"));
  if (v13)
    CFNumberGetValue(v13, kCFNumberLongLongType, &v45);
  if (a2 == -1)
    v14 = valuePtr;
  else
    v14 = a2;
  if (v14 == 1)
    v14 = v46;
  if (v14 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.");
LABEL_66:
    v23 = 0;
    v22 = 22;
    goto LABEL_33;
  }
  if (v14 > v46)
  {
    warnx("resize request is above maximum size allowed.");
    goto LABEL_66;
  }
  v15 = (v10 - v14) / v45 * v45;
  v16 = (v14 - v10) / v45 * v45;
  v17 = v14 <= v10;
  if (v14 > v10)
    v18 = (v14 - v10) / v45 * v45;
  else
    v18 = (v10 - v14) / v45 * v45;
  if (v17)
    v19 = v10 - v15;
  else
    v19 = v16 + v10;
  if (v18)
  {
    v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    MKMediaRef = DIMediaKitCreateMKMediaRef(a1, *MEMORY[0x24BDBD240], 0, (uint64_t *)&cf);
    if (!(_DWORD)MKMediaRef)
    {
      v43 = 0;
      Mutable = CFDictionaryCreateMutable(v20, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v26 = (const void *)*MEMORY[0x24BDBD270];
      CFDictionarySetValue(Mutable, CFSTR("Include most"), (const void *)*MEMORY[0x24BDBD270]);
      v23 = (const __CFDictionary *)MKCFReadMedia();
      CFRelease(Mutable);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v41 = 0;
      v42 = 0;
      v22 = sub_212820924(v23, &v41, &v42);
      if ((_DWORD)v22)
        goto LABEL_33;
      v27 = sub_2128023F8(v41, CFSTR("ID"));
      v28 = v27;
      v29 = CFSTR("Fit Map to Container");
      if (v27 && CFEqual(v27, CFSTR("APM")))
        v29 = CFSTR("Fit Map to Media");
      v22 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 104))(a1, v19);
      if ((_DWORD)v22)
        goto LABEL_33;
      v22 = DIMediaKitCreateMKMediaRef(a1, (uint64_t)v20, 0, (uint64_t *)&cf);
      if ((_DWORD)v22)
        goto LABEL_33;
      cf1 = v28;
      v30 = (const __CFArray *)sub_212802380(v23, CFSTR("Schemes"));
      Count = CFArrayGetCount(v30);
      if (Count >= 1)
      {
        v32 = Count;
        for (i = 0; i < v32; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v30, i);
          v35 = sub_2128023F8(ValueAtIndex, CFSTR("ID"));
          if (v35 && CFEqual(v35, CFSTR("ISO9660")))
          {
            CFArrayRemoveValueAtIndex(v30, i--);
            --v32;
          }
        }
      }
      v36 = CFDictionaryCreateMutable(v20, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(v36, v29, v26);
      v22 = MKCFWriteMedia();
      CFRelease(v36);
      if (!cf1 || (_DWORD)v22)
        goto LABEL_33;
      if (CFEqual(cf1, CFSTR("APM")))
      {
        v40 = 0;
        v22 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)a1 + 48))(a1, 0, 1, &v40, &v48);
        if ((_DWORD)v22)
          goto LABEL_33;
        sub_212811930(&v48);
        if (v49 < 0x200u)
          v37 = 1;
        else
          v37 = v49 >> 9;
        v38 = v19 / v37;
        if (v19 % v37)
          ++v38;
        if (v50 * (unint64_t)v37 != v38 * v37)
        {
          if (v38 <= 0xFFFFFFFFLL)
          {
            v50 = v38;
            sub_21280032C(&v48);
            v22 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t *, unsigned __int16 *))(*(_QWORD *)a1 + 64))(a1, 0, 1, &v40, &v48);
          }
          else
          {
            v22 = 999;
          }
          goto LABEL_33;
        }
      }
      else if (!CFEqual(cf1, CFSTR("GPT")))
      {
        CFEqual(cf1, CFSTR("MBR"));
      }
      v22 = 0;
      goto LABEL_33;
    }
    v22 = MKMediaRef;
  }
  else
  {
    v22 = 0;
  }
  v23 = 0;
LABEL_33:
  CFRelease(v9);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v23)
    CFRelease(v23);
  return v22;
}

uint64_t sub_212821734(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t MKMediaRef;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFDictionary *Mutable;
  uint64_t v27;
  CFTypeRef cf;
  uint64_t v30;
  uint64_t v31;
  uint64_t valuePtr;

  v12 = 0;
  cf = 0;
  if (a4)
  {
    v13 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 96))(a1, a2, 0);
    if (v13 <= a2)
      v12 = a2;
    else
      v12 = v13;
  }
  if (a5)
    v14 = 11;
  else
    v14 = 3;
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 456))(a1, v14, v12, 0);
  if (!v15)
    return 999;
  v16 = (const __CFDictionary *)v15;
  v30 = 1;
  v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
  v31 = v17;
  valuePtr = v17;
  if (a6 < 0)
  {
    v19 = (const __CFNumber *)sub_2127FE630(v16, CFSTR("content-min-length"));
    if (v19)
      CFNumberGetValue(v19, kCFNumberLongLongType, &valuePtr);
  }
  else
  {
    valuePtr = a6;
  }
  v20 = (const __CFNumber *)sub_2127FE630(v16, CFSTR("content-max-length"));
  if (v20)
    CFNumberGetValue(v20, kCFNumberLongLongType, &v31);
  v21 = (const __CFNumber *)sub_2127FE630(v16, CFSTR("content-granularity"));
  if (v21)
    CFNumberGetValue(v21, kCFNumberLongLongType, &v30);
  if (a2 == -1)
    v22 = valuePtr;
  else
    v22 = a2;
  if (v22 == 1)
    v23 = v31;
  else
    v23 = v22;
  if (v23 < valuePtr)
  {
    warnx("resize request is below minimum size allowed.", cf);
LABEL_46:
    MKMediaRef = 22;
    goto LABEL_47;
  }
  if (v23 > v31)
  {
    warnx("resize request is above maximum size allowed.", cf);
    goto LABEL_46;
  }
  if (v23 <= v17)
  {
    if (v17 - v23 != (v17 - v23) % v30)
    {
      v24 = v17 - (v17 - v23) / v30 * v30;
LABEL_33:
      v25 = *MEMORY[0x24BDBD240];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, CFSTR("Writable"), (const void *)*MEMORY[0x24BDBD270]);
      MKMediaRef = DIMediaKitCreateMKMediaRef(a1, v25, Mutable, (uint64_t *)&cf);
      if (Mutable)
        CFRelease(Mutable);
      if (cf)
      {
        if ((a5 & 1) != 0 || (MKMediaRef = MKHFSResizeVolume(), !(_DWORD)MKMediaRef))
        {
          v27 = a4 ? a3 : v24;
          if (v23 <= v17 && v27)
            MKMediaRef = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 104))(a1);
        }
      }
      goto LABEL_47;
    }
    goto LABEL_31;
  }
  if (v23 - v17 == (v23 - v17) % v30)
  {
LABEL_31:
    MKMediaRef = 0;
    goto LABEL_47;
  }
  v24 = v23 - (v23 - v17) % v30;
  MKMediaRef = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 104))(a1, v24);
  if (!(_DWORD)MKMediaRef)
    goto LABEL_33;
LABEL_47:
  CFRelease(v16);
  if (cf)
    CFRelease(cf);
  return MKMediaRef;
}

const __CFDictionary *sub_2128219E0(const __CFArray *a1, int a2)
{
  CFNumberRef v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const void *v9;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  if (a1 && (Count = CFArrayGetCount(a1), Count >= 1))
  {
    v5 = Count;
    v6 = 0;
    while (1)
    {
      v7 = (const __CFDictionary *)sub_2128023BC(a1, v6);
      if (v7)
      {
        v8 = v7;
        v9 = sub_2127FE630(v7, CFSTR("partition-ID"));
        if (!v9)
          goto LABEL_8;
        if (CFEqual(v3, v9))
          break;
      }
      if (v5 == ++v6)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v8 = 0;
  }
  if (v3)
    CFRelease(v3);
  return v8;
}

const __CFDictionary *sub_212821AA8(const __CFArray *a1)
{
  CFIndex Count;
  CFIndex v3;
  CFIndex v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const void *v7;

  if (!a1)
    return 0;
  Count = CFArrayGetCount(a1);
  if (Count < 1)
    return 0;
  v3 = Count;
  v4 = 0;
  while (1)
  {
    v5 = (const __CFDictionary *)sub_2128023BC(a1, v4);
    if (v5)
    {
      v6 = v5;
      v7 = sub_2128023F8(v5, CFSTR("ID"));
      if (v7)
      {
        if (CFEqual(v7, CFSTR("MAP")))
          break;
      }
    }
    if (v3 == ++v4)
      return 0;
  }
  return v6;
}

BOOL sub_212821B3C(const char *a1)
{
  return !strcmp(a1, "lifs") || strcmp(a1, "fskit") == 0;
}

uint64_t sub_212821B88(uint64_t a1, char *a2, size_t a3)
{
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = malloc_type_calloc(1uLL, 0x400uLL, 0x1359B406uLL);
  if (v6)
  {
    v7 = v6;
    if (sub_212821B3C((const char *)(a1 + 72)))
    {
      v8 = strstr((char *)(a1 + 1112), "://");
      if (!v8 || (v9 = v8 + 3, (v10 = strchr(v8 + 3, 47)) == 0))
      {
        v12 = 22;
LABEL_17:
        free(v7);
        return v12;
      }
      if (v10 - v9 >= 1023)
        v11 = 1023;
      else
        v11 = v10 - v9;
      __memcpy_chk();
      *((_BYTE *)v7 + v11) = 0;
      if (!a2)
      {
LABEL_16:
        v12 = 0;
        goto LABEL_17;
      }
    }
    else
    {
      if (strncmp((const char *)(a1 + 1112), "/dev/disk", 9uLL))
        strncmp((const char *)(a1 + 1112), "/dev/rdisk", 0xAuLL);
      __strlcpy_chk();
      if (!a2)
        goto LABEL_16;
    }
    strlcpy(a2, (const char *)v7, a3);
    goto LABEL_16;
  }
  return 12;
}

void sub_212821CC4()
{
  int *v0;

  v0 = __error();
  warn("couldn't open debug log; error %d", *v0);
}

BOOL sub_212821CF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  warnx("CDiskImage::hasValidChecksum: obsolete method used");
  return (*(unsigned int (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)a1 + 160))(a1, a2, a3, 0) == 0;
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x24BDAC0E8](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F8](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

uint64_t CFArrayDictionarySearchWithIndexOptions()
{
  return MEMORY[0x24BE64C10]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x24BDBB8A0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

UInt32 CFBundleGetVersionNumber(CFBundleRef bundle)
{
  return MEMORY[0x24BDBBAE8](bundle);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x24BDBBCE8](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDE0](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x24BDBBE40](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE50](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x24BDBC098](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1D8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x24BDBC520](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x24BDBC528](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x24BDBC580](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC5A8](alloc, pStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC640](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x24BDBC668](string);
}

Boolean CFStringGetPascalString(CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC678](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x24BDBC6A8](theString, prefix);
}

void CFStringPad(CFMutableStringRef theString, CFStringRef padString, CFIndex length, CFIndex indexIntoPad)
{
  MEMORY[0x24BDBC6D8](theString, padString, length, indexIntoPad);
}

void CFStringReplaceAll(CFMutableStringRef theString, CFStringRef replacement)
{
  MEMORY[0x24BDBC6E8](theString, replacement);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x24BDBC790](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7A8](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x24BDBC7C0](url);
}

CFStringRef CFURLCopyScheme(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7D8](anURL);
}

CFStringRef CFURLCopyUserName(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7E0](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x24BDBC800](allocator, url, extension);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC808](allocator, url);
}

CFURLRef CFURLCreateCopyDeletingPathExtension(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x24BDBC810](allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC850](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x24BDBC8B8](anURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8660](*(_QWORD *)&iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
  MEMORY[0x24BDD8670](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MKCFCreateFSInfo()
{
  return MEMORY[0x24BE64C38]();
}

uint64_t MKCFReadMedia()
{
  return MEMORY[0x24BE64C58]();
}

uint64_t MKCFWriteMedia()
{
  return MEMORY[0x24BE64C68]();
}

uint64_t MKDetectISO()
{
  return MEMORY[0x24BE64C78]();
}

uint64_t MKHFSGetResizeLimits()
{
  return MEMORY[0x24BE64C80]();
}

uint64_t MKHFSResizeVolume()
{
  return MEMORY[0x24BE64C88]();
}

uint64_t MKMediaCopyProperty()
{
  return MEMORY[0x24BE64C90]();
}

uint64_t MKMediaCreate()
{
  return MEMORY[0x24BE64C98]();
}

uint64_t _CFURLCopyComponents()
{
  return MEMORY[0x24BDBD0D8]();
}

uint64_t _CFURLCreateFromComponents()
{
  return MEMORY[0x24BDBD0F8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24CE28BB8();
}

uint64_t operator new()
{
  return off_24CE28BC0();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_call_unexpected(void *a1)
{
  MEMORY[0x24BEDB918](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x24BEDB968](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x24BDAC850]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x24BDAC918]();
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x24BDAD2B0](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAD990](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x24BDAD998](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB980](*(_QWORD *)&algorithm);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF1C0](crc, buf, *(_QWORD *)&len);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x24BDAE390](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDAE438](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fsync(int a1)
{
  return MEMORY[0x24BDAE528](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x24BDAE548](*(_QWORD *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x24BDAE550](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x24BDAE558](a1, *(_QWORD *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x24BDAE568](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAE5A8](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x24BDAE690](a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x24BDAE6E8]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x24BDAE720](*(_QWORD *)&a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF278](strm, version, *(_QWORD *)&stream_size);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7C8](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF930](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x24BDAF938](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int ptrace(int _request, pid_t _pid, caddr_t _addr, int _data)
{
  return MEMORY[0x24BDAF9D8](*(_QWORD *)&_request, *(_QWORD *)&_pid, _addr, *(_QWORD *)&_data);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAFA00](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

char *__cdecl readpassphrase(const char *a1, char *a2, size_t a3, int a4)
{
  return (char *)MEMORY[0x24BDAFAA8](a1, a2, a3, *(_QWORD *)&a4);
}

int removexattr(const char *path, const char *name, int options)
{
  return MEMORY[0x24BDAFB68](path, name, *(_QWORD *)&options);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x24BDAFD00](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x24BDAFD60](*(_QWORD *)&a1, a2);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x24BDAFEB0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

double strtod(const char *a1, char **a2)
{
  double result;

  MEMORY[0x24BDAFFD0](a1, a2);
  return result;
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0058](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x24BDB0290](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x24BDB0370](a1, a2, a3);
}

void vsyslog(int a1, const char *a2, __darwin_va_list a3)
{
  MEMORY[0x24BDB0460](*(_QWORD *)&a1, a2, a3);
}

void warn(const char *a1, ...)
{
  MEMORY[0x24BDB0480](a1);
}

void warnx(const char *a1, ...)
{
  MEMORY[0x24BDB0490](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

