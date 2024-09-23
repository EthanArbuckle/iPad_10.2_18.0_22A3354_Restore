CFStringRef MKTypeToHuman(int a1, const __CFString *a2, const __CFDictionary *a3)
{
  CFStringRef v4;

  v4 = 0;
  MKTypeClassify(a1, a2, &v4, 0, 0, a3);
  return v4;
}

uint64_t MKTypeClassify(int a1, const __CFString *a2, CFStringRef *a3, int *a4, __int16 *a5, const __CFDictionary *a6)
{
  int v11;
  const __CFString *v12;
  uint64_t result;
  __int16 v14;
  int v15;
  __int16 *v16;
  __int16 *v17;
  __int16 *v18;
  char buffer[256];
  __int16 cStr[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  if (!a2)
  {
    v15 = 0;
    v14 = 0;
    result = 22;
    if (!a5)
      goto LABEL_24;
LABEL_23:
    *a5 = v14;
    goto LABEL_24;
  }
  v17 = 0;
  v18 = 0;
  v11 = MKCFOptionBit(a6, CFSTR("Remap Partition Types"), 1);
  if (a1 > 15)
  {
    if (a1 == 16)
    {
      CFStringGetCString(a2, buffer, 256, 0x8000100u);
      GPTuuidType2HumanExtended(cStr, buffer, 256, v11, &v18);
      if (a3)
        *a3 = CFStringCreateWithCString(0, (const char *)cStr, 0x8000100u);
      v16 = v18;
      if (!v18)
        goto LABEL_21;
      goto LABEL_16;
    }
    if (a1 != 32)
      goto LABEL_7;
  }
  else if (a1 != 1 && a1 != 8)
  {
LABEL_7:
    if (a3)
    {
      v12 = (const __CFString *)CFRetain(a2);
      result = 0;
      v14 = 0;
      *a3 = v12;
      goto LABEL_22;
    }
LABEL_21:
    result = 0;
    v14 = 0;
LABEL_22:
    v15 = 2;
    if (!a5)
      goto LABEL_24;
    goto LABEL_23;
  }
  CFStringGetCString(a2, buffer, 256, 0x8000100u);
  PMTypeToHumanExtended((char *)cStr, buffer, 256, a1, v11, (uint64_t *)&v17);
  if (a3)
    *a3 = CFStringCreateWithCString(0, (const char *)cStr, 0x8000100u);
  v16 = v17;
  if (!v17)
    goto LABEL_21;
LABEL_16:
  result = 0;
  v14 = *v16;
  v15 = (unsigned __int16)v16[1];
  if (a5)
    goto LABEL_23;
LABEL_24:
  if (a4)
    *a4 = v15;
  return result;
}

uint64_t MKCFOptionBit(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  if (!a1)
    return 0;
  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (!Value)
    return 0;
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 == CFNumberGetTypeID())
  {
    v7 = CFBooleanGetValue(v5) == 1;
    goto LABEL_10;
  }
  if (v6 == CFBooleanGetTypeID())
  {
    if (CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDBD270]))
      return a3;
    return 0;
  }
  if (v6 != CFStringGetTypeID())
    return 0;
  v7 = CFStringCompare((CFStringRef)v5, CFSTR("YES"), 1uLL) == kCFCompareEqualTo;
LABEL_10:
  if (!v7)
    return 0;
  return a3;
}

__int16 *GPTuuidType2HumanExtended(__int16 *result, const char *a2, int a3, int a4, __int16 **a5)
{
  const char *v8;
  char *v9;
  __int16 *v10;
  __int16 *v11;
  uint64_t v12;
  __int16 *v13;

  v8 = a2;
  v9 = (char *)result;
  if (result != (__int16 *)a2)
    *(_BYTE *)result = 0;
  if (!a2)
  {
    v13 = 0;
    goto LABEL_19;
  }
  result = lookupDESC(a2);
  v10 = result;
  if (result)
  {
    if (a4)
    {
      if (result == &GPTDescriptors)
      {
        v10 = &GPTDescriptors;
      }
      else
      {
        v11 = &word_24CEC1B10;
        while (strcasecmp((const char *)v10 + 4, (const char *)v11 - 52))
        {
          if (v11 != v10)
          {
            v12 = *((_QWORD *)v11 + 6);
            v11 += 28;
            if (v12)
              continue;
          }
          goto LABEL_17;
        }
        v10 = v11 - 28;
      }
    }
LABEL_17:
    v8 = (const char *)*((_QWORD *)v10 + 6);
    goto LABEL_18;
  }
  v13 = 0;
  if (v9 != v8)
  {
LABEL_18:
    result = (__int16 *)strlcpy(v9, v8, a3);
    v13 = v10;
  }
LABEL_19:
  if (a5)
    *a5 = v13;
  return result;
}

__int16 *lookupDESC(const char *a1)
{
  int v2;
  __int16 *v3;
  const char *v4;
  uuid_t uu;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  memset(uu, 0, sizeof(uu));
  v2 = uuid_parse(a1, uu);
  v3 = &GPTDescriptors;
  v4 = "Reserved";
  while (1)
  {
    if (!v2)
      v4 = (const char *)(v3 + 2);
    if (!strcasecmp(v4, a1))
      break;
    v4 = (const char *)*((_QWORD *)v3 + 13);
    v3 += 28;
    if (!v4)
      return 0;
  }
  return v3;
}

uint64_t MKMediaCreateWithPath(uint64_t a1, char *a2, const __CFDictionary *a3, _DWORD *a4)
{
  uint64_t v8;
  int v9;
  void *v11;
  const __CFAllocator *v12;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v14;
  char *v15;
  mach_port_t v16;
  const __CFDictionary *v17;
  io_service_t MatchingService;
  io_registry_entry_t v19;
  CFTypeRef v20;
  int v21;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  const __CFBoolean *v25;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  stat v32;
  uint64_t v33;
  int v34;
  uint64_t valuePtr;

  v33 = 0;
  if (!a2)
  {
    v8 = 0;
    v9 = 22;
    goto LABEL_5;
  }
  memset(&v32, 0, sizeof(v32));
  if (stat(a2, &v32))
  {
    v8 = 0;
    v9 = *__error();
LABEL_5:
    v34 = v9;
    goto LABEL_6;
  }
  if ((v32.st_mode & 0xF000) == 0x8000)
  {
    v11 = &kMKMediaFileVector;
  }
  else if (devname(v32.st_rdev, 0x6000u))
  {
    v11 = &kMKMediaBlockDeviceVector;
  }
  else
  {
    v11 = &kMKMediaCharDeviceVector;
  }
  v34 = MKCreateMediaDeviceRefcon(&v33, -1, a2);
  if (v34)
  {
    v8 = 0;
  }
  else
  {
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (a3)
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a3);
    else
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v14 = MutableCopy;
    valuePtr = 0;
    v15 = strnstr(a2, "disk", 0x40uLL);
    if (v15)
    {
      v16 = *MEMORY[0x24BDD8B18];
      v17 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, v15);
      MatchingService = IOServiceGetMatchingService(v16, v17);
      if (MatchingService)
      {
        v19 = MatchingService;
        v20 = IORegistryEntrySearchCFProperty(MatchingService, "IOService", CFSTR("Physical Interconnect Location"), v12, 3u);
        if (v20)
        {
          v21 = 1;
          HIDWORD(valuePtr) = 1;
          if (CFEqual(CFSTR("Internal"), v20))
            LODWORD(valuePtr) = 1;
          else
            v21 = 0;
          CFRelease(v20);
          LODWORD(v20) = 1;
        }
        else
        {
          v21 = 0;
        }
        CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, CFSTR("Writable"), v12, 0);
        if (CFProperty)
        {
          LODWORD(v20) = v20 | 2;
          HIDWORD(valuePtr) = (_DWORD)v20;
          if (!CFBooleanGetValue(CFProperty))
          {
            v21 |= 2u;
            LODWORD(valuePtr) = v21;
          }
        }
        v23 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, CFSTR("Removable"), v12, 0);
        if (v23)
        {
          LODWORD(v20) = v20 | 4;
          HIDWORD(valuePtr) = (_DWORD)v20;
          if (CFBooleanGetValue(v23))
          {
            v21 |= 4u;
            LODWORD(valuePtr) = v21;
          }
        }
        v24 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v19, CFSTR("Ejectable"), v12, 0);
        if (v24)
        {
          v25 = v24;
          HIDWORD(valuePtr) = v20 | 8;
          if (CFBooleanGetValue(v24))
            LODWORD(valuePtr) = v21 | 8;
          CFRelease(v25);
        }
        Mutable = CFDictionaryCreateMutable(v12, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (Mutable)
        {
          v27 = Mutable;
          v28 = CFNumberCreate(0, kCFNumberSInt32Type, (char *)&valuePtr + 4);
          if (v28)
          {
            v29 = v28;
            CFDictionarySetValue(v27, CFSTR("valid"), v28);
            CFRelease(v29);
            v30 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            if (v30)
            {
              v31 = v30;
              CFDictionarySetValue(v27, CFSTR("attributes"), v30);
              CFRelease(v31);
            }
          }
          CFDictionarySetValue(v14, CFSTR("Characteristics"), v27);
          CFRelease(v27);
        }
      }
    }
    v8 = MKMediaCreate(a1, v33, (uint64_t)v11, v14, &v34);
    if (v14)
      CFRelease(v14);
  }
LABEL_6:
  if (a4)
    *a4 = v34;
  return v8;
}

uint64_t MKCreateMediaDeviceRefcon(_QWORD *a1, int a2, const char *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  char *v8;
  uint64_t result;

  *a1 = 0;
  v6 = malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (!v6)
    return 12;
  v7 = v6;
  *v6 = 1296786550;
  v6[1] = a2;
  if (a3)
    v8 = strdup(a3);
  else
    v8 = 0;
  result = 0;
  *((_QWORD *)v7 + 1) = v8;
  *((_QWORD *)v7 + 2) = 0;
  *a1 = v7;
  return result;
}

uint64_t MKMediaCreate(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, int *a5)
{
  uint64_t v6;
  int updated;
  uint64_t v10;
  const __CFDictionary *Value;
  const __CFDictionary *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  uint64_t v15;
  char *v16;
  int v17;

  if (!a3
    || *(_DWORD *)a3
    || !*(_QWORD *)(a3 + 8)
    || !*(_QWORD *)(a3 + 16)
    || !*(_QWORD *)(a3 + 24)
    || !*(_QWORD *)(a3 + 32)
    || !*(_QWORD *)(a3 + 40)
    || !*(_QWORD *)(a3 + 48)
    || !*(_QWORD *)(a3 + 56)
    || !*(_QWORD *)(a3 + 64))
  {
    v6 = 0;
    updated = 22;
    goto LABEL_4;
  }
  v17 = 0;
  v10 = _MKMediaCreate(a1, a2, a3, (uint64_t)a4, &v17);
  v6 = v10;
  updated = v17;
  if (v17)
    goto LABEL_25;
  *(_QWORD *)(v10 + 136) = 0;
  updated = pthread_rwlock_init((pthread_rwlock_t *)(v10 + 144), 0);
  if (updated)
    goto LABEL_25;
  updated = (*(uint64_t (**)(_QWORD, const __CFDictionary *))(v6 + 24))(*(_QWORD *)(v6 + 88), a4);
  if (updated)
    goto LABEL_25;
  if (a4)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(a4, CFSTR("Characteristics"));
    if (Value)
    {
      v12 = Value;
      v13 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("attributes"));
      if (v13)
        CFNumberGetValue(v13, kCFNumberSInt32Type, (void *)(v6 + 124));
      v14 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("valid"));
      if (v14)
        CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(v6 + 128));
    }
  }
  updated = _MKMediaUpdateGeometryFromDict(v6);
  if (updated)
  {
LABEL_25:
    if (!v6)
      goto LABEL_4;
LABEL_26:
    v15 = *(_QWORD *)(v6 + 136);
    if (v15)
      _MKMediaBufferPoolDestroy(v15);
    pthread_rwlock_destroy((pthread_rwlock_t *)(v6 + 144));
    CFRelease((CFTypeRef)v6);
    v6 = 0;
    goto LABEL_4;
  }
  v16 = _MKMediaBufferPoolCreate(4, *(_DWORD *)(v6 + 104));
  *(_QWORD *)(v6 + 136) = v16;
  if (v16)
  {
    updated = 0;
    goto LABEL_4;
  }
  updated = 12;
  if (v6)
    goto LABEL_26;
LABEL_4:
  if (a5)
    *a5 = updated;
  return v6;
}

uint64_t _MKMediaCreate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  uint64_t result;
  int v9;

  if (!_kMKMediaID)
  {
    _kMKMediaClass = 0;
    *(_QWORD *)algn_254B66B48 = "MKMedia";
    qword_254B66B50 = 0;
    unk_254B66B58 = 0;
    qword_254B66B60 = (uint64_t)_MKMediaCFRuntimeFinalize;
    unk_254B66B68 = 0;
    qword_254B66B70 = 0;
    unk_254B66B78 = _MKMediaCFRuntimeCopyFormattingDesc;
    qword_254B66B80 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
    _kMKMediaID = _CFRuntimeRegisterClass();
  }
  if (*(_DWORD *)a3)
  {
    result = 0;
    v9 = 22;
  }
  else
  {
    result = _CFRuntimeCreateInstance();
    if (result)
    {
      v9 = 0;
      *(_QWORD *)(result + 88) = a2;
      *(_DWORD *)(result + 16) = *(_DWORD *)a3;
      *(_OWORD *)(result + 24) = *(_OWORD *)(a3 + 8);
      *(_OWORD *)(result + 40) = *(_OWORD *)(a3 + 24);
      *(_OWORD *)(result + 56) = *(_OWORD *)(a3 + 40);
      *(_OWORD *)(result + 72) = *(_OWORD *)(a3 + 56);
    }
    else
    {
      v9 = 12;
    }
  }
  *a5 = v9;
  return result;
}

uint64_t _MKMediaClassInitialize()
{
  uint64_t result;

  _kMKMediaClass = 0;
  *(_QWORD *)algn_254B66B48 = "MKMedia";
  qword_254B66B50 = 0;
  unk_254B66B58 = 0;
  qword_254B66B60 = (uint64_t)_MKMediaCFRuntimeFinalize;
  unk_254B66B68 = 0;
  qword_254B66B70 = 0;
  unk_254B66B78 = _MKMediaCFRuntimeCopyFormattingDesc;
  qword_254B66B80 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
  result = _CFRuntimeRegisterClass();
  _kMKMediaID = result;
  return result;
}

uint64_t _MKMediaBlockDeviceInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  CFStringRef v11;
  const char *v13;
  char *v14;
  const char *v15;
  size_t v16;
  char *v17;
  int v18;
  char __source[8];
  stat v20;
  uint64_t v21;

  v21 = 0;
  strcpy(__source, "/dev/");
  if (!a1 || *(_DWORD *)a1 != 1296786550)
    return 22;
  memset(&v20, 0, sizeof(v20));
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    v13 = *(const char **)(a1 + 8);
    if (v13)
    {
      if (stat(v13, &v20))
        return *__error();
      v14 = devname(v20.st_rdev, 0x2000u);
      if (!v14)
        return 2;
      v15 = v14;
      v16 = strlen(v14) + 6;
      v17 = (char *)malloc_type_malloc(v16, 0xB6C7663DuLL);
      strlcpy(v17, __source, v16);
      strlcat(v17, v15, v16);
      free(*(void **)(a1 + 8));
      *(_QWORD *)(a1 + 8) = v17;
      v18 = _MKMediaOpenFile(v17, theDict, (int *)&v21 + 1, (int *)&v21);
      if (v18 < 0)
        return *__error();
      *(_DWORD *)(a1 + 4) = v18;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("Writable"));
    if (Value)
      HIDWORD(v21) = CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDBD270]);
  }
  *(_QWORD *)(a1 + 8) = strdup("<unknown device>");
LABEL_8:
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 16) = Mutable;
  if (!Mutable)
    return 12;
  v7 = (const void *)*MEMORY[0x24BDBD270];
  v8 = (const void *)*MEMORY[0x24BDBD268];
  if (HIDWORD(v21))
    v9 = (const void *)*MEMORY[0x24BDBD270];
  else
    v9 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionaryAddValue(Mutable, CFSTR("Writable"), v9);
  if ((_DWORD)v21)
    v10 = v7;
  else
    v10 = v8;
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Shared Writer"), v10);
  v11 = CFStringCreateWithCString(v5, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Path"), v11);
  CFRelease(v11);
  return 0;
}

uint64_t _MKMediaOpenFile(const char *a1, CFDictionaryRef theDict, int *a3, int *a4)
{
  CFTypeRef *v7;
  const void *Value;
  const void *v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v7 = (CFTypeRef *)MEMORY[0x24BDBD270];
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("Writable"));
    v10 = CFDictionaryGetValue(theDict, CFSTR("Shared Writer"));
    if (Value && CFEqual(Value, *v7))
    {
      v11 = 2;
      v12 = 1;
      goto LABEL_7;
    }
  }
  else
  {
    v10 = 0;
  }
  v12 = 0;
  v11 = 0;
LABEL_7:
  *a3 = v12;
  if (v10)
  {
    if (CFEqual(v10, *v7))
    {
      v13 = 1;
      v14 = 16;
LABEL_12:
      v11 |= v14;
      *a4 = v13;
      return open(a1, v11, 438);
    }
    if (CFEqual(v10, (CFTypeRef)*MEMORY[0x24BDBD268]))
    {
      v13 = 0;
      v14 = 32;
      goto LABEL_12;
    }
  }
  return open(a1, v11, 438);
}

uint64_t _MKMediaUpdateGeometryFromDict(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  CFTypeID TypeID;
  const void *Value;
  const void *v6;
  CFTypeID v7;
  const void *v8;
  const void *v9;
  CFTypeID v10;
  const void *v11;
  const void *v12;
  CFTypeID v13;
  const void *v14;
  const void *v15;
  uint64_t v16;

  if (a1)
  {
    v2 = (*(uint64_t (**)(_QWORD, const __CFString *))(a1 + 40))(*(_QWORD *)(a1 + 88), CFSTR("Geometry"));
    if (v2)
    {
      v3 = (const void *)v2;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v3))
        goto LABEL_16;
      Value = CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("Sector Count"));
      if (!Value)
        goto LABEL_16;
      v6 = Value;
      v7 = CFNumberGetTypeID();
      if (v7 != CFGetTypeID(v6))
        goto LABEL_16;
      CFNumberGetValue((CFNumberRef)v6, kCFNumberSInt64Type, (void *)(a1 + 96));
      v8 = CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("Block Size"));
      if (!v8)
        goto LABEL_16;
      v9 = v8;
      v10 = CFNumberGetTypeID();
      if (v10 != CFGetTypeID(v9))
        goto LABEL_16;
      CFNumberGetValue((CFNumberRef)v9, kCFNumberSInt32Type, (void *)(a1 + 104));
      v11 = CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("Maximum Transfer Sector Count"));
      if (v11)
      {
        v12 = v11;
        v13 = CFNumberGetTypeID();
        if (v13 != CFGetTypeID(v12))
          goto LABEL_16;
        CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt64Type, (void *)(a1 + 112));
      }
      if (!*(_QWORD *)(a1 + 112))
        *(_QWORD *)(a1 + 112) = ((unint64_t)*(unsigned int *)(a1 + 104) >> 4) & 0x7FFFFF;
      v14 = (const void *)(*(uint64_t (**)(_QWORD, const __CFString *))(a1 + 40))(*(_QWORD *)(a1 + 88), CFSTR("Writable"));
      if (v14)
      {
        v15 = v14;
        *(_DWORD *)(a1 + 120) = CFEqual(v14, (CFTypeRef)*MEMORY[0x24BDBD270]) != 0;
        CFRelease(v15);
        v16 = 0;
LABEL_17:
        CFRelease(v3);
        return v16;
      }
LABEL_16:
      v16 = 22;
      goto LABEL_17;
    }
  }
  return 22;
}

uint64_t MKMediaCopyProperty(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return (*(uint64_t (**)(_QWORD))(a1 + 40))(*(_QWORD *)(a1 + 88));
  else
    return 0;
}

const void *_MKMediaBlockDeviceCopyProperty(uint64_t a1, void *key)
{
  const __CFDictionary *v4;
  const void *v5;
  const void *Value;
  __CFDictionary *Mutable;

  if (!key)
    return 0;
  v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4 && (v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    Value = v5;
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    _MKMediaBlockDeviceGetGeoProperties((_DWORD *)a1, Mutable);
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
      goto LABEL_8;
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable)
    CFRelease(Mutable);
  return Value;
}

uint64_t _MKMediaBlockDeviceGetGeoProperties(_DWORD *a1, __CFDictionary *a2)
{
  int v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  if (!a1)
    return 22;
  if (*a1 != 1296786550)
    return 22;
  v3 = a1[1];
  if (v3 < 0)
    return 22;
  v10 = 0;
  v8 = 0;
  v9 = 0;
  if (ioctl(v3, 0x40046418uLL, &v10))
    return *__error();
  v5 = v10;
  if (ioctl(a1[1], 0x40086419uLL, &v9))
    return *__error();
  v6 = v5 >> 9;
  v9 *= v6;
  if (ioctl(a1[1], 0x40086441uLL, &v8))
    return *__error();
  else
    return _MKMediaSetupGeometry(a2, v10, v9, v8 * v6);
}

uint64_t _MKMediaSetupGeometry(__CFDictionary *a1, int a2, uint64_t a3, uint64_t a4)
{
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  uint64_t v8;
  uint64_t v9;
  int valuePtr;
  void *keys[2];
  const __CFString *v12;
  void *values[4];

  values[3] = *(void **)MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v8 = a4;
  v9 = a3;
  *(_OWORD *)keys = xmmword_24CEC31B0;
  v12 = CFSTR("Maximum Transfer Sector Count");
  if (!a1)
    return 22;
  values[0] = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  values[1] = CFNumberCreate(0, kCFNumberSInt64Type, &v9);
  values[2] = CFNumberCreate(0, kCFNumberSInt64Type, &v8);
  v5 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  if (!v5)
    return 12;
  v6 = v5;
  CFDictionarySetValue(a1, CFSTR("Geometry"), v5);
  CFRelease(v6);
  return 0;
}

char *_MKMediaBufferPoolCreate(int a1, unsigned int a2)
{
  char *v4;

  v4 = (char *)malloc_type_malloc(0x90uLL, 0x101004053EA5042uLL);
  *((_DWORD *)v4 + 28) = a1;
  *((_DWORD *)v4 + 29) = a1;
  *((_DWORD *)v4 + 30) = a2;
  if (!pthread_cond_init((pthread_cond_t *)v4, 0))
  {
    if (!pthread_mutex_init((pthread_mutex_t *)(v4 + 48), 0))
    {
      *((_QWORD *)v4 + 17) = malloc_type_calloc(a1, 4uLL, 0x100004052888210uLL);
      *((_QWORD *)v4 + 16) = malloc_type_calloc(a1, a2, 0xE7FF9EFDuLL);
      return v4;
    }
    pthread_cond_destroy((pthread_cond_t *)v4);
  }
  free(v4);
  return 0;
}

CFBundleRef MKAccessLibrary(const __CFString *a1)
{
  __CFBundle *BundleWithIdentifier;
  const __CFString *v3;
  CFURLRef v4;
  const __CFURL *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFURL *v8;
  CFBundleRef v9;

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.MediaKit"));
  if (!BundleWithIdentifier)
    return 0;
  v3 = a1 ? a1 : CFSTR("MKDrivers");
  v4 = CFBundleCopyBundleURL(BundleWithIdentifier);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFStringCreateWithFormat(0, 0, CFSTR("Loaders/%@.bundle"), v3);
  if (v6
    && ((v7 = v6, v8 = CFURLCreateCopyAppendingPathComponent(0, v5, v6, 1u), CFRelease(v7), v8)
     || (v8 = CFURLCreateWithFileSystemPath(0, v3, kCFURLPOSIXPathStyle, 1u)) != 0))
  {
    v9 = CFBundleCreate(0, v8);
    CFRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v5);
  return v9;
}

const __CFURL *MKLoadDB(__CFBundle *a1, const __CFString *a2, int *a3)
{
  const __CFURL *v4;
  __CFReadStream *v5;
  int v6;

  if (a1)
  {
    v4 = CFBundleCopyResourceURL(a1, a2, CFSTR("plist"), 0);
    if (v4)
    {
      v5 = CFReadStreamCreateWithFile(0, v4);
      CFRelease(v4);
      if (v5)
      {
        if (CFReadStreamOpen(v5))
        {
          v4 = (const __CFURL *)CFPropertyListCreateWithStream(0, v5, 0, 0, 0, 0);
          if (v4)
            v6 = 0;
          else
            v6 = -19;
        }
        else
        {
          v4 = 0;
          v6 = -23;
        }
        CFReadStreamClose(v5);
        CFRelease(v5);
      }
      else
      {
        v4 = 0;
        v6 = -23;
      }
    }
    else
    {
      v6 = -43;
    }
  }
  else
  {
    v4 = 0;
    v6 = -50;
  }
  if (a3)
    *a3 = v6;
  return v4;
}

__CFDictionary *MKCFBuildPartition(int a1, int a2, const __CFString *a3, const void *a4, uint64_t a5, uint64_t a6, int *a7, const void *a8)
{
  __CFDictionary *Mutable;
  const char *v15;
  char v16;
  const __CFString *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  __int16 valuePtr;
  CFUUIDBytes uu;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  valuePtr = a2;
  v24 = a6;
  v25 = a5;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v22 = -1;
    goto LABEL_24;
  }
  if (a2 && (v15 = PMCodeSearch(a2, a1)) != 0)
  {
    a3 = CFStringCreateWithCString(0, v15, 0);
    v16 = 1;
  }
  else
  {
    v16 = 0;
  }
  *(_QWORD *)&uu.byte0 = 0;
  *(_QWORD *)&uu.byte8 = 0;
  if (!a3 || !CFStringGetLength(a3))
  {
    v17 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
LABEL_11:
    a3 = v17;
    if (!v17)
    {
      v22 = -5307;
      if (!a7)
        return Mutable;
      goto LABEL_25;
    }
    goto LABEL_12;
  }
  if ((v16 & 1) == 0)
  {
    v17 = (const __CFString *)CFRetain(a3);
    goto LABEL_11;
  }
LABEL_12:
  CFDictionarySetValue(Mutable, CFSTR("Type"), a3);
  CFRelease(a3);
  if (a4)
    CFDictionarySetValue(Mutable, CFSTR("Name"), a4);
  if (v25)
  {
    v18 = CFNumberCreate(0, kCFNumberSInt64Type, &v25);
    if (v18)
    {
      v19 = v18;
      CFDictionarySetValue(Mutable, CFSTR("Size"), v18);
      CFRelease(v19);
    }
  }
  if (v24)
  {
    v20 = CFNumberCreate(0, kCFNumberSInt64Type, &v24);
    if (v20)
    {
      v21 = v20;
      CFDictionarySetValue(Mutable, CFSTR("Offset"), v20);
      CFRelease(v21);
    }
  }
  MEMORY[0x2199A5D48](&uu);
  v22 = CFDictionarySetUUID(Mutable, CFSTR("GUID"), &uu);
  if (a8)
  {
    CFDictionarySetValue(Mutable, CFSTR("Options"), a8);
    if (!a7)
      return Mutable;
    goto LABEL_25;
  }
LABEL_24:
  if (a7)
LABEL_25:
    *a7 = v22;
  return Mutable;
}

const char *PMCodeSearch(int a1, int a2)
{
  if (a2 <= 7)
  {
    if (a2 >= 4)
      return 0;
    return APMCodeSearch(a1);
  }
  if (a2 <= 31)
  {
    if (a2 == 8)
      return (const char *)MBRCodeSearch(a1);
    if (a2 == 16)
      return GPTCodeSearch(a1);
    return 0;
  }
  if (a2 == 32)
    return ISOCodeSearch(a1);
  if (a2 == 128)
    return APMCodeSearch(a1);
  return 0;
}

const char *GPTCodeSearch(int a1)
{
  __int16 *v2;
  const char *result;
  int v4;

  if (!a1)
    return "Reserved";
  v2 = &word_24CEC1B10;
  do
  {
    result = (const char *)*((_QWORD *)v2 + 6);
    if (!result)
      break;
    v4 = (unsigned __int16)*v2;
    v2 += 28;
  }
  while (v4 != a1);
  return result;
}

uint64_t CFDictionarySetUUID(__CFDictionary *a1, const void *a2, CFUUIDBytes *uu)
{
  const __CFUUID *v6;
  const __CFUUID *v7;

  if (uuid_is_null(&uu->byte0))
  {
    CFDictionaryRemoveValue(a1, a2);
    return 0;
  }
  v6 = uuid2cfstr(uu);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue(a1, a2, v6);
    CFRelease(v7);
    return 0;
  }
  return 22;
}

const __CFUUID *uuid2cfstr(CFUUIDBytes *a1)
{
  const __CFUUID *result;
  const __CFUUID *v2;
  CFStringRef v3;

  result = CFUUIDCreateFromUUIDBytes(0, *a1);
  if (result)
  {
    v2 = result;
    v3 = CFUUIDCreateString(0, result);
    CFRelease(v2);
    return (const __CFUUID *)v3;
  }
  return result;
}

uint64_t MKCFPartitionAttributes(const __CFDictionary *a1, int a2, CFDictionaryRef theDict, _OWORD *a4)
{
  const __CFString *Value;
  int v8;
  unsigned __int16 v10;
  char v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (a4 && (*(_WORD *)a4 = 0, (Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Type"))) != 0))
  {
    v10 = 0;
    v8 = PMCFSetupPartitionType(a2, Value, &v10, v11);
    if (!v8)
      LOWORD(v8) = MKGetPartitionRequisites(a1, a2, v11, v10, a4);
  }
  else
  {
    LOWORD(v8) = 22;
  }
  return (__int16)v8;
}

uint64_t PMCFSetupPartitionType(int a1, const __CFString *cf, unsigned __int16 *a3, char *a4)
{
  CFTypeID v8;
  unsigned __int16 v9;
  uint64_t result;
  char *v11;

  *a3 = 0;
  *a4 = 0;
  v8 = CFGetTypeID(cf);
  if (v8 == CFStringGetTypeID())
  {
    CFStringGetCString(cf, a4, 32, 0);
    v9 = (unsigned __int16)PMDescriptorSearch(a4, a1);
    result = 0;
    *a3 = v9;
  }
  else if (v8 == CFNumberGetTypeID())
  {
    CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt16Type, a3);
    v11 = (char *)PMCodeSearch(*a3, a1);
    strncpypad(a4, v11, 0x20uLL, 0);
    return 0;
  }
  else
  {
    return 22;
  }
  return result;
}

unsigned __int16 *PMDescriptorSearch(char *a1, int a2)
{
  if (a2 <= 7)
  {
    if (a2 >= 4)
      return 0;
    return APMDescriptorSearch(a1);
  }
  if (a2 <= 31)
  {
    if (a2 == 8)
      return MBRDescriptorSearch(a1);
    if (a2 == 16)
      return (unsigned __int16 *)GPTDescriptorSearch((__int16 *)a1);
    return 0;
  }
  if (a2 == 32)
    return ISODescriptorSearch(a1);
  if (a2 == 128)
    return APMDescriptorSearch(a1);
  return 0;
}

__int16 *GPTDescriptorSearch(__int16 *result)
{
  if (result)
  {
    result = lookupDESC((const char *)result);
    if (result)
      return (__int16 *)(unsigned __int16)*result;
  }
  return result;
}

uint64_t MKGetPartitionRequisites(const __CFDictionary *a1, int a2, const char *a3, int a4, _OWORD *a5)
{
  uint64_t v10;
  const char *v11;
  CFStringRef v12;
  CFStringRef v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t v16;

  if (!a5)
    return 22;
  *(_WORD *)a5 = 0;
  v10 = PMSchemeSearch(a2, 0);
  if (!v10)
    return 22;
  v11 = (const char *)v10;
  if (!a3 || !*a3)
  {
    a3 = PMCodeSearch(a4, a2);
    if (!a3)
      return 0;
  }
  v12 = CFStringCreateWithCString(0, v11, 0);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = CFStringCreateWithCString(0, a3, 0);
  if (v14)
  {
    v15 = v14;
    v16 = MKLookupSchemeFormat(a1, v13, v14, 1, a5);
    CFRelease(v13);
    v13 = v15;
  }
  else
  {
    v16 = 0;
  }
  CFRelease(v13);
  return v16;
}

uint64_t PMSchemeSearch(unsigned __int16 a1, _QWORD *a2)
{
  int v2;
  __int16 *v3;
  int v4;

  if (a2)
    *a2 = 0;
  v2 = 1;
  v3 = &word_24CEC3228;
  while (v2 != a1)
  {
    v4 = (unsigned __int16)*v3;
    v3 += 12;
    v2 = v4;
    if (v4 == 0xFFFF)
      return 0;
  }
  if (a2)
    *a2 = *((_QWORD *)v3 - 1);
  return *((_QWORD *)v3 - 2);
}

uint64_t MKLookupSchemeFormat(CFDictionaryRef theDict, const void *a2, const __CFString *a3, char a4, _OWORD *a5)
{
  uint64_t result;
  const __CFDictionary *v10;
  const __CFArray *Value;
  const __CFArray *v12;
  uint64_t Count;
  CFIndex v14;
  char *v15;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v17;
  const __CFString *v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  unsigned int v21;
  const __CFArray *v22;
  const __CFArray *v23;
  char buffer[33];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  result = 22;
  if (a2 && a3)
  {
    *(_OWORD *)((char *)a5 + 138) = 0u;
    a5[7] = 0u;
    a5[8] = 0u;
    a5[5] = 0u;
    a5[6] = 0u;
    a5[3] = 0u;
    a5[4] = 0u;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
    if (theDict)
    {
      result = (uint64_t)CFDictionaryGetValue(theDict, a2);
      if (!result)
        return result;
      v10 = (const __CFDictionary *)result;
      Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)result, a3);
      v12 = Value;
      if (!Value)
      {
        if ((a4 & 1) == 0)
          return 0;
        result = (uint64_t)CFDictionaryGetValue(v10, CFSTR("Media"));
        if (!result)
          return result;
        if (CFArrayDictionarySearchWithIndexOptions((const __CFArray *)result, CFSTR("LoaderID"), a3, 0, 1uLL))
          return 0;
        result = (uint64_t)CFDictionaryGetValue(v10, CFSTR("Default"));
        v12 = (const __CFArray *)result;
        if (!result)
          return result;
      }
      Count = (unsigned __int16)CFArrayGetCount(v12);
      if (Count)
      {
        v14 = 0;
        v15 = (char *)a5 + 2;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v12, v14);
          v17 = ValueAtIndex;
          if (Value
            || (v22 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Exceptions"))) == 0
            || (v23 = v22, CFStringGetCString(a3, buffer, 33, 0), (int)CFStrMatchlist(buffer, v23) <= 0))
          {
            *(_QWORD *)(v15 + 30) = 0;
            *(_OWORD *)v15 = 0u;
            *((_OWORD *)v15 + 1) = 0u;
            v18 = (const __CFString *)CFDictionaryGetValue(v17, CFSTR("LoaderID"));
            if (!v18)
              return 4294966879;
            CFStringGetCString(v18, v15, 33, 0);
            v19 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Loader Type"));
            if (v19)
              CFNumberGetValue(v19, kCFNumberSInt16Type, v15 + 34);
            v20 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Options"));
            if (v20)
              CFNumberGetValue(v20, kCFNumberSInt16Type, v15 + 36);
            v21 = (unsigned __int16)++*(_WORD *)a5;
            if (v21 > 3)
              return 7;
            v15 += 38;
          }
          result = 0;
          if (Count == ++v14)
            return result;
        }
      }
    }
    return 0;
  }
  return result;
}

const __CFDictionary *CFArrayDictionarySearchWithIndexOptions(const __CFArray *a1, const void *a2, const __CFString *a3, CFIndex *a4, CFStringCompareFlags a5)
{
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  const __CFString *Value;
  const __CFString *v16;
  CFTypeID TypeID;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    v11 = 0;
LABEL_13:
    v14 = 0;
    if (a4)
      goto LABEL_14;
    return v14;
  }
  v11 = Count;
  v12 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v12);
    if (!ValueAtIndex)
      goto LABEL_10;
    v14 = ValueAtIndex;
    Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, a2);
    if (!Value)
      goto LABEL_10;
    v16 = Value;
    if (!a5)
      break;
    TypeID = CFStringGetTypeID();
    if (TypeID != CFGetTypeID(v16))
      break;
    if (CFStringCompare(a3, v16, a5) == kCFCompareEqualTo)
      goto LABEL_16;
LABEL_10:
    if (v11 == ++v12)
      goto LABEL_13;
  }
  if (!CFEqual(a3, v16))
    goto LABEL_10;
LABEL_16:
  v11 = v12;
  if (!a4)
    return v14;
LABEL_14:
  *a4 = v11;
  return v14;
}

CFIndex CFStrMatchlist(const char *a1, CFArrayRef theArray)
{
  int Count;
  CFIndex v5;
  uint64_t v6;
  const __CFString *ValueAtIndex;
  char buffer[33];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!theArray)
    return 0xFFFFFFFFLL;
  Count = CFArrayGetCount(theArray);
  if (Count < 1)
    return 0xFFFFFFFFLL;
  v5 = 0;
  v6 = Count;
  while (1)
  {
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v5);
    if (ValueAtIndex)
    {
      if (CFStringGetCString(ValueAtIndex, buffer, 33, 0) && !strncasecmp(a1, buffer, 0x21uLL))
        break;
    }
    if (v6 == ++v5)
      return 0xFFFFFFFFLL;
  }
  return v5;
}

__CFDictionary *MKCFCreateMedia(CFMutableArrayRef *a1, int *a2)
{
  __CFDictionary *Mutable;
  CFMutableArrayRef v5;
  int v6;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v5 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (v5)
    {
      CFDictionarySetValue(Mutable, CFSTR("Schemes"), v5);
      CFRelease(v5);
      v6 = 0;
      if (!a1)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = -1;
  if (a1)
LABEL_7:
    *a1 = v5;
LABEL_8:
  *a2 = v6;
  return Mutable;
}

__CFDictionary *MKCFCreateMap(int a1, __CFArray *a2, const __CFDictionary *a3, __CFBundle *a4, unsigned int a5, int a6, unint64_t a7, const __CFDictionary *a8, uint64_t a9, int *a10)
{
  unsigned int v13;
  const char *v18;
  CFStringRef v19;
  CFStringRef v20;
  __CFDictionary *Mutable;
  __CFDictionary *v22;
  CFStringRef v23;
  CFStringRef v24;
  CFMutableArrayRef v25;
  CFMutableArrayRef v26;
  const __CFNumber *Value;
  CFNumberRef v28;
  const __CFNumber *v29;
  int v30;
  const __CFDictionary *v32;
  char *cStr;
  int v34;
  unsigned __int16 valuePtr;

  v13 = a5;
  valuePtr = a5;
  v34 = a6;
  cStr = 0;
  v18 = (const char *)PMSchemeSearch(a1, &cStr);
  if (!v18 || (v19 = CFStringCreateWithCString(0, v18, 0)) == 0)
  {
    v22 = 0;
    v30 = -5307;
    goto LABEL_21;
  }
  v20 = v19;
  v32 = a8;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v22 = Mutable;
  if (!Mutable)
    goto LABEL_20;
  CFDictionarySetValue(Mutable, CFSTR("ID"), v20);
  CFRelease(v20);
  v23 = CFStringCreateWithCString(0, cStr, 0);
  if (!v23)
    goto LABEL_20;
  v24 = v23;
  CFDictionarySetValue(v22, CFSTR("Name"), v23);
  CFRelease(v24);
  v25 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v25)
    goto LABEL_20;
  v26 = v25;
  CFDictionarySetValue(v22, CFSTR("Sections"), v25);
  CFRelease(v26);
  CFArrayAppendValue(a2, v22);
  CFRelease(v22);
  if (!v13)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("Alignment"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
    v13 = valuePtr;
  }
  if (v13 >= 2)
  {
    v28 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    CFDictionarySetValue(v22, CFSTR("Alignment"), v28);
    CFRelease(v28);
  }
  if (!a6)
  {
    v29 = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("Blocksize"));
    if (v29)
      CFNumberGetValue(v29, kCFNumberSInt32Type, &v34);
  }
  switch(a1)
  {
    case 16:
      v30 = GPTCFCreateMap(v26, a3, a4, valuePtr, v34, a7, v32, a9);
      break;
    case 8:
      v30 = MBRCFCreateMap(v26, a3, (unsigned __int16)v34, a7, v32, a9, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))MKMediaDeviceIO);
      break;
    case 1:
      v30 = APMCFCreateMap(v26, a3, a4, valuePtr, (unsigned __int16)v34, a7, v32, a9, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
      break;
    default:
LABEL_20:
      v30 = -1;
      break;
  }
LABEL_21:
  if (a10)
  {
    if (v30 == -1)
      v30 = *__error();
    *a10 = v30;
  }
  return v22;
}

uint64_t GPTCFCreateMap(__CFArray *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, int a5, unint64_t a6, const __CFDictionary *a7, uint64_t a8)
{
  size_t v11;
  __CFBundle *v12;
  const __CFURL *v13;
  const __CFDictionary *v14;
  Handle v15;
  Ptr *v16;
  const __CFDictionary *v17;
  const __CFURL *v18;
  const __CFDictionary *v19;
  Ptr v20;
  uint64_t *v21;
  _OWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int16 *v32;
  CFStringRef v33;
  Ptr v34;
  unsigned int v35;
  unsigned int v36;
  unsigned __int16 v37;
  unint64_t v38;
  const __CFDictionary *LoaderRecord;
  BOOL v40;
  const __CFDictionary *v41;
  int v42;
  int v43;
  unsigned int v44;
  Ptr v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  const __CFDictionary *v50;
  int v51;
  Ptr v52;
  uint64_t v53;
  _QWORD *v54;
  char v55;
  const __CFString *Value;
  const __CFString *v57;
  unsigned int v58;
  BOOL v59;
  __CFDictionary *v60;
  __CFDictionary *v61;
  const __CFArray *v62;
  uint64_t v63;
  const __CFDictionary *v65;
  uint64_t v67;
  _OWORD v70[2];
  unsigned int v71;
  _OWORD v72[10];
  uint64_t v73;
  unint64_t v74;
  __int16 v75;
  unsigned int v76;
  _QWORD v77[128];
  char __s[16];
  __int128 v79;
  __int128 v80;
  _OWORD v81[3];
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  v71 = 22;
  if (!a2)
    return v71;
  LODWORD(v11) = a5;
  v12 = a3;
  memset(v70, 0, sizeof(v70));
  v71 = -43;
  if (a3 || (v12 = MKAccessLibrary(0)) != 0)
  {
    v13 = MKLoadDB(v12, CFSTR("inventory"), (int *)&v71);
    v14 = MKLoadDB(v12, CFSTR("database"), (int *)&v71);
  }
  else
  {
    v13 = 0;
    v14 = 0;
  }
  MKMediaGetGeometry(a8, (uint64_t)v70);
  if ((_DWORD)v11)
    v11 = v11;
  else
    v11 = LODWORD(v70[0]);
  if (!a6)
    a6 = *((_QWORD *)&v70[0] + 1) / (unint64_t)(v11 >> 9);
  v67 = a8;
  LODWORD(v72[0]) = 0;
  v15 = gptinit((int *)v72);
  if (v15)
  {
    v16 = v15;
    v17 = v14;
    v18 = v13;
    v19 = a7;
    v20 = *v15;
    v21 = (uint64_t *)*((_QWORD *)*v15 + 1);
    *((_DWORD *)*v15 + 8) = v11;
    v22 = malloc_type_calloc(1uLL, v11, 0x82061AF3uLL);
    *v21 = (uint64_t)v22;
    if (v22)
    {
      v23 = v22;
      v77[0] = 0;
      v77[1] = 0;
      v22[2] = 0u;
      v22[3] = 0u;
      v22[4] = 0u;
      v22[5] = 0u;
      *v22 = 0u;
      v22[1] = 0u;
      MEMORY[0x2199A5D48](v77);
      uuid_LtoB((uint64_t)(v23 + 7), (uint64_t)v77);
      *v23 = 0x5452415020494645;
      v23[1] = 0x5C00010000;
      v23[10] = 0x8000000080;
      LODWORD(v24) = 0x4000 / v11;
      if (0x4000 / v11 * (_DWORD)v11 == 0x4000)
        v24 = v24;
      else
        v24 = (v24 + 1);
      v23[3] = 1;
      v23[4] = a6 - 1;
      v23[9] = 2;
      v25 = v24 + 2;
      v26 = a6 - v24 - 2;
      v23[5] = v25;
      v23[6] = v26;
      if (v26 < v25)
      {
        v27 = -5341;
LABEL_19:
        disposegpm(v16);
        a7 = v19;
        v13 = v18;
        v14 = v17;
        goto LABEL_20;
      }
      v28 = *v21;
      uuid_LtoB((uint64_t)(v20 + 16), v28 + 56);
      v29 = *(_QWORD *)(v28 + 40);
      *((_QWORD *)v20 + 5) = v29;
      v30 = *(_QWORD *)(v28 + 48);
      *((_QWORD *)v20 + 6) = *(_QWORD *)(v28 + 32) + v29 - v30;
      *((_QWORD *)v20 + 7) = v30 - v29 + 1;
      *((_DWORD *)v20 + 22) = *(_DWORD *)(v28 + 8);
      *((_QWORD *)v20 + 8) = a6;
    }
    else
    {
      v27 = v72[0];
      if (LODWORD(v72[0]))
        goto LABEL_19;
    }
    v71 = 0;
    a7 = v19;
    v13 = v18;
    v14 = v17;
    goto LABEL_26;
  }
  v27 = v72[0];
LABEL_20:
  if (v27 == -1)
    v27 = *__error();
  v71 = v27;
  if (v27)
    goto LABEL_78;
  v16 = 0;
LABEL_26:
  if ((GPTConvertCreateOptions(a7, 0) & 0x20000000) != 0)
    goto LABEL_71;
  memset(v72, 0, 154);
  v31 = MKLookupSchemeFormat(v14, CFSTR("GPT"), CFSTR("Media"), 0, v72);
  if (!v31)
  {
    v32 = BootAttrSearch((unsigned __int16 *)v72, 5);
    if (v32)
    {
      v65 = a7;
      v33 = CFStringCreateWithCString(0, (const char *)v32, 0);
      v34 = *v16;
      v35 = *((_DWORD *)*v16 + 8);
      v36 = a4;
      if (v35 >= 0x400)
        v36 = a4 / (v35 >> 9);
      v37 = -1;
      v75 = -1;
      v85 = 0;
      v83 = 0u;
      v84 = 0u;
      v82 = 0u;
      memset(v81, 0, sizeof(v81));
      v79 = 0u;
      v80 = 0u;
      *(_OWORD *)__s = 0u;
      v73 = 0;
      v74 = 0;
      if (v36 <= 1)
        v38 = 1;
      else
        v38 = v36;
      v76 = 22;
      LoaderRecord = fetchLoaderRecord(v12, v33, (unsigned __int16)(v35 >> 9), (uint64_t)__s, (uint64_t)&v73, &v76);
      if (v76)
      {
        v40 = 0;
      }
      else
      {
        v41 = LoaderRecord;
        v42 = gpmrtypesearch((uint64_t)v16, (char *)v81, 0);
        v37 = v42;
        v75 = v42;
        v40 = (v42 & 0x80000000) == 0
           && (v43 = (unsigned __int16)v42,
               (comparePartitions((uint64_t)&v34[152 * (unsigned __int16)v42 + 96], __s) & 2) != 0)
           && *(_QWORD *)&v34[152 * v43 + 216] >= v74;
        LoaderRecord = v41;
      }
      v44 = v76;
      if (!v40 && !v76)
      {
        v45 = *v16;
        v46 = *((_QWORD *)*v16 + 5);
        v47 = v46 / v38;
        if (v46 % v38)
          ++v47;
        v48 = *((_QWORD *)&v83 + 1) / v38;
        v49 = v47 * v38;
        if (*((_QWORD *)&v83 + 1) % v38)
          ++v48;
        *(_QWORD *)&v83 = v49;
        *((_QWORD *)&v83 + 1) = v48 * v38;
        if (HIDWORD(v73) && *((_QWORD *)v45 + 7) < (unint64_t)HIDWORD(v73))
        {
          v44 = 28;
          v76 = 28;
        }
        else
        {
          v50 = LoaderRecord;
          MEMORY[0x2199A5D48](&v82);
          if (v37 != 0xFFFF
            || (v51 = gpmrtypesearch((uint64_t)v16, "Microsoft Reserved", 0), v37 = v51, v75 = v51, v51 != -1))
          {
            v76 = delentry((const void **)v16, 96, 0x5Eu, v37, 152);
          }
          v44 = addPartitionRecord((uint64_t *)v16, (uint64_t)__s, v38, &v75);
          v76 = v44;
          LoaderRecord = v50;
          if (!v44)
          {
            v52 = *v16;
            v53 = (uint64_t)&(*v16)[152 * v75];
            v55 = *(_BYTE *)(v53 + 232);
            v54 = (_QWORD *)(v53 + 232);
            if ((v55 & 8) != 0)
            {
              Value = (const __CFString *)CFDictionaryGetValue(v50, CFSTR("Loader Name"));
              if (Value)
                v57 = Value;
              else
                v57 = v33;
              v58 = ResolveLoaderPath(v12, v50, v57, (char *)v77);
              v76 = v58;
              if (v58)
              {
                v44 = v58;
                v59 = v58 == -43;
                LoaderRecord = v50;
                if (v59)
                {
                  if (*((_DWORD *)v52 + 8) == 512)
                  {
                    v44 = -43;
                  }
                  else
                  {
                    v44 = 0;
                    v76 = 0;
                  }
                }
              }
              else
              {
                v44 = GPMPartitionWrite((uint64_t *)v16, v75, (const char *)v77, v67);
                v76 = v44;
                LoaderRecord = v50;
                if (!v44)
                  *v54 &= ~8uLL;
              }
            }
            else
            {
              v44 = 0;
            }
          }
        }
      }
      if (LoaderRecord)
      {
        CFRelease(LoaderRecord);
        v44 = v76;
      }
      CFRelease(v33);
      a7 = v65;
      if (v44 != 28)
      {
        v71 = v44;
        if (v44)
          goto LABEL_78;
        goto LABEL_72;
      }
    }
LABEL_71:
    v71 = 0;
LABEL_72:
    v60 = GPTRecordMapSection((const UInt8 *)v16, 0xFFFFFFFF, (int *)&v71);
    if (v71)
      goto LABEL_78;
    v61 = v60;
    if (v60)
    {
      CFArrayAppendValue(a1, v60);
      CFRelease(v61);
    }
    v62 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Partitions"));
    if (!v62)
      goto LABEL_78;
    v31 = GPTCFCreatePartitions(v61, v62, v12, v63, v14, a4, a7, v67);
  }
  v71 = v31;
LABEL_78:
  if (v13)
    CFRelease(v13);
  if (v14)
    CFRelease(v14);
  return v71;
}

uint64_t filexml(const void *a1, const __CFString *a2)
{
  const __CFURL *v3;
  const __CFURL *v4;
  __CFWriteStream *v5;
  uint64_t v6;

  if (!a1)
    return 4294967246;
  v3 = CFURLCreateWithFileSystemPath(0, a2, kCFURLPOSIXPathStyle, 0);
  if (!v3)
    return 4294967246;
  v4 = v3;
  v5 = CFWriteStreamCreateWithFile(0, v3);
  CFRelease(v4);
  if (!v5)
    return 4294967246;
  if (CFWriteStreamOpen(v5))
  {
    if (CFPropertyListWrite(a1, v5, kCFPropertyListXMLFormat_v1_0, 0, 0))
      v6 = 0;
    else
      v6 = 4294967246;
  }
  else
  {
    v6 = 4294967273;
  }
  CFWriteStreamClose(v5);
  CFRelease(v5);
  return v6;
}

double MKMediaGetGeometry(uint64_t a1, uint64_t a2)
{
  double result;
  uint64_t v3;

  if (a1)
  {
    if (a2)
    {
      result = 0.0;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 104);
      v3 = *(_QWORD *)(a1 + 112);
      *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 96);
      *(_QWORD *)(a2 + 16) = v3;
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a1 + 120);
    }
  }
  return result;
}

Handle gptinit(int *a1)
{
  Handle v2;
  int v3;
  Ptr v4;
  void *v5;

  v2 = NewHandleClear(96);
  v3 = MemError();
  if (v2)
  {
    v4 = *v2;
    v5 = malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
    *((_QWORD *)v4 + 1) = v5;
    if (v5)
    {
      v3 = 0;
    }
    else
    {
      disposegpm(v2);
      v2 = 0;
      v3 = 12;
    }
  }
  *a1 = v3;
  return v2;
}

Handle NewHandleClear(Size byteCount)
{
  return InternalNewHandle(byteCount, 1);
}

Ptr *InternalNewHandle(size_t a1, int a2)
{
  Ptr *v4;
  Ptr *v5;
  char *v6;

  MemErr = -108;
  v4 = (Ptr *)malloc_type_malloc(0x18uLL, 0x1080040BEB90DD3uLL);
  v5 = v4;
  if (v4)
  {
    v4[1] = (Ptr)a1;
    *((_BYTE *)v4 + 16) = 0;
    v6 = (char *)malloc_type_malloc(a1, 0x824B596DuLL);
    *v5 = v6;
    if (v6)
    {
      if (a2)
        bzero(v6, (size_t)v5[1]);
      MemErr = 0;
    }
    else
    {
      DisposeHandle(v5);
      return 0;
    }
  }
  return v5;
}

OSErr MemError(void)
{
  return MemErr;
}

uint64_t uuid_LtoB(uint64_t result, uint64_t a2)
{
  int v2;

  *(_DWORD *)result = bswap32(*(_DWORD *)a2);
  *(_WORD *)(result + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  if (a2 != result)
  {
    *(_WORD *)(result + 8) = *(_WORD *)(a2 + 8);
    v2 = *(_DWORD *)(a2 + 10);
    *(_WORD *)(result + 14) = *(_WORD *)(a2 + 14);
    *(_DWORD *)(result + 10) = v2;
  }
  return result;
}

uint64_t GPTConvertCreateOptions(const __CFDictionary *a1, const __CFDictionary *a2)
{
  uint64_t v4;
  char v5;
  char v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (a1)
    {
      v7 = MKCFOptionBit(a1, CFSTR("Content Ephermeral"), 0x2000);
      v8 = MKCFOptionBit(a1, CFSTR("Retain existing content"), 4);
      v9 = MKCFOptionBit(a1, CFSTR("Write Protect"), 0x80000000);
      v10 = MKCFOptionBit(a1, CFSTR("Flexible Allocation"), 0x10000000);
      v11 = MKCFOptionBit(a1, CFSTR("Direct Mode"), 0x20000000);
      v12 = MKCFOptionBit(a1, CFSTR("No Minimum Size For Loader"), 0x800000);
      v4 = v7 | v8 | v9 | v10 | v11 | v12 | MKCFOptionBit(a1, CFSTR("Allocate Remaining Space"), 0x400000) | v4;
    }
    v5 = 0;
    a1 = a2;
  }
  while ((v6 & 1) != 0);
  return v4;
}

unsigned __int16 *BootAttrSearch(unsigned __int16 *result, int a2)
{
  int v2;
  unsigned __int16 *i;

  if (result)
  {
    v2 = *result;
    if (*result)
    {
      for (i = result + 18; *i != a2; i += 19)
      {
        if (!--v2)
          return 0;
      }
      return i - 17;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFDictionary *fetchLoaderRecord(__CFBundle *a1, const void *a2, unsigned int a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  __CFBundle *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFDictionary *Value;
  const __CFDictionary *v16;
  unsigned int v17;
  __CFString *Mutable;
  const __CFDictionary *v19;
  __CFString *v20;
  unsigned int v21;
  const __CFBoolean *v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  unint64_t v27;
  uint64_t v29;
  unsigned int v30;

  v30 = 22;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_OWORD *)(a4 + 96) = 0u;
  *(_OWORD *)(a4 + 112) = 0u;
  *(_OWORD *)(a4 + 128) = 0u;
  v12 = a1;
  *(_QWORD *)(a4 + 144) = 0;
  if (!a1)
  {
    v12 = MKAccessLibrary(0);
    if (!v12)
    {
      v19 = 0;
      if (!a6)
        return v19;
      goto LABEL_29;
    }
  }
  v13 = MKLoadDB(v12, CFSTR("inventory"), (int *)&v30);
  if (!v13)
  {
    v19 = 0;
    if (a1)
      goto LABEL_28;
    goto LABEL_27;
  }
  v14 = v13;
  v30 = -417;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v13, CFSTR("Loaders"));
  if (Value)
  {
    v16 = Value;
    v30 = -415;
    if (a3 >= 2)
    {
      v29 = a5;
      v17 = a3;
      Mutable = CFStringCreateMutable(0, 0);
      CFStringAppendFormat(Mutable, 0, CFSTR("%@-%u"), a2, v17 << 9);
      v19 = (const __CFDictionary *)CFDictionaryGetValue(v16, Mutable);
      v20 = Mutable;
      a3 = v17;
      a5 = v29;
      CFRelease(v20);
      if (v19)
        goto LABEL_8;
    }
    v19 = (const __CFDictionary *)CFDictionaryGetValue(v16, a2);
    if (v19)
    {
LABEL_8:
      v21 = GPTUpdateLoaderRecord(v19, a4);
      v30 = v21;
      if (a5 && !v21)
      {
        *(_QWORD *)a5 = 0;
        *(_QWORD *)(a5 + 8) = 0;
        *(_QWORD *)(a5 + 8) = *(_QWORD *)(a4 + 120);
        v22 = (const __CFBoolean *)CFDictionaryGetValue(v19, CFSTR("Loader Present"));
        if (v22)
          *(_BYTE *)a5 = CFBooleanGetValue(v22);
        v23 = (const __CFBoolean *)CFDictionaryGetValue(v19, CFSTR("Reserve Space"));
        if (v23)
          *(_BYTE *)(a5 + 1) = CFBooleanGetValue(v23);
        v24 = (const __CFBoolean *)CFDictionaryGetValue(v19, CFSTR("Foreign Payloads"));
        if (v24)
          *(_BYTE *)(a5 + 2) = CFBooleanGetValue(v24);
        v25 = (const __CFNumber *)CFDictionaryGetValue(v19, CFSTR("Minimum Host Size"));
        if (v25)
          CFNumberGetValue(v25, kCFNumberSInt32Type, (void *)(a5 + 4));
        v26 = (const __CFNumber *)CFDictionaryGetValue(v19, CFSTR("Minimum Partition Size"));
        if (v26)
          CFNumberGetValue(v26, kCFNumberSInt64Type, (void *)(a5 + 8));
        if (a3)
        {
          *(_DWORD *)(a5 + 4) /= a3;
          *(_QWORD *)(a5 + 8) /= (unint64_t)a3;
          v27 = *(_QWORD *)(a4 + 120) / (unint64_t)a3;
          *(_QWORD *)(a4 + 112) /= (unint64_t)a3;
          *(_QWORD *)(a4 + 120) = v27;
        }
      }
      CFRetain(v19);
    }
  }
  else
  {
    v19 = 0;
  }
  CFRelease(v14);
  if (!a1)
LABEL_27:
    CFRelease(v12);
LABEL_28:
  if (a6)
LABEL_29:
    *a6 = v30;
  return v19;
}

const __CFNumber *GPTUpdateLoaderRecord(const __CFDictionary *a1, uint64_t a2)
{
  const __CFString *Value;
  const __CFString *v5;
  const __CFNumber *result;
  char buffer[80];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Partition Type"));
  if (!Value || !CFStringGetCString(Value, buffer, 80, 0x8000100u))
    return (const __CFNumber *)22;
  GPTuuidType2HumanExtended((__int16 *)(a2 + 48), buffer, 48, 0, 0);
  v5 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Partition Name"));
  if (v5)
    CFStringGetCString(v5, (char *)a2, 48, 0x8000100u);
  result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Partition Size"));
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, (void *)(a2 + 120));
    return 0;
  }
  return result;
}

__int16 *GPTuuidType2Human(__int16 *a1, const char *a2, int a3)
{
  return GPTuuidType2HumanExtended(a1, a2, a3, 0, 0);
}

uint64_t gpmrtypesearch(uint64_t a1, char *a2, int a3)
{
  __int16 v3;
  unsigned int v4;
  const char *i;

  if (!a1)
    return -1;
  v3 = a3;
  if (a3 < 0)
    return -1;
  v4 = *(unsigned __int16 *)(*(_QWORD *)a1 + 94);
  if (v4 <= (unsigned __int16)a3)
  {
    return -1;
  }
  else
  {
    for (i = (const char *)(*(_QWORD *)a1 + 152 * (unsigned __int16)a3 + 144); strcasecmp(i, a2); i += 152)
    {
      if ((int)v4 <= ++v3)
        return -1;
    }
  }
  return v3;
}

uint64_t addPartitionRecord(uint64_t *a1, uint64_t a2, unsigned int a3, __int16 *a4)
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unsigned __int16 v10;
  uint64_t v11;
  __int16 v12;
  __int16 v13;
  uint64_t result;
  uint64_t v15;
  int v16;
  int v17;
  unsigned __int16 v18;
  uint64_t v19[2];

  v7 = *(_QWORD *)(a2 + 112);
  if (a3)
  {
    v8 = v7 / a3;
    if (v7 % a3)
      ++v8;
    v7 = v8 * a3;
    *(_QWORD *)(a2 + 112) = v7;
  }
  v9 = *(_QWORD *)(a2 + 120);
  v19[0] = v7;
  v19[1] = v9;
  v10 = srequest(a1, v19, (unsigned __int16)a3, 0, a2, 0, 0);
  v11 = *(_QWORD *)(a2 + 112);
  if (v11 == -1 || (v12 = v10, v7) && v11 != v7)
  {
    v13 = -1;
    result = 4294961952;
    if (!a4)
      return result;
    goto LABEL_9;
  }
  *(_QWORD *)(a2 + 136) |= 9uLL;
  *(_WORD *)(a2 + 144) = v10;
  v15 = *a1;
  v16 = *(unsigned __int16 *)(*a1 + 94);
  if (*(_WORD *)(*a1 + 94))
  {
    v17 = 0;
    v18 = v10;
    do
    {
      if (*(unsigned __int16 *)(v15 + 152 * v17 + 240) == v18)
      {
        v17 = 0;
        *(_WORD *)(a2 + 144) = ++v18;
      }
      else
      {
        ++v17;
      }
    }
    while (v17 < v16);
  }
  result = addentry((const void **)a1, (const void *)a2, 0x60uLL, 0x5Eu, v10, 0x98u);
  if ((_DWORD)result)
    v13 = -1;
  else
    v13 = v12;
  if (a4)
LABEL_9:
    *a4 = v13;
  return result;
}

uint64_t srequest(uint64_t *a1, uint64_t *a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t), uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  unint64_t *v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v32;
  _QWORD *i;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v45;
  unsigned int v46;

  *(_OWORD *)(a5 + 112) = xmmword_212DE4510;
  v10 = *a1;
  if (a3 <= 1)
    v11 = 1;
  else
    v11 = a3;
  v46 = *(_DWORD *)(v10 + 32);
  v12 = *a2;
  if (*a2)
  {
    v13 = *(_QWORD *)(v10 + 40);
    if (v12 < (unint64_t)v13 || (v14 = *(_QWORD *)(v10 + 56) + v13, v12 > (unint64_t)v14))
    {
      LOWORD(v15) = 0;
      return (__int16)v15;
    }
    v17 = (unint64_t *)(a2 + 1);
    v16 = a2[1];
    if (v16)
      goto LABEL_24;
    if (v12 >= 1)
    {
      v45 = a5;
      v16 = 0;
      goto LABEL_25;
    }
LABEL_10:
    v15 = *(unsigned __int16 *)(v10 + 94);
    if (*(_WORD *)(v10 + 94))
    {
      v18 = v15 - 1;
      v13 = *(_QWORD *)(v10 + 152 * v18 + 216) + *(_QWORD *)(v10 + 152 * v18 + 208);
      if ((a4 & 0x20000000) == 0)
      {
        if (a6)
          v13 += a6(v10 + 152 * v18 + 96, (unsigned __int16)(v46 >> 9), v11, a4, a7);
      }
    }
    v19 = v13 / v11;
    if (v13 % v11)
      ++v19;
    v20 = v19 * v11;
    if ((a4 & 0x1000000) != 0)
      v21 = v11;
    else
      v21 = 0;
    v22 = v20 - v13;
    if (!v22)
      v22 = v21;
    v23 = v22 + v13;
    v24 = v14 / v11 * v11;
    v25 = v24 <= v23;
    v26 = v24 - v23;
    if (!v25)
    {
      *(_QWORD *)(a5 + 112) = v23;
      *(_QWORD *)(a5 + 120) = v26;
    }
    return (__int16)v15;
  }
  v17 = (unint64_t *)(a2 + 1);
  v16 = a2[1];
  v13 = *(_QWORD *)(v10 + 40);
  if (!v16)
  {
    v14 = *(_QWORD *)(v10 + 56) + v13;
    goto LABEL_10;
  }
LABEL_24:
  v45 = a5;
LABEL_25:
  v15 = 0;
  v27 = v16 / v11;
  if (v16 % v11)
    ++v27;
  v28 = v27 * v11;
  if ((a4 & 0x1000000) != 0)
    v29 = v11;
  else
    v29 = 0;
  v30 = v28 - v16;
  if (!v30)
    v30 = v29;
  *v17 = v30 + v16;
  v32 = (a4 & 0x20000000) == 0 && a6 != 0;
  for (i = (_QWORD *)(v10 + 216); ; i += 19)
  {
    v34 = *(unsigned __int16 *)(v10 + 94);
    if (v15 >= v34)
      v35 = *(_QWORD *)(v10 + 56) + *(_QWORD *)(v10 + 40);
    else
      v35 = *(i - 1);
    v36 = v13 / v11;
    if (v13 % v11)
      ++v36;
    v37 = v36 * v11 - v13;
    if (!v37)
      v37 = v29;
    v38 = v37 + v13;
    if (v35 <= v38)
      goto LABEL_58;
    v39 = *a2;
    if (*a2)
    {
      if (v39 > v35)
        goto LABEL_58;
      if (v39 < v38)
      {
        if ((a4 & 0x10000000) == 0)
          goto LABEL_58;
        *a2 = v38;
        v39 = v38;
      }
      v40 = v39 / v11;
      if (v39 % v11)
        ++v40;
      v38 = v40 * v11;
    }
    v41 = v35 - v38;
    v42 = *v17;
    if (*v17 - 1 < v35 - v38)
      break;
    if (!v42 || (double)v41 / (double)v42 >= 0.85)
    {
      v43 = v41 / v11;
      goto LABEL_64;
    }
LABEL_58:
    if (v15 >= v34)
      return (__int16)v15;
    v13 = *i + v35;
    if (v32)
      v13 += a6((uint64_t)(i - 15), (unsigned __int16)(v46 >> 9), v11, a4, a7);
    ++v15;
  }
  v43 = v42 / v11;
LABEL_64:
  *(_QWORD *)(v45 + 112) = v38;
  *(_QWORD *)(v45 + 120) = v43 * v11;
  return (__int16)v15;
}

uint64_t addentry(const void **a1, const void *a2, size_t size, unsigned int a4, unsigned int a5, unsigned __int16 a6)
{
  int v9;
  char *v12;
  size_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;

  if (a1)
  {
    v9 = size;
    v12 = (char *)*a1;
    if (!v12)
    {
      v12 = (char *)malloc_type_calloc(1uLL, size, 0xC2EEFBCCuLL);
      *a1 = v12;
      if (!v12)
        return *__error();
    }
    v13 = a6 & 0xFFFE;
    v14 = *(unsigned __int16 *)&v12[a4];
    if (v14 >= a5)
      v15 = a5;
    else
      v15 = *(unsigned __int16 *)&v12[a4];
    v16 = v9 + v15 * v13;
    v17 = moveblockextended(a1, v16, v13, 0, v9 + v14 * v13);
    if ((_WORD)v17)
    {
      v18 = v17 << 16;
      if (v17 << 16 == -65536)
        return *__error();
    }
    else
    {
      memmove((char *)*a1 + v16, a2, v13);
      v18 = 0;
      *(_WORD *)((char *)*a1 + a4) = v14 + 1;
    }
  }
  else
  {
    v18 = 1441792;
  }
  return (v18 >> 16);
}

uint64_t moveblockextended(const void **a1, unsigned int a2, int a3, int a4, unsigned int a5)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  char *v13;
  size_t v14;
  char *v15;
  uint64_t result;
  void *v17;
  const void *v18;

  if (!a1)
    return 22;
  if (!a3)
    return 0;
  v10 = malloc_size(*a1);
  if (v10 >= a5)
    v11 = a5;
  else
    v11 = v10;
  if (a5)
    v12 = v11;
  else
    v12 = v10;
  if (a3 < 0)
  {
    if (v12 - a2 + a3)
      memmove((char *)*a1 + a2, (char *)*a1 + a2 - a3, v12 - a2 + a3);
    v17 = reallocf((void *)*a1, v12 + a3);
    if (v17)
    {
      v18 = v17;
      result = 0;
      *a1 = v18;
      return result;
    }
  }
  else
  {
    v13 = (char *)reallocf((void *)*a1, v12 + a3);
    if (v13)
    {
      *a1 = v13;
      v14 = v12 - a2;
      if (v12 != a2)
      {
        v15 = &v13[a2];
        memmove(&v15[a3], v15, v14);
        if (a4)
          bzero(v15, v14);
      }
      return 0;
    }
  }
  return *__error();
}

uint64_t ResolveLoaderPath(__CFBundle *a1, CFDictionaryRef theDict, const __CFString *a3, char *a4)
{
  const __CFString *Value;
  uint64_t v8;
  const __CFURL *v9;
  const __CFURL *v10;
  int v11;

  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Loader Path"));
  if (Value)
  {
    if (CFStringGetCString(Value, a4, 1024, 0))
      return 4294967253;
    else
      return 22;
  }
  else
  {
    v9 = CFBundleCopyResourceURL(a1, a3, CFSTR("loader"), 0);
    v8 = 4294967253;
    if (v9)
    {
      v10 = v9;
      v11 = CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)a4, 1024);
      CFRelease(v10);
      if (v11)
        return 0;
      else
        return 4294967253;
    }
  }
  return v8;
}

uint64_t GPMPartitionWrite(uint64_t *a1, int a2, const char *a3, uint64_t a4)
{
  unint64_t v5;
  unint64_t v6;
  char *v10;
  char *v11;
  uint64_t v12;
  gzFile_s *v13;
  gzFile_s *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;

  if (!a1)
    return 22;
  v5 = *(unsigned int *)(*a1 + 32);
  if (!(_DWORD)v5)
    return 22;
  v6 = (32 * v5);
  if (!(_DWORD)v6)
    return 22;
  v10 = (char *)malloc_type_malloc((32 * v5), 0x33C70D4CuLL);
  if (!v10)
    return 12;
  v11 = v10;
  v27 = 0;
  if (a2 < 0 || (v12 = *a1, a2 > *(unsigned __int16 *)(v12 + 94)))
  {
    free(v10);
    return 22;
  }
  v13 = gzopen(a3, "rb");
  if (!v13)
  {
    free(v11);
    return *__error();
  }
  v14 = v13;
  v15 = v12 + 152 * (unsigned __int16)a2;
  v16 = *(_QWORD *)(v15 + 208);
  v18 = *(_QWORD *)(v15 + 216);
  v17 = (_QWORD *)(v15 + 208);
  v19 = gzread(v13, v11, 32 * v5);
  if (v19)
  {
    v20 = 0;
    v21 = v18 + v16;
    while (1)
    {
      v22 = v19;
      if (v6 > v19)
        bzero(&v11[v19], v6 - v19);
      if (v22 % v5)
        v23 = v22 / v5 + 1;
      else
        v23 = v22 / v5;
      if (v23 + v20 > v21)
      {
        gzclose(v14);
        free(v11);
        return 1;
      }
      v24 = MKMediaWriteBlocks(a4, *v17 + v20, v23, v5, v11, &v27);
      if ((_DWORD)v24)
        break;
      v20 += v27;
      v19 = gzread(v14, v11, 32 * v5);
      if (!v19)
        goto LABEL_18;
    }
    v25 = v24;
    gzclose(v14);
    free(v11);
    if ((_DWORD)v25 == -1)
      return *__error();
  }
  else
  {
LABEL_18:
    v25 = gzclose(v14);
    free(v11);
  }
  return v25;
}

uint64_t MKMediaWriteBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, unint64_t *a6)
{
  unint64_t v7;
  uint64_t result;
  unint64_t v9;

  v7 = a4 >> 9;
  v9 = 0;
  result = MKMediaWriteSectors(a1, v7 * a2, v7 * a3, a5, &v9);
  if (a6)
    *a6 = v9 / v7;
  return result;
}

uint64_t MKMediaWriteSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, _QWORD *a5)
{
  uint64_t result;
  unint64_t v8;
  uint64_t v10;

  v10 = 0;
  if (!a1)
    return 22;
  if (a5)
    *a5 = 0;
  result = 22;
  if (a4)
  {
    v8 = *(_QWORD *)(a1 + 96);
    if (v8 > a2 && a3 + a2 <= v8)
    {
      if (*(_DWORD *)(a1 + 120))
      {
        if (a3)
        {
          result = _MKMediaCommonReadWriteSectors(a1, a2, a3, a4, &v10, 1);
          if (a5)
            *a5 = v10;
        }
        else
        {
          return 0;
        }
      }
      else
      {
        return 19;
      }
    }
  }
  return result;
}

uint64_t _MKMediaCommonReadWriteSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, _QWORD *a5, int a6)
{
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  unint64_t v14;
  uint64_t Buffer;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  unsigned int v23;
  size_t v24;
  BOOL v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = 0;
  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  v10 = *(_QWORD *)(a1 + 136);
  v11 = *(unsigned int *)(a1 + 104);
  _MKMediaAlignmentAnalysis(a2, a3, v11, (uint64_t)&v29);
  if ((unint64_t)v30 | v32 || (unint64_t)v31 > *(_QWORD *)(a1 + 112))
  {
    result = pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 144));
    if ((_DWORD)result)
    {
LABEL_4:
      v13 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    result = pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 144));
    if ((_DWORD)result)
      goto LABEL_4;
  }
  v14 = v11 >> 9;
  if (!(_QWORD)v30)
  {
    v27 = v14;
    v13 = 0;
    goto LABEL_15;
  }
  v28 = 0;
  Buffer = _MKMediaBufferPoolGetBuffer(v10);
  v16 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, uint64_t *))(a1 + 72))(*(_QWORD *)(a1 + 88), *((_QWORD *)&v29 + 1), v14, Buffer, &v28);
  if (!v16)
  {
    v13 = v30;
    v17 = (_QWORD)v30 << 9;
    if (a6)
    {
      memcpy((void *)(Buffer + (((_QWORD)v29 - *((_QWORD *)&v29 + 1)) << 9)), a4, (_QWORD)v30 << 9);
      v16 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, uint64_t *))(a1 + 80))(*(_QWORD *)(a1 + 88), *((_QWORD *)&v29 + 1), v14, Buffer, &v28);
      if (v16)
        goto LABEL_8;
      v27 = v14;
      v13 = v30;
    }
    else
    {
      v27 = v14;
      memcpy(a4, (const void *)(Buffer + (((_QWORD)v29 - *((_QWORD *)&v29 + 1)) << 9)), (_QWORD)v30 << 9);
    }
    a4 += v17;
    _MKMediaBufferPoolReturnBuffer(*(_QWORD *)(a1 + 136), Buffer);
LABEL_15:
    v18 = v31;
    if ((_QWORD)v31)
    {
      v19 = *((_QWORD *)&v30 + 1);
      v28 = 0;
      v26 = a6;
      if (a6)
        v20 = 80;
      else
        v20 = 72;
      do
      {
        if (v18 >= *(_QWORD *)(a1 + 112))
          v21 = *(_QWORD *)(a1 + 112);
        else
          v21 = v18;
        v16 = (*(uint64_t (**)(_QWORD, uint64_t, unint64_t, char *, uint64_t *))(a1 + v20))(*(_QWORD *)(a1 + 88), v19, v21, a4, &v28);
        if (v16)
          break;
        v13 += v21;
        v19 += v21;
        a4 += 512 * v21;
        v18 -= v21;
      }
      while (v18);
      a6 = v26;
    }
    else
    {
      v16 = 0;
    }
    if (!v32)
      goto LABEL_35;
    v28 = 0;
    v22 = (void *)_MKMediaBufferPoolGetBuffer(v10);
    v23 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, void *, uint64_t *))(a1 + 72))(*(_QWORD *)(a1 + 88), *((_QWORD *)&v31 + 1), v27, v22, &v28);
    if (v23)
      goto LABEL_28;
    v24 = v32 << 9;
    if (a6)
    {
      memcpy(v22, a4, v24);
      v23 = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, void *, uint64_t *))(a1 + 80))(*(_QWORD *)(a1 + 88), *((_QWORD *)&v31 + 1), v27, v22, &v28);
      if (v23)
      {
LABEL_28:
        v16 = v23;
LABEL_34:
        _MKMediaBufferPoolReturnBuffer(v10, (uint64_t)v22);
        goto LABEL_35;
      }
    }
    else
    {
      memcpy(a4, v22, v24);
    }
    v16 = 0;
    v13 += v32;
    v10 = *(_QWORD *)(a1 + 136);
    goto LABEL_34;
  }
LABEL_8:
  _MKMediaBufferPoolReturnBuffer(v10, Buffer);
  v13 = 0;
LABEL_35:
  LODWORD(result) = pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 144));
  if ((_DWORD)result)
    v25 = v16 == 0;
  else
    v25 = 0;
  if (v25)
    result = result;
  else
    result = v16;
LABEL_41:
  *a5 = v13;
  return result;
}

unint64_t _MKMediaAlignmentAnalysis(unint64_t result, unint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3 >> 9;
  *(_QWORD *)(a4 + 48) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  v5 = (v4 - result % v4) % v4;
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = result / v4 * v4;
  v6 = a2 - v5;
  if (a2 > v5)
  {
    v7 = v6 / v4 * v4;
    *(_QWORD *)(a4 + 24) = v5 + result;
    *(_QWORD *)(a4 + 32) = v7;
    *(_QWORD *)(a4 + 40) = v7 + v5 + result;
    *(_QWORD *)(a4 + 48) = v6 - v7;
    a2 = v5;
  }
  *(_QWORD *)(a4 + 16) = a2;
  return result;
}

uint64_t _MKMediaDeviceWriteSectors(uint64_t a1, uint64_t a2, uint64_t a3, void *__buf, _QWORD *a5)
{
  uint64_t v6;
  uint64_t result;

  v6 = a3;
  if ((pwrite(*(_DWORD *)(a1 + 4), __buf, a3 << 9, a2 << 9) & 0x80000000) != 0)
  {
    v6 = 0;
    result = *__error();
  }
  else
  {
    result = 0;
  }
  *a5 = v6;
  return result;
}

__CFDictionary *GPTRecordMapSection(const UInt8 *a1, unsigned int a2, int *a3)
{
  uint64_t v4;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  int v9;
  int v10;
  CFNumberRef v12;
  CFNumberRef v13;
  unint64_t v14;
  CFNumberRef v15;
  CFNumberRef v16;
  uint64_t v17;
  const void **v18;
  CFMutableArrayRef v19;
  CFMutableArrayRef v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int16 v23;
  uint64_t v24;
  __int16 *v25;
  __int16 v26;
  __CFDictionary *v27;
  __CFDictionary *v28;
  unsigned int v29;
  unint64_t valuePtr;

  v4 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    v8 = 0;
    goto LABEL_6;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = Mutable;
  if (!Mutable)
  {
LABEL_6:
    v10 = -1;
    goto LABEL_7;
  }
  CFDictionarySetValue(Mutable, CFSTR("ID"), CFSTR("MAP"));
  v9 = CFDictionarySetUUID(v8, CFSTR("GUID"), (CFUUIDBytes *)(v4 + 16));
  if (v9)
  {
    v10 = v9;
    goto LABEL_7;
  }
  v12 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(v4 + 88));
  if (!v12)
    goto LABEL_29;
  v13 = v12;
  CFDictionarySetValue(v8, CFSTR("Revision"), v12);
  CFRelease(v13);
  v14 = (unint64_t)*(unsigned int *)(v4 + 32) >> 9;
  valuePtr = *(_QWORD *)(v4 + 40) * v14;
  v15 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (!v15)
    goto LABEL_29;
  v16 = v15;
  CFDictionarySetValue(v8, CFSTR("Offset"), v15);
  CFRelease(v16);
  MKCFRecordSectionSize(v8, *(_QWORD *)(v4 + 40) * v14, *(_QWORD *)(v4 + 48) * v14, *(_QWORD *)(v4 + 56) * v14, *(_QWORD *)(v4 + 64) * v14, *(_DWORD *)(v4 + 32));
  v17 = *(_QWORD *)(v4 + 80);
  v18 = (const void **)MEMORY[0x24BDBD270];
  if ((v17 & 1) != 0)
  {
    CFDictionarySetValue(v8, CFSTR("Legacy"), (const void *)*MEMORY[0x24BDBD270]);
    v17 = *(_QWORD *)(v4 + 80);
    if ((v17 & 8) == 0)
    {
LABEL_14:
      if ((v17 & 4) == 0)
        goto LABEL_15;
      goto LABEL_32;
    }
  }
  else if ((v17 & 8) == 0)
  {
    goto LABEL_14;
  }
  CFDictionarySetValue(v8, CFSTR("MBR Extension Detect"), *v18);
  v17 = *(_QWORD *)(v4 + 80);
  if ((v17 & 4) == 0)
  {
LABEL_15:
    if ((v17 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_32:
  CFDictionarySetValue(v8, CFSTR("MBR Mutation Detect"), *v18);
  if ((*(_QWORD *)(v4 + 80) & 0x10) != 0)
LABEL_16:
    CFDictionarySetValue(v8, CFSTR("MBR NTFS Prioritized"), *v18);
LABEL_17:
  v19 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v19)
  {
LABEL_29:
    v10 = 0;
    goto LABEL_7;
  }
  v20 = v19;
  CFDictionarySetValue(v8, CFSTR("Partitions"), v19);
  CFRelease(v20);
  if (!*(_WORD *)(v4 + 94) || (v21 = *(_QWORD *)a1, !*(_WORD *)(*(_QWORD *)a1 + 94)))
  {
LABEL_28:
    mkcfstoreref(v8, a1);
    goto LABEL_29;
  }
  v22 = 0;
  v23 = *(_DWORD *)(v4 + 32);
  v24 = v21 + 96;
  v29 = v23;
  while (1)
  {
    v25 = lookupDESC((const char *)(v24 + 48));
    if (v25)
      v26 = v25[1];
    else
      LOBYTE(v26) = 7;
    if (((a2 >> v26) & 1) != 0)
      break;
LABEL_27:
    ++v22;
    v24 += 152;
    if (v22 >= *(unsigned __int16 *)(v21 + 94))
      goto LABEL_28;
  }
  v27 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (v27)
  {
    v28 = v27;
    v10 = GPTUpdatePartitionDictionary(v27, v24, v29);
    CFArrayAppendValue(v20, v28);
    CFRelease(v28);
    if (v10)
      goto LABEL_7;
    goto LABEL_27;
  }
  v10 = 22;
LABEL_7:
  if (a3)
    *a3 = v10;
  return v8;
}

void MKCFRecordSectionSize(__CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t valuePtr;

  v22 = a3;
  valuePtr = a2;
  v20 = a5;
  v21 = a4;
  v19 = a6;
  if (a1)
  {
    v9 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(a1, CFSTR("Media Offset"), v9);
      CFRelease(v10);
    }
    v11 = CFNumberCreate(0, kCFNumberSInt64Type, &v21);
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue(a1, CFSTR("Media Block Count"), v11);
      CFRelease(v12);
    }
    v13 = CFNumberCreate(0, kCFNumberSInt64Type, &v20);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(a1, CFSTR("Section Block Count"), v13);
      CFRelease(v14);
    }
    if (a3)
    {
      v15 = CFNumberCreate(0, kCFNumberSInt64Type, &v22);
      if (v15)
      {
        v16 = v15;
        CFDictionarySetValue(a1, CFSTR("Overhead"), v15);
        CFRelease(v16);
      }
    }
    if (a6 >= 0x200)
    {
      v17 = CFNumberCreate(0, kCFNumberSInt32Type, &v19);
      if (v17)
      {
        v18 = v17;
        CFDictionarySetValue(a1, CFSTR("Media Block Size"), v17);
        CFRelease(v18);
      }
    }
  }
}

uint64_t GPTUpdatePartitionDictionary(__CFDictionary *a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  _QWORD *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFIndex v10;
  CFStringRef v11;
  CFStringRef v12;
  CFIndex v13;
  CFStringRef v14;
  CFStringRef v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  const void *v23;
  uint64_t v24;
  CFNumberRef v25;
  CFNumberRef v26;
  const void *v27;
  int valuePtr;
  uint64_t v29;
  uint64_t v30;

  if (!a2)
    return 22;
  result = CFDictionarySetUUID(a1, CFSTR("GUID"), (CFUUIDBytes *)(a2 + 96));
  if (!(_DWORD)result)
  {
    valuePtr = 0;
    v7 = (_QWORD *)(a2 + 136);
    if ((*(_BYTE *)(a2 + 136) & 1) == 0)
    {
      valuePtr = *(unsigned __int16 *)(a2 + 144) + 1;
      v8 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (v8)
      {
        v9 = v8;
        CFDictionarySetValue(a1, CFSTR("Partition ID"), v8);
        CFRelease(v9);
      }
    }
    v10 = strlen((const char *)(a2 + 48));
    if (v10)
    {
      v11 = CFStringCreateWithBytes(0, (const UInt8 *)(a2 + 48), v10, 0x8000100u, 1u);
      if (v11)
      {
        v12 = v11;
        CFDictionarySetValue(a1, CFSTR("Type"), v11);
        CFRelease(v12);
      }
    }
    v13 = strlen((const char *)a2);
    if (v13)
    {
      v14 = CFStringCreateWithBytes(0, (const UInt8 *)a2, v13, 0x8000100u, 1u);
      if (v14)
      {
        v15 = v14;
        CFDictionarySetValue(a1, CFSTR("Name"), v14);
        CFRelease(v15);
      }
    }
    v16 = *(_QWORD *)(a2 + 112);
    v17 = *(_QWORD *)(a2 + 120);
    v29 = v17;
    v30 = v16;
    if (a3 >= 0x400)
    {
      v18 = a3 >> 9;
      v16 *= v18;
      v17 *= v18;
      v29 = v17;
      v30 = v16;
    }
    if (v16)
    {
      v19 = CFNumberCreate(0, kCFNumberSInt64Type, &v30);
      if (v19)
      {
        v20 = v19;
        CFDictionarySetValue(a1, CFSTR("Offset"), v19);
        CFRelease(v20);
      }
    }
    if (v17)
    {
      v21 = CFNumberCreate(0, kCFNumberSInt64Type, &v29);
      if (v21)
      {
        v22 = v21;
        CFDictionarySetValue(a1, CFSTR("Size"), v21);
        CFRelease(v22);
      }
    }
    v24 = *(_QWORD *)(a2 + 128);
    v23 = (const void *)(a2 + 128);
    if (v24)
    {
      v25 = CFNumberCreate(0, kCFNumberSInt64Type, v23);
      if (v25)
      {
        v26 = v25;
        CFDictionarySetValue(a1, CFSTR("Status"), v25);
        CFRelease(v26);
      }
    }
    if (*v7)
    {
      result = (uint64_t)CFNumberCreate(0, kCFNumberSInt64Type, v7);
      if (!result)
        return result;
      v27 = (const void *)result;
      CFDictionarySetValue(a1, CFSTR("Flags"), (const void *)result);
      CFRelease(v27);
    }
    return 0;
  }
  return result;
}

void mkcfstoreref(__CFDictionary *a1, const UInt8 *a2)
{
  CFDataRef v3;
  CFDataRef v4;

  v3 = CFDataCreateWithBytesNoCopy(0, a2, 8, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(a1, CFSTR("_Reference"), v3);
    CFRelease(v4);
  }
}

uint64_t GPTCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, __CFBundle *a3, uint64_t a4, const __CFDictionary *a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8)
{
  uint64_t Count;
  CFIndex v16;
  const __CFDictionary *ValueAtIndex;
  uint64_t v18;
  uint64_t result;

  if (!a1)
    return 4294967246;
  Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count)
    return 0;
  v16 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v16);
    if (!ValueAtIndex)
      break;
    result = GPTCFCreatePartition(a1, ValueAtIndex, a3, v18, a5, a6, a7, a8);
    if ((_DWORD)result)
      return result;
    if (Count == ++v16)
      return 0;
  }
  return 4294966881;
}

uint64_t GPTCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, uint64_t a4, const __CFDictionary *a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8)
{
  uint64_t result;
  const UInt8 *v15;
  uint64_t *v16;
  uint64_t v17;
  const __CFDictionary *Value;
  unsigned int Options;
  const __CFNumber *v20;
  const __CFArray *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  BOOL v28;
  unint64_t v29;
  unsigned __int16 v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned __int16 v36;
  const __CFString *v37;
  __CFDictionary *Mutable;
  unsigned int valuePtr;
  _QWORD v40[2];
  uint64_t v41[2];
  unsigned __int16 v42;
  _OWORD v43[3];
  _OWORD v44[3];
  unsigned __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  valuePtr = a6;
  result = 22;
  if (a1 && a2)
  {
    v48 = 0;
    v46 = 0u;
    v47 = 0u;
    v45 = 0u;
    memset(v44, 0, sizeof(v44));
    memset(v43, 0, sizeof(v43));
    v15 = mkcfrecoverref(a1);
    if (!v15)
      return 22;
    v16 = (uint64_t *)v15;
    v17 = *(_QWORD *)v15;
    if (CFDictionaryGetUUID(a2, CFSTR("GUID"), (unsigned __int8 *)&v45)
      || uuid_is_null((const unsigned __int8 *)&v45))
    {
      MEMORY[0x2199A5D48](&v45);
    }
    result = GPTUpdatePartitionRecord(a2, (uint64_t)v43, *(_DWORD *)(v17 + 32));
    if (!(_DWORD)result)
    {
      result = strcasecmp((const char *)v44, "Apple_Free");
      if ((_DWORD)result)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Options"));
        Options = GPTConvertCreateOptions(a7, Value);
        if ((Options & 0x20000000) == 0
          && (!strcasecmp((const char *)v44, "Microsoft Basic Data")
           || !strcasecmp((const char *)v44, "MS-DOS")
           || !strcasecmp((const char *)v44, "Windows_NTFS")
           || !strcasecmp((const char *)v44, "DOS_FAT_32")
           || !strcasecmp((const char *)v44, "Windows_FAT_32")))
        {
          valuePtr = 2048;
        }
        v20 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Alignment"));
        if (v20)
          CFNumberGetValue(v20, kCFNumberSInt32Type, &valuePtr);
        v21 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
        v22 = valuePtr;
        v40[0] = a3;
        v40[1] = a5;
        v23 = *(_DWORD *)(*v16 + 32);
        if ((Options & 4) == 0)
          Options |= 0x202000u;
        if (v23 >= 0x400)
          v22 = valuePtr / (v23 >> 9);
        v24 = v46;
        if (v22 <= 1)
        {
          v27 = *((_QWORD *)&v46 + 1);
        }
        else
        {
          if ((_QWORD)v46)
          {
            if ((unint64_t)v46 % v22)
              v25 = (unint64_t)v46 / v22 + 1;
            else
              v25 = (unint64_t)v46 / v22;
            v26 = v25 * v22 - v46;
            v24 = v26 + v46;
            *(_QWORD *)&v46 = v26 + v46;
          }
          else
          {
            v26 = 0;
          }
          if (*((_QWORD *)&v46 + 1))
          {
            v28 = *((_QWORD *)&v46 + 1) >= v26;
            v29 = *((_QWORD *)&v46 + 1) - v26;
            if (v29 == 0 || !v28)
              return 4294961955;
            v27 = v29 / v22 * v22;
            *((_QWORD *)&v46 + 1) = v27;
          }
          else
          {
            v27 = 0;
          }
        }
        v41[0] = v24;
        v41[1] = v27;
        v30 = srequest(v16, v41, (unsigned __int16)v22, Options, (uint64_t)v43, (uint64_t (*)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t))loaderReserve, (uint64_t)v40);
        v42 = v30;
        if ((_QWORD)v46 == -1)
          return 4294961952;
        v31 = v30;
        v32 = 9;
        if ((Options & 4) != 0)
          v32 = 1;
        *((_QWORD *)&v47 + 1) |= v32;
        v33 = *v16;
        LOWORD(v48) = v30;
        v34 = *(unsigned __int16 *)(v33 + 94);
        if (*(_WORD *)(v33 + 94))
        {
          v35 = 0;
          v36 = v30;
          do
          {
            if (*(unsigned __int16 *)(v33 + 152 * v35 + 240) == v36)
            {
              v35 = 0;
              LOWORD(v48) = ++v36;
            }
            else
            {
              ++v35;
            }
          }
          while (v35 < v34);
        }
        result = addentry((const void **)v16, v43, 0x60uLL, 0x5Eu, v30, 0x98u);
        if (!(_DWORD)result)
        {
          if ((Options & 0x20000000) != 0
            || (result = setupPostloader(v16, (__int16 *)&v42, a3, a5, v22, 0, 1u, Options, 0, a8),
                v31 = v42,
                (_DWORD)result == 28)
            || !(_DWORD)result)
          {
            v37 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)&v45);
            Mutable = CFArrayDictionarySearchWithIndexOptions(v21, CFSTR("GUID"), v37, 0, 0);
            CFRelease(v37);
            if (Mutable)
              return GPTUpdatePartitionDictionary(Mutable, *v16 + 152 * v31 + 96, *(unsigned __int16 *)(*v16 + 32));
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            CFArrayAppendValue(v21, Mutable);
            CFRelease(Mutable);
            if (Mutable)
              return GPTUpdatePartitionDictionary(Mutable, *v16 + 152 * v31 + 96, *(unsigned __int16 *)(*v16 + 32));
            return 22;
          }
        }
      }
    }
  }
  return result;
}

const UInt8 *mkcfrecoverref(const __CFDictionary *a1)
{
  const UInt8 *result;

  result = (const UInt8 *)CFDictionaryGetValue(a1, CFSTR("_Reference"));
  if (result)
    return CFDataGetBytePtr((CFDataRef)result);
  return result;
}

uint64_t CFDictionaryGetUUID(const __CFDictionary *a1, const void *a2, unsigned __int8 *a3)
{
  const __CFString *Value;

  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (Value)
    return cfstr2uuid(a3, Value);
  else
    return 2;
}

uint64_t cfstr2uuid(unsigned __int8 *a1, const __CFString *a2)
{
  CFTypeID TypeID;
  char buffer[38];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  TypeID = CFStringGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    if (!CFStringGetCString(a2, buffer, 38, 0))
      return 22;
  }
  else
  {
    uuid_copy(a1, NaNuuid);
  }
  return uuid_parse(buffer, a1);
}

uint64_t GPTUpdatePartitionRecord(const __CFDictionary *a1, uint64_t a2, unsigned int a3)
{
  const __CFString *Value;
  const __CFString *v7;
  CFTypeID v8;
  const __CFString *v9;
  const __CFNumber *v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  const __CFNumber *v14;
  uint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  const __CFNumber *v18;
  uint64_t result;
  uint64_t v20;
  char buffer[80];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Type"));
  if (!Value)
    return 22;
  v7 = Value;
  v8 = CFGetTypeID(Value);
  if (v8 != CFStringGetTypeID())
    return 22;
  v20 = 0;
  if (!CFStringGetCString(v7, buffer, 80, 0x8000100u))
    return 22;
  GPTuuidType2HumanExtended((__int16 *)(a2 + 48), buffer, 48, 0, 0);
  v9 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Name"));
  if (v9)
  {
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    CFStringGetCString(v9, (char *)a2, 48, 0x8000100u);
  }
  v10 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Offset"));
  if (v10)
  {
    v11 = (uint64_t *)(a2 + 112);
    CFNumberGetValue(v10, kCFNumberSInt64Type, (void *)(a2 + 112));
    if ((a3 & 0x1FFFC00) != 0)
    {
      v12 = (unsigned __int16)(a3 >> 9);
      if (*v11 % v12)
        v13 = *v11 / v12 + 1;
      else
        v13 = *v11 / v12;
      *v11 = v13;
    }
  }
  v14 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Size"));
  if (v14)
  {
    v15 = (uint64_t *)(a2 + 120);
    CFNumberGetValue(v14, kCFNumberSInt64Type, (void *)(a2 + 120));
    if ((a3 & 0x1FFFC00) != 0)
    {
      v16 = (unsigned __int16)(a3 >> 9);
      if (*v15 % v16)
        v17 = *v15 / v16 + 1;
      else
        v17 = *v15 / v16;
      *v15 = v17;
    }
  }
  v18 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Status"));
  if (v18)
  {
    CFNumberGetValue(v18, kCFNumberSInt64Type, &v20);
    *(_WORD *)(a2 + 134) = HIWORD(v20);
  }
  result = (uint64_t)CFDictionaryGetValue(a1, CFSTR("Flags"));
  if (result)
  {
    CFNumberGetValue((CFNumberRef)result, kCFNumberSInt64Type, (void *)(a2 + 136));
    return 0;
  }
  return result;
}

uint64_t loaderReserve(uint64_t a1, unsigned int a2, unsigned int a3, int a4, __CFBundle **a5)
{
  uint64_t v5;
  const __CFString *v11;
  unsigned int v12;
  unsigned int v13;
  char *v14;
  char *v15;
  int v16;
  CFStringRef v17;
  CFStringRef v18;
  const __CFDictionary *LoaderRecord;
  unint64_t v20;
  unint64_t v21;
  _OWORD v23[10];
  _QWORD v24[2];
  unsigned int v25;
  _OWORD v26[7];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  v5 = 0;
  v30 = *MEMORY[0x24BDAC8D0];
  v24[0] = 0;
  v24[1] = 0;
  if (a1 && a5)
  {
    if (*a5 && a5[1])
    {
      v29 = 0;
      v27 = 0u;
      v28 = 0u;
      memset(v26, 0, sizeof(v26));
      memset(v23, 0, 154);
      v11 = CFStringCreateWithCString(0, (const char *)(a1 + 48), 0);
      v12 = MKLookupSchemeFormat(a5[1], CFSTR("GPT"), v11, 1, v23);
      v25 = v12;
      CFRelease(v11);
      v5 = 0;
      if (!v12 && LOWORD(v23[0]))
      {
        v5 = 0;
        v13 = 0;
        v14 = (char *)&v23[2] + 4;
        v15 = (char *)&v23[2] + 4;
        do
        {
          v16 = *(unsigned __int16 *)v15;
          v15 += 38;
          if (v16 == 6)
          {
            v17 = CFStringCreateWithCString(0, v14 - 34, 0);
            if (v17)
            {
              v18 = v17;
              LoaderRecord = fetchLoaderRecord(*a5, v17, a2, (uint64_t)v26, (uint64_t)v24, &v25);
              CFRelease(v18);
              if (!v25)
              {
                if (LoaderRecord)
                  CFRelease(LoaderRecord);
                if ((a4 & 0x800000) == 0 && *(_QWORD *)(a1 + 120) >= (unint64_t)HIDWORD(v24[0]) && BYTE1(v24[0]))
                {
                  v20 = *((_QWORD *)&v27 + 1);
                  if (a3)
                  {
                    if (*((_QWORD *)&v27 + 1) % (unint64_t)a3)
                      v21 = *((_QWORD *)&v27 + 1) / (unint64_t)a3 + 1;
                    else
                      v21 = *((_QWORD *)&v27 + 1) / (unint64_t)a3;
                    v20 = v21 * a3;
                    *((_QWORD *)&v27 + 1) = v20;
                  }
                  v5 += v20;
                }
              }
            }
          }
          ++v13;
          v14 = v15;
        }
        while (v13 < LOWORD(v23[0]));
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

uint64_t setupPostloader(uint64_t *a1, __int16 *a2, __CFBundle *a3, const __CFDictionary *a4, unsigned int a5, int64_t a6, unsigned __int8 a7, int a8, uint64_t a9, uint64_t a10)
{
  int v11;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  BOOL v21;
  unsigned int v22;
  const char *v23;
  CFStringRef v24;
  const __CFString *v25;
  uint64_t v26;
  int v27;
  _BYTE v31[154];
  __int16 v32;
  unsigned __int8 uu1[16];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v11 = *a2;
  v32 = *a2;
  if (a3)
  {
    v17 = *a1;
    v18 = CFStringCreateWithCString(0, (const char *)(*a1 + 152 * v11 + 144), 0);
    if (v18)
    {
      v19 = v18;
      memset(v31, 0, sizeof(v31));
      v20 = MKLookupSchemeFormat(a4, CFSTR("GPT"), v18, 1, v31);
      CFRelease(v19);
      if ((_DWORD)v20)
        v21 = 1;
      else
        v21 = *(unsigned __int16 *)v31 == 0;
      if (!v21)
      {
        v22 = 0;
        *(_OWORD *)uu1 = *(_OWORD *)(v17 + 152 * v11 + 192);
        v23 = &v31[2];
        while (1)
        {
          v24 = CFStringCreateWithCString(0, v23, 0);
          if (!v24)
            goto LABEL_15;
          v25 = v24;
          v26 = gpmrsearch(a1, uu1, &v32);
          v27 = *((unsigned __int16 *)v23 + 17);
          if (v27 == 6)
            goto LABEL_12;
          v20 = v26;
          if (v27 != 5)
            break;
LABEL_13:
          CFRelease(v25);
          if ((_DWORD)v20)
            goto LABEL_17;
          ++v22;
          v23 += 38;
          if (v22 >= *(unsigned __int16 *)v31)
            goto LABEL_15;
        }
        if (v27 != 1)
        {
          CFRelease(v25);
          v20 = 4294967292;
          goto LABEL_17;
        }
LABEL_12:
        v20 = mediaLoaderSupport(a3, v25, a1, uu1, a10, v27, a5, a8, a6, a7, a9, 0);
        goto LABEL_13;
      }
    }
    else
    {
      v20 = 22;
    }
  }
  else
  {
LABEL_15:
    v20 = 0;
  }
LABEL_17:
  *a2 = v32;
  return v20;
}

uint64_t gpmrsearch(uint64_t *a1, unsigned __int8 *uu1, _WORD *a3)
{
  uint64_t v3;
  int v6;
  const unsigned __int8 *i;
  uint64_t result;

  *a3 = 0x8000;
  if (!a1)
    return 22;
  v3 = *a1;
  if (!*(_WORD *)(*a1 + 94))
    return 4294961953;
  v6 = 0;
  for (i = (const unsigned __int8 *)(v3 + 192); ; i += 152)
  {
    result = uuid_compare(uu1, i);
    if (!(_DWORD)result)
      break;
    if (++v6 >= *(unsigned __int16 *)(v3 + 94))
      return 4294961953;
  }
  *a3 = v6;
  return result;
}

uint64_t comparePartitions(uint64_t a1, char *__s)
{
  size_t v4;
  _BOOL4 v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  int v11;

  v4 = strlen(__s);
  v5 = strncasecmp((const char *)a1, __s, v4) == 0;
  v6 = v5 | (2 * (strcasecmp((const char *)(a1 + 48), __s + 48) == 0));
  v7 = *(_QWORD *)(a1 + 120);
  v8 = *((_QWORD *)__s + 15);
  v9 = v7 == v8;
  v10 = v7 >= v8;
  v11 = v9;
  return v6 | (4 * v11) | (32 * v10);
}

uint64_t mediaLoaderSupport(__CFBundle *a1, const __CFString *a2, uint64_t *a3, unsigned __int8 *a4, uint64_t a5, int a6, unsigned int a7, int a8, int64_t a9, unsigned __int8 a10, uint64_t a11, _DWORD *a12)
{
  uint64_t *v12;
  int v13;
  uint64_t v18;
  const __CFDictionary *LoaderRecord;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const __CFDictionary *v29;
  char v30;
  uint64_t result;
  int v32;
  unsigned int v33;
  int v34;
  unsigned __int16 v35;
  __int16 v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char *v42;
  __int16 *v43;
  __int16 v44;
  uint64_t v45;
  signed __int16 v46;
  int v47;
  char *v48;
  __int16 *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  __int16 v53;
  int v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  BOOL v59;
  int64_t v60;
  BOOL v61;
  int v62;
  int v63;
  int v64;
  const __CFString *Value;
  const __CFString *v66;
  const __CFNumber *v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  _BOOL4 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  int v81;
  uint64_t v82;
  __CFBundle *v83;
  __int16 v84;
  __int16 v85;
  __int16 v86;
  uint64_t v87;
  const __CFString *v88;
  CFDictionaryRef theDict;
  char theDicta;
  char theDictb;
  unsigned int v94;
  _QWORD v95[2];
  unint64_t v96;
  int valuePtr;
  int v98;
  unsigned int v99;
  char v100[64];
  char v101[1024];
  _OWORD __s[3];
  char v103[48];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  uint64_t v108;

  v12 = a3;
  v13 = a10;
  v108 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v98 = 0;
  v95[1] = 0;
  v96 = 0;
  v107 = 0;
  v105 = 0u;
  v106 = 0u;
  v104 = 0u;
  memset(v103, 0, sizeof(v103));
  memset(__s, 0, sizeof(__s));
  v95[0] = 0;
  v99 = 22;
  if (!a3)
  {
    LoaderRecord = 0;
    LOWORD(v22) = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    LOBYTE(v27) = 0;
    v28 = 0;
    goto LABEL_12;
  }
  v18 = *a3;
  v94 = *(_DWORD *)(*a3 + 32) >> 9;
  LoaderRecord = fetchLoaderRecord(a1, a2, (unsigned __int16)v94, (uint64_t)__s, (uint64_t)v95, &v99);
  if (v99)
    goto LABEL_9;
  v88 = a2;
  if ((a8 & 0x800000) != 0)
    HIDWORD(v95[0]) = 0;
  v21 = a7 <= 1 ? 1 : a7;
  v99 = gpmrsearch(v12, a4, (_WORD *)&v98 + 1);
  if (v99)
  {
LABEL_9:
    LOWORD(v22) = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    LOBYTE(v27) = 0;
    v28 = 0;
LABEL_10:
    LODWORD(v12) = v94;
    goto LABEL_12;
  }
  v32 = a6;
  if (a6 == 6)
  {
    LOWORD(v22) = HIWORD(v98) + 1;
  }
  else
  {
    if (a6 != 1)
    {
      LOWORD(v22) = 0;
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      LOBYTE(v27) = 0;
      v28 = 0;
      v99 = -4;
      goto LABEL_10;
    }
    LOWORD(v22) = HIWORD(v98) - 1;
  }
  v82 = a5;
  v83 = a1;
  if ((__int16)v22 < 1 || *(unsigned __int16 *)(v18 + 94) <= (unsigned __int16)v22)
  {
    v26 = 0;
  }
  else
  {
    v84 = v22;
    v33 = (unsigned __int16)v22;
    v26 = v18 + 152 * (unsigned __int16)v22 + 96;
    v34 = comparePartitions(v26, (char *)__s);
    if ((~v34 & 7) == 0)
    {
      v35 = v21;
      v23 = *(_QWORD *)(v18 + 152 * v33 + 216);
      v36 = v84;
      goto LABEL_34;
    }
    v32 = a6;
    if ((v34 & 2) != 0)
    {
      v35 = v21;
      v23 = *(_QWORD *)(v18 + 152 * v33 + 216);
      if (BYTE2(v95[0]))
      {
        v25 = 1;
        v36 = v84;
      }
      else
      {
        v36 = v84;
        if (v23 == *((_QWORD *)&v105 + 1))
        {
LABEL_34:
          if (BYTE1(v95[0]))
            v25 = 4;
          else
            v25 = 1;
          goto LABEL_106;
        }
        v25 = 0;
      }
LABEL_106:
      sreqbefore(v12, 0, &v96, v35, (__int16)(v36 + 1));
      LOWORD(v22) = v84;
      LOBYTE(v27) = 0;
      v28 = 1;
      v24 = v96;
      goto LABEL_107;
    }
    LOWORD(v22) = v84;
  }
  v37 = *v12;
  theDict = LoaderRecord;
  if (v32 != 6)
  {
    v38 = (__int16)(HIWORD(v98) - 1);
    LOWORD(v98) = HIWORD(v98) - 1;
    if (v38 >= 1)
    {
      v81 = a10;
      v27 = 0;
      v85 = v22;
      while (1)
      {
        v39 = v27;
        v40 = v37;
        v41 = (unsigned __int16)v38;
        v42 = (char *)(v37 + 152 * (unsigned __int16)v38 + 144);
        v43 = lookupDESC(v42);
        if (utf8strcompare(1uLL, v42, v103))
        {
          if (!v43)
          {
            v50 = v40 + 152 * v41;
            goto LABEL_69;
          }
          v27 = v39;
          if (v43[1] == 2)
          {
            v51 = v40 + 152 * v41;
            goto LABEL_71;
          }
          v44 = v98;
          v37 = v40;
        }
        else
        {
          v44 = v98;
          v99 = delentry((const void **)v12, 96, 0x5Eu, (unsigned __int16)v98, 152);
          if (v99)
          {
            v23 = 0;
            v24 = 0;
            v25 = 0;
            v28 = 0;
            v69 = v40 + 152 * v41;
            goto LABEL_141;
          }
          v37 = *v12;
          v27 = (v39 + 1);
        }
        LoaderRecord = theDict;
        v38 = (__int16)(v44 - 1);
        LOWORD(v98) = v44 - 1;
        if (v38 <= 0)
        {
          v45 = v40 + 152 * v41;
          goto LABEL_60;
        }
      }
    }
    goto LABEL_61;
  }
  v46 = HIWORD(v98) + 1;
  LOWORD(v98) = HIWORD(v98) + 1;
  if (*(unsigned __int16 *)(v37 + 94) <= (__int16)(HIWORD(v98) + 1))
  {
LABEL_61:
    LOBYTE(v27) = 0;
    goto LABEL_73;
  }
  v81 = a10;
  v27 = 0;
  v85 = v22;
  while (1)
  {
    v39 = v27;
    v40 = v37;
    v47 = v46;
    v48 = (char *)(v37 + 152 * v46 + 144);
    v49 = lookupDESC(v48);
    if (!utf8strcompare(1uLL, v48, v103))
      break;
    if (!v49)
    {
      v50 = v40 + 152 * v47;
LABEL_69:
      v26 = v50 + 96;
      v37 = v40;
      v13 = v81;
      LOWORD(v22) = v85;
      LOBYTE(v27) = v39;
LABEL_72:
      LoaderRecord = theDict;
      goto LABEL_73;
    }
    v27 = v39;
    if (v49[1] == 2)
    {
      v51 = v40 + 152 * v47;
LABEL_71:
      v26 = v51 + 96;
      v37 = v40;
      v13 = v81;
      LOWORD(v22) = v85;
      goto LABEL_72;
    }
    v46 = v98 + 1;
    LOWORD(v98) = v98 + 1;
    v37 = v40;
LABEL_58:
    LoaderRecord = theDict;
    if (*(unsigned __int16 *)(v37 + 94) <= v46)
    {
      v45 = v40 + 152 * v47;
LABEL_60:
      v26 = v45 + 96;
      v13 = v81;
      LOWORD(v22) = v85;
LABEL_73:
      if (v99)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v28 = 0;
        goto LABEL_107;
      }
      v87 = v37;
      theDicta = v27;
      LOWORD(v52) = v22;
      v99 = gpmrsearch(v12, a4, (_WORD *)&v98 + 1);
      if (v99)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        goto LABEL_77;
      }
      v53 = HIWORD(v98);
      if (a6 != 1)
        v53 = HIWORD(v98) + 1;
      v22 = sreqbefore(v12, 0, &v96, (unsigned __int16)v21, v53);
      v24 = v96;
      v54 = SHIWORD(v98);
      v26 = v87 + 152 * SHIWORD(v98) + 96;
      if (HIDWORD(v95[0]) && *(_QWORD *)(v87 + 152 * SHIWORD(v98) + 216) < (unint64_t)HIDWORD(v95[0]))
      {
        v23 = 0;
        v25 = 0;
        v28 = 0;
        *((_QWORD *)&v105 + 1) = 0;
        v99 = 28;
      }
      else
      {
        v55 = v96;
        if ((~a8 & 0x202000) == 0)
        {
          v56 = *(_QWORD *)(v87 + 152 * SHIWORD(v98) + 216);
          v55 = v96;
          if (*((_QWORD *)&v105 + 1) < v56)
          {
            v55 = v96;
            if (v56 > 0x200000 / v94)
            {
              v55 = 0;
              v96 = 0;
            }
          }
        }
        if (*((_QWORD *)&v105 + 1) % v21)
          v57 = *((_QWORD *)&v105 + 1) / v21 + 1;
        else
          v57 = *((_QWORD *)&v105 + 1) / v21;
        v58 = v57 * v21;
        v59 = v57 * v21 >= v55;
        v60 = v57 * v21 - v55;
        if (v60 != 0 && v59)
        {
          v96 = v58;
          LOBYTE(v27) = theDicta;
          if (a9)
          {
            v61 = v60 <= a9 && a6 == 6;
            v62 = a8;
            if (v61)
              v62 = a8 | 0x2004;
            a8 = v62;
          }
          if (v13)
          {
            v25 = 1;
            if ((a8 & 0x2000) == 0)
            {
              v23 = 0;
              v28 = 0;
              v99 = 1;
              v25 = 0;
              goto LABEL_107;
            }
          }
          else
          {
            v25 = 8;
          }
          if (a7 >= 2)
          {
            if (a6 == 1 && v13)
            {
              v70 = v87 + 152 * SHIWORD(v98);
              v71 = *(_QWORD *)(v70 + 208);
              v72 = *(_QWORD *)(v70 + 216);
              v73 = v71 / v21;
              if (v71 % v21)
                ++v73;
              v74 = v73 * v21;
              *(_QWORD *)(v70 + 208) = v74;
              v75 = v72 + v71 - v74;
            }
            else
            {
              v75 = *(_QWORD *)(v87 + 152 * SHIWORD(v98) + 216);
            }
            *(_QWORD *)(v87 + 152 * v54 + 216) = v75 / v21 * v21;
          }
          if (a6 == 1)
            *(_QWORD *)(v87 + 152 * v54 + 208) += v60;
          v52 = v22;
          *(_QWORD *)(v87 + 152 * v54 + 216) -= v60;
          if ((a8 & 4) == 0)
            *(_QWORD *)(v87 + 152 * v54 + 232) |= 8uLL;
          v63 = v54;
          ++theDicta;
        }
        else
        {
          v63 = SHIWORD(v98);
          v52 = v22;
          v25 = 0;
        }
        v77 = !strcasecmp(v103, "Apple_Free") || BYTE1(v95[0]) != 0;
        if (v13)
        {
          LOWORD(v22) = v52;
          if (v77)
          {
            v23 = 0;
            v28 = 0;
            v99 = 0;
            v25 = 4;
            goto LABEL_79;
          }
          if (a6 == 6)
            v78 = *(_QWORD *)(v87 + 152 * v63 + 216) + *(_QWORD *)(v87 + 152 * v63 + 208);
          else
            v78 = *(_QWORD *)(v87 + 152 * v63 + 208) - *((_QWORD *)&v105 + 1);
          *(_QWORD *)&v105 = v78;
          MEMORY[0x2199A5D48](&v104);
          v99 = addPartitionRecord(v12, (uint64_t)__s, v21, (__int16 *)&v98);
          if (!v99)
          {
            LOWORD(v22) = v52;
            v79 = *v12 + 152 * v52;
            v26 = v79 + 96;
            v23 = *(_QWORD *)(v79 + 216);
            LOBYTE(v27) = theDicta + 1;
            v25 = 1;
            v28 = 1;
            goto LABEL_107;
          }
          v23 = 0;
LABEL_77:
          v28 = 0;
        }
        else
        {
          v23 = 0;
          v28 = 0;
          if (*((_QWORD *)&v105 + 1) <= v96 && v77)
            v25 = 4;
          else
            v25 = 2;
        }
        LOWORD(v22) = v52;
      }
LABEL_79:
      LOBYTE(v27) = theDicta;
      goto LABEL_107;
    }
  }
  v46 = v98;
  v99 = delentry((const void **)v12, 96, 0x5Eu, (unsigned __int16)v98, 152);
  if (!v99)
  {
    v37 = *v12;
    v27 = (v39 + 1);
    goto LABEL_58;
  }
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v28 = 0;
  v69 = v40 + 152 * v47;
LABEL_141:
  v26 = v69 + 96;
  v13 = v81;
  LOWORD(v22) = v85;
  LOBYTE(v27) = v39;
  LoaderRecord = theDict;
LABEL_107:
  if (v99 || (v25 & 1) == 0 || !LOBYTE(v95[0]) || !v13 && BYTE2(v95[0]))
    goto LABEL_10;
  theDictb = v27;
  v86 = v22;
  v64 = v13;
  Value = (const __CFString *)CFDictionaryGetValue(LoaderRecord, CFSTR("Loader Name"));
  if (Value)
    v66 = Value;
  else
    v66 = v88;
  if (BYTE2(v95[0]))
  {
    __sprintf_chk(v100, 0, 0x40uLL, "%s");
  }
  else
  {
    v67 = (const __CFNumber *)CFDictionaryGetValue(LoaderRecord, CFSTR("Checksum"));
    if (v67)
      CFNumberGetValue(v67, kCFNumberSInt32Type, &valuePtr);
    __sprintf_chk(v100, 0, 0x40uLL, "%s %#x");
  }
  v68 = strcasecmp(v100, (const char *)v26);
  if (!v64 || a8 < 0)
  {
    LODWORD(v12) = v94;
    LOBYTE(v27) = theDictb;
    if (v68)
    {
LABEL_127:
      v13 = v64;
      LOWORD(v22) = v86;
      goto LABEL_12;
    }
LABEL_126:
    v25 = v25 & 0xFFFFFFFA | 4;
    goto LABEL_127;
  }
  if ((*(_BYTE *)(v26 + 136) & 9) == 0 && !v68)
  {
    LODWORD(v12) = v94;
    LOBYTE(v27) = theDictb;
    goto LABEL_126;
  }
  v99 = ResolveLoaderPath(v83, LoaderRecord, v66, v101);
  if (v99 || (v99 = GPMPartitionWrite(v12, v86, v101, v82)) != 0)
  {
    v13 = v64;
    LODWORD(v12) = v94;
    goto LABEL_131;
  }
  v80 = v12;
  LODWORD(v12) = v94;
  v99 = GPMUpdateVolumeUUID(v80, v86, v94, v82);
  if (!v99)
  {
    *(_QWORD *)(v26 + 136) &= ~8uLL;
    __strlcpy_chk();
    LOBYTE(v27) = theDictb + 1;
    goto LABEL_126;
  }
  v13 = v64;
LABEL_131:
  LOWORD(v22) = v86;
  LOBYTE(v27) = theDictb;
LABEL_12:
  if ((v25 & (BYTE2(v95[0]) != 0)) != 0)
    v25 = v25 & 0xFFFFFFFA | 4;
  if (a11)
  {
    *(_WORD *)a11 = 259;
    *(_DWORD *)(a11 + 4) = v25;
    *(_WORD *)(a11 + 8) = v22 - HIWORD(v98);
    *(_QWORD *)(a11 + 16) = *((_QWORD *)&v105 + 1) * v12;
    *(_QWORD *)(a11 + 24) = v23 * v12;
    *(_QWORD *)(a11 + 32) = v24 + v23;
    if (v28)
    {
      *(_DWORD *)(a11 + 4) = v25 | 0x80;
      v29 = LoaderRecord;
      v30 = v27;
      uuid_unparse_upper((const unsigned __int8 *)(v26 + 96), (char *)(a11 + 40));
      LOBYTE(v27) = v30;
      LoaderRecord = v29;
    }
  }
  result = v99;
  if (v13 && !v99 && (v25 & 4) == 0)
  {
    result = 1;
    v99 = 1;
  }
  if (a12)
    *a12 = v27 != 0;
  if (LoaderRecord)
  {
    CFRelease(LoaderRecord);
    return v99;
  }
  return result;
}

uint64_t sreqbefore(uint64_t *a1, uint64_t *a2, unint64_t *a3, unsigned int a4, int a5)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (a5 < 0)
  {
    v7 = 0;
    v8 = 0;
    if (!a4)
      goto LABEL_19;
    goto LABEL_15;
  }
  v5 = *a1;
  if (a5)
  {
    v6 = *(unsigned __int16 *)(v5 + 94);
    if (a5 >= v6)
      LOWORD(a5) = *(_WORD *)(v5 + 94);
    v7 = *(_QWORD *)(v5 + 152 * (__int16)a5 + 64) + *(_QWORD *)(v5 + 152 * (__int16)a5 + 56);
  }
  else
  {
    v7 = *(_QWORD *)(v5 + 40);
    v6 = *(unsigned __int16 *)(v5 + 94);
  }
  if (v6 <= (__int16)a5)
    v9 = *(_QWORD *)(v5 + 56) + *(_QWORD *)(v5 + 40);
  else
    v9 = *(_QWORD *)(v5 + 152 * (__int16)a5 + 208);
  v10 = v9 >= v7;
  v8 = v9 - v7;
  if (!v10)
    v8 = 0;
  if (a4)
  {
LABEL_15:
    if (v7 % a4)
      v11 = v7 / a4 + 1;
    else
      v11 = v7 / a4;
    v7 = v11 * a4;
    v8 = v8 / a4 * a4;
  }
LABEL_19:
  if (a2)
    *a2 = v7;
  if (a3)
    *a3 = v8;
  return (__int16)a5;
}

uint64_t MKCFWriteMedia(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5)
{
  const __CFArray *Value;
  const __CFArray *v10;
  uint64_t Count;
  CFIndex v12;
  uint64_t v13;
  const __CFDictionary *ValueAtIndex;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;

  if (!a1)
    return 22;
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Schemes"));
  if (!Value)
    return 22;
  v10 = Value;
  Count = (unsigned __int16)CFArrayGetCount(Value);
  if (!Count)
    return 22;
  v12 = 0;
  v13 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
    if (ValueAtIndex)
    {
      v15 = MKCFWriteScheme(ValueAtIndex, a2, a3, a4, a5);
      if (v15)
        v16 = (_DWORD)v13 == 0;
      else
        v16 = 0;
      if (v16)
        v17 = 0;
      else
        v17 = v15;
      if (v16)
        v13 = v15;
      else
        v13 = v13;
    }
    else
    {
      v17 = 0xFFFFFFFFLL;
    }
    ++v12;
  }
  while (Count != v12);
  if (!(_DWORD)v13)
  {
    v13 = v17;
    if ((_DWORD)v17 == -1)
      return *__error();
  }
  return v13;
}

uint64_t MKCFWriteScheme(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5)
{
  const __CFString *Value;
  int v11;
  char buffer[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("ID"));
  if (!Value || !CFStringGetCString(Value, buffer, 32, 0))
    return 22;
  v11 = PMSchemeSearchByDescriptor(buffer, 0);
  if (v11 == 16)
    return GPTCFWriteScheme(a1, a3, a4, a5);
  if ((unsigned __int16)v11 == 8)
    return MBRCFWriteScheme(a1, (uint64_t)a2, (uint64_t)a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, _QWORD))MKMediaDeviceIO);
  if ((unsigned __int16)v11 == 1)
    return APMCFWriteScheme(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
  return 4294961989;
}

uint64_t PMSchemeSearchByDescriptor(char *a1, _QWORD *a2)
{
  __int16 *v4;
  const char *v5;

  v4 = &PMSDescriptors;
  v5 = "APM";
  while (strcasecmp(a1, v5))
  {
    v5 = (const char *)*((_QWORD *)v4 + 4);
    v4 += 12;
    if (!v5)
    {
      v4 = &word_24CEC32D0;
      break;
    }
  }
  if (a2)
    *a2 = *((_QWORD *)v4 + 2);
  return *v4;
}

uint64_t GPTCFWriteScheme(const __CFDictionary *a1, __CFBundle *a2, const __CFDictionary *a3, uint64_t a4)
{
  const __CFArray *Value;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const UInt8 *v11;
  uint64_t *v12;
  const __CFNumber *v13;
  unsigned int v14;
  uint64_t result;
  const __CFArray *v16;
  unsigned int valuePtr;

  if (!a1)
    return 22;
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Sections"));
  if (!Value)
    return 22;
  v9 = CFArrayDictionarySearchWithIndexOptions(Value, CFSTR("ID"), CFSTR("MAP"), 0, 0);
  if (!v9)
    return 22;
  v10 = v9;
  v11 = mkcfrecoverref(v9);
  if (!v11)
    return 22;
  v12 = (uint64_t *)v11;
  valuePtr = 0;
  v13 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Alignment"));
  if (v13)
  {
    CFNumberGetValue(v13, kCFNumberSInt32Type, &valuePtr);
    v14 = valuePtr;
  }
  else
  {
    v14 = *(_DWORD *)(*v12 + 32) >> 9;
    valuePtr = v14;
  }
  result = GPTCFUpdateSection(v10, a2, v14, a3, a4);
  if (!(_DWORD)result)
  {
    result = GPTWriteMedia(v12, a3, a4);
    if (!(_DWORD)result)
    {
      v16 = (const __CFArray *)CFDictionaryGetValue(v10, CFSTR("Partitions"));
      return GPTUpdatePartitionDictionaries(v12, v16);
    }
  }
  return result;
}

uint64_t GPTCFUpdateSection(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5)
{
  __CFBundle *v8;
  const UInt8 *v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  unint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFNumber *Value;
  unint64_t v21;
  const __CFNumber *v22;
  unint64_t v23;
  unint64_t v24;
  const __CFArray *v25;
  const __CFURL *v26;
  const __CFURL *v27;
  const __CFDictionary *v28;
  const __CFURL *v29;
  uint64_t v30;
  uint64_t v31;
  __int16 *v32;
  const __CFString *v33;
  const __CFDictionary *v34;
  const __CFDictionary *v35;
  const __CFString *v36;
  const char *v37;
  CFStringRef v38;
  const __CFDictionary *LoaderRecord;
  int v40;
  int v41;
  int v42;
  uint64_t v43;
  __int16 *v44;
  int v45;
  int v46;
  const __CFString *v47;
  const __CFDictionary *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int16 *v52;
  int v53;
  int v54;
  const __CFString *v55;
  const __CFDictionary *v56;
  const __CFDictionary *v57;
  int v58;
  int Count;
  int v60;
  CFIndex v61;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v63;
  const __CFDictionary *v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  CFNumberRef v75;
  unint64_t v76;
  int v77;
  uint64_t v78;
  unint64_t v79;
  __CFDictionary *v80;
  CFMutableDictionaryRef Mutable;
  int v82;
  uint64_t v83;
  int v84;
  unsigned int v85;
  int v86;
  unsigned int v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  unsigned int v95;
  unsigned int v96;
  unint64_t v97;
  int64_t v98;
  char *cStr;
  int cStra;
  unsigned int cStrb;
  unsigned int v102;
  char *v103;
  const __CFDictionary *theDict;
  int theDicta;
  const __CFDictionary *cf;
  CFTypeRef cfa;
  unsigned int v108;
  const void **v109;
  int v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  unint64_t v115;
  const __CFDictionary *v116;
  const __CFDictionary *v117;
  const __CFURL *v118;
  const __CFDictionary *v119;
  const __CFArray *theArray;
  uint64_t v121;
  unsigned __int16 v122;
  unsigned int UUID;
  CFIndex idx;
  _OWORD valuePtr[10];
  _QWORD v126[2];
  int v127;
  _BYTE v128[80];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  unsigned __int8 uu1[8];
  uint64_t v140;
  _OWORD __s[9];
  uint64_t v142;
  uint64_t v143;

  v143 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v8 = a2;
  if (!a2)
    v8 = MKAccessLibrary(0);
  v10 = mkcfrecoverref(a1);
  if (!v10)
    return 22;
  v11 = (uint64_t *)v10;
  *(_QWORD *)&valuePtr[0] = 0;
  v12 = *(_QWORD *)v10;
  v13 = *(unsigned int *)(*(_QWORD *)v10 + 32);
  result = CFDictionaryGetUUID(a1, CFSTR("GUID"), (unsigned __int8 *)(*(_QWORD *)v10 + 16));
  if ((_DWORD)result)
    return result;
  v15 = v13 >> 9;
  if (a4
    && (v16 = MKCFOptionBit(a4, CFSTR("Fit Map to Media"), 1),
        v17 = MKCFOptionBit(a4, CFSTR("Fit Map to Container"), 1),
        v16 | v17))
  {
    *(_QWORD *)&valuePtr[0] = 0;
    if (!v17)
      goto LABEL_23;
    result = MKMediaUpdateProperties(a5);
    if ((_DWORD)result)
      return result;
    v18 = (const __CFDictionary *)MKMediaCopyProperty(a5, (uint64_t)CFSTR("Geometry"));
    if (v18)
    {
      v19 = v18;
      Value = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Sector Count"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberSInt64Type, valuePtr);
      CFRelease(v19);
      v21 = *(_QWORD *)&valuePtr[0] / v15;
      *(_QWORD *)&valuePtr[0] /= v15;
    }
    else
    {
LABEL_23:
      v21 = 0;
    }
    result = setMediaBlockcount(v11, v21);
    if (!(_DWORD)result)
    {
      MKCFRecordSectionSize(a1, *(_QWORD *)(v12 + 40) * v15, *(_QWORD *)(v12 + 48) * v15, *(_QWORD *)(v12 + 56) * v15, *(_QWORD *)(v12 + 56) * v15, *(_DWORD *)(v12 + 32));
      goto LABEL_26;
    }
  }
  else
  {
    v22 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Media Block Count"));
    if (v22)
    {
      CFNumberGetValue(v22, kCFNumberSInt64Type, valuePtr);
      v23 = *(_QWORD *)&valuePtr[0];
    }
    else
    {
      v23 = 0;
    }
    v24 = v23 / v15;
    *(_QWORD *)&valuePtr[0] = v24;
    if (v23 < v15
      || v24 == *(_QWORD *)(v12 + 56)
      || (result = setMediaBlockcount(v11, v24), !(_DWORD)result))
    {
LABEL_26:
      UUID = 0;
      v122 = 0;
      v121 = 0;
      v140 = 0;
      *(_QWORD *)uu1 = 0;
      v138 = 0;
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      v129 = 0u;
      memset(v128, 0, sizeof(v128));
      v25 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
      v116 = a4;
      theArray = v25;
      if (v8)
      {
        v117 = MKLoadDB(v8, CFSTR("inventory"), (int *)&UUID);
        v26 = MKLoadDB(v8, CFSTR("database"), (int *)&UUID);
        if (!a4 || (MKCFOptionBit(a4, CFSTR("Direct Mode"), 0x20000000) & 0x20000000) == 0)
        {
          v142 = 0;
          memset(__s, 0, sizeof(__s));
          v126[0] = 0;
          v126[1] = 0;
          memset(valuePtr, 0, 154);
          idx = 0;
          v127 = 22;
          v27 = MKLoadDB(v8, CFSTR("database"), &v127);
          if (v27)
          {
            v28 = v27;
            v29 = MKLoadDB(v8, CFSTR("inventory"), &v127);
            if (v29)
            {
              theDict = v29;
              cf = v28;
              v102 = a3;
              v118 = v26;
              v112 = a5;
              v30 = *v11;
              if (*(_WORD *)(*v11 + 94))
              {
                v31 = 0;
                v108 = (unsigned __int16)(*(_DWORD *)(v30 + 32) >> 9);
                v109 = (const void **)v11;
                while (1)
                {
                  v32 = lookupDESC((const char *)(v30 + 152 * (int)v31 + 144));
                  if (!v32)
                    goto LABEL_38;
                  if (v32[1] != 2)
                    goto LABEL_38;
                  v33 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * (int)v31 + 192));
                  v34 = CFArrayDictionarySearchWithIndexOptions(theArray, CFSTR("GUID"), v33, 0, 0);
                  CFRelease(v33);
                  if (!v34)
                    goto LABEL_38;
                  v35 = (const __CFDictionary *)CFDictionaryGetValue(v34, CFSTR("Options"));
                  if (v35)
                  {
                    if (MKCFOptionBit(v35, CFSTR("Direct Mode"), 0x20000000))
                      goto LABEL_38;
                  }
                  v36 = CFStringCreateWithCString(0, (const char *)(v30 + 152 * (int)v31 + 144), 0);
                  v127 = MKLookupSchemeFormat(cf, CFSTR("GPT"), v36, 1, valuePtr);
                  CFRelease(v36);
                  if (!CFDictionaryGetValue(theDict, CFSTR("Loaders")))
                    break;
                  if (LOWORD(valuePtr[0]))
                  {
                    v114 = 0;
                    v37 = (char *)valuePtr + 2;
                    while (1)
                    {
                      v38 = CFStringCreateWithCString(0, v37, 0);
                      LoaderRecord = fetchLoaderRecord(v8, v38, v108, (uint64_t)__s, (uint64_t)v126, (unsigned int *)&v127);
                      CFRelease(v38);
                      if (LoaderRecord)
                        CFRelease(LoaderRecord);
                      if (v127)
                        goto LABEL_92;
                      v40 = *((unsigned __int16 *)v37 + 17);
                      if (v40 == 1)
                        break;
                      if (v40 == 6)
                      {
                        v41 = v31 + 1;
                        if ((int)v31 + 1 < *(unsigned __int16 *)(v30 + 94))
                        {
                          v110 = 0;
                          v42 = v31;
                          while (1)
                          {
                            v43 = v30 + 152 * v41;
                            v44 = lookupDESC((const char *)(v43 + 144));
                            if (!v44)
                              goto LABEL_64;
                            v45 = (unsigned __int16)v44[1];
                            if (v45 != 4)
                            {
                              v42 = v41;
                              if (v45 == 2)
                                goto LABEL_84;
                              goto LABEL_65;
                            }
                            v46 = comparePartitions(v43 + 96, (char *)__s);
                            if ((~v46 & 6) == 0 || (v46 & 2) != 0 && BYTE2(v126[0]))
                            {
                              if (!v110)
                              {
                                v110 = 1;
LABEL_64:
                                v42 = v41;
                                goto LABEL_65;
                              }
                              ++v110;
                            }
                            v47 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * v41 + 192));
                            v48 = CFArrayDictionarySearchWithIndexOptions(theArray, CFSTR("GUID"), v47, &idx, 0);
                            CFRelease(v47);
                            if (v48)
                              CFArrayRemoveValueAtIndex(theArray, idx);
                            v11 = (uint64_t *)v109;
                            v127 = delentry(v109, 96, 0x5Eu, (unsigned __int16)v41, 152);
                            if (v127)
                              goto LABEL_92;
LABEL_65:
                            v41 = v42 + 1;
                            if (v42 + 1 >= *(unsigned __int16 *)(v30 + 94))
                              goto LABEL_84;
                          }
                        }
                        goto LABEL_84;
                      }
LABEL_85:
                      v37 += 38;
                      if (++v114 >= LOWORD(valuePtr[0]))
                        goto LABEL_38;
                    }
                    if ((int)v31 < 2)
                    {
LABEL_84:
                      if (v127)
                        goto LABEL_92;
                      goto LABEL_85;
                    }
                    v111 = 0;
                    v49 = v31;
                    while (2)
                    {
                      v50 = (v49 - 1);
                      v51 = v30 + 152 * v50;
                      v52 = lookupDESC((const char *)(v51 + 144));
                      if (v52)
                      {
                        v53 = (unsigned __int16)v52[1];
                        if (v53 == 4)
                        {
                          v54 = comparePartitions(v51 + 96, (char *)__s);
                          if ((~v54 & 6) == 0 || (v54 & 2) != 0 && BYTE2(v126[0]))
                          {
                            if (!v111)
                            {
                              v111 = 1;
                              goto LABEL_83;
                            }
                            ++v111;
                          }
                          v55 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v30 + 152 * v50 + 192));
                          v56 = CFArrayDictionarySearchWithIndexOptions(theArray, CFSTR("GUID"), v55, &idx, 0);
                          CFRelease(v55);
                          if (v56)
                            CFArrayRemoveValueAtIndex(theArray, idx);
                          v11 = (uint64_t *)v109;
                          v127 = delentry(v109, 96, 0x5Eu, (unsigned __int16)(v49 - 1), 152);
                          if (v127)
                            goto LABEL_92;
                          v31 = (v31 - 1);
                          v50 = v49;
                          goto LABEL_83;
                        }
                        if (v53 == 2)
                          goto LABEL_84;
                      }
LABEL_83:
                      v49 = v50;
                      if ((int)v50 <= 1)
                        goto LABEL_84;
                      continue;
                    }
                  }
                  if (v127)
                    goto LABEL_92;
LABEL_38:
                  v31 = (v31 + 1);
                  if ((int)v31 >= *(unsigned __int16 *)(v30 + 94))
                    goto LABEL_92;
                }
                v127 = -417;
              }
LABEL_92:
              CFRelease(cf);
              a5 = v112;
              v26 = v118;
              v25 = theArray;
              a3 = v102;
              v57 = theDict;
            }
            else
            {
              v57 = v28;
            }
            CFRelease(v57);
          }
          v58 = v127;
          if (v127 == -1)
            v58 = *__error();
          UUID = v58;
          if (v58)
            return UUID;
        }
      }
      else
      {
        v117 = 0;
        v26 = 0;
      }
      v119 = v26;
      v113 = a5;
      Count = CFArrayGetCount(v25);
      if (Count >= 1)
      {
        v60 = Count;
        LODWORD(v61) = 0;
        v115 = a3 / (*(_DWORD *)(*v11 + 32) >> 9);
        cfa = (CFTypeRef)*MEMORY[0x24BDBD270];
        while (2)
        {
          v61 = (int)v61;
          while (1)
          {
            UUID = 22;
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v61);
            if (!ValueAtIndex)
              goto LABEL_166;
            v63 = ValueAtIndex;
            UUID = CFDictionaryGetUUID(ValueAtIndex, CFSTR("GUID"), uu1);
            if (UUID != 2)
              break;
            ++v61;
            UUID = 0;
            if (v61 >= v60)
              goto LABEL_166;
          }
          v64 = (const __CFDictionary *)CFDictionaryGetValue(v63, CFSTR("Options"));
          cStr = (char *)v64;
          if ((unint64_t)v116 | (unint64_t)v64)
            theDicta = GPTConvertCreateOptions(v116, v64);
          else
            theDicta = 0;
          UUID = gpmrsearch(v11, uu1, &v122);
          v65 = *v11;
          if (UUID)
          {
            v103 = 0;
            v138 = 0;
            v136 = 0u;
            v137 = 0u;
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            v130 = 0u;
            v131 = 0u;
            v129 = 0u;
          }
          else
          {
            v66 = v65 + 152 * (__int16)v122;
            v103 = (char *)(v66 + 96);
            v67 = *(_OWORD *)(v66 + 192);
            v68 = *(_OWORD *)(v66 + 208);
            v69 = *(_OWORD *)(v66 + 224);
            v138 = *(_QWORD *)(v66 + 240);
            v136 = v68;
            v137 = v69;
            v70 = *(_OWORD *)(v66 + 112);
            v129 = *(_OWORD *)(v66 + 96);
            v130 = v70;
            v71 = *(_OWORD *)(v66 + 128);
            v72 = *(_OWORD *)(v66 + 144);
            v73 = *(_OWORD *)(v66 + 176);
            v133 = *(_OWORD *)(v66 + 160);
            v134 = v73;
            v131 = v71;
            v132 = v72;
            v135 = v67;
            v136 = 0uLL;
          }
          GPTUpdatePartitionRecord(v63, (uint64_t)&v129, *(_DWORD *)(v65 + 32));
          if (UUID)
          {
            if (UUID != -5343)
              break;
            if ((theDicta & 0x400000) != 0)
            {
              *((_QWORD *)&v136 + 1) = 0;
              v75 = CFNumberCreate(0, kCFNumberSInt64Type, (char *)&v136 + 8);
              CFDictionarySetValue(v63, CFSTR("Size"), v75);
              CFRelease(v75);
            }
          }
          else
          {
            v76 = *((_QWORD *)&v136 + 1);
            if (!((_QWORD)v136 + *((_QWORD *)&v136 + 1)))
            {
              if ((theDicta & 0x20000000) == 0)
              {
                UUID = purgeLoader(v119, v117, (const void **)v11, (__int16)v122, (int *)&v121 + 1, theArray, v61, &v121);
                if (UUID)
                  break;
                LODWORD(v61) = v61 + ((int)v121 >> 31);
                v60 -= v121 != 0;
                if (v121 < 0)
                {
                  UUID = gpmrsearch(v11, uu1, &v122);
                  if (UUID)
                    break;
                }
              }
              UUID = delentry((const void **)v11, 96, 0x5Eu, v122, 152);
              if (UUID)
                break;
              CFArrayRemoveValueAtIndex(theArray, (int)v61);
              --v60;
              goto LABEL_138;
            }
            v97 = v136;
            if (!strcasecmp((const char *)&v132, v103 + 48))
            {
              if (v76 == *((_QWORD *)v103 + 15))
              {
                v77 = 0;
                v78 = v76;
                v79 = v97;
              }
              else
              {
                if (v76)
                {
                  v77 = 0;
                  v79 = v97;
                }
                else
                {
                  v82 = (__int16)v122 + 1;
                  if (v82 >= *(unsigned __int16 *)(v65 + 94))
                    v83 = *(_QWORD *)(v65 + 40) + *(_QWORD *)(v65 + 56);
                  else
                    v83 = *(_QWORD *)(v65 + 152 * v82 + 208);
                  v79 = v97;
                  v76 = v83 - *((_QWORD *)v103 + 14);
                  v77 = 1;
                }
                v78 = v76 / v115 * v115;
                *((_QWORD *)&v136 + 1) = v78;
                v76 = *((_QWORD *)v103 + 15);
              }
              if (v78 == v76)
                v84 = v77;
              else
                v84 = v77 | 0x3E8;
              v98 = v78 - v76;
              if (v79 == *((_QWORD *)v103 + 14))
              {
                cStra = v84;
              }
              else
              {
                MEMORY[0x2199A5D48](v103 + 96);
                cStra = v84 + 1;
                v78 = *((_QWORD *)&v136 + 1);
                v79 = v136;
              }
              UUID = svalidate(v11, v79, v78, (unsigned __int16)v115, (__int16)v122);
              if (UUID)
                break;
              v85 = cStra;
              if ((_QWORD)v137 != *((_QWORD *)v103 + 16))
                v85 = cStra + 1;
              cStrb = v85;
              v86 = strcasecmp((const char *)&v129, v103);
              v87 = cStrb;
              if (v86)
                v87 = cStrb + 1;
              if (v87)
              {
                v88 = v130;
                *(_OWORD *)v103 = v129;
                *((_OWORD *)v103 + 1) = v88;
                v89 = v131;
                v90 = v132;
                v91 = v134;
                *((_OWORD *)v103 + 4) = v133;
                *((_OWORD *)v103 + 5) = v91;
                *((_OWORD *)v103 + 2) = v89;
                *((_OWORD *)v103 + 3) = v90;
                v92 = v135;
                v93 = v136;
                v94 = v137;
                *((_QWORD *)v103 + 18) = v138;
                *((_OWORD *)v103 + 7) = v93;
                *((_OWORD *)v103 + 8) = v94;
                *((_OWORD *)v103 + 6) = v92;
                if ((theDicta & 0x20000000) == 0 && v87 >= 0x3E8)
                {
                  v95 = setupPostloader(v11, (__int16 *)&v122, v8, v119, v115, v98, 0, theDicta, (uint64_t)v128, v113);
                  if (v95 == 28)
                    v96 = 0;
                  else
                    v96 = v95;
                  UUID = v96;
                }
              }
              UUID = GPTUpdatePartitionDictionary(v63, *v11 + 152 * (__int16)v122 + 96, *(unsigned __int16 *)(*v11 + 32));
              if (UUID)
                break;
              goto LABEL_137;
            }
            if ((theDicta & 0x20000000) == 0)
            {
              UUID = purgeLoader(v119, v117, (const void **)v11, (__int16)v122, (int *)&v121 + 1, theArray, v61, &v121);
              if (UUID)
                break;
              LODWORD(v61) = v61 + ((int)v121 >> 31);
              if (v121 < 0)
              {
                UUID = gpmrsearch(v11, uu1, &v122);
                if (UUID)
                  break;
              }
            }
            UUID = delentry((const void **)v11, 96, 0x5Eu, v122, 152);
            if (UUID)
              break;
            if ((theDicta & 0x2000) == 0)
            {
              v80 = (__CFDictionary *)cStr;
              if (!cStr)
              {
                Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                CFDictionaryAddValue(v63, CFSTR("Options"), Mutable);
                CFRelease(Mutable);
                v80 = Mutable;
              }
              CFDictionarySetValue(v80, CFSTR("Retain existing content"), cfa);
            }
          }
          UUID = GPTCFCreatePartition(a1, v63, v8, v74, v119, v115, v116, v113);
          if (UUID)
            break;
          v60 = CFArrayGetCount(theArray);
          if (UUID)
            break;
LABEL_137:
          LODWORD(v61) = v61 + 1;
LABEL_138:
          if ((int)v61 < v60)
            continue;
          break;
        }
      }
LABEL_166:
      if (v117)
        CFRelease(v117);
      if (v119)
        CFRelease(v119);
      return UUID;
    }
  }
  return result;
}

uint64_t svalidate(uint64_t *a1, unint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v8;

  if (!a1)
    return 22;
  v5 = *a1;
  v6 = *(_QWORD *)(*a1 + 152 * a5 + 208);
  if (a5 >= 1
    && ((a2 - v6) & 0x8000000000000000) != 0
    && *(_QWORD *)(v5 + 152 * (a5 - 1) + 216) + *(_QWORD *)(v5 + 152 * (a5 - 1) + 208) > a2)
  {
    return 4294961955;
  }
  if ((uint64_t)(a3 + a2 - (v6 + *(_QWORD *)(v5 + 152 * a5 + 216))) < 1)
    return 0;
  if (a5 + 1 >= *(unsigned __int16 *)(v5 + 94))
    v8 = *(_QWORD *)(v5 + 40) + *(_QWORD *)(v5 + 56);
  else
    v8 = *(_QWORD *)(v5 + 152 * (a5 + 1) + 208);
  if (a3 + a2 <= v8)
    return 0;
  else
    return 4294961955;
}

uint64_t GPTWriteMedia(uint64_t *a1, const __CFDictionary *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unsigned int v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char *v26;
  int v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  int v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  unsigned __int16 *v40;
  unsigned int v41;
  BOOL v42;
  uint64_t v43;
  void *v44;
  unsigned int v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  BOOL v52;
  uint64_t v53;
  unsigned __int16 *v54;
  int v55;
  BOOL v56;
  int v57;
  int v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  unsigned __int8 v65;
  unsigned __int8 v66;
  uint64_t *v67;
  uint64_t v68;
  char *v69;
  void *v70;
  unint64_t v71;
  unint64_t v72;
  Handle h[3];

  h[2] = *(Handle *)MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v66 = MKCFOptionBit(a2, CFSTR("Legacy Mode"), 1);
  v65 = MKCFOptionBit(a2, CFSTR("UEFI Mode"), 2);
  v67 = a1;
  v6 = *a1;
  v7 = *(uint64_t **)(*a1 + 8);
  v71 = 0;
  v8 = *(_DWORD *)(v6 + 32);
  v64 = v7;
  v9 = *v7;
  v10 = (*(_DWORD *)(*v7 + 84) * *(_DWORD *)(*v7 + 80));
  v11 = v10 / v8;
  if (v10 % v8)
    v12 = v11 + 1;
  else
    v12 = v11;
  v13 = *(_QWORD *)(v6 + 64) - 1;
  v14 = v13 - v12;
  v72 = 0;
  v15 = (char *)malloc_type_calloc(1uLL, v12 * v8, 0x626992CFuLL);
  if (!v15)
  {
    v27 = 0;
LABEL_32:
    v30 = *__error();
LABEL_33:
    if ((_DWORD)v30)
      return v30;
    *(_QWORD *)(v9 + 24) = 1;
    *(_QWORD *)(v9 + 32) = v13;
    *(_QWORD *)(v9 + 72) = 2;
    *(_DWORD *)(v9 + 88) = v27;
    *(_DWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 16) = mk_crc32((char *)v9, *(unsigned int *)(v9 + 12));
    v30 = MKMediaWriteBlocks(a3, 1, 1, v8, (char *)v9, &v71);
    if ((_DWORD)v30)
      return v30;
    *(_QWORD *)(v9 + 24) = v13;
    *(_QWORD *)(v9 + 32) = 1;
    *(_QWORD *)(v9 + 72) = v14;
    *(_DWORD *)(v9 + 16) = 0;
    *(_DWORD *)(v9 + 16) = mk_crc32((char *)v9, *(unsigned int *)(v9 + 12));
    v30 = MKMediaWriteBlocks(a3, v13, 1, v8, (char *)v9, &v71);
    if ((_DWORD)v30)
      return v30;
    v70 = (void *)a3;
    h[0] = 0;
    LOWORD(v72) = 0;
    v31 = *v67;
    v32 = *(_QWORD *)(*v67 + 64);
    if (v32 >= 0xFFFFFFFF)
      LODWORD(v33) = -1;
    else
      v33 = *(_QWORD *)(*v67 + 64);
    v30 = PMNewPartitionListInternal((const void ***)h, 0, v33, *(_DWORD *)(v31 + 32), 0, 8, 0);
    if ((_DWORD)v30)
      goto LABEL_102;
    v34 = v65 | v66;
    if (*(_WORD *)(v31 + 94))
    {
      v35 = 0;
      v36 = 0;
      v37 = 0;
      v38 = v31 + 144;
      do
      {
        v39 = *(_QWORD *)(v38 + 64);
        if (!HIDWORD(v39) && !((*(_QWORD *)(v38 + 72) + v39) >> 32))
        {
          v40 = MBRInfoSearch((char *)v38);
          if (v40)
          {
            v41 = *v40;
            v42 = v41 > 0xC || ((1 << v41) & 0x1880) == 0;
            if (!v42 || v41 == 131)
            {
              ++v36;
            }
            else if (v41 == 239)
            {
              ++v35;
            }
          }
        }
        if (v37 > 2)
          break;
        ++v37;
        v38 += 152;
      }
      while (v37 < *(unsigned __int16 *)(v31 + 94));
    }
    else
    {
      v36 = 0;
      v35 = 0;
    }
    v43 = (uint64_t)*h[0];
    *(_DWORD *)(v43 + 616) = *((_DWORD *)*h[0] + 154) & 0xFFEFFFFF;
    if (!*(_QWORD *)(v43 + 968) && v64[1])
    {
      v44 = malloc_type_calloc(1uLL, 0x200uLL, 0x19F57FABuLL);
      *(_QWORD *)(v43 + 968) = v44;
      memcpy(v44, (const void *)v64[1], 0x1BEuLL);
    }
    if (((v65 | v66) & 2) != 0 || !v36 || !v35)
      goto LABEL_69;
    if (((v65 | v66) & 1) == 0 && (*(_QWORD *)(v31 + 80) & 2) != 0)
      v34 = *(_QWORD *)(v31 + 80);
    if ((v34 & 1) == 0)
    {
LABEL_69:
      if (v32 - 1 >= 0xFFFFFFFF)
        v45 = -1;
      else
        v45 = v32 - 1;
      v30 = PMNewPartitionExtended((const void **)h[0], 238, 0, 1u, v45, 0, 0, (unsigned __int16 *)&v72, 0x100000004);
      if ((_DWORD)v30)
      {
LABEL_102:
        if (h[0])
          PMDisposePartitionRecord(h[0]);
        if ((_DWORD)v30 == -1)
          return *__error();
        return v30;
      }
LABEL_100:
      v60 = MBRWriteMedia(h[0], 0x8000000, (uint64_t)v70, (uint64_t (*)(uint64_t, uint64_t, _QWORD))MKMediaDeviceIO);
LABEL_101:
      v30 = v60;
      goto LABEL_102;
    }
    v46 = *(unsigned __int16 *)(v31 + 94);
    if (!*(_WORD *)(v31 + 94))
      goto LABEL_100;
    v47 = 0;
    v48 = 0;
    v49 = v31 + 144;
    while (1)
    {
      v50 = *(_QWORD *)(v49 + 64);
      v51 = *(_QWORD *)(v49 + 72);
      if (HIDWORD(v50))
        v52 = 0;
      else
        v52 = (v51 + v50) >> 32 == 0;
      if (!v52)
        goto LABEL_80;
      v54 = MBRInfoSearch((char *)v49);
      if (!v54)
      {
        v54 = MBRInfoSearch("UNKNOWN");
        if (!v54)
          break;
      }
      v55 = *v54;
      v56 = v55 == 239;
      if (v55 == 239)
        v57 = 238;
      else
        v57 = *v54;
      if (v55 == 239)
        v58 = v50 - 1;
      else
        v58 = 0;
      if (v56)
        v59 = 1;
      else
        v59 = v50;
      v60 = PMNewPartitionExtended((const void **)h[0], v57, 0, v59, v58 + (int)v51, 0, 0, (unsigned __int16 *)&v72, 0x100000004);
      if ((_DWORD)v60)
        goto LABEL_101;
      if ((*(_BYTE *)(v49 + 88) & 0x80) != 0)
        *(_DWORD *)&(*h[0])[1072 * (__int16)v72 + 616] |= 0x80000000;
      v53 = (v47 + 1);
      v46 = *(unsigned __int16 *)(v31 + 94);
      if ((int)v47 >= 3 && v46 > 4)
        goto LABEL_100;
LABEL_97:
      ++v48;
      v49 += 152;
      v47 = v53;
      if (v48 >= v46)
        goto LABEL_100;
    }
    v46 = *(unsigned __int16 *)(v31 + 94);
LABEL_80:
    v53 = v47;
    goto LABEL_97;
  }
  v62 = v10;
  v63 = v12;
  v68 = v13;
  v69 = v15;
  if (!*(_WORD *)(v6 + 94))
  {
LABEL_21:
    v26 = v69;
    v27 = mk_crc32(v69, v62);
    v28 = MKMediaWriteBlocks(a3, 2, v63, v8, v69, &v72);
    v13 = v68;
    if (v68 != v63 && (_DWORD)v28 == 0)
      v30 = MKMediaWriteBlocks(a3, v14, v63, v8, v69, &v72);
    else
      v30 = v28;
LABEL_31:
    free(v26);
    if ((_DWORD)v30 != -1)
      goto LABEL_33;
    goto LABEL_32;
  }
  v16 = 0;
  v17 = (char *)(v6 + 240);
  v18 = (uint64_t)v15;
  while (1)
  {
    h[0] = 0;
    h[1] = 0;
    *(_OWORD *)(v18 + 32) = 0u;
    *(_OWORD *)(v18 + 48) = 0u;
    *(_OWORD *)(v18 + 64) = 0u;
    *(_OWORD *)(v18 + 80) = 0u;
    *(_OWORD *)(v18 + 96) = 0u;
    *(_OWORD *)(v18 + 112) = 0u;
    *(_OWORD *)v18 = 0u;
    *(_OWORD *)(v18 + 16) = 0u;
    uuid_LtoB(v18 + 16, (uint64_t)(v17 - 48));
    GPTTypestr2Uuid((unsigned __int8 *)h, v17 - 96);
    uuid_LtoB(v18, (uint64_t)h);
    v19 = *((_QWORD *)v17 - 4);
    *(_QWORD *)(v18 + 32) = v19;
    *(_QWORD *)(v18 + 40) = v19 + *((_QWORD *)v17 - 3) - 1;
    *(_QWORD *)(v18 + 48) = *((_QWORD *)v17 - 2);
    v20 = strlen(v17 - 144);
    v21 = uniconvert((void *)(v18 + 56), 72, 0x14000100u, 0, (const UInt8 *)v17 - 144, v20, 0x8000100u, 0);
    if (v20 >= 1 && v21 == -1)
      break;
    if ((*(v17 - 8) & 8) != 0)
    {
      v22 = *((_QWORD *)v17 - 3) >= 0xC8uLL ? 200 : *((_QWORD *)v17 - 3);
      v23 = MKMediaEraseBlocks(a3, *((_QWORD *)v17 - 4), v22, v8, &v72);
      if ((_DWORD)v23
        || (v24 = *((_QWORD *)v17 - 3), v24 >= 0xC9)
        && (v24 - 200 >= 0xC8 ? (v25 = 200) : (v25 = v24 - 200),
            v23 = MKMediaEraseBlocks(a3, v24 - v25 + *((_QWORD *)v17 - 4), v25, v8, &v72),
            (_DWORD)v23))
      {
        v30 = v23;
        v27 = 0;
        v13 = v68;
        v26 = v69;
        goto LABEL_31;
      }
    }
    *((_QWORD *)v17 - 1) &= 0xFFFFFFFFFFFFFFF6;
    *(_WORD *)v17 = v16;
    v17 += 152;
    ++v16;
    v18 += 128;
    if (v16 >= *(unsigned __int16 *)(v6 + 94))
      goto LABEL_21;
  }
  free(v69);
  return 92;
}

void GPTTypestr2Uuid(unsigned __int8 *a1, char *__s)
{
  int v4;
  __int16 *v5;
  const char *v6;
  char v7[80];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = strlen(__s);
  uniconvert(v7, 80, 0x600u, 1u, (const UInt8 *)__s, v4, 0x8000100u, 0);
  v5 = lookupDESC(v7);
  if (v5)
    v6 = (const char *)(v5 + 2);
  else
    v6 = v7;
  if (uuid_parse(v6, a1))
    uuid_copy(a1, NaNuuid);
}

uint64_t uniconvert(void *a1, int a2, CFStringEncoding a3, Boolean a4, const UInt8 *a5, int a6, CFStringEncoding a7, Boolean a8)
{
  CFIndex v15;
  const __CFString *v16;
  const __CFString *v17;
  CFIndex Bytes;
  CFIndex usedBufLen;
  CFRange v21;

  v15 = a2;
  bzero(a1, a2);
  v16 = CFStringCreateWithBytes(0, a5, a6, a7, a8);
  if (!v16)
    return 0xFFFFFFFFLL;
  v17 = v16;
  usedBufLen = 0;
  v21.length = CFStringGetLength(v16);
  v21.location = 0;
  Bytes = CFStringGetBytes(v17, v21, a3, 0x2Du, a4, (UInt8 *)a1, v15, &usedBufLen);
  CFRelease(v17);
  return Bytes;
}

uint64_t MKMediaEraseBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unint64_t *a5)
{
  unint64_t v6;
  uint64_t result;
  unint64_t v8;

  v6 = a4 >> 9;
  v8 = 0;
  result = MKMediaEraseSectors(a1, v6 * a2, v6 * a3, &v8);
  if (a5)
    *a5 = v8 / v6;
  return result;
}

uint64_t MKMediaEraseSectors(uint64_t a1, unint64_t a2, unint64_t a3, _QWORD *a4)
{
  size_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v13 = 0;
  if (*(_QWORD *)(a1 + 112) >= a3)
    v8 = a3;
  else
    v8 = *(_QWORD *)(a1 + 112);
  v9 = (char *)malloc_type_calloc(v8, 0x200uLL, 0xD97BF171uLL);
  if (!v9)
    return 12;
  v10 = v9;
  v11 = MKMediaWriteMultipleSectors(a1, a2, a3, v9, v8, &v13);
  if (a4)
    *a4 = v13;
  free(v10);
  return v11;
}

uint64_t MKMediaWriteMultipleSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, unint64_t a5, _QWORD *a6)
{
  unint64_t v9;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v15;

  if (a3)
  {
    v9 = a3;
    v12 = 0;
    while (1)
    {
      v13 = v9 >= a5 ? a5 : v9;
      v15 = 0;
      result = MKMediaWriteSectors(a1, a2, v13, a4, &v15);
      if ((_DWORD)result)
        break;
      v12 += v15;
      a2 += v13;
      v9 -= v13;
      if (!v9)
        goto LABEL_10;
    }
  }
  else
  {
    v12 = 0;
LABEL_10:
    result = 0;
  }
  if (a6)
    *a6 = v12;
  return result;
}

uint64_t mk_crc32(char *a1, uint64_t a2)
{
  unsigned int v2;
  char v3;

  if (!a2)
    return 0;
  v2 = -1;
  do
  {
    v3 = *a1++;
    v2 = crc32table[(v3 ^ v2)] ^ (v2 >> 8);
    --a2;
  }
  while (a2);
  return ~v2;
}

uint64_t mk_crc32calc(char *a1, uint64_t a2, uint64_t a3)
{
  char v3;

  for (; a2; --a2)
  {
    v3 = *a1++;
    a3 = crc32table[(v3 ^ a3)] ^ (a3 >> 8);
  }
  return a3;
}

uint64_t PMNewPartitionListInternal(const void ***a1, int a2, unsigned int a3, unsigned int a4, int a5, int a6, char a7)
{
  const void ***v7;
  const void **v8;
  _WORD *v15;

  v7 = a1;
  v8 = 0;
  LOWORD(a1) = 22;
  if (!a3)
    goto LABEL_17;
  if (!a4)
    goto LABEL_17;
  v8 = (const void **)NewHandleClear(528);
  LOWORD(a1) = MemError();
  if (!v8)
    goto LABEL_17;
  v15 = *v8;
  v15[256] = 516;
  v15[257] = a6;
  v15[259] = a4;
  if ((a6 - 1) < 3)
  {
    LODWORD(a1) = APMSetupNewPartitionList(v8, a2, a3, a4, a5, a7);
    if ((_DWORD)a1)
      goto LABEL_17;
    goto LABEL_13;
  }
  if (a6 == 8)
  {
    LODWORD(a1) = MBRSetupNewPartitionList(v8, a3, a4);
    if ((a1 & 0xFFFFFFFD) != 0)
      goto LABEL_17;
    *((_DWORD *)*v8 + 154) |= 0x100000u;
    LODWORD(a1) = PMAccountFreespace(v8, 0, 0);
    if ((_DWORD)a1)
      goto LABEL_17;
    goto LABEL_13;
  }
  if (a6 != 32)
  {
    LOWORD(a1) = -50;
    goto LABEL_17;
  }
  LODWORD(a1) = ISOSetupNewPartitionList(v8, a3, a4);
  if (!(_DWORD)a1)
  {
LABEL_13:
    if (*((_WORD *)*v8 + 261))
      MEMORY[0x2199A5D48]((char *)*v8 + 976);
    LOWORD(a1) = 0;
  }
LABEL_17:
  *v7 = v8;
  return (__int16)a1;
}

uint64_t MBRSetupNewPartitionList(const void **a1, unsigned int a2, unsigned __int16 a3)
{
  _OWORD *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  BOOL v10;
  signed int v11;
  int v12;
  _BYTE v14[12];
  int v15;
  _BYTE v16[456];
  int v17;
  __int16 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    goto LABEL_11;
  PMSynthHeader((_OWORD **)a1, a3, a2, 8);
  v6 = *a1;
  *((_WORD *)v6 + 259) = a3;
  *((_WORD *)v6 + 260) = 0x7FFF;
  *((_DWORD *)v6 + 127) = 131135;
  v7 = a2 / 0x7E;
  if (a2 < 0x1F87E)
    goto LABEL_10;
  v8 = 2;
  while (v8 <= 0xFF)
  {
    v8 *= 2;
    *((_WORD *)v6 + 255) = v8;
    v9 = v7 >> 1;
    v10 = v7 > 0x801;
    v7 >>= 1;
    if (!v10)
      goto LABEL_8;
  }
  v9 = v7;
LABEL_8:
  *((_DWORD *)v6 + 126) = v9;
  if (v8 == 256)
  {
    *((_WORD *)v6 + 255) = 255;
    v7 = a2 / 0x3EC1;
LABEL_10:
    *((_DWORD *)v6 + 126) = v7;
  }
LABEL_11:
  bzero(v14, 0x430uLL);
  v15 = 1;
  v17 = -1;
  v18 = 0x8000;
  strncpypad(v16, "MBR", 0x20uLL, 0);
  v11 = addentry(a1, v14, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u) << 16;
  if (v11 == -65536)
    v12 = *__error();
  else
    v12 = v11 >> 16;
  return (__int16)v12;
}

double PMSynthHeader(_OWORD **a1, unsigned int a2, int a3, __int16 a4)
{
  _OWORD *v4;
  double result;
  _OWORD *v6;

  if (a1)
  {
    v4 = *a1;
    result = 0.0;
    v4[30] = 0u;
    v4[31] = 0u;
    v4[28] = 0u;
    v4[29] = 0u;
    v4[26] = 0u;
    v4[27] = 0u;
    v4[24] = 0u;
    v4[25] = 0u;
    v4[22] = 0u;
    v4[23] = 0u;
    v4[20] = 0u;
    v4[21] = 0u;
    v4[18] = 0u;
    v4[19] = 0u;
    v4[16] = 0u;
    v4[17] = 0u;
    v4[14] = 0u;
    v4[15] = 0u;
    v4[12] = 0u;
    v4[13] = 0u;
    v4[10] = 0u;
    v4[11] = 0u;
    v4[8] = 0u;
    v4[9] = 0u;
    v4[6] = 0u;
    v4[7] = 0u;
    v4[4] = 0u;
    v4[5] = 0u;
    v4[2] = 0u;
    v4[3] = 0u;
    *v4 = 0u;
    v4[1] = 0u;
    v6 = *a1;
    *((_WORD *)v6 + 256) = 516;
    *((_WORD *)v6 + 257) = a4;
    *((_WORD *)v6 + 1) = a2;
    *((_DWORD *)v6 + 1) = a3;
    *((_WORD *)v6 + 250) = a2 >> 9;
  }
  return result;
}

_BYTE *strncpypad(_BYTE *a1, _BYTE *a2, unint64_t a3, int __c)
{
  _BYTE *v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  BOOL v8;
  BOOL v9;
  size_t v10;

  v4 = a1;
  if (!a2 || ((LOBYTE(v5) = *a2) != 0 ? (v6 = a3 == 0) : (v6 = 1), v6))
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    do
    {
      a1[v7] = v5;
      v5 = a2[++v7];
      if (v5)
        v8 = v7 >= a3;
      else
        v8 = 1;
    }
    while (!v8);
    a1 += v7;
  }
  v9 = a3 > v7;
  v10 = a3 - v7;
  if (v9)
    memset(a1, __c, v10);
  return v4;
}

uint64_t PMAccountFreespace(const void **a1, int a2, unsigned int a3)
{
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  unsigned __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  unsigned int v32;
  char v33;
  unsigned int v34;
  int v35;
  __int16 v37;
  unsigned int v38;
  int v39;
  __int16 v40;
  int v41;
  unsigned int v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  bzero(&v40, 0x430uLL);
  if (!a1)
    return -50;
  v6 = *a1;
  v7 = *((__int16 *)*a1 + 257);
  v8 = v7 < 4;
  PMInitPartitionRecord(v7, 0, 0, 24320, 0, 0, &v40);
  v43 = (a2 << 24) | 0x200000;
  v9 = *((unsigned __int16 *)v6 + 261);
  if (v9 == 1)
  {
    v10 = v6[134];
    v11 = v6[135] + v10;
    LOWORD(v9) = 1;
  }
  else
  {
    LOWORD(v16) = 0;
    v11 = 0;
    v17 = (unsigned __int16)v7;
    v18 = ((unsigned __int16)v7 == 8) & (a3 >> 15);
    v10 = -1;
LABEL_13:
    v19 = (unsigned __int16)v16;
    if ((unsigned __int16)v16 <= (unsigned __int16)v9)
      v16 = (unsigned __int16)v9;
    else
      v16 = (unsigned __int16)v16;
    v20 = (uint64_t)&v6[268 * v19 - 134];
    v21 = v19 - 1;
    v22 = -v16;
    while (v22 + v21 != -1)
    {
      v23 = *(_DWORD *)(v20 + 1076);
      v20 += 1072;
      ++v21;
      if (v23)
      {
        LOWORD(v16) = v21 + 1;
        v24 = *(_DWORD *)v20;
        if (v17 <= 7 && !v24)
          goto LABEL_13;
        if (v24 < v10)
          v10 = *(_DWORD *)v20;
        if ((*(_BYTE *)(v20 + 460) & 3) != 0)
          goto LABEL_13;
        v25 = v23 + v24;
        v26 = v21 + 1;
LABEL_25:
        v27 = v26;
        if (v26 <= (unsigned __int16)v9)
          v28 = (unsigned __int16)v9;
        else
          v28 = v26;
        v29 = (uint64_t)&v6[268 * v26 - 134];
        while (v28 != v27)
        {
          ++v27;
          v30 = *(_DWORD *)(v29 + 1076);
          v29 += 1072;
          if (v30)
          {
            v31 = *(_DWORD *)v29;
            v32 = v30 + *(_DWORD *)v29;
            if (v32 > v11)
              v11 = v30 + *(_DWORD *)v29;
            v33 = *(_BYTE *)(v29 + 460);
            v26 = v27;
            if ((v33 & 3) != 0)
              goto LABEL_25;
            v34 = v31 - v25;
            if (v31 == v25)
              goto LABEL_13;
            if ((v34 & 0x80000000) != 0)
            {
              if (v17 != 8 || (v35 = *(unsigned __int16 *)(v20 + 546), v35 != 5) && v35 != 15 && v35 != 133)
              {
                if (v23 >= v25 - v31)
                {
                  if (v25 == v11)
                    v11 = v32;
                  *(_DWORD *)(v20 + 4) = v34 + v23;
                  *(_DWORD *)(v20 + 76) += v34;
                }
              }
            }
            else if (!v18 || v34 >= *((unsigned __int16 *)v6 + 254))
            {
              if ((a3 & 0x80000) != 0 && v34 <= 0x7F && *(_WORD *)(v20 + 546) != 4097)
              {
                *(_DWORD *)(v20 + 4) = v34 + v23;
                goto LABEL_13;
              }
              if ((a3 & 0x8000) == 0 || v34 >= 0x20)
              {
                v37 = v21;
                v38 = v17;
                v39 = v18;
                v41 = v25;
                v42 = v31 - v25;
                v12 = addentry(a1, &v40, 0x210uLL, 0x20Au, (unsigned __int16)(v21 + 1), 0x430u);
                if (v12)
                  return v12;
                v6 = *a1;
                LOWORD(v16) = v37 + 2;
                LOWORD(v9) = *((_WORD *)*a1 + 261);
                v17 = v38;
                v18 = v39;
              }
            }
            goto LABEL_13;
          }
        }
        break;
      }
    }
  }
  if ((_WORD)v9 && v10 > v8)
  {
    v41 = 1;
    v42 = v10 - 1;
    v12 = addentry(a1, &v40, 0x210uLL, 0x20Au, 0, 0x430u);
    if (v12)
      return v12;
    v6 = *a1;
  }
  v13 = v6[1];
  v14 = v13 >= v11;
  v15 = v13 - v11;
  if (v15 != 0 && v14)
  {
    v41 = v11;
    v42 = v15;
    return (__int16)addentry(a1, &v40, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
  }
  else
  {
    return 0;
  }
}

void PMInitPartitionRecord(int a1, int a2, int a3, int a4, char *a5, _BYTE *a6, _WORD *a7)
{
  bzero(a7, 0x430uLL);
  *a7 = 20557;
  *((_DWORD *)a7 + 126) = -1;
  *((_DWORD *)a7 + 2) = a2;
  *((_DWORD *)a7 + 3) = a3;
  *((_DWORD *)a7 + 21) = a3;
  if (a4)
  {
    a5 = (char *)PMCodeSearch(a4, a1);
    a7[277] = a4;
    if (!a5)
    {
LABEL_7:
      if (!a6)
        return;
      goto LABEL_8;
    }
LABEL_6:
    strncpypad((_BYTE *)a7 + 48, a5, 0x20uLL, 0);
    goto LABEL_7;
  }
  if (a5)
  {
    a7[277] = (unsigned __int16)PMDescriptorSearch(a5, a1);
    goto LABEL_6;
  }
  a7[277] = 0;
  if (a6)
LABEL_8:
    strncpypad((_BYTE *)a7 + 16, a6, 0x20uLL, 0);
}

uint64_t MBRCodeSearch(int a1)
{
  __int16 *i;
  __int16 *v2;

  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    v2 = i + 8;
    if (!*((_QWORD *)i + 3))
      return *((_QWORD *)v2 + 1);
  }
  v2 = i;
  return *((_QWORD *)v2 + 1);
}

__int16 *MBRInfoSearchByType(int a1)
{
  __int16 *i;
  __int16 *v2;

  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    v2 = i + 8;
    if (!*((_QWORD *)i + 3))
      return v2;
  }
  return i;
}

unsigned __int16 *MBRInfoSearch(char *a1)
{
  return PMLookupDESC(a1, 0, (unsigned __int16 *)&MBRDescriptors);
}

unsigned __int16 *PMLookupDESC(char *a1, int a2, unsigned __int16 *a3)
{
  unsigned __int16 *v3;
  unsigned __int16 *v4;
  const char *v6;
  uint64_t v9;

  v3 = 0;
  if (a1)
  {
    v4 = a3;
    if (a3)
    {
      v6 = (const char *)*((_QWORD *)a3 + 1);
      if (v6)
      {
        v3 = a3;
        while (strcasecmp(a1, v6))
        {
          v6 = (const char *)*((_QWORD *)v3 + 3);
          v3 += 8;
          if (!v6)
            return 0;
        }
        if (a2)
        {
          while (*v4 != *v3)
          {
            v9 = *((_QWORD *)v4 + 3);
            v4 += 8;
            if (!v9)
              return v3;
          }
          return v4;
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return v3;
}

uint64_t PMNewPartitionExtended(const void **a1, int a2, char *a3, unsigned int a4, unsigned int a5, _BYTE *a6, unsigned int a7, unsigned __int16 *a8, uint64_t a9)
{
  _DWORD *v11;
  unsigned int v12;
  unsigned __int16 v13;
  __int16 v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int16 v32;
  _BOOL4 v34;
  unsigned int v35;
  _DWORD *v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v40;
  unsigned int v41;
  int v42;
  unsigned int v43;
  BOOL v44;
  uint64_t v45;
  int v46;
  unsigned int v47;
  int v48;
  char *v49;
  uint64_t v50;
  _BYTE *v51;
  char *v52;
  __int16 v53;
  int v54;
  char *v55;
  _BYTE v57[1072];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v13 = 0x8000;
    v14 = -50;
    goto LABEL_91;
  }
  v11 = *a1;
  v12 = *((unsigned __int16 *)*a1 + 1);
  if (v12 < 0x200)
  {
    v13 = 0x8000;
    v14 = -5323;
    goto LABEL_91;
  }
  v15 = *((unsigned __int16 *)v11 + 261);
  v16 = *((unsigned __int16 *)v11 + 260);
  if (v15 >= v16)
  {
    v13 = 0x8000;
    v14 = -5341;
    goto LABEL_91;
  }
  if (v16 <= a4)
    v20 = a4;
  else
    v20 = 0;
  if (v16 == 0x7FFF)
    v21 = a4;
  else
    v21 = v20;
  v22 = v12 >> 9;
  if (a7)
    v23 = a7;
  else
    v23 = v12 >> 9;
  v24 = *((__int16 *)v11 + 257);
  if (v24 >= 4)
  {
    if (v24 == 8 && (a9 & 0x100000000) == 0 && v22 == *((unsigned __int16 *)v11 + 250))
    {
      v26 = v11[1];
      if ((a9 & 0x2000000) != 0 && v26 <= 0xFC000)
      {
        v25 = 0;
        v23 = *((unsigned __int16 *)v11 + 254);
      }
      else
      {
        v25 = 0;
        if (v26 > 0x200000)
          v23 = 2048;
      }
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 1;
  }
  v27 = 0;
  v28 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v13 = 0;
  v32 = 0;
  v34 = a2 != 24320 && v22 <= v23;
  v35 = v23 / v22;
  v36 = v11;
  while (1)
  {
    if (v15 <= v13)
    {
      v37 = v11[1];
    }
    else
    {
      v37 = v36[134];
      if (*((_WORD *)v36 + 541) == 24320 && (v36[249] & 0x20) == 0)
      {
        if (v21 == v37)
          v32 = v13;
        v28 = 24320;
        goto LABEL_67;
      }
    }
    v38 = v37 / v35 * v35;
    if (v21)
    {
      if (v21 >= v25 || (a9 & 0x10000000) == 0)
        v40 = v21;
      else
        v40 = v25;
      if (v40 < v25 || (v41 = v40, v40 >= v38))
      {
        v41 = v25;
LABEL_64:
        v45 = v31;
        v27 = v30;
        goto LABEL_65;
      }
    }
    else
    {
      v40 = 0;
      v41 = v25;
    }
    if (v34)
    {
      v42 = v41 / v35;
      if (v41 % v35)
        ++v42;
      v43 = v42 * v35 - v41;
      if (((v43 == 0) & BYTE3(a9) & (v28 != 24320)) != 0)
        v43 = v35;
      v41 += v43;
    }
    v44 = v38 >= v41;
    v45 = v38 - v41;
    if ((_DWORD)v45 == 0 || !v44)
      goto LABEL_64;
    if (a5)
      break;
    if (v21)
    {
      LODWORD(v31) = v45;
LABEL_72:
      v29 = v41;
      if ((_DWORD)v45)
        goto LABEL_73;
LABEL_81:
      v14 = -5344;
      goto LABEL_91;
    }
    if (v45 <= v31)
      goto LABEL_64;
    v29 = v41;
LABEL_65:
    if (v15 <= v13)
    {
      v46 = 0;
      LODWORD(v31) = v45;
      LOWORD(v30) = v27;
      goto LABEL_70;
    }
    v25 = v36[135] + v36[134];
    v28 = *((unsigned __int16 *)v36 + 541);
    v21 = v40;
    v31 = v45;
    v30 = v27;
LABEL_67:
    v27 = ++v13;
    v36 += 268;
    if (v13 > v15)
    {
      v46 = 0;
      v40 = v21;
      v41 = v25;
      goto LABEL_70;
    }
  }
  if ((double)v45 / (double)a5 < 0.99)
    goto LABEL_64;
  if (v45 < a5)
    a5 = v45;
  v46 = v45;
LABEL_70:
  if (v40 | a5)
  {
    LODWORD(v31) = a5;
    LODWORD(v45) = v46;
    goto LABEL_72;
  }
  v13 = v30;
  if (!(_DWORD)v31)
    goto LABEL_81;
LABEL_73:
  if (v32)
    v13 = v32 + 1;
  if (v13)
  {
    v47 = v13 - 1;
    if (HIWORD(v11[268 * v47 + 270]) != 24320)
      goto LABEL_83;
    if ((v11[268 * v47 + 249] & 0x20) != 0)
      goto LABEL_83;
    v14 = delentry(a1, 528, 0x20Au, --v13, 1072);
    if (!v14)
      goto LABEL_83;
  }
  else
  {
    v13 = 0;
LABEL_83:
    bzero(v57, 0x430uLL);
    v14 = addentry(a1, v57, 0x210uLL, 0x20Au, v13, 0x430u);
    if (!v14)
    {
      v48 = v29;
      v49 = (char *)*a1;
      v50 = (uint64_t)*a1 + 1072 * v13 + 528;
      v51 = a6;
      v52 = &v49[1072 * v13];
      PMInitPartitionRecord(*((__int16 *)v49 + 257), v48, v31, a2, a3, v51, (_WORD *)v50);
      v53 = PMDefaultPartitionStatus(*((__int16 *)v49 + 257), v50);
      v54 = *((_DWORD *)v52 + 249);
      *((_DWORD *)v52 + 249) = v54 | 0x10;
      if ((a9 & 4) == 0)
        *(_DWORD *)(v50 + 88) |= 0x100000u;
      v14 = v53;
      if (a2 == 24320)
        *((_DWORD *)v52 + 249) = v54 | 0x30;
      v55 = &v49[1072 * v13];
      if (PMCategorize(*((__int16 *)v49 + 257), *((unsigned __int16 *)v55 + 541)) == 2
        || *((_WORD *)v55 + 541) == 4097)
      {
        MEMORY[0x2199A5D48](v52 + 976);
      }
    }
  }
LABEL_91:
  if (a8)
    *a8 = v13;
  return v14;
}

uint64_t delentry(const void **a1, int a2, unsigned int a3, unsigned int a4, __int16 a5)
{
  unsigned int v7;
  __int16 v8;

  if (a1)
  {
    v7 = *(unsigned __int16 *)((char *)*a1 + a3);
    if (v7 <= a4)
    {
      return -110;
    }
    else
    {
      v8 = moveblockextended(a1, a2 + (a5 & 0xFFFE) * a4, -(a5 & 0xFFFE), 0, a2 + v7 * (a5 & 0xFFFE));
      if (!v8)
      {
        v8 = 0;
        *(_WORD *)((char *)*a1 + a3) = v7 - 1;
      }
    }
  }
  else
  {
    return 22;
  }
  return v8;
}

uint64_t PMDefaultPartitionStatus(unsigned int a1, uint64_t a2)
{
  if (a1 > 0x20)
    goto LABEL_6;
  if (((1 << a1) & 0xF) != 0)
    return APMSetDefaultStatus(a2);
  if (((1 << a1) & 0x100010100) != 0)
    return 0;
LABEL_6:
  if (a1 == 128)
    return APMSetDefaultStatus(a2);
  return 4294967292;
}

uint64_t PMCategorize(int a1, int a2)
{
  if (a1 <= 7)
  {
    if (a1 < 4)
      return APMCategorize(a2);
    return 0;
  }
  if (a1 == 8)
    return MBRCategorize(a2);
  if (a1 != 16)
  {
    if (a1 == 32)
      return ISOCategorize(a2);
    return 0;
  }
  return GPTCategorize(a2);
}

uint64_t MBRCategorize(int a1)
{
  __int16 *i;
  __int16 *v2;

  for (i = &MBRDescriptors; (unsigned __int16)*i != a1; i += 8)
  {
    v2 = i + 8;
    if (!*((_QWORD *)i + 3))
      return (unsigned __int16)v2[1];
  }
  v2 = i;
  return (unsigned __int16)v2[1];
}

uint64_t MBRWriteMedia(Handle h, int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD))
{
  SInt8 v8;
  Ptr v9;
  int v10;
  int v11;
  size_t v13;
  _WORD *v14;
  _WORD *v15;
  Ptr v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int16 v20;
  char *v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  BOOL v25;
  unsigned int v26;
  _DWORD *v27;
  _DWORD *v28;
  unsigned int v29;
  unsigned int v30;
  const void *v31;
  int v32;
  size_t v33;
  int v34;
  _WORD *v35;
  unsigned int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40[2];
  unsigned int v41;
  unsigned int v42;
  unsigned __int16 v43;
  __int16 v44;

  v39 = 0;
  v40[0] = 0;
  v40[1] = 0;
  if (!h)
  {
    v8 = 0;
    LOWORD(v11) = -109;
    goto LABEL_10;
  }
  v8 = HGetState(h);
  HLock(h);
  v9 = *h;
  if (*((_WORD *)*h + 257) != 8)
    goto LABEL_8;
  if (a2 == 0xFFFF)
    a2 = 0;
  if ((a2 & 0x100) != 0)
  {
LABEL_8:
    LOWORD(v11) = -50;
    goto LABEL_10;
  }
  v10 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))a4)(a3, 15, 0, 0, 0, &v39);
  if (v10)
  {
    LOWORD(v11) = v10;
    goto LABEL_10;
  }
  MKScaleGeometry(v40, (int *)&v39 + 1);
  if (!HIDWORD(v39))
  {
    LOWORD(v11) = 22;
    goto LABEL_10;
  }
  PMSortMapII(h, 0);
  v13 = *((unsigned __int16 *)v9 + 1);
  v14 = malloc_type_calloc(1uLL, v13, 0xA1FF548FuLL);
  if (!v14)
  {
    LOWORD(v11) = 12;
    goto LABEL_10;
  }
  v15 = v14;
  if ((a2 & 0x8000000) == 0)
    ((void (*)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD))a4)(a3, 4, WORD2(v39), (LODWORD(v40[0]) - 1), 1, 0);
  v41 = -1;
  v42 = 0;
  v44 = -1;
  v15[255] = -21931;
  v16 = *h;
  v43 = 0;
  LOWORD(v17) = *((_WORD *)v16 + 261);
  if (!(_WORD)v17)
  {
LABEL_55:
    LOWORD(v32) = ((uint64_t (*)(uint64_t, uint64_t, size_t, _QWORD, uint64_t, _WORD *))a4)(a3, 3, v13, 0, 1, v15);
    goto LABEL_56;
  }
  v33 = v13;
  v18 = 0;
  v36 = 0;
  LODWORD(v19) = 0;
  v34 = 0;
  v11 = 0;
  v20 = 0;
  v37 = 0;
  v38 = (uint64_t)(v15 + 223);
  v35 = v15;
  while (1)
  {
    v21 = &v16[v18];
    v22 = *(unsigned __int16 *)&v16[v18 + 1082];
    if (v22 == 0x8000)
    {
      LODWORD(v37) = *((_DWORD *)v21 + 134);
      v23 = *((_DWORD *)v21 + 154);
      if ((v23 & 0x100000) != 0)
      {
        *((_DWORD *)v21 + 154) = v23 & 0xFFEFFFFF;
        if (v20 + 1 >= (unsigned __int16)v17)
          v24 = *((_DWORD *)v16 + 1);
        else
          v24 = *(_DWORD *)&v16[v18 + 1608] - v37;
        if (v24 >= 0xC8)
          v24 = 200;
      }
      else
      {
        v24 = 1;
      }
      v36 = v24;
      v31 = *(const void **)&v16[v18 + 968];
      if (v31)
        memcpy(v15, v31, 0x1BEuLL);
      goto LABEL_42;
    }
    *((_DWORD *)v21 + 249) &= ~0x10u;
    if (v22 >> 12 <= 4)
      break;
LABEL_42:
    v43 = ++v20;
    v17 = *((unsigned __int16 *)v16 + 261);
    v18 += 1072;
    if (v17 <= v20)
      goto LABEL_52;
  }
  if (HIDWORD(v37) > 3)
  {
    LOWORD(v11) = -5323;
    goto LABEL_57;
  }
  if (v22 == 5 || (v22 != 133 ? (v25 = v22 == 15) : (v25 = 1), v25))
  {
    v26 = v42;
    *(_DWORD *)(v38 + 8) = v42;
    v27 = (_DWORD *)(v38 + 8);
    *(_BYTE *)(v38 + 4) = 5;
    v42 = v26 + 1;
    *(_DWORD *)(v38 + 12) = 1;
    v28 = (_DWORD *)(v38 + 12);
    v29 = *(_DWORD *)&v16[v18 + 536];
  }
  else
  {
    if ((v16[v18 + 619] & 2) == 0)
    {
      v11 = WriteGutz((uint64_t)v16, (__int16 *)&v43, &v44, v38, (int *)&v42, &v41, a3, a4);
      *(_WORD *)&v16[v18 + 1034] = *((_WORD *)v16 + 250) * ++v34 - 1;
LABEL_34:
      Setupdpp((uint64_t)v16, v38);
      ++HIDWORD(v37);
      v38 += 16;
      v20 = v43;
      goto LABEL_42;
    }
    v26 = v42;
    *(_DWORD *)(v38 + 8) = v42;
    v27 = (_DWORD *)(v38 + 8);
    *(_BYTE *)(v38 + 4) = 5;
    v42 = v26 + 1;
    *(_DWORD *)(v38 + 12) = 1;
    v28 = (_DWORD *)(v38 + 12);
    v29 = *(_DWORD *)&v16[v18 + 536];
    if (v26 == v29)
    {
LABEL_47:
      LOWORD(v11) = -5323;
      v15 = v35;
      goto LABEL_57;
    }
  }
  if (v26 > v29)
    goto LABEL_47;
  v19 = (v19 + 4);
  v11 = WriteDOSExtendedChain((unsigned __int16 *)v16, (__int16 *)&v43, v38, v26, v19, a3, a4);
  if (!v11)
  {
    v30 = *v28 + *v27;
    if (v42 > v30)
      v30 = v42;
    v42 = v30;
    v15 = v35;
    goto LABEL_34;
  }
  v15 = v35;
LABEL_52:
  if (!v11)
  {
    v13 = v33;
    if (!v36)
      goto LABEL_55;
    v32 = ((uint64_t (*)(uint64_t, uint64_t, size_t, _QWORD))a4)(a3, 4, v33, v37);
    if (!v32)
      goto LABEL_55;
LABEL_56:
    LOWORD(v11) = v32;
  }
LABEL_57:
  free(v15);
LABEL_10:
  HSetState(h, v8);
  return (__int16)v11;
}

SInt8 HGetState(Handle h)
{
  __int16 v1;
  SInt8 v2;

  if (h)
  {
    v1 = 0;
    v2 = *((_BYTE *)h + 16);
  }
  else
  {
    v2 = 0;
    v1 = -109;
  }
  MemErr = v1;
  return v2;
}

void HLock(Handle h)
{
  __int16 v1;

  if (h)
  {
    v1 = 0;
    *((_BYTE *)h + 16) |= 0x80u;
  }
  else
  {
    v1 = -109;
  }
  MemErr = v1;
}

uint64_t MKMediaDeviceIO(const void *a1, char a2, unsigned int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  CFTypeID v12;
  unsigned int v13;
  __int16 updated;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  char *v22;
  char *v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  const __CFNumber *Value;
  const __CFNumber *v27;
  const __CFNumber *v28;
  unsigned int v29;
  unint64_t v31;
  size_t v32;
  size_t v33;
  __int128 v34;
  size_t count[2];

  if (a1 && (v12 = CFGetTypeID(a1), v12 == MKMediaGetTypeID()))
  {
    if (a3)
      v13 = a3;
    else
      v13 = 512;
    if ((v13 & 0x1FF) != 0)
    {
      return -5308;
    }
    else
    {
      v16 = a5;
      v34 = 0u;
      *(_OWORD *)count = 0u;
      v17 = v13 >> 9;
      v18 = a4 * (unint64_t)v17;
      v19 = v16 * (unint64_t)v17;
      v20 = a2 & 0xF;
      updated = -4;
      if (v20 <= 3)
      {
        if (v20 == 2)
        {
          return (__int16)MKMediaReadSectors((uint64_t)a1, v18, v19, (char *)a6, 0);
        }
        else
        {
          if (v20 != 3)
            return updated;
          return (__int16)MKMediaWriteSectors((uint64_t)a1, v18, v19, (char *)a6, 0);
        }
      }
      if (v20 == 4)
      {
        MKMediaGetGeometry((uint64_t)a1, (uint64_t)&v34);
        v22 = (char *)malloc_type_calloc(count[0], 0x200uLL, 0xA9B7D8C4uLL);
        if (v22)
        {
          v23 = v22;
          updated = MKMediaWriteMultipleSectors((uint64_t)a1, v18, v19, v22, count[0], 0);
          free(v23);
        }
        else
        {
          return 12;
        }
      }
      else
      {
        if (v20 == 14)
        {
          updated = MKMediaUpdateProperties((uint64_t)a1);
          if (updated)
            return updated;
        }
        else if (v20 != 15)
        {
          return updated;
        }
        *(_WORD *)a6 = 2;
        v24 = (const __CFDictionary *)MKMediaCopyProperty((uint64_t)a1, (uint64_t)CFSTR("Geometry"));
        if (v24)
        {
          v25 = v24;
          Value = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("Block Size"));
          CFNumberGetValue(Value, kCFNumberSInt32Type, &v34);
          v27 = (const __CFNumber *)CFDictionaryGetValue(v25, CFSTR("Sector Count"));
          CFNumberGetValue(v27, kCFNumberSInt64Type, (char *)&v34 + 8);
          v28 = (const __CFNumber *)CFDictionaryGetValue(v25, CFSTR("Maximum Transfer Sector Count"));
          CFNumberGetValue(v28, kCFNumberSInt64Type, count);
          v29 = v34;
          if ((_DWORD)v34 != a3 && a3 != 0)
            v29 = a3;
          *(_DWORD *)(a6 + 4) = v29;
          v31 = v29 >> 9;
          v32 = count[0];
          *(_QWORD *)(a6 + 8) = *((_QWORD *)&v34 + 1) / v31;
          v33 = v32 / v31;
          if (v33 >> 16)
            LOWORD(v33) = 0x8000;
          *(_WORD *)(a6 + 16) = v33;
          CFRelease(v25);
          return 0;
        }
        else
        {
          return 22;
        }
      }
    }
  }
  else
  {
    return -50;
  }
  return updated;
}

uint64_t MKMediaGetTypeID()
{
  uint64_t result;

  result = _kMKMediaID;
  if (!_kMKMediaID)
  {
    _kMKMediaClass = 0;
    *(_QWORD *)algn_254B66B48 = "MKMedia";
    qword_254B66B50 = 0;
    unk_254B66B58 = 0;
    qword_254B66B60 = (uint64_t)_MKMediaCFRuntimeFinalize;
    unk_254B66B68 = 0;
    qword_254B66B70 = 0;
    unk_254B66B78 = _MKMediaCFRuntimeCopyFormattingDesc;
    qword_254B66B80 = (uint64_t)_MKMediaCFRuntimeCopyDebugDesc;
    result = _CFRuntimeRegisterClass();
    _kMKMediaID = result;
  }
  return result;
}

unint64_t *MKScaleGeometry(unint64_t *result, int *a2)
{
  unint64_t v2;
  int v3;
  unint64_t v4;

  v2 = *result;
  if (HIDWORD(*result))
  {
    v3 = *a2;
    while ((v3 & 0x80000000) == 0)
    {
      v3 *= 2;
      *a2 = v3;
      v4 = v2 >> 33;
      v2 >>= 1;
      *result = v2;
      if (!v4)
        return result;
    }
    *a2 = 0;
    *result = 0;
  }
  return result;
}

void PMSortMapII(Ptr *a1, int a2)
{
  SInt8 v4;
  int (__cdecl *v5)(const void *, const void *);

  v4 = HGetState(a1);
  HLock(a1);
  if (a2 == 1)
    v5 = (int (__cdecl *)(const void *, const void *))PMIndexCompare;
  else
    v5 = (int (__cdecl *)(const void *, const void *))PMBlockCompare;
  qsort(*a1 + 528, *((unsigned __int16 *)*a1 + 261), 0x430uLL, v5);
  HSetState(a1, v4);
}

uint64_t PMBlockCompare(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  unsigned int v5;

  v2 = *(_DWORD *)(a1 + 8);
  v3 = *(_DWORD *)(a2 + 8);
  v4 = v2 == v3;
  if (v2 > v3)
    v5 = 1;
  else
    v5 = -1;
  if (v4)
    return 0;
  else
    return v5;
}

void HSetState(Handle h, SInt8 flags)
{
  __int16 v2;

  if (h)
  {
    v2 = 0;
    *((_BYTE *)h + 16) = flags;
  }
  else
  {
    v2 = -109;
  }
  MemErr = v2;
}

uint64_t WriteGutz(uint64_t a1, __int16 *a2, __int16 *a3, uint64_t a4, int *a5, unsigned int *a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, _QWORD))
{
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  uint64_t result;
  unsigned int v18;
  int v19;
  unsigned int v23;
  int v24;

  v13 = a1 + 1072 * (unsigned __int16)*a2;
  v14 = v13 + 528;
  *(_BYTE *)(a4 + 4) = *(_BYTE *)(v13 + 1082);
  v15 = *(_DWORD *)(v13 + 536);
  v16 = *(_DWORD *)(v13 + 540);
  *(_DWORD *)(a4 + 8) = v15;
  *(_DWORD *)(a4 + 12) = v16;
  if ((*(_BYTE *)(v13 + 618) & 0x10) != 0)
  {
    result = a8(a7, 4, *(unsigned __int16 *)(a1 + 2));
    if ((_DWORD)result)
      return result;
    v23 = *(_DWORD *)(a4 + 12);
    if (v23 >= 0xC9)
    {
      v24 = v23 - 200 >= 0xC8 ? 200 : v23 - 200;
      result = ((uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))a8)(a7, 4, *(unsigned __int16 *)(a1 + 2), v23 - v24 + *(_DWORD *)(a4 + 8));
      if ((_DWORD)result)
        return result;
    }
    *(_DWORD *)(v14 + 88) &= ~0x100000u;
    v15 = *(_DWORD *)(a4 + 8);
  }
  result = 0;
  v18 = *a6;
  if (*a6 >= v15)
    v18 = v15;
  *a6 = v18;
  v19 = *a5;
  if (*a5 <= (*(_DWORD *)(a4 + 12) + *(_DWORD *)(a4 + 8)))
    v19 = *(_DWORD *)(a4 + 12) + *(_DWORD *)(a4 + 8);
  *a5 = v19;
  *(_BYTE *)a4 = 0;
  if (*a3 < 0)
  {
    result = 0;
    if ((*(_DWORD *)(v14 + 88) & 0x80000000) != 0)
    {
      *a3 = *a2;
      *(_BYTE *)a4 = 0x80;
    }
  }
  return result;
}

uint64_t Setupdpp(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  char v6;
  char v7;
  char v8;
  BOOL v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  char v19;
  BOOL v20;
  int v21;

  v2 = *(_DWORD *)(a2 + 8);
  if (!v2
    || ((v3 = *(unsigned __int16 *)(result + 508),
         v4 = (unsigned __int16)(*(_WORD *)(result + 510) * v3),
         v5 = (unsigned __int16)(v2 / v4),
         v5 >= 0x3FF)
      ? (v6 = -1)
      : (v6 = v2 / v4),
        v5 > 0x3FE))
  {
    v7 = -2;
    v8 = -1;
    goto LABEL_14;
  }
  v7 = -2;
  v8 = -1;
  if ((v2 % v3))
  {
LABEL_14:
    LOBYTE(v10) = -1;
    goto LABEL_15;
  }
  v9 = ((unsigned __int16)(v2 % v4) / v3) == 1 && (unsigned __int16)(v2 / v4) == 0;
  LOBYTE(v10) = -1;
  if (v9)
  {
    v10 = ((v2 / v4) >> 2) & 0x3FFFFFC0 | 1;
    v7 = 1;
    v8 = v6;
  }
LABEL_15:
  *(_BYTE *)(a2 + 3) = v8;
  *(_BYTE *)(a2 + 1) = v7;
  *(_BYTE *)(a2 + 2) = v10;
  v11 = v2 + *(_DWORD *)(a2 + 12);
  v12 = v11 - 1;
  if (v11 == 1
    || ((v13 = *(unsigned __int16 *)(result + 508),
         v14 = (unsigned __int16)(*(_WORD *)(result + 510) * v13),
         v15 = v12 / v14,
         v16 = (unsigned __int16)(v12 / v14),
         v16 >= 0x3FF)
      ? (v17 = -1)
      : (v17 = v12 / v14),
        v16 > 0x3FE))
  {
    v18 = -2;
    v19 = -1;
    goto LABEL_28;
  }
  v18 = -2;
  v19 = -1;
  if ((v12 % v13))
  {
LABEL_28:
    LOBYTE(v21) = -1;
    goto LABEL_29;
  }
  v20 = ((unsigned __int16)(v12 % v14) / v13) == 1 && (unsigned __int16)(v12 / v14) == 0;
  LOBYTE(v21) = -1;
  if (v20)
  {
    v21 = (v15 >> 2) & 0x3FFFFFC0 | 1;
    v18 = 1;
    v19 = v17;
  }
LABEL_29:
  *(_BYTE *)(a2 + 7) = v19;
  *(_BYTE *)(a2 + 5) = v18;
  *(_BYTE *)(a2 + 6) = v21;
  return result;
}

uint64_t PMDisposePartitionRecord(Handle h)
{
  Ptr v2;
  int v3;
  int v4;
  void **v5;
  int v6;

  if (h)
  {
    v2 = *h;
    if (*((_WORD *)*h + 256) == 516)
    {
      v3 = *((unsigned __int16 *)v2 + 261);
      v4 = v3 - 1;
      *((_WORD *)v2 + 261) = v3 - 1;
      if (v3)
      {
        v5 = (void **)(v2 + 968);
        do
        {
          if (*v5)
          {
            free(*v5);
            v4 = *((unsigned __int16 *)v2 + 261);
          }
          v5 += 134;
          v6 = (unsigned __int16)v4--;
          *((_WORD *)v2 + 261) = v4;
        }
        while (v6);
      }
      DisposeHandle(h);
      return 0;
    }
    else
    {
      return -5351;
    }
  }
  else
  {
    return -109;
  }
}

void DisposeHandle(Handle h)
{
  Ptr v2;

  MemErr = -109;
  if (h)
  {
    v2 = *h;
    if (v2)
      free(v2);
    free(h);
    MemErr = 0;
  }
}

uint64_t GPTUpdatePartitionDictionaries(uint64_t *a1, CFArrayRef theArray)
{
  uint64_t v3;
  unsigned int v4;
  CFUUIDBytes *v5;
  const CFDictionaryValueCallBacks *v6;
  const __CFString *v7;
  const __CFDictionary *Mutable;
  __int16 *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  CFRange v14;

  v3 = *a1;
  if (*(_WORD *)(*a1 + 94))
  {
    v4 = 0;
    v5 = (CFUUIDBytes *)(v3 + 192);
    v6 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    do
    {
      v7 = (const __CFString *)uuid2cfstr(v5);
      Mutable = CFArrayDictionarySearchWithIndexOptions(theArray, CFSTR("GUID"), v7, 0, 0);
      CFRelease(v7);
      if (!Mutable)
      {
        v9 = lookupDESC((const char *)&v5[-3]);
        if (v9)
          v10 = v9[1];
        else
          LOBYTE(v10) = 7;
        if (((1 << v10) & 0x96) == 0)
          goto LABEL_10;
        Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], v6);
        CFArrayAppendValue(theArray, Mutable);
        CFRelease(Mutable);
        if (!Mutable)
        {
          v12 = 0xFFFFFFFFLL;
          goto LABEL_14;
        }
      }
      v11 = GPTUpdatePartitionDictionary(Mutable, (uint64_t)&v5[-6], *(unsigned __int16 *)(v3 + 32));
      if ((_DWORD)v11)
      {
        v12 = v11;
        goto LABEL_14;
      }
LABEL_10:
      ++v4;
      v5 = (CFUUIDBytes *)((char *)v5 + 152);
    }
    while (v4 < *(unsigned __int16 *)(v3 + 94));
  }
  v12 = 0;
LABEL_14:
  v14.length = CFArrayGetCount(theArray);
  v14.location = 0;
  CFArraySortValues(theArray, v14, (CFComparatorFunction)CFRankPartition, 0);
  return v12;
}

CFComparisonResult CFRankPartition(const __CFDictionary *a1, const __CFDictionary *a2, void *a3)
{
  const __CFNumber *Value;
  const __CFNumber *v6;
  const __CFNumber *v7;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Offset"));
  if (!Value)
    return 1;
  v6 = Value;
  v7 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Offset"));
  if (v7)
    return CFNumberCompare(v6, v7, a3);
  else
    return -1;
}

uint64_t MKCFDisposeMedia(const __CFDictionary *a1)
{
  const __CFArray *Value;
  const __CFArray *v3;
  uint64_t Count;
  CFIndex v5;
  uint64_t v6;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v8;
  const __CFDictionary *v9;
  unsigned int v10;
  BOOL v11;

  if (!a1)
    return 22;
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Schemes"));
  if (!Value)
    return 22;
  v3 = Value;
  Count = (unsigned __int16)CFArrayGetCount(Value);
  if (Count)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, v5);
      if (ValueAtIndex)
      {
        v8 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Sections"));
        if (v8)
        {
          v9 = CFArrayDictionarySearchWithIndexOptions(v8, CFSTR("ID"), CFSTR("MAP"), 0, 0);
          if (v9)
          {
            v10 = MKCFDisposeMediaMap(v9);
            if ((_DWORD)v6)
              v11 = 1;
            else
              v11 = v10 == 0;
            if (v11)
              v6 = v6;
            else
              v6 = v10;
          }
        }
      }
      ++v5;
    }
    while (Count != v5);
  }
  else
  {
    v6 = 0;
  }
  CFRelease(a1);
  return v6;
}

uint64_t MKCFDisposeMediaMap(const __CFDictionary *a1)
{
  const __CFNumber *Value;
  Ptr *v3;
  int valuePtr;

  valuePtr = 0;
  if (!a1)
    return 22;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Revision"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  v3 = (Ptr *)mkcfrecoverref(a1);
  if (valuePtr == 0x10000)
    return disposegpm(v3);
  else
    return PMDisposePartitionRecord(v3);
}

uint64_t disposegpm(Ptr *a1)
{
  uint64_t v2;

  if (!a1 || !*a1)
    return 0;
  v2 = gptdispose((uint64_t)a1);
  DisposeHandle(a1);
  return v2;
}

uint64_t disposegpmr()
{
  return 0;
}

uint64_t gptdispose(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (a1)
  {
    v1 = *(_QWORD *)(*(_QWORD *)a1 + 8);
    if (v1)
    {
      if (*(_QWORD *)v1)
        free(*(void **)v1);
      v2 = *(void **)(v1 + 8);
      if (v2)
        free(v2);
      free((void *)v1);
    }
  }
  return 0;
}

uint64_t _MKMediaCFRuntimeFinalize(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 88));
  v2 = *(_QWORD *)(a1 + 136);
  if (v2)
  {
    _MKMediaBufferPoolDestroy(v2);
    *(_QWORD *)(a1 + 136) = 0;
  }
  result = pthread_rwlock_destroy((pthread_rwlock_t *)(a1 + 144));
  *(_QWORD *)(a1 + 88) = 0;
  return result;
}

void _MKMediaDeviceDeinitialize(void *a1)
{
  _MKMediaCommonDeinitialize(a1);
}

void _MKMediaCommonDeinitialize(void *a1)
{
  int v2;
  const void *Value;
  void *v4;
  const void *v5;

  if (a1 && *(_DWORD *)a1 == 1296786550)
  {
    v2 = *((_DWORD *)a1 + 1);
    if ((v2 & 0x80000000) == 0)
    {
      Value = CFDictionaryGetValue(*((CFDictionaryRef *)a1 + 2), CFSTR("Writable"));
      if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDBD270]))
        ioctl(v2, 0x20006416uLL);
      close(v2);
    }
    v4 = (void *)*((_QWORD *)a1 + 1);
    if (v4)
    {
      free(v4);
      *((_QWORD *)a1 + 1) = 0;
    }
    v5 = (const void *)*((_QWORD *)a1 + 2);
    if (v5)
      CFRelease(v5);
    free(a1);
  }
}

void _MKMediaBufferPoolDestroy(uint64_t a1)
{
  free(*(void **)(a1 + 128));
  free(*(void **)(a1 + 136));
  pthread_cond_destroy((pthread_cond_t *)a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 48));
  free((void *)a1);
}

uint64_t MKCFCheckBootDevice(char *a1, _OWORD *a2)
{
  __CFBundle *v3;
  __CFBundle *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const void *v9;
  uint64_t result;
  __CFDictionary *Mutable;
  const __CFDictionary *v12;
  __CFDictionary *v13;
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const __CFArray *v19;
  const __CFArray *v20;
  const __CFString *v21;
  const __CFDictionary *v22;
  const __CFNumber *v23;
  uint64_t *v24;
  uint64_t v25;
  unsigned int v26;
  CFTypeRef cf;
  unsigned __int16 v28;
  int v29;
  uint64_t valuePtr;
  unsigned int UUID;
  char bsdName[32];
  char v33[33];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v29 = 0;
  v28 = 0;
  v34[0] = 0;
  v34[1] = 0;
  cf = 0;
  UUID = -43;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  if ((int)MKBSDSlice(a1, (uint64_t)&valuePtr, (uint64_t)&v29, 0) >= 2)
  {
    __sprintf_chk(v33, 0, 0x21uLL, "/dev/rdisk%i", valuePtr);
    __sprintf_chk(bsdName, 0, 0x20uLL, "disk%is%i", valuePtr, v29);
    if (v29)
    {
      UUID = DevEntryCopyRegistryProperties(bsdName, (CFMutableDictionaryRef *)&cf);
      if (!UUID)
      {
        v3 = MKAccessLibrary(0);
        if (v3)
        {
          v4 = v3;
          v5 = MKLoadDB(v3, CFSTR("database"), (int *)&UUID);
          if (!v5)
          {
LABEL_13:
            CFRelease(v4);
            goto LABEL_14;
          }
          v6 = v5;
          v7 = MKLoadDB(v4, CFSTR("inventory"), (int *)&UUID);
          if (!v7)
          {
            v8 = v6;
LABEL_12:
            CFRelease(v8);
            goto LABEL_13;
          }
          v8 = v7;
          v9 = (const void *)MKMediaCreateWithPath(0, v33, 0, &UUID);
          if (UUID
            || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) == 0
            || (v12 = Mutable,
                CFDictionarySetValue(Mutable, CFSTR("Include most"), (const void *)*MEMORY[0x24BDBD270]),
                v13 = MKCFReadMedia(v12, v9, (int *)&UUID),
                CFRelease(v12),
                !v13))
          {
LABEL_8:
            if (v9)
              CFRelease(v9);
            CFRelease(v6);
            goto LABEL_12;
          }
          Value = (const __CFArray *)CFDictionaryGetValue(v13, CFSTR("Schemes"));
          if (Value)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
            if (ValueAtIndex)
            {
              v16 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Sections"));
              if (v16)
              {
                v17 = CFArrayDictionarySearchWithIndexOptions(v16, CFSTR("ID"), CFSTR("MAP"), 0, 0);
                if (v17)
                {
                  v18 = v17;
                  v19 = (const __CFArray *)CFDictionaryGetValue(v17, CFSTR("Partitions"));
                  if (v19)
                  {
                    v20 = v19;
                    v21 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Partition ID"));
                    if (v21)
                    {
                      v22 = CFArrayDictionarySearchWithIndexOptions(v20, CFSTR("Partition ID"), v21, 0, 0);
                      if (v22)
                      {
                        UUID = CFDictionaryGetUUID(v22, CFSTR("GUID"), (unsigned __int8 *)v34);
                        if (!UUID)
                        {
                          v23 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Revision"));
                          if (v23)
                            CFNumberGetValue(v23, kCFNumberSInt32Type, (char *)&valuePtr + 4);
                          v24 = (uint64_t *)mkcfrecoverref(v18);
                          if (HIDWORD(valuePtr) == 0x10000)
                          {
                            v26 = GPTCheckPartBootable(v4, v24, (unsigned __int8 *)v34, (uint64_t)a2, (uint64_t)v9);
                            goto LABEL_36;
                          }
                          if (HIDWORD(valuePtr))
                          {
                            UUID = 22;
                            goto LABEL_38;
                          }
                          v25 = *v24;
                          UUID = PMSlice2Index((_WORD *)*v24, (unsigned __int16)v29, &v28);
                          if (!UUID)
                          {
                            v26 = MKBootDisposition(v6, v8, v25, v28, (uint64_t)a2);
LABEL_36:
                            UUID = v26;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
LABEL_38:
          MKCFDisposeMedia(v13);
          goto LABEL_8;
        }
      }
    }
  }
LABEL_14:
  if (cf)
    CFRelease(cf);
  result = UUID;
  if (UUID == -1)
    return *__error();
  return result;
}

char *MKBSDSlice(char *result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v7;
  char *v8;
  int v9;
  char *v10;
  int v11;
  int v12;

  if (result)
  {
    v7 = (int)result;
    result = strstr(result, "disk");
    if (result)
    {
      v8 = result;
      result = (char *)sscanf(result, "disk%is", a2);
      if ((_DWORD)result)
      {
        v9 = (int)result;
        v10 = strrchr(v8, 115);
        v11 = (int)v10;
        result = (char *)(sscanf(v10, "s%i", a3) + v9);
        if (a4)
        {
          v12 = v11 - v7;
          if ((int)result < 2)
            v12 = 0;
          *a4 = v12;
        }
      }
    }
  }
  return result;
}

uint64_t DevEntryCopyRegistryProperties(char *bsdName, CFMutableDictionaryRef *a2)
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  uint64_t v7;
  CFMutableDictionaryRef properties;

  properties = 0;
  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, bsdName);
  MatchingService = IOServiceGetMatchingService(v3, v4);
  if (MatchingService)
  {
    v6 = MatchingService;
    v7 = IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    IOObjectRelease(v6);
  }
  else
  {
    v7 = 2;
  }
  *a2 = properties;
  return v7;
}

uint64_t DevEntryToIOMediaObject(char *bsdName, io_service_t *a2)
{
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;

  v3 = *MEMORY[0x24BDD8B18];
  v4 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, bsdName);
  MatchingService = IOServiceGetMatchingService(v3, v4);
  *a2 = MatchingService;
  return 2 * (MatchingService == 0);
}

__CFDictionary *MKCFReadMedia(const __CFDictionary *a1, const void *a2, int *a3)
{
  const __CFDictionary *MutableCopy;
  int v6;
  const __CFDictionary *v7;
  __CFDictionary *v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char *v18;
  unsigned int v19;
  unsigned int v20;
  const char *v21;
  int v22;
  __CFDictionary *v23;
  int v24;
  int v25;
  int v27;
  int v28;
  int v29;
  unint64_t v30;
  Handle h;
  __CFArray *v32;
  CFMutableArrayRef theArray;
  const char *v34;
  _OWORD v35[2];
  size_t __nel[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  int v49[3];

  MutableCopy = a1;
  h = 0;
  theArray = 0;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_5;
  }
  v6 = MKCFOptionBit(a1, CFSTR("Diagnostics mode"), 1);
  if (!v6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, MutableCopy);
  CFDictionaryRemoveValue(MutableCopy, CFSTR("Prefer GPT Map Entry"));
  v7 = MutableCopy;
LABEL_6:
  v48 = 0;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  *(_OWORD *)__nel = 0u;
  v37 = 0u;
  memset(v35, 0, sizeof(v35));
  v34 = 0;
  v8 = 0;
  v49[0] = MKMediaSchemesDetect(__nel, (uint64_t)a2, v6, a2);
  if (v49[0])
    goto LABEL_51;
  if (!v6)
    qsort((char *)__nel + 4, LOWORD(__nel[0]), 0x30uLL, (int (__cdecl *)(const void *, const void *))RankScheme);
  MKMediaGetGeometry((uint64_t)a2, (uint64_t)v35);
  v49[0] = 5;
  if ((v35[0] & 0x1FF) != 0)
  {
LABEL_50:
    v8 = 0;
    goto LABEL_51;
  }
  v49[0] = -5324;
  v9 = *((_QWORD *)&v35[0] + 1);
  if (MutableCopy)
  {
    v30 = *((_QWORD *)&v35[0] + 1);
    v29 = MKCFOptionBit(MutableCopy, CFSTR("Raw Read Mode"), 256);
    v28 = MKCFOptionBit(MutableCopy, CFSTR("Extended Mode"), 512);
    v27 = MKCFOptionBit(MutableCopy, CFSTR("Generate Freespace Records"), 16);
    v10 = MKCFOptionBit(MutableCopy, CFSTR("Merge Adjacent Freespace Records"), 128);
    v11 = MKCFOptionBit(MutableCopy, CFSTR("Fit Map to Media"), 8);
    v12 = MKCFOptionBit(MutableCopy, CFSTR("synthesize Volumes"), 64);
    v13 = MKCFOptionBit(MutableCopy, CFSTR("Skip Zero Length Entries"), 32);
    v14 = MKCFOptionBit(MutableCopy, CFSTR("Skip Free & Vold Entries"), 0x40000);
    v15 = MKCFOptionBit(MutableCopy, CFSTR("Merge Trailing Freespace Record"), 0x80000);
    v16 = (v29 | v28 | v27 | v10 | v11 | v12 | v13 | v14 | v15 | MKCFOptionBit(MutableCopy, CFSTR("Ignore Shims"), 0x8000)) & 0xFFFFF1FF | 0xA00;
    v9 = v30;
  }
  else
  {
    v16 = 2560;
  }
  v32 = 0;
  v17 = HIDWORD(v9) == 0;
  v18 = (char *)__nel + 4;
  if (!LOWORD(__nel[0]))
  {
    v23 = 0;
    v8 = 0;
    goto LABEL_42;
  }
  v8 = 0;
  v19 = 0;
  v20 = v16 | (v17 << 10);
  while (1)
  {
    v21 = (const char *)PMSchemeSearch(*((_WORD *)v18 + 2), &v34);
    v22 = *((_DWORD *)v18 + 1);
    if (v22 <= 15)
    {
      if (v22 == 1)
      {
        v49[0] = APMReadMedia((const void ***)&h, v20 | 0x100000, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))MKMediaDeviceIO);
        if (v49[0])
          goto LABEL_27;
        v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
        if (v23)
        {
          v24 = APMCFRecordSections(h, MutableCopy, v32);
LABEL_34:
          v49[0] = v24;
          if (v24)
            goto LABEL_42;
          goto LABEL_35;
        }
      }
      else
      {
        if (v22 != 8)
          goto LABEL_56;
        v49[0] = MBRReadMedia((const void ***)&h, v20, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))MKMediaDeviceIO);
        if (v49[0])
        {
LABEL_27:
          v23 = 0;
          goto LABEL_42;
        }
        v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
        if (v23)
        {
          v24 = MBRCFRecordSections(h, MutableCopy, v32);
          goto LABEL_34;
        }
      }
      goto LABEL_35;
    }
    if (v22 != 16)
    {
      if (v22 != 32)
      {
LABEL_56:
        v23 = 0;
        v49[0] = -5307;
        goto LABEL_42;
      }
      v49[0] = ISOReadMedia((const void ***)&h, v20, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _BYTE *))MKMediaDeviceIO);
      if (v49[0])
        goto LABEL_27;
      v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
      if (v23)
      {
        v24 = ISOCFRecordSections((const UInt8 *)h, v32);
        goto LABEL_34;
      }
      goto LABEL_35;
    }
    v49[0] = GPTReadMedia((uint64_t **)&h, MutableCopy, (uint64_t)a2);
    if (v49[0])
      break;
    v23 = MKCFCreateScheme(v21, v34, (CFTypeRef *)&v32);
    if (v23)
    {
      v24 = GPTCFRecordSections((const UInt8 *)h, MutableCopy, v32);
      goto LABEL_34;
    }
LABEL_35:
    if (!v8)
    {
      v8 = MKCFCreateMedia(&theArray, v49);
      if (v49[0])
        goto LABEL_42;
    }
    CFArrayAppendValue(theArray, v23);
    if (v23)
      CFRelease(v23);
    h = 0;
    ++v19;
    v18 += 48;
    if (v19 >= LOWORD(__nel[0]))
      goto LABEL_51;
  }
  v23 = 0;
LABEL_42:
  if (h)
  {
    if (*((_DWORD *)v18 + 1) == 16)
      disposegpm(h);
    else
      DisposeHandle(h);
  }
  if (v23)
    CFRelease(v23);
  if (v8)
  {
    MKCFDisposeMedia(v8);
    goto LABEL_50;
  }
LABEL_51:
  if (v7)
    CFRelease(v7);
  v25 = v49[0];
  if (v49[0] == -1)
    v25 = *__error();
  *a3 = v25;
  return v8;
}

uint64_t MKMediaSchemesDetect(_WORD *a1, uint64_t a2, int a3, const void *a4)
{
  int v7;
  __int16 v8;
  char *v9;
  char *v10;
  char v11;
  size_t size[3];
  unint64_t v14;
  int v15;

  v14 = 0;
  memset(size, 0, sizeof(size));
  *a1 = 0;
  v7 = MKMediaDeviceIO(a4, 15, 0, 0, 0, (uint64_t)size);
  v8 = v7;
  if (!v7)
  {
    if ((size[0] & 0x1FF00000000) != 0)
      return 5;
    v9 = (char *)malloc_type_malloc(HIDWORD(size[0]), 0x9CF4B269uLL);
    if (!v9)
      return -1;
    v10 = v9;
    v8 = MKMediaReadBlocks((uint64_t)a4, 0, 1, HIDWORD(size[0]), v9, &v14);
    if (v8)
    {
LABEL_22:
      free(v10);
      return v8;
    }
    v15 = 0;
    MKAPMSchemeDetect(v10, (uint64_t)size, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _WORD *))MKMediaDeviceIO, &v15);
    if (v15 < 5000)
    {
      v11 = -1;
    }
    else
    {
      AddDetectedScheme(a1, v15, 1);
      if (a3)
        v11 = -1;
      else
        v11 = -7;
      if ((v11 & 4) == 0)
      {
LABEL_20:
        v15 = 0;
        v8 = MKISOSchemeDetect((uint64_t)a4, &v15);
        if (v15 >= 5000)
          AddDetectedScheme(a1, v15, 32);
        goto LABEL_22;
      }
    }
    v15 = 0;
    GPTSchemeDetect((uint64_t)v10, (uint64_t)size, (uint64_t)a4, (unsigned int *)&v15);
    if (v15 >= 5000)
    {
      AddDetectedScheme(a1, v15, 16);
      if (!a3)
        v11 = 0;
    }
    if ((v11 & 2) != 0)
    {
      v15 = 0;
      MKMBRSchemeDetect((uint64_t)v10, (uint64_t)size, (uint64_t)a4, (uint64_t)MKMediaDeviceIO, &v15);
      if (v15 >= 5000)
        AddDetectedScheme(a1, v15, 8);
    }
    goto LABEL_20;
  }
  return v8;
}

uint64_t MKMediaReadBlocks(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, char *a5, unint64_t *a6)
{
  unint64_t v7;
  uint64_t result;
  unint64_t v9;

  v7 = a4 >> 9;
  v9 = 0;
  result = MKMediaReadSectors(a1, v7 * a2, v7 * a3, a5, &v9);
  if (a6)
    *a6 = v9 / v7;
  return result;
}

uint64_t MKMediaReadSectors(uint64_t a1, unint64_t a2, unint64_t a3, char *a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v10;

  v10 = 0;
  if (!a1)
    return 22;
  if (a5)
    *a5 = 0;
  v6 = 22;
  if (a4)
  {
    v7 = *(_QWORD *)(a1 + 96);
    if (v7 > a2 && a3 + a2 <= v7)
    {
      if (a3)
      {
        v6 = _MKMediaCommonReadWriteSectors(a1, a2, a3, a4, &v10, 0);
        if (a5)
          *a5 = v10;
      }
      else
      {
        return 0;
      }
    }
  }
  return v6;
}

uint64_t _MKMediaDeviceReadSectors(uint64_t a1, uint64_t a2, uint64_t a3, void *__buf, _QWORD *a5)
{
  uint64_t v6;
  uint64_t result;

  v6 = a3;
  if ((pread(*(_DWORD *)(a1 + 4), __buf, a3 << 9, a2 << 9) & 0x80000000) != 0)
  {
    v6 = 0;
    result = *__error();
  }
  else
  {
    result = 0;
  }
  *a5 = v6;
  return result;
}

uint64_t MKAPMSchemeDetect(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _WORD *), int *a5)
{
  uint64_t result;
  __int16 v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned __int16 v17;
  int v18;
  uint64_t v19;
  _WORD v20[256];
  uint64_t v21;

  result = 0;
  v21 = *MEMORY[0x24BDAC8D0];
  *a5 = 0;
  if (*(_QWORD *)(a2 + 8) < 0x40uLL)
    return result;
  if (*a1 != 21061)
  {
    v12 = 8;
LABEL_6:
    v13 = 2;
    v14 = v12;
    do
    {
      result = a4(a3, 2, 512, v14, 1, v20);
      if ((_DWORD)result)
        break;
      if (v20[0] == 19792)
      {
        result = 0;
        v18 = 5250;
        goto LABEL_26;
      }
      v14 = (v14 + v12);
      --v13;
    }
    while (v13);
    if (*a5 > 4999)
      return result;
    goto LABEL_11;
  }
  v11 = a1[1];
  v12 = v11 >> 1;
  if (v11 >> 1)
    goto LABEL_6;
  result = 0;
LABEL_11:
  v15 = *(_DWORD *)(a2 + 4);
  if (v15 < 0x400)
  {
    v17 = 1;
LABEL_18:
    if (v17 <= 7u)
    {
      v19 = v17;
      do
      {
        result = a4(a3, 2, 512, v19, 1, v20);
        if ((_DWORD)result)
          break;
        if (v20[0] == 19792)
        {
          result = 0;
          goto LABEL_25;
        }
        result = 0;
        v19 = (v19 + 1);
      }
      while ((_DWORD)v19 != 8);
    }
  }
  else
  {
    v16 = v15 >> 9;
    v17 = 1;
    while (*a1 != 19792)
    {
      a1 += 256;
      if (v16 <= ++v17)
        goto LABEL_18;
    }
LABEL_25:
    v18 = 5000;
LABEL_26:
    *a5 = v18;
  }
  return result;
}

uint64_t GPTSchemeDetect(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4)
{
  size_t v5;
  uint64_t v7;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;

  v5 = *(unsigned int *)(a2 + 4);
  if (v5 > 0x20000 || (v5 & 0x1FF) != 0)
    return 22;
  v10 = malloc_type_calloc(1uLL, v5, 0x6D19D5A3uLL);
  if (!v10)
    return 12;
  v11 = v10;
  v14 = 0u;
  v15 = 0u;
  LODWORD(v14) = *(_DWORD *)(a2 + 4);
  v12 = *(unsigned __int16 *)(a2 + 16);
  *((_QWORD *)&v14 + 1) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)&v15 = v12;
  DWORD2(v15) = 0;
  v7 = GPTReadHeader((uint64_t)&v14, a3, a4, (uint64_t)v10);
  free(v11);
  return v7;
}

uint64_t GPTReadHeader(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4)
{
  unsigned int v8;
  unsigned int v9;
  uint64_t result;
  unsigned int v11;

  v8 = *(_DWORD *)a1;
  v11 = 0;
  GPTReadHeaderBlock(1, v8, a2, &v11, a4);
  v9 = v11;
  if (v11)
  {
    if (v11 < 0x9C5)
    {
      v11 = 0;
      result = GPTReadHeaderBlock(*(_QWORD *)(a1 + 8) - 1, v8, a2, &v11, a4);
      v9 = v11;
    }
    else
    {
      result = 0;
      v9 = v11 + 1000;
    }
  }
  else
  {
    result = 0;
  }
  *a3 = v9;
  return result;
}

uint64_t GPTReadHeaderBlock(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v9;
  int v10;
  int v11;
  unint64_t v12;

  if (!a4)
    return 22;
  v12 = 0;
  result = MKMediaReadBlocks(a3, a1, 1, a2, (char *)a5, &v12);
  if (!(_DWORD)result)
  {
    if (*(_QWORD *)a5 == 0x5452415020494645)
    {
      result = 0;
      v9 = *(unsigned int *)(a5 + 12);
      if (v9 >= 0x5C && v9 <= a2)
      {
        *a4 += 2500;
        v10 = *(_DWORD *)(a5 + 16);
        *(_DWORD *)(a5 + 16) = 0;
        v11 = mk_crc32((char *)a5, v9);
        result = 0;
        if (v10 == v11)
        {
          result = 0;
          *a4 += 2500;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

size_t AddDetectedScheme(_WORD *a1, int a2, int a3)
{
  int v3;
  _WORD *v4;
  char *__source;

  __source = 0;
  v3 = (unsigned __int16)*a1;
  *a1 = v3 + 1;
  v4 = &a1[24 * v3];
  *((_DWORD *)v4 + 1) = a2;
  *((_DWORD *)v4 + 2) = a3;
  PMSchemeSearch(a3, &__source);
  __strlcpy_chk();
  return strlcpy((char *)v4 + 20, __source, 0x20uLL);
}

uint64_t MKISOSchemeDetect(uint64_t a1, _DWORD *a2)
{
  return MKDetectISO(a1, a2, 0, 0);
}

uint64_t MKDetectISO(uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t a4)
{
  char *v8;
  char *v9;
  uint64_t v11;
  int v12;
  const char *v13;

  if (a3)
    *a3 = 0;
  *a2 = 0;
  if (a4)
  {
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
  }
  v8 = (char *)malloc_type_malloc(0x800uLL, 0xB1C1210uLL);
  if (!v8)
    return *(__int16 *)__error();
  v9 = v8;
  if ((unsigned __int16)MKMediaReadBlocks(a1, 16, 1, 0x800u, v8, 0))
    goto LABEL_7;
  LODWORD(v11) = 16;
  while (1)
  {
    if (!strncmp(v9 + 1, "CD001", 5uLL))
    {
      v12 = *v9;
      if (v12 == 255)
        goto LABEL_7;
      if (v12 == 1)
      {
        if (!a4)
          goto LABEL_26;
        *(_DWORD *)(a4 + 44) = bswap32(*((_DWORD *)v9 + 21));
        *(_WORD *)(a4 + 40) = bswap32(*((unsigned __int16 *)v9 + 65)) >> 16;
        *(_DWORD *)(a4 + 36) = 1;
        v13 = v9 + 40;
        goto LABEL_25;
      }
LABEL_18:
      if (v11 > 0x17)
        goto LABEL_7;
      goto LABEL_19;
    }
    if (strncmp(v9 + 5, "CDROM", 5uLL))
      goto LABEL_18;
    if (v9[4] == 1)
      break;
    if (*v9 == 255 || v11 >= 0x18)
      goto LABEL_7;
LABEL_19:
    v11 = (v11 + 1);
    if ((unsigned __int16)MKMediaReadBlocks(a1, v11, 1, 0x800u, v9, 0))
      goto LABEL_7;
  }
  if (!a4)
    goto LABEL_26;
  *(_DWORD *)(a4 + 44) = bswap32(*((unsigned __int16 *)v9 + 43));
  *(_WORD *)(a4 + 40) = 2048;
  *(_DWORD *)(a4 + 36) = 5;
  v13 = v9 + 44;
LABEL_25:
  strncpy((char *)a4, v13, 0x20uLL);
LABEL_26:
  if (a3)
    *a3 = 7;
  *a2 = 5000;
LABEL_7:
  free(v9);
  return 0;
}

uint64_t GPTReadMedia(uint64_t **a1, const __CFDictionary *a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  Handle v7;
  uint64_t *v8;
  Ptr v9;
  uint64_t *v10;
  size_t v11;
  void *v12;
  uint64_t MBR;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  unsigned int v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  const UInt8 *v28;
  unint64_t v29;
  unint64_t v30;
  unsigned __int16 v31;
  uint64_t v32;
  void *v34;
  char *v35;
  int v36;
  size_t size[2];
  __int128 v38;
  int v39;
  unsigned int v40;
  __int128 v41;
  unint64_t v42;
  char out[38];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  unsigned __int8 uu[8];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)size = 0u;
  v38 = 0u;
  v40 = 22;
  v5 = MKCFOptionBit(a2, CFSTR("Prefer GPT Map Entry"), 4);
  MKMediaGetGeometry(a3, (uint64_t)size);
  v6 = LODWORD(size[0]);
  v7 = gptinit((int *)&v40);
  if (!v7)
  {
    MBR = v40;
    goto LABEL_9;
  }
  v8 = (uint64_t *)v7;
  v9 = *v7;
  v10 = (uint64_t *)*((_QWORD *)*v7 + 1);
  v11 = LODWORD(size[0]);
  *((_DWORD *)*v7 + 8) = size[0];
  v12 = malloc_type_calloc(1uLL, v11, 0xF4937A85uLL);
  *v10 = (uint64_t)v12;
  if (!v12)
  {
    MBR = v40;
    if (v40)
      goto LABEL_8;
LABEL_31:
    *a1 = v8;
    return MBR;
  }
  v39 = 0;
  MBR = GPTReadHeader((uint64_t)size, a3, (unsigned int *)&v39, (uint64_t)v12);
  v40 = MBR;
  if (!(_DWORD)MBR)
  {
    if (v39 < 2000)
    {
      MBR = 4294961953;
      goto LABEL_8;
    }
    if (v39 >> 3 < 0x271)
    {
      MBR = 4294961972;
      goto LABEL_8;
    }
    v14 = *v10;
    uuid_LtoB((uint64_t)(v9 + 16), *v10 + 56);
    v15 = *(_QWORD *)(v14 + 40);
    *((_QWORD *)v9 + 5) = v15;
    v16 = *(_QWORD *)(v14 + 48);
    *((_QWORD *)v9 + 6) = *(_QWORD *)(v14 + 32) + v15 - v16;
    *((_QWORD *)v9 + 7) = v16 - v15 + 1;
    *((_DWORD *)v9 + 22) = *(_DWORD *)(v14 + 8);
    *((_QWORD *)v9 + 8) = size[1] / (v6 >> 9);
    v17 = *v10;
    v53 = 0;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
    v18 = *(_DWORD *)(v17 + 80);
    if ((v18 - 1025) < 0xFFFFFC07
      || (v19 = *(_DWORD *)(v17 + 84), (v19 - 4097) < 0xFFFFF07F))
    {
      MBR = 22;
      goto LABEL_8;
    }
    v20 = *(_DWORD *)(*v8 + 32);
    v21 = (v19 * v18);
    v22 = v21 / v20;
    v34 = (void *)v21;
    if (v21 % v20)
      ++v22;
    v23 = v22 * v20;
    v24 = (char *)malloc_type_calloc(1uLL, v22 * v20, 0x83E98CEEuLL);
    if (!v24)
    {
      MBR = 0xFFFFFFFFLL;
      goto LABEL_8;
    }
    v25 = v24;
    v36 = v18;
    v42 = 0;
    v41 = 0uLL;
    MBR = MKMediaReadBlocks(a3, *(_QWORD *)(v17 + 72), v23 / v20, v20, v24, &v42);
    if (!(_DWORD)MBR)
    {
      v26 = *(_DWORD *)(v17 + 88);
      if (mk_crc32(v25, (uint64_t)v34) == v26)
      {
        v27 = 0;
        v35 = v25;
        v28 = (const UInt8 *)(v25 + 56);
        do
        {
          if (!uuid_is_null(v28 - 56))
          {
            *(_QWORD *)uu = 0;
            v55 = 0;
            v44 = 0u;
            v45 = 0u;
            v46 = 0u;
            v47 = 0u;
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0;
            uniconvert(&v44, 48, 0x8000100u, 0, v28, 72, 0x14000100u, 1u);
            uuid_LtoB((uint64_t)&v50, (uint64_t)(v28 - 40));
            uuid_LtoB((uint64_t)uu, (uint64_t)(v28 - 56));
            GPTUuid2Typestr(&v47, 48, uu);
            v29 = *((_QWORD *)v28 - 3);
            *(_QWORD *)&v51 = v29;
            v30 = *((_QWORD *)v28 - 2);
            if (v29 >= v30)
            {
              syslog(4, "MediaKit detected BAD GPT map entry at index: %d start offset: %llu greater than end offset: %llu\n", v27, v29, v30);
              v29 = v51;
            }
            *((_QWORD *)&v51 + 1) = v30 + 1 - v29;
            *(_QWORD *)&v52 = *((_QWORD *)v28 - 1);
            if (v30 + 1 != v29)
            {
              *(_QWORD *)&v41 = v29;
              *((_QWORD *)&v41 + 1) = v30 + 1 - v29;
              v31 = srequest(v8, (uint64_t *)&v41, 1u, 0, (uint64_t)&v44, 0, 0);
              if ((_QWORD)v51 == -1)
              {
                uuid_unparse_upper((const unsigned __int8 *)&v50, out);
                syslog(4, "Overlapping Partition \"%s\" at %llu:%llu\n", out, (_QWORD)v51, *((_QWORD *)&v51 + 1));
                v51 = v41;
              }
              LOWORD(v53) = v27;
              v32 = addentry((const void **)v8, &v44, 0x60uLL, 0x5Eu, v31, 0x98u);
              if ((_DWORD)v32)
              {
                MBR = v32;
                v25 = v35;
                goto LABEL_35;
              }
            }
          }
          ++v27;
          v28 += 128;
        }
        while (v36 != v27);
        free(v35);
        MBR = GPTSubReadMBR((uint64_t)v8, (uint64_t)v10, v5, a3);
        if ((_DWORD)MBR)
          goto LABEL_8;
        goto LABEL_31;
      }
      MBR = 4294961947;
    }
LABEL_35:
    free(v25);
  }
LABEL_8:
  disposegpm((Ptr *)v8);
LABEL_9:
  *a1 = 0;
  if ((_DWORD)MBR == -1)
    return *__error();
  return MBR;
}

void GPTUuid2Typestr(void *a1, int a2, unsigned __int8 *uu)
{
  char **v6;
  char *v7;
  const char *v8;
  int v9;
  _BYTE v10[37];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, sizeof(v10));
  uuid_unparse_upper(uu, v10);
  v6 = &off_24CEC1B40;
  while (strcasecmp((const char *)v6 - 100, v10))
  {
    v7 = *v6;
    v6 += 7;
    if (!v7)
      goto LABEL_7;
  }
  v8 = *(v6 - 7);
  if (v8)
  {
    v9 = strlen(v8);
    uniconvert(a1, a2, 0x8000100u, 0, (const UInt8 *)v8, v9, 0x600u, 0);
    return;
  }
LABEL_7:
  uuid_unparse_upper(uu, (char *)a1);
}

__CFDictionary *MKCFCreateScheme(const char *a1, const char *a2, CFTypeRef *a3)
{
  __CFDictionary *Mutable;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  CFStringRef v10;
  CFMutableArrayRef v11;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v7 = CFStringCreateWithCString(0, a1, 0);
    if (!v7)
      goto LABEL_6;
    v8 = v7;
    CFDictionarySetValue(Mutable, CFSTR("ID"), v7);
    CFRelease(v8);
    v9 = CFStringCreateWithCString(0, a2, 0);
    if (!v9)
      goto LABEL_6;
    v10 = v9;
    CFDictionarySetValue(Mutable, CFSTR("Name"), v9);
    CFRelease(v10);
    v11 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    *a3 = v11;
    if (v11)
    {
      CFDictionarySetValue(Mutable, CFSTR("Sections"), v11);
      CFRelease(*a3);
    }
    else
    {
LABEL_6:
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

uint64_t GPTCFRecordSections(const UInt8 *a1, const __CFDictionary *a2, __CFArray *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  __CFDictionary *v15;
  uint64_t result;
  unsigned int v17;

  if (!a2)
    goto LABEL_3;
  v6 = MKCFOptionBit(a2, CFSTR("Include most"), 150);
  v7 = MKCFOptionBit(a2, CFSTR("Include all"), 254) | v6;
  v8 = MKCFOptionBit(a2, CFSTR("Include drivers"), 2);
  v9 = v7 | v8 | MKCFOptionBit(a2, CFSTR("Include data"), 4);
  v10 = MKCFOptionBit(a2, CFSTR("Include free space"), 8);
  v11 = v10 | MKCFOptionBit(a2, CFSTR("Include loaders"), 16);
  v12 = v9 | v11 | MKCFOptionBit(a2, CFSTR("Include patch"), 32);
  v13 = MKCFOptionBit(a2, CFSTR("Include aux"), 64);
  v14 = v12 | v13 | MKCFOptionBit(a2, CFSTR("Include unknowns"), 128);
  if (!v14)
LABEL_3:
    v14 = 20;
  v17 = 0;
  v15 = GPTRecordMapSection(a1, v14, (int *)&v17);
  result = v17;
  if (!v17)
  {
    if (v15)
    {
      CFArrayAppendValue(a3, v15);
      CFRelease(v15);
      return v17;
    }
  }
  return result;
}

uint64_t GPTCheckPartBootable(__CFBundle *a1, uint64_t *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  __CFBundle *v10;
  const __CFURL *v11;
  const __CFDictionary *v12;
  const __CFURL *v13;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v24;
  const char *v25;
  const __CFString *v26;
  const __CFString *v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  uint64_t v33;
  const __CFURL *cf;
  _OWORD v35[10];
  __int16 v36;
  int v37[3];

  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_WORD *)a4 = 259;
  v37[0] = 22;
  if (a2)
  {
    v10 = a1;
    if (a1 || (v10 = MKAccessLibrary(0)) != 0)
    {
      v36 = 0;
      memset(v35, 0, 154);
      v11 = MKLoadDB(v10, CFSTR("database"), v37);
      if (v11)
      {
        v12 = v11;
        v13 = MKLoadDB(v10, CFSTR("inventory"), v37);
        if (v13)
        {
          v33 = a5;
          cf = v13;
          v37[0] = gpmrsearch(a2, a3, &v36);
          if (!v37[0])
          {
            v15 = *(_DWORD *)(*a2 + 32);
            v16 = v15 >= 0x400;
            v17 = 8 / (v15 >> 9);
            if (!v16)
              v17 = 8;
            v32 = v17;
            v18 = CFStringCreateWithCString(0, (const char *)(*a2 + 152 * v36 + 144), 0);
            if (v18)
            {
              v19 = v18;
              v37[0] = MKLookupSchemeFormat(v12, CFSTR("GPT"), v18, 1, v35);
              CFRelease(v19);
              *(_DWORD *)(a4 + 4) = 4;
              if (!v37[0])
              {
                if (LOWORD(v35[0]))
                {
                  v20 = 0;
                  v21 = 38 * LOWORD(v35[0]);
                  do
                  {
                    v22 = *(unsigned __int16 *)((char *)&v35[2] + v20 + 4);
                    if (v22 == 6 || v22 == 1)
                      *(_DWORD *)(a4 + 4) = 0;
                    v20 += 38;
                  }
                  while (v21 != (_DWORD)v20);
                  v24 = 0;
                  v25 = (char *)&v35[2] + 6;
                  while (1)
                  {
                    v26 = CFStringCreateWithCString(0, v25 - 36, 0);
                    if (!v26)
                      goto LABEL_7;
                    v27 = v26;
                    v28 = *((unsigned __int16 *)v25 - 1);
                    if (v28 == 6)
                      break;
                    if (v28 != 5)
                    {
                      if (v28 == 1)
                        break;
                      v37[0] = -4;
                    }
LABEL_38:
                    CFRelease(v27);
                    if (!v37[0])
                    {
                      ++v24;
                      v25 += 38;
                      if (v24 < LOWORD(v35[0]))
                        continue;
                    }
                    goto LABEL_7;
                  }
                  v29 = mediaLoaderSupport(v10, v26, a2, a3, v33, v28, v32, 0, 0, 0, a4, 0);
                  if (v29 == 28)
                    v30 = 0;
                  else
                    v30 = v29;
                  v37[0] = v30;
                  v31 = *(_DWORD *)(a4 + 4);
                  if (v31 != 4 && (*(_WORD *)v25 & 1) != 0)
                    *(_DWORD *)(a4 + 4) = v31 | 4;
                  goto LABEL_38;
                }
              }
            }
          }
LABEL_7:
          CFRelease(cf);
        }
        CFRelease(v12);
      }
      if (!a1 && v10)
        CFRelease(v10);
    }
  }
  return v37[0];
}

CFComparisonResult utf8strcompare(CFStringCompareFlags a1, char *__s, const char *a3)
{
  size_t v6;
  CFStringRef v7;
  const __CFString *v8;
  size_t v9;
  const __CFString *v10;
  const __CFString *v11;
  CFComparisonResult v12;

  v6 = strlen(__s);
  v7 = CFStringCreateWithBytes(0, (const UInt8 *)__s, v6, 0x8000100u, 0);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = strlen(a3);
  v10 = CFStringCreateWithBytes(0, (const UInt8 *)a3, v9, 0x8000100u, 0);
  if (v10)
  {
    v11 = v10;
    v12 = CFStringCompare(v8, v10, a1);
    CFRelease(v8);
    v8 = v11;
  }
  else
  {
    v12 = kCFCompareEqualTo;
  }
  CFRelease(v8);
  return v12;
}

CFStringRef MKHumanToType(int a1, CFStringRef theString)
{
  char buffer[256];
  char cStr[256];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (theString)
  {
    if (a1 != 16)
      return (CFStringRef)CFRetain(theString);
    CFStringGetCString(theString, buffer, 256, 0x8000100u);
    GPTuuidHuman2Type(cStr, buffer, 256);
    if (cStr[0])
      return CFStringCreateWithCString(0, cStr, 0x8000100u);
  }
  return 0;
}

size_t GPTuuidHuman2Type(char *a1, const char *a2, int a3)
{
  __int16 *v6;
  const char *v7;

  v6 = lookupDESC(a2);
  if (v6)
    v7 = (const char *)(v6 + 2);
  else
    v7 = a2;
  return strlcpy(a1, v7, a3);
}

uint64_t PMTypeToHumanExtended(char *a1, char *a2, int a3, int a4, int a5, uint64_t *a6)
{
  const char *v8;
  __int16 *v10;
  unsigned __int16 *v11;
  uint64_t result;
  uint64_t v13;

  v8 = a2;
  v10 = &APMDescriptors;
  if (a4 == 8)
    v10 = &MBRDescriptors;
  if (a4 == 32)
    v11 = (unsigned __int16 *)&ISODescriptors;
  else
    v11 = (unsigned __int16 *)v10;
  result = (uint64_t)PMLookupDESC(a2, a5, v11);
  v13 = result;
  if (result)
  {
    v8 = *(const char **)(result + 8);
  }
  else if (a1 == v8)
  {
    goto LABEL_10;
  }
  result = strlcpy(a1, v8, a3);
LABEL_10:
  if (a6)
    *a6 = v13;
  return result;
}

uint64_t MKMBRSchemeDetect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  uint64_t v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  *a5 = 0;
  if (*(unsigned __int16 *)(a1 + 510) == 43605)
  {
    v5 = 0;
    while (1)
    {
      v6 = *(_DWORD *)(a1 + v5 + 458);
      if (v6)
      {
        v7 = *(unsigned int *)(a1 + v5 + 454);
        if (!v5 || (_DWORD)v7)
        {
          v8 = *(_QWORD *)(a2 + 8);
          v9 = (v6 + v7);
          if (v8 > v7 && v8 >= v9)
            break;
        }
      }
      v5 += 16;
      if (v5 == 64)
        return 0;
    }
    *a5 = 5000;
  }
  return 0;
}

uint64_t MBRReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))
{
  unsigned int v7;
  uint64_t result;
  const void **v9;
  unsigned __int16 v10;
  _DWORD *v11;
  uint64_t v12;
  unint64_t v13[2];

  v12 = 0;
  v13[0] = 0;
  v13[1] = 0;
  if (a2 == 0xFFFF)
    v7 = 3584;
  else
    v7 = a2;
  result = a4(a3, 15, 0, 0, 0, &v12);
  if ((_DWORD)result)
  {
    v9 = 0;
  }
  else
  {
    v10 = WORD2(v12);
    MKScaleGeometry(v13, (int *)&v12 + 1);
    if ((HIDWORD(v12) - 32769) >= 0xFFFF8000)
    {
      v9 = (const void **)NewHandleClear(528);
      result = MemError();
      if (v9)
      {
        v11 = *v9;
        v11[128] = 33554948;
        *((_WORD *)v11 + 259) = WORD2(v12);
        *((_WORD *)v11 + 250) = v10 >> 9;
        result = VReadDosPartitions(v9, v7, 0, (uint64_t)&v12, a3, (uint64_t)a4);
        if (!(_DWORD)result)
        {
          if ((v7 & 0x800) == 0
            || (PMSortMapII((Ptr *)v9, 0), (v7 & 0x10) == 0)
            || (result = PMAccountFreespace(v9, 0, v7), !(_DWORD)result))
          {
            if ((v7 & 0x80) != 0)
              result = PMRationalise(v9);
            else
              result = 0;
          }
        }
      }
    }
    else
    {
      v9 = 0;
      result = 22;
    }
  }
  *a1 = v9;
  return result;
}

uint64_t VReadDosPartitions(const void **a1, __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  __int16 v9;
  unsigned __int16 v10;
  uint64_t v11;
  int v12;
  const void **v13;
  uint64_t v14;
  uint64_t v15;

  v9 = a2;
  v10 = 1;
  v12 = 0;
  v13 = a1;
  v11 = 0;
  v14 = a5;
  v15 = a6;
  result = MBRSetupNewPartitionList(a1, *(_DWORD *)(a4 + 8), *(_DWORD *)(a4 + 4));
  if (!(_DWORD)result)
  {
    result = ReadDosPBR((uint64_t)&v9, a3);
    *((_DWORD *)*a1 + 133) = v10;
  }
  return result;
}

uint64_t ReadDosPBR(uint64_t a1, uint64_t a2)
{
  int v2;
  size_t v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  int v8;
  unsigned __int16 v9;
  uint64_t v10;
  char *v11;
  int v12;
  int v13;
  uint64_t v14;
  BOOL v15;
  _BOOL4 v16;
  __int16 *v17;
  __int16 *v18;
  uint64_t v19;
  int v20;
  char *v21;
  __int16 v22;
  _WORD *v23;
  __int16 v24;
  int DosPBR;
  unsigned int v26;
  _BYTE v28[8];
  int v29;
  int v30;
  _BYTE v31[36];
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if (*(unsigned __int16 *)(a1 + 4) <= 0x20u)
  {
    v5 = *(unsigned __int16 *)(**(_QWORD **)(a1 + 16) + 2);
    v6 = (unsigned __int16 *)malloc_type_malloc(v5, 0x3A8C2F31uLL);
    if (v6)
    {
      v7 = v6;
      v8 = (*(uint64_t (**)(_QWORD, uint64_t, size_t, uint64_t, uint64_t, unsigned __int16 *))(a1 + 32))(*(_QWORD *)(a1 + 24), 2, v5, a2, 1, v6);
      if (v8)
      {
        v2 = v8;
        free(v7);
        if (v2 == -1)
          v2 = *__error();
      }
      else
      {
        if (v7[255] == 43605)
        {
          v9 = 0;
          v10 = **(_QWORD **)(a1 + 16);
          v11 = (char *)(v7 + 223);
          *(_QWORD *)(v10 + 1072 * *(unsigned __int16 *)(v10 + 522) - 104) = v7;
          do
          {
            v12 = v11[4];
            if (v11[4])
            {
              v13 = *((_DWORD *)v11 + 3);
              if (v13)
              {
                v14 = *((unsigned int *)v11 + 2);
                if ((_DWORD)v14 || !(*(unsigned __int16 *)(a1 + 4) | v9))
                {
                  v15 = v12 == 5 || v12 == 15;
                  v16 = v15 || v12 == 133;
                  v17 = &MBRDescriptors;
                  while ((unsigned __int16)*v17 != v12)
                  {
                    v18 = v17 + 8;
                    v19 = *((_QWORD *)v17 + 3);
                    v17 += 8;
                    if (!v19)
                      goto LABEL_24;
                  }
                  v18 = v17;
LABEL_24:
                  v20 = (unsigned __int16)v18[1];
                  bzero(v28, 0x430uLL);
                  if (v16)
                  {
                    v29 = *(_DWORD *)(a1 + 8) + v14;
                    v35 = 2;
                    v37 = -1;
                    ++*(_WORD *)(a1 + 2);
                  }
                  else
                  {
                    v29 = v14 + a2;
                    if (*(_WORD *)(a1 + 4))
                      v35 = 1;
                    v37 = *(_WORD *)(a1 + 6) + *(_WORD *)(v10 + 500) + *(_WORD *)(v10 + 500) * v9 - 1;
                  }
                  v38 = v12;
                  v32 = v13;
                  v33 = 0;
                  v30 = v13;
                  v36 = -1;
                  v21 = (char *)PMCodeSearch(v12, 8);
                  strncpypad(v31, v21, 0x20uLL, 0);
                  if (*v11 < 0)
                    v33 |= 0x80000000;
                  if (*(_WORD *)(a1 + 4))
                    v33 |= 0x2000000u;
                  if (v20 == 2)
                    MEMORY[0x2199A5D48](&v34);
                  if ((unsigned __int16)addentry(*(const void ***)(a1 + 16), v28, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u))
                    break;
                  v10 = **(_QWORD **)(a1 + 16);
                  if (v16)
                  {
                    v22 = *(_WORD *)(a1 + 4);
                    if (v22)
                    {
                      v14 = (*(_DWORD *)(a1 + 8) + v14);
                      v23 = (_WORD *)(v10 + 500);
                      v24 = *(_WORD *)(a1 + 6);
                    }
                    else
                    {
                      *(_DWORD *)(a1 + 8) = v14;
                      v24 = 4 * *(_WORD *)(v10 + 500);
                      v23 = (_WORD *)(a1 + 6);
                    }
                    *(_WORD *)(a1 + 6) = v24 + *v23;
                    *(_WORD *)(a1 + 4) = v22 + 1;
                    DosPBR = ReadDosPBR(a1, v14);
                    --*(_WORD *)(a1 + 4);
                    if (DosPBR)
                      break;
                  }
                }
              }
            }
            v26 = v9++;
            v11 += 16;
          }
          while (v26 < 3);
        }
        else
        {
          free(v7);
        }
        LOWORD(v2) = 0;
      }
    }
    else
    {
      LOWORD(v2) = 12;
    }
  }
  else
  {
    LOWORD(v2) = 31;
  }
  return (__int16)v2;
}

uint64_t MBRCFRecordSections(Ptr *a1, const __CFDictionary *a2, __CFArray *a3)
{
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  __CFDictionary *v13;
  __int16 v14;
  __CFDictionary *v15;
  int v17;

  v17 = 0;
  if (!a2
    || (v6 = MKCFOptionBit(a2, CFSTR("Include most"), 150),
        v7 = MKCFOptionBit(a2, CFSTR("Include all"), 254) | v6,
        v8 = MKCFOptionBit(a2, CFSTR("Include data"), 4),
        v9 = v7 | v8 | MKCFOptionBit(a2, CFSTR("Include free space"), 8),
        v10 = MKCFOptionBit(a2, CFSTR("Include loaders"), 16),
        v11 = v10 | MKCFOptionBit(a2, CFSTR("Include aux"), 64),
        (v12 = v9 | v11 | MKCFOptionBit(a2, CFSTR("Include unknowns"), 128)) == 0))
  {
    v12 = 20;
  }
  v13 = MBRCFRecordMapSection(a1, v12, &v17);
  v14 = v17;
  if (!v17)
  {
    v15 = v13;
    if (v13)
    {
      CFArrayAppendValue(a3, v13);
      CFRelease(v15);
      return (__int16)v17;
    }
  }
  return v14;
}

__CFDictionary *MBRCFRecordMapSection(Ptr *a1, unsigned int a2, _DWORD *a3)
{
  Ptr v4;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  char *v10;
  char *v11;
  __CFDictionary *v12;
  unsigned int v13;
  int v14;
  int v15;
  signed __int16 v16;
  Ptr v17;
  int v18;
  BOOL v19;
  int v20;
  BOOL v21;
  int v22;
  __CFDictionary *v23;
  __CFDictionary *v24;
  unsigned int v25;
  unsigned int valuePtr;
  __int16 v27;

  v4 = *a1;
  if (*a1)
  {
    v27 = 0;
    LODWORD(Mutable) = PMSpecificIndex(a1, 0x8000, 0, &v27);
    if ((_DWORD)Mutable)
    {
      v8 = 0;
    }
    else
    {
      v10 = &v4[1072 * v27];
      if (uuid_is_null((const unsigned __int8 *)v10 + 976))
        MEMORY[0x2199A5D48](v10 + 976);
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v8 = Mutable;
      if (Mutable)
      {
        v11 = v10 + 528;
        CFDictionarySetValue(Mutable, CFSTR("ID"), CFSTR("MAP"));
        valuePtr = *((_DWORD *)v10 + 134);
        Mutable = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
        if (Mutable)
        {
          v12 = Mutable;
          CFDictionarySetValue(v8, CFSTR("Offset"), Mutable);
          CFRelease(v12);
          v13 = *((_DWORD *)v11 + 3) + valuePtr;
          if (*((_WORD *)v4 + 261))
          {
            v14 = 0;
            v15 = 0;
            v16 = 0;
            v17 = v4 + 616;
            do
            {
              if (v27 != v16)
              {
                v18 = *((unsigned __int16 *)v17 + 233);
                v19 = v18 == 5 || v18 == 15;
                if (!v19 && v18 != 133)
                {
                  if ((v17[3] & 2) != 0)
                    ++v14;
                  else
                    ++v15;
                }
              }
              ++v16;
              v17 += 1072;
            }
            while (*((unsigned __int16 *)v4 + 261) > v16);
            v13 += v14;
            if (v14 > 0)
              v20 = 3;
            else
              v20 = 4;
          }
          else
          {
            v15 = 0;
            v20 = 4;
          }
          v21 = __OFSUB__(v15, v20);
          v22 = v15 - v20;
          if ((v22 < 0) ^ v21 | (v22 == 0))
            v22 = 0;
          v25 = v13 + v22;
          Mutable = CFNumberCreate(0, kCFNumberSInt32Type, &v25);
          if (Mutable)
          {
            v23 = Mutable;
            CFDictionarySetValue(v8, CFSTR("Overhead"), Mutable);
            CFRelease(v23);
            MKCFRecordSectionSize(v8, valuePtr, v25, (*((_DWORD *)v4 + 1) - v25) * *((unsigned __int16 *)v4 + 250), *((_DWORD *)v4 + 1) * *((unsigned __int16 *)v4 + 250), *((unsigned __int16 *)v4 + 259));
            Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
            if (Mutable)
            {
              v24 = Mutable;
              CFDictionarySetValue(v8, CFSTR("Partitions"), Mutable);
              CFRelease(v24);
              LODWORD(Mutable) = MBRCFRecordPartitions((uint64_t *)a1, v24, 1, a2, 0);
              if (!(_DWORD)Mutable)
              {
                mkcfstoreref(v8, (const UInt8 *)a1);
                LODWORD(Mutable) = 0;
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v8 = 0;
    LODWORD(Mutable) = -1;
  }
  if (a3)
    *a3 = (_DWORD)Mutable;
  return v8;
}

uint64_t PMSpecificIndex(Ptr *a1, int a2, int a3, __int16 *a4)
{
  SInt8 v8;
  uint64_t v9;

  v8 = HGetState(a1);
  HLock(a1);
  v9 = PMPSpecificIndex((uint64_t)*a1, a2, a3, a4);
  HSetState(a1, v8);
  return v9;
}

uint64_t PMPSpecificIndex(uint64_t a1, int a2, int a3, __int16 *a4)
{
  const char *v7;
  __int16 v8;
  __int16 v9;
  const char *v10;
  int v11;

  v7 = PMCodeSearch(a2, *(__int16 *)(a1 + 514));
  v8 = -1;
  v9 = -5343;
  if ((a3 & 0x80000000) == 0)
  {
    v10 = v7;
    if (v7)
    {
      v11 = *(unsigned __int16 *)(a1 + 522);
      if (*(_WORD *)(a1 + 522))
      {
        v8 = 0;
        while (1)
        {
          if (!strncasecmp((const char *)(a1 + 1072 * v8 + 576), v10, 0x20uLL))
          {
            if ((__int16)a3 < 1)
            {
              v9 = 0;
              if (a4)
                goto LABEL_13;
              return v9;
            }
            LOWORD(a3) = a3 - 1;
          }
          if (v11 <= ++v8)
          {
            v8 = -1;
            v9 = -5343;
            if (a4)
              goto LABEL_13;
            return v9;
          }
        }
      }
      v8 = -1;
    }
  }
  if (a4)
LABEL_13:
    *a4 = v8;
  return v9;
}

uint64_t MBRCFRecordPartitions(uint64_t *a1, const __CFArray *a2, int a3, unsigned int a4, _WORD *a5)
{
  uint64_t v5;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int16 *v14;
  __int16 *v15;
  uint64_t v16;

  v5 = *a1;
  if (!*(_WORD *)(*a1 + 522))
    return 0;
  v11 = 0;
  v12 = 0;
  result = 0;
  do
  {
    v14 = &MBRDescriptors;
    while (*v14 != *(_WORD *)(v5 + 1072 * v11 + 1082))
    {
      v15 = v14 + 8;
      v16 = *((_QWORD *)v14 + 3);
      v14 += 8;
      if (!v16)
        goto LABEL_8;
    }
    v15 = v14;
LABEL_8:
    if (((a4 >> v15[1]) & 1) != 0)
    {
      result = MBRCFRecordPartition(a2, a1, a3, (__int16)v11);
      if ((result & 1) != 0 && (_DWORD)v12 == 0)
        v12 = result;
      else
        v12 = v12;
      if (a5)
        ++*a5;
    }
    ++v11;
  }
  while (v11 < *(unsigned __int16 *)(v5 + 522));
  if (!(_DWORD)result)
    return v12;
  return result;
}

uint64_t MBRCFRecordPartition(const __CFArray *a1, uint64_t *a2, int a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v10;
  const __CFString *v11;
  uint64_t result;
  int v13;
  CFNumberRef v14;
  CFNumberRef v15;
  const char *v16;
  CFStringRef v17;
  CFStringRef v18;
  unint64_t v19;
  unint64_t v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  unsigned int v27;
  const void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t valuePtr;
  __int16 v32;

  v7 = *a2;
  v8 = *a2 + 1072 * a4;
  if (uuid_is_null((const unsigned __int8 *)(v8 + 976)))
  {
    MEMORY[0x2199A5D48](v8 + 976);
  }
  else
  {
    v11 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)(v8 + 976));
    v10 = CFArrayDictionarySearchWithIndexOptions(a1, CFSTR("GUID"), v11, 0, 0);
    CFRelease(v11);
    if (v10)
      goto LABEL_7;
  }
  if (!a3)
    return 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return 12;
  v10 = Mutable;
  CFArrayAppendValue(a1, Mutable);
  CFRelease(v10);
LABEL_7:
  if (v7)
  {
    result = CFDictionarySetUUID(v10, CFSTR("GUID"), (CFUUIDBytes *)(v8 + 976));
    if ((_DWORD)result)
      return result;
    v13 = a4;
    v14 = PMCFCreatePartitionType(8, *(unsigned __int16 *)(v7 + 1072 * a4 + 1082), (char *)(v8 + 576));
    if (v14)
    {
      v15 = v14;
      CFDictionarySetValue(v10, CFSTR("Type"), v14);
      CFRelease(v15);
      if (*(_BYTE *)(v8 + 544))
      {
        v16 = strntrim((const char *)(v8 + 544), 32);
        v17 = CFStringCreateWithCString(0, v16, 0);
        if (v17)
        {
          v18 = v17;
          CFDictionarySetValue(v10, CFSTR("Name"), v17);
          CFRelease(v18);
        }
      }
      v29 = 0;
      v19 = (unint64_t)*(unsigned __int16 *)(v7 + 2) >> 9;
      valuePtr = *(unsigned int *)(v8 + 536) * (unint64_t)v19;
      v20 = *(unsigned int *)(v8 + 540) * (unint64_t)v19;
      v30 = v20;
      if (valuePtr)
      {
        v21 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
        if (v21)
        {
          v22 = v21;
          CFDictionarySetValue(v10, CFSTR("Offset"), v21);
          CFRelease(v22);
        }
      }
      if (v20)
      {
        v23 = CFNumberCreate(0, kCFNumberSInt64Type, &v30);
        if (v23)
        {
          v24 = v23;
          CFDictionarySetValue(v10, CFSTR("Size"), v23);
          CFRelease(v24);
        }
      }
      if (*(_DWORD *)(v8 + 616))
      {
        v29 = *(unsigned int *)(v8 + 616);
        v25 = CFNumberCreate(0, kCFNumberSInt64Type, &v29);
        if (v25)
        {
          v26 = v25;
          CFDictionarySetValue(v10, CFSTR("Status"), v25);
          CFRelease(v26);
        }
      }
      if ((*(__int16 *)(v7 + 1072 * v13 + 1034) & 0x80000000) == 0)
      {
        v27 = *(unsigned __int16 *)(v7 + 1072 * v13 + 1034) + 1;
        v32 = v27 / v19;
        if (v19 <= v27)
        {
          result = (uint64_t)CFNumberCreate(0, kCFNumberSInt16Type, &v32);
          if (!result)
            return result;
          v28 = (const void *)result;
          CFDictionarySetValue(v10, CFSTR("Partition ID"), (const void *)result);
          CFRelease(v28);
        }
      }
      return 0;
    }
  }
  return 22;
}

CFNumberRef PMCFCreatePartitionType(int a1, int a2, char *a3)
{
  const char *v3;
  unsigned __int16 valuePtr;

  valuePtr = a2;
  if (a2)
  {
    v3 = PMCodeSearch(a2, a1);
    if (!v3)
      return CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
LABEL_6:
    if (*v3)
      return (CFNumberRef)CFStringCreateWithCString(0, v3, 0);
    return CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
  }
  v3 = a3;
  if (a3)
  {
    valuePtr = (unsigned __int16)PMDescriptorSearch(a3, a1);
    goto LABEL_6;
  }
  return 0;
}

uint64_t PMSlice2Index(_WORD *a1, int a2, _WORD *a3)
{
  __int16 v3;
  int v4;
  __int16 *v5;
  int v6;
  int v7;
  int v8;

  v3 = 22;
  if (a1 && a3)
  {
    if (a1[261])
    {
      v4 = 0;
      v5 = a1 + 517;
      while (1)
      {
        v6 = *v5;
        if (v6 != -1 && (v6 + 1) / ((unsigned __int16)a1[259] >> 9) == a2)
          break;
        v7 = *(v5 - 1);
        if (v7 != -1)
        {
          v8 = v7 >= -1 ? v7 + 1 : v7 + 4;
          if (a2 == v8 >> 2)
            break;
        }
        v5 += 536;
        if ((unsigned __int16)a1[261] == ++v4)
        {
          v3 = -5343;
          LOWORD(v4) = a1[261];
          goto LABEL_16;
        }
      }
      v3 = 0;
    }
    else
    {
      LOWORD(v4) = 0;
      v3 = -5343;
    }
LABEL_16:
    *a3 = v4;
  }
  return v3;
}

uint64_t MKBootDisposition(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  int v9;
  const __CFDictionary *Value;
  const __CFDictionary *v11;
  int v12;
  uint64_t v13;
  const char *i;
  CFStringRef v15;
  CFStringRef v16;
  const __CFDictionary *v17;
  int v18;
  unsigned int v19;
  const __CFArray *v20;
  const __CFNumber *v21;
  unsigned int v22;
  int v23;
  const char *v24;
  int v25;
  const __CFBoolean *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  __int16 v30;
  int v31;
  _BYTE v33[154];
  unsigned int valuePtr;
  unsigned int v35;
  int v36;
  int v37;
  __int16 v38;
  _OWORD v39[5];
  __int128 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)(a5 + 48) = 0u;
  *(_OWORD *)(a5 + 64) = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)a5 = 0u;
  *(_WORD *)a5 = 259;
  if (a3)
  {
    if (*(unsigned __int16 *)(a3 + 522) <= a4)
    {
      LOWORD(v9) = -5343;
    }
    else
    {
      memset(v33, 0, sizeof(v33));
      *(_DWORD *)(a5 + 4) = 0;
      v9 = MKGetPartitionRequisites(a1, *(__int16 *)(a3 + 514), (const char *)(a3 + 1072 * a4 + 576), *(unsigned __int16 *)(a3 + 1072 * a4 + 1082), v33);
      if (!v9)
      {
        if (*(_WORD *)v33)
        {
          Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Loaders"));
          if (Value)
          {
            *(_DWORD *)(a5 + 4) = 0;
            if (*(_WORD *)v33)
            {
              v11 = Value;
              v12 = 0;
              v13 = a3 + 528 + 1072 * (__int16)(a4 - 1);
              for (i = &v33[38]; ; i += 38)
              {
                v15 = CFStringCreateWithCString(0, i - 36, 0);
                if (!v15
                  || (v16 = v15, v17 = (const __CFDictionary *)CFDictionaryGetValue(v11, v15), CFRelease(v16), !v17))
                {
                  LOWORD(v9) = -415;
                  return (__int16)v9;
                }
                v18 = *((unsigned __int16 *)i - 1);
                if ((v18 - 2) < 2 || v18 == 4)
                {
                  LOWORD(v9) = 0;
                  *(_DWORD *)(a5 + 4) |= 0x11u;
                }
                else if (v18 == 1)
                {
                  v41 = 0;
                  v40 = 0u;
                  memset(v39, 0, sizeof(v39));
                  v37 = 0;
                  v36 = 0;
                  valuePtr = 0;
                  v35 = 0;
                  *(_DWORD *)(a5 + 4) &= 0xFFFFFFFA;
                  v9 = MKGetPartitionInfo(v17, *(__int16 *)(a3 + 514), (uint64_t)v39);
                  if (!v9)
                  {
                    v19 = DWORD2(v40);
                    *(_QWORD *)(a5 + 16) = DWORD2(v40);
                    v38 = a4 - 1;
                    if (!strcasecmp((const char *)(v13 + 48), (const char *)&v39[2] + 1)
                      && *(_DWORD *)(v13 + 12) >= v19)
                    {
                      v24 = PMCodeSearch(24320, *(__int16 *)(a3 + 514));
                      v9 = strncasecmp((const char *)&v39[2] + 1, v24, 0x20uLL);
                      v25 = *(_DWORD *)(a5 + 4);
                      if (!v9)
                      {
                        *(_DWORD *)(a5 + 4) = v25 | 4;
                        *(_WORD *)(a5 + 8) = 0;
                        goto LABEL_47;
                      }
                      *(_DWORD *)(a5 + 4) = v25 | 1;
                      v26 = (const __CFBoolean *)CFDictionaryGetValue(v17, CFSTR("Loader Present"));
                      if (!v26 || CFBooleanGetValue(v26))
                      {
                        if (strcasecmp((const char *)(v13 + 472), i - 36))
                          goto LABEL_43;
                        v27 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Checksum"));
                        if (v27)
                        {
                          CFNumberGetValue(v27, kCFNumberSInt32Type, &v36);
                          if (v36)
                          {
                            if (v36 != *(_DWORD *)(v13 + 116))
                              goto LABEL_43;
                          }
                        }
                        v28 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Major Vers"));
                        if (v28)
                        {
                          CFNumberGetValue(v28, kCFNumberSInt16Type, (char *)&v37 + 2);
                          if (HIWORD(v37))
                          {
                            if (HIWORD(v37) != *(unsigned __int16 *)(v13 + 464))
                              goto LABEL_43;
                          }
                        }
                        v29 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Minor Vers"));
                        if (v29)
                        {
                          CFNumberGetValue(v29, kCFNumberSInt16Type, &v37);
                          if ((_WORD)v37)
                          {
                            if ((unsigned __int16)v37 != *(unsigned __int16 *)(v13 + 466))
                              goto LABEL_43;
                          }
                        }
                      }
                      LOWORD(v9) = 0;
                      *(_DWORD *)(a5 + 4) = *(_DWORD *)(a5 + 4) & 0xFFFFFFFA | 4;
                      v30 = -1;
                    }
                    else
                    {
                      v20 = (const __CFArray *)CFDictionaryGetValue(v17, CFSTR("Partition Type Throw Aways"));
                      v9 = MKScavangeDross(a3, v20, (uint64_t)v39, (__int16)a4, &v38, &v35);
                      if (v9)
                        goto LABEL_47;
                      if (v35 < DWORD2(v40))
                      {
                        v21 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("Minimum Host Size"));
                        if (v21
                          && (CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr),
                              v22 = PMConvertBlocks(*(unsigned int *)(a3 + 528 + 1072 * a4 + 12), *(unsigned __int16 *)(a3 + 2), 0x200u), valuePtr)&& v22 < valuePtr)
                        {
                          if ((*(_WORD *)i & 1) != 0)
                          {
                            LOWORD(v9) = 0;
                            v23 = *(_DWORD *)(a5 + 4) | 4;
LABEL_46:
                            *(_DWORD *)(a5 + 4) = v23;
                            goto LABEL_47;
                          }
                        }
                        else
                        {
                          v31 = *(_DWORD *)(a5 + 4);
                          *(_DWORD *)(a5 + 4) = v31 | 8;
                          if ((*(_WORD *)i & 1) != 0)
                          {
                            LOWORD(v9) = 0;
                            v23 = v31 | 0xC;
                            goto LABEL_46;
                          }
                        }
LABEL_43:
                        LOWORD(v9) = 0;
                        goto LABEL_47;
                      }
                      LOWORD(v9) = 0;
                      *(_DWORD *)(a5 + 4) |= 3u;
                      v30 = v38 - a4;
                    }
                    *(_WORD *)(a5 + 8) = v30;
                  }
                }
                else
                {
                  LOWORD(v9) = 22;
                }
LABEL_47:
                if (++v12 >= *(unsigned __int16 *)v33)
                  return (__int16)v9;
              }
            }
          }
          LOWORD(v9) = -417;
        }
        else
        {
          LOWORD(v9) = 0;
          *(_DWORD *)(a5 + 4) |= 4u;
        }
      }
    }
  }
  else
  {
    LOWORD(v9) = -50;
  }
  return (__int16)v9;
}

const char *APMCodeSearch(int a1)
{
  const char *result;
  char **v3;
  int v4;

  if (a1 == 4097)
    return "Apple_partition_map";
  v3 = &off_24CEC17E0;
  do
  {
    result = *v3;
    if (!*v3)
      break;
    v4 = *((unsigned __int16 *)v3 - 4);
    v3 += 2;
  }
  while (v4 != a1);
  return result;
}

unsigned __int16 *APMDescriptorSearch(char *a1)
{
  unsigned __int16 *result;

  result = PMLookupDESC(a1, 0, (unsigned __int16 *)&APMDescriptors);
  if (result)
    return (unsigned __int16 *)*result;
  return result;
}

uint64_t APMCFCreateMap(__CFArray *a1, const __CFDictionary *a2, __CFBundle *a3, int a4, unint64_t a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  __CFBundle *v17;
  const __CFDictionary *v18;
  const __CFURL *v19;
  int v21;
  const __CFNumber *Value;
  const __CFBoolean *v23;
  int v24;
  const __CFNumber *v25;
  char v26;
  const __CFArray *v27;
  const __CFArray *v28;
  const __CFArray *v29;
  const __CFNumber *v30;
  __CFDictionary *v31;
  int v32;
  __CFDictionary *v33;
  unsigned __int16 v34;
  unsigned int v35;
  const __CFDictionary *v36;
  uint64_t v37;
  unint64_t v38[2];
  int v39[2];
  unsigned __int16 valuePtr;
  int v41;
  __int16 v42;
  unsigned int v43;

  v41 = 0;
  v43 = 22;
  *(_QWORD *)v39 = 0;
  valuePtr = 1;
  v42 = 1;
  if (a2)
  {
    v43 = -43;
    v17 = a3;
    if (a3 || (v17 = MKAccessLibrary(0)) != 0)
    {
      v37 = 0;
      v38[0] = 0;
      v38[1] = 0;
      v18 = MKLoadDB(v17, CFSTR("inventory"), (int *)&v43);
      if (v18)
      {
        v36 = a7;
        v19 = MKLoadDB(v17, CFSTR("database"), (int *)&v43);
        if (!v43)
        {
          v43 = a9(a8, 15, a5, 0, 0, (char *)&v37);
          if (!v43)
          {
            v34 = WORD2(v37);
            if (a6)
            {
              if (!(_DWORD)a5)
                LOWORD(a5) = 512;
            }
            else
            {
              MKScaleGeometry(v38, (int *)&v37 + 1);
              a6 = v38[0];
              if ((_DWORD)a5 && HIDWORD(v37) < a5)
                a6 = PMConvertBlocks(LODWORD(v38[0]), WORD2(v37), a5);
              else
                LOWORD(a5) = WORD2(v37);
            }
            v21 = (unsigned __int16)a5 >> 9;
            if (a4)
              v21 = a4;
            v35 = v21;
            Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("PMFormats"));
            if (Value || (Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Map Format"))) != 0)
              CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
            v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Dual Format"));
            v24 = (v23 || (v23 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Dualmode"))) != 0)
               && CFBooleanGetValue(v23) != 0;
            v25 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Map Size"));
            if (v25)
              CFNumberGetValue(v25, kCFNumberSInt32Type, &v41);
            v26 = MKCFOptionBit(a2, CFSTR("Force 512 Byte Map"), 1);
            v43 = PMNewPartitionListInternal((const void ***)v39, v41, a6, (unsigned __int16)a5, v24, valuePtr, v26);
            if (!v43)
            {
              *(_WORD *)(**(_QWORD **)v39 + 500) = v34 >> 9;
              v27 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Drivers"));
              v28 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Patches"));
              v29 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Partitions"));
              v30 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Revision"));
              if (v30)
                CFNumberGetValue(v30, kCFNumberSInt16Type, &v42);
              if ((!v27
                 || (v43 = MKBuildDrivers(*(Ptr **)v39, v18, v27, v17, v35, 0, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a9)) == 0)&& (!v28|| (v43 = MKCreatePatchPartition(*(const void ***)v39, v29, v18, v28, v17, v35, 0, a8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))a9)) == 0))
              {
                v31 = APMCFRecordMapSection(*(Ptr **)v39, 0x94u, &v43);
                if (!v43)
                {
                  v33 = v31;
                  if (v31)
                  {
                    CFArrayAppendValue(a1, v31);
                    CFRelease(v33);
                  }
                  if (v29)
                    v43 = APMCFCreatePartitions(v33, v29, v17, v18, v32, v35, v36, a8, a9);
                }
              }
            }
          }
        }
      }
      else
      {
        v19 = 0;
      }
      if (!a3)
        CFRelease(v17);
      if (v18)
        CFRelease(v18);
      if (v19)
        CFRelease(v19);
    }
  }
  return v43;
}

uint64_t APMSetupNewPartitionList(const void **a1, int a2, int a3, unsigned int a4, int a5, char a6)
{
  _WORD *v8;
  unsigned __int16 v9;
  __int16 v10;
  unsigned __int16 v11;
  uint64_t result;

  v8 = *a1;
  *((_WORD *)*a1 + 258) = a5 != 0;
  if (a2)
    v9 = a2;
  else
    v9 = 63;
  if (a6 & 2 | a2)
    v9 /= (unsigned __int16)(a4 >> 9);
  v8[260] = v9;
  *v8 = 17746;
  if (a5)
    v10 = 512;
  else
    v10 = a4;
  if ((a6 & 1) != 0)
    v11 = 512;
  else
    v11 = v10;
  v8[1] = v11;
  *((_DWORD *)v8 + 1) = a4 / v11 * a3;
  v8[250] = v11 >> 9;
  result = PMGenPartitionType(a1, 4097, 1, v9, v11, (a5 << 24) | 3u, "Apple", 0, 0);
  if (!(_DWORD)result)
    return PMAccountFreespace(a1, a5, 0);
  return result;
}

uint64_t PMGenPartitionType(const void **a1, int a2, int a3, int a4, unsigned int a5, int a6, _BYTE *a7, int a8, unsigned __int16 a9)
{
  char *v16;

  v16 = (char *)PMCodeSearch(a2, *((__int16 *)*a1 + 257));
  if (v16)
    return PMGenPartition(a1, v16, a3, a4, a5, a6, a7, a8, a9);
  else
    return 4294961954;
}

uint64_t PMGenPartition(const void **a1, char *a2, int a3, int a4, unsigned int a5, int a6, _BYTE *a7, int a8, unsigned __int16 a9)
{
  unsigned __int16 *v13;
  __int16 v14;
  unsigned int v15;
  _DWORD *v16;
  uint64_t v17;
  BOOL v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  _DWORD *v24;
  unsigned int v25;
  int v26;
  _DWORD *v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  BOOL v31;
  _OWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int16 v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  memset(v34, 0, sizeof(v34));
  PMInitPartitionRecord(*((__int16 *)*a1 + 257), a3, a4, 0, a2, a7, v34);
  v13 = (unsigned __int16 *)*a1;
  if (a6)
  {
    v14 = 0;
    DWORD2(v35) = a6;
    if (!a5)
      goto LABEL_7;
LABEL_5:
    v15 = v13[1];
    if (v15 != a5)
      PMConvertRecord(v34, (__int16)v13[257], v62, a5 >> 9, v15 >> 9);
    goto LABEL_7;
  }
  v14 = PMDefaultPartitionStatus((__int16)v13[257], (uint64_t)v34);
  if (a5)
    goto LABEL_5;
LABEL_7:
  if (!a8)
    return (__int16)addentry(a1, v34, 0x210uLL, 0x20Au, a9, 0x430u);
  v16 = *a1;
  v17 = *((unsigned __int16 *)*a1 + 261);
  if (!*((_WORD *)*a1 + 261))
  {
    v19 = HIDWORD(v34[0]);
    goto LABEL_47;
  }
  v18 = 0;
  v20 = DWORD2(v34[0]);
  v19 = HIDWORD(v34[0]);
  do
  {
    if (*((_WORD *)v16 + 541) != 24320)
    {
      v21 = v16[134];
      if (v21 >= v20)
        v22 = v20;
      else
        v22 = v16[134];
      if (v21 <= v20)
        v23 = v20;
      else
        v23 = v16[134];
      if (v21 >= v20)
        v24 = (_DWORD *)((unint64_t)v34 | 0xC);
      else
        v24 = v16 + 135;
      v25 = *v24 + v22;
      if (v25 < v23)
        goto LABEL_42;
      v26 = v23 - v22;
      if (v21 >= v20)
        v27 = v16 + 135;
      else
        v27 = (_DWORD *)((unint64_t)v34 | 0xC);
      v28 = *v27 + v23;
      v29 = v25 - v28;
      if (v25 <= v28)
        v29 = v28 - v25;
      v30 = v26 <= v29 ? v29 : v26;
      if ((v30 & 0x80000000) != 0)
      {
LABEL_42:
        v18 = 0;
        if (!v19)
          break;
        goto LABEL_43;
      }
      if (v25 >= v28)
        v25 = v28;
      if (v26 >= v29)
        v25 = v22;
      v31 = v20 == v25 && v19 == v30;
      v18 = !v31;
      *((_QWORD *)&v34[0] + 1) = __PAIR64__(v30, v25);
      v19 = v30;
      v20 = v25;
      if (!v30)
        break;
    }
LABEL_43:
    v16 += 268;
    --v17;
  }
  while (v17);
  if (v18)
    DWORD2(v35) |= 0x1000u;
LABEL_47:
  if (v62 == 24320 || v19 != 0)
    return (__int16)addentry(a1, v34, 0x210uLL, 0x20Au, a9, 0x430u);
  return v14;
}

__CFDictionary *APMCFRecordMapSection(Ptr *a1, unsigned int a2, _DWORD *a3)
{
  Ptr v4;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  char *v10;
  uint64_t v11;
  __CFDictionary *v12;
  __int16 v13;
  __int16 v14;

  v13 = 0;
  v4 = *a1;
  if (*a1)
  {
    v14 = 0;
    LODWORD(Mutable) = PMSpecificIndex(a1, 4097, 0, &v14);
    if ((_DWORD)Mutable)
    {
      v8 = 0;
    }
    else
    {
      v10 = &v4[1072 * v14];
      if (uuid_is_null((const unsigned __int8 *)v10 + 976))
        MEMORY[0x2199A5D48](v10 + 976);
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v8 = Mutable;
      if (Mutable)
      {
        v11 = (uint64_t)(v10 + 528);
        LODWORD(Mutable) = APMUpdatePartitionDictionary(Mutable, v11, (uint64_t)v4);
        if (!(_DWORD)Mutable)
        {
          CFDictionarySetValue(v8, CFSTR("ID"), CFSTR("MAP"));
          MKCFRecordSectionSize(v8, *(unsigned int *)(v11 + 8), *(unsigned int *)(v11 + 8), (*((_DWORD *)v4 + 1) - *(_DWORD *)(v11 + 8)), *((unsigned int *)v4 + 1), *((unsigned __int16 *)v4 + 259));
          Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
          if (Mutable)
          {
            v12 = Mutable;
            CFDictionarySetValue(v8, CFSTR("Partitions"), Mutable);
            CFRelease(v12);
            if (!*((_WORD *)v4 + 261)
              || (LODWORD(Mutable) = APMCFRecordPartitions((uint64_t *)a1, v12, a2, &v13), !(_DWORD)Mutable))
            {
              mkcfstoreref(v8, (const UInt8 *)a1);
              LODWORD(Mutable) = 0;
            }
          }
        }
      }
    }
  }
  else
  {
    v8 = 0;
    LODWORD(Mutable) = -1;
  }
  if (a3)
    *a3 = (_DWORD)Mutable;
  return v8;
}

uint64_t APMUpdatePartitionDictionary(__CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  CFNumberRef v7;
  CFNumberRef v8;
  const char *v9;
  CFStringRef v10;
  CFStringRef v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  const char *v34;
  CFStringRef v35;
  CFStringRef v36;
  uint64_t v37;
  const char *v38;
  CFStringRef v39;
  CFStringRef v40;
  CFNumberRef v41;
  CFNumberRef v42;
  CFNumberRef v43;
  CFNumberRef v44;
  const char *v45;
  const void *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int16 valuePtr;
  char v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  result = 22;
  if (a2)
  {
    if (a3)
    {
      result = CFDictionarySetUUID(a1, CFSTR("GUID"), (CFUUIDBytes *)(a2 + 448));
      if (!(_DWORD)result)
      {
        v7 = PMCFCreatePartitionType(1, *(unsigned __int16 *)(a2 + 554), (char *)(a2 + 48));
        if (v7)
        {
          v8 = v7;
          CFDictionarySetValue(a1, CFSTR("Type"), v7);
          CFRelease(v8);
          if (*(_BYTE *)(a2 + 16))
          {
            v9 = strntrim((const char *)(a2 + 16), 32);
            v10 = CFStringCreateWithCString(0, v9, 0);
            if (v10)
            {
              v11 = v10;
              CFDictionarySetValue(a1, CFSTR("Name"), v10);
              CFRelease(v11);
            }
          }
          v12 = (unint64_t)*(unsigned __int16 *)(a3 + 2) >> 9;
          v13 = *(unsigned int *)(a2 + 8) * (unint64_t)v12;
          v14 = *(unsigned int *)(a2 + 12) * (unint64_t)v12;
          v48 = v14;
          v49 = v13;
          v15 = *(unsigned int *)(a2 + 84) * (unint64_t)v12;
          v47 = v15;
          if (*(_WORD *)(a2 + 554) == 4097)
          {
            if (v13 != 1)
            {
              v48 = v13 + v14 - 1;
              v49 = 1;
            }
            v15 = 0;
            v47 = 0;
          }
          valuePtr = pmindex2slice(a3, a2);
          if (valuePtr)
          {
            v16 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
            if (v16)
            {
              v17 = v16;
              CFDictionarySetValue(a1, CFSTR("Partition ID"), v16);
              CFRelease(v17);
            }
          }
          if (v49)
          {
            v18 = CFNumberCreate(0, kCFNumberSInt64Type, &v49);
            if (v18)
            {
              v19 = v18;
              CFDictionarySetValue(a1, CFSTR("Offset"), v18);
              CFRelease(v19);
            }
          }
          if (*(_DWORD *)(a2 + 80))
          {
            v20 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 80));
            if (v20)
            {
              v21 = v20;
              CFDictionarySetValue(a1, CFSTR("Logical Offset"), v20);
              CFRelease(v21);
            }
          }
          if (v48)
          {
            v22 = CFNumberCreate(0, kCFNumberSInt64Type, &v48);
            if (v22)
            {
              v23 = v22;
              CFDictionarySetValue(a1, CFSTR("Size"), v22);
              CFRelease(v23);
            }
          }
          if (v15)
          {
            if (v15 != v48)
            {
              v24 = CFNumberCreate(0, kCFNumberSInt64Type, &v47);
              if (v24)
              {
                v25 = v24;
                CFDictionarySetValue(a1, CFSTR("Logical Size"), v24);
                CFRelease(v25);
              }
            }
          }
          if (*(_DWORD *)(a2 + 88))
          {
            v26 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 88));
            if (v26)
            {
              v27 = v26;
              CFDictionarySetValue(a1, CFSTR("Status"), v26);
              CFRelease(v27);
            }
          }
          if (*(_DWORD *)(a2 + 92))
          {
            v28 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 92));
            if (v28)
            {
              v29 = v28;
              CFDictionarySetValue(a1, CFSTR("Logical Boot Offset"), v28);
              CFRelease(v29);
            }
          }
          if (*(_DWORD *)(a2 + 96))
          {
            v30 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 96));
            if (v30)
            {
              v31 = v30;
              CFDictionarySetValue(a1, CFSTR("Boot Size"), v30);
              CFRelease(v31);
            }
          }
          if (*(_DWORD *)(a2 + 116))
          {
            v32 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a2 + 116));
            if (v32)
            {
              v33 = v32;
              CFDictionarySetValue(a1, CFSTR("Boot Checksum"), v32);
              CFRelease(v33);
            }
          }
          if (*(_BYTE *)(a2 + 120))
          {
            v34 = strntrim((const char *)(a2 + 120), 16);
            v35 = CFStringCreateWithCString(0, v34, 0);
            if (v35)
            {
              v36 = v35;
              CFDictionarySetValue(a1, CFSTR("Processor ID"), v35);
              CFRelease(v36);
            }
          }
          v37 = *(unsigned int *)(a2 + 136);
          if ((_DWORD)v37)
          {
            OSType2Ascii(v37, v51, 2);
            v38 = strntrim(v51, 16);
            v39 = CFStringCreateWithCString(0, v38, 0);
            if (v39)
            {
              v40 = v39;
              CFDictionarySetValue(a1, CFSTR("Boot Signature"), v39);
              CFRelease(v40);
            }
          }
          if (*(_WORD *)(a2 + 464))
          {
            v41 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a2 + 464));
            if (v41)
            {
              v42 = v41;
              CFDictionarySetValue(a1, CFSTR("Major Version"), v41);
              CFRelease(v42);
            }
          }
          if (*(_WORD *)(a2 + 466))
          {
            v43 = CFNumberCreate(0, kCFNumberSInt16Type, (const void *)(a2 + 466));
            if (v43)
            {
              v44 = v43;
              CFDictionarySetValue(a1, CFSTR("Minor Version"), v43);
              CFRelease(v44);
            }
          }
          result = 0;
          if (*(_BYTE *)(a2 + 472) && *(unsigned __int8 *)(a2 + 472) != 255)
          {
            v45 = strntrim((const char *)(a2 + 472), 32);
            result = (uint64_t)CFStringCreateWithCString(0, v45, 0);
            if (result)
            {
              v46 = (const void *)result;
              CFDictionarySetValue(a1, CFSTR("Content Hint"), (const void *)result);
              CFRelease(v46);
              return 0;
            }
          }
        }
        else
        {
          return 22;
        }
      }
    }
  }
  return result;
}

const char *strntrim(const char *a1, int a2)
{
  size_t v4;
  const char *v6;
  BOOL v7;

  v4 = strnlen(a1, a2);
  if (a2 >= 1 && v4)
  {
    if (a1[v4 - 1] <= 32 && &a1[v4 - 1] >= a1)
    {
      v6 = &a1[v4 - 2];
      do
      {
        *((_BYTE *)v6 + 1) = 0;
        v7 = *v6 <= 32 && v6 >= a1;
        --v6;
      }
      while (v7);
    }
    a1[a2 - 1] = 0;
  }
  return a1;
}

uint64_t pmindex2slice(uint64_t a1, uint64_t a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  v2 = *(__int16 *)(a2 + 506);
  if (v2 == -1)
  {
    v5 = *(__int16 *)(a2 + 504);
    if (v5 != -1)
      return ((v5 + 1) >> 2) & ~(v5 >> 31);
    return 0;
  }
  if (v2 < 0)
    return 0;
  v3 = v2 + 1;
  if ((*(_WORD *)(a1 + 516) & 1) != 0)
    v4 = 1;
  else
    v4 = *(unsigned __int16 *)(a1 + 518) >> 9;
  return v3 / v4;
}

uint64_t APMCFRecordPartitions(uint64_t *a1, const __CFArray *a2, unsigned int a3, _WORD *a4)
{
  uint64_t v4;
  unint64_t v9;
  __int16 *v10;
  uint64_t v11;
  uint64_t result;

  v4 = *a1;
  if (*(_WORD *)(*a1 + 522))
  {
    v9 = 0;
    do
    {
      v10 = &APMDescriptors;
      while (*v10 != *(_WORD *)(v4 + 1072 * v9 + 1082))
      {
        v11 = *((_QWORD *)v10 + 3);
        v10 += 8;
        if (!v11)
        {
          v10 = (__int16 *)&unk_24CEC1AB8;
          break;
        }
      }
      if (((a3 >> v10[1]) & 1) != 0)
      {
        result = APMCFRecordPartition(a2, a1, (__int16)v9);
        if ((_DWORD)result)
          return result;
        if (a4)
          ++*a4;
      }
      ++v9;
    }
    while (v9 < *(unsigned __int16 *)(v4 + 522));
  }
  return 0;
}

uint64_t APMCategorize(int a1)
{
  __int16 *v1;
  uint64_t v2;

  v1 = &APMDescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    v2 = *((_QWORD *)v1 + 3);
    v1 += 8;
    if (!v2)
    {
      v1 = (__int16 *)&unk_24CEC1AB8;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t APMCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, __CFBundle *a3, const __CFDictionary *a4, int a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  uint64_t Count;
  CFIndex v17;
  const __CFDictionary *ValueAtIndex;
  uint64_t v19;
  uint64_t result;

  if (!a1)
    return 4294967246;
  Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count)
    return 0;
  v17 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v17);
    if (!ValueAtIndex)
      break;
    result = APMCFCreatePartition(a1, ValueAtIndex, a3, a4, v19, a6, a7, a8, a9);
    if ((_DWORD)result)
      return result;
    if (Count == ++v17)
      return 0;
  }
  return 4294966881;
}

uint64_t APMCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5, unsigned int a6, const __CFDictionary *a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  const UInt8 *v16;
  Ptr *v17;
  uint64_t v18;
  uint64_t result;
  const __CFDictionary *Value;
  uint64_t v21;
  char v22;
  char v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  _DWORD *v32;
  _DWORD *v33;
  unsigned int v34;
  const __CFArray *v35;
  const __CFString *v36;
  uint64_t v37;
  uint64_t v38;
  const __CFDictionary *v39;
  const void **v40;
  unsigned int v41;
  unsigned __int16 v42;
  char v43[32];
  __int128 v44;
  _OWORD v45[2];
  _OWORD v46[31];
  unsigned __int16 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v16 = mkcfrecoverref(a1);
  if (!v16)
    return 4294967246;
  v17 = (Ptr *)v16;
  v42 = 0;
  v44 = 0u;
  memset(v45, 0, sizeof(v45));
  memset(v46, 0, 464);
  v18 = *(_QWORD *)v16;
  v41 = *(unsigned __int16 *)(*(_QWORD *)v16 + 2) >> 9;
  result = PMPrimaryInfoUpdate(a2, *(__int16 *)(*(_QWORD *)v16 + 514), v41, &v44, 1);
  if (!(_DWORD)result)
  {
    if (v47 != 12544 || (result = PMSpecificIndex(v17, 12544, 0, (__int16 *)&v42), !((unsigned __int16)result | v42)))
    {
      v37 = v18;
      v38 = a8;
      v39 = a4;
      v40 = (const void **)v17;
      Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Options"));
      v21 = 0;
      v22 = 1;
      do
      {
        v23 = v22;
        if (Value)
        {
          v24 = MKCFOptionBit(Value, CFSTR("Avoid last 10 blocks"), 1);
          v25 = MKCFOptionBit(Value, CFSTR("Retain existing content"), 4) | v24;
          v26 = MKCFOptionBit(Value, CFSTR("Allocate Remaining Space"), 0x400000);
          v27 = v25 | v26 | MKCFOptionBit(Value, CFSTR("Write Protect"), 0x80000000);
          v28 = MKCFOptionBit(Value, CFSTR("Flexible Allocation"), 0x10000000);
          v29 = v28 | MKCFOptionBit(Value, CFSTR("Direct Mode"), 0x20000000);
          v21 |= v27 | v29 | MKCFOptionBit(Value, CFSTR("No Minimum Size For Loader"), 0x800000);
        }
        v22 = 0;
        Value = a7;
      }
      while ((v23 & 1) != 0);
      v30 = a6;
      if (!a6)
        v30 = *(unsigned __int16 *)(v37 + 518) >> 9;
      if ((v21 & 0x400000) != 0)
      {
        v31 = 0;
        HIDWORD(v44) = 0;
      }
      else
      {
        v31 = HIDWORD(v44);
      }
      result = PMNewPartitionExtended(v40, v47, (char *)v46, DWORD2(v44), v31, v45, v30, &v42, v21);
      if (!(_DWORD)result)
      {
        v32 = *v40;
        v33 = (char *)*v40 + 1072 * (__int16)v42 + 528;
        result = PMSecondaryInfoUpdate(a2, v41, (uint64_t)v33, 1);
        if (!(_DWORD)result)
        {
          if ((v21 & 1) != 0 && v32[1] == v33[3] + v33[2])
          {
            v34 = (v33[3] - PMConvertBlocks(10, 0x200u, *((unsigned __int16 *)v32 + 1))) / v30 * v30;
            v33[3] = v34;
            if (v33[21])
              v33[21] = v34;
          }
          v35 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
          if (!a3)
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          if ((v21 & 0x20000000) != 0)
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          v36 = (const __CFString *)CFDictionaryGetValue(a2, CFSTR("Partition Loader"));
          if (!v36)
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          CFStringGetCString(v36, v43, 32, 0);
          result = MKCreateLoaderPartition(v40, a3, v39, v30, (unsigned __int16)v21, (__int16)v42, v43, 1, v38, a9);
          if ((_DWORD)result == 28)
            return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
          if (!(_DWORD)result)
          {
            result = APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)v42);
            if (!(_DWORD)result)
              return APMCFRecordPartition(v35, (uint64_t *)v40, (__int16)++v42);
          }
        }
      }
    }
  }
  return result;
}

uint64_t PMPrimaryInfoUpdate(CFDictionaryRef theDict, int a2, unsigned int a3, void *a4, int a5)
{
  uint64_t result;
  const __CFString *Value;
  const __CFString *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t valuePtr;

  result = 22;
  if (theDict && a4)
  {
    if (a5)
      bzero(a4, 0x430uLL);
    Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Type"));
    if (Value)
    {
      result = PMCFSetupPartitionType(a2, Value, (unsigned __int16 *)a4 + 277, (char *)a4 + 48);
      if (!(_DWORD)result)
      {
        v11 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Name"));
        if (v11)
          CFStringGetCString(v11, (char *)a4 + 16, 32, 0);
        valuePtr = 0;
        v12 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Offset"));
        if (v12)
          CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr);
        v17 = 0;
        v13 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Size"));
        if (v13)
        {
          CFNumberGetValue(v13, kCFNumberSInt64Type, &v17);
          v14 = v17;
        }
        else
        {
          v14 = 0;
        }
        result = 0;
        if (valuePtr % a3)
          v15 = valuePtr / a3 + 1;
        else
          v15 = valuePtr / a3;
        if (v14 % a3)
          v16 = v14 / a3 + 1;
        else
          v16 = v14 / a3;
        *((_DWORD *)a4 + 2) = v15;
        *((_DWORD *)a4 + 3) = v16;
      }
    }
    else
    {
      return 22;
    }
  }
  return result;
}

uint64_t APMSetDefaultStatus(uint64_t a1)
{
  unsigned int v2;
  int v4;
  int v5;

  v2 = *(unsigned __int16 *)(a1 + 554);
  if (v2 > 0x4006)
  {
    if (*(unsigned __int16 *)(a1 + 554) > 0x401Fu)
    {
      if (v2 != 16416 && v2 != 16417)
      {
        if (v2 == 24320)
        {
          v4 = 0;
          goto LABEL_21;
        }
        goto LABEL_23;
      }
      goto LABEL_20;
    }
    if (v2 == 16391)
      goto LABEL_20;
    v5 = 16395;
LABEL_19:
    if (v2 != v5)
      goto LABEL_23;
LABEL_20:
    v4 = 1073741875;
    goto LABEL_21;
  }
  if (*(unsigned __int16 *)(a1 + 554) > 0x37FFu)
  {
    if (v2 == 14336)
    {
      v4 = 35;
      goto LABEL_21;
    }
    if (v2 == 0x4000)
      goto LABEL_20;
    v5 = 16386;
    goto LABEL_19;
  }
  if (v2 - 12544 < 2 || v2 == 4097)
  {
    v4 = 3;
    goto LABEL_21;
  }
LABEL_23:
  if (strstr((char *)(a1 + 48), "Driver"))
    v4 = 3;
  else
    v4 = 1073741875;
LABEL_21:
  *(_DWORD *)(a1 + 88) |= v4;
  return 0;
}

BOOL PMDrvrIdentify(char *a1)
{
  return strstr(a1, "Driver") != 0;
}

uint64_t PMSecondaryInfoUpdate(const __CFDictionary *a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t UUID;
  const __CFNumber *Value;
  int v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  int v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  const __CFString *v21;
  unint64_t valuePtr;
  uint64_t v24;
  CFRange v25;

  UUID = CFDictionaryGetUUID(a1, CFSTR("GUID"), (unsigned __int8 *)(a3 + 448));
  if (!(_DWORD)UUID)
  {
    valuePtr = 0;
    v24 = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Logical Size"));
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr)
      {
        if (valuePtr % a2)
          v10 = valuePtr / a2 + 1;
        else
          v10 = valuePtr / a2;
        *(_DWORD *)(a3 + 84) = v10;
      }
    }
    v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Logical Offset"));
    if (v11)
      CFNumberGetValue(v11, kCFNumberSInt32Type, (void *)(a3 + 80));
    v12 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Status"));
    if (v12)
    {
      CFNumberGetValue(v12, kCFNumberSInt64Type, &v24);
      v13 = v24;
      if (a4)
      {
        v13 = v24 | *(_DWORD *)(a3 + 88);
        v24 |= *(unsigned int *)(a3 + 88);
      }
      *(_DWORD *)(a3 + 88) = v13;
    }
    v14 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Logical Boot Offset"));
    if (v14)
      CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(a3 + 92));
    v15 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Boot Size"));
    if (v15)
      CFNumberGetValue(v15, kCFNumberSInt32Type, (void *)(a3 + 96));
    v16 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Boot Checksum"));
    if (v16)
      CFNumberGetValue(v16, kCFNumberSInt32Type, (void *)(a3 + 116));
    v17 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Processor ID"));
    if (v17)
      CFStringGetCString(v17, (char *)(a3 + 120), 16, 0);
    v18 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Boot Signature"));
    if (v18)
    {
      v25.location = 0;
      v25.length = 4;
      CFStringGetBytes(v18, v25, 0, 0, 0, (UInt8 *)(a3 + 136), 4, 0);
    }
    v19 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Major Version"));
    if (v19)
      CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(a3 + 464));
    v20 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Minor Version"));
    if (v20)
      CFNumberGetValue(v20, kCFNumberSInt16Type, (void *)(a3 + 466));
    v21 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Content Hint"));
    if (v21)
      CFStringGetCString(v21, (char *)(a3 + 472), 32, 0);
  }
  return UUID;
}

uint64_t PMConvertBlocks(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2)
  {
    if (a2 != a3)
      return (a2 >> 9) * result / (a3 >> 9);
  }
  return result;
}

uint64_t APMCFRecordPartition(const __CFArray *a1, uint64_t *a2, int a3)
{
  uint64_t v4;
  CFUUIDBytes *v5;
  __CFDictionary *Mutable;
  const __CFString *v8;

  v4 = *a2;
  v5 = (CFUUIDBytes *)(*a2 + 1072 * a3);
  if (uuid_is_null(&v5[61].byte0))
  {
    MEMORY[0x2199A5D48](&v5[61]);
  }
  else
  {
    v8 = (const __CFString *)uuid2cfstr(v5 + 61);
    Mutable = CFArrayDictionarySearchWithIndexOptions(a1, CFSTR("GUID"), v8, 0, 0);
    CFRelease(v8);
    if (Mutable)
      return APMUpdatePartitionDictionary(Mutable, (uint64_t)&v5[33], v4);
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFArrayAppendValue(a1, Mutable);
  CFRelease(Mutable);
  if (!Mutable)
    return 22;
  return APMUpdatePartitionDictionary(Mutable, (uint64_t)&v5[33], v4);
}

uint64_t APMCFWriteScheme(const __CFDictionary *a1, const __CFDictionary *a2, __CFBundle *a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  const __CFArray *Value;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const UInt8 *v15;
  Ptr *v16;
  const __CFNumber *v17;
  unsigned int v18;
  uint64_t result;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  const __CFArray *v33;
  Ptr v34;
  unsigned int v35;
  unsigned int v36;
  int valuePtr;
  CFRange v39;

  if (!a1)
    return 22;
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Sections"));
  if (!Value)
    return 22;
  v13 = CFArrayDictionarySearchWithIndexOptions(Value, CFSTR("ID"), CFSTR("MAP"), 0, 0);
  if (!v13)
    return 22;
  v14 = v13;
  v15 = mkcfrecoverref(v13);
  if (!v15)
    return 22;
  v16 = (Ptr *)v15;
  valuePtr = 0;
  v17 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Alignment"));
  if (v17)
  {
    CFNumberGetValue(v17, kCFNumberSInt16Type, &valuePtr);
    v18 = (unsigned __int16)valuePtr;
  }
  else
  {
    v18 = *((unsigned __int16 *)*v16 + 259) >> 9;
    LOWORD(valuePtr) = *((_WORD *)*v16 + 259) >> 9;
  }
  result = APMCFUpdateSection(v14, a3, v18, a4, a5, a6);
  if (!(_DWORD)result)
  {
    if (!a2
      || (result = MKMediaUpdateExtended((uint64_t *)v16, a2, a3, (unsigned __int16)valuePtr, 2, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a6, (_WORD *)&valuePtr + 1), !(_DWORD)result))
    {
      if (a4)
      {
        v20 = MKCFOptionBit(a4, CFSTR("Generate Freespace Records"), 16);
        v21 = MKCFOptionBit(a4, CFSTR("Merge Adjacent Freespace Records"), 128) | v20;
        v22 = MKCFOptionBit(a4, CFSTR("Fit Map to Media"), 8);
        v23 = v21 | v22 | MKCFOptionBit(a4, CFSTR("Merge Trailing Freespace Record"), 0x80000);
        v24 = MKCFOptionBit(a4, CFSTR("Ignore Shims"), 0x8000);
        v25 = v24 | MKCFOptionBit(a4, CFSTR("Protect NV Area"), 0x8000000);
        v26 = v23 | v25 | MKCFOptionBit(a4, CFSTR("Restrict Freespace"), 0x4000);
        v27 = MKCFOptionBit(a4, CFSTR("Patch Update"), 0x10000);
        v28 = v27 | MKCFOptionBit(a4, CFSTR("DDM Update"), 0x20000);
        v29 = v26 | v28 | MKCFOptionBit(a4, CFSTR("Fit Map to Container"), 0x40000000);
      }
      else
      {
        v29 = 49296;
      }
      v30 = APMWriteMedia(v16, v29, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))a6);
      if (v30)
      {
        v31 = v30;
        v32 = 0;
      }
      else
      {
        v33 = (const __CFArray *)CFDictionaryGetValue(v14, CFSTR("Partitions"));
        v34 = *v16;
        if (*((_WORD *)*v16 + 261))
        {
          v32 = 0;
          v35 = 0;
          do
          {
            v36 = APMCFRecordPartition(v33, (uint64_t *)v16, (__int16)v35);
            if ((v36 & 1) != 0 && v32 == 0)
              v32 = v36;
            ++v35;
          }
          while (v35 < *((unsigned __int16 *)v34 + 261));
          v31 = v36;
        }
        else
        {
          v32 = 0;
          v31 = 0;
        }
        v39.length = CFArrayGetCount(v33);
        v39.location = 0;
        CFArraySortValues(v33, v39, (CFComparatorFunction)CFRankPartition, 0);
      }
      if (v31)
        return v31;
      else
        return v32;
    }
  }
  return result;
}

uint64_t APMCFUpdateSection(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  __CFBundle *v10;
  const UInt8 *v12;
  uint64_t *v13;
  uint64_t result;
  unsigned int v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFNumber *v19;
  unsigned int v20;
  void *v21;
  const __CFURL *v22;
  const __CFDictionary *v23;
  const __CFURL *v24;
  const __CFDictionary *v25;
  int Count;
  int v27;
  CFIndex v28;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v30;
  unsigned int v31;
  __int16 *v32;
  uint64_t v33;
  const __CFDictionary *v34;
  uint64_t v35;
  const __CFDictionary *v36;
  unsigned int v37;
  unsigned int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  int v43;
  signed __int16 v44;
  unsigned int v45;
  CFMutableDictionaryRef Mutable;
  uint64_t v47;
  int v48;
  CFNumberRef v49;
  unsigned int v50;
  unsigned int v51;
  int v52;
  CFNumberRef v53;
  __int16 v54;
  uint64_t v55;
  int v56;
  const __CFDictionary *v57;
  _DWORD *v58;
  int v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  CFMutableDictionaryRef theDict;
  int theDicta;
  int v65;
  uint64_t v66;
  void *value;
  void *valuePtr;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *);
  const __CFDictionary *v71;
  int v72;
  const __CFDictionary *cf;
  const __CFArray *theArray;
  BOOL v75;
  int v76;
  __int16 v77;
  unsigned int UUID;
  _OWORD v79[3];
  _OWORD v80[31];
  __int16 v81;
  _QWORD v82[5];

  v82[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v10 = a2;
  if (!a2)
    v10 = MKAccessLibrary(0);
  v12 = mkcfrecoverref(a1);
  if (!v12)
    return 22;
  v13 = (uint64_t *)v12;
  LOWORD(v82[0]) = 0;
  v79[0] = 0uLL;
  result = CFDictionaryGetUUID(a1, CFSTR("GUID"), (unsigned __int8 *)v79);
  if (!(_DWORD)result)
  {
    result = PMGuidSearch((uint64_t)v13, v79, v82);
    if (!(_DWORD)result)
    {
      v15 = a3;
      v16 = a4;
      v17 = a5;
      v18 = *v13;
      v19 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Media Block Size"));
      if (v19)
        CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(v18 + 518));
      v20 = *(unsigned __int16 *)(v18 + 2) >> 9;
      v21 = (void *)(v18 + 1072 * SLOWORD(v82[0]) + 528);
      PMPrimaryInfoUpdate(a1, *(__int16 *)(v18 + 514), v20, v21, 0);
      result = PMSecondaryInfoUpdate(a1, v20, (uint64_t)v21, 0);
      a5 = v17;
      a4 = v16;
      a3 = v15;
    }
    if (!(_DWORD)result)
    {
      UUID = 0;
      v77 = 0;
      v76 = 0;
      v82[1] = 0;
      v82[0] = 0;
      memset(v80, 0, 464);
      memset(v79, 0, sizeof(v79));
      v75 = 0;
      if (v10)
      {
        v22 = MKLoadDB(v10, CFSTR("inventory"), (int *)&UUID);
        if (!v22)
          return UUID;
        v23 = v22;
        v24 = MKLoadDB(v10, CFSTR("database"), (int *)&UUID);
        if (!v24)
          return UUID;
        v25 = v24;
        UUID = MKPurgeLoaders(v10, v13, &v75);
        if (UUID)
          return UUID;
        v70 = a6;
        v71 = v25;
        cf = v23;
        v69 = a5;
      }
      else
      {
        v69 = a5;
        v70 = a6;
        cf = 0;
        v71 = 0;
      }
      theArray = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
      Count = CFArrayGetCount(theArray);
      UUID = 0;
      v72 = Count;
      if (Count >= 1)
      {
        v27 = 0;
        valuePtr = (void *)((unint64_t)v79 | 0xC);
        value = (void *)*MEMORY[0x24BDBD270];
        while (2)
        {
          v28 = v27;
          while (1)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v28);
            if (!ValueAtIndex)
              goto LABEL_84;
            v30 = ValueAtIndex;
            v31 = *(unsigned __int16 *)(*v13 + 2) >> 9;
            UUID = PMPrimaryInfoUpdate(ValueAtIndex, *(__int16 *)(*v13 + 514), v31, v79, 1);
            if (UUID)
              goto LABEL_84;
            v32 = &APMDescriptors;
            while (*v32 != v81)
            {
              v33 = *((_QWORD *)v32 + 3);
              v32 += 8;
              if (!v33)
              {
                v32 = (__int16 *)&unk_24CEC1AB8;
                break;
              }
            }
            if (((1 << v32[1]) & 0x3A) == 0)
              break;
            if (++v28 >= v72)
              goto LABEL_84;
          }
          UUID = CFDictionaryGetUUID(v30, CFSTR("GUID"), (unsigned __int8 *)v82);
          if (!UUID)
            UUID = PMGuidSearch((uint64_t)v13, v82, &v77);
          v34 = (const __CFDictionary *)CFDictionaryGetValue(v30, CFSTR("Options"));
          v36 = v34;
          theDict = v34;
          if (v34)
          {
            v65 = MKCFOptionBit(v34, CFSTR("Allocate Remaining Space"), 0x400000);
            LODWORD(v36) = MKCFOptionBit(v36, CFSTR("Direct Mode"), 0x20000000) | v65;
            v37 = UUID;
            if (UUID == -5343 && (v36 & 0x400000) != 0)
            {
LABEL_41:
              v38 = APMCFCreatePartition(a1, v30, v10, cf, v35, a3, a4, v69, v70);
              UUID = v38;
              goto LABEL_42;
            }
          }
          else
          {
            v37 = UUID;
          }
          if (v37)
          {
            if (v37 != -5343 || HIDWORD(v79[0]) == -DWORD2(v79[0]))
              goto LABEL_84;
            goto LABEL_41;
          }
          if (!(DWORD2(v79[0]) + HIDWORD(v79[0])))
          {
            if ((v36 & 0x20000000) != 0)
            {
              v27 = v28;
            }
            else
            {
              UUID = MKPurgeLoader(v71, cf, (const void **)v13, v77, 0, theArray, v28, &v76);
              if (UUID)
                goto LABEL_84;
              v27 = v28 + (v76 >> 31);
              v72 -= v76 != 0;
              v38 = PMGuidSearch((uint64_t)v13, v82, &v77);
              UUID = v38;
              LODWORD(v28) = v27;
              if (v38)
                goto LABEL_42;
            }
            v38 = PMRemovePartition((const void **)v13, (unsigned __int16)v77, 1);
            UUID = v38;
            if (!v38)
            {
              CFArrayRemoveValueAtIndex(theArray, v27);
              v39 = --v72;
LABEL_44:
              if (v27 < v39)
                continue;
              goto LABEL_84;
            }
            LODWORD(v28) = v27;
            goto LABEL_42;
          }
          break;
        }
        v40 = *v13 + 1072 * v77;
        if ((*(_BYTE *)(v40 + 996) & 0x10) != 0)
        {
LABEL_43:
          v27 = v28 + 1;
          v39 = v72;
          goto LABEL_44;
        }
        v41 = *((_QWORD *)&v79[0] + 1);
        v66 = *v13;
        v60 = v77;
        v62 = (unsigned __int16)v77;
        v58 = (_DWORD *)(v40 + 528);
        if (!strncasecmp((const char *)(v40 + 576), (const char *)v80, 0x20uLL))
        {
          v43 = HIDWORD(v41);
          theDicta = v58[21];
          v56 = v58[3];
          v57 = a4;
          if (HIDWORD(v41))
          {
            v44 = v62;
            v45 = v41;
          }
          else
          {
            if ((int)(v60 + 1) >= *(unsigned __int16 *)(v66 + 522))
            {
              v48 = *(_DWORD *)(v66 + 4);
            }
            else
            {
              v47 = v66 + 1072 * (int)(v60 + 1);
              v48 = *(_DWORD *)(v47 + 536);
              if (*(_WORD *)(v47 + 1082) == 24320)
                v48 += *(_DWORD *)(v47 + 540);
            }
            HIDWORD(v79[0]) = (v48 - v58[2]) / a3 * a3;
            v49 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
            CFDictionarySetValue(v30, CFSTR("Size"), v49);
            CFRelease(v49);
            v45 = DWORD2(v79[0]);
            v43 = HIDWORD(v79[0]);
            v44 = v77;
          }
          v38 = SValidate(v13, v45, v43, v44);
          UUID = v38;
          if (!v38)
          {
            v50 = v58[3];
            v51 = HIDWORD(v79[0]);
            v52 = v50 - HIDWORD(v79[0]);
            if (v50 < HIDWORD(v79[0]))
              v52 = 0;
            v59 = DWORD2(v79[0]);
            v61 = v52;
            if (theDicta == v56)
            {
              v53 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
              CFDictionarySetValue(v30, CFSTR("Logical Size"), v53);
              CFRelease(v53);
            }
            UUID = PMPrimaryInfoUpdate(v30, *(__int16 *)(v66 + 514), v31, v58, 0);
            v38 = PMSecondaryInfoUpdate(v30, v31, (uint64_t)v58, 0);
            UUID = v38;
            if (v51 < v50)
            {
              v54 = v77 + 1;
              if (*(unsigned __int16 *)(v66 + 522) > (__int16)(v77 + 1)
                && *(_WORD *)(v66 + 1072 * v54 + 1082) == 24320)
              {
                v55 = v66 + 1072 * v54;
                *(_DWORD *)(v55 + 536) -= v61;
                *(_DWORD *)(v55 + 540) += v61;
                v38 = UUID;
              }
              else
              {
                v38 = PMGenPartitionType((const void **)v13, 24320, v59 + v51, v61, *(unsigned __int16 *)(v66 + 2), 0x200000, 0, 0, v77);
                UUID = v38;
              }
            }
            a4 = v57;
          }
        }
        else
        {
          if ((v36 & 0x20000000) != 0)
          {
            v42 = v62;
          }
          else
          {
            UUID = MKPurgeLoader(v71, cf, (const void **)v13, v60, 0, theArray, v28, &v76);
            if (UUID)
              goto LABEL_84;
            LODWORD(v28) = v28 + (v76 >> 31);
            v72 -= v76 != 0;
            v38 = PMGuidSearch((uint64_t)v13, v82, &v77);
            UUID = v38;
            if (v38)
              goto LABEL_42;
            v42 = (unsigned __int16)v77;
          }
          v38 = PMRemovePartition((const void **)v13, v42, 0);
          UUID = v38;
          if (!v38)
          {
            Mutable = theDict;
            if (!theDict)
            {
              Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              CFDictionaryAddValue(v30, CFSTR("Options"), Mutable);
              CFRelease(Mutable);
            }
            CFDictionarySetValue(Mutable, CFSTR("Retain existing content"), value);
            goto LABEL_41;
          }
        }
LABEL_42:
        if (v38)
          goto LABEL_84;
        goto LABEL_43;
      }
LABEL_84:
      if (cf)
        CFRelease(cf);
      if (v71)
        CFRelease(v71);
      return UUID;
    }
  }
  return result;
}

uint64_t PMGuidSearch(uint64_t a1, _QWORD *a2, _WORD *a3)
{
  uint64_t v3;
  _QWORD *i;
  __int16 v6;

  *a3 = 0x8000;
  if (a1)
  {
    if (*(_WORD *)(*(_QWORD *)a1 + 522))
    {
      v3 = 0;
      for (i = (_QWORD *)(*(_QWORD *)a1 + 976); *a2 != *i || a2[1] != i[1]; i += 134)
      {
        if (*(unsigned __int16 *)(*(_QWORD *)a1 + 522) == ++v3)
          return -5343;
      }
      v6 = 0;
      *a3 = v3;
    }
    else
    {
      return -5343;
    }
  }
  else
  {
    return 22;
  }
  return v6;
}

uint64_t MKPurgeLoaders(__CFBundle *a1, uint64_t *a2, BOOL *a3)
{
  __CFBundle *v5;
  __CFBundle *v6;
  const __CFURL *v7;
  const __CFURL *v8;
  const __CFURL *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;
  const char *v15;
  CFStringRef v16;
  const __CFDictionary *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  const __CFDictionary *v28;
  unsigned int v29;
  uint64_t result;
  __CFBundle *v31;
  __CFBundle *v32;
  const __CFDictionary *theDict;
  const __CFDictionary *cf;
  int v35;
  int v36;
  const __CFDictionary *Value;
  _BYTE v38[154];
  unsigned int v39;
  _OWORD v40[5];
  __int128 v41;
  uint64_t v42;
  uint64_t v43;

  v5 = a1;
  v43 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v41 = 0u;
  memset(v40, 0, sizeof(v40));
  v39 = 22;
  v6 = a1;
  memset(v38, 0, sizeof(v38));
  if (!a1)
  {
    v6 = MKAccessLibrary(0);
    if (!v6)
    {
      v12 = 0;
      goto LABEL_58;
    }
  }
  v7 = MKLoadDB(v6, CFSTR("database"), (int *)&v39);
  if (!v7)
  {
    v12 = 0;
    if (!v5)
      goto LABEL_57;
    goto LABEL_58;
  }
  v8 = v7;
  v9 = MKLoadDB(v6, CFSTR("inventory"), (int *)&v39);
  if (!v9)
  {
    v12 = 0;
    v28 = v8;
    goto LABEL_56;
  }
  theDict = v9;
  cf = v8;
  v31 = v6;
  v32 = v5;
  v10 = *a2;
  if (!*(_WORD *)(*a2 + 522))
  {
    v12 = 0;
    goto LABEL_55;
  }
  v11 = 0;
  v12 = 0;
  while (1)
  {
    v13 = v10 + 1072 * v11;
    if (PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v13 + 1082)) != 2)
      goto LABEL_46;
    v39 = MKGetPartitionRequisites(cf, *(__int16 *)(v10 + 514), (const char *)(v10 + 1072 * v11 + 576), *(unsigned __int16 *)(v13 + 1082), v38);
    if (v39)
      goto LABEL_55;
    Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Loaders"));
    if (!Value)
      break;
    if (*(_WORD *)v38)
    {
      v14 = 0;
      v15 = &v38[2];
      while (1)
      {
        v16 = CFStringCreateWithCString(0, v15, 0);
        v17 = (const __CFDictionary *)CFDictionaryGetValue(Value, v16);
        CFRelease(v16);
        if (!v17)
        {
          v29 = -415;
          goto LABEL_54;
        }
        v39 = MKGetPartitionInfo(v17, *(__int16 *)(v10 + 514), (uint64_t)v40);
        if (v39)
          goto LABEL_55;
        v18 = *((unsigned __int16 *)v15 + 17);
        if (v18 == 1)
          break;
        if (v18 == 6)
        {
          v19 = v11 + 1;
          if (v11 + 1 < *(unsigned __int16 *)(v10 + 522))
          {
            v35 = 0;
            v20 = v11;
            while (1)
            {
              v21 = v10 + 1072 * v19;
              v22 = PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v21 + 1082));
              if (v22 != 4)
              {
                v20 = v19;
                if (v22 == 2)
                  goto LABEL_42;
                goto LABEL_26;
              }
              v23 = v21 + 528;
              if (!strcasecmp((const char *)(v23 + 48), (const char *)&v40[2] + 1)
                && *(_DWORD *)(v23 + 12) == DWORD2(v41))
              {
                if (!v35)
                {
                  v35 = 1;
                  v20 = v19;
                  goto LABEL_26;
                }
                ++v35;
              }
              v39 = PMSetTypeExtended(v23, 24320, *(__int16 *)(v10 + 514), "");
              *(_DWORD *)(v10 + 1072 * v19 + 996) &= ~0x20u;
              ++v12;
LABEL_26:
              v19 = v20 + 1;
              if (v20 + 1 >= *(unsigned __int16 *)(v10 + 522))
                goto LABEL_42;
            }
          }
          goto LABEL_42;
        }
LABEL_43:
        ++v14;
        v15 += 38;
        if (v14 >= *(unsigned __int16 *)v38)
          goto LABEL_46;
      }
      if (v11 < 2)
      {
LABEL_42:
        if (v39)
          goto LABEL_55;
        goto LABEL_43;
      }
      v36 = 0;
      v24 = v11;
      while (1)
      {
        v25 = v10 + 1072 * (v24 - 1);
        v26 = PMCategorize(*(__int16 *)(v10 + 514), *(unsigned __int16 *)(v25 + 1082));
        if (v26 != 4)
        {
          --v24;
          if (v26 == 2)
            goto LABEL_42;
          goto LABEL_39;
        }
        v27 = v25 + 528;
        if (!strcasecmp((const char *)(v27 + 48), (const char *)&v40[2] + 1) && *(_DWORD *)(v27 + 12) == DWORD2(v41))
        {
          if (!v36)
          {
            v36 = 1;
            --v24;
            goto LABEL_39;
          }
          ++v36;
        }
        v39 = PMSetTypeExtended(v27, 24320, *(__int16 *)(v10 + 514), "");
        *(_DWORD *)(v10 + 1072 * (v24 - 1) + 996) &= ~0x20u;
        --v11;
        ++v12;
LABEL_39:
        if (v24 <= 1)
          goto LABEL_42;
      }
    }
    if (v39)
      goto LABEL_55;
LABEL_46:
    if (++v11 >= *(unsigned __int16 *)(v10 + 522))
      goto LABEL_55;
  }
  v29 = -417;
LABEL_54:
  v39 = v29;
LABEL_55:
  CFRelease(cf);
  v5 = v32;
  v6 = v31;
  v28 = theDict;
LABEL_56:
  CFRelease(v28);
  if (!v5)
LABEL_57:
    CFRelease(v6);
LABEL_58:
  if (a3)
    *a3 = v12 != 0;
  result = v39;
  if (v39 == -1)
    return *__error();
  return result;
}

uint64_t MKMediaUpdateExtended(uint64_t *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, char a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t), _WORD *a8)
{
  unsigned int v9;
  __int16 v11;
  __CFBundle *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  const __CFArray *Value;
  uint64_t v18;
  uint64_t v19;
  BOOL v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *);
  uint64_t v24;
  int v25;
  unsigned int v26;
  CFStringRef v27;
  const __CFDictionary *v28;
  const __CFDictionary *v29;
  const __CFArray *v31;
  __CFBundle *v32;
  _WORD *v33;
  BOOL v34;
  const __CFDictionary *theDict;
  unsigned int v40;
  char v41[16];
  uint64_t v42;

  v9 = 0;
  v42 = *MEMORY[0x24BDAC8D0];
  v40 = 22;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_41;
  }
  v11 = 0;
  if (!a2)
    goto LABEL_41;
  v40 = -43;
  v14 = a3;
  if (a3 || (v14 = MKAccessLibrary(0)) != 0)
  {
    v15 = MKLoadDB(v14, CFSTR("inventory"), (int *)&v40);
    v16 = v15;
    v32 = a3;
    v33 = a8;
    if (v15)
    {
      v40 = 0;
      theDict = (const __CFDictionary *)CFDictionaryGetValue(v15, CFSTR("Drivers"));
      Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Patches"));
      v18 = *a1;
      if (*(_WORD *)(*a1 + 522))
      {
        v19 = 0;
        v11 = 0;
        v9 = 0;
        v31 = Value;
        v21 = (a5 & 1) == 0 || Value == 0;
        v34 = v21;
        v22 = v18 + 576;
        v24 = a6;
        v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
        while (1)
        {
          v25 = *(unsigned __int16 *)(v22 + 506);
          if (v25 == 14336)
          {
            if ((a5 & 2) == 0)
              goto LABEL_27;
            v26 = MKUpdateLoader(a1, (__int16)v19, v14, v16, v24, v23);
          }
          else
          {
            if (v25 == 12544)
            {
              if (!v34)
              {
                v26 = RebuildPatches(a1, (__int16)v19, v16, v31, v14, a4, v24, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))v23);
                v40 = v26;
                if (v26)
                  goto LABEL_28;
                goto LABEL_29;
              }
LABEL_27:
              v26 = v40;
              if (v40)
              {
LABEL_28:
                if (v26 != -1306)
                  goto LABEL_34;
                goto LABEL_29;
              }
              goto LABEL_29;
            }
            if (!theDict || !PMDrvrIdentify((char *)v22))
              goto LABEL_27;
            OSType2Ascii(*(unsigned int *)(v22 + 88), v41, 2);
            v27 = CFStringCreateWithFormat(0, 0, CFSTR("%s.%s"), v22, v41);
            v28 = (const __CFDictionary *)CFDictionaryGetValue(theDict, v27);
            CFRelease(v27);
            if (!v28)
            {
              v9 = -415;
              v24 = a6;
              v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
              goto LABEL_30;
            }
            v29 = v28;
            v24 = a6;
            v23 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))a7;
            v26 = MKBuildDriver((Ptr *)a1, v29, v14, a4, a6, a7);
          }
          v40 = v26;
          if (v26)
            goto LABEL_28;
          ++v11;
LABEL_29:
          v40 = 0;
LABEL_30:
          v22 += 1072;
          if (++v19 >= (unint64_t)*(unsigned __int16 *)(v18 + 522))
            goto LABEL_34;
        }
      }
    }
    v9 = 0;
    v11 = 0;
LABEL_34:
    if (!v32 && v14)
      CFRelease(v14);
    a8 = v33;
    if (v16)
    {
      CFRelease(v16);
      if (!v33)
        goto LABEL_43;
LABEL_42:
      *a8 = v11;
      goto LABEL_43;
    }
LABEL_41:
    if (!a8)
      goto LABEL_43;
    goto LABEL_42;
  }
  v9 = 0;
  v11 = 0;
  if (a8)
    goto LABEL_42;
LABEL_43:
  if (v40)
    return v40;
  else
    return v9;
}

uint64_t APMWriteMedia(Handle h, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  unsigned int v5;
  SInt8 v8;
  Ptr v9;
  unsigned int v10;
  __int16 v11;
  char v12;
  int v13;
  unsigned __int16 v14;
  int v15;
  int v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  unsigned __int16 v22;
  int v23;
  unsigned __int16 v24;
  __int16 v25;
  unsigned __int16 *v26;
  unint64_t v27;
  int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned __int16 v33;
  unsigned __int16 v34;
  int v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int16 v40;
  unsigned int v41;
  int v42;
  int v43;
  Ptr v44;
  int *v45;
  uint64_t v46;
  __int16 v47;
  signed int v48;
  BOOL v49;
  int v50;
  char *v51;
  _WORD *v52;
  int v53;
  unint64_t v54;
  int v55;
  _WORD *v56;
  uint64_t v57;
  __int16 v58;
  BOOL v59;
  uint64_t v60;
  __int16 v61;
  int v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  int v67;
  int *v68;
  int *v69;
  unsigned int v70;
  int v71;
  int v72;
  int *v73;
  int v74;
  int v75;
  unsigned __int16 v76;
  __int16 v77;
  __int16 v78;
  char *v79;
  int v80;
  int v81;
  _BOOL4 v82;
  unsigned int v83;
  char *v84;
  int v85;
  unsigned int v87;
  uint64_t v88;
  char *v89;
  int v90;
  int v91;
  int v92;
  int v93;
  uint64_t v94;
  int v95;
  BOOL v96;
  __int16 v97;
  int *v98;
  unsigned int v99;
  int v100;
  unsigned __int16 v101;
  int v102;
  int v103;
  _BOOL4 v104;
  int v105;
  unsigned __int16 v106;
  unsigned int v107;
  unsigned int v108;
  uint64_t (*v109)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr);
  int v110;
  Ptr v111;
  int v112;
  unsigned int v113;
  unsigned int v114;
  int v115;
  int v116;
  SInt8 v117;
  uint64_t v118;
  unint64_t v119[2];
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint64_t v183;
  uint64_t v184;

  v184 = *MEMORY[0x24BDAC8D0];
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v127 = 0u;
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v120 = 0u;
  if (!h)
    return -109;
  v183 = 0;
  v181 = 0uLL;
  v182 = 0uLL;
  v179 = 0uLL;
  v180 = 0uLL;
  v177 = 0uLL;
  v178 = 0uLL;
  v175 = 0uLL;
  v176 = 0uLL;
  v173 = 0uLL;
  v174 = 0uLL;
  v171 = 0uLL;
  v172 = 0uLL;
  v169 = 0uLL;
  v170 = 0uLL;
  v167 = 0uLL;
  v168 = 0uLL;
  v165 = 0uLL;
  v166 = 0uLL;
  v163 = 0uLL;
  v164 = 0uLL;
  v161 = 0uLL;
  v162 = 0uLL;
  v159 = 0uLL;
  v160 = 0uLL;
  v157 = 0uLL;
  v158 = 0uLL;
  v155 = 0uLL;
  v156 = 0uLL;
  v153 = 0uLL;
  v154 = 0uLL;
  v152 = 0uLL;
  v118 = 0;
  v119[0] = 0;
  if (a2 == 0xFFFF)
    v5 = 16;
  else
    v5 = a2;
  v119[1] = 0;
  if ((v5 & 0x100) != 0)
  {
    v8 = 0;
    goto LABEL_11;
  }
  v8 = HGetState(h);
  v9 = *h;
  v10 = *((unsigned __int16 *)*h + 257);
  if (!*((_WORD *)*h + 257))
  {
    v10 = 1;
    *((_WORD *)v9 + 257) = 1;
    goto LABEL_13;
  }
  if (v10 > 3)
  {
LABEL_11:
    v11 = -50;
    goto LABEL_17;
  }
LABEL_13:
  v12 = v9[516];
  v13 = a4(a3, 15, 0, 0, 0, (Ptr)&v118);
  if (v13)
  {
    v11 = v13;
    goto LABEL_17;
  }
  v117 = v8;
  v14 = WORD2(v118);
  MKScaleGeometry(v119, (int *)&v118 + 1);
  PMSortMapII(h, 0);
  v15 = VRebuildFreespace((const void **)h, v5, (uint64_t)&v118);
  if (v15)
  {
    v11 = v15;
    v8 = v117;
    goto LABEL_17;
  }
  v17 = v12 & 1;
  v18 = (unsigned __int16 *)*h;
  v18[250] = v14 >> 9;
  v19 = v18[1];
  v20 = v18[259];
  v21 = v18[261];
  if (v18[261])
  {
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    v8 = v117;
    while (1)
    {
      v26 = &v18[536 * v25];
      v27 = *((unsigned int *)v26 + 154);
      if ((v12 & 1) != 0)
      {
        v28 = byte_212DE40D8[(v27 >> 24) & 3];
        if (v28 == 2)
        {
          ++v22;
          goto LABEL_24;
        }
        if (v28 == 1)
        {
          ++v23;
          goto LABEL_24;
        }
        if (v28)
          goto LABEL_24;
      }
      else
      {
        *((_DWORD *)v26 + 154) = v27 & 0xFCFFFFFF;
      }
      ++v24;
LABEL_24:
      if (v21 <= ++v25)
        goto LABEL_33;
    }
  }
  v24 = 0;
  LOWORD(v23) = 0;
  v22 = 0;
  v8 = v117;
LABEL_33:
  v29 = v20 >> 9;
  if ((v12 & 1) == 0)
  {
    if (v18[260] >= v24)
    {
      v113 = v20 >> 9;
      v114 = 0;
      v43 = 0;
      v104 = 0;
      v107 = v20 >> 9;
      goto LABEL_62;
    }
LABEL_60:
    v11 = -5341;
    goto LABEL_17;
  }
  if (v29 != 4 && v29 != 1)
  {
    v11 = -5319;
    goto LABEL_17;
  }
  if (v29 == 1)
    v30 = 4;
  else
    v30 = 1;
  if (v30 >= v29)
    v31 = v29;
  else
    v31 = v30;
  v113 = v31;
  if (v30 <= v29)
    v32 = v29;
  else
    v32 = v30;
  v104 = v10 < 2;
  v33 = v23 + v24;
  v34 = v22 + v23;
  v35 = ((unsigned __int16)(v23 + v24) - 1) / (int)(v32 - 1);
  v36 = v23 + v24 + v35;
  v37 = v22 + v23 + v35;
  v49 = (__int16)(v35 - v23) < 1;
  v38 = v24 + v35;
  v39 = v22 + v35;
  if (v49)
  {
    v38 = v33;
    v40 = v34;
  }
  else
  {
    v40 = v39;
  }
  if (v10 <= 1)
    v24 = v38;
  else
    v24 = v36;
  if (v10 <= 1)
    v22 = v40;
  else
    v22 = v37;
  v41 = v24 + 1;
  if (v41 % v32)
    v42 = v41 / v32 + 1;
  else
    v42 = v41 / v32;
  if (v18[260] < v22)
    goto LABEL_60;
  v114 = v32;
  v107 = v29;
  v43 = v42 - 1;
LABEL_62:
  v99 = v19;
  v103 = v17;
  v106 = v22;
  HLock(h);
  v44 = *h;
  v111 = *h;
  if (!*((_WORD *)*h + 261))
  {
    v45 = 0;
    v112 = 0;
    goto LABEL_110;
  }
  v115 = v43;
  v45 = 0;
  v112 = 0;
  v46 = 0;
  v47 = 0;
  v100 = v24;
  v48 = v114;
  if (v103)
    v49 = v114 > 1;
  else
    v49 = 0;
  v50 = v49;
  v102 = v50;
  v101 = v24;
  v109 = a4;
  while (1)
  {
    v51 = &v44[1072 * v47];
    v52 = v51 + 1032;
    *((_DWORD *)v51 + 258) = -1;
    v53 = *((unsigned __int16 *)v51 + 541);
    v54 = *((unsigned int *)v51 + 154);
    v55 = byte_212DE40D8[(v54 >> 24) & 3];
    if (v55 == 2)
    {
      *v52 = ++v115 * v48 - 1;
    }
    else
    {
      v56 = v51 + 1034;
      if (v55 == 1)
      {
        if (v104 && (v53 != 4097 ? (v59 = (__int16)((v112 + 1) * v48 - 1) < v100) : (v59 = 0), v59))
        {
          *v56 = ++v112 * v48 - 1;
        }
        else
        {
          v60 = (v46 + 1);
          v61 = (v46 + 1) * v113 - 1;
          if (v48 >= 2 && !((v61 + 1) % v48))
          {
            v60 = (v46 + 2);
            v61 = (v46 + 2) * v113 - 1;
          }
          *v56 = v61;
          *v52 = ++v115 * v48 - 1;
          v46 = v60;
        }
      }
      else if (!byte_212DE40D8[(v54 >> 24) & 3])
      {
        v57 = (v46 + 1);
        v58 = (v46 + 1) * v113 - 1;
        if (v102 && !((v58 + 1) % v48))
        {
          v57 = (v46 + 2);
          v58 = (v46 + 2) * v113 - 1;
        }
        *v56 = v58;
        v46 = v57;
      }
    }
    if ((v54 & 0x100000) == 0 || v53 == 4097)
      goto LABEL_106;
    if (!v45)
      break;
    v62 = *v45;
LABEL_95:
    v64 = v45[1];
    v65 = v64 + 1;
    if (v64 + 1 >= v62)
    {
      v66 = v46;
      v67 = v62 + 32;
      v68 = v45;
      v45 = (int *)malloc_type_realloc(v45, 8 * (v62 + 32) + 8, 0x786A645AuLL);
      if (!v45)
        goto LABEL_172;
      *v45 = v67;
      v64 = v45[1];
      v65 = v64 + 1;
      v24 = v101;
      v48 = v114;
      v46 = v66;
      a4 = v109;
      v44 = v111;
    }
    v45[1] = v65;
    v69 = &v45[2 * v64];
    v70 = *((_DWORD *)v51 + 135);
    if (v70 >= 0xC8)
      v71 = 200;
    else
      v71 = *((_DWORD *)v51 + 135);
    v69[3] = v71;
    v72 = *((_DWORD *)v51 + 134);
    v69[2] = v72;
    if (v70 >= 0xC9)
    {
      v45[1] = v64 + 2;
      v73 = &v45[2 * v65];
      if (v70 - 200 >= 0xC8)
        v74 = 200;
      else
        v74 = v70 - 200;
      v73[2] = v72 + v70 - v74;
      v73[3] = v74;
    }
LABEL_106:
    if (*((unsigned __int16 *)v44 + 261) <= ++v47)
      goto LABEL_110;
  }
  v63 = v46;
  v45 = (int *)malloc_type_calloc(1uLL, 0x108uLL, 0x467D371FuLL);
  if (v45)
  {
    v62 = 32;
    *v45 = 32;
    v48 = v114;
    v46 = v63;
    a4 = v109;
    goto LABEL_95;
  }
  v68 = 0;
LABEL_172:
  v75 = *__error();
  if ((_WORD)v75)
  {
    v77 = 0;
    v8 = v117;
    goto LABEL_178;
  }
  v45 = v68;
  v24 = v101;
  a4 = v109;
  v44 = v111;
LABEL_110:
  v98 = v45;
  if ((v5 & 0x20000) != 0)
    APMDDMGenerate(v44, v103, v99 >> 9, v107);
  PMDDMNormalise((uint64_t)h, v99 >> 9, v107);
  v75 = a4(a3, 4, 512, 0, (__int16)(*((_WORD *)v44 + 260) - ((v5 & 0x8000000) >> 27)), 0);
  v8 = v117;
  v76 = v106;
  if (v75)
  {
    v77 = 0;
    v68 = v98;
  }
  else
  {
    v105 = v99 >> 9;
    if ((v5 & 0x8000000) == 0)
      a4(a3, 4, WORD2(v118), (LODWORD(v119[0]) - 1), 1, 0);
    if (*((_WORD *)v44 + 261))
    {
      v78 = 0;
      v97 = 0;
      while (1)
      {
        v116 = v78;
        v79 = &v44[1072 * v78];
        v80 = *((unsigned __int16 *)v79 + 541);
        v110 = *((_DWORD *)v79 + 154);
        *((_DWORD *)v79 + 249) &= ~0x10u;
        apmirec2xrec((uint64_t)(v79 + 528), (uint64_t)&v152);
        if (v80 == 4097 && (BYTE10(v157) & 0x80) != 0)
          HIDWORD(v183) = 1297238867;
        strclean(&v153, 0x20uLL, 0);
        strclean(&v155, 0x20uLL, 0);
        strclean((_BYTE *)&v159 + 8, 0x10uLL, 0);
        v81 = *(unsigned __int16 *)&v44[1072 * v116 + 1034];
        if ((v81 & 0x8000) != 0)
        {
          v83 = v99 >> 9;
        }
        else
        {
          v108 = v81 + 1;
          if (v103)
            v82 = (unsigned __int16)(v81 + 1) % v114 == 0;
          else
            v82 = 0;
          v83 = DiskBlockFactor(v10, v82, v80, v113, v114, v107);
          APMConvertBlocking(&v152, v80, v105, v83);
          if (v80 == 12544 && ((v110 & 0x1000000) == 0 || v83 == v107))
            v97 = PMPTCHQuantify((uint64_t)&v152, v83, v83, a3, a4);
          DWORD1(v152) = v24;
          if (*(_QWORD *)&v44[1072 * v116 + 968])
            v84 = *(char **)&v44[1072 * v116 + 968];
          else
            v84 = (char *)&v120;
          PMRecord_NtoB((uint64_t)v84, (uint64_t)&v152);
          v75 = a4(a3, 3, 512, v108, 1, v84);
          if (v75)
          {
            v8 = v117;
            goto LABEL_176;
          }
          v76 = v106;
        }
        v85 = *(__int16 *)&v44[1072 * v116 + 1032];
        if (v85 < 0)
        {
          v8 = v117;
          v44 = v111;
        }
        else
        {
          if (v80 == 24320 && v10 == 1)
            v87 = v113;
          else
            v87 = v114;
          APMConvertBlocking(&v152, v80, v83, v87);
          if (v80 == 12544)
          {
            v8 = v117;
            if ((v110 & 0x1000000) == 0 || v87 == v107)
              v97 = PMPTCHQuantify((uint64_t)&v152, v87, v87, a3, a4);
          }
          else
          {
            v8 = v117;
          }
          v88 = (unsigned __int16)v85 + 1;
          DWORD1(v152) = v106;
          v44 = v111;
          if (*(_QWORD *)&v111[1072 * v116 + 968])
            v89 = *(char **)&v111[1072 * v116 + 968];
          else
            v89 = (char *)&v120;
          PMRecord_NtoB((uint64_t)v89, (uint64_t)&v152);
          v75 = a4(a3, 3, 512, v88, 1, v89);
          if (v75)
            goto LABEL_176;
          v76 = v106;
        }
        v78 = v116 + 1;
        if (*((unsigned __int16 *)v44 + 261) <= (__int16)(v116 + 1))
          goto LABEL_156;
      }
    }
    v97 = 0;
LABEL_156:
    if (v103)
    {
      v183 = 0;
      v181 = 0u;
      v182 = 0u;
      v179 = 0u;
      v180 = 0u;
      v177 = 0u;
      v178 = 0u;
      v175 = 0u;
      v176 = 0u;
      v173 = 0u;
      v174 = 0u;
      v171 = 0u;
      v172 = 0u;
      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v163 = 0u;
      v164 = 0u;
      v161 = 0u;
      v162 = 0u;
      v159 = 0u;
      v160 = 0u;
      v157 = 0u;
      v158 = 0u;
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v90 = v24;
      v91 = v76;
      v152 = 0u;
      if (v76 <= v24)
        v91 = v24;
      DWORD1(v152) = v91;
      strncpypad(&v155, "Apple_Free", 0x20uLL, 0);
      while (1)
      {
        v92 = (__int16)(++v112 * v114 - 1);
        if (v92 >= v90)
          break;
        PMRecord_NtoB((uint64_t)&v120, (uint64_t)&v152);
        v75 = a4(a3, 3, 512, (v92 + 1), 1, (Ptr)&v120);
        if (v75)
          goto LABEL_176;
      }
    }
    v68 = v98;
    if (v98 && v98[1] >= 1)
    {
      v93 = 0;
      v94 = 2;
      while (1)
      {
        v75 = a4(a3, 4, (unsigned __int16)v99 & 0xFE00, v98[v94], v98[v94 + 1], 0);
        if (v75)
          break;
        ++v93;
        v94 += 2;
        if (v93 >= v98[1])
          goto LABEL_168;
      }
    }
    else
    {
LABEL_168:
      v95 = *((unsigned __int16 *)v111 + 259);
      if (*((unsigned __int16 *)v111 + 1) != v95)
      {
        *((_DWORD *)v111 + 1) = *((_DWORD *)v111 + 1) * v105 / v107;
        *((_WORD *)v111 + 1) = v95;
      }
      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v146 = 0u;
      v147 = 0u;
      v144 = 0u;
      v145 = 0u;
      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v138 = 0u;
      v139 = 0u;
      v136 = 0u;
      v137 = 0u;
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      v130 = 0u;
      v131 = 0u;
      v128 = 0u;
      v129 = 0u;
      v127 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v120 = 0u;
      DDMRecord_NtoB((uint64_t)&v120, (unsigned __int16 *)v111);
      LOWORD(v75) = a4(a3, 3, 512, 0, 1, (Ptr)&v120);
LABEL_176:
      v68 = v98;
    }
    v77 = v97;
  }
LABEL_178:
  if ((_WORD)v75)
    v96 = 1;
  else
    v96 = v77 == 0;
  if (v96)
    v11 = v75;
  else
    v11 = v77;
  if (v68)
    free(v68);
LABEL_17:
  HSetState(h, v8);
  return v11;
}

uint64_t VRebuildFreespace(const void **a1, unsigned int a2, uint64_t a3)
{
  unsigned int v6;
  _BOOL4 v7;
  int v8;
  int v9;

  if (a1)
  {
    PMDeleteRecords(a1, word_212DE46B2);
    PMSortMapII((Ptr *)a1, 0);
    v6 = *((unsigned __int16 *)*a1 + 258);
    v7 = (a2 & 0x4000) == 0;
    v8 = v7 & v6;
    if ((a2 & 0x10) == 0)
      return DeviceAdjustSpace(a1, v8, a3, a2);
    v9 = PMAccountFreespace(a1, v7 & v6, a2);
    if (!v9)
      return DeviceAdjustSpace(a1, v8, a3, a2);
  }
  else
  {
    LOWORD(v9) = -109;
  }
  return (__int16)v9;
}

uint64_t PMDeleteRecords(const void **a1, _WORD *a2)
{
  unsigned __int16 v4;
  unsigned __int16 v5;
  unsigned __int16 *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int16 *v9;

  v4 = 0;
  v5 = 0;
  v6 = a2 + 1;
  while (*((unsigned __int16 *)*a1 + 261) > v5)
  {
    v7 = (unsigned __int16)*a2;
    if (!*a2)
      goto LABEL_9;
    v8 = 0;
    v9 = v6;
    while (*((unsigned __int16 *)*a1 + 536 * v5 + 541) != *v9)
    {
      ++v8;
      ++v9;
      if (v8 >= v7)
      {
        v7 = 0;
        goto LABEL_9;
      }
    }
    v7 = (unsigned __int16)delentry(a1, 528, 0x20Au, v5, 1072);
    if (!v7)
    {
      ++v4;
    }
    else
    {
LABEL_9:
      ++v5;
      if (v7)
        return v4;
    }
  }
  return v4;
}

uint64_t DeviceAdjustSpace(const void **a1, int a2, uint64_t a3, int a4)
{
  int v6;
  unsigned int v7;
  _WORD *v8;
  unsigned int v9;
  BOOL v10;
  __int16 v11;
  unsigned __int16 v13;
  char *v14;
  unsigned int v15;
  unsigned int v16;
  char *v17;
  int v18;
  BOOL v19;
  unsigned int v20;

  if ((a4 & 0x40000008) != 0)
  {
    if (a1)
    {
      v6 = *(_DWORD *)(a3 + 4);
      v7 = *(_DWORD *)(a3 + 8);
      v8 = *a1;
      v9 = *((unsigned __int16 *)*a1 + 1);
      if ((_WORD)v6)
        v10 = v9 == (unsigned __int16)*(_DWORD *)(a3 + 4);
      else
        v10 = 1;
      if (!v10)
        v7 = ((unsigned __int16)v6 >> 9) * v7 / (v9 >> 9);
      if ((a4 & 8) != 0)
      {
        v13 = v8[261];
        while (1)
        {
          if (!--v13)
            goto LABEL_9;
          v14 = (char *)&v8[536 * v13];
          v15 = *((_DWORD *)v14 + 134);
          v16 = *((_DWORD *)v14 + 135) + v15;
          if (v7 == v16)
            goto LABEL_9;
          v17 = v14 + 528;
          v18 = (unsigned __int16)v8[536 * v13 + 541];
          if (v7 > v16)
            break;
          v19 = v7 >= v15;
          v20 = v7 - v15;
          if (v20 != 0 && v19)
          {
            if (v18 == 24320)
            {
              v11 = 0;
              goto LABEL_26;
            }
            v11 = 0;
            v7 = v16;
            goto LABEL_10;
          }
          if (v18 != 24320)
            goto LABEL_9;
          v11 = delentry(a1, 528, 0x20Au, v13, 1072);
          v8 = *a1;
          if (v11)
            goto LABEL_10;
        }
        if (v18 == 24320)
        {
          v11 = 0;
          v20 = v7 - v15;
LABEL_26:
          *((_DWORD *)v17 + 3) = v20;
          goto LABEL_10;
        }
        v11 = PMGenPartitionType(a1, 24320, v16, v7 - v16, 0, (a2 << 24) | 0x200000u, 0, 0, 0xFFFFu);
        v8 = *a1;
      }
      else
      {
LABEL_9:
        v11 = 0;
      }
LABEL_10:
      *((_DWORD *)v8 + 1) = v7;
    }
    else
    {
      return -50;
    }
  }
  else
  {
    return 0;
  }
  return v11;
}

uint64_t PMDDMNormalise(uint64_t result, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  int v9;

  if (a2 != a3)
  {
    v3 = *(unsigned __int16 *)(*(_QWORD *)result + 16);
    if (*(_WORD *)(*(_QWORD *)result + 16))
    {
      v4 = 0;
      v5 = (unsigned int *)(*(_QWORD *)result + 18);
      do
      {
        v6 = *v5 * (unint64_t)a2;
        v7 = *((unsigned __int16 *)v5 + 2) * a2;
        if (v6 % a3)
          v8 = v6 / a3 + 1;
        else
          v8 = v6 / a3;
        *v5 = v8;
        v9 = v7 / a3;
        if (v7 % a3)
          LOWORD(v9) = v9 + 1;
        *((_WORD *)v5 + 2) = v9;
        ++v4;
        v5 += 2;
      }
      while (v4 < v3);
    }
  }
  return result;
}

_BYTE *strclean(_BYTE *a1, unint64_t a2, int __c)
{
  _BYTE *v3;
  unint64_t v4;
  BOOL v5;
  _BYTE *v6;
  BOOL v7;
  size_t v8;

  v3 = a1;
  v4 = 0;
  if (*a1)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    do
    {
      v6 = &a1[v4++];
      if (v6[1])
        v7 = v4 >= a2;
      else
        v7 = 1;
    }
    while (!v7);
    a1 += v4;
  }
  v7 = a2 >= v4;
  v8 = a2 - v4;
  if (v8 != 0 && v7)
    memset(a1, __c, v8);
  return v3;
}

uint64_t DiskBlockFactor(int a1, int a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6)
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  if (a3 == 0x4000)
    v6 = a4;
  else
    v6 = a6;
  if (a3 == 24320)
    v6 = a4;
  if (a3 == 4097)
    v7 = a4;
  else
    v7 = v6;
  if (a2)
    v8 = 0;
  else
    v8 = a4;
  if (a2 != 1)
    v7 = v8;
  if (a2 == 2)
    v7 = a5;
  if (a3 == 24320)
    v9 = a4;
  else
    v9 = a5;
  if (a3 == 0x4000)
    v10 = a4;
  else
    v10 = a6;
  if (a2)
    v11 = 0;
  else
    v11 = a4;
  if (a2 != 1)
    v10 = v11;
  if (a2 != 2)
    v9 = v10;
  if (a2)
    v12 = 0;
  else
    v12 = a4;
  if (a2 == 1)
    v12 = a6;
  if (a2 == 2)
    v12 = a5;
  if (a1 != 1)
    v9 = v12;
  if (a1)
    return v9;
  else
    return v7;
}

_DWORD *APMConvertBlocking(_DWORD *result, int a2, int a3, unsigned int a4)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  if (a3 != a4 && a3 && a4)
  {
    result[22] = result[22] & 0xFFBFFFFF | ((a4 == 1) << 22);
    v4 = result[2] * a3;
    v5 = result[3] * a3;
    if (a2 == 4097)
    {
      v6 = (v4 + v5 - 1) / a4;
      result[2] = 1;
      result[3] = v6;
LABEL_13:
      result[21] = v6;
      return result;
    }
    if (v4 % a4)
      v7 = v4 / a4 + 1;
    else
      v7 = v4 / a4;
    if (v5 % a4)
      v6 = v5 / a4 + 1;
    else
      v6 = v5 / a4;
    result[2] = v7;
    result[3] = v6;
    if (result[21])
      goto LABEL_13;
  }
  return result;
}

uint64_t PMRecord_NtoB(uint64_t result, uint64_t a2)
{
  _DWORD *v3;

  v3 = (_DWORD *)result;
  *(_QWORD *)(result + 496) = 0;
  *(_OWORD *)(result + 464) = 0u;
  *(_OWORD *)(result + 480) = 0u;
  *(_OWORD *)(result + 432) = 0u;
  *(_OWORD *)(result + 448) = 0u;
  *(_OWORD *)(result + 400) = 0u;
  *(_OWORD *)(result + 416) = 0u;
  *(_OWORD *)(result + 368) = 0u;
  *(_OWORD *)(result + 384) = 0u;
  *(_OWORD *)(result + 336) = 0u;
  *(_OWORD *)(result + 352) = 0u;
  *(_OWORD *)(result + 304) = 0u;
  *(_OWORD *)(result + 320) = 0u;
  *(_OWORD *)(result + 272) = 0u;
  *(_OWORD *)(result + 288) = 0u;
  *(_OWORD *)(result + 240) = 0u;
  *(_OWORD *)(result + 256) = 0u;
  *(_OWORD *)(result + 208) = 0u;
  *(_OWORD *)(result + 224) = 0u;
  *(_OWORD *)(result + 176) = 0u;
  *(_OWORD *)(result + 192) = 0u;
  *(_OWORD *)(result + 144) = 0u;
  *(_OWORD *)(result + 160) = 0u;
  *(_OWORD *)(result + 112) = 0u;
  *(_OWORD *)(result + 128) = 0u;
  *(_OWORD *)(result + 80) = 0u;
  *(_OWORD *)(result + 96) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
  *(_OWORD *)(result + 16) = 0u;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)result = 0u;
  *(_WORD *)result = 19792;
  *(int8x8_t *)(result + 4) = vrev32_s8(*(int8x8_t *)(a2 + 4));
  *(_DWORD *)(result + 12) = bswap32(*(_DWORD *)(a2 + 12));
  *(int8x16_t *)(result + 80) = vrev32q_s8(*(int8x16_t *)(a2 + 80));
  *(_DWORD *)(result + 96) = bswap32(*(_DWORD *)(a2 + 96));
  *(_DWORD *)(result + 116) = bswap32(*(_DWORD *)(a2 + 116));
  if (result != a2)
  {
    __strlcpy_chk();
    __strlcpy_chk();
    __strlcpy_chk();
    result = __strlcpy_chk();
  }
  v3[34] = bswap32(*(_DWORD *)(a2 + 136));
  v3[37] = *(_DWORD *)(a2 + 148);
  v3[74] = bswap32(*(_DWORD *)(a2 + 296));
  v3[125] = bswap32(*(_DWORD *)(a2 + 500));
  return result;
}

uint64_t APMReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  const void **v8;
  uint64_t result;
  uint64_t v10;

  v8 = (const void **)NewHandleClear(528);
  result = MemError();
  if (v8)
  {
    if ((a2 & 0x100) != 0)
      result = APMReadRawMediaMap(v8, v10, a3, a4);
    else
      result = APMReadMediaMap((uint64_t *)v8, a2, a3, a4);
  }
  *a1 = v8;
  return result;
}

uint64_t APMReadMediaMap(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;
  uint64_t *v15;
  _WORD *v16;
  int v17;
  unsigned __int16 *v18;
  unsigned __int16 v19;
  __int16 v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  int v25;
  unsigned __int16 *v26;
  char v27;
  _WORD *v28;
  uint64_t v29;
  int v30;
  unsigned __int16 *v31;
  unint64_t v32;
  char **v33;
  char *v34;
  int v35;
  __int16 *v36;
  uint64_t v37;
  int v38;
  unint64_t v39;
  int v40;
  __int16 v41;
  unsigned int v42;
  __int16 v43;
  int v44;
  int v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  int v50;
  uint64_t v51;
  unsigned __int16 v52;
  __int16 v54;
  unsigned __int16 *v55;
  unsigned int v56;
  char v57;
  unsigned int v58;
  const void **v59;
  unsigned int v60;
  int v61;
  unsigned int v62;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  unint64_t v69[2];
  __int16 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  _DWORD v103[20];
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[48];
  __int128 v128;
  __int16 v129;
  unsigned __int16 v130[260];
  uint64_t v131;

  v131 = *MEMORY[0x24BDAC8D0];
  v70 = 0;
  v128 = 0u;
  memset(v127, 0, sizeof(v127));
  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v104 = 0u;
  memset(v103, 0, sizeof(v103));
  v102 = 0;
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v71 = 0u;
  v68 = 0;
  v69[0] = 0;
  v69[1] = 0;
  v65 = 0;
  v66 = 0;
  v67 = 0;
  if (a2 == 0xFFFF)
    v5 = 3584;
  else
    v5 = a2;
  memset(v130, 0, 512);
  v6 = a4(a3, 2, 512, 0, 1, v130);
  LOWORD(v7) = v6;
  v59 = (const void **)a1;
  if (v6 || v130[0] != 21061)
  {
    if (v6)
      goto LABEL_132;
  }
  else
  {
    DDMRecord_BtoN(*a1, v130);
  }
  v8 = *a1;
  v9 = a4(a3, 15, 0, 0, 0, (unsigned __int16 *)&v68);
  LOWORD(v7) = v9;
  if (!v9)
  {
    *(_WORD *)(v8 + 500) = HIDWORD(v68) >> 9;
    MKScaleGeometry(v69, (int *)&v68 + 1);
    v10 = *(unsigned __int16 *)(v8 + 2);
    if (!*(_WORD *)(v8 + 2))
    {
      v10 = HIDWORD(v68);
      *(_WORD *)(v8 + 2) = WORD2(v68);
    }
    v11 = (unsigned __int16)v10 >> 9;
    v12 = ((v10 >> 9) & 0x60) != 0 ? (unsigned __int16)v10 >> 9 : 31;
    v13 = (v5 & 0x200) != 0 ? 2 : 1;
    v14 = APMMapAnalysis((uint64_t)&v65, (v12 + 1), v13, v11, a3, a4);
    LOWORD(v7) = v14;
    if (!v14)
    {
      v15 = (uint64_t *)v59;
      v16 = *v59;
      v60 = (v65 & 1) == 0;
      v16[256] = 516;
      v16[259] = v16[1];
      v58 = v11;
      if ((v5 & 0x400) != 0)
      {
        v16[1] = 512;
        v58 = 1;
      }
      v17 = WORD1(v65);
      if (!WORD1(v65))
      {
        v18 = 0;
        v27 = 0;
        v49 = 0;
        goto LABEL_110;
      }
      v56 = v11;
      v62 = v5;
      v18 = 0;
      v54 = 0;
      v19 = 0;
      v20 = 0;
      LOWORD(v7) = 0;
      while (1)
      {
        v102 = 0;
        v100 = 0u;
        v101 = 0u;
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v71 = 0u;
        v21 = v20;
        v22 = v19 + 1;
        v23 = (unint64_t)(&v65 + v20);
        v24 = *(unsigned __int16 *)(v23 + 6);
        if (v22 % v24)
          v25 = v22 / v24 + 1;
        else
          v25 = v22 / v24;
        v26 = (unsigned __int16 *)(v23 + 8);
        if (*(unsigned __int16 *)(v23 + 8) < (unsigned __int16)v25)
        {
          v27 = 0;
          goto LABEL_106;
        }
        v57 = 0;
        v28 = (_WORD *)(v23 | 6);
        v61 = v21;
        v55 = (unsigned __int16 *)&v66 + 4 * v21 + 1;
        while (1)
        {
          v29 = *v15;
          v19 = *v28 * v25;
          v18 = (unsigned __int16 *)malloc_type_malloc(0x200uLL, 0x219055CuLL);
          if (!v18)
            break;
          v30 = a4(a3, 2, 512, v19, 1, v18);
          if (v30)
            goto LABEL_103;
          if (!PMRecord_BtoN((uint64_t)&v71, v18))
            goto LABEL_100;
          DWORD2(v76) &= 0xF000FFFF;
          v31 = PMLookupDESC((char *)&v74, 0, (unsigned __int16 *)&APMDescriptors);
          if (v31)
          {
            LODWORD(v32) = *v31;
            if ((v32 - 24577) <= 2)
            {
              v32 = 0x310150025F00uLL >> (16 * (v32 - 1));
              v33 = &off_24CEC17E0;
              do
              {
                v34 = *v33;
                if (!*v33)
                  break;
                v35 = *((unsigned __int16 *)v33 - 4);
                v33 += 2;
              }
              while (v35 != (unsigned __int16)v32);
              strncpypad(&v74, v34, 0x20uLL, 0);
            }
            if ((unsigned __int16)v32 > 0x400Bu)
            {
              switch((unsigned __int16)v32)
              {
                case 0x400Cu:
                  v57 = 4;
                  LOWORD(v32) = 16396;
                  break;
                case 0x5002u:
                  v60 = 3;
                  if ((v62 & 0x40000) != 0)
                    goto LABEL_100;
                  LOWORD(v32) = 20482;
                  break;
                case 0x5F00u:
                  v40 = v60;
                  if (!HIDWORD(v71))
                    v40 = 2;
                  v60 = v40;
                  if ((v62 & 0x40000) != 0)
                    goto LABEL_100;
                  LOWORD(v32) = 24320;
                  if (v61)
                  {
                    if (!v40)
                    {
LABEL_99:
                      v60 = 0;
                      goto LABEL_100;
                    }
                  }
                  break;
              }
            }
            else
            {
              switch((unsigned __int16)v32)
              {
                case 0x1001u:
                  if (HIDWORD(v102) == 1297238867)
                    DWORD2(v76) |= 0x800000u;
                  v41 = *v55;
                  HIDWORD(v71) = *v55;
                  if (!v61)
                  {
                    v29 = *v15;
                    *(_WORD *)(*v15 + 520) = *v28 + *v28 * v41 - 1;
                  }
                  if (!v60)
                  {
                    v60 = 0;
                    DWORD2(v76) |= 0x1000000u;
                  }
                  LOWORD(v32) = 4097;
                  break;
                case 0x3100u:
                  WORD1(v102) = *v28;
                  LOWORD(v32) = 12544;
                  break;
                case 0x4000u:
                  if (!v60)
                  {
                    if (v61)
                      goto LABEL_99;
                    v60 = 0;
                    DWORD2(v76) |= 0x1000000u;
                  }
                  LOWORD(v32) = 0x4000;
                  break;
              }
            }
          }
          else
          {
            LOWORD(v32) = 0;
          }
          if ((v62 & 0x20) != 0 && !HIDWORD(v71))
            goto LABEL_100;
          v36 = &APMDescriptors;
          while ((unsigned __int16)*v36 != (unsigned __int16)v32)
          {
            v37 = *((_QWORD *)v36 + 3);
            v36 += 8;
            if (!v37)
            {
              v36 = (__int16 *)&unk_24CEC1AB8;
              break;
            }
          }
          v38 = (unsigned __int16)v36[1];
          apmxrec2irec((uint64_t)&v71, (char *)v103);
          if (v61)
          {
            v39 = DWORD2(v104) | 0x2000000u;
LABEL_52:
            DWORD2(v104) = v39;
            goto LABEL_77;
          }
          if (WORD1(v65) <= 1u)
          {
            v39 = DWORD2(v104);
          }
          else
          {
            v39 = DWORD2(v104);
            if (!(v19 % HIWORD(v66)))
            {
              v39 = DWORD2(v104) | 0x1000000u;
              goto LABEL_52;
            }
          }
LABEL_77:
          v129 = v32;
          v42 = byte_212DE40D8[(v39 >> 24) & 3];
          if (v42 < 2)
          {
            WORD5(v128) = v19 - 1;
            v43 = -1;
LABEL_81:
            WORD4(v128) = v43;
            goto LABEL_82;
          }
          if (v42 == 2)
          {
            WORD5(v128) = -1;
            v43 = v19 - 1;
            goto LABEL_81;
          }
LABEL_82:
          v44 = v103[2];
          if (!v103[2])
            goto LABEL_86;
          v45 = DiskBlockFactor(v60, v42, (unsigned __int16)v32, (unsigned __int16)*v28, (unsigned __int16)*v28, v56);
          if (v45 != v58)
          {
            PMConvertRecord(v103, v60, (__int16)v32, v45, v58);
            v44 = v103[2];
          }
          if (!PMPSearchBlock(v29, v44, &v70))
          {
            v46 = v70;
            *(_DWORD *)(v29 + 1072 * v70 + 616) |= 0x1000000u;
            if ((unsigned __int16)v32 == 12544 && (unsigned __int16)*v28 == v56)
              *(_WORD *)(v29 + 1072 * v46 + 1036) = WORD6(v128);
            v47 = v19 - 1;
            v15 = (uint64_t *)v59;
            v48 = v29 + 1072 * v46;
            if (v61 < 1)
              *(_WORD *)(v48 + 1034) = v47;
            else
              *(_WORD *)(v48 + 1032) = v47;
            ++v54;
          }
          else
          {
LABEL_86:
            *((_QWORD *)&v126 + 1) = v18;
            if ((unsigned __int16)v32 == 4097 || v38 == 2)
              MEMORY[0x2199A5D48](v127);
            v15 = (uint64_t *)v59;
            LOWORD(v30) = addentry(v59, v103, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
            if ((_WORD)v30)
            {
LABEL_103:
              LOWORD(v7) = v30;
              goto LABEL_105;
            }
            v18 = 0;
          }
LABEL_100:
          LOWORD(v25) = v25 + 1;
          if (*v26 < (unsigned __int16)v25)
          {
            LOWORD(v7) = 0;
            goto LABEL_105;
          }
        }
        LOWORD(v7) = -1;
LABEL_105:
        v17 = WORD1(v65);
        v27 = v57;
        LOWORD(v21) = v61;
LABEL_106:
        v20 = v21 + 1;
        if (v17 <= (__int16)(v21 + 1))
        {
          v5 = v62;
          v11 = v56;
          v49 = v54;
          if (!(_WORD)v7)
          {
LABEL_110:
            *(_WORD *)(*v15 + 514) = v60;
            if (!(v5 & 0x100000 | v27 & 4))
              PMISODetect(v15, a3, (uint64_t)a4);
            if ((v5 & 0x800) != 0)
            {
              PMSortMapII((Ptr *)v15, 0);
              if ((v5 & 0x10) != 0)
              {
                v50 = PMAccountFreespace((const void **)v15, 0, v5);
                if (v50)
                {
                  LOWORD(v7) = v50;
                  goto LABEL_130;
                }
              }
              if ((v5 & 0x400) != 0)
                PMTrimOverlaps((uint64_t)v15);
            }
            if ((v5 & 0x80) != 0)
              PMRationalise((const void **)v15);
            v51 = *v15;
            v52 = *(_WORD *)(*v15 + 2);
            if (!v52)
            {
              v52 = WORD2(v68);
              if ((v5 & 0x400) != 0)
                v52 = 512;
              *(_WORD *)(v51 + 2) = v52;
            }
            if (!*(_DWORD *)(v51 + 4))
              *(_DWORD *)(v51 + 4) = PMConvertBlocks(LODWORD(v69[0]), WORD2(v68), v52);
            if ((v5 & 0x400) != 0)
            {
              PMDDMNormalise((uint64_t)v15, v11, v58);
              *(_DWORD *)(*v15 + 4) *= v11;
            }
            LOWORD(v7) = DeviceAdjustSpace((const void **)v15, 0, (uint64_t)&v68, v5);
            if (v49)
              *(_WORD *)(*v15 + 516) |= 1u;
          }
LABEL_130:
          if (v18)
            free(v18);
          break;
        }
      }
    }
  }
LABEL_132:
  if ((_WORD)v7 == 0xFFFF)
    v7 = *__error();
  return (__int16)v7;
}

uint64_t DDMRecord_BtoN(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2;
  int v3;
  unsigned __int16 *v4;
  uint64_t v5;

  *(_WORD *)result = bswap32(*a2) >> 16;
  *(_WORD *)(result + 2) = bswap32(a2[1]) >> 16;
  *(_DWORD *)(result + 4) = bswap32(*((_DWORD *)a2 + 1));
  *(_WORD *)(result + 8) = bswap32(a2[4]) >> 16;
  *(_WORD *)(result + 10) = bswap32(a2[5]) >> 16;
  *(_DWORD *)(result + 12) = bswap32(*((_DWORD *)a2 + 3));
  v2 = bswap32(a2[8]) >> 16;
  if (v2 >= 0x11)
    v2 = 0;
  *(_WORD *)(result + 16) = v2;
  if (v2)
  {
    v3 = 0;
    v4 = a2 + 9;
    v5 = result + 18;
    do
    {
      *(_DWORD *)v5 = bswap32(*(_DWORD *)v4);
      *(_WORD *)(v5 + 4) = bswap32(v4[2]) >> 16;
      *(_WORD *)(v5 + 6) = bswap32(v4[3]) >> 16;
      ++v3;
      v4 += 4;
      v5 += 8;
    }
    while (v2 > (unsigned __int16)v3);
  }
  return result;
}

uint64_t APMMapAnalysis(uint64_t a1, uint64_t a2, unsigned int a3, int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  int v7;
  unsigned int v8;
  int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int16 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  unsigned __int16 *v20;
  __int16 v21;
  int v22;
  int v23;
  __int16 v25;
  unsigned __int16 v26;
  __int16 v27;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  uint64_t v36;
  _OWORD v39[3];
  _OWORD v40[28];
  uint64_t v41;
  __int16 v42[256];
  unsigned __int16 v43[256];
  uint64_t v44;

  v7 = 0;
  v44 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  if (a2 >= 2)
  {
    v8 = a3;
    v41 = 0;
    memset(v40, 0, sizeof(v40));
    memset(v39, 0, sizeof(v39));
    if (*(unsigned __int16 *)(a1 + 2) < a3)
    {
      v11 = a4;
      v12 = a2;
      v7 = 0;
      v13 = 1;
      v14 = 1;
      while (1)
      {
        LODWORD(v15) = a6(a5, 2, 512, v13, 1, v43);
        if ((_DWORD)v15)
          return (__int16)v15;
        LODWORD(v15) = PMRecord_BtoN((uint64_t)v39, v43);
        if ((_DWORD)v15)
        {
          v16 = 1 << (v13 - 1);
          if (v14 >= 0x20)
            LODWORD(v16) = 0;
          v7 |= v16;
          v15 = PMLookupDESC((char *)v40, 0, (unsigned __int16 *)&APMDescriptors);
          if (v15)
          {
            if (*v15 == 4097)
            {
              v17 = *(unsigned __int16 *)(a1 + 2);
              v18 = a1 + 8 * v17;
              v19 = 1;
              *(_WORD *)(v18 + 6) = 1;
              v20 = (unsigned __int16 *)(v18 + 6);
              *(v20 - 1) = v14;
              v21 = WORD2(v39[0]);
              v20[1] = WORD2(v39[0]);
              if ((v14 & 1) == 0)
              {
                LOWORD(v22) = v14;
                do
                {
                  v23 = v22 & 2;
                  v22 = (__int16)v22 >> 1;
                  v19 = (__int16)(2 * v19);
                }
                while (v19 <= 7 && v23 == 0);
              }
              if (v11 <= v19)
                v25 = v19;
              else
                v25 = v11;
              if (v11 != 4)
                LOWORD(v19) = v25;
              v26 = v19;
              if ((__int16)v19 < 1)
              {
                LODWORD(v15) = 0;
                v30 = v12;
              }
              else
              {
                v36 = v17;
                v27 = v21 - 1;
                while (1)
                {
                  LODWORD(v15) = a6(a5, 2, 512, (unsigned __int16)(v26 * v27), 1, (unsigned __int16 *)v42);
                  if ((_DWORD)v15)
                    goto LABEL_30;
                  if (v42[0] == 19792 || v42[0] == 19712)
                    break;
                  v29 = v26;
                  v26 >>= 1;
                  if (v29 <= 1)
                  {
                    LODWORD(v15) = 0;
LABEL_30:
                    v30 = v12;
                    goto LABEL_50;
                  }
                }
                *v20 = v26;
                v32 = HIDWORD(v39[0]);
                if (!HIDWORD(v39[0]))
                  v32 = DWORD1(v39[0]);
                if (v32 >= 0x3F)
                  v32 = 63;
                *(_WORD *)(a1 + 8 * v36 + 10) = v32;
                if (v32 >= v12)
                  v33 = v12;
                else
                  v33 = v32;
                if (v26 == 1)
                  v30 = (unsigned __int16)v33;
                else
                  v30 = v12;
                if (v26 == 1)
                  LODWORD(v12) = v33;
                LODWORD(v15) = 0;
LABEL_50:
                v11 = a4;
              }
              ++*(_WORD *)(a1 + 2);
              v31 = v12;
              v12 = v30;
              v8 = a3;
              goto LABEL_33;
            }
            LODWORD(v15) = 0;
          }
        }
        v31 = v12;
LABEL_33:
        if (++v14 < v31)
        {
          ++v13;
          if (*(unsigned __int16 *)(a1 + 2) < v8)
            continue;
        }
        goto LABEL_53;
      }
    }
    LODWORD(v15) = 0;
    v7 = 0;
LABEL_53:
    if ((_DWORD)v15)
      return (__int16)v15;
  }
  if (*(_WORD *)(a1 + 2) != 1)
  {
    if (*(_WORD *)(a1 + 2))
      LOWORD(v15) = 0;
    else
      LOWORD(v15) = -5339;
    return (__int16)v15;
  }
  v34 = *(unsigned __int16 *)(a1 + 6);
  if (v34 == 4)
  {
    if ((v7 & 1) != 0)
    {
      *(_WORD *)a1 |= 1u;
      *(_QWORD *)(a1 + 12) = *(_QWORD *)(a1 + 4);
      *(_WORD *)(a1 + 6) = 1;
      goto LABEL_66;
    }
    goto LABEL_64;
  }
  if (v34 != 1)
  {
LABEL_64:
    LOWORD(v15) = 0;
    return (__int16)v15;
  }
  LOWORD(v15) = 0;
  if (*(_WORD *)(a1 + 4) != 1 && (v7 & 0x8080808u) >= 9)
  {
    *(_WORD *)a1 |= 1u;
    *(_QWORD *)(a1 + 12) = *(_QWORD *)(a1 + 4);
    *(_WORD *)(a1 + 14) = 4;
LABEL_66:
    LOWORD(v15) = 0;
    *(_WORD *)(a1 + 2) = 2;
  }
  return (__int16)v15;
}

BOOL PMRecord_BtoN(uint64_t a1, unsigned __int16 *a2)
{
  unsigned int v2;

  v2 = *a2;
  if (v2 == 19792 || v2 == 19712)
  {
    *(_WORD *)a1 = __rev16(v2);
    *(_WORD *)(a1 + 2) = bswap32(a2[1]) >> 16;
    *(int8x8_t *)(a1 + 4) = vrev32_s8(*(int8x8_t *)(a2 + 2));
    *(_DWORD *)(a1 + 12) = bswap32(*((_DWORD *)a2 + 3));
    *(int8x16_t *)(a1 + 80) = vrev32q_s8(*((int8x16_t *)a2 + 5));
    *(int8x16_t *)(a1 + 96) = vrev32q_s8(*((int8x16_t *)a2 + 6));
    *(int8x8_t *)(a1 + 112) = vrev32_s8(*(int8x8_t *)(a2 + 56));
    if ((unsigned __int16 *)a1 != a2)
    {
      *((_BYTE *)a2 + 79) = 0;
      __strlcpy_chk();
      *((_BYTE *)a2 + 47) = 0;
      __strlcpy_chk();
      *((_BYTE *)a2 + 135) = 0;
      __strlcpy_chk();
      *((_BYTE *)a2 + 497) = 0;
      __strlcpy_chk();
      *(_DWORD *)(a1 + 148) = *((_DWORD *)a2 + 37);
    }
    *(_DWORD *)(a1 + 136) = bswap32(*((_DWORD *)a2 + 34));
    *(_DWORD *)(a1 + 296) = bswap32(*((_DWORD *)a2 + 74));
    *(_DWORD *)(a1 + 500) = bswap32(*((_DWORD *)a2 + 125));
  }
  return v2 == 19792 || v2 == 19712;
}

uint64_t apmxrec2irec(uint64_t a1, char *a2)
{
  uint64_t result;

  bzero(a2, 0x430uLL);
  *(_WORD *)a2 = 20557;
  *((_QWORD *)a2 + 1) = *(_QWORD *)(a1 + 8);
  *((_QWORD *)a2 + 10) = *(_QWORD *)(a1 + 80);
  *((_DWORD *)a2 + 22) = *(_DWORD *)(a1 + 88) & 0xF000FFFF;
  *(_QWORD *)(a2 + 92) = *(_QWORD *)(a1 + 92);
  *((_DWORD *)a2 + 29) = *(_DWORD *)(a1 + 116);
  __strlcpy_chk();
  __strlcpy_chk();
  __strlcpy_chk();
  result = __strlcpy_chk();
  *((_DWORD *)a2 + 34) = *(_DWORD *)(a1 + 136);
  *((_DWORD *)a2 + 116) = *(_DWORD *)(a1 + 148);
  *((_DWORD *)a2 + 128) = *(_DWORD *)(a1 + 500);
  *((_WORD *)a2 + 254) = *(_WORD *)(a1 + 498);
  return result;
}

uint64_t PMPSearchBlock(uint64_t a1, int a2, __int16 *a3)
{
  __int16 v3;
  __int16 v4;

  if (!a1)
  {
    v3 = -1;
    v4 = -50;
    if (!a3)
      return v4;
    goto LABEL_9;
  }
  if (!*(_WORD *)(a1 + 522))
  {
LABEL_6:
    v3 = -1;
    v4 = -5343;
    if (!a3)
      return v4;
    goto LABEL_9;
  }
  v3 = 0;
  while (*(_DWORD *)(a1 + 1072 * v3 + 536) != a2)
  {
    if (*(unsigned __int16 *)(a1 + 522) <= ++v3)
      goto LABEL_6;
  }
  v4 = 0;
  if (a3)
LABEL_9:
    *a3 = v3;
  return v4;
}

uint64_t PMTrimOverlaps(uint64_t result)
{
  _DWORD *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *(_DWORD **)result;
  v2 = *(unsigned __int16 *)(*(_QWORD *)result + 522);
  if (v2 >= 3)
  {
    v3 = v2 - 2;
    do
    {
      v4 = v1[402] - v1[134];
      if (v1[135] > v4)
        v1[135] = v4;
      v1 += 268;
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t APMCFRecordSections(Ptr *a1, const __CFDictionary *a2, __CFArray *a3)
{
  int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  __CFDictionary *v19;
  int v20;
  __CFDictionary *v22;
  Ptr v23;
  _WORD *v24;
  __CFDictionary *Mutable;
  __CFDictionary *v26;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  CFNumberRef v30;
  CFMutableArrayRef v31;
  CFMutableArrayRef v32;
  unint64_t v33;
  unsigned __int16 *v34;
  CFMutableDictionaryRef v35;
  __CFDictionary *v36;
  CFNumberRef v37;
  CFNumberRef v38;
  CFNumberRef v39;
  CFNumberRef v40;
  CFStringRef v41;
  CFStringRef v42;
  CFMutableArrayRef v43;
  CFMutableArrayRef v44;
  int v45;
  int valuePtr;
  __int16 v47;
  char cStr[32];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    v6 = MKCFOptionBit(a2, CFSTR("Include ddm section"), 1);
    v7 = MKCFOptionBit(a2, CFSTR("Include ddm parts"), 2) | v6;
    v8 = MKCFOptionBit(a2, CFSTR("Include most"), 150);
    v9 = MKCFOptionBit(a2, CFSTR("Include all"), 254) | v8;
    v10 = MKCFOptionBit(a2, CFSTR("Include drivers"), 2);
    v11 = v9 | v10 | MKCFOptionBit(a2, CFSTR("Include data"), 4);
    v12 = MKCFOptionBit(a2, CFSTR("Include free space"), 8);
    v13 = v12 | MKCFOptionBit(a2, CFSTR("Include loaders"), 16);
    v14 = v11 | v13 | MKCFOptionBit(a2, CFSTR("Include patch"), 32);
    v15 = MKCFOptionBit(a2, CFSTR("Include aux"), 64);
    v16 = v14 | v15 | MKCFOptionBit(a2, CFSTR("Include unknowns"), 128);
    if (v16)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
  }
  v16 = 20;
LABEL_6:
  v45 = 0;
  if (v7 <= 1)
    v17 = 1;
  else
    v17 = v7;
  if ((~v17 & 3) != 0)
    v18 = v16;
  else
    v18 = v16 & 0xFFFFFFCD;
  v19 = APMCFRecordMapSection(a1, v18, &v45);
  LOWORD(v20) = v45;
  if (v45)
    return (__int16)v20;
  v22 = v19;
  if (v19)
  {
    CFArrayAppendValue(a3, v19);
    CFRelease(v22);
  }
  v23 = *a1;
  if (!*a1)
  {
    LOWORD(v20) = -1;
    return (__int16)v20;
  }
  v24 = v23 + 16;
  if (!*((_WORD *)v23 + 8)
    || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) == 0)
  {
    LOWORD(v20) = 0;
    return (__int16)v20;
  }
  v26 = Mutable;
  v47 = 0;
  CFDictionarySetValue(Mutable, CFSTR("ID"), CFSTR("DDM"));
  CFDictionarySetValue(v26, CFSTR("Name"), CFSTR("Driver Descriptor Map"));
  valuePtr = 0;
  v27 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v27)
    goto LABEL_32;
  v28 = v27;
  CFDictionarySetValue(v26, CFSTR("Offset"), v27);
  CFRelease(v28);
  v29 = CFNumberCreate(0, kCFNumberSInt16Type, v23 + 16);
  if (!v29
    || (v30 = v29,
        CFDictionarySetValue(v26, CFSTR("Count"), v29),
        CFRelease(v30),
        (v31 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690])) == 0))
  {
LABEL_32:
    v45 = 0;
LABEL_33:
    CFArrayAppendValue(a3, v26);
    CFRelease(v26);
    LOWORD(v20) = v45;
    return (__int16)v20;
  }
  v32 = v31;
  CFDictionarySetValue(v26, CFSTR("Drivers"), v31);
  CFRelease(v32);
  if (*v24)
  {
    v33 = 0;
    v34 = (unsigned __int16 *)(v23 + 18);
    while (1)
    {
      v35 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v35)
        break;
      v36 = v35;
      v37 = CFNumberCreate(0, kCFNumberSInt32Type, v34);
      if (!v37)
        break;
      v38 = v37;
      CFDictionarySetValue(v36, CFSTR("Offset"), v37);
      CFRelease(v38);
      v39 = CFNumberCreate(0, kCFNumberSInt16Type, v34 + 2);
      if (!v39)
        break;
      v40 = v39;
      CFDictionarySetValue(v36, CFSTR("Size"), v39);
      CFRelease(v40);
      OSType2Ascii(v34[3], cStr, 2);
      v41 = CFStringCreateWithCString(0, cStr, 0);
      if (!v41)
        break;
      v42 = v41;
      CFDictionarySetValue(v36, CFSTR("OS"), v41);
      CFRelease(v42);
      CFArrayAppendValue(v32, v36);
      CFRelease(v36);
      ++v33;
      v34 += 4;
      if (v33 >= (unsigned __int16)*v24)
        goto LABEL_29;
    }
    v20 = -1;
  }
  else
  {
LABEL_29:
    v20 = 0;
  }
  if ((v17 & 1) != 0)
  {
    v43 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    if (v43)
    {
      v44 = v43;
      CFDictionarySetValue(v26, CFSTR("Partitions"), v43);
      CFRelease(v44);
      v20 = APMCFRecordPartitions((uint64_t *)a1, v44, 0x32u, &v47);
    }
  }
  v45 = v20;
  if (!v20)
    goto LABEL_33;
  return (__int16)v20;
}

unsigned __int16 *MBRDescriptorSearch(char *a1)
{
  unsigned __int16 *result;

  result = PMLookupDESC(a1, 0, (unsigned __int16 *)&MBRDescriptors);
  if (result)
    return (unsigned __int16 *)*result;
  return result;
}

uint64_t MBRCFCreateMap(__CFArray *a1, const __CFDictionary *a2, unsigned int a3, unsigned int a4, const __CFDictionary *a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))
{
  uint64_t result;
  unsigned __int16 v13;
  const __CFNumber *Value;
  const __CFBoolean *v15;
  int v16;
  const __CFArray *v17;
  const __CFNumber *v18;
  __CFDictionary *v19;
  uint64_t v20;
  unint64_t v21[2];
  Ptr *v22;
  unsigned __int16 valuePtr;
  __int16 v24;
  unsigned int v25;

  v22 = 0;
  valuePtr = 8;
  v24 = 1;
  if (!a2)
    return 22;
  v25 = 0;
  v21[0] = 0;
  v21[1] = 0;
  v20 = 0;
  result = a7(a6, 15, 0, 0, 0, &v20);
  if (!(_DWORD)result)
  {
    v13 = WORD2(v20);
    if (a4)
    {
      if (!a3)
        LOWORD(a3) = 512;
    }
    else
    {
      MKScaleGeometry(v21, (int *)&v20 + 1);
      a4 = v21[0];
      if (a3 && HIDWORD(v20) < a3)
        a4 = PMConvertBlocks(LODWORD(v21[0]), WORD2(v20), a3);
      else
        LOWORD(a3) = WORD2(v20);
    }
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("PMFormats"));
    if (Value || (Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Map Format"))) != 0)
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
    v15 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Dual Format"));
    v16 = (v15 || (v15 = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("Dualmode"))) != 0)
       && CFBooleanGetValue(v15) != 0;
    result = PMNewPartitionListInternal((const void ***)&v22, 0, a4, (unsigned __int16)a3, v16, valuePtr, 0);
    v25 = result;
    if (!(_DWORD)result)
    {
      *((_WORD *)*v22 + 250) = v13 >> 9;
      v17 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Partitions"));
      v18 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Revision"));
      if (v18)
        CFNumberGetValue(v18, kCFNumberSInt16Type, &v24);
      v19 = MBRCFRecordMapSection(v22, 0x94u, &v25);
      result = v25;
      if (!v25)
      {
        if (v19)
        {
          CFArrayAppendValue(a1, v19);
          CFRelease(v19);
        }
        if (v17)
          return MBRCFCreatePartitions(v19, v17, (unsigned __int16)a3 >> 9, a5);
        else
          return v25;
      }
    }
  }
  return result;
}

uint64_t MBRCFCreatePartitions(const __CFDictionary *a1, CFArrayRef theArray, unsigned int a3, const __CFDictionary *a4)
{
  uint64_t Count;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  uint64_t result;

  if (!a1)
    return 4294967246;
  Count = (unsigned __int16)CFArrayGetCount(theArray);
  if (!Count)
    return 0;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v9);
    if (!ValueAtIndex)
      break;
    result = MBRCFCreatePartition(a1, ValueAtIndex, a3, a4);
    if ((_DWORD)result)
      return result;
    if (Count == ++v9)
      return 0;
  }
  return 4294966881;
}

uint64_t MBRCFCreatePartition(const __CFDictionary *a1, const __CFDictionary *a2, unsigned int a3, const __CFDictionary *a4)
{
  const UInt8 *v8;
  const void **v9;
  unsigned int v10;
  uint64_t result;
  const __CFDictionary *Value;
  uint64_t v13;
  const __CFArray *v14;
  __int16 v15;
  _BYTE v16[8];
  unsigned int v17;
  unsigned int v18;
  _BYTE v19[32];
  char v20[506];
  unsigned __int16 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = mkcfrecoverref(a1);
  if (!v8)
    return 4294967246;
  v9 = (const void **)v8;
  v15 = 0;
  bzero(v16, 0x430uLL);
  v10 = *((unsigned __int16 *)*v9 + 1) >> 9;
  result = PMPrimaryInfoUpdate(a2, *((__int16 *)*v9 + 257), v10, v16, 1);
  if (!(_DWORD)result)
  {
    if (v21)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Options"));
      v13 = MBRCFSetupWriteOptions(Value, a4);
      result = PMNewPartitionExtended(v9, v21, v20, v17, v18, v19, a3, (unsigned __int16 *)&v15, v13);
      if (!(_DWORD)result)
      {
        result = PMSecondaryInfoUpdate(a2, v10, (uint64_t)*v9 + 1072 * v15 + 528, 1);
        if (!(_DWORD)result)
        {
          v14 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
          return MBRCFRecordPartition(v14, (uint64_t *)v9, 1, v15);
        }
      }
    }
    else if (!strcasecmp(v20, "Apple_Free"))
    {
      return 0;
    }
    else
    {
      return 4294961954;
    }
  }
  return result;
}

uint64_t MBRCFSetupWriteOptions(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const __CFDictionary *v3;
  uint64_t v4;
  char v5;
  char v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;

  if (!((unint64_t)a1 | (unint64_t)a2))
    return 49296;
  v3 = a1;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    if (v3)
    {
      v7 = MKCFOptionBit(v3, CFSTR("Minimum One Block Gap"), 0x1000000);
      v8 = MKCFOptionBit(v3, CFSTR("Sectors/Track Alignment"), 0x2000000) | v7;
      v9 = MKCFOptionBit(v3, CFSTR("Boot Select"), 0x4000000);
      v10 = v8 | v9 | MKCFOptionBit(v3, CFSTR("Protect NV Area"), 0x8000000);
      v11 = MKCFOptionBit(v3, CFSTR("Retain existing content"), 4);
      v4 |= v10 | v11 | MKCFOptionBit(v3, CFSTR("Direct Mode"), 0x20000000);
    }
    v5 = 0;
    v3 = a2;
  }
  while ((v6 & 1) != 0);
  return v4;
}

uint64_t MBRCFWriteScheme(const __CFDictionary *a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, _QWORD))
{
  int v10;
  const __CFArray *Value;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const UInt8 *v14;
  const UInt8 *v15;
  const __CFNumber *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t result;
  Ptr *v20;
  const __CFArray *v21;
  unsigned __int16 valuePtr;
  CFRange v23;

  if (!a1)
    return 22;
  v10 = MBRCFSetupWriteOptions(a4, 0);
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Sections"));
  if (!Value)
    return 22;
  v12 = CFArrayDictionarySearchWithIndexOptions(Value, CFSTR("ID"), CFSTR("MAP"), 0, 0);
  if (!v12)
    return 22;
  v13 = v12;
  v14 = mkcfrecoverref(v12);
  if (!v14)
    return 22;
  v15 = v14;
  valuePtr = 0;
  v16 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Alignment"));
  if (v16)
  {
    CFNumberGetValue(v16, kCFNumberSInt16Type, &valuePtr);
    v18 = valuePtr;
  }
  else
  {
    v18 = *(unsigned __int16 *)(*(_QWORD *)v15 + 518) >> 9;
    valuePtr = *(_WORD *)(*(_QWORD *)v15 + 518) >> 9;
  }
  result = MBRCFUpdateSection(v13, v17, v18, a4);
  if (!(_DWORD)result)
  {
    v20 = (Ptr *)mkcfrecoverref(v13);
    result = MBRWriteMedia(v20, v10, a5, a6);
    if (!(_DWORD)result)
    {
      v21 = (const __CFArray *)CFDictionaryGetValue(v13, CFSTR("Partitions"));
      result = MBRCFRecordPartitions((uint64_t *)v20, v21, 0, 0xFFFFFFFF, 0);
      if (!(_DWORD)result)
      {
        v23.length = CFArrayGetCount(v21);
        v23.location = 0;
        CFArraySortValues(v21, v23, (CFComparatorFunction)CFRankPartition, 0);
        return 0;
      }
    }
  }
  return result;
}

uint64_t MBRCFUpdateSection(const __CFDictionary *a1, uint64_t a2, unsigned int a3, const __CFDictionary *a4)
{
  const UInt8 *v7;
  uint64_t *v8;
  uint64_t v9;
  const __CFNumber *Value;
  const __CFArray *v11;
  unsigned __int16 Count;
  unsigned __int16 v13;
  CFIndex v14;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v16;
  unsigned int v17;
  int v18;
  int UUID;
  const __CFDictionary *v20;
  uint64_t v21;
  BOOL v22;
  unsigned int v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;
  signed __int16 v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  CFNumberRef v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  __int16 v39;
  uint64_t v40;
  int v42;
  unsigned int v43;
  unsigned int v44;
  uint64_t v45;
  _DWORD *v46;
  int v47;
  const __CFDictionary *v48;
  unsigned int v49;
  __int16 v50;
  _OWORD v51[67];
  _QWORD v52[5];

  v52[2] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  v7 = mkcfrecoverref(a1);
  if (!v7)
    return 22;
  v8 = (uint64_t *)v7;
  v9 = *(_QWORD *)v7;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Media Block Size"));
  if (Value)
    CFNumberGetValue(Value, kCFNumberSInt16Type, (void *)(v9 + 518));
  v50 = 0;
  v52[1] = 0;
  v52[0] = 0;
  memset(v51, 0, 512);
  v11 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Partitions"));
  Count = CFArrayGetCount(v11);
  if (!Count)
  {
LABEL_48:
    LOWORD(UUID) = 0;
    return (__int16)UUID;
  }
  v13 = Count;
  v49 = a3;
  v48 = a4;
  v14 = 0;
  v47 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v14);
    if (!ValueAtIndex)
    {
      LOWORD(UUID) = 22;
      return (__int16)UUID;
    }
    v16 = ValueAtIndex;
    v17 = *(unsigned __int16 *)(*v8 + 2) >> 9;
    v18 = PMPrimaryInfoUpdate(ValueAtIndex, *(__int16 *)(*v8 + 514), v17, v51, 1);
    if (v18)
      break;
    UUID = CFDictionaryGetUUID(v16, CFSTR("GUID"), (unsigned __int8 *)v52);
    if (!UUID)
      UUID = PMGuidSearch((uint64_t)v8, v52, &v50);
    v20 = (const __CFDictionary *)CFDictionaryGetValue(v16, CFSTR("Options"));
    if (v20)
    {
      v21 = MKCFOptionBit(v20, CFSTR("Allocate Remaining Space"), 0x400000);
      v22 = UUID == -5343;
      if (UUID == -5343 && (v21 & 0x400000) != 0)
      {
        HIDWORD(v51[0]) = 0;
LABEL_23:
        v26 = MBRCFCreatePartition(a1, v16, v49, v48);
LABEL_24:
        UUID = v26;
LABEL_25:
        if (UUID)
          return (__int16)UUID;
        goto LABEL_26;
      }
    }
    else
    {
      v22 = UUID == -5343;
    }
    if (UUID)
    {
      if (!(HIDWORD(v51[0]) + DWORD2(v51[0])))
        v22 = 0;
      if (!v22)
        return (__int16)UUID;
      goto LABEL_23;
    }
    v23 = DWORD2(v51[0]);
    v24 = HIDWORD(v51[0]);
    if (DWORD2(v51[0]) + HIDWORD(v51[0]))
    {
      v27 = *v8;
      v28 = v50;
      v29 = *v8 + 1072 * v50;
      if ((*(_BYTE *)(v29 + 996) & 0x10) == 0)
      {
        v30 = v29 + 528;
        v45 = *v8;
        v46 = (_DWORD *)(v29 + 528);
        if (!HIDWORD(v51[0]))
        {
          v31 = v50 + 1;
          if (v31 >= *(unsigned __int16 *)(v27 + 522))
          {
            v33 = *(_DWORD *)(v27 + 4);
          }
          else
          {
            v32 = v27 + 1072 * v31;
            v33 = *(_DWORD *)(v32 + 536);
            if (*(_WORD *)(v32 + 1082) == 24320)
              v33 += *(_DWORD *)(v32 + 540);
          }
          HIDWORD(v51[0]) = (v33 - *(_DWORD *)(v30 + 8)) / v49 * v49;
          v34 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)((unint64_t)v51 | 0xC));
          CFDictionarySetValue(v16, CFSTR("Size"), v34);
          CFRelease(v34);
          v23 = DWORD2(v51[0]);
          v24 = HIDWORD(v51[0]);
          v28 = v50;
        }
        v26 = SValidate(v8, v23, v24, v28);
        if (v26)
          goto LABEL_24;
        v35 = v46[3];
        v36 = v47;
        if (HIDWORD(v51[0]) < v35)
          v36 = DWORD2(v51[0]) + HIDWORD(v51[0]);
        v47 = v36;
        v43 = HIDWORD(v51[0]);
        v44 = v46[3];
        v37 = v35 - HIDWORD(v51[0]);
        if (v35 < HIDWORD(v51[0]))
          v37 = 0;
        v42 = v37;
        v18 = PMPrimaryInfoUpdate(v16, *(__int16 *)(v45 + 514), v17, v46, 0);
        if (v18)
          break;
        v38 = PMSecondaryInfoUpdate(v16, v17, (uint64_t)v46, 0);
        UUID = v38;
        if (v43 >= v44 || v38)
          goto LABEL_25;
        v39 = v50 + 1;
        if (*(unsigned __int16 *)(v45 + 522) <= (__int16)(v50 + 1) || *(_WORD *)(v45 + 1072 * v39 + 1082) != 24320)
        {
          v26 = PMGenPartitionType((const void **)v8, 24320, v47, v42, *(unsigned __int16 *)(v45 + 2), 0x200000, 0, 0, v50);
          goto LABEL_24;
        }
        v40 = v45 + 1072 * v39;
        *(_DWORD *)(v40 + 536) -= v42;
        *(_DWORD *)(v40 + 540) += v42;
      }
LABEL_26:
      if (++v14 >= (unint64_t)v13)
        goto LABEL_48;
    }
    else
    {
      v25 = PMRemovePartition((const void **)v8, (unsigned __int16)v50, 1);
      CFArrayRemoveValueAtIndex(v11, v14);
      if (--v13 <= (unsigned __int16)v14)
      {
        LOWORD(UUID) = v25;
        return (__int16)UUID;
      }
    }
  }
  LOWORD(UUID) = v18;
  return (__int16)UUID;
}

uint64_t MKCreateLoaderPartition(const void **a1, __CFBundle *a2, CFDictionaryRef theDict, unsigned int a4, int a5, int a6, char *a7, int a8, uint64_t a9, uint64_t (*a10)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  const __CFDictionary *v14;
  const __CFDictionary *v17;
  const __CFDictionary *Value;
  const __CFDictionary *v19;
  CFStringRef v20;
  CFStringRef v21;
  const __CFDictionary *v22;
  const __CFNumber *v23;
  uint64_t v24;
  unsigned int valuePtr;
  unsigned int v27;
  _OWORD v28[6];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v27 = -5343;
  if (a6 >= 1)
  {
    v14 = theDict;
    v17 = 0;
    v29 = 0;
    memset(v28, 0, sizeof(v28));
    if (theDict || (v27 = -43, v14 = MKLoadDB(a2, CFSTR("inventory"), (int *)&v27), (v17 = v14) != 0))
    {
      v27 = -417;
      Value = (const __CFDictionary *)CFDictionaryGetValue(v14, CFSTR("Loaders"));
      if (Value)
      {
        v19 = Value;
        v27 = -415;
        v20 = CFStringCreateWithCString(0, a7, 0);
        if (v20)
        {
          v21 = v20;
          v22 = (const __CFDictionary *)CFDictionaryGetValue(v19, v20);
          CFRelease(v21);
          if (v22)
          {
            v27 = MKGetPartitionInfo(v22, *((__int16 *)*a1 + 257), (uint64_t)v28);
            if (!v27)
            {
              v23 = (const __CFNumber *)CFDictionaryGetValue(v22, CFSTR("Minimum Host Size"));
              if (v23)
              {
                CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr);
                v24 = valuePtr;
              }
              else
              {
                v24 = 0;
              }
              v27 = PMCreateLoader(a1, a4, a6, v24, a7, a8, (uint64_t)v28);
              if (!v27)
                v27 = MKUpdateLoader((uint64_t *)a1, a6, a2, v14, a9, a10);
            }
          }
        }
      }
      if (v17)
        CFRelease(v17);
    }
  }
  return v27;
}

uint64_t MKGetPartitionInfo(const __CFDictionary *a1, int a2, uint64_t a3)
{
  const __CFString *Value;
  uint64_t result;
  const __CFString *v8;
  const __CFNumber *v9;
  const __CFString *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFRange v13;

  *(_QWORD *)(a3 + 96) = 0;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Partition Type"));
  if (!Value)
    return 4294966879;
  result = PMCFSetupPartitionType(a2, Value, (unsigned __int16 *)(a3 + 100), (char *)(a3 + 33));
  if (!(_DWORD)result)
  {
    v8 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Partition Name"));
    if (v8)
      CFStringGetCString(v8, (char *)a3, 33, 0);
    v9 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Partition Size"));
    if (v9)
      CFNumberGetValue(v9, kCFNumberSInt32Type, (void *)(a3 + 88));
    v10 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Partition Signature"));
    if (v10)
    {
      v13.location = 0;
      v13.length = 4;
      CFStringGetBytes(v10, v13, 0, 0, 0, (UInt8 *)(a3 + 84), 4, 0);
    }
    v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Partition Position"));
    if (v11)
      CFNumberGetValue(v11, kCFNumberSInt32Type, (void *)(a3 + 92));
    v12 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Partition Options"));
    if (v12)
      CFNumberGetValue(v12, kCFNumberSInt32Type, (void *)(a3 + 96));
    result = (uint64_t)CFDictionaryGetValue(a1, CFSTR("Partition Processor"));
    if (result)
    {
      CFStringGetCString((CFStringRef)result, (char *)(a3 + 66), 17, 0);
      return 0;
    }
  }
  return result;
}

uint64_t PMCreateLoader(const void **a1, unsigned int a2, int a3, uint64_t a4, _BYTE *a5, int a6, uint64_t a7)
{
  __int16 *v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t result;
  int v19;
  __int16 *v20;
  unsigned int v21;
  unsigned int v22;
  _DWORD *v24;
  int v25;
  int v26;
  const void **v27;
  const char *v28;
  int v29;
  unsigned int v30;
  uint64_t v31;

  if (!a7)
    return 22;
  v9 = (__int16 *)*a1;
  v10 = (__int16)(a3 - 1);
  v11 = (uint64_t)*a1 + 1072 * (__int16)(a3 - 1);
  v12 = *((unsigned __int16 *)*a1 + 1);
  if (a2)
    v13 = a2;
  else
    v13 = v12 >> 9;
  v14 = PMConvertBlocks(*(unsigned int *)(a7 + 88), 0x200u, v12);
  v15 = PMConvertBlocks(a4, 0x200u, v12);
  v16 = v14 / v13;
  if (v14 % v13)
    ++v16;
  v17 = v16 * v13;
  if (!strcasecmp((const char *)(v11 + 576), (const char *)(a7 + 33)) && *(_DWORD *)(v11 + 540) == v17)
    return 0;
  if (v9[536 * v10 + 541] == 24320 && *(_DWORD *)(v11 + 540) >= v17)
  {
    v28 = PMCodeSearch(24320, v9[257]);
    result = strncasecmp((const char *)(a7 + 33), v28, 0x20uLL);
    if (!(_DWORD)result)
      return result;
    v29 = *(_DWORD *)(v11 + 536);
    v30 = *(_DWORD *)(v11 + 540) - v17;
    *(_DWORD *)(v11 + 540) = v30;
    v25 = v29 + v30;
    v27 = a1;
    v19 = a3;
  }
  else
  {
    v19 = a3;
    v20 = &v9[536 * a3];
    v21 = *((_DWORD *)v20 + 135);
    v22 = v21 - v17;
    if (v21 <= v17 || v21 < v15)
      return 28;
    if (!a6)
      return 1;
    v24 = v20 + 264;
    v25 = v24[2];
    v24[2] = v25 + v17;
    v24[3] = v22;
    v26 = v24[22] | 0x100000;
    v24[21] = v22;
    v24[22] = v26;
    v27 = a1;
  }
  result = PMGenPartition(v27, (char *)(a7 + 33), v25, v17, v12, 0, (_BYTE *)a7, 0, v19);
  if (!(_DWORD)result)
  {
    v31 = (uint64_t)*v27 + 1072 * v19;
    result = PMSetupLoader(v31 + 528, a5, a7);
    *(_DWORD *)(v31 + 996) |= 0x10u;
    *(_DWORD *)(v31 + 2068) |= 8u;
  }
  return result;
}

uint64_t PMSetupLoader(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t result;

  result = 22;
  if (a1 && a3)
  {
    *(_DWORD *)(a1 + 136) = *(_DWORD *)(a3 + 84);
    strncpypad((_BYTE *)(a1 + 120), (_BYTE *)(a3 + 66), 0x10uLL, 0);
    strncpypad((_BYTE *)(a1 + 472), a2, 0x20uLL, 0);
    if (!*(_BYTE *)(a1 + 16))
      strncpypad((_BYTE *)(a1 + 16), a2, 0x20uLL, 0);
    result = 0;
    *(_DWORD *)(a1 + 468) |= 0x20u;
  }
  return result;
}

uint64_t MKUpdateLoader(uint64_t *a1, int a2, __CFBundle *a3, CFDictionaryRef theDict, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *Value;
  const __CFDictionary *v14;
  CFStringRef v15;
  const __CFString *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const __CFBoolean *v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  int v23;
  int v24;
  unsigned int *v25;
  const void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  uint64_t v32;
  const __CFNumber *v33;
  int v35;
  uint64_t v36;
  __int16 v37;
  int valuePtr;
  char v39[1024];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  v37 = 0;
  v36 = 0;
  v35 = 0;
  v6 = *a1;
  v7 = *a1 + 1072 * a2;
  if (!*(_BYTE *)(v7 + 1000))
  {
    LOWORD(v24) = 0;
    return (__int16)v24;
  }
  Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Loaders"));
  if (!Value || (v14 = Value, (v15 = CFStringCreateWithCString(0, (const char *)(v7 + 1000), 0)) == 0))
  {
    LOWORD(v24) = -417;
    return (__int16)v24;
  }
  v16 = v15;
  v17 = (const __CFDictionary *)CFDictionaryGetValue(v14, v15);
  if (v17)
  {
    v18 = v17;
    v19 = (const __CFBoolean *)CFDictionaryGetValue(v17, CFSTR("Loader Present"));
    if (v19 && !CFBooleanGetValue(v19))
    {
      v24 = 0;
    }
    else
    {
      v20 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Major Vers"));
      if (v20)
        CFNumberGetValue(v20, kCFNumberSInt16Type, &valuePtr);
      v21 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Minor Vers"));
      if (v21)
        CFNumberGetValue(v21, kCFNumberSInt16Type, &v37);
      v22 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Checksum"));
      if (v22)
      {
        CFNumberGetValue(v22, kCFNumberSInt32Type, (char *)&v36 + 4);
        v23 = HIDWORD(v36);
      }
      else
      {
        v23 = 0;
      }
      v25 = (unsigned int *)(v7 + 528);
      if ((v23 || (_WORD)valuePtr || v37)
        && (!v23 || v23 == *(_DWORD *)(v7 + 644))
        && (!(_WORD)valuePtr || (unsigned __int16)valuePtr == *(unsigned __int16 *)(v6 + 1072 * a2 + 992))
        && (!v37 || v37 == *(_WORD *)(v6 + 1072 * a2 + 994)))
      {
        v24 = -1306;
      }
      else
      {
        v26 = CFDictionaryGetValue(v18, CFSTR("Loader Name"));
        if (v26)
        {
          v27 = v26;
          CFRelease(v16);
          v16 = (const __CFString *)CFRetain(v27);
        }
        v24 = ResolveLoaderPath(a3, v18, v16, v39);
        if (!v24)
        {
          v28 = *(unsigned __int16 *)(v6 + 2);
          v29 = v25[2];
          v30 = v25[3] >= 0xC8 ? 200 : v25[3];
          v35 = v30;
          v24 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))a6)(a5, 4, v28, v29);
          if (!v24)
          {
            v24 = PMWriteContentInternal(v6, a2, v39, 0, 0x7D0000u, &v35, a5, a6);
            v25[21] = v35;
            if (!v24)
            {
              v24 = PMChecksumExtended((uint64_t)a1, a2, 0, (uint64_t)&v36, 0x7D0000u, 0, 1, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))a6);
              if (!v24)
              {
                v31 = v36;
                if (!HIDWORD(v36) || HIDWORD(v36) == (_DWORD)v36)
                {
                  v32 = *a1 + 1072 * a2;
                  *(_WORD *)(v32 + 992) = valuePtr;
                  *(_WORD *)(v32 + 994) = v37;
                  *(_DWORD *)(v32 + 644) = v31;
                  v33 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Post Action Code"));
                  if (v33)
                  {
                    CFNumberGetValue(v33, kCFNumberSInt16Type, (char *)&valuePtr + 2);
                    if (HIWORD(valuePtr))
                      v24 = 22;
                    else
                      v24 = 0;
                  }
                  else
                  {
                    v24 = 0;
                  }
                }
                else
                {
                  v24 = -5349;
                }
              }
            }
          }
        }
        if (!v16)
          goto LABEL_47;
      }
    }
  }
  else
  {
    v24 = -415;
  }
  CFRelease(v16);
LABEL_47:
  if (v24 == -1)
    v24 = *__error();
  return (__int16)v24;
}

uint64_t PMWriteContentInternal(uint64_t a1, int a2, const char *a3, int a4, unsigned int a5, _DWORD *a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  size_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int v20;
  int v21;
  gzFile_s *v22;
  gzFile_s *v23;
  int v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  int v30;
  unsigned __int16 v31;
  int v32;
  _DWORD *v33;

  v13 = *(unsigned __int16 *)(a1 + 2);
  if (a5)
    v14 = a5;
  else
    v14 = 8192000;
  if (v14 % v13)
    v15 = v14 / v13 + 1;
  else
    v15 = v14 / v13;
  v16 = v15 * v13;
  v17 = (char *)malloc_type_calloc(1uLL, v16, 0xC3F79865uLL);
  if (!v17)
  {
    v25 = 0;
    LOWORD(v32) = 0;
    v31 = -1;
    v33 = a6;
    if (!a6)
      goto LABEL_31;
    goto LABEL_30;
  }
  v18 = v17;
  if (a2 >= *(unsigned __int16 *)(a1 + 522))
  {
    v25 = 0;
    LOWORD(v32) = 0;
    v31 = -5343;
LABEL_25:
    v33 = a6;
    goto LABEL_29;
  }
  v19 = a1 + 1072 * a2;
  v20 = *(_DWORD *)(v19 + 536);
  v21 = *(_DWORD *)(v19 + 540);
  v22 = gzopen(a3, "rb");
  if (!v22)
  {
    v25 = 0;
    LOWORD(v32) = 0;
    v31 = -1;
    goto LABEL_25;
  }
  v23 = v22;
  v24 = gzread(v22, v18, v16);
  v25 = 0;
  if (v24)
  {
    v26 = (v21 + v20);
    v27 = (v20 + a4);
    while (1)
    {
      v28 = v24;
      if (v16 != v24)
        bzero(&v18[v24], v16 - v24);
      if (v28 % v13)
        v29 = v28 / v13 + 1;
      else
        v29 = v28 / v13;
      if (v29 + v27 > v26)
      {
        v31 = -5344;
        goto LABEL_28;
      }
      v30 = a8(a7, 3, v13, v27, v29, v18);
      if (v30)
        break;
      v25 += v29;
      v24 = gzread(v23, v18, v16);
      v27 += v29;
      if (!v24)
        goto LABEL_20;
    }
    v31 = v30;
  }
  else
  {
LABEL_20:
    v31 = 0;
  }
LABEL_28:
  v33 = a6;
  LOWORD(v32) = gzclose(v23);
LABEL_29:
  free(v18);
  if (v33)
LABEL_30:
    *v33 = v25;
LABEL_31:
  if (v31)
  {
    LOWORD(v32) = v31;
    if (v31 == 0xFFFF)
      v32 = *__error();
  }
  return (__int16)v32;
}

uint64_t PMChecksumExtended(uint64_t a1, int a2, unint64_t a3, uint64_t a4, unsigned int a5, int a6, char a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))
{
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void (*v33)(uint64_t, void *, _QWORD);
  unint64_t v34;
  uint64_t v35;
  int v36;
  int v37;

  if (a1)
  {
    v15 = *(unsigned __int16 *)(*(_QWORD *)a1 + 2);
    if (a5)
      v16 = a5;
    else
      v16 = 8192000;
    if (v16 % v15)
      v17 = v16 / v15 + 1;
    else
      v17 = v16 / v15;
    v18 = v17 * v15;
    v19 = malloc_type_calloc(1uLL, v17 * v15, 0x97874038uLL);
    if (!v19)
    {
LABEL_38:
      v37 = *__error();
      return (__int16)v37;
    }
    v20 = v19;
    if (a2 >= *(unsigned __int16 *)(*(_QWORD *)a1 + 522))
      goto LABEL_35;
    v21 = *(_QWORD *)a1 + 1072 * a2;
    v22 = v21 + 528;
    v23 = *(unsigned int *)(v21 + 536);
    if ((a7 & 1) == 0 || (v24 = *(_DWORD *)(v22 + 84)) == 0)
      v24 = *(_DWORD *)(v22 + 12);
    v25 = v24;
    v26 = v23 + a6;
    v27 = v25 - a6;
    if (!a6)
    {
      v26 = v23;
      v27 = v25;
    }
    v28 = v25 + a6;
    v29 = a6 >= 0;
    if (a6 < 0)
      v30 = v23;
    else
      v30 = v26;
    if (v29)
      v31 = v27;
    else
      v31 = v28;
    v32 = MKBlockChecksum;
    if (a3 == 1)
      v32 = MKBlockChecksum2;
    v33 = a3 >= 0xA
        ? (void (*)(uint64_t, void *, _QWORD))a3
        : (void (*)(uint64_t, void *, _QWORD))v32;
    if (v31)
    {
      v34 = v18 / v15;
      while (1)
      {
        v35 = v31 >= v34 ? v34 : v31;
        v36 = a9(a8, 2, v15, v30, v35, v20);
        if (v36)
          break;
        v33(a4, v20, (v35 * v15));
        v30 += v35;
        v31 -= v35;
        if (!v31)
        {
          LOWORD(v37) = 0;
          goto LABEL_36;
        }
      }
      v37 = v36;
      free(v20);
      if (v37 == -1)
        goto LABEL_38;
    }
    else
    {
LABEL_35:
      LOWORD(v37) = -5343;
LABEL_36:
      free(v20);
    }
  }
  else
  {
    LOWORD(v37) = -50;
  }
  return (__int16)v37;
}

uint64_t MKBlockChecksum(_DWORD *a1, unsigned int *a2, unsigned int a3)
{
  uint64_t v3;
  unsigned int *v4;
  unint64_t v5;
  unsigned int v6;

  v3 = *a1;
  if (a2 && a3 >= 4)
  {
    v4 = (unsigned int *)((char *)a2 + (a3 & 0xFFFFFFFC));
    do
    {
      HIDWORD(v5) = v3;
      LODWORD(v5) = v3;
      v6 = *a2++;
      v3 = bswap32(v6) + (v5 >> 31);
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

char *OSType2Ascii(uint64_t a1, char *a2, char a3)
{
  uint64_t v4;
  const char *v5;
  uint64_t v7;

  HIDWORD(v7) = a1;
  *a2 = 0;
  if ((_DWORD)a1 || (a3 & 1) == 0)
  {
    v4 = 0;
    while (*((char *)&v7 + v4 + 4) > 47)
    {
      if (++v4 == 4)
      {
        sprintf(a2, "%4.4s");
        return a2;
      }
    }
    if ((a3 & 2) != 0)
      v5 = "0x%08x";
    else
      v5 = "%08x";
    sprintf(a2, v5, a1, v7);
  }
  return a2;
}

uint64_t MKCFUpdateScheme(const __CFDictionary *a1, __CFBundle *a2, unsigned int a3, const __CFDictionary *a4, uint64_t a5)
{
  const __CFString *Value;
  const __CFArray *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  __CFDictionary *MutableCopy;
  uint64_t v15;
  const __CFDictionary *v17;
  int v18;
  uint64_t v19;
  char buffer[32];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 22;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("ID"));
  if (!Value)
    return 22;
  if (!CFStringGetCString(Value, buffer, 32, 0))
    return 22;
  v11 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Sections"));
  if (!v11)
    return 22;
  v12 = CFArrayDictionarySearchWithIndexOptions(v11, CFSTR("ID"), CFSTR("MAP"), 0, 0);
  if (!v12)
    return 22;
  v13 = v12;
  if (a4)
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, a4);
  else
    MutableCopy = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v17 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, CFSTR("Write Protect"), (const void *)*MEMORY[0x24BDBD270]);
    v18 = PMSchemeSearchByDescriptor(buffer, 0);
    if (v18 == 16)
    {
      v19 = GPTCFUpdateSection(v13, a2, a3, v17, a5);
    }
    else if ((unsigned __int16)v18 == 8)
    {
      v19 = MBRCFUpdateSection(v13, (uint64_t)a2, a3, v17);
    }
    else
    {
      if ((unsigned __int16)v18 != 1)
      {
        v15 = 4294961989;
        goto LABEL_21;
      }
      v19 = APMCFUpdateSection(v13, a2, a3, v17, a5, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
    }
    v15 = v19;
LABEL_21:
    CFRelease(v17);
    return v15;
  }
  return 12;
}

uint64_t MKCFPrepareBootDevice(char *a1, __CFString *a2, const __CFString *a3, int a4, unsigned int a5, _DWORD *a6, _BYTE *a7)
{
  const __CFArray *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  const void *v16;
  __CFDictionary *v17;
  const __CFString *v18;
  __CFDictionary *v20;
  __CFDictionary *v21;
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v24;
  const __CFDictionary *v25;
  const __CFString *v26;
  const __CFDictionary *v27;
  const __CFNumber *v28;
  char *v29;
  unsigned int v30;
  const __CFDictionary *v31;
  const void *v32;
  const __CFString *v33;
  char *v34;
  const __CFDictionary *v35;
  const __CFArray *v36;
  const __CFDictionary *theDict;
  uint64_t *theDicta;
  const __CFDictionary *v39;
  BOOL v40;
  unsigned __int16 v41;
  CFTypeRef cf;
  uint64_t v43;
  int valuePtr;
  unsigned int UUID;
  char __s[32];
  _OWORD v47[2];
  char buffer[16];
  __int128 v49;
  unsigned __int128 v50;
  char bsdName[32];
  char v52[32];
  char v53[32];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v43 = 0;
  v50 = 0uLL;
  v41 = 0;
  *(_OWORD *)buffer = 0u;
  v49 = 0u;
  memset(v47, 0, sizeof(v47));
  v40 = 0;
  valuePtr = 0;
  UUID = 22;
  LOBYTE(v13) = 0;
  if ((int)MKBSDSlice(a1, (uint64_t)&v43 + 4, (uint64_t)&v43, 0) < 2)
    goto LABEL_15;
  __sprintf_chk(v53, 0, 0x20uLL, "disk%i", HIDWORD(v43));
  __sprintf_chk(v52, 0, 0x20uLL, "/dev/r%s", v53);
  __sprintf_chk(bsdName, 0, 0x20uLL, "disk%is%i", HIDWORD(v43), v43);
  if (!(_DWORD)v43 || (Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0])) == 0)
  {
    LOBYTE(v13) = 0;
    goto LABEL_15;
  }
  v15 = Mutable;
  v16 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(Mutable, CFSTR("Writable"), (const void *)*MEMORY[0x24BDBD270]);
  if ((a4 & 2) != 0)
    CFDictionarySetValue(v15, CFSTR("Shared Writer"), v16);
  UUID = DevEntryCopyRegistryProperties(bsdName, (CFMutableDictionaryRef *)&cf);
  if (UUID)
  {
    LOBYTE(v13) = 0;
    v17 = v15;
LABEL_14:
    CFRelease(v17);
    goto LABEL_15;
  }
  v18 = (const __CFString *)MKMediaCreateWithPath(0, v52, v15, &UUID);
  if (UUID)
  {
    LOBYTE(v13) = 0;
    v17 = 0;
    goto LABEL_11;
  }
  v20 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v17 = v20;
  if (v20)
  {
    CFDictionarySetValue(v20, CFSTR("Include most"), v16);
    v21 = MKCFReadMedia(v17, v18, (int *)&UUID);
    if (v21)
    {
      UUID = -5343;
      v39 = v21;
      Value = (const __CFArray *)CFDictionaryGetValue(v21, CFSTR("Schemes"));
      if (!Value)
        goto LABEL_32;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
      if (!ValueAtIndex)
        goto LABEL_32;
      v24 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Sections"));
      if (!v24)
        goto LABEL_32;
      v25 = CFArrayDictionarySearchWithIndexOptions(v24, CFSTR("ID"), CFSTR("MAP"), 0, 0);
      if (!v25)
        goto LABEL_32;
      theDict = v25;
      v13 = (const __CFArray *)CFDictionaryGetValue(v25, CFSTR("Partitions"));
      if (!v13)
      {
LABEL_33:
        MKCFDisposeMedia(v39);
        goto LABEL_11;
      }
      v26 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Partition ID"));
      if (!v26
        || (v27 = CFArrayDictionarySearchWithIndexOptions(v13, CFSTR("Partition ID"), v26, 0, 0)) == 0
        || (v35 = v27,
            CFRelease(cf),
            cf = 0,
            (UUID = CFDictionaryGetUUID(v35, CFSTR("GUID"), (unsigned __int8 *)&v50)) != 0))
      {
LABEL_32:
        LOBYTE(v13) = 0;
        goto LABEL_33;
      }
      v28 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Revision"));
      if (v28)
        CFNumberGetValue(v28, kCFNumberSInt32Type, &valuePtr);
      v36 = v13;
      theDicta = (uint64_t *)mkcfrecoverref(theDict);
      if (valuePtr == 0x10000)
      {
        LOBYTE(v13) = 0;
        UUID = GPTMakePartBootable(0, theDicta, (unsigned __int8 *)&v50, a2, a3, (uint64_t)v18, a4, a5, &v40);
        if (UUID || !v40)
          goto LABEL_58;
        UUID = GPTWriteMedia(theDicta, 0, (uint64_t)v18);
        if (UUID)
          goto LABEL_55;
        v30 = GPTUpdatePartitionDictionaries(theDicta, v36);
      }
      else
      {
        if (valuePtr)
        {
          LOBYTE(v13) = 0;
          UUID = 0;
LABEL_58:
          CFRelease(v18);
          if (!UUID)
          {
            UUID = -5343;
            v18 = (const __CFString *)uuid2cfstr((CFUUIDBytes *)&v50);
            if (!v18)
              goto LABEL_33;
            v31 = CFArrayDictionarySearchWithIndexOptions(v36, CFSTR("GUID"), v18, 0, 0);
            CFRelease(v18);
            if (v31)
            {
              v32 = CFDictionaryGetValue(v31, CFSTR("Partition ID"));
              if (v32)
              {
                UUID = DevEntryCopyChildPropertiesMatchingProperty(v53, CFSTR("Partition ID"), v32, &cf);
                if (!UUID)
                {
                  v33 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("BSD Name"));
                  CFStringGetCString(v33, __s, 32, 0x8000100u);
                  v34 = strrchr(__s, 115);
                  v18 = 0;
                  LODWORD(v43) = atoi(v34 + 1);
                  goto LABEL_33;
                }
              }
            }
          }
          v18 = 0;
          goto LABEL_33;
        }
        if (a2)
        {
          UUID = PMCFSetupPartitionType(*(__int16 *)(*theDicta + 514), a2, &v41, (char *)v47);
          if (UUID)
            a2 = 0;
          else
            a2 = (__CFString *)v47;
        }
        if (a3)
        {
          v29 = buffer;
          CFStringGetCString(a3, buffer, 32, 0);
        }
        else
        {
          v29 = 0;
        }
        LOBYTE(v13) = 0;
        UUID = MKMakePartBootable(0, (const void **)theDicta, &v50, v41, (char *)a2, v29, a4, (uint64_t)v18, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO, &v40);
        if (UUID || !v40)
          goto LABEL_58;
        UUID = VWritePartitions((Ptr *)theDicta, 0xFFFFu, 0xC090u, (uint64_t)v18, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))MKMediaDeviceIO);
        if (UUID)
        {
LABEL_55:
          LOBYTE(v13) = 0;
          goto LABEL_58;
        }
        v30 = MKCFRecordPartitions(theDicta, v36);
      }
      UUID = v30;
      LOBYTE(v13) = 1;
      goto LABEL_58;
    }
    LOBYTE(v13) = 0;
  }
  else
  {
    LOBYTE(v13) = 0;
    UUID = 12;
  }
LABEL_11:
  if (v18)
    CFRelease(v18);
  CFRelease(v15);
  if (v17)
    goto LABEL_14;
LABEL_15:
  if (cf)
    CFRelease(cf);
  if (a6)
    *a6 = v43;
  if (a7)
    *a7 = (_BYTE)v13;
  return UUID;
}

uint64_t GPTMakePartBootable(__CFBundle *a1, uint64_t *a2, unsigned __int8 *a3, __CFString *a4, const __CFString *a5, uint64_t a6, int a7, unsigned int a8, BOOL *a9)
{
  __CFBundle *v16;
  const __CFURL *v17;
  const __CFURL *v18;
  const __CFURL *v19;
  uint64_t v21;
  int v22;
  unsigned int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  const __CFString *v29;
  const __CFString *v30;
  unsigned int v31;
  const char *v32;
  const __CFString *v33;
  const __CFString *v34;
  int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  const __CFURL *cf;
  _OWORD v44[10];
  int v45;
  __int16 v46;
  unsigned int v47;
  __int16 buffer[48];
  char v49[96];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v47 = 22;
  *a9 = 0;
  v16 = a1;
  if (!a1)
  {
    v16 = MKAccessLibrary(0);
    if (!v16)
    {
      LODWORD(a4) = 0;
      goto LABEL_14;
    }
  }
  v46 = 0;
  v45 = 0;
  memset(v44, 0, 154);
  v17 = MKLoadDB(v16, CFSTR("database"), (int *)&v47);
  if (!v17)
  {
    LODWORD(a4) = 0;
    if (!a1)
      goto LABEL_12;
    goto LABEL_14;
  }
  v18 = v17;
  v19 = MKLoadDB(v16, CFSTR("inventory"), (int *)&v47);
  if (v19)
  {
    cf = v19;
    v47 = gpmrsearch(a2, a3, &v46);
    if (v47)
    {
      LODWORD(a4) = 0;
LABEL_7:
      CFRelease(v18);
      v18 = cf;
      goto LABEL_11;
    }
    v41 = a7;
    v21 = *a2;
    v22 = v46;
    v23 = *(_DWORD *)(*a2 + 32);
    v24 = v23 >= 0x400;
    v25 = a8 / (v23 >> 9);
    if (!v24)
      v25 = a8;
    v40 = v25;
    v38 = v46;
    v39 = *a2;
    if (a4)
    {
      v26 = *a2;
      v27 = v46;
      CFStringGetCString(a4, (char *)buffer, 96, 0x8000100u);
      GPTuuidType2HumanExtended(buffer, (const char *)buffer, 96, 0, 0);
      v28 = utf8strcompare(1uLL, (char *)(v26 + 152 * v27 + 144), (const char *)buffer);
      if (!a5)
      {
        if (!v28)
        {
          LODWORD(a4) = 0;
          goto LABEL_32;
        }
        goto LABEL_27;
      }
      v22 = v38;
      v21 = v39;
    }
    else
    {
      v28 = 0;
      if (!a5)
      {
LABEL_33:
        v29 = CFStringCreateWithCString(0, (const char *)(v21 + 152 * v22 + 144), 0);
        if (!v29)
        {
          v47 = -1;
          goto LABEL_7;
        }
        v30 = v29;
        v47 = MKLookupSchemeFormat(v18, CFSTR("GPT"), v29, 1, v44);
        CFRelease(v30);
        if (v47 || !LOWORD(v44[0]))
          goto LABEL_7;
        v31 = 0;
        v32 = (char *)v44 + 2;
        while (1)
        {
          v33 = CFStringCreateWithCString(0, v32, 0);
          if (!v33)
            goto LABEL_7;
          v34 = v33;
          v35 = *((unsigned __int16 *)v32 + 17);
          if (v35 == 6)
            break;
          if (v35 != 5)
          {
            if (v35 == 1)
              break;
            v47 = -4;
          }
LABEL_47:
          CFRelease(v34);
          if (!v47)
          {
            ++v31;
            v32 += 38;
            if (v31 < LOWORD(v44[0]))
              continue;
          }
          goto LABEL_7;
        }
        v36 = mediaLoaderSupport(v16, v33, a2, a3, a6, v35, v40, v41, 0, 1u, 0, &v45);
        if (v36 == 28)
          v37 = 0;
        else
          v37 = v36;
        v47 = v37;
        if (!v37)
          LODWORD(a4) = (v45 & 1) + (_DWORD)a4;
        goto LABEL_47;
      }
    }
    a4 = (__CFString *)(v21 + 152 * v22 + 96);
    CFStringGetCString(a5, v49, 96, 0x8000100u);
    LODWORD(a4) = utf8strcompare(1uLL, (char *)a4, v49);
    if (v28)
    {
      __strlcpy_chk();
      if (!(_DWORD)a4)
        goto LABEL_28;
    }
    else if (!(_DWORD)a4)
    {
      goto LABEL_32;
    }
LABEL_27:
    __strlcpy_chk();
LABEL_28:
    if ((v41 & 4) == 0)
    {
      v22 = v38;
      v21 = v39;
      *(_QWORD *)(v39 + 152 * v38 + 232) |= 8uLL;
      LODWORD(a4) = 1;
      goto LABEL_33;
    }
    LODWORD(a4) = 1;
LABEL_32:
    v22 = v38;
    v21 = v39;
    goto LABEL_33;
  }
  LODWORD(a4) = 0;
LABEL_11:
  CFRelease(v18);
  if (!a1)
LABEL_12:
    CFRelease(v16);
LABEL_14:
  *a9 = (int)a4 > 0;
  return v47;
}

uint64_t DevEntryCopyChildPropertiesMatchingProperty(char *bsdName, const __CFString *a2, const void *a3, _QWORD *a4)
{
  mach_port_t v7;
  const __CFDictionary *v8;
  uint64_t MatchingService;
  io_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  io_object_t v17;
  io_registry_entry_t v18;
  const __CFAllocator *v19;
  CFTypeRef CFProperty;
  CFMutableDictionaryRef v21;
  io_iterator_t iterator;

  iterator = 0;
  v21 = 0;
  v7 = *MEMORY[0x24BDD8B18];
  v8 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, bsdName);
  MatchingService = IOServiceGetMatchingService(v7, v8);
  if (!(_DWORD)MatchingService)
  {
    v12 = 2;
    goto LABEL_15;
  }
  v10 = MatchingService;
  v11 = MEMORY[0x2199A57D8](MatchingService, "IOService", &iterator);
  if ((_DWORD)v11)
  {
    v12 = v11;
    LODWORD(v13) = 0;
    goto LABEL_13;
  }
  v14 = IOIteratorNext(iterator);
  if (!(_DWORD)v14)
  {
LABEL_9:
    IOObjectRelease(iterator);
    LODWORD(v13) = 0;
    iterator = 0;
LABEL_10:
    v12 = 22;
    goto LABEL_13;
  }
  v13 = v14;
  while (!IOObjectConformsTo(v13, "IOPartitionScheme"))
  {
    IOObjectRelease(v13);
    v13 = IOIteratorNext(iterator);
    if (!(_DWORD)v13)
      goto LABEL_9;
  }
  IOObjectRelease(iterator);
  iterator = 0;
  v15 = MEMORY[0x2199A57D8](v13, "IOService", &iterator);
  if (!(_DWORD)v15)
  {
    v17 = IOIteratorNext(iterator);
    if (v17)
    {
      v18 = v17;
      v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      v12 = 22;
      while (1)
      {
        CFProperty = IORegistryEntryCreateCFProperty(v18, a2, v19, 0);
        if (CFProperty)
        {
          if (CFEqual(CFProperty, a3))
            break;
        }
        IOObjectRelease(v18);
        v18 = IOIteratorNext(iterator);
        if (!v18)
          goto LABEL_13;
      }
      v12 = IORegistryEntryCreateCFProperties(v18, &v21, v19, 0);
      IOObjectRelease(v18);
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  v12 = v15;
LABEL_13:
  IOObjectRelease(v10);
  if ((_DWORD)v13)
    IOObjectRelease(v13);
LABEL_15:
  if (iterator)
    IOObjectRelease(iterator);
  *a4 = v21;
  return v12;
}

uint64_t MKMediaCreateWithSubRange(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, _DWORD *a5)
{
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  uint64_t result;
  _QWORD *v14;
  int v15;

  v15 = 22;
  if (!a2
    || ((v9 = *(_QWORD *)(a2 + 96), v9 > a3) ? (v10 = a4 + a3 > v9) : (v10 = 1),
        v10 || (v11 = (unint64_t)*(unsigned int *)(a2 + 104) >> 9, v15 = -5308, a3 % v11) || a4 % v11))
  {
    result = 0;
  }
  else
  {
    result = (uint64_t)malloc_type_malloc(0x28uLL, 0x1060040762F0DD2uLL);
    if (result)
    {
      v14 = (_QWORD *)result;
      *(_DWORD *)result = 1296790386;
      *(_QWORD *)(result + 8) = CFRetain((CFTypeRef)a2);
      v14[2] = a3;
      v14[3] = a4;
      v14[4] = 0;
      v15 = 0;
      result = MKMediaCreate(a1, (uint64_t)v14, (uint64_t)&kMKMediaSubRangeVector, 0, &v15);
      if (result)
        *(_QWORD *)(result + 124) = *(_QWORD *)(a2 + 124);
    }
    else
    {
      v15 = 12;
    }
  }
  if (a5)
    *a5 = v15;
  return result;
}

uint64_t _MKMediaSubRangeInitialize(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v3;
  const void **v4;
  CFNumberRef v5;
  uint64_t valuePtr;
  __int128 v8;
  __int128 v9;

  if (!a1)
    return 22;
  if (*(_DWORD *)a1 != 1296790386)
    return 22;
  v8 = 0u;
  v9 = 0u;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 32) = Mutable;
  if (!Mutable)
    return *__error();
  v3 = Mutable;
  MKMediaGetGeometry(*(_QWORD *)(a1 + 8), (uint64_t)&v8);
  v4 = (const void **)MEMORY[0x24BDBD270];
  if (!DWORD2(v9))
    v4 = (const void **)MEMORY[0x24BDBD268];
  CFDictionaryAddValue(v3, CFSTR("Writable"), *v4);
  valuePtr = *(_QWORD *)(a1 + 16);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("Subrange Offset"), v5);
  CFRelease(v5);
  return 0;
}

const void *_MKMediaSubRangeCopyProperty(uint64_t a1, void *key)
{
  const __CFDictionary *v4;
  const void *v5;
  const void *Value;
  __CFDictionary *Mutable;

  if (!key)
    return 0;
  v4 = *(const __CFDictionary **)(a1 + 32);
  if (v4 && (v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    Value = v5;
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    _MKMediaSubRangeGetGeoProperties(a1, Mutable);
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
      goto LABEL_8;
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable)
    CFRelease(Mutable);
  return Value;
}

uint64_t _MKMediaSubRangeGetGeoProperties(uint64_t a1, __CFDictionary *a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;

  if (!a1)
    return 22;
  if (*(_DWORD *)a1 != 1296790386)
    return 22;
  v7 = 0u;
  v8 = 0u;
  MKMediaGetGeometry(*(_QWORD *)(a1 + 8), (uint64_t)&v7);
  v4 = *(_QWORD *)(a1 + 24);
  if ((unint64_t)v8 >= v4)
    v5 = *(_QWORD *)(a1 + 24);
  else
    v5 = v8;
  return _MKMediaSetupGeometry(a2, v7, v4, v5);
}

uint64_t MKFileSystemDetect(uint64_t a1, int *a2, int *a3, _DWORD *a4)
{
  char *v8;
  unsigned __int8 *v9;
  uint64_t Blocks;
  uint64_t v11;

  *a2 = 0;
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v8 = (char *)malloc_type_malloc(0x1000uLL, 0x739AAA81uLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = (unsigned __int8 *)v8;
  Blocks = MKMediaReadBlocks(a1, 0, 1, 0x1000u, v8, 0);
  if (!(_DWORD)Blocks)
  {
    v11 = MKDetectHFS(a1, v9, a2, a3, a4);
    if (*a2 <= 4999
      && (v11 = MKDetectAPFS(a1, (uint64_t)v9, a2, a3, a4), *a2 <= 4999)
      && (v11 = MKDetectEFATFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (v11 = MKDetectFATFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (v11 = MKDetectNTFS(a1, v9, a2, a3, a4), *a2 <= 4999)
      && (v11 = MKDetectISO(a1, a2, a4, 0), *a2 <= 4999))
    {
      Blocks = 0;
      *a2 = 0;
    }
    else
    {
      Blocks = v11;
    }
  }
  free(v9);
  return Blocks;
}

uint64_t _MKMediaSubRangeReadSectors(uint64_t a1, uint64_t a2, unint64_t a3, char *a4, _QWORD *a5)
{
  return MKMediaReadSectors(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16) + a2, a3, a4, a5);
}

uint64_t MKDetectHFS(uint64_t a1, _WORD *a2, _DWORD *a3, int *a4, _DWORD *a5)
{
  char *v10;
  char *v11;
  uint64_t Blocks;
  unsigned int v13;
  int v14;

  *a3 = 0;
  if (a4)
    *a4 = 0;
  v10 = (char *)malloc_type_malloc(0x200uLL, 0xA7D2099DuLL);
  if (v10)
  {
    v11 = v10;
    if (*a2 == 19276)
      *a3 += 1000;
    Blocks = MKMediaReadBlocks(a1, 2, 1, 0x200u, v10, 0);
    if ((_DWORD)Blocks)
      goto LABEL_20;
    v13 = bswap32(*(unsigned __int16 *)v11) >> 16;
    switch(v13)
    {
      case 0x4858u:
        v14 = 4;
        break;
      case 0x482Bu:
        v14 = 2;
        break;
      case 0x4244u:
        if (*((_WORD *)v11 + 62) == 11080)
          v14 = 3;
        else
          v14 = 1;
        break;
      default:
LABEL_20:
        free(v11);
        return Blocks;
    }
    *a3 = 5000;
    if (a5)
      *a5 = 1;
    if (a4)
      *a4 = v14;
    goto LABEL_20;
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKHFSProcessVolumeUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unsigned int v7;
  int v9;
  double v10;
  CC_MD5_CTX v11;
  unsigned __int16 v12[10];
  unsigned int v13;
  unsigned __int16 v14;
  uint64_t v15;
  __int16 v16;
  unsigned __int16 v17;
  _QWORD data[2];

  data[1] = *MEMORY[0x24BDAC8D0];
  memset(&v11, 0, sizeof(v11));
  result = MKMediaReadBlocks(a1, 2, 1, 0x200u, (char *)v12, 0);
  if ((_DWORD)result)
    return result;
  v7 = bswap32(v12[0]) >> 16;
  if (v7 == 18520 || v7 == 18475)
  {
    v9 = 0;
    goto LABEL_9;
  }
  if (v7 != 16964)
    return 4294967239;
  TAO_HFSMasterDirectoryBlock_BigToHost(v12);
  if (v16 != 18475)
    return 4294967173;
  v9 = v14 + (v13 >> 9) * v17;
  result = MKMediaReadBlocks(a1, (v9 + 2), 1, 0x200u, (char *)v12, 0);
  if (!(_DWORD)result)
  {
LABEL_9:
    v10 = TAO_HFSPlusVolumeHeader_BigToHost(v12);
    if ((_DWORD)a2)
    {
      if ((_DWORD)a2 != 1)
      {
        if ((_DWORD)a2 != 2)
          return 22;
        MEMORY[0x2199A5D48](a3, v10);
      }
      v15 = *(_QWORD *)(a3 + 4);
      TAO_HFSPlusVolumeHeader_BigToHost(v12);
      a2 = MKMediaWriteBlocks(a1, (v9 + 2), 1, 0x200u, (char *)v12, 0);
    }
    data[0] = v15;
    CC_MD5_Init(&v11);
    CC_MD5_Update(&v11, &unk_212DE4530, 0x10u);
    CC_MD5_Update(&v11, data, 8u);
    CC_MD5_Final((unsigned __int8 *)a3, &v11);
    *(_BYTE *)(a3 + 6) = *(_BYTE *)(a3 + 6) & 0xF | 0x30;
    *(_BYTE *)(a3 + 8) = *(_BYTE *)(a3 + 8) & 0x3F | 0x80;
    return a2;
  }
  return result;
}

double TAO_HFSPlusVolumeHeader_BigToHost(unsigned __int16 *a1)
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
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 56));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 96));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 136));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 176));
  *(_QWORD *)&result = TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 216)).n128_u64[0];
  return result;
}

__n128 TAO_HFSPlusForkData_BigToHost(uint64_t a1)
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

__n128 TAO_HFSPlusExtentRecord_BigToHost(uint64_t a1)
{
  uint64_t i;
  float *v2;
  float32x4x2_t v4;
  float32x4x2_t v5;

  for (i = 0; i != 64; i += 32)
  {
    v2 = (float *)(a1 + i);
    v4 = vld2q_f32(v2);
    v5.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[0]);
    v5.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v4.val[1]);
    vst2q_f32(v2, v5);
  }
  return (__n128)v4.val[0];
}

int8x8_t TAO_HFSPlusExtentDescriptor_BigToHost(int8x8_t *a1)
{
  int8x8_t result;

  result = vrev32_s8(*a1);
  *a1 = result;
  return result;
}

uint64_t _MKMediaSubRangeWriteSectors(uint64_t a1, uint64_t a2, unint64_t a3, char *a4, _QWORD *a5)
{
  return MKMediaWriteSectors(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16) + a2, a3, a4, a5);
}

void _MKMediaSubRangeDeinitialize(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  if (a1 && *(_DWORD *)a1 == 1296790386)
  {
    v2 = (const void *)a1[1];
    if (v2)
    {
      CFRelease(v2);
      a1[1] = 0;
    }
    v3 = (const void *)a1[4];
    if (v3)
      CFRelease(v3);
    free(a1);
  }
}

uint64_t MKCFUpdateMedia(const __CFDictionary *a1, __CFBundle *a2, unsigned __int16 a3, const __CFDictionary *a4, uint64_t a5)
{
  const __CFArray *Value;
  const __CFArray *v9;
  uint64_t Count;
  CFIndex v11;
  uint64_t v12;
  const __CFDictionary *ValueAtIndex;
  __CFDictionary *v14;
  const __CFNumber *v15;
  uint64_t v16;
  CFNumberRef v17;
  unsigned int v18;
  BOOL v19;
  unsigned __int16 valuePtr;

  valuePtr = a3;
  if (!a1)
    return 22;
  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Schemes"));
  if (!Value)
    return 22;
  v9 = Value;
  Count = (unsigned __int16)CFArrayGetCount(Value);
  if (!Count)
    return 22;
  v11 = 0;
  v12 = 0;
  do
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v11);
    if (ValueAtIndex)
    {
      v14 = ValueAtIndex;
      if (valuePtr != 1)
      {
        if (valuePtr)
        {
          v17 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
          CFDictionarySetValue(v14, CFSTR("Alignment"), v17);
          CFRelease(v17);
        }
        else
        {
          v15 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Alignment"));
          if (v15)
            CFNumberGetValue(v15, kCFNumberSInt16Type, &valuePtr);
        }
      }
      v18 = MKCFUpdateScheme(v14, a2, valuePtr, a4, a5);
      if (v18)
        v19 = (_DWORD)v12 == 0;
      else
        v19 = 0;
      if (v19)
        v16 = 0;
      else
        v16 = v18;
      if (v19)
        v12 = v18;
      else
        v12 = v12;
    }
    else
    {
      v16 = 0xFFFFFFFFLL;
    }
    ++v11;
  }
  while (Count != v11);
  if (!(_DWORD)v12)
  {
    v12 = v16;
    if ((_DWORD)v16 == -1)
      return *__error();
  }
  return v12;
}

uint64_t IOEngineInitialize()
{
  NumJobs = 0;
  qsort(&InfoLookupTable, 0x11uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))InfoLookupRecCompare);
  return 0;
}

CFComparisonResult InfoLookupRecCompare(CFStringRef *a1, CFStringRef *a2)
{
  return CFStringCompare(*a1, *a2, 0);
}

uint64_t IOJobSetup(uint64_t *a1, const __CFDictionary *a2, uint64_t a3)
{
  _DWORD *v6;
  uint64_t v7;
  const __CFNumber *Value;
  const __CFNumber *v9;
  CFTypeID v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  _WORD *v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  CFTypeID v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  const __CFNumber *v24;
  const __CFNumber *v25;
  CFTypeID v26;
  const void *v27;
  const void *v28;
  CFTypeID v29;
  void *v30;
  const __CFArray *v31;
  const __CFArray *v32;
  CFTypeID v33;
  _DWORD *v34;
  CFIndex v35;
  CFTypeRef *v36;
  uint64_t v37;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v39;
  CFTypeID v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  CFTypeID v43;
  const __CFNumber *v44;
  const __CFNumber *v45;
  CFTypeID v46;
  CFTypeRef *v47;
  const __CFNumber *v48;
  const __CFNumber *v49;
  CFTypeID v50;
  unsigned int v51;
  const __CFNumber *v52;
  const __CFNumber *v53;
  CFTypeID v54;
  unsigned int v55;
  const __CFNumber *v56;
  const __CFNumber *v57;
  CFTypeID v58;
  uint64_t v59;
  const void *v60;
  const void *v61;
  CFTypeID v62;
  unsigned int v63;
  const void *v64;
  const void *v65;
  CFTypeID v66;
  unsigned int v67;
  int v68;
  char v69;
  unsigned int v70;
  unsigned int v71;
  void *v72;
  CFTypeRef *v73;
  int v74;
  CFTypeRef *v75;
  const void *v76;
  int v77;
  uint64_t v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  _DWORD *v88;
  int v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int16 v94;
  unsigned __int16 v95;
  _QWORD *v96;
  unsigned __int16 v97;
  CFIndex v98;
  CFTypeRef *v99;
  pthread_t v100;
  const void **v101;
  const void *v102;
  int valuePtr;
  __int16 v104;
  pthread_mutexattr_t v105;
  pthread_attr_t v106;
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v100 = 0;
  v101 = 0;
  memset(&v106, 0, sizeof(v106));
  v105.__sig = 0;
  *(_QWORD *)v105.__opaque = 0;
  v6 = malloc_type_calloc(1uLL, 0x230uLL, 0x10A0040A93B80A1uLL);
  if (!v6)
  {
    *a1 = 0;
    return *__error();
  }
  v7 = (uint64_t)v6;
  v6[42] = 0;
  *((_WORD *)v6 + 80) = 512;
  v6[133] = 0;
  *((_QWORD *)v6 + 22) = -1;
  *((_WORD *)v6 + 268) = 0;
  v6[138] = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Block Size"));
  if (!Value)
    goto LABEL_76;
  v9 = Value;
  v10 = CFGetTypeID(Value);
  if (v10 != CFNumberGetTypeID())
    goto LABEL_76;
  v104 = 0;
  valuePtr = 0;
  v102 = 0;
  CFNumberGetValue(v9, kCFNumberSInt32Type, &valuePtr);
  *(_DWORD *)(v7 + 240) = valuePtr;
  v11 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Buffer Size"));
  if (!v11)
    goto LABEL_76;
  v12 = v11;
  v13 = CFGetTypeID(v11);
  if (v13 != CFNumberGetTypeID())
    goto LABEL_76;
  CFNumberGetValue(v12, kCFNumberSInt32Type, (void *)(v7 + 244));
  v14 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Buffer Count"));
  if (!v14)
    goto LABEL_76;
  v15 = v14;
  v16 = CFGetTypeID(v14);
  if (v16 != CFNumberGetTypeID())
    goto LABEL_76;
  v17 = (_WORD *)(v7 + 250);
  CFNumberGetValue(v15, kCFNumberSInt16Type, (void *)(v7 + 250));
  v18 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Thread Count"));
  if (v18)
  {
    v19 = v18;
    v20 = CFGetTypeID(v18);
    if (v20 != CFNumberGetTypeID())
      goto LABEL_76;
    CFNumberGetValue(v19, kCFNumberSInt16Type, (void *)(v7 + 248));
  }
  v21 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Percent Threshold"));
  if (v21)
  {
    v22 = v21;
    v23 = CFGetTypeID(v21);
    if (v23 != CFNumberGetTypeID())
      goto LABEL_76;
    CFNumberGetValue(v22, kCFNumberSInt16Type, (void *)(v7 + 252));
  }
  v24 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Time Threshold"));
  if (v24)
  {
    v25 = v24;
    v26 = CFGetTypeID(v24);
    if (v26 != CFNumberGetTypeID())
      goto LABEL_76;
    CFNumberGetValue(v25, kCFNumberSInt16Type, (void *)(v7 + 254));
  }
  if (!*(_WORD *)(v7 + 252) && !*(_WORD *)(v7 + 254))
    *(_WORD *)(v7 + 252) = 1;
  *(_DWORD *)(v7 + 280) = 0;
  v27 = CFDictionaryGetValue(a2, CFSTR("Allow Skips"));
  if (!v27)
    goto LABEL_24;
  v28 = v27;
  v29 = CFGetTypeID(v27);
  if (v29 != CFBooleanGetTypeID())
  {
LABEL_76:
    v69 = 0;
    v37 = 22;
    goto LABEL_77;
  }
  if (CFEqual(v28, (CFTypeRef)*MEMORY[0x24BDBD270]))
  {
    *(_DWORD *)(v7 + 280) = 500;
    v30 = malloc_type_calloc(1uLL, 0x5DC8uLL, 0x574AE41AuLL);
    *(_QWORD *)(v7 + 288) = v30;
    if (!v30)
    {
LABEL_70:
      v37 = *__error();
      goto LABEL_71;
    }
  }
LABEL_24:
  v31 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Instructions"));
  if (!v31)
    goto LABEL_76;
  v32 = v31;
  v33 = CFGetTypeID(v31);
  if (v33 != CFArrayGetTypeID())
    goto LABEL_76;
  valuePtr = CFArrayGetCount(v32);
  v34 = malloc_type_calloc(1uLL, (48 * valuePtr) | 8, 0xD6EE9DCFuLL);
  *(_QWORD *)(v7 + 256) = v34;
  if (!v34)
    goto LABEL_70;
  *v34 = valuePtr;
  if (valuePtr < 1)
    goto LABEL_73;
  v35 = 0;
  v36 = (CFTypeRef *)(v34 + 6);
  v37 = 22;
  while (1)
  {
    v98 = v35;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v32, v35);
    if (!ValueAtIndex)
      break;
    v39 = ValueAtIndex;
    v40 = CFGetTypeID(ValueAtIndex);
    if (v40 != CFDictionaryGetTypeID())
      break;
    v99 = v36;
    v41 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Instruction Code"));
    if (!v41)
      break;
    v42 = v41;
    v43 = CFGetTypeID(v41);
    if (v43 != CFNumberGetTypeID())
      break;
    CFNumberGetValue(v42, kCFNumberSInt16Type, &v104);
    *((_DWORD *)v99 - 4) = v104;
    v44 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Block Count"));
    if (!v44)
      break;
    v45 = v44;
    v46 = CFGetTypeID(v44);
    if (v46 != CFNumberGetTypeID())
      break;
    CFNumberGetValue(v45, kCFNumberSInt64Type, &v102);
    v47 = v99;
    v99[1] = v102;
    v48 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Source Offset"));
    if (v48)
    {
      v49 = v48;
      v50 = CFGetTypeID(v48);
      if (v50 != CFNumberGetTypeID())
        break;
      CFNumberGetValue(v49, kCFNumberSInt64Type, &v102);
      v47 = v99;
      v99[2] = v102;
    }
    else
    {
      v51 = *((_DWORD *)v99 - 4);
      if (v51 <= 8 && ((1 << v51) & 0x1BA) != 0)
        break;
    }
    v52 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Target Offset"));
    if (v52)
    {
      v53 = v52;
      v54 = CFGetTypeID(v52);
      if (v54 != CFNumberGetTypeID())
        break;
      CFNumberGetValue(v53, kCFNumberSInt64Type, &v102);
      v47 = v99;
      v99[3] = v102;
      v55 = *((_DWORD *)v99 - 4);
    }
    else
    {
      v55 = *((_DWORD *)v47 - 4);
      if (v55 <= 0xA && ((1 << v55) & 0x5A6) != 0)
        break;
    }
    if (v55 == 7 || v55 == 4)
    {
      v56 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Checksum Type"));
      if (!v56)
        break;
      v57 = v56;
      v58 = CFGetTypeID(v56);
      if (v58 != CFNumberGetTypeID())
        break;
      CFNumberGetValue(v57, kCFNumberSInt16Type, &v104);
      v59 = IOSetParams(v7, v98);
      if ((_DWORD)v59)
      {
        v37 = v59;
        break;
      }
      v37 = 0;
      if (*(_DWORD *)(v7 + 552) == -1)
        *(_DWORD *)(v7 + 552) = v98;
      v47 = v99;
    }
    v60 = CFDictionaryGetValue(v39, CFSTR("Source Device"));
    if (v60)
    {
      v61 = v60;
      v62 = CFGetTypeID(v60);
      if (v62 != MKMediaGetTypeID())
        break;
      v47 = v99;
      *(v99 - 1) = CFRetain(v61);
    }
    else
    {
      v63 = *((_DWORD *)v47 - 4);
      if (v63 <= 8 && ((1 << v63) & 0x1BA) != 0)
        break;
    }
    v64 = CFDictionaryGetValue(v39, CFSTR("Target Device"));
    if (v64)
    {
      v65 = v64;
      v66 = CFGetTypeID(v64);
      if (v66 != MKMediaGetTypeID())
        break;
      v47 = v99;
      *v99 = CFRetain(v65);
    }
    else
    {
      v67 = *((_DWORD *)v47 - 4);
      if (v67 <= 0xA && ((1 << v67) & 0x5A6) != 0)
        break;
    }
    v35 = v98 + 1;
    v68 = valuePtr;
    v36 = v47 + 6;
    if (v98 + 1 >= valuePtr)
    {
      LODWORD(v98) = v98 + 1;
      goto LABEL_68;
    }
  }
  v68 = valuePtr;
LABEL_68:
  if ((int)v98 >= v68)
  {
LABEL_73:
    *(int8x16_t *)(v7 + 264) = vextq_s8(*(int8x16_t *)(a3 + 8), *(int8x16_t *)(a3 + 8), 8uLL);
    goto LABEL_74;
  }
  if ((_DWORD)v37 == -1)
    goto LABEL_70;
LABEL_71:
  if ((_DWORD)v37)
  {
LABEL_72:
    v69 = 0;
    goto LABEL_77;
  }
LABEL_74:
  v71 = *(_DWORD *)(v7 + 240);
  v70 = *(_DWORD *)(v7 + 244);
  if (v70 < v71 || v70 % v71)
    goto LABEL_76;
  v80 = pthread_mutexattr_init(&v105);
  if ((_DWORD)v80)
  {
    v37 = v80;
    goto LABEL_72;
  }
  v81 = pthread_mutexattr_settype(&v105, 2);
  if ((_DWORD)v81 || (v81 = pthread_mutex_init((pthread_mutex_t *)v7, &v105), (_DWORD)v81))
  {
    v37 = v81;
    v69 = 1;
    goto LABEL_77;
  }
  v82 = pthread_cond_init((pthread_cond_t *)(v7 + 64), 0);
  if ((_DWORD)v82)
  {
    v37 = v82;
    v69 = 3;
    goto LABEL_77;
  }
  v83 = pthread_cond_init((pthread_cond_t *)(v7 + 112), 0);
  if ((_DWORD)v83)
  {
    v37 = v83;
    v69 = 7;
    goto LABEL_77;
  }
  v84 = pthread_mutex_init((pthread_mutex_t *)(v7 + 416), 0);
  if ((_DWORD)v84)
  {
    v37 = v84;
    v69 = 15;
    goto LABEL_77;
  }
  v85 = pthread_cond_init((pthread_cond_t *)(v7 + 480), 0);
  if ((_DWORD)v85)
  {
    v37 = v85;
    v69 = 31;
    goto LABEL_77;
  }
  if (*v17)
  {
    v86 = 0;
    do
    {
      v87 = IONewBuffer(&v101, *(_DWORD *)(v7 + 244));
      if ((_DWORD)v87)
        goto LABEL_136;
      stkputbtm(v7 + 296, v101);
    }
    while (++v86 < (unsigned __int16)*v17);
  }
  v88 = *(_DWORD **)(v7 + 256);
  v89 = *v88;
  if (*v88)
  {
    v90 = *(_QWORD *)(v7 + 200);
    v91 = (uint64_t *)(v88 + 8);
    do
    {
      v92 = *v91;
      v91 += 6;
      v90 += v92;
      --v89;
    }
    while (v89);
    *(_QWORD *)(v7 + 200) = v90;
  }
  else
  {
    v90 = *(_QWORD *)(v7 + 200);
  }
  if (v90)
  {
    v87 = pthread_attr_init(&v106);
    if ((_DWORD)v87)
    {
LABEL_136:
      v37 = v87;
      v69 = 63;
      goto LABEL_77;
    }
    v93 = pthread_attr_setdetachstate(&v106, 2);
    if ((_DWORD)v93)
    {
LABEL_139:
      v37 = v93;
      v69 = 127;
    }
    else
    {
      v94 = *(_WORD *)(v7 + 248);
      v95 = *(_WORD *)(v7 + 250);
      if ((unsigned __int16)(v94 - 1) >= v95)
      {
        *(_WORD *)(v7 + 248) = v95;
        v94 = v95;
      }
      if (*(unsigned __int16 *)(v7 + 164) >= v94)
      {
LABEL_146:
        v37 = 0;
        ++NumJobs;
        v69 = 127;
LABEL_102:
        pthread_attr_destroy(&v106);
        v77 = v69 & 0x10;
        v78 = v7;
        goto LABEL_103;
      }
      while (1)
      {
        v96 = malloc_type_malloc(0x10uLL, 0x10200400CC4F872uLL);
        if (!v96)
          break;
        v96[1] = v7;
        *(_WORD *)v96 = *(_WORD *)(v7 + 164) + 1;
        v93 = pthread_create(&v100, &v106, (void *(__cdecl *)(void *))ThreadExecutive, v96);
        if ((_DWORD)v93)
          goto LABEL_139;
        v97 = *(_WORD *)(v7 + 164) + 1;
        *(_WORD *)(v7 + 164) = v97;
        if (*(unsigned __int16 *)(v7 + 248) <= v97)
          goto LABEL_146;
      }
      v69 = 127;
      v37 = 0xFFFFFFFFLL;
    }
  }
  else
  {
    v69 = 63;
    v37 = 4294967246;
  }
LABEL_77:
  if (*(_WORD *)(v7 + 164))
  {
    pthread_mutex_lock((pthread_mutex_t *)v7);
    *(_QWORD *)(v7 + 264) = 0;
    *(_DWORD *)(v7 + 532) = v37;
    if (*(_DWORD *)(v7 + 168) != 4)
    {
      *(_DWORD *)(v7 + 168) = 4;
      pthread_cond_broadcast((pthread_cond_t *)(v7 + 64));
    }
    while (*(_WORD *)(v7 + 164))
      pthread_cond_wait((pthread_cond_t *)(v7 + 112), (pthread_mutex_t *)v7);
    pthread_mutex_unlock((pthread_mutex_t *)v7);
  }
  v72 = *(void **)(v7 + 288);
  if (v72)
    free(v72);
  v73 = *(CFTypeRef **)(v7 + 256);
  if (v73)
  {
    if (*(_DWORD *)v73)
    {
      v74 = 0;
      v75 = v73 + 3;
      do
      {
        v76 = *(v75 - 1);
        if (v76)
          CFRelease(v76);
        if (*v75)
          CFRelease(*v75);
        ++v74;
        v73 = *(CFTypeRef **)(v7 + 256);
        v75 += 6;
      }
      while (*(_DWORD *)v73 > (unsigned __int16)v74);
    }
    free(v73);
  }
  if ((v69 & 2) != 0)
  {
    pthread_mutex_destroy((pthread_mutex_t *)v7);
    if ((v69 & 4) == 0)
    {
LABEL_96:
      if ((v69 & 8) == 0)
        goto LABEL_97;
      goto LABEL_110;
    }
  }
  else if ((v69 & 4) == 0)
  {
    goto LABEL_96;
  }
  pthread_cond_destroy((pthread_cond_t *)(v7 + 64));
  if ((v69 & 8) == 0)
  {
LABEL_97:
    if ((v69 & 0x10) == 0)
      goto LABEL_99;
    goto LABEL_98;
  }
LABEL_110:
  pthread_cond_destroy((pthread_cond_t *)(v7 + 112));
  if ((v69 & 0x10) != 0)
LABEL_98:
    pthread_mutex_destroy((pthread_mutex_t *)(v7 + 416));
LABEL_99:
  v77 = v69 & 0x10;
  if ((v69 & 0x20) != 0)
    pthread_cond_destroy((pthread_cond_t *)(v7 + 480));
  stkclear(v7 + 296, v7, (uint64_t (*)(void))DisposeProbe);
  v7 = 0;
  v78 = 0;
  if ((v69 & 8) != 0)
    goto LABEL_102;
LABEL_103:
  if (v77)
    pthread_mutexattr_destroy(&v105);
  *a1 = v78;
  if ((_DWORD)v37 == -1)
    return *__error();
  return v37;
}

uint64_t stkputbtm(uint64_t result, _QWORD *a2)
{
  _QWORD *v2;

  if (a2)
  {
    v2 = *(_QWORD **)(result + 16);
    *(_QWORD *)(result + 16) = a2;
    *a2 = 0;
    if (!v2)
      v2 = (_QWORD *)(result + 8);
    *v2 = a2;
    ++*(_WORD *)(result + 2);
  }
  return result;
}

uint64_t IOJobInitiate(pthread_mutex_t *a1, int a2)
{
  if (!a1 || *(_DWORD *)&a1[2].__opaque[32])
    return 1;
  pthread_mutex_lock(a1);
  if (*(_DWORD *)&a1[2].__opaque[32] != 1)
  {
    *(_DWORD *)&a1[2].__opaque[32] = 1;
    pthread_cond_broadcast((pthread_cond_t *)&a1[1]);
  }
  pthread_mutex_unlock(a1);
  if (a2)
    return IOJobWait((uint64_t)a1, 0);
  else
    return 0;
}

uint64_t ThreadExecutive(void *a1)
{
  _WORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD);
  int v6;
  uint64_t *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int *v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  unint64_t v17;
  BOOL v18;
  uint64_t v19;
  __int16 v20;
  int v21;
  __int16 *v22;
  unint64_t v23;
  uint64_t v24;
  BOOL v25;
  __int16 *v26;
  int v27;
  _DWORD *v28;
  _QWORD *v29;
  int v30;
  unsigned int v31;
  int v32;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  uint64_t (**v38)();
  int v39;
  uint64_t v40;
  int v41;
  uint64_t (*v42)(uint64_t, _QWORD);
  int v43;
  int v44;
  void (*v45)(uint64_t, _QWORD);
  int v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  unsigned int v54;
  _DWORD *v55;
  uint64_t v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  _DWORD *v60;
  int v61;
  signed __int16 v62;
  int v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  _QWORD *v69;
  int v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  size_t v76;
  uint64_t v77;
  int v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  _DWORD *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  __int128 v105;
  unint64_t v106;
  uint64_t v107;
  int v108;
  BOOL v109;
  uint64_t v110;
  time_t v111;
  uint64_t (*v112)(uint64_t, _QWORD);
  int v113;
  int v114;
  _QWORD *v115;
  _QWORD *v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)(uint64_t, _QWORD);
  _WORD *v121;
  uint64_t v122;
  time_t v123;
  unsigned __int16 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _QWORD *v129;
  _QWORD v130[2];

  v1 = a1;
  v2 = *((_QWORD *)a1 + 1);
  if (!v2)
    goto LABEL_253;
  pthread_mutex_lock(*((pthread_mutex_t **)a1 + 1));
  v124 = 0;
  v123 = 0;
  v3 = v2 + 296;
  v125 = v2 + 368;
  v4 = v2 + 320;
  v127 = v2 + 320;
  v128 = v2 + 392;
  v126 = v2 + 344;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        while (2)
        {
          switch(*(_DWORD *)(v2 + 168))
          {
            case 1:
              *(_QWORD *)(v2 + 184) = time(0);
              *(_WORD *)(v2 + 232) = -1;
              v5 = *(uint64_t (**)(uint64_t, _QWORD))(v2 + 264);
              if (v5)
              {
                v6 = v5(v2, *(_QWORD *)(v2 + 272));
                *(_DWORD *)(v2 + 532) = v6;
              }
              else
              {
                v6 = *(_DWORD *)(v2 + 532);
              }
              v46 = *(_DWORD *)(v2 + 168);
              if (v6)
                goto LABEL_193;
              if (v46 == 2)
                continue;
              v44 = 2;
              goto LABEL_195;
            case 2:
              if (!*(_WORD *)(v2 + 298) || (*(_WORD *)(v2 + 162) & 1) != 0)
                goto LABEL_95;
              break;
            case 3:
              if (*(_WORD *)(v2 + 164) != 1)
                goto LABEL_251;
              v42 = *(uint64_t (**)(uint64_t, _QWORD))(v2 + 264);
              if (v42)
              {
                v43 = v42(v2, *(_QWORD *)(v2 + 272));
                if (!*(_DWORD *)(v2 + 532))
                  *(_DWORD *)(v2 + 532) = v43;
              }
              if (*(_DWORD *)(v2 + 168) == 5)
                continue;
              v44 = 5;
              goto LABEL_195;
            case 4:
              v45 = *(void (**)(uint64_t, _QWORD))(v2 + 264);
              if (!v45)
                goto LABEL_86;
              v45(v2, *(_QWORD *)(v2 + 272));
              goto LABEL_85;
            case 5:
              *(_QWORD *)(v2 + 192) = time(0);
              v119 = *(void (**)(uint64_t, _QWORD))(v2 + 264);
              if (v119)
                v119(v2, *(_QWORD *)(v2 + 272));
              goto LABEL_251;
            default:
              goto LABEL_196;
          }
          break;
        }
LABEL_8:
        v7 = stkgettop(v3);
        if (!v7)
        {
LABEL_76:
          IOAdvertising(v4, (pthread_cond_t *)(v2 + 64));
          goto LABEL_95;
        }
        v8 = (uint64_t)v7;
        v9 = *(_DWORD *)(v2 + 240);
        *((_DWORD *)v7 + 18) = v9;
        v7[19] = *(_QWORD *)(v2 + 544);
        v10 = *(unsigned int **)(v2 + 256);
        v11 = *(_DWORD *)(v2 + 172);
        if (v11 >= *v10)
        {
LABEL_91:
          stkputbtm(v3, v7);
          goto LABEL_92;
        }
        v12 = 12 * (int)v11;
        while (1)
        {
          v13 = v10[v12 + 2];
          if (v13 != 6)
            break;
          if (*(_WORD *)(v2 + 322) || *(_WORD *)(v2 + 536))
          {
            stkputbtm(v3, v7);
            goto LABEL_95;
          }
LABEL_16:
          *(_DWORD *)(v2 + 172) = ++v11;
          v12 += 12;
          if (*v10 <= v11)
            goto LABEL_91;
        }
        v14 = *(_QWORD *)&v10[v12 + 8];
        if (!v14)
          goto LABEL_16;
        v15 = &v10[v12];
        v16 = *((_QWORD *)v15 + 5);
        v7[5] = v16;
        v17 = *((_DWORD *)v7 + 26) / v9;
        *((_DWORD *)v7 + 6) = v13;
        v18 = v14 > v17;
        if (v14 < v17)
          v17 = v14;
        v7[4] = v17;
        v19 = *((_QWORD *)v15 + 6);
        v7[6] = v19;
        *(_OWORD *)(v7 + 7) = *((_OWORD *)v15 + 1);
        *((_QWORD *)v15 + 5) = v16 + v17;
        *((_QWORD *)v15 + 6) = v19 + v17;
        v20 = !v18;
        *((_QWORD *)v15 + 4) = v14 - v17;
        *((_WORD *)v7 + 4) = v7[1] & 0xFFFE | v20;
        *((_DWORD *)v7 + 3) = v11;
        *((_WORD *)v7 + 8) = 0;
        v7[16] = 0;
        v21 = (unsigned __int16)InstructionTable;
        if (!InstructionTable)
        {
LABEL_136:
          *(_QWORD *)(v8 + 120) = 0;
          v3 = v2 + 296;
          stkputbtm(v2 + 296, (_QWORD *)v8);
          v63 = 2;
          v4 = v2 + 320;
LABEL_192:
          *(_DWORD *)(v2 + 532) = v63;
          v46 = *(_DWORD *)(v2 + 168);
LABEL_193:
          if (v46 != 4)
          {
            v44 = 4;
LABEL_195:
            *(_DWORD *)(v2 + 168) = v44;
            pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
          }
          continue;
        }
        break;
      }
      v22 = &word_254B6689C;
      while ((unsigned __int16)*v22 != (unsigned __int16)v13)
      {
        --v21;
        v22 += 26;
        if (!(_WORD)v21)
          goto LABEL_136;
      }
      *(_QWORD *)(v8 + 120) = v22;
      v23 = (unsigned __int16)v22[20];
      if (v22[20])
      {
        v24 = 0;
        v25 = 1;
        do
        {
          if (StepTable)
          {
            v26 = &word_254B6673A;
            v27 = (unsigned __int16)StepTable;
            while (*(v26 - 17) != v22[v24 + 21])
            {
              --v27;
              v26 += 24;
              if (!(_WORD)v27)
                goto LABEL_36;
            }
            if ((*v26 & 2) != 0)
              break;
          }
LABEL_36:
          v25 = ++v24 < v23;
        }
        while (v24 != v23);
        if (v25 && *(_DWORD *)(v2 + 180) == -1)
          *(_DWORD *)(v2 + 180) = v11;
      }
      v28 = (_DWORD *)(v2 + 376);
      while (1)
      {
        v28 = *(_DWORD **)v28;
        if (!v28)
          break;
        if (v28[2] == v11)
        {
          v129 = v28;
          v29 = v28;
          goto LABEL_47;
        }
      }
      v129 = 0;
      if (*(_DWORD *)(v2 + 176) >= (signed int)v11)
        goto LABEL_74;
      *(_DWORD *)(v2 + 176) = v11;
      v30 = BuildiCache((uint64_t)v22, &v129);
      if (v30)
      {
        v63 = v30;
        goto LABEL_238;
      }
      v29 = v129;
      if (!v129)
        goto LABEL_74;
LABEL_47:
      if (*((_WORD *)v29 + 12))
      {
LABEL_48:
        if (!v28 && v29)
        {
          *((_DWORD *)v29 + 2) = *(_DWORD *)(v8 + 12);
          goto LABEL_73;
        }
        goto LABEL_74;
      }
      v31 = *(_DWORD *)(v8 + 24);
      v18 = v31 > 7;
      v32 = (1 << v31) & 0xB0;
      if (v18 || v32 == 0)
        v34 = (uint64_t *)(v8 + 48);
      else
        v34 = (uint64_t *)(v8 + 40);
      v122 = *v34;
      if (v28)
        stkdequeue(v125, v29);
      v35 = *(_QWORD *)(v8 + 120);
      v130[0] = 0;
      if (!*(_WORD *)(v35 + 40))
      {
LABEL_72:
        if (!v28)
          goto LABEL_48;
LABEL_73:
        stkputbtm(v125, v29);
LABEL_74:
        *(_QWORD *)(v8 + 136) = v129;
        v41 = SetupStep(v8);
        if (v41)
        {
          v63 = v41;
          v3 = v2 + 296;
          v4 = v2 + 320;
          goto LABEL_239;
        }
        v4 = v2 + 320;
        stkputbtm(v127, (_QWORD *)v8);
        v3 = v2 + 296;
        if (!*(_WORD *)(v2 + 298))
          goto LABEL_76;
        goto LABEL_8;
      }
      v121 = v1;
      v36 = 0;
      while (1)
      {
        v37 = (unsigned __int16)StepTable;
        if (StepTable)
        {
          v38 = &off_254B66740;
          while (*((unsigned __int16 *)v38 - 20) != *(unsigned __int16 *)(v35 + 2 * v36 + 42))
          {
            --v37;
            v38 += 6;
            if (!(_WORD)v37)
              goto LABEL_70;
          }
          if ((*((_WORD *)v38 - 3) & 1) != 0)
          {
            LOWORD(v130[0]) = v36;
            v130[1] = v122;
            v39 = addentry((const void **)&v129, v130, 0x20uLL, 0x18u, 0xFFFFu, 0x10u);
            if (v39)
              break;
            v40 = v129[2];
            if (v40)
            {
              v39 = ((uint64_t (*)(uint64_t, _QWORD))*v38)(v40, 0);
              if (v39)
                break;
            }
          }
        }
LABEL_70:
        if (++v36 >= (unint64_t)*(unsigned __int16 *)(v35 + 40))
        {
          v29 = v129;
          v1 = v121;
          goto LABEL_72;
        }
      }
      v63 = v39;
      v1 = v121;
LABEL_238:
      v3 = v2 + 296;
      v4 = v2 + 320;
      *(_QWORD *)(v8 + 136) = v129;
LABEL_239:
      stkputbtm(v3, (_QWORD *)v8);
      if (v63 != -29291)
      {
        if (v63 != -39)
          goto LABEL_190;
LABEL_92:
        *(_WORD *)(v2 + 162) |= 1u;
        if (*(unsigned __int16 *)(v2 + 298) >= *(unsigned __int16 *)(v2 + 250))
          goto LABEL_85;
      }
LABEL_95:
      v47 = stkgettop(v4);
      if (!v47)
      {
LABEL_196:
        pthread_cond_wait((pthread_cond_t *)(v2 + 64), (pthread_mutex_t *)v2);
        continue;
      }
      break;
    }
    v48 = v47;
    ++*(_WORD *)(v2 + 536);
    *((_WORD *)v47 + 5) = *v1;
    if ((*(_BYTE *)(v47[16] + 34) & 2) != 0)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 416));
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      stkputbtm(v128, v48);
      while (*(_BYTE *)(v2 + 528))
        pthread_cond_wait((pthread_cond_t *)(v2 + 480), (pthread_mutex_t *)(v2 + 416));
      v48 = stkgettop(v128);
      *(_BYTE *)(v2 + 528) = 1;
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 416));
      v51 = v48[17];
      if (v51)
        v52 = *(_QWORD *)(v51 + 16);
      else
        v52 = 0;
      v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v48[16] + 40))(v52, 1);
      pthread_mutex_lock((pthread_mutex_t *)(v2 + 416));
      *(_BYTE *)(v2 + 528) = 0;
      pthread_cond_signal((pthread_cond_t *)(v2 + 480));
      pthread_mutex_unlock((pthread_mutex_t *)(v2 + 416));
    }
    else
    {
      pthread_mutex_unlock((pthread_mutex_t *)v2);
      v49 = v48[17];
      if (v49)
        v50 = *(_QWORD *)(v49 + 16);
      else
        v50 = 0;
      v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v48[16] + 40))(v50, 1);
    }
    pthread_mutex_lock((pthread_mutex_t *)v2);
    if (!v53)
    {
LABEL_119:
      v61 = *(_DWORD *)(v2 + 532);
      goto LABEL_120;
    }
    if (v53 != 35)
    {
LABEL_116:
      v61 = *(_DWORD *)(v2 + 532);
      if (v61)
        goto LABEL_120;
      *(_DWORD *)(v2 + 532) = v53;
      v61 = v53;
      if (*(_DWORD *)(v2 + 168) == 4)
        goto LABEL_120;
      *(_DWORD *)(v2 + 168) = 4;
      pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
      goto LABEL_119;
    }
    v54 = *(_DWORD *)(v2 + 280);
    if (!v54)
    {
      v53 = 22;
      goto LABEL_116;
    }
    v55 = *(_DWORD **)(v2 + 288);
    v56 = *v55;
    if (v56 >= v54)
    {
      v53 = 12;
      v4 = v2 + 320;
      goto LABEL_116;
    }
    v57 = (unint64_t)&v55[12 * v56 + 2];
    v58 = *((_DWORD *)v48 + 6);
    if (v57 - 48 < (unint64_t)(v55 + 2))
    {
      v59 = 0;
      v60 = &v55[12 * v56 + 2];
LABEL_177:
      *v60 = v58;
      v104 = v57 + 48 * v59;
      *(_QWORD *)(v104 + 40) = v48[6];
      v105 = *((_OWORD *)v48 + 2);
      *(_OWORD *)(v104 + 24) = v105;
      *(_OWORD *)(v104 + 8) = *(_OWORD *)(v48 + 7);
      *v55 = v56 + 1;
      v86 = v105;
      goto LABEL_178;
    }
    v71 = 0;
    v72 = v48 + 5;
    v73 = v48 + 6;
    v74 = 12 * v56;
    v75 = -1;
    v76 = -48;
    v77 = (uint64_t)&v55[12 * v56 + 2];
    while (2)
    {
      v78 = v55[v74 - 10];
      if (v58 != 2)
      {
        if (v78 != 2)
        {
          v79 = (_QWORD *)(v77 - 16);
          v80 = v48 + 5;
          goto LABEL_143;
        }
LABEL_144:
        v77 = v57 + 48 * v75--;
        v76 += 48;
        v74 -= 12;
        ++v71;
        if (&v55[v74 - 10] < v55 + 2)
        {
          v59 = -v71;
          v60 = &v55[v74 + 2];
          goto LABEL_165;
        }
        continue;
      }
      break;
    }
    if (v78 != 2)
      goto LABEL_146;
    v79 = &v55[v74];
    v80 = v48 + 6;
LABEL_143:
    if (*v80 < *v79)
      goto LABEL_144;
LABEL_146:
    v59 = -v71;
    v60 = &v55[v74 + 2];
    if (v58 != v78)
    {
LABEL_165:
      if ((unint64_t)v60 >= v57)
        goto LABEL_177;
      if (v58 == *v60)
      {
        if (v58 == 1)
        {
          v86 = v48[4];
          v89 = v48[5];
          v95 = v57 + 48 * v59;
          v96 = *(_QWORD *)(v95 + 32);
          v92 = (uint64_t *)(v95 + 32);
          if (v86 + v89 == v96)
          {
            v97 = *v73;
            v98 = *v73 + v86;
            v99 = v57 + 48 * v59;
            v101 = *(_QWORD *)(v99 + 40);
            v100 = (_QWORD *)(v99 + 40);
            if (v98 == v101)
            {
              *v100 = v97;
LABEL_175:
              *v92 = v89;
              v3 = v2 + 296;
              v4 = v2 + 320;
              *(_QWORD *)(v57 + 48 * v59 + 24) += v86;
              goto LABEL_179;
            }
          }
        }
        else
        {
          if (v58 == 2)
          {
            v89 = v48[6];
            v86 = v48[4];
            v90 = v86 + v89;
            v91 = v57 + 48 * v59;
            v94 = *(_QWORD *)(v91 + 40);
            v92 = (uint64_t *)(v91 + 40);
            v93 = v94;
          }
          else
          {
            v86 = v48[4];
            v89 = v48[5];
            v90 = v86 + v89;
            v102 = v57 + 48 * v59;
            v103 = *(_QWORD *)(v102 + 32);
            v92 = (uint64_t *)(v102 + 32);
            v93 = v103;
          }
          if (v90 == v93)
            goto LABEL_175;
        }
      }
      memmove(v60 + 12, v60, v57 - (_QWORD)v60);
      v58 = *((_DWORD *)v48 + 6);
      LODWORD(v56) = *v55;
      goto LABEL_177;
    }
    if (v58 == 1)
    {
      v84 = *(_QWORD *)&v55[v74 - 4];
      if (*v72 == v84 + *(_QWORD *)&v55[v74 - 2])
      {
        v81 = *v73;
        v85 = *(_QWORD *)&v55[v74] + v84;
        goto LABEL_159;
      }
      goto LABEL_165;
    }
    if (v58 == 2)
    {
      v81 = *v73;
      v82 = &v55[v74];
      v83 = *(_QWORD *)&v55[v74];
    }
    else
    {
      v81 = *v72;
      v82 = &v55[v74];
      v83 = *(_QWORD *)&v55[v74 - 2];
    }
    v84 = *((_QWORD *)v82 - 2);
    v85 = v84 + v83;
LABEL_159:
    if (v81 != v85)
      goto LABEL_165;
    v86 = v48[4];
    v87 = v86 + v84;
    *(_QWORD *)&v55[v74 - 4] = v87;
    if (v59 < 0 && v58 == *v60)
    {
      if (v58 == 1)
      {
        v88 = &v55[v74];
        if (*(_QWORD *)&v55[v74 - 2] + v87 == *(_QWORD *)&v55[v74 + 10])
        {
LABEL_243:
          v117 = *v88 + v87;
          v118 = v88[6];
          goto LABEL_245;
        }
      }
      else
      {
        if (v58 == 2)
        {
          v88 = &v55[v74];
          goto LABEL_243;
        }
        v117 = *(_QWORD *)&v55[v74 - 2] + v87;
        v118 = *(_QWORD *)&v55[v74 + 10];
LABEL_245:
        if (v117 == v118)
        {
          *(_QWORD *)&v55[v74 - 4] = *(_QWORD *)&v55[v74 + 8] + v87;
          if (v71 != 1)
          {
            memmove(&v55[v74 + 2], &v55[v74 + 14], v76);
            LODWORD(v56) = *v55;
            v86 = v48[4];
          }
          *v55 = v56 - 1;
        }
      }
    }
LABEL_178:
    v3 = v2 + 296;
    v4 = v2 + 320;
LABEL_179:
    *(_QWORD *)(v2 + 216) += v86;
    v61 = *(_DWORD *)(v2 + 532);
    if (!v61)
    {
      *(_DWORD *)(v2 + 532) = 35;
      ++*((_WORD *)v48 + 8);
LABEL_181:
      v106 = *(_QWORD *)(v2 + 200);
      v107 = *(_QWORD *)(v2 + 208) + v48[11];
      *(_QWORD *)(v2 + 208) = v107;
      *(_WORD *)(v2 + 234) = 100 * v107 / v106;
LABEL_182:
      stkputbtm(v3, v48);
      if (*(_DWORD *)(v2 + 172) >= **(_DWORD **)(v2 + 256)
        && *(unsigned __int16 *)(v2 + 298) >= *(unsigned __int16 *)(v2 + 250))
      {
        v63 = -39;
      }
      else
      {
        IOAdvertising(v3, (pthread_cond_t *)(v2 + 64));
        v63 = 0;
      }
      if (*(_DWORD *)(v2 + 532) == 35)
        *(_DWORD *)(v2 + 532) = 0;
      break;
    }
LABEL_120:
    v62 = *((_WORD *)v48 + 8) + 1;
    *((_WORD *)v48 + 8) = v62;
    if (v61 == 35)
      goto LABEL_181;
    if (v61)
      goto LABEL_182;
    if (*(unsigned __int16 *)(v48[15] + 40) <= v62)
      goto LABEL_181;
    v48[16] = 0;
    v63 = SetupStep((uint64_t)v48);
    if (!v63)
    {
      if ((*(_WORD *)(v48[16] + 34) & 2) == 0)
      {
        stkputbtm(v4, v48);
        IOAdvertising(v4, (pthread_cond_t *)(v2 + 64));
        goto LABEL_135;
      }
      v64 = v48[18];
      if (v64)
      {
        v65 = *((_DWORD *)v48 + 3);
        if (v65 == *(_DWORD *)(v2 + 180) && (v66 = v48[10], v66 == *(_QWORD *)(v64 + 8)))
        {
          v114 = *((unsigned __int16 *)v48 + 8);
          *(_QWORD *)(v64 + 8) = v48[11] + v66;
          if ((v48[1] & 1) != 0)
            *(_DWORD *)(v2 + 180) = v65 + 1;
          stkputbtm(v127, v48);
          v115 = *(_QWORD **)(v2 + 352);
          while (v115)
          {
            v116 = v115;
            v115 = (_QWORD *)*v115;
            if (*((_DWORD *)v116 + 3) == *(_DWORD *)(v2 + 180)
              && *((__int16 *)v116 + 8) == v114
              && v116[10] == *(_QWORD *)(v116[18] + 8))
            {
              if (stkdequeue(v126, v116))
                break;
              *(_QWORD *)(v116[18] + 8) += v116[11];
              if ((v116[1] & 1) != 0)
                ++*(_DWORD *)(v2 + 180);
              stkputbtm(v127, v116);
            }
          }
          v4 = v2 + 320;
          IOAdvertising(v127, (pthread_cond_t *)(v2 + 64));
        }
        else
        {
          v67 = *(_QWORD *)(v2 + 352);
          if (v67)
          {
            v68 = 0;
            while (1)
            {
              v69 = (_QWORD *)v67;
              v70 = *(_DWORD *)(v67 + 12);
              if (v65 <= v70 && (v65 != v70 || v48[10] <= v69[10]))
                break;
              v67 = *v69;
              v68 = v69;
              if (!*v69)
              {
                stkputbtm(v126, v48);
                goto LABEL_135;
              }
            }
            if (v68)
            {
              v63 = stkenqueue(v126, v48, v68);
              break;
            }
          }
          stkputtop(v126, v48);
        }
LABEL_135:
        v63 = 0;
        --*(_WORD *)(v2 + 536);
LABEL_197:
        if (*(_DWORD *)(v2 + 532))
          goto LABEL_218;
        if (*(_WORD *)(v2 + 252))
        {
          v124 = *(__int16 *)(v2 + 234) / (int)*(unsigned __int16 *)(v2 + 252) * *(_WORD *)(v2 + 252);
          v108 = *(__int16 *)(v2 + 232);
          v109 = v124 > v108;
          if (!*(_WORD *)(v2 + 254))
          {
            if (v124 > v108)
            {
              LODWORD(v110) = 0;
              v111 = v123;
              goto LABEL_209;
            }
LABEL_207:
            v4 = v2 + 320;
            goto LABEL_218;
          }
        }
        else
        {
          if (!*(_WORD *)(v2 + 254))
            goto LABEL_218;
          v109 = 0;
        }
        v111 = time(0);
        v110 = *(unsigned __int16 *)(v2 + 254);
        if (v111 < *(_QWORD *)(v2 + 224) + v110 && !v109)
        {
          v123 = v111;
          goto LABEL_207;
        }
        if (*(_WORD *)(v2 + 252))
LABEL_209:
          *(_WORD *)(v2 + 232) = v124;
        if ((_DWORD)v110)
          *(_QWORD *)(v2 + 224) = v111;
        v123 = v111;
        v112 = *(uint64_t (**)(uint64_t, _QWORD))(v2 + 264);
        if (v112)
        {
          v113 = v112(v2, *(_QWORD *)(v2 + 272));
          *(_DWORD *)(v2 + 532) = v113;
        }
        else
        {
          v113 = *(_DWORD *)(v2 + 532);
        }
        v4 = v2 + 320;
        if (v113 && *(_DWORD *)(v2 + 168) != 4)
        {
          *(_DWORD *)(v2 + 168) = 4;
          pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
        }
LABEL_218:
        if (v63 == -39 && !*(_DWORD *)(v2 + 532))
        {
LABEL_85:
          if (*(_DWORD *)(v2 + 168) != 3)
          {
LABEL_86:
            v44 = 3;
            goto LABEL_195;
          }
        }
        continue;
      }
      stkputbtm(v3, v48);
      *(_DWORD *)(v2 + 532) = 22;
      if (*(_DWORD *)(v2 + 168) != 4)
      {
        *(_DWORD *)(v2 + 168) = 4;
        pthread_cond_broadcast((pthread_cond_t *)(v2 + 64));
      }
      --*(_WORD *)(v2 + 536);
      v63 = 22;
      goto LABEL_192;
    }
    break;
  }
  --*(_WORD *)(v2 + 536);
  if (!v63 || v63 == -39)
    goto LABEL_197;
LABEL_190:
  if (v63 == 55)
    goto LABEL_196;
  if (v63 != -1)
    goto LABEL_192;
LABEL_251:
  --*(_WORD *)(v2 + 164);
  pthread_mutex_unlock((pthread_mutex_t *)v2);
  if (!*(_WORD *)(v2 + 164))
    pthread_cond_broadcast((pthread_cond_t *)(v2 + 112));
LABEL_253:
  free(v1);
  return 0;
}

uint64_t IOJobWait(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  timespec v6;

  v6.tv_nsec = 0;
  if (!a1)
    return 22;
  v6.tv_sec = time(0) + a2;
  pthread_mutex_lock((pthread_mutex_t *)a1);
  if (*(_WORD *)(a1 + 164))
  {
    do
    {
      if (a2)
      {
        v4 = pthread_cond_timedwait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)a1, &v6);
        if ((_DWORD)v4 == 60)
          break;
      }
      else
      {
        v4 = pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)a1);
      }
    }
    while (*(_WORD *)(a1 + 164));
  }
  else
  {
    v4 = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)a1);
  if (*(_DWORD *)(a1 + 532) && ((_DWORD)v4 == 60 || !(_DWORD)v4))
    return *(unsigned int *)(a1 + 532);
  return v4;
}

uint64_t IOJobCopySingleInfo(pthread_mutex_t *a1, const void *a2, CFTypeRef *a3)
{
  const __CFDictionary *Mutable;
  const void *Value;
  uint64_t v8;
  _QWORD v10[2];

  if (!a3)
    return 22;
  *a3 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10[0] = Mutable;
  v10[1] = a1;
  pthread_mutex_lock(a1);
  DictKeyFiller(a2, v10);
  pthread_mutex_unlock(a1);
  Value = CFDictionaryGetValue(Mutable, a2);
  if (Value)
  {
    v8 = 0;
    *a3 = CFRetain(Value);
    if (!Mutable)
      return v8;
    goto LABEL_7;
  }
  v8 = 22;
  if (Mutable)
LABEL_7:
    CFRelease(Mutable);
  return v8;
}

_QWORD *DictKeyFiller(const void *a1, _QWORD *a2)
{
  _QWORD *result;

  result = bsearch(a1, &InfoLookupTable, 0x11uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))InfoLookupKeyRecCompare);
  if (result)
    return (_QWORD *)((uint64_t (*)(_QWORD, _QWORD, _QWORD))result[1])(a2[1], *result, *a2);
  return result;
}

CFComparisonResult InfoLookupKeyRecCompare(const __CFString *a1, CFStringRef *a2)
{
  return CFStringCompare(a1, *a2, 0);
}

void InfoFillerGetState(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = *(_DWORD *)(a1 + 168);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetPercentDone(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt16Type, (const void *)(a1 + 234));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

uint64_t *stkgettop(uint64_t a1)
{
  uint64_t *result;
  uint64_t v3;

  result = *(uint64_t **)(a1 + 8);
  if (result)
  {
    v3 = *result;
    *(_QWORD *)(a1 + 8) = *result;
    *result = 0;
    if (!v3)
      *(_QWORD *)(a1 + 16) = 0;
    --*(_WORD *)(a1 + 2);
  }
  return result;
}

uint64_t BuildiCache(uint64_t a1, _QWORD *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  size_t v6;
  void *v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  __int16 *v12;
  int v13;

  if (*(_DWORD *)(a1 + 36))
    goto LABEL_2;
  v9 = *(unsigned __int16 *)(a1 + 40);
  if (*(_WORD *)(a1 + 40))
  {
    v10 = 0;
    v11 = 1;
    do
    {
      if (StepTable)
      {
        v12 = &word_254B6673A;
        v13 = (unsigned __int16)StepTable;
        while (*(v12 - 17) != *(_WORD *)(a1 + 2 * v10 + 42))
        {
          --v13;
          v12 += 24;
          if (!(_WORD)v13)
            goto LABEL_15;
        }
        if ((*v12 & 1) != 0)
          break;
      }
LABEL_15:
      v11 = ++v10 < v9;
    }
    while (v10 != v9);
    if (v11)
    {
LABEL_2:
      v4 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A00404E4CC0B5uLL);
      if (v4)
      {
        v5 = v4;
        v6 = *(unsigned int *)(a1 + 36);
        if (!(_DWORD)v6)
          goto LABEL_18;
        v7 = malloc_type_calloc(1uLL, v6, 0xEC977C63uLL);
        v5[2] = v7;
        if (v7)
          goto LABEL_18;
        free(v5);
      }
      *a2 = 0;
      return *__error();
    }
  }
  v5 = 0;
LABEL_18:
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t SetupStep(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned __int16 *v4;
  int v5;
  int v6;
  __int16 *v7;
  uint64_t v8;
  _QWORD *v9;
  unsigned int v10;
  BOOL v11;
  int v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 120);
  if (v1)
  {
    if (*(_QWORD *)(a1 + 128))
      goto LABEL_3;
    v5 = (unsigned __int16)StepTable;
    if (StepTable)
    {
      v6 = *(unsigned __int16 *)(v1 + 2 * *(__int16 *)(a1 + 16) + 42);
      v7 = &word_254B66718;
      while ((unsigned __int16)*v7 != v6)
      {
        --v5;
        v7 += 24;
        if (!(_WORD)v5)
          goto LABEL_13;
      }
      *(_QWORD *)(a1 + 128) = v7;
LABEL_3:
      *(_QWORD *)(a1 + 144) = 0;
      v2 = *(_QWORD *)(a1 + 136);
      if (v2)
      {
        v3 = *(unsigned __int16 *)(v2 + 24);
        if (*(_WORD *)(v2 + 24))
        {
          v4 = (unsigned __int16 *)(v2 + 32);
          while (*v4 != *(__int16 *)(a1 + 16))
          {
            --v3;
            v4 += 8;
            if (!(_WORD)v3)
              goto LABEL_16;
          }
          *(_QWORD *)(a1 + 144) = v4;
        }
      }
LABEL_16:
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(a1 + 32);
      if (*(_WORD *)(a1 + 16) == 1)
      {
        v10 = *(_DWORD *)(a1 + 24);
        v11 = v10 > 7;
        v12 = (1 << v10) & 0xB0;
        v13 = v11 || v12 == 0;
        v14 = (uint64_t *)(a1 + 40);
        if (v13)
          v14 = (uint64_t *)(a1 + 48);
        v15 = *v14;
      }
      else
      {
        if (!*(_WORD *)(a1 + 16))
        {
          *(_QWORD *)(a1 + 80) = *(_QWORD *)(a1 + 40);
          v9 = (_QWORD *)(a1 + 56);
LABEL_28:
          v8 = 0;
          *(_QWORD *)(a1 + 96) = *v9;
          return v8;
        }
        v15 = *(_QWORD *)(a1 + 48);
      }
      *(_QWORD *)(a1 + 80) = v15;
      v9 = (_QWORD *)(a1 + 64);
      goto LABEL_28;
    }
LABEL_13:
    *(_QWORD *)(a1 + 128) = 0;
  }
  return 22;
}

uint64_t IOAdvertising(uint64_t result, pthread_cond_t *a2)
{
  if (*(_WORD *)(result + 2))
  {
    if (*(_WORD *)(result + 2) == 1)
      return pthread_cond_signal(a2);
    else
      return pthread_cond_broadcast(a2);
  }
  return result;
}

uint64_t IORV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1)
    return MKMediaReadBlocks(*(_QWORD *)(a9 + 96), *(_QWORD *)(a9 + 80), *(_QWORD *)(a9 + 88), *(_DWORD *)(a9 + 72), *(char **)(a9 + 112), 0);
  else
    return 0;
}

uint64_t IOWV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1)
    return MKMediaWriteBlocks(*(_QWORD *)(a9 + 96), *(_QWORD *)(a9 + 80), *(_QWORD *)(a9 + 88), *(_DWORD *)(a9 + 72), *(char **)(a9 + 112), 0);
  else
    return 0;
}

uint64_t IOJobDispose(uint64_t result)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    result = pthread_mutex_trylock((pthread_mutex_t *)result);
    if ((_DWORD)result != 16)
    {
      v2 = *(_DWORD **)(v1 + 256);
      if (v2)
      {
        if (*v2)
        {
          v3 = 0;
          v4 = 0;
          do
          {
            if (*(_QWORD *)&v2[v3 + 4])
            {
              CFRelease(*(CFTypeRef *)&v2[v3 + 4]);
              v2 = *(_DWORD **)(v1 + 256);
            }
            if (*(_QWORD *)&v2[v3 + 6])
            {
              CFRelease(*(CFTypeRef *)&v2[v3 + 6]);
              v2 = *(_DWORD **)(v1 + 256);
            }
            ++v4;
            v3 += 12;
          }
          while (v4 < *v2);
        }
        free(v2);
      }
      v5 = *(void **)(v1 + 288);
      if (v5)
        free(v5);
      v6 = *(void **)(v1 + 544);
      if (v6)
        free(v6);
      stkclear(v1 + 296, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 320, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 344, v1, (uint64_t (*)(void))DisposeProbe);
      stkclear(v1 + 368, v1, (uint64_t (*)(void))iCacheDispose);
      pthread_cond_destroy((pthread_cond_t *)(v1 + 64));
      pthread_cond_destroy((pthread_cond_t *)(v1 + 112));
      pthread_mutex_unlock((pthread_mutex_t *)v1);
      v7 = pthread_mutex_destroy((pthread_mutex_t *)v1);
      free((void *)v1);
      --NumJobs;
      return v7;
    }
  }
  return result;
}

uint64_t stkclear(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t v7;

  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    while (1)
    {
      v6 = (_QWORD *)*v4;
      *(_QWORD *)(a1 + 8) = *v4;
      --*(_WORD *)(a1 + 2);
      if (v6)
      {
        if (a3)
          goto LABEL_4;
LABEL_8:
        v4 = v6;
        if (!v6)
          return 0;
      }
      else
      {
        *(_QWORD *)(a1 + 16) = 0;
        if (!a3)
          goto LABEL_8;
LABEL_4:
        v7 = a3();
        if ((_DWORD)v7)
          return v7;
        v4 = v6;
        if (!v6)
          return v7;
      }
    }
  }
  return 0;
}

uint64_t DisposeProbe(uint64_t a1)
{
  munlock(*(const void **)(a1 + 112), *(unsigned int *)(a1 + 104));
  free(*(void **)(a1 + 112));
  free((void *)a1);
  return 0;
}

uint64_t IOEngineDeinitialize()
{
  return 16 * (NumJobs != 0);
}

uint64_t purgeLoader(const __CFDictionary *a1, const __CFDictionary *a2, const void **a3, unsigned int a4, int *a5, __CFArray *a6, int a7, _DWORD *a8)
{
  const char *v12;
  const __CFString *v17;
  const __CFString *v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v23;
  unsigned int v24;
  const char *v25;
  int v26;
  CFStringRef v28;
  const __CFDictionary *Value;
  unsigned int v30;
  const __CFString *v31;
  const __CFDictionary *v32;
  int v33;
  __CFArray *v34;
  const __CFDictionary *theDict;
  CFIndex idx;
  _OWORD v37[10];
  _OWORD __s[9];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0x80000000) != 0
    || (v12 = (const char *)*a3,
        v39 = 0,
        memset(__s, 0, sizeof(__s)),
        memset(v37, 0, 154),
        *((unsigned __int16 *)v12 + 47) <= a4)
    || (v17 = CFStringCreateWithCString(0, &v12[152 * a4 + 144], 0)) == 0)
  {
    v20 = 0;
    v19 = 22;
    goto LABEL_7;
  }
  v18 = v17;
  idx = 0;
  v19 = MKLookupSchemeFormat(a1, CFSTR("GPT"), v17, 1, v37);
  CFRelease(v18);
  if (v19)
  {
    v20 = 0;
    goto LABEL_7;
  }
  if (!LOWORD(v37[0]))
    goto LABEL_37;
  if (!a2 || (theDict = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Loaders"))) == 0)
  {
    v20 = 0;
    v19 = -417;
LABEL_7:
    v21 = 0;
    if (a5)
      goto LABEL_8;
    goto LABEL_9;
  }
  v23 = LOWORD(v37[0]);
  if (!LOWORD(v37[0]))
  {
LABEL_37:
    v20 = 0;
LABEL_38:
    v19 = 2;
    goto LABEL_7;
  }
  v34 = a6;
  v24 = 0;
  v25 = (char *)&v37[2] + 4;
  v33 = a7;
  do
  {
    v26 = *(unsigned __int16 *)v25;
    if (v26 == 6)
    {
      if (*((unsigned __int16 *)v12 + 47) - 1 <= (int)a4)
        goto LABEL_31;
      v20 = 1;
    }
    else
    {
      if (v26 != 1 || a4 == 0)
        goto LABEL_31;
      v20 = -1;
    }
    v28 = CFStringCreateWithCString(0, v25 - 34, 0);
    Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v28);
    CFRelease(v28);
    if (!Value
      || GPTUpdateLoaderRecord(Value, (uint64_t)__s)
      || (~comparePartitions((uint64_t)&v12[152 * (v20 + a4) + 96], (char *)__s) & 6) == 0)
    {
      goto LABEL_33;
    }
    v23 = LOWORD(v37[0]);
LABEL_31:
    ++v24;
    v25 += 38;
  }
  while (v24 < v23);
  v20 = 0;
LABEL_33:
  if (v24 >= LOWORD(v37[0]))
    goto LABEL_38;
  v30 = v20 + a4;
  if (v34
    && (v31 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt64Type, (char *)*a3 + 152 * (int)v30 + 208),
        v32 = CFArrayDictionarySearchWithIndexOptions(v34, CFSTR("Offset"), v31, &idx, 0),
        CFRelease(v31),
        v32))
  {
    v21 = idx - v33;
    CFArrayRemoveValueAtIndex(v34, idx);
  }
  else
  {
    v21 = 0;
  }
  v19 = delentry(a3, 96, 0x5Eu, (unsigned __int16)v30, 152);
  if (!a5)
    goto LABEL_9;
LABEL_8:
  *a5 = v20;
LABEL_9:
  if (a8)
    *a8 = v21;
  if (v19 == 2)
    return 0;
  else
    return v19;
}

uint64_t IOZV(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 == 1)
    bzero(*(void **)(a9 + 112), *(_QWORD *)(a9 + 88) * *(unsigned int *)(a9 + 72));
  return 0;
}

uint64_t MKMediaUpdateProperties(uint64_t a1)
{
  if (a1)
    return _MKMediaUpdateGeometryFromDict(a1);
  return a1;
}

uint64_t setMediaBlockcount(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = *a1;
  v3 = **(_QWORD **)(*a1 + 8);
  if (!v3)
    return 22;
  v4 = *(unsigned __int16 *)(v2 + 94);
  if (*(_WORD *)(v2 + 94))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 216);
    do
    {
      if (*v6 + *(v6 - 1) > v5)
        v5 = *v6 + *(v6 - 1);
      v6 += 19;
      --v4;
    }
    while (v4);
    v7 = v5 + 1;
  }
  else
  {
    v7 = 1;
  }
  v9 = *(_DWORD *)(v3 + 84) * *(_DWORD *)(v3 + 80);
  v10 = *(_DWORD *)(v2 + 32);
  v11 = v9 / v10;
  if (v9 % v10)
    v12 = v11 + 1;
  else
    v12 = v11;
  v13 = v7 + v12;
  if (a2)
  {
    if (v13 > a2)
      return 4294961955;
  }
  else
  {
    a2 = v13;
  }
  *(_QWORD *)(v2 + 64) = a2;
  *(_QWORD *)(v3 + 24) = 1;
  *(_QWORD *)(v3 + 32) = a2 - 1;
  *(_QWORD *)(v3 + 72) = 2;
  v14 = v12 + 2;
  v15 = a2 - v12 - 2;
  *(_QWORD *)(v3 + 40) = v14;
  *(_QWORD *)(v3 + 48) = v15;
  if (v15 < v14)
    return 4294961955;
  uuid_LtoB(v2 + 16, v3 + 56);
  result = 0;
  v16 = *(_QWORD *)(v3 + 40);
  v17 = *(_QWORD *)(v3 + 48);
  v18 = *(_QWORD *)(v3 + 32) + v16 - v17;
  *(_QWORD *)(v2 + 40) = v16;
  *(_QWORD *)(v2 + 48) = v18;
  *(_QWORD *)(v2 + 56) = v17 - v16 + 1;
  *(_DWORD *)(v2 + 88) = *(_DWORD *)(v3 + 8);
  return result;
}

uint64_t MKScavangeDross(uint64_t a1, const __CFArray *a2, uint64_t a3, int a4, _WORD *a5, unsigned int *a6)
{
  __int16 v6;
  int v7;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t result;
  unsigned int *v17;
  _WORD *v18;

  if (!a1)
  {
    v10 = 0;
    LOWORD(v7) = -1;
    result = 22;
    goto LABEL_17;
  }
  v6 = a4;
  v7 = (__int16)(a4 - 1);
  if (((a4 - 1) & 0x8000) != 0)
  {
    result = 0;
    v10 = 0;
    goto LABEL_17;
  }
  v17 = a6;
  v18 = a5;
  v10 = 0;
  while (1)
  {
    v11 = v7;
    v12 = (unsigned __int16)v7;
    v13 = a1 + 1072 * (unsigned __int16)v7;
    v14 = v13 + 528;
    v15 = (const char *)(v13 + 576);
    if (!strncasecmp((const char *)(v13 + 576), (const char *)(a3 + 33), 0x20uLL))
      break;
    if ((!a2 || CFStrMatchlist(v15, a2) == -1)
      && PMCategorize(*(__int16 *)(a1 + 514), *(unsigned __int16 *)(a1 + 1072 * v12 + 1082)) - 3 > 1)
    {
      result = 0;
      LOWORD(v7) = v6;
      goto LABEL_16;
    }
    v10 += *(_DWORD *)(v14 + 12);
LABEL_10:
    v7 = v11 - 1;
    v6 = v11;
    if ((__int16)v11 <= 0)
    {
      result = 0;
      LOWORD(v7) = -1;
      goto LABEL_16;
    }
  }
  v10 += *(_DWORD *)(v14 + 12);
  if (v10 < *(_DWORD *)(a3 + 88))
    goto LABEL_10;
  result = 0;
  LOWORD(v7) = v11;
LABEL_16:
  a6 = v17;
  a5 = v18;
LABEL_17:
  if (a6)
    *a6 = v10;
  *a5 = v7;
  return result;
}

uint64_t SValidate(uint64_t *a1, unsigned int a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  int v9;

  if (a1)
  {
    v4 = *a1;
    v5 = *a1 + 1072 * a4;
    v6 = *(_DWORD *)(v5 + 536);
    if (v6 <= a2)
    {
      v7 = 0;
    }
    else
    {
      if (!a4 || *(_WORD *)(v4 + 1072 * (a4 - 1) + 1082) != 24320)
        return -5341;
      if (*(_DWORD *)(v4 + 1072 * (a4 - 1) + 536) <= a2)
        v7 = 0;
      else
        v7 = -5341;
    }
    if ((int)(a3 + a2) > (int)(*(_DWORD *)(v5 + 540) + v6))
    {
      if (a4 + 1 >= *(unsigned __int16 *)(v4 + 522))
      {
        v9 = *(_DWORD *)(v4 + 4);
      }
      else
      {
        v8 = v4 + 1072 * (a4 + 1);
        v9 = *(_DWORD *)(v8 + 536);
        if (*(_WORD *)(v8 + 1082) == 24320)
          v9 += *(_DWORD *)(v8 + 540);
      }
      if ((int)(a3 + a2) <= v9)
        return 0;
      else
        return -5341;
    }
  }
  else
  {
    return 22;
  }
  return v7;
}

uint64_t MKPurgeLoader(const __CFDictionary *a1, const __CFDictionary *a2, const void **a3, unsigned int a4, int *a5, const __CFArray *a6, int a7, _DWORD *a8)
{
  const char *v12;
  uint64_t result;
  int v17;
  unsigned int v18;
  unsigned int v19;
  const char *v20;
  int v21;
  CFStringRef v23;
  const __CFDictionary *Value;
  int v25;
  const __CFString *v26;
  const __CFDictionary *v27;
  __CFArray *v28;
  const __CFArray *v29;
  int v30;
  const __CFDictionary *theDict;
  CFIndex idx;
  _OWORD v33[10];
  char v34[96];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if ((a4 & 0x80000000) != 0 || (v12 = (const char *)*a3, *((unsigned __int16 *)*a3 + 261) <= a4))
  {
    v17 = 0;
    LODWORD(result) = 22;
    goto LABEL_6;
  }
  idx = 0;
  memset(v34, 0, sizeof(v34));
  v35 = 0;
  memset(v33, 0, 154);
  LODWORD(result) = MKGetPartitionRequisites(a1, *((__int16 *)v12 + 257), &v12[1072 * a4 + 576], *(unsigned __int16 *)&v12[1072 * a4 + 1082], v33);
  if ((_DWORD)result)
  {
    v17 = 0;
    goto LABEL_6;
  }
  theDict = (const __CFDictionary *)CFDictionaryGetValue(a2, CFSTR("Loaders"));
  if (!theDict)
  {
    v17 = 0;
    LODWORD(result) = -417;
    goto LABEL_6;
  }
  v30 = a7;
  v18 = LOWORD(v33[0]);
  if (LOWORD(v33[0]))
  {
    v29 = a6;
    v19 = 0;
    v20 = (char *)&v33[2] + 4;
    while (1)
    {
      v21 = *(unsigned __int16 *)v20;
      if (v21 == 6)
      {
        if (*((unsigned __int16 *)v12 + 261) - 1 <= (int)a4)
          goto LABEL_29;
        v17 = 1;
      }
      else
      {
        if (v21 != 1 || a4 == 0)
          goto LABEL_29;
        v17 = -1;
      }
      v23 = CFStringCreateWithCString(0, v20 - 34, 0);
      Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, v23);
      CFRelease(v23);
      if (!Value)
      {
        LODWORD(result) = -415;
LABEL_6:
        LODWORD(a6) = 0;
        goto LABEL_7;
      }
      LODWORD(result) = MKGetPartitionInfo(Value, *((__int16 *)v12 + 257), (uint64_t)v34);
      if ((_DWORD)result)
        goto LABEL_6;
      v25 = strcasecmp(&v12[1072 * (v17 + a4) + 576], &v34[33]);
      v18 = LOWORD(v33[0]);
      if (!v25)
        goto LABEL_31;
LABEL_29:
      ++v19;
      v20 += 38;
      if (v19 >= v18)
      {
        v17 = 0;
LABEL_31:
        a6 = v29;
        goto LABEL_34;
      }
    }
  }
  v19 = 0;
  v17 = 0;
LABEL_34:
  if (v19 >= v18)
  {
    LODWORD(result) = 2;
    goto LABEL_6;
  }
  if (a6)
  {
    v26 = (const __CFString *)CFNumberCreate(0, kCFNumberSInt32Type, (char *)*a3 + 1072 * (int)(v17 + a4) + 536);
    v27 = CFArrayDictionarySearchWithIndexOptions(a6, CFSTR("Offset"), v26, &idx, 0);
    CFRelease(v26);
    if (v27)
    {
      v28 = a6;
      LODWORD(a6) = idx - v30;
      CFArrayRemoveValueAtIndex(v28, idx);
    }
    else
    {
      LODWORD(a6) = 0;
    }
  }
  if (v17)
    LODWORD(result) = PMRemovePartition(a3, (unsigned __int16)(v17 + a4), 0);
  else
    LODWORD(result) = 0;
LABEL_7:
  if (a5)
    *a5 = v17;
  if (a8)
    *a8 = (_DWORD)a6;
  if ((_DWORD)result == 2)
    return 0;
  else
    return result;
}

uint64_t PMRemovePartition(const void **a1, unsigned int a2, int a3)
{
  char *v5;
  char *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v13;

  if (!a1 || (v5 = (char *)*a1, *((unsigned __int16 *)*a1 + 261) <= a2))
  {
    LOWORD(v10) = -50;
    return (__int16)v10;
  }
  v7 = &v5[1072 * a2];
  v8 = (uint64_t)(v7 + 528);
  v9 = *((_DWORD *)v7 + 249);
  bzero(v7 + 608, 0x3E0uLL);
  v10 = PMSetTypeExtended(v8, 24320, *((__int16 *)v5 + 257), "");
  if (!a3 || a2 < 2 || v10)
    return (__int16)v10;
  v11 = *((__int16 *)v5 + 257);
  if (v11 == 8)
  {
    v13 = *(unsigned __int16 *)(v8 - 518);
    if (v13 != 5 && v13 != 133 && v13 != 15)
      return PMRationalise(a1);
  }
  else if (v11 != 1 || (v9 & 8) == 0 || *(_WORD *)(v8 - 518) != 14336)
  {
    return PMRationalise(a1);
  }
  v10 = PMSetTypeExtended(v8 - 1072, 24320, v11, "");
  if (v10)
    return (__int16)v10;
  return PMRationalise(a1);
}

uint64_t PMSetTypeExtended(uint64_t a1, int a2, int a3, _BYTE *a4)
{
  _BYTE *v6;
  char *v7;

  if (a1)
  {
    *(_WORD *)(a1 + 554) = a2;
    v6 = (_BYTE *)(a1 + 48);
    v7 = (char *)PMCodeSearch(a2, a3);
    strncpypad(v6, v7, 0x20uLL, 0);
    if (a4)
      strncpypad((_BYTE *)(a1 + 16), a4, 0x20uLL, 0);
    return 0;
  }
  else
  {
    return -50;
  }
}

uint64_t PMRationalise(const void **a1)
{
  _WORD *v2;
  int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  __int16 v11;

  if (a1)
  {
    v2 = *a1;
    if (*((unsigned __int16 *)*a1 + 261) < 2u)
    {
      return 0;
    }
    else
    {
      v3 = 0;
      v4 = 1;
      do
      {
        v5 = v3 + 1;
        while (1)
        {
          v6 = (uint64_t)&v2[536 * (unsigned __int16)v3 + 264];
          if (*(_WORD *)(v6 + 554) != 24320)
            break;
          v7 = *(_DWORD *)(v6 + 12);
          if (v7)
          {
            if (v2[536 * v5 + 541] != 24320)
              break;
            v8 = (uint64_t)&v2[536 * v5 + 264];
            v9 = *(_DWORD *)(v8 + 12);
            if (!v9 || *(_DWORD *)(v6 + 8) >= *(_DWORD *)(v8 + 8))
              break;
            if ((*(_BYTE *)(v6 + 90) & 0x20) != 0)
            {
              strncpypad((_BYTE *)(v6 + 16), (_BYTE *)(v8 + 16), 0x20uLL, 0);
              *(_DWORD *)(v6 + 88) = *(_DWORD *)(v8 + 88);
              v9 = *(_DWORD *)(v8 + 12);
              v7 = *(_DWORD *)(v6 + 12);
            }
            *(_DWORD *)(v6 + 12) = v7 + v9;
            v10 = (unsigned __int16)(v3 + 1);
          }
          else
          {
            v10 = (unsigned __int16)v3;
          }
          v11 = delentry(a1, 528, 0x20Au, v10, 1072);
          if (v11)
            return v11;
          v2 = *a1;
          if (v4 >= *((unsigned __int16 *)*a1 + 261))
            return 0;
        }
        v11 = 0;
        v3 = (unsigned __int16)(v3 + 1);
        v4 = v3 + 1;
      }
      while (v3 + 1 < (unsigned __int16)v2[261]);
    }
  }
  else
  {
    return -50;
  }
  return v11;
}

uint64_t _MKMediaCharDeviceInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const __CFAllocator *v5;
  __CFDictionary *Mutable;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  CFStringRef v11;
  const char *v13;
  char *v14;
  const char *v15;
  size_t v16;
  char *v17;
  int v18;
  char __source[8];
  stat v20;
  uint64_t v21;

  v21 = 0;
  strcpy(__source, "/dev/");
  if (!a1 || *(_DWORD *)a1 != 1296786550)
    return 22;
  memset(&v20, 0, sizeof(v20));
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    v13 = *(const char **)(a1 + 8);
    if (v13)
    {
      if (stat(v13, &v20))
        return *__error();
      v14 = devname(v20.st_rdev, 0x2000u);
      if (!v14)
        return 2;
      v15 = v14;
      v16 = strlen(v14) + 6;
      v17 = (char *)malloc_type_malloc(v16, 0xA40E3D0uLL);
      strlcpy(v17, __source, v16);
      strlcat(v17, v15, v16);
      free(*(void **)(a1 + 8));
      *(_QWORD *)(a1 + 8) = v17;
      v18 = _MKMediaOpenFile(v17, theDict, (int *)&v21 + 1, (int *)&v21);
      if (v18 < 0)
        return *__error();
      *(_DWORD *)(a1 + 4) = v18;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("Writable"));
    if (Value)
      HIDWORD(v21) = CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDBD270]);
  }
  *(_QWORD *)(a1 + 8) = strdup("<unknown device>");
LABEL_8:
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 16) = Mutable;
  if (!Mutable)
    return 12;
  v7 = (const void *)*MEMORY[0x24BDBD270];
  v8 = (const void *)*MEMORY[0x24BDBD268];
  if (HIDWORD(v21))
    v9 = (const void *)*MEMORY[0x24BDBD270];
  else
    v9 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionaryAddValue(Mutable, CFSTR("Writable"), v9);
  if ((_DWORD)v21)
    v10 = v7;
  else
    v10 = v8;
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Shared Writer"), v10);
  v11 = CFStringCreateWithCString(v5, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Path"), v11);
  CFRelease(v11);
  return 0;
}

const void *_MKMediaFileCopyProperty(uint64_t a1, void *key)
{
  const __CFDictionary *v4;
  const void *v5;
  const void *Value;
  __CFDictionary *Mutable;

  if (!key)
    return 0;
  v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4 && (v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    Value = v5;
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    _MKMediaFileGetGeoProperties((_DWORD *)a1, Mutable);
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
      goto LABEL_8;
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable)
    CFRelease(Mutable);
  return Value;
}

uint64_t _MKMediaFileGetGeoProperties(_DWORD *a1, __CFDictionary *a2)
{
  int v2;
  off_t v5;
  stat v6;

  if (!a1)
    return 22;
  if (*a1 != 1296786550)
    return 22;
  v2 = a1[1];
  if (v2 < 0)
    return 22;
  memset(&v6, 0, sizeof(v6));
  if (fstat(v2, &v6))
    return *__error();
  if (v6.st_size)
    v5 = v6.st_size / 512;
  else
    v5 = -1;
  return _MKMediaSetupGeometry(a2, 512, v5, 0x10000);
}

uint64_t MKMakePartBootable(__CFBundle *a1, const void **a2, _QWORD *a3, int a4, char *a5, char *a6, unsigned int a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *), BOOL *a10)
{
  BOOL *v17;
  __CFBundle *v18;
  const __CFURL *v19;
  const __CFDictionary *v20;
  const __CFURL *v21;
  const __CFDictionary *v22;
  int v23;
  __int16 *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  int v30;
  const char *v31;
  int v32;
  __int16 *v33;
  int v34;
  const char *v35;
  BOOL v36;
  const __CFDictionary *Value;
  const __CFDictionary *v38;
  char *v39;
  CFStringRef v40;
  const __CFDictionary *v41;
  CFStringRef v42;
  const __CFDictionary *v43;
  const __CFArray *v44;
  int v45;
  __int16 *v46;
  uint64_t v47;
  int v48;
  const __CFDictionary *v49;
  const __CFDictionary *v50;
  CFStringRef v51;
  const __CFDictionary *v52;
  uint64_t v53;
  int v54;
  unsigned int v55;
  const __CFNumber *v56;
  uint64_t v57;
  unsigned int v58;
  __int16 v59;
  int v60;
  _BYTE *v61;
  char v62;
  const void **v63;
  CFDictionaryRef theDict;
  const __CFDictionary *theDicta;
  __int16 *v66;
  int v67;
  char *v68;
  unsigned int v69;
  uint64_t v70;
  BOOL v72;
  _BYTE v73[154];
  __int16 v74;
  __int16 v75;
  uint64_t v76;
  unsigned int valuePtr;
  unsigned int v78;
  char v79[1024];
  char v80[80];
  __int128 v81;
  uint64_t v82;
  uint64_t v83;

  v17 = a10;
  v83 = *MEMORY[0x24BDAC8D0];
  v75 = 0;
  valuePtr = 0;
  v78 = 22;
  v18 = a1;
  if (!a1)
  {
    v18 = MKAccessLibrary(0);
    if (!v18)
    {
      *a10 = 0;
      return 22;
    }
  }
  v70 = a8;
  v76 = 0;
  v74 = 0;
  memset(v80, 0, sizeof(v80));
  v81 = 0u;
  v82 = 0;
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  v19 = MKLoadDB(v18, CFSTR("database"), (int *)&v78);
  if (v19)
  {
    v20 = v19;
    v21 = MKLoadDB(v18, CFSTR("inventory"), (int *)&v78);
    if (!v21)
    {
      v23 = 0;
      v22 = v20;
LABEL_15:
      CFRelease(v22);
      v17 = a10;
      if (a1)
        goto LABEL_17;
      goto LABEL_16;
    }
    v22 = v21;
    v69 = a7;
    v23 = 0;
    v78 = PMAccountFreespace(a2, 0, 0x8000u);
    if (v78)
      goto LABEL_11;
    v78 = PMGuidSearch((uint64_t)a2, a3, &v74);
    if (v78
      || ((v24 = (__int16 *)*a2, v67 = v74, !a4)
        ? (!a5
         ? (char *)(LOWORD(a4) = 0)
         : !*a5
         ? (LOWORD(a4) = 0, a5 = 0)
         : (char *)(LOWORD(a4) = (unsigned __int16)PMDescriptorSearch(a5, v24[257])))
        : (a5 = (char *)PMCodeSearch(a4, v24[257])),
          v78))
    {
      v23 = 0;
      goto LABEL_11;
    }
    v26 = (uint64_t)&v24[536 * v67 + 264];
    v66 = v24;
    if (a5)
    {
      theDict = (CFDictionaryRef)&v24[536 * v67 + 264];
      v27 = (uint64_t)&v24[536 * v67 + 288];
      if (!strncasecmp((const char *)(v26 + 48), a5, 0x20uLL))
      {
        v63 = a2;
        v23 = 0;
        v26 = (uint64_t)theDict;
      }
      else
      {
        v61 = (_BYTE *)v27;
        v23 = 0;
        v78 = MKPurgeLoader(v20, v22, a2, v74, (int *)&v76, 0, 0, 0);
        if (v78)
          goto LABEL_11;
        v63 = a2;
        v66[536 * v67 + 541] = a4;
        *((_DWORD *)theDict + 21) = *((_DWORD *)theDict + 3);
        strncpypad(v61, a5, 0x20uLL, 0);
        v78 = PMDefaultPartitionStatus(v66[257], (uint64_t)theDict);
        if ((v69 & 4) == 0)
          *((_DWORD *)theDict + 22) |= 0x100000u;
        v23 = 1;
        v26 = (uint64_t)theDict;
      }
    }
    else
    {
      v63 = a2;
      v23 = 0;
    }
    if (a6)
    {
      v28 = v26;
      v29 = (_BYTE *)(v26 + 16);
      if (strncasecmp((const char *)(v26 + 16), a6, 0x20uLL))
      {
        strncpypad(v29, a6, 0x20uLL, 0);
        ++v23;
      }
      v26 = v28;
    }
    v78 = MKGetPartitionRequisites(v20, v66[257], (const char *)(v26 + 48), (unsigned __int16)v66[536 * v67 + 541], v73);
    if (v78)
      goto LABEL_11;
    v30 = *(unsigned __int16 *)v73;
    if (!*(_WORD *)v73)
    {
LABEL_43:
      v32 = 1;
      goto LABEL_44;
    }
    v31 = &v73[36];
    while (*(_WORD *)v31 != 1)
    {
      v31 += 38;
      if (!--v30)
        goto LABEL_43;
    }
    v78 = -417;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v22, CFSTR("Loaders"));
    if (!Value)
      goto LABEL_11;
    v38 = Value;
    v39 = (char *)(v31 - 34);
    v78 = -415;
    v40 = CFStringCreateWithCString(0, v31 - 34, 0);
    v41 = (const __CFDictionary *)CFDictionaryGetValue(v38, v40);
    v42 = v40;
    v43 = v41;
    CFRelease(v42);
    if (!v43)
      goto LABEL_11;
    v78 = MKGetPartitionInfo(v43, v66[257], (uint64_t)v80);
    if (v78)
      goto LABEL_11;
    v44 = (const __CFArray *)CFDictionaryGetValue(v43, CFSTR("Partition Type Throw Aways"));
    v78 = MKScavangeDross((uint64_t)v66, v44, (uint64_t)v80, v74, &v75, (unsigned int *)&v76 + 1);
    if (v78)
      goto LABEL_11;
    theDicta = v43;
    v68 = v39;
    if (v74 <= v75)
      goto LABEL_85;
    v45 = v75;
    if (v75 + 1 == v74)
    {
      v46 = &v66[536 * v75];
      v47 = (uint64_t)(v46 + 264);
      if (!strcasecmp((const char *)v46 + 576, &v80[33]) && *(_DWORD *)(v47 + 12) == DWORD2(v81))
      {
        if (v66[536 * v45 + 541] == 24320)
        {
          v48 = 0;
LABEL_83:
          v62 = 1;
          goto LABEL_84;
        }
        if (strcasecmp((const char *)&v66[536 * v45 + 500], v68))
        {
          v78 = PMSetupLoader(v47, v68, (uint64_t)v80);
          if (v78)
            goto LABEL_11;
          ++v23;
        }
        v60 = *(_DWORD *)(v47 + 88);
        v62 = 0;
        v48 = 0;
        v78 = PMDefaultPartitionStatus(v66[257], v47);
        if (v60 != *(_DWORD *)(v47 + 88))
          ++v23;
      }
      else
      {
        v78 = PMSetTypeExtended(v47, 24320, v66[257], "");
        if (v78)
          goto LABEL_11;
        v78 = PMRationalise(v63);
        if (v78)
          goto LABEL_11;
        ++v23;
        v62 = 1;
LABEL_80:
        v48 = 1;
      }
LABEL_84:
      v55 = PMGuidSearch((uint64_t)v63, a3, &v74);
      v78 = v55;
      if (!v48)
      {
        v66 = (__int16 *)*v63;
        if ((v62 & 1) != 0)
          goto LABEL_99;
        v59 = v75;
LABEL_95:
        if (v66[536 * v59 + 541] != 24320)
        {
          v55 = MKUpdateLoader((uint64_t *)v63, v59, v18, v22, v70, a9);
          v78 = v55;
          if (!v55)
          {
            v32 = 0;
            ++v23;
LABEL_44:
            if ((v69 & 0x1000) != 0)
            {
              v36 = v32 == 0;
              v33 = &v75;
              if (!v36)
                v33 = &v74;
              v23 += PMSetBootPartition((uint64_t)v66, *v33);
              v34 = *(unsigned __int16 *)v73;
              if (*(_WORD *)v73)
              {
                v35 = &v73[36];
                while (*(_WORD *)v35 != 3)
                {
                  v35 += 38;
                  if (!--v34)
                    goto LABEL_51;
                }
                v78 = -417;
                v49 = (const __CFDictionary *)CFDictionaryGetValue(v22, CFSTR("Loaders"));
                if (!v49)
                  goto LABEL_11;
                v50 = v49;
                v78 = -415;
                v51 = CFStringCreateWithCString(0, v35 - 34, 0);
                v52 = (const __CFDictionary *)CFDictionaryGetValue(v50, v51);
                if (!v52)
                  goto LABEL_11;
                v78 = ResolveLoaderPath(v18, v52, v51, v79);
                CFRelease(v51);
                if (v78)
                  goto LABEL_11;
                v78 = MBRSetBootloaderFile((uint64_t)v66, v79);
                if (v78)
                  goto LABEL_11;
                ++v23;
              }
            }
LABEL_51:
            v78 = MKPurgeLoaders(v18, (uint64_t *)v63, &v72);
            if (v78)
              v36 = 1;
            else
              v36 = !v72;
            if (!v36)
              ++v23;
LABEL_11:
            CFRelease(v20);
            goto LABEL_15;
          }
          if ((unsigned __int16)v55 == 64230)
          {
            v32 = 0;
            v78 = 0;
            goto LABEL_44;
          }
        }
LABEL_99:
        if (v55)
          goto LABEL_11;
        v32 = 0;
        goto LABEL_44;
      }
LABEL_85:
      v56 = (const __CFNumber *)CFDictionaryGetValue(theDicta, CFSTR("Minimum Host Size"));
      if (v56)
      {
        CFNumberGetValue(v56, kCFNumberSInt32Type, &valuePtr);
        v57 = valuePtr;
      }
      else
      {
        v57 = 0;
      }
      v58 = PMCreateLoader(v63, 0, v74, v57, v68, (v69 >> 13) & 1, (uint64_t)v80);
      v78 = v58;
      if (v58)
      {
        if (v58 != 28)
          goto LABEL_11;
        v32 = 0;
        v78 = 0;
        v66 = (__int16 *)*v63;
        goto LABEL_44;
      }
      v78 = PMRationalise(v63);
      if (v78)
        goto LABEL_11;
      v55 = PMGuidSearch((uint64_t)v63, a3, &v74);
      v78 = v55;
      v59 = v74 - 1;
      v75 = v74 - 1;
      ++v23;
      v66 = (__int16 *)*v63;
      goto LABEL_95;
    }
    v48 = 0;
    v53 = (uint64_t)&v66[536 * v75 + 264];
    v54 = v23;
    while (1)
    {
      v78 = PMSetTypeExtended(v53, 24320, v66[257], "");
      if (v78)
      {
        v62 = 1;
        v23 = v54;
        goto LABEL_84;
      }
      v78 = PMRationalise(v63);
      if (v78)
        break;
      ++v48;
      ++v54;
      --v74;
      v53 += 1072;
      if (v75 >= v74)
      {
        v62 = 1;
        v23 = v54;
        goto LABEL_80;
      }
    }
    v23 += v48;
    goto LABEL_83;
  }
  v23 = 0;
  if (a1)
    goto LABEL_17;
LABEL_16:
  CFRelease(v18);
LABEL_17:
  result = v78;
  *v17 = v23 != 0;
  if ((_DWORD)result == -1)
    return *__error();
  return result;
}

uint64_t PMSetBootPartition(uint64_t a1, int a2)
{
  int v2;
  uint64_t result;
  unsigned int *i;
  unsigned int v6;
  unsigned int v7;

  v2 = *(unsigned __int16 *)(a1 + 522);
  if (*(_WORD *)(a1 + 522))
  {
    result = 0;
    for (i = (unsigned int *)(a1 + 616); ; i += 268)
    {
      v6 = *i;
      if (a2)
      {
        if ((v6 & 0x80000000) != 0)
        {
          v7 = v6 & 0x7FFFFFFF;
LABEL_8:
          *i = v7;
          result = (result + 1);
        }
      }
      else if ((v6 & 0x80000000) == 0)
      {
        v7 = v6 | 0xC0000000;
        goto LABEL_8;
      }
      --a2;
      if (!--v2)
        return result;
    }
  }
  return 0;
}

uint64_t VWritePartitions(Ptr *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  Ptr v5;

  if (!a1)
    return -109;
  v5 = *a1;
  if (!*((_WORD *)*a1 + 1) || !*((_WORD *)v5 + 259))
    return -50;
  if (a2 >= 0x21)
    a2 = *((__int16 *)v5 + 257);
  if (a2 - 1 < 3)
    return APMWriteMedia(a1, a3, a4, a5);
  if (a2 != 8)
  {
    if (a2 == 32)
      return ISOWriteMedia(a1, a3, a4, a5);
    return -5317;
  }
  return MBRWriteMedia(a1, a3, a4, (uint64_t (*)(uint64_t, uint64_t, _QWORD))a5);
}

CFStringRef _MKMediaCFRuntimeCopyDebugDesc(uint64_t a1)
{
  uint64_t (*v2)(_QWORD, _QWORD, uint64_t);
  CFStringRef result;

  v2 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1 + 64);
  if (!v2)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%s <%p>"), "MKMedia", a1);
  result = (CFStringRef)v2(*(_QWORD *)(a1 + 88), 0, 1);
  if (!result)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%s <%p>"), "MKMedia", a1);
  return result;
}

CFStringRef _MKMediaDeviceDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("<MKMediaRef>: %s"), *(_QWORD *)(a1 + 8));
}

uint64_t DDMDrvrRecord_BtoN(uint64_t result, uint64_t a2)
{
  *(_DWORD *)result = bswap32(*(_DWORD *)a2);
  *(_WORD *)(result + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  return result;
}

int8x16_t PMPtchDescriptor_BtoN(uint64_t a1, uint64_t a2)
{
  int8x16_t result;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_DWORD *)a1 = bswap32(*(_DWORD *)a2);
  *(_WORD *)(a1 + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(a1 + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  result = vrev32q_s8(*(int8x16_t *)(a2 + 8));
  *(int8x16_t *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + 24));
  if (a1 != a2)
  {
    v3 = *(_OWORD *)(a2 + 28);
    v4 = *(_OWORD *)(a2 + 44);
    *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
    *(_OWORD *)(a1 + 44) = v4;
    *(_OWORD *)(a1 + 28) = v3;
    result = *(int8x16_t *)(a2 + 61);
    v5 = *(_OWORD *)(a2 + 77);
    *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
    *(_OWORD *)(a1 + 77) = v5;
    *(int8x16_t *)(a1 + 61) = result;
  }
  return result;
}

_WORD *PMPtchList_BtoN(_WORD *result, unsigned __int16 *a2)
{
  *result = bswap32(*a2) >> 16;
  result[1] = bswap32(a2[1]) >> 16;
  return result;
}

int8x8_t PMPtchHeader_BtoN(char *__dst, char *__src)
{
  int8x8_t result;

  if (__dst != __src)
    memcpy(__dst, __src, 0x200EuLL);
  *(_WORD *)__dst = bswap32(*(unsigned __int16 *)__src) >> 16;
  result = vrev32_s8(*(int8x8_t *)(__src + 2));
  *(int8x8_t *)(__dst + 2) = result;
  *((_WORD *)__dst + 5) = bswap32(*((unsigned __int16 *)__src + 5)) >> 16;
  *((_WORD *)__dst + 6) = bswap32(*((unsigned __int16 *)__src + 6)) >> 16;
  return result;
}

int8x16_t PMPtchDescriptor_NtoB(uint64_t a1, uint64_t a2)
{
  int8x16_t result;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  *(_DWORD *)a1 = bswap32(*(_DWORD *)a2);
  *(_WORD *)(a1 + 4) = bswap32(*(unsigned __int16 *)(a2 + 4)) >> 16;
  *(_WORD *)(a1 + 6) = bswap32(*(unsigned __int16 *)(a2 + 6)) >> 16;
  result = vrev32q_s8(*(int8x16_t *)(a2 + 8));
  *(int8x16_t *)(a1 + 8) = result;
  *(_DWORD *)(a1 + 24) = bswap32(*(_DWORD *)(a2 + 24));
  if (a1 != a2)
  {
    v3 = *(_OWORD *)(a2 + 28);
    v4 = *(_OWORD *)(a2 + 44);
    *(_BYTE *)(a1 + 60) = *(_BYTE *)(a2 + 60);
    *(_OWORD *)(a1 + 44) = v4;
    *(_OWORD *)(a1 + 28) = v3;
    result = *(int8x16_t *)(a2 + 61);
    v5 = *(_OWORD *)(a2 + 77);
    *(_BYTE *)(a1 + 93) = *(_BYTE *)(a2 + 93);
    *(_OWORD *)(a1 + 77) = v5;
    *(int8x16_t *)(a1 + 61) = result;
  }
  return result;
}

_WORD *PMPtchList_NtoB(_WORD *result, unsigned __int16 *a2)
{
  *result = bswap32(*a2) >> 16;
  result[1] = bswap32(a2[1]) >> 16;
  return result;
}

char *APMDDMGenerate(char *result, int a2, char a3, int a4)
{
  char *v4;
  int v5;
  char *v8;
  unsigned __int16 v9;
  __int16 v10;
  int v11;
  char *v12;
  BOOL v13;
  char v14;
  BOOL v15;
  int v16;
  unsigned int v17;
  int v18;
  __int16 v19;
  signed __int16 v20;
  BOOL v21;
  unsigned int v22;
  __int16 v23;
  unsigned int v24;

  v4 = result + 18;
  *((_WORD *)result + 8) = 0;
  v5 = *((unsigned __int16 *)result + 261);
  if (*((_WORD *)result + 261))
  {
    v8 = result;
    v9 = 0;
    v10 = 0;
    v24 = (a3 & 0x7F) << 9;
    do
    {
      v11 = v10;
      v12 = &v8[1072 * v10];
      result = strstr(v12 + 576, "Driver");
      if (result)
      {
        if (!a2
          || (a4 == 1 ? (v13 = (v12[619] & 3) == 2) : (v13 = 0),
              !v13 ? (v14 = 0) : (v14 = 1),
              (v12[619] & 3) == 0 ? (v15 = a4 == 4) : (v15 = 0),
              !v15 && (v14 & 1) == 0))
        {
          v16 = *(unsigned __int16 *)&v8[1072 * v11 + 1082];
          v17 = v16 - 12288;
          if ((v16 - 12288) > 4)
          {
            LOWORD(v18) = 0;
LABEL_31:
            *((_DWORD *)v12 + 154) &= 0x703u;
LABEL_32:
            if ((_WORD)v18)
            {
              *(_DWORD *)v4 = *((_DWORD *)v12 + 134);
              v22 = *((_DWORD *)v12 + 156);
              if (v22 % v24)
                v23 = v22 / v24 + 1;
              else
                v23 = v22 / v24;
              *((_WORD *)v4 + 2) = v23;
              *((_WORD *)v4 + 3) = v18;
              v4 += 8;
              *((_WORD *)v8 + 8) = ++v9;
            }
            goto LABEL_37;
          }
          v18 = word_212DE40DC[(__int16)v17];
          if (!v9)
            goto LABEL_31;
          v19 = 0;
          v20 = 0;
          do
          {
            v21 = v19 == 0;
            if (*(unsigned __int16 *)&v8[8 * v20 + 24] == (__int16)v18)
              ++v19;
            if (*(unsigned __int16 *)&v8[8 * v20 + 24] == (__int16)v18 && v21)
              v18 = -v18;
            ++v20;
          }
          while (v9 > v20);
          *((_DWORD *)v12 + 154) &= 0x703u;
          if (!a2 || !v19)
            goto LABEL_32;
          if (a4 == 1)
          {
            if (v16 != 12290 && v16 != 12292)
              goto LABEL_32;
          }
          else if (v17 > 3 || v16 == 12290)
          {
            goto LABEL_32;
          }
        }
      }
LABEL_37:
      v10 = v11 + 1;
    }
    while (v5 > (__int16)(v11 + 1));
  }
  *(_QWORD *)v4 = 0;
  return result;
}

uint64_t apmirec2xrec(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a2 + 496) = 0;
  *(_OWORD *)(a2 + 464) = 0u;
  *(_OWORD *)(a2 + 480) = 0u;
  *(_OWORD *)(a2 + 432) = 0u;
  *(_OWORD *)(a2 + 448) = 0u;
  *(_OWORD *)(a2 + 400) = 0u;
  *(_OWORD *)(a2 + 416) = 0u;
  *(_OWORD *)(a2 + 368) = 0u;
  *(_OWORD *)(a2 + 384) = 0u;
  *(_OWORD *)(a2 + 336) = 0u;
  *(_OWORD *)(a2 + 352) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_WORD *)a2 = 20557;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 80);
  *(_DWORD *)(a2 + 88) = *(_DWORD *)(a1 + 88) & 0xF000FFFF;
  *(_QWORD *)(a2 + 92) = *(_QWORD *)(a1 + 92);
  *(_DWORD *)(a2 + 116) = *(_DWORD *)(a1 + 116);
  __strlcpy_chk();
  __strlcpy_chk();
  __strlcpy_chk();
  result = __strlcpy_chk();
  *(_DWORD *)(a2 + 136) = *(_DWORD *)(a1 + 136);
  *(_DWORD *)(a2 + 148) = *(_DWORD *)(a1 + 464);
  *(_DWORD *)(a2 + 500) = *(_DWORD *)(a1 + 512);
  *(_WORD *)(a2 + 498) = *(_WORD *)(a1 + 508);
  return result;
}

uint64_t PMPTCHQuantify(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  uint64_t v7;
  __int16 v8;
  int v12;
  Ptr v13;
  OSErr v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  int v22;
  int v23;
  unsigned int v24;
  char *v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unsigned int v29;

  if (a1)
  {
    v7 = *(unsigned __int16 *)(a1 + 498);
    if ((_DWORD)v7 == a3)
    {
      return 0;
    }
    else
    {
      v12 = *(_DWORD *)(a1 + 8);
      v13 = NewPtrClear((unint64_t)(v7 & 0x7F) << 9);
      v14 = MemError();
      if (v13)
      {
        v15 = (v12 * a2);
        v16 = a5(a4, 2, 512, v15, v7, v13);
        v8 = v16;
        if (!v16)
        {
          v17 = bswap32(*(unsigned __int16 *)v13) >> 16;
          *(_WORD *)v13 = v17;
          v18 = *((unsigned __int16 *)v13 + 1);
          v19 = __rev16(v18);
          *((_WORD *)v13 + 1) = v19;
          if (v19 <= 0x20 && (v20 = *(_DWORD *)(a1 + 12), v20 >= v17))
          {
            if (v18)
            {
              v29 = v15;
              v22 = 0;
              v23 = 0;
              v24 = v20 * a2;
              while (1)
              {
                v25 = &v13[v22 + 4];
                PMPtchDescriptor_BtoN((uint64_t)v25, (uint64_t)v25);
                v26 = *((_DWORD *)v25 + 3) * v7;
                v27 = v26 + (*((_DWORD *)v25 + 4) >> 9);
                if ((*((_DWORD *)v25 + 4) & 0x1FF) != 0)
                  ++v27;
                if (v27 > v24)
                  break;
                if (v24 >= v26)
                  v24 = *((_DWORD *)v25 + 3) * v7;
                *((_DWORD *)v25 + 3) = v26 / a3;
                v22 += *((_DWORD *)v25 + 6);
                PMPtchDescriptor_NtoB((uint64_t)v25, (uint64_t)v25);
                ++v23;
                v18 = *((unsigned __int16 *)v13 + 1);
                if (v18 <= (unsigned __int16)v23)
                {
                  v17 = *(unsigned __int16 *)v13;
                  v15 = v29;
                  goto LABEL_22;
                }
              }
              v8 = -5344;
            }
            else
            {
LABEL_22:
              *(_WORD *)v13 = __rev16(v17);
              *((_WORD *)v13 + 1) = __rev16(v18);
              v28 = a5(a4, 3, 512, v15, v7, v13);
              v8 = v28;
              if (!v28)
                *(_WORD *)(a1 + 498) = a3;
            }
          }
          else
          {
            v8 = -5325;
          }
        }
        DisposePtr(v13);
      }
      else
      {
        return v14;
      }
    }
  }
  else
  {
    return -50;
  }
  return v8;
}

uint64_t DDMRecord_NtoB(uint64_t result, unsigned __int16 *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned __int16 *v4;
  uint64_t v5;

  *(_WORD *)result = bswap32(*a2) >> 16;
  *(_WORD *)(result + 2) = bswap32(a2[1]) >> 16;
  *(_DWORD *)(result + 4) = bswap32(*((_DWORD *)a2 + 1));
  *(_WORD *)(result + 8) = bswap32(a2[4]) >> 16;
  *(_WORD *)(result + 10) = bswap32(a2[5]) >> 16;
  *(_DWORD *)(result + 12) = bswap32(*((_DWORD *)a2 + 3));
  *(_WORD *)(result + 16) = bswap32(a2[8]) >> 16;
  v2 = a2[8];
  if (a2[8])
  {
    v3 = 0;
    v4 = a2 + 9;
    v5 = result + 18;
    do
    {
      *(_DWORD *)v5 = bswap32(*(_DWORD *)v4);
      *(_WORD *)(v5 + 4) = bswap32(v4[2]) >> 16;
      *(_WORD *)(v5 + 6) = bswap32(v4[3]) >> 16;
      ++v3;
      v4 += 4;
      v5 += 8;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t APMReadRawMediaMap(const void **a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  int v7;
  int v8;
  __int16 v9;
  __int16 v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  unsigned __int16 *v15;
  int v16;
  _QWORD v18[2];
  int v19;
  _OWORD v20[31];
  uint64_t v21;
  _DWORD v22[12];
  char v23[384];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int16 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  memset(v23, 0, sizeof(v23));
  memset(v22, 0, sizeof(v22));
  v21 = 0;
  memset(v20, 0, sizeof(v20));
  v18[0] = 0;
  v18[1] = 0;
  v19 = 0;
  v7 = PMConvertBlocks(63, *((unsigned __int16 *)*a1 + 1), 0x200u);
  v8 = APMMapAnalysis((uint64_t)v18, (unsigned __int16)v7, 2u, 0, a3, a4);
  v9 = v8;
  if (!v8)
  {
    v10 = (v18[0] & 1) == 0;
    if (v7 << 16 <= 0x10000)
    {
      v9 = 0;
    }
    else
    {
      v11 = 1;
      while (1)
      {
        v12 = malloc_type_malloc(0x200uLL, 0x1F5F1FA8uLL);
        if (!v12)
          break;
        v13 = v12;
        v14 = a4(a3, 2, 512, v11, 1, (unsigned __int16 *)v12);
        if (v14)
          goto LABEL_23;
        if (PMRecord_BtoN((uint64_t)v20, (unsigned __int16 *)v13))
        {
          apmxrec2irec((uint64_t)v20, (char *)v22);
          v15 = PMLookupDESC(v23, 0, (unsigned __int16 *)&APMDescriptors);
          if (v15)
          {
            v16 = *v15;
            switch(v16)
            {
              case 24320:
                if (!v22[3])
                  v10 = 2;
                LOWORD(v16) = 24320;
                break;
              case 20482:
                v10 = 3;
                LOWORD(v16) = 20482;
                break;
              case 12544:
                WORD6(v28) = 1;
                LOWORD(v16) = 12544;
                break;
            }
          }
          else
          {
            LOWORD(v16) = 0;
          }
          v29 = v16;
          WORD5(v28) = v11 - 1;
          WORD4(v28) = -1;
          *((_QWORD *)&v24 + 1) = v13;
          LOWORD(v14) = addentry(a1, v22, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
          if ((_WORD)v14)
          {
LABEL_23:
            v9 = v14;
LABEL_24:
            free(v13);
            goto LABEL_26;
          }
          v13 = 0;
        }
        v11 = (v11 + 1);
        if ((__int16)v7 <= (int)(unsigned __int16)v11)
        {
          v9 = 0;
          if (!v13)
            goto LABEL_26;
          goto LABEL_24;
        }
      }
      v9 = -1;
    }
LABEL_26:
    *((_WORD *)*a1 + 257) = v10;
  }
  return v9;
}

uint64_t PMSetDriver(uint64_t *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;

  if (a1)
  {
    v6 = *a1;
    if (*(unsigned __int16 *)(*a1 + 522) <= a2)
    {
      LOWORD(v16) = -5343;
    }
    else
    {
      v10 = *(unsigned __int16 *)(v6 + 2);
      v11 = v6 + 1072 * a2;
      if (*(_BYTE *)(v11 + 576) && !strstr((char *)(v11 + 576), "Driver"))
      {
        LOWORD(v16) = -5342;
      }
      else
      {
        v12 = (unsigned int *)(v11 + 528);
        v13 = *(_QWORD *)(a3 + 96);
        if ((*(_WORD *)a3 & 0x200) != 0 && *(_WORD *)(v13 + 12) == 9251 && !*(_DWORD *)(v13 + 22))
          *(_DWORD *)(v13 + 22) = bswap32(*(_DWORD *)(a3 + 8));
        v14 = DrvrChecksum((unsigned __int8 *)v13, *(unsigned __int16 *)(a3 + 8));
        v15 = *(_DWORD *)(a3 + 8);
        if (v12[29] == v14 && v15 == v12[24])
        {
          LOWORD(v16) = -1306;
        }
        else if (v15 <= v12[3] * v10)
        {
          v17 = v12[2];
          v16 = a5(a4, 4, v10, v17);
          if (!v16)
          {
            v18 = *(_DWORD *)(a3 + 8);
            v19 = v18 / v10;
            if (v18 % v10)
              v20 = v19 + 1;
            else
              v20 = v19;
            v16 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a5)(a4, 3, v10, v17, v20, *(_QWORD *)(a3 + 96));
            if (!v16)
            {
              v12[24] = *(_DWORD *)(a3 + 8);
              v12[29] = v14;
              v12[22] = *(_WORD *)a3 & 0x700 | 3;
              __strlcpy_chk();
              LOWORD(v16) = 0;
              *(_DWORD *)(v6 + 1072 * a2 + 664) = *(_DWORD *)(a3 + 4);
            }
          }
        }
        else
        {
          LOWORD(v16) = -1310;
        }
      }
    }
  }
  else
  {
    LOWORD(v16) = -109;
  }
  return (__int16)v16;
}

uint64_t PMWriteDriver(Ptr *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  char *v9;
  int v10;
  SInt8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Ptr v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned __int16 v24;

  if (!a1)
  {
    LOWORD(v19) = -109;
    return (__int16)v19;
  }
  v9 = (char *)(a2 + 12);
  v10 = *(_DWORD *)(a2 + 4);
  v24 = 0x8000;
  v11 = HGetState(a1);
  HLock(a1);
  v12 = *((unsigned __int16 *)*a1 + 261);
  if (*((_WORD *)*a1 + 261))
  {
    v13 = 0;
    v14 = (uint64_t)(*a1 + 576);
    while (!strstr((char *)v14, "Driver")
         || v10 && *(_DWORD *)(v14 + 88) != v10
         || strncasecmp((const char *)v14, v9, 0x20uLL))
    {
      ++v13;
      v14 += 1072;
      if (v12 == v13)
        goto LABEL_9;
    }
    v24 = v13;
    HSetState(a1, v11);
    LOWORD(v19) = -1306;
    goto LABEL_18;
  }
LABEL_9:
  HSetState(a1, v11);
  v15 = *a1;
  v16 = *(_DWORD *)(a2 + 8);
  if (v16 <= a3)
    v16 = a3;
  v17 = *((unsigned __int16 *)v15 + 259);
  if (v16 % v17)
    v18 = v16 / v17 + 1;
  else
    v18 = v16 / v17;
  v19 = PMNewPartitionExtended((const void **)a1, 0, v9, 0, v18 * v17 / *((unsigned __int16 *)v15 + 1), (_BYTE *)(a2 + 44), a4, &v24, 0);
  if (!v19)
  {
LABEL_18:
    if (*(_QWORD *)(a2 + 96))
      LOWORD(v19) = PMSetDriver((uint64_t *)a1, v24, a2, a5, a6);
  }
  return (__int16)v19;
}

uint64_t PMAddpatch(uint64_t a1, int a2, _DWORD *a3, unsigned __int8 *a4, unsigned int a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  __int16 v7;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  Ptr v16;
  OSErr v17;
  unsigned int v18;
  uint64_t v19;
  int v20;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned int v29;
  char *v30;
  unsigned int v31;
  int v32;
  size_t v33;
  char *v34;
  unsigned int v35;
  unsigned int v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  Ptr v40;
  OSErr v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  int v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr);
  unsigned __int16 v56;

  v7 = -50;
  if (a1 && a3 && a2 >= 1 && a3[4])
  {
    v12 = *(_QWORD *)a1 + 1072 * (unsigned __int16)a2;
    if (*(unsigned __int16 *)(v12 + 1036) <= 1u)
      v13 = 1;
    else
      v13 = *(unsigned __int16 *)(v12 + 1036);
    v14 = *(unsigned __int16 *)(*(_QWORD *)a1 + 2);
    v15 = *(_DWORD *)(v12 + 536);
    v16 = NewPtrClear((unint64_t)(v13 & 0x7F) << 9);
    v17 = MemError();
    if (v16)
    {
      v18 = v14 >> 9;
      v19 = v15 * v18;
      v20 = a7(a6, 2, 512, v19, v13, v16);
      v7 = v20;
      if (!v20)
      {
        v22 = bswap32(*(unsigned __int16 *)v16);
        *(_WORD *)v16 = HIWORD(v22);
        v23 = *((unsigned __int16 *)v16 + 1);
        v24 = __rev16(v23);
        *((_WORD *)v16 + 1) = v24;
        v25 = *(_DWORD *)(v12 + 540);
        v7 = -5325;
        if (v25 >= HIWORD(v22) && v24 <= 0x20)
        {
          v53 = v19;
          v54 = a6;
          v55 = a7;
          v56 = (_WORD)v13 << 9;
          v52 = v13;
          v26 = v25 * v18 / v13;
          if (v23)
          {
            v27 = 0;
            v28 = 0;
            v29 = 0;
            do
            {
              v30 = &v16[v28 + 4];
              PMPtchDescriptor_BtoN((uint64_t)v30, (uint64_t)v30);
              v31 = *((_DWORD *)v30 + 3);
              if (v31)
              {
                if (v26 >= v31)
                  v26 = *((_DWORD *)v30 + 3);
                v27 += *((_DWORD *)v30 + 4);
                if (*(_DWORD *)v30 == *a3)
                  break;
              }
              v28 += *((_DWORD *)v30 + 6);
              ++v29;
            }
            while (v29 < *((unsigned __int16 *)v16 + 1));
          }
          else
          {
            v28 = 0;
            v27 = 0;
          }
          v32 = DrvrChecksum(a4, *((unsigned __int16 *)a3 + 8));
          v33 = ((2 * (*((_BYTE *)a3 + 61) & 1) + *((unsigned __int8 *)a3 + 61)) & 0x1FEu) + 62;
          a3[5] = v32;
          a3[6] = v33;
          v34 = &v16[v28 + 4];
          memcpy(v34, a3, v33);
          v35 = *((_DWORD *)v34 + 4);
          if (v35 % v56)
            v36 = v35 / v56 + 1;
          else
            v36 = v35 / v56;
          if (a5 <= 1)
            v37 = 1;
          else
            v37 = a5;
          v38 = v36 / v37;
          if (v36 % v37)
            ++v38;
          v39 = v26 - v38 * v37;
          *((_DWORD *)v34 + 3) = v39;
          v51 = v36;
          v40 = NewPtrClear(v36 * v56);
          v41 = MemError();
          if (v40)
          {
            if (v26 >= v39)
              v26 = v39;
            memcpy(v40, a4, *((unsigned int *)v34 + 4));
            v42 = a3[6] + v28;
            if (v42 % v56)
              v43 = v42 / v56 + 1;
            else
              v43 = v42 / v56;
            v7 = -5344;
            if (v43 <= 1 && v26 > v43)
            {
              v55(v54, 3, v56, *((_DWORD *)v34 + 3) + v53 / v52, v51, v40);
              v44 = (unsigned __int16)(*((_WORD *)v16 + 1))++ + 1;
              v45 = *((_DWORD *)v34 + 4) + v27;
              if (v45 % v56)
                v46 = v45 / v56 + 1;
              else
                v46 = v45 / v56;
              *(_WORD *)v16 = v46;
              if ((v44 & 0x10000) != 0)
              {
                v47 = 0;
              }
              else
              {
                v48 = 0;
                v49 = 0;
                do
                {
                  v50 = (uint64_t)&v16[v48 + 4];
                  v48 += *(_DWORD *)(v50 + 24);
                  PMPtchDescriptor_NtoB(v50, v50);
                  ++v49;
                  v47 = *((unsigned __int16 *)v16 + 1);
                }
                while (v47 > (unsigned __int16)v49);
                v46 = *(unsigned __int16 *)v16;
              }
              *(_WORD *)v16 = bswap32(v46) >> 16;
              *((_WORD *)v16 + 1) = __rev16(v47);
              v7 = v55(v54, 3, 512, v53, v52, v16);
            }
            DisposePtr(v40);
          }
          else
          {
            v7 = v41;
          }
        }
      }
      DisposePtr(v16);
    }
    else
    {
      return v17;
    }
  }
  return v7;
}

CFArrayRef APMCFCreateMapRuns(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const __CFAllocator *v4;
  CFArrayRef v5;
  int valuePtr;
  CFTypeRef v8;
  void *values;
  CFTypeRef cf;
  void *keys[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24CEC1AC8;
  valuePtr = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  valuePtr = 1;
  cf = CFNumberCreate(v4, kCFNumberIntType, &valuePtr);
  v8 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(values);
  CFRelease(cf);
  v5 = CFArrayCreate(v4, &v8, 1, MEMORY[0x24BDBD690]);
  CFRelease(v8);
  *a3 = 0;
  return v5;
}

uint64_t ApplyToHFSPlusCatalogRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  return ApplyToHFSPlusBTreeRecords(a1, a2, a3, 0);
}

uint64_t ApplyToHFSPlusBTreeRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3, int a4)
{
  uint64_t v8;
  const void *v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int8x8_t *v15;
  int8x8_t *v16;
  char v17;
  unint64_t v18;
  unsigned __int16 *v19;
  unsigned int v20;
  unsigned __int16 *v21;
  uint64_t v22;
  __n128 v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  unsigned __int16 *v27;
  unsigned int v28;
  unsigned __int16 *v29;
  __n128 v30;
  unsigned __int16 *v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  unsigned int v36;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  unsigned int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int Sectors;
  char v50;
  int8x8_t v51;
  unsigned __int16 v52[5];
  int v53;
  size_t size;
  _BYTE v55[40];
  unsigned int v56;
  uint64_t v57;
  _QWORD v58[32];

  v58[30] = *MEMORY[0x24BDAC8D0];
  v48 = 0;
  Sectors = MKReadHFSMDBVHB((uint64_t)a1, (int *)&v48, v55, 0, 0);
  if (Sectors)
    return Sectors;
  if (v48 < 2)
    return -123;
  if ((_DWORD)v48 == 3)
    v8 = MKMediaCreateWithEmbeddedHFSPlus((uint64_t)a1, (int *)&Sectors);
  else
    v8 = (uint64_t)CFRetain(a1);
  v9 = (const void *)v8;
  if (!Sectors)
  {
    v10 = v56;
    v11 = a4 == 1 ? &v57 : v58;
    v12 = a4 == 1 ? 3 : 4;
    Sectors = MKHFSPlusMapFileBlock(v11, 0, 0, 0, (char *)&v48 + 4, 0);
    if (!Sectors)
    {
      v13 = v10 >> 9;
      Sectors = MKMediaReadSectors((uint64_t)v9, HIDWORD(v48) * (unint64_t)(v10 >> 9), 1uLL, (char *)&v51, 0);
      if (!Sectors)
      {
        TAO_BTNodeDescriptor_BigToHost(&v51);
        TAO_BTHeaderRec_BigToHost(v52);
        v14 = (unsigned __int16)size;
        if ((_WORD)size)
        {
          v15 = (int8x8_t *)malloc_type_calloc(1uLL, (unsigned __int16)size, 0x70EE92C1uLL);
          if (v15)
          {
            v16 = v15;
            v47 = a3;
            v46 = v53;
            v44 = v14;
            v38 = (uint64_t)v15 + v14 - 2;
            v39 = v13;
            v43 = a4;
            v41 = (uint64_t)v11;
            v42 = (uint64_t)v9;
            v40 = v12;
            do
            {
              if (!v46)
                break;
              Sectors = ReadWriteBTreeNode((uint64_t)v11, v44, v13, 0, v46, v16, (uint64_t)v9, v12);
              if (Sectors)
                break;
              v45 = v16->i32[0];
              v17 = 0;
              if (a4)
              {
                v18 = 0;
                v50 = 0;
                v19 = (unsigned __int16 *)v38;
                while (v18 < v16[1].u16[1])
                {
                  v20 = bswap32(*v19);
                  v21 = (unsigned __int16 *)((char *)v16 + HIWORD(v20));
                  TAO_HFSPlusExtentKey_BigToHost(v21);
                  v22 = (uint64_t)v16 + (unsigned __int16)(*v21 + HIWORD(v20) + 2);
                  v23 = TAO_HFSPlusExtentRecord_BigToHost(v22);
                  v24 = a2(v21, v22, v47, &v50, v23);
                  v25 = v24;
                  if (!v24 || v24 == -128)
                  {
                    ++v18;
                    if (v50)
                      v17 = 1;
                    TAO_HFSPlusExtentRecord_BigToHost(v22);
                    TAO_HFSPlusExtentKey_BigToHost(v21);
                    --v19;
                    if (!v25)
                      continue;
                  }
                  goto LABEL_51;
                }
              }
              else
              {
                v26 = 0;
                v50 = 0;
                v27 = (unsigned __int16 *)v38;
                while (v26 < v16[1].u16[1])
                {
                  v28 = bswap32(*v27);
                  v29 = (unsigned __int16 *)((char *)v16 + HIWORD(v28));
                  TAO_HFSPlusCatalogKey_BigToHost(v29);
                  v31 = (unsigned __int16 *)((char *)v16 + (unsigned __int16)(*v29 + HIWORD(v28) + 2));
                  v32 = (int)bswap32(*v31) >> 16;
                  if ((v32 - 3) < 2)
                  {
                    TAO_HFSPlusCatalogThread_BigToHost(v31);
                    v33 = v47;
                  }
                  else
                  {
                    v33 = v47;
                    if (v32 == 2)
                    {
                      v30.n128_f64[0] = TAO_HFSPlusCatalogFile_BigToHost(v31);
                    }
                    else if (v32 == 1)
                    {
                      v30.n128_u64[0] = (unint64_t)TAO_HFSPlusCatalogFolder_BigToHost(v31);
                    }
                  }
                  v34 = a2(v29, (uint64_t)v31, v33, &v50, v30);
                  v25 = v34;
                  if (!v34 || v34 == -128)
                  {
                    if (v50)
                      v17 = 1;
                    if ((v32 - 3) < 2)
                    {
                      TAO_HFSPlusCatalogThread_HostToBig(v31);
                    }
                    else if (v32 == 2)
                    {
                      TAO_HFSPlusCatalogFile_BigToHost(v31);
                    }
                    else if (v32 == 1)
                    {
                      TAO_HFSPlusCatalogFolder_BigToHost(v31);
                    }
                    TAO_HFSPlusCatalogKey_HostToBig(v29);
                    --v27;
                    ++v26;
                    if (!v25)
                      continue;
                  }
                  goto LABEL_51;
                }
              }
              v25 = 0;
LABEL_51:
              v11 = (uint64_t *)v41;
              v9 = (const void *)v42;
              v12 = v40;
              LODWORD(v13) = v39;
              Sectors = v25;
              a4 = v43;
              if (v25)
              {
                if (v25 != -128)
                  break;
              }
              if (v17)
              {
                v35 = ReadWriteBTreeNode(v41, v44, v39, 1, v46, v16, v42, v40);
                if (v35)
                {
                  Sectors = v35;
                  break;
                }
                v25 = Sectors;
              }
              v46 = v45;
            }
            while (!v25);
            free(v16);
            goto LABEL_63;
          }
          v36 = 12;
        }
        else
        {
          v36 = 22;
        }
        Sectors = v36;
      }
    }
  }
LABEL_63:
  if (v9)
    CFRelease(v9);
  return Sectors;
}

uint64_t ApplyToHFSPlusExtentRecords(const void *a1, uint64_t (*a2)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128), uint64_t a3)
{
  return ApplyToHFSPlusBTreeRecords(a1, a2, a3, 1);
}

uint64_t ReadWriteBTreeNode(uint64_t a1, unsigned int a2, unsigned int a3, int a4, int a5, int8x8_t *a6, uint64_t a7, uint64_t a8)
{
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t result;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  int8x8_t *v28;
  unsigned int v30;

  if (a4)
    TAO_BTNodeDescriptor_BigToHost(a6);
  v30 = 0;
  v15 = a2 >> 9;
  if ((_DWORD)a8 == 3)
    v16 = 0;
  else
    v16 = a7;
  v28 = a6;
  if (v15 <= a3)
  {
    result = MKHFSPlusMapFileBlock(a1, a8, 0, (int)v15 * a5 / a3, &v30, v16);
    if (!(_DWORD)result)
    {
      v27 = (int)v15 * a5 % a3 + v30 * (unint64_t)a3;
      if (a4)
      {
        return MKMediaWriteSectors(a7, v27, v15, (char *)a6, 0);
      }
      else
      {
        result = MKMediaReadSectors(a7, v27, v15, (char *)a6, 0);
        if (!(_DWORD)result)
        {
LABEL_22:
          TAO_BTNodeDescriptor_BigToHost(v28);
          return 0;
        }
      }
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v19 = v15 / a3;
    v20 = v15 / a3 * a5;
    v21 = a3;
    v22 = a3 << 9;
    if (v19 <= 1)
      v23 = 1;
    else
      v23 = v19;
    while (1)
    {
      result = MKHFSPlusMapFileBlock(a1, a8, 0, v20 + v18, &v30, v16);
      if ((_DWORD)result)
        break;
      v25 = v30 * (unint64_t)v21;
      v26 = (char *)v28 + v17;
      result = a4 ? MKMediaWriteSectors(a7, v25, v21, v26, 0) : MKMediaReadSectors(a7, v25, v21, v26, 0);
      if ((_DWORD)result)
        break;
      ++v18;
      v17 += v22;
      if (!--v23)
      {
        if (a4)
          return 0;
        goto LABEL_22;
      }
    }
  }
  return result;
}

uint64_t MKRecordEFATFSRuns(uint64_t a1, int a2, void (*a3)(uint64_t, uint64_t, _QWORD), uint64_t a4)
{
  unsigned __int16 v7;
  int v8;
  char *v9;
  unsigned int v10;
  char *v11;
  uint64_t Blocks;
  unsigned int v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  char *v30;
  char *v31;
  uint64_t v32;
  float v33;
  char *v34;
  unsigned int v35;
  uint64_t v36;
  char *v37;
  int v38;
  unint64_t v39;
  int v40;
  int v41;
  void (*v42)(uint64_t, uint64_t, _QWORD);
  unsigned int v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  size_t size[2];
  __int128 v51;
  _OWORD v52[2];
  _OWORD v53[2];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _OWORD v58[17];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  memset(v53, 0, sizeof(v53));
  v57 = 0u;
  memset(v58, 0, sizeof(v58));
  v55 = 0u;
  v56 = 0u;
  v54 = 0u;
  MKMediaGetGeometry(a1, (uint64_t)v53);
  LOWORD(v54) = 5;
  v7 = v53[0];
  LODWORD(v55) = LODWORD(v53[0]) >> 9;
  *((_QWORD *)&v55 + 1) = *((_QWORD *)&v53[0] + 1);
  *(_OWORD *)size = 0u;
  v51 = 0u;
  memset(v52, 0, sizeof(v52));
  v8 = 12 * LODWORD(v53[0]);
  LOWORD(size[0]) = v53[0];
  v9 = (char *)malloc_type_malloc((12 * LODWORD(v53[0])), 0x331B4A4CuLL);
  if (v9)
  {
    v10 = v7;
    while (1)
    {
      v11 = v9;
      if (v10 - 4097 < 0xFFFFF1FF)
      {
        v15 = 4294967173;
        goto LABEL_31;
      }
      Blocks = MKMediaReadBlocks(a1, 0, 12, v10, v9, 0);
      if ((_DWORD)Blocks)
        break;
      v13 = v11[108];
      v10 = (unsigned __int16)(1 << v13);
      LOWORD(size[0]) = 1 << v13;
      if (v8 == 12 * v10)
      {
        v14 = v11;
LABEL_14:
        if (v13 <= 0xF)
        {
          v17 = 0;
          v18 = 0;
          v16 = 11 * (unsigned __int16)(1 << v13);
          do
          {
            if (v18 != 112 && (v18 & 0x7FFFFFFFFFFFFFFELL) != 0x6A)
            {
              HIDWORD(v19) = v17;
              LODWORD(v19) = v17;
              v17 = (v19 >> 1) + v14[v18];
            }
            ++v18;
          }
          while (v16 != v18);
        }
        else
        {
          v16 = 0;
          v17 = 0;
        }
        v20 = &v14[v16];
        while (v20 < &v14[12 * (unsigned __int16)(1 << v13)])
        {
          v21 = *(_DWORD *)v20;
          v20 += 4;
          if (v21 != v17)
            goto LABEL_27;
        }
        v22 = v11[109];
        if (v22 + v11[108] > 0x19)
          goto LABEL_27;
        WORD1(size[0]) = (unsigned __int16)(1 << v13) >> 9;
        v23 = v10 << v22;
        WORD2(size[0]) = (v10 << v22) / v10;
        v24 = v11[110];
        HIWORD(size[0]) = v11[110];
        WORD4(v52[1]) = *((_WORD *)v11 + 53);
        v25 = BYTE8(v52[1]) & 1;
        WORD1(size[1]) = v25 + 1;
        *(_OWORD *)((char *)v52 + 8) = *((_OWORD *)v11 + 4);
        v26 = *((_DWORD *)v11 + 21);
        DWORD1(v52[0]) = *((_DWORD *)v11 + 20);
        LOWORD(size[1]) = v26;
        v28 = *((_DWORD *)v11 + 22);
        v27 = *((_DWORD *)v11 + 23);
        HIDWORD(size[1]) = v23;
        *(_QWORD *)&v51 = __PAIR64__(v28, v27);
        v29 = *((_DWORD *)v11 + 24);
        DWORD2(v51) = v29;
        if (v24 - 3 < 0xFFFFFFFE)
        {
LABEL_27:
          v15 = 22;
          goto LABEL_30;
        }
        v15 = 22;
        if (v25 < v24 && v29 >= 2)
        {
          if (v29 >= v27)
            v15 = 22;
          else
            v15 = 0;
        }
        goto LABEL_30;
      }
      if (!malloc_type_realloc(v11, 12 * (unsigned __int16)(1 << v13), 0x4352D10FuLL))
      {
        v11 = 0;
        goto LABEL_29;
      }
      v9 = (char *)malloc_type_malloc(12 * (unsigned __int16)(1 << v13), 0x331B4A4CuLL);
      v8 = 12 * (unsigned __int16)(1 << v13);
      if (!v9)
      {
        v14 = 0;
        goto LABEL_14;
      }
    }
    v15 = Blocks;
    if ((_DWORD)Blocks == -1)
      goto LABEL_29;
    goto LABEL_31;
  }
  v11 = 0;
LABEL_29:
  v15 = *__error();
  v14 = v11;
LABEL_30:
  v11 = v14;
  if (v14)
LABEL_31:
    free(v11);
  if ((_DWORD)v15)
  {
    v30 = 0;
    v31 = 0;
  }
  else
  {
    HIDWORD(v54) = LOWORD(size[0]) >> 9;
    v32 = v51 * WORD2(size[0]);
    *(_QWORD *)&v56 = *(_QWORD *)&v52[1] * WORD1(size[0]);
    *((_QWORD *)&v56 + 1) = ((_DWORD)v32 + DWORD1(v51)) * WORD1(size[0]);
    *((_QWORD *)&v57 + 1) = (v32 + DWORD1(v51)) * WORD1(size[0]);
    if ((BYTE8(v52[1]) & 2) != 0)
      *(_QWORD *)&v58[0] |= 2uLL;
    if ((BYTE8(v52[1]) & 4) != 0)
      *(_QWORD *)&v58[0] |= 0x10uLL;
    v33 = (float)*((unint64_t *)&v55 + 1) / (float)((v32 + DWORD1(v51)) * WORD1(size[0]));
    if (v33 > 10000.0 || v33 < 0.0001)
    {
      a3(a4, 4, 0);
      return 22;
    }
    v30 = (char *)malloc_type_malloc(HIDWORD(size[1]), 0x80F14BBEuLL);
    if (!v30 || (v34 = (char *)malloc_type_malloc(HIDWORD(size[1]), 0xC6969CDuLL)) == 0)
    {
      a3(a4, 4, 0);
      v31 = 0;
      goto LABEL_71;
    }
    v31 = v34;
    v49 = 0;
    v47 = a4;
    v35 = DWORD2(v51);
    while (v35 < (int)v51 + 2)
    {
      v36 = MKMediaReadBlocks(a1, ((v35 - 2) * WORD2(size[0]) + (unint64_t)DWORD1(v51)) * WORD1(size[0]), WORD2(size[0]) * (unint64_t)WORD1(size[0]), 0x200u, v30, 0);
      if ((_DWORD)v36)
      {
        v15 = v36;
        goto LABEL_80;
      }
      if (HIDWORD(size[1]))
      {
        v37 = v30;
        do
        {
          v38 = *v37;
          if (v38 == 129)
          {
            if (WORD1(size[1]) == (v37[1] & 1) + 1)
            {
              HIDWORD(v51) = *((_DWORD *)v37 + 5);
              v39 = *((_QWORD *)v37 + 3);
              if (v39 % HIDWORD(size[1]))
                v40 = v39 / HIDWORD(size[1]) + 1;
              else
                v40 = v39 / HIDWORD(size[1]);
              LODWORD(v52[0]) = v40;
            }
          }
          else if (v38 == 131)
          {
            v41 = v37[1];
            if ((v41 - 13) >= 0xFFFFFFF4)
              uniconvert((char *)v58 + 12, 256, 0x8000100u, 0, (const UInt8 *)v37 + 2, 2 * v41, 0x14000100u, 1u);
          }
          else if (!*v37)
          {
            goto LABEL_81;
          }
          v37 += 32;
        }
        while (v37 < &v30[HIDWORD(size[1])]);
      }
      v42 = a3;
      v43 = 4 * v35 / HIDWORD(size[1]);
      if (v49 != v43 + DWORD1(v52[0]) * WORD1(size[1]))
      {
        v44 = MKMediaReadBlocks(a1, v43 + DWORD1(v52[0]) * WORD1(size[1]), (unsigned __int16)(HIDWORD(size[1]) / LOWORD(size[0])), LOWORD(size[0]), v31, 0);
        v49 = v43 + DWORD1(v52[0]) * WORD1(size[1]);
        if ((_DWORD)v44)
        {
          v15 = v44;
          a3 = v42;
LABEL_80:
          if ((v15 & 0x80000000) != 0)
          {
            a4 = v47;
            goto LABEL_34;
          }
          break;
        }
      }
      v35 = *(_DWORD *)&v31[4 * v35 % HIDWORD(size[1])];
      a3 = v42;
      if (v35 + 1 < 2)
        break;
    }
LABEL_81:
    a4 = v47;
    v46 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD))a3)(v47, 0, 0);
    if ((_DWORD)v46)
    {
      v15 = v46;
    }
    else
    {
      v15 = exFATTidemark((uint64_t)&v54, (uint64_t)size, a2, a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))a3, v47);
      a3(v47, 3, &v54);
    }
  }
LABEL_34:
  a3(a4, 4, 0);
  if ((_DWORD)v15 != -1)
  {
    if (!v30)
      goto LABEL_37;
    goto LABEL_36;
  }
LABEL_71:
  v15 = *__error();
  if (v30)
LABEL_36:
    free(v30);
LABEL_37:
  if (v31)
    free(v31);
  return v15;
}

uint64_t exFATTidemark(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  int v6;
  size_t v12;
  char *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  unint64_t v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  BOOL v46;
  uint64_t v48;
  int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  uint64_t v59;
  int v60;
  unint64_t v61;

  v54 = 0;
  v60 = 0;
  v59 = 0;
  v55 = 0;
  v56 = 0;
  LOWORD(v6) = 22;
  if (!a1 || !a2)
    return (__int16)v6;
  v61 = 0;
  v12 = *(unsigned int *)(a2 + 12);
  v13 = (char *)malloc_type_malloc(v12, 0xA249D01FuLL);
  if (v13)
  {
    LODWORD(v59) = 8 * v12;
    HIDWORD(v59) = v12 >> 3;
    v60 = 64;
    v55 = 0;
    LOWORD(v54) = 1;
    v14 = *(_DWORD *)(a2 + 16);
    v15 = v14 + 1;
    if ((a3 & 3) != 0)
    {
      v52 = a6;
      v16 = *(unsigned __int16 *)(a2 + 2);
      v17 = *(unsigned __int16 *)(a2 + 4);
      v18 = bmaddr(v15, &v59);
      v19 = *(unsigned int *)(a2 + 20);
      v20 = *(unsigned __int16 *)(a2 + 4);
      v21 = *(unsigned __int16 *)(a2 + 2);
      v22 = v21 * v19;
      v56 = v22;
      v50 = v18;
      if (v18 < 0)
      {
LABEL_27:
        if (v22)
        {
          v34 = v55;
          v35 = (unsigned __int16)v54;
          if (!(_WORD)v54 && (uint64_t)(*(_QWORD *)(a1 + 32) - (v22 + v55)) >= 1)
          {
            v22 = *(_QWORD *)(a1 + 32) - v55;
            v56 = v22;
          }
          if ((((unsigned __int16)v54 + 1) & a3) != 0)
          {
            v6 = a5(v52, 1, &v54);
            if (v6)
              goto LABEL_63;
            v34 = v55;
            v22 = v56;
            v35 = (unsigned __int16)v54;
          }
          v36 = v34 + v22;
          v55 = v36;
          if (v35 == 1 && v36 > *(_QWORD *)(a1 + 56))
            *(_QWORD *)(a1 + 56) = v36 - 1;
        }
        if ((a3 & 1) == 0
          || (v37 = *(_QWORD *)(a1 + 32), v37 <= v55)
          || (LOWORD(v54) = 0, v56 = v37 - v55, (v6 = a5(v52, 1, &v54)) == 0))
        {
          LOWORD(v6) = 0;
          *(_DWORD *)(a1 + 72) = *(_QWORD *)(a1 + 56) / (*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 48)) - 1;
          goto LABEL_65;
        }
LABEL_63:
        if (v6 != -1)
          goto LABEL_65;
        goto LABEL_64;
      }
      v51 = a4;
      v23 = v17 * (unint64_t)v16;
      v24 = (((v14 - 1) * v20) + v19) * v21;
      v25 = (unsigned __int16)(v12 >> 9);
      v26 = 0;
      v48 = v25;
      while (1)
      {
        v27 = MKMediaReadBlocks(v51, ((v26 + *(_DWORD *)(a2 + 28) - 2) * *(unsigned __int16 *)(a2 + 4)+ (unint64_t)*(unsigned int *)(a2 + 20))* *(unsigned __int16 *)(a2 + 2), v25, 0x200u, v13, &v61);
        if (v27)
          break;
        v49 = v26;
        v28 = HIDWORD(v59);
        if (SHIDWORD(v59) >= 1)
        {
          v29 = 0;
          v30 = v60;
          while (v30 < 1)
          {
LABEL_24:
            if ((int)++v29 >= v28)
              goto LABEL_25;
          }
          v31 = 0;
          v32 = (unsigned __int16)v54;
          v22 = v56;
          while (1)
          {
            v33 = (*(_QWORD *)&v13[8 * v29] >> v31) & 1;
            if ((_DWORD)v33 != v32)
            {
              if (v22)
              {
                if (((v32 + 1) & a3) != 0)
                {
                  v27 = a5(v52, 1, &v54);
                  if (v27)
                    goto LABEL_62;
                  v22 = v56;
                  v32 = (unsigned __int16)v54;
                }
                v55 += v22;
                v56 = 0;
              }
              if (v32 == 1)
                *(_QWORD *)(a1 + 56) = v55 - 1;
              v22 = 0;
              LOWORD(v54) = v33;
              v32 = v33;
            }
            if (v22 + v55 > v24)
              goto LABEL_27;
            v22 += v23;
            v56 = v22;
            v30 = v60;
            if (++v31 >= v60)
            {
              v28 = HIDWORD(v59);
              goto LABEL_24;
            }
          }
        }
LABEL_25:
        v26 = v49 + 1;
        v25 = v48;
        if (v49 >= v50)
        {
          v22 = v56;
          goto LABEL_27;
        }
      }
    }
    else
    {
      if ((a3 & 0x40000) == 0)
      {
        LOWORD(v6) = 0;
LABEL_66:
        free(v13);
        return (__int16)v6;
      }
      v38 = bmaddr(v15, &v59);
      v40 = v38;
      v57 = v38;
      v58 = v39;
      if ((v38 & 0x80000000) != 0)
      {
LABEL_61:
        LOWORD(v6) = 0;
        *(_QWORD *)(a1 + 56) = (*(unsigned __int16 *)(a2 + 4)
                              + *(unsigned __int16 *)(a2 + 4) * alblock(&v57, &v59)
                              + (unint64_t)*(unsigned int *)(a2 + 20))
                             * *(unsigned __int16 *)(a2 + 2)
                             - 1;
        goto LABEL_65;
      }
      v41 = v39;
      v42 = HIDWORD(v38);
      while (1)
      {
        v27 = MKMediaReadBlocks(a4, ((v40 + *(_DWORD *)(a2 + 28) - 2) * *(unsigned __int16 *)(a2 + 4)+ (unint64_t)*(unsigned int *)(a2 + 20))* *(unsigned __int16 *)(a2 + 2), (unsigned __int16)(v12 >> 9), 0x200u, v13, &v61);
        if (v27)
          break;
        if ((v42 & 0x80000000) == 0)
        {
          v43 = (v60 - 1);
          v44 = v42;
          while (1)
          {
            v45 = *(_QWORD *)&v13[8 * v44];
            if (v45)
            {
              if ((v41 & 0x80000000) == 0)
                break;
            }
LABEL_53:
            LODWORD(v41) = v60 - 1;
            v46 = v44-- <= 0;
            if (v46)
            {
              v58 = v60 - 1;
              goto LABEL_57;
            }
          }
          while (((v45 >> v41) & 1) == 0)
          {
            v46 = (int)v41 <= 0;
            LODWORD(v41) = v41 - 1;
            if (v46)
              goto LABEL_53;
          }
          HIDWORD(v57) = v44;
          v58 = v41;
          goto LABEL_61;
        }
        v43 = v41;
LABEL_57:
        LODWORD(v42) = HIDWORD(v59) - 1;
        LODWORD(v57) = v40 - 1;
        HIDWORD(v57) = HIDWORD(v59) - 1;
        v41 = v43;
        v46 = v40-- <= 0;
        if (v46)
          goto LABEL_61;
      }
    }
LABEL_62:
    v6 = v27;
    goto LABEL_63;
  }
LABEL_64:
  v6 = *__error();
LABEL_65:
  if (v13)
    goto LABEL_66;
  return (__int16)v6;
}

const char *MKEFATFSIdentity()
{
  return "ExFAT";
}

uint64_t MKDetectEFATFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  *a3 = 0;
  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    *a3 = 500;
    if (*a2 == 235 && a2[1] == 118 && a2[2] == 144)
    {
      *a3 = 1000;
      if (*(_QWORD *)(a2 + 3) == 0x2020205441465845)
      {
        *a3 = 5000;
        if (a5)
          *a5 = 5;
      }
    }
  }
  return 0;
}

CFMutableDictionaryRef MKCFCreateEFATFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  int v9;
  BOOL v10;

  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    *v6 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(v7 + 8) = Mutable;
    v9 = MKRecordEFATFSRuns(a1, *(_DWORD *)v7, (void (*)(uint64_t, uint64_t, _QWORD))MKCFRecordFSInfo, v7);
    if (v9)
      v10 = Mutable == 0;
    else
      v10 = 1;
    if (!v10)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_11;
  }
  return Mutable;
}

uint64_t MKFSDescriptorIdentity(char *a1, _WORD *a2)
{
  const char *v3;
  uint64_t v5;
  size_t v6;
  uint64_t result;

  v3 = (const char *)fsIdentifiers[0];
  if (!fsIdentifiers[0])
    goto LABEL_5;
  v5 = 1;
  while (1)
  {
    v6 = strlen(v3);
    if (!strncasecmp(a1, v3, v6))
      break;
    v3 = (const char *)fsIdentifiers[v5++];
    if (!v3)
      goto LABEL_5;
  }
  switch((_DWORD)v5)
  {
    case 3:
      result = MKFATFSDescriptorIdentity(a1);
      break;
    case 2:
      result = disposegpmr();
      break;
    case 1:
      result = MKHFSDescriptorIdentity(a1);
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  if (a2)
    *a2 = result;
  return result;
}

const char *MKFSIdentity(int a1, unsigned int a2)
{
  const char *result;

  switch(a1)
  {
    case 1:
      result = (const char *)MKHFSIdentity(a2);
      break;
    case 2:
      result = MKAPFSIdentity();
      break;
    case 3:
      result = (const char *)MKFATFSIdentity(a2);
      break;
    case 4:
      result = MKNTFSIdentity();
      break;
    case 5:
      result = MKEFATFSIdentity();
      break;
    case 7:
      result = MKISOFSIdentity();
      break;
    default:
      result = "Unknown Filesystem";
      break;
  }
  return result;
}

const __CFDictionary *FSConvertOptions(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;

  if (result)
  {
    v1 = result;
    v2 = MKCFOptionBit(result, CFSTR("Record Runs"), 3);
    v3 = MKCFOptionBit(v1, CFSTR("Record On Bits"), 2) | v2;
    v4 = MKCFOptionBit(v1, CFSTR("Record Off Bits"), 1);
    v5 = v3 | v4 | MKCFOptionBit(v1, CFSTR("Ignore Embedded"), 0x10000);
    v6 = MKCFOptionBit(v1, CFSTR("Record Container"), 0x20000);
    v7 = v6 | MKCFOptionBit(v1, CFSTR("Record Tidemark"), 0x40000);
    return (const __CFDictionary *)(v5 | v7 | MKCFOptionBit(v1, CFSTR("Record Markers"), 4));
  }
  return result;
}

unint64_t bmaddr(unsigned int a1, _DWORD *a2)
{
  return (a1 / *a2) | ((unint64_t)(a1 % *a2 / a2[2]) << 32);
}

uint64_t alblock(_DWORD *a1, _DWORD *a2)
{
  return (*a2 * *a1 + a2[2] * a1[1] + a1[2]);
}

uint64_t MKRecordFSCopyInstructions(CFArrayRef *__dst, int a2, _WORD *__src)
{
  int v5;
  CFIndex Count;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *Value;
  const __CFNumber *v9;
  uint64_t v10;
  const __CFNumber *v11;
  CFNumberRef v12;
  const __CFAllocator *v13;
  __CFDictionary *Mutable;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFArrayRef v20;
  CFArrayRef v21;
  uint64_t v23;
  __int16 valuePtr;

  switch(a2)
  {
    case 3:
      memcpy(__dst, __src, 0x150uLL);
      break;
    case 1:
      if (*__src)
      {
        if (*__src != 1)
          return 0;
        if (*((_DWORD *)__dst + 93))
          v5 = 7;
        else
          v5 = 1;
      }
      else
      {
        v5 = 2;
      }
      valuePtr = 0;
      v23 = 0;
      Count = CFArrayGetCount(__dst[42]);
      if (!Count)
        goto LABEL_17;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(__dst[42], Count - 1);
      Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Instruction Code"));
      CFNumberGetValue(Value, kCFNumberSInt16Type, &valuePtr);
      v9 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Source Offset"));
      CFNumberGetValue(v9, kCFNumberSInt64Type, &v23);
      v10 = v23;
      v11 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Block Count"));
      CFNumberGetValue(v11, kCFNumberSInt64Type, &v23);
      if (!*((_BYTE *)__dst + 368))
        goto LABEL_17;
      if (v5 == valuePtr && *((_QWORD *)__src + 1) == v23 + v10)
      {
        v23 += *((_QWORD *)__src + 2);
        v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &v23);
        CFDictionaryReplaceValue(ValueAtIndex, CFSTR("Block Count"), v12);
      }
      else
      {
LABEL_17:
        v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        valuePtr = v5;
        v15 = CFNumberCreate(v13, kCFNumberSInt16Type, &valuePtr);
        CFDictionaryAddValue(Mutable, CFSTR("Instruction Code"), v15);
        CFRelease(v15);
        if (*((_DWORD *)__dst + 93))
        {
          valuePtr = *((_DWORD *)__dst + 93);
          v16 = CFNumberCreate(v13, kCFNumberSInt16Type, &valuePtr);
          CFDictionaryAddValue(Mutable, CFSTR("Checksum Type"), v16);
          CFRelease(v16);
        }
        v23 = *((_QWORD *)__src + 2);
        v17 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, CFSTR("Block Count"), v17);
        CFRelease(v17);
        v23 = *((_QWORD *)__src + 1);
        v18 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, CFSTR("Source Offset"), v18);
        CFRelease(v18);
        v23 += (uint64_t)__dst[45];
        v19 = CFNumberCreate(v13, kCFNumberSInt64Type, &v23);
        CFDictionaryAddValue(Mutable, CFSTR("Target Offset"), v19);
        CFRelease(v19);
        v20 = __dst[43];
        if (v20)
          CFDictionaryAddValue(Mutable, CFSTR("Source Device"), v20);
        v21 = __dst[44];
        if (v21)
          CFDictionaryAddValue(Mutable, CFSTR("Target Device"), v21);
        CFArrayAppendValue(__dst[42], Mutable);
      }
      break;
    case 0:
      __dst[42] = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
      break;
  }
  return 0;
}

const __CFDictionary *MKCFDecomposeFSInfoRecord(const __CFDictionary *a1, uint64_t a2)
{
  const __CFString *Value;
  const __CFString *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFDictionary *result;
  const __CFDictionary *v16;
  unsigned int v17;
  unsigned int valuePtr;
  char buffer[32];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return (const __CFDictionary *)22;
  valuePtr = 0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 144) = 0u;
  *(_OWORD *)(a2 + 160) = 0u;
  *(_OWORD *)(a2 + 176) = 0u;
  *(_OWORD *)(a2 + 192) = 0u;
  *(_OWORD *)(a2 + 208) = 0u;
  *(_OWORD *)(a2 + 224) = 0u;
  *(_OWORD *)(a2 + 240) = 0u;
  *(_OWORD *)(a2 + 256) = 0u;
  *(_OWORD *)(a2 + 272) = 0u;
  *(_OWORD *)(a2 + 288) = 0u;
  *(_OWORD *)(a2 + 304) = 0u;
  *(_OWORD *)(a2 + 320) = 0u;
  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Filesystem"));
  CFStringGetCString(Value, buffer, 32, 0);
  *(_WORD *)a2 = MKFSDescriptorIdentity(buffer, (_WORD *)(a2 + 2));
  v5 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Volume name"));
  if (v5)
    CFStringGetCString(v5, (char *)(a2 + 76), 256, 0x8000100u);
  v6 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Volume offset"));
  if (v6)
    CFNumberGetValue(v6, kCFNumberSInt32Type, (void *)(a2 + 4));
  v7 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("phi"));
  if (v7)
    CFNumberGetValue(v7, kCFNumberSInt32Type, (void *)(a2 + 8));
  v8 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Physical block size"));
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
    *(_DWORD *)(a2 + 16) = valuePtr >> 9;
  }
  v9 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Physical size"));
  if (v9)
    CFNumberGetValue(v9, kCFNumberSInt64Type, (void *)(a2 + 24));
  v10 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Media size"));
  if (v10)
    CFNumberGetValue(v10, kCFNumberSInt64Type, (void *)(a2 + 32));
  v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Volume size"));
  if (v11)
    CFNumberGetValue(v11, kCFNumberSInt64Type, (void *)(a2 + 40));
  v12 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Volume block size"));
  if (v12)
  {
    CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
    *(_DWORD *)(a2 + 12) = valuePtr >> 9;
  }
  v13 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Tidemark"));
  if (v13)
    CFNumberGetValue(v13, kCFNumberSInt64Type, (void *)(a2 + 56));
  v14 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Fragmentation Index"));
  if (v14)
    CFNumberGetValue(v14, kCFNumberSInt32Type, (void *)(a2 + 72));
  result = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("Attributes"));
  if (result)
  {
    v16 = result;
    *(_QWORD *)(a2 + 64) |= MKCFOptionBit(result, CFSTR("Read only"), 1);
    *(_QWORD *)(a2 + 64) |= MKCFOptionBit(v16, CFSTR("Dirty"), 2);
    *(_QWORD *)(a2 + 64) |= MKCFOptionBit(v16, CFSTR("Journaled"), 4);
    v17 = MKCFOptionBit(v16, CFSTR("Case sensitive"), 8);
    result = 0;
    *(_QWORD *)(a2 + 64) |= v17;
  }
  return result;
}

uint64_t MKCFRecordFSInfo(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CFMutableArrayRef Mutable;
  __CFDictionary *v10;
  CFMutableDictionaryRef v12;
  __CFDictionary *v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  unsigned int v18;
  CFNumberRef v19;
  const __CFString *v20;
  const __CFString *v21;
  __CFDictionary *v22;
  uint64_t v23;
  uint64_t valuePtr;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v25 = v4;
  v26 = v3;
  v27 = v5;
  v28 = v6;
  switch(a2)
  {
    case 0:
      Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
      *(_QWORD *)(a1 + 16) = Mutable;
      if (Mutable)
      {
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), CFSTR("Data Runs"), Mutable);
        v10 = *(__CFDictionary **)(a1 + 16);
        goto LABEL_15;
      }
      return *__error();
    case 1:
      if (((*(_DWORD *)a1 >> *(_WORD *)a3) & 1) == 0)
        return 0;
      v12 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v12)
        return 0xFFFFFFFFLL;
      v13 = v12;
      v14 = CFNumberCreate(0, kCFNumberSInt16Type, a3);
      if (!v14)
        return 0xFFFFFFFFLL;
      v15 = v14;
      CFDictionarySetValue(v13, CFSTR("Type"), v14);
      CFRelease(v15);
      valuePtr = a3[1] + *(_QWORD *)(a1 + 24);
      v16 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
      if (!v16)
        return 0xFFFFFFFFLL;
      v17 = v16;
      CFDictionarySetValue(v13, CFSTR("Origin"), v16);
      CFRelease(v17);
      v18 = *(unsigned __int16 *)a3;
      if (v18 >= 2)
      {
        if (v18 == 2)
        {
          v23 = a3[2];
          if (v23 > 1448037418)
          {
            if (v23 == 1448037419)
            {
              v20 = CFSTR("Volume Start");
            }
            else
            {
              if (v23 != 1448037421)
                goto LABEL_32;
              v20 = CFSTR("Volume End");
            }
          }
          else if (v23 == 1162691115)
          {
            v20 = CFSTR("Embedded Start");
          }
          else
          {
            if (v23 != 1162691117)
              goto LABEL_32;
            v20 = CFSTR("Embedded End");
          }
          v21 = CFSTR("Marker");
          goto LABEL_31;
        }
      }
      else
      {
        v19 = CFNumberCreate(0, kCFNumberSInt64Type, a3 + 2);
        if (v19)
        {
          v20 = (const __CFString *)v19;
          v21 = CFSTR("Length");
LABEL_31:
          CFDictionarySetValue(v13, v21, v20);
          CFRelease(v20);
        }
      }
LABEL_32:
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 16), v13);
      goto LABEL_14;
    case 2:
      v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (!v22)
        return 0xFFFFFFFFLL;
      v13 = v22;
      MKCFCreateFSInfoRecord((const char *)a3, v22);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), CFSTR("Container"), v13);
LABEL_14:
      v10 = v13;
LABEL_15:
      CFRelease(v10);
      return 0;
    case 3:
      MKCFCreateFSInfoRecord((const char *)a3, *(__CFDictionary **)(a1 + 8));
      return 0;
    default:
      return 0;
  }
}

void MKCFCreateFSInfoRecord(const char *a1, __CFDictionary *a2)
{
  const char *v4;
  CFStringRef v5;
  CFStringRef v6;
  CFStringRef v7;
  CFStringRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  CFNumberRef v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v28;
  const void *v29;
  const void *v30;
  const void *v31;
  const void *v32;
  const void *v33;
  const void *v34;
  const void *v35;
  int valuePtr;

  v4 = MKFSIdentity(*(unsigned __int16 *)a1, *((unsigned __int16 *)a1 + 1));
  if (v4)
  {
    v5 = CFStringCreateWithCString(0, v4, 0);
    if (!v5)
      return;
    v6 = v5;
    CFDictionarySetValue(a2, CFSTR("Filesystem"), v5);
    CFRelease(v6);
  }
  if (a1[76])
  {
    v7 = CFStringCreateWithCString(0, a1 + 76, 0x8000100u);
    if (!v7)
      return;
    v8 = v7;
    CFDictionarySetValue(a2, CFSTR("Volume name"), v7);
    CFRelease(v8);
  }
  valuePtr = *((_DWORD *)a1 + 4) << 9;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v9)
  {
    v10 = v9;
    CFDictionarySetValue(a2, CFSTR("Physical block size"), v9);
    CFRelease(v10);
    v11 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 24);
    if (v11)
    {
      v12 = v11;
      CFDictionarySetValue(a2, CFSTR("Physical size"), v11);
      CFRelease(v12);
      v13 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 32);
      if (v13)
      {
        v14 = v13;
        CFDictionarySetValue(a2, CFSTR("Media size"), v13);
        CFRelease(v14);
        if (*((_DWORD *)a1 + 1))
        {
          v15 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 4);
          if (!v15)
            return;
          v16 = v15;
          CFDictionarySetValue(a2, CFSTR("Volume offset"), v15);
          CFRelease(v16);
        }
        if (*((_DWORD *)a1 + 2))
        {
          v17 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 8);
          if (!v17)
            return;
          v18 = v17;
          CFDictionarySetValue(a2, CFSTR("phi"), v17);
          CFRelease(v18);
        }
        v19 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 40);
        if (v19)
        {
          v20 = v19;
          CFDictionarySetValue(a2, CFSTR("Volume size"), v19);
          CFRelease(v20);
          valuePtr = *((_DWORD *)a1 + 3) << 9;
          v21 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
          if (v21)
          {
            v22 = v21;
            CFDictionarySetValue(a2, CFSTR("Volume block size"), v21);
            CFRelease(v22);
            if (*((_QWORD *)a1 + 7))
            {
              v23 = CFNumberCreate(0, kCFNumberSInt64Type, a1 + 56);
              if (!v23)
                return;
              v24 = v23;
              CFDictionarySetValue(a2, CFSTR("Tidemark"), v23);
              CFRelease(v24);
            }
            if (*((int *)a1 + 18) >= 1)
            {
              v25 = CFNumberCreate(0, kCFNumberSInt32Type, a1 + 72);
              if (!v25)
                return;
              v26 = v25;
              CFDictionarySetValue(a2, CFSTR("Fragmentation Index"), v25);
              CFRelease(v26);
            }
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            if (Mutable)
            {
              v28 = Mutable;
              CFDictionarySetValue(a2, CFSTR("Attributes"), Mutable);
              CFRelease(v28);
              v29 = (const void *)*MEMORY[0x24BDBD270];
              v30 = (const void *)*MEMORY[0x24BDBD268];
              if ((*((_QWORD *)a1 + 8) & 1) != 0)
                v31 = (const void *)*MEMORY[0x24BDBD270];
              else
                v31 = (const void *)*MEMORY[0x24BDBD268];
              CFDictionarySetValue(v28, CFSTR("Read only"), v31);
              if ((*((_QWORD *)a1 + 8) & 2) != 0)
                v32 = v29;
              else
                v32 = v30;
              CFDictionarySetValue(v28, CFSTR("Dirty"), v32);
              if ((*((_QWORD *)a1 + 8) & 4) != 0)
                v33 = v29;
              else
                v33 = v30;
              CFDictionarySetValue(v28, CFSTR("Journaled"), v33);
              if ((*((_QWORD *)a1 + 8) & 8) != 0)
                v34 = v29;
              else
                v34 = v30;
              CFDictionarySetValue(v28, CFSTR("Case sensitive"), v34);
              if ((*((_QWORD *)a1 + 8) & 0x10) != 0)
                v35 = v29;
              else
                v35 = v30;
              CFDictionarySetValue(v28, CFSTR("Corrupted"), v35);
            }
          }
        }
      }
    }
  }
}

uint64_t MKRecordFSRuns(const void *a1, int a2, unsigned __int16 (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t result;
  int v9;
  uint64_t v10;

  v10 = 0;
  v9 = 0;
  result = MKFileSystemDetect((uint64_t)a1, (int *)&v10 + 1, (int *)&v10, &v9);
  if (!(_DWORD)result)
  {
    switch(v9)
    {
      case 1:
        result = MKRecordHFSRuns(a1, a2, a3, a4);
        break;
      case 2:
        result = MKRecordAPFSRuns((uint64_t)a1, a2, (uint64_t (*)(_QWORD, uint64_t, _QWORD *))a3, a4);
        break;
      case 3:
        result = MKRecordFATFSRuns((uint64_t)a1, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))a3, a4);
        break;
      case 4:
        result = MKRecordNTFSRuns();
        break;
      case 5:
        result = MKRecordEFATFSRuns((uint64_t)a1, a2, (void (*)(uint64_t, uint64_t, _QWORD))a3, a4);
        break;
      default:
        result = 4294967292;
        break;
    }
  }
  return result;
}

CFMutableDictionaryRef MKCFCreateFSInfo(const void *a1, const __CFDictionary *a2, _DWORD *a3)
{
  void *v6;
  uint64_t v7;
  const __CFNumber *Value;
  CFMutableDictionaryRef Mutable;
  int v10;
  BOOL v11;

  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    if (a2)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Start Offset"));
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberSInt64Type, (void *)(v7 + 24));
        if (CFDictionaryGetCount(a2) == 1)
          a2 = 0;
      }
    }
    *(_DWORD *)v7 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(v7 + 8) = Mutable;
    v10 = MKRecordFSRuns(a1, *(_DWORD *)v7, (unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v10)
      v11 = Mutable == 0;
    else
      v11 = 1;
    if (!v11)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v10 != -1)
      {
LABEL_16:
        *a3 = v10;
        return Mutable;
      }
LABEL_15:
      v10 = *__error();
      goto LABEL_16;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_15;
  }
  return Mutable;
}

uint64_t pwriteoffline(int a1, char *a2, size_t a3, uint64_t a4)
{
  int v8;
  size_t v9;
  off_t v11;
  off_t v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  _DWORD *v17;
  int v18;
  int v19;
  BOOL v20;
  _DWORD *v21;
  int v22;
  int v23;
  char *v24;
  int *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  int *v32;
  int v33;
  uint64_t v34;
  ssize_t v35;
  off_t v36;
  size_t v37;
  uint64_t v38;
  int *v39;
  uint64_t v40;
  stat v41;
  _DWORD v42[9];
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  char v46[8];
  _QWORD v47[127];
  statfs v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  memset(&v48, 0, 512);
  memset(&v41, 0, sizeof(v41));
  v40 = 0;
  v8 = fstatfs(a1, &v48);
  v9 = a3;
  if (v8)
    goto LABEL_2;
  if ((v48.f_flags & 1) == 0)
  {
    v8 = 13;
LABEL_6:
    v9 = a3;
    goto LABEL_7;
  }
  v8 = fstat(a1, &v41);
  v9 = a3;
  if (v8)
    goto LABEL_2;
  if (!v41.st_size)
  {
    v8 = -39;
    goto LABEL_6;
  }
  if (a4 + a3 > v41.st_size)
  {
    v8 = 28;
    goto LABEL_6;
  }
  memset(&v42[1], 0, 32);
  if ((v41.st_size & 0x1FF) != 0)
    v11 = v41.st_size / 512 + 1;
  else
    v11 = v41.st_size / 512;
  v43 = 0uLL;
  v44 = 0uLL;
  v45 = 0;
  v42[0] = 512;
  if (!v11)
    goto LABEL_41;
  v12 = 0;
  v38 = 0;
  v13 = 0;
  v14 = 0;
  LODWORD(v15) = 0;
  *(_QWORD *)v46 = 0;
  memset(v47, 0, 12);
  while (1)
  {
    v16 = v15;
    if (lseek(a1, v12, 0) == -1 || fcntl(a1, 49, v46))
      break;
    v15 = (*(_QWORD *)((char *)v47 + 4) + (*(_QWORD *)((char *)v47 + 4) < 0 ? 0x1FFuLL : 0)) >> 9;
    if (v16 + 1 != (*(_QWORD *)((char *)v47 + 4) / 512))
    {
      if (v14)
      {
        if (HIDWORD(v38) >= 9)
        {
          v8 = 34;
          goto LABEL_6;
        }
        v17 = &v42[2 * HIDWORD(v38)];
        v17[3] = v14;
        v17[4] = v13;
        LODWORD(v38) = v38 + v13;
        ++HIDWORD(v38);
        v14 = v15;
        v13 = 0;
      }
      else
      {
        v13 = 0;
        v14 = *(_QWORD *)((char *)v47 + 4) / 512;
      }
    }
    ++v13;
    v12 += 512;
    if (!--v11)
    {
      v18 = v38;
      v19 = HIDWORD(v38);
      *(_QWORD *)&v42[1] = v38;
      if (!v14)
        goto LABEL_41;
      goto LABEL_40;
    }
  }
  v18 = v38;
  v19 = HIDWORD(v38);
  *(_QWORD *)&v42[1] = v38;
  v8 = *__error();
  if (v8)
    v20 = 1;
  else
    v20 = v14 == 0;
  if (!v20)
  {
LABEL_40:
    v21 = &v42[2 * v19];
    v21[3] = v14;
    v21[4] = v13;
    v42[1] = v18 + v13;
    v42[2] = v19 + 1;
    goto LABEL_41;
  }
  if (v8 == -1)
    v8 = *__error();
  v9 = a3;
  if (!v8)
  {
LABEL_41:
    if ((int)MKBSDSlice(v48.f_mntfromname, (uint64_t)&v40 + 4, (uint64_t)&v40, 0) < 2)
    {
      v8 = 22;
      goto LABEL_6;
    }
    __sprintf_chk(v46, 0, 0x400uLL, "/dev/rdisk%is%i", HIDWORD(v40), v40);
    v22 = open(v46, 2, 438);
    if (v22 < 0)
      return -1;
    v23 = v22;
    if (a3)
    {
      v24 = 0;
      v25 = &v42[4];
      v9 = a3;
      while (1)
      {
        while (1)
        {
          v26 = a4 + 511;
          if (a4 >= 0)
            v26 = a4;
          v27 = v42[2];
          if (!v42[2])
            goto LABEL_71;
          v28 = 0;
          v29 = v26 >> 9;
          v30 = a4 - (v26 & 0xFFFFFFFFFFFFFE00);
          v31 = v9 >> 9;
          v32 = v25;
          while (1)
          {
            v33 = *v32;
            if (v29 < (*v32 + v28))
              break;
            v32 += 2;
            v28 += v33;
            if (!--v27)
              goto LABEL_71;
          }
          v34 = (*(v32 - 1) + v29 - v28);
          if (!(_DWORD)v34)
          {
LABEL_71:
            v8 = 22;
            goto LABEL_72;
          }
          if (!v30)
            break;
          v39 = v25;
          if (!v24)
          {
            v24 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x4B593C2CuLL);
            if (!v24)
              goto LABEL_84;
          }
          v36 = v34 << 9;
          if (pread(v23, v24, 0x200uLL, v34 << 9) != 512)
            goto LABEL_83;
          v37 = v9 >= (512 - v30) ? (512 - v30) : v9;
          memcpy(&v24[v30], a2, v37);
          if (pwrite(v23, v24, 0x200uLL, v36) != 512)
            goto LABEL_83;
          a4 += v37;
          a2 += v37;
          v9 -= v37;
          v25 = v39;
          if (!v9)
            goto LABEL_81;
        }
        if (v9 < 0x200)
          break;
        if (v31 >= (v33 - (v29 - v28)))
          v31 = (v33 - (v29 - v28));
        v35 = pwrite(v23, v24, v31 << 9, v34 << 9);
        if (v35 < 0)
        {
          v8 = -1;
          goto LABEL_72;
        }
        a2 += v35;
        a4 += v35;
        v9 -= v35;
        if (!v9)
        {
          v8 = 0;
LABEL_72:
          if (!v24)
            goto LABEL_75;
LABEL_73:
          free(v24);
          goto LABEL_75;
        }
      }
      if (v24 || (v24 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0xF4DA82A6uLL)) != 0)
      {
        if (pread(v23, v24, 0x200uLL, v34 << 9) == 512
          && (memcpy(v24, a2, v9), pwrite(v23, v24, 0x200uLL, v34 << 9) == 512))
        {
LABEL_81:
          v9 = 0;
          v8 = 0;
        }
        else
        {
LABEL_83:
          v8 = -1;
        }
        goto LABEL_73;
      }
LABEL_84:
      v8 = -1;
    }
    else
    {
      v9 = 0;
      v8 = 0;
    }
LABEL_75:
    close(v23);
  }
LABEL_2:
  if ((v8 - 1) <= 0xFFFFFFFD)
LABEL_7:
    *__error() = v8;
  if (v8)
    return -1;
  else
    return a3 - v9;
}

uint64_t salloc(uint64_t *a1, uint64_t *a2, unsigned int a3, uint64_t (*a4)(uint64_t, _QWORD, uint64_t, _QWORD, uint64_t), uint64_t a5, int *a6)
{
  unsigned __int16 v8;
  unsigned __int16 v9;
  int v10;
  _OWORD v12[7];
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v13 = 0u;
  v14 = 0u;
  memset(v12, 0, sizeof(v12));
  v8 = srequest(a1, a2, a3, 0, (uint64_t)v12, a4, a5);
  v9 = v8;
  if ((_QWORD)v13 == -1)
  {
    v10 = -5344;
    if (!a6)
      return v9;
    goto LABEL_3;
  }
  v10 = addentry((const void **)a1, v12, 0x60uLL, 0x5Eu, v8, 0x98u);
  if (a6)
LABEL_3:
    *a6 = v10;
  return v9;
}

uint64_t sfree(const void **a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  unsigned int v4;
  unsigned int v8;
  _QWORD *v9;
  uint64_t result;

  v3 = (char *)*a1;
  v4 = *((unsigned __int16 *)*a1 + 47);
  if (!*((_WORD *)*a1 + 47))
    return 22;
  v8 = 0;
  v9 = v3 + 216;
  result = 22;
  do
  {
    if (*(v9 - 1) == a2)
    {
      if (*v9 != a3)
        return result;
      result = delentry(a1, 96, 0x5Eu, (unsigned __int16)v8, 152);
      v4 = *((unsigned __int16 *)v3 + 47);
    }
    v9 += 19;
    ++v8;
  }
  while (v8 < v4);
  return result;
}

uint64_t GPTCategorize(int a1)
{
  __int16 *v1;
  uint64_t v2;

  v1 = &GPTDescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    v2 = *((_QWORD *)v1 + 13);
    v1 += 28;
    if (!v2)
    {
      v1 = (__int16 *)&unk_24CEC26E0;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t GPTSubReadMBR(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int v9;
  char *v10;
  unsigned __int16 *v11;
  unsigned int v12;
  BOOL v13;
  unsigned int v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  unsigned int v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  __int16 *v23;
  __int16 *v24;
  int v25;
  unint64_t v26;
  int v27;
  _QWORD *v28;
  int v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v39;
  __int16 v40[48];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39 = 0;
  v8 = *(_QWORD *)a1;
  if (*(_WORD *)(*(_QWORD *)a1 + 94))
  {
    v9 = 0;
    v10 = (char *)(v8 + 144);
    while (1)
    {
      v11 = MBRInfoSearch(v10);
      if (v11)
      {
        v12 = *v11;
        v13 = v12 > 0xC || ((1 << v12) & 0x1880) == 0;
        if (!v13 || v12 == 131)
          break;
      }
      v14 = v9 + 1;
      if (v9 <= 2)
      {
        v10 += 152;
        ++v9;
        if (v14 < *(unsigned __int16 *)(v8 + 94))
          continue;
      }
      goto LABEL_15;
    }
    *(_QWORD *)(v8 + 80) |= 2uLL;
    v14 = v9;
  }
  else
  {
    v14 = 0;
  }
LABEL_15:
  v15 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x712DA73CuLL);
  *(_QWORD *)(a2 + 8) = v15;
  if (!v15)
    return 12;
  result = MKMediaReadBlocks(a4, 0, 1, 0x200u, v15, &v39);
  if ((_DWORD)result)
    return result;
  v17 = *(_QWORD *)(a2 + 8);
  if (*(unsigned __int16 *)(v17 + 510) != 43605)
    return 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = (char *)(v17 + 446);
  do
  {
    if (*((_DWORD *)v21 + 3) && (!v18 || *((_DWORD *)v21 + 2)))
    {
      v22 = v21[4];
      if (v22 == 238)
      {
        ++v19;
        goto LABEL_51;
      }
      v23 = MBRInfoSearchByType(v22);
      v24 = v23;
      if (v18 == 3 && v23[1] == 6)
        *(_QWORD *)(v8 + 80) |= 8uLL;
      v25 = (unsigned __int16)*v23;
      if (*v23)
      {
        if (v25 != 255)
        {
          ++v20;
          v26 = *((unsigned int *)v21 + 2);
          v39 = *((unsigned int *)v21 + 3);
          v27 = *(unsigned __int16 *)(v8 + 94);
          if (*(_WORD *)(v8 + 94))
          {
            v28 = (_QWORD *)(v8 + 208);
            while (*v28 != v26)
            {
              v28 += 19;
              if (!--v27)
                goto LABEL_33;
            }
            v30 = v28 - 14;
            goto LABEL_41;
          }
LABEL_33:
          if (v25 == 7 && (v14 == 3 && v18 == 3 || v14 == 2 && v18 == 2))
          {
            GPTuuidType2HumanExtended(v40, *((const char **)v23 + 1), 96, 1, 0);
            v29 = gpmrtypesearch(a1, (char *)v40, 2);
            v14 = v29;
            if (v29 <= 1)
            {
              *(_QWORD *)(v8 + 80) |= 4uLL;
              goto LABEL_51;
            }
            if ((a3 & 4) == 0)
            {
              v32 = (_QWORD *)(v8 + 152 * v29);
              v30 = v32 + 12;
              v33 = v32[8] + v32[7];
              if (v33 <= v26)
              {
                v34 = (_QWORD *)(v8 + 56);
                if (v29 + 1 < *(unsigned __int16 *)(v8 + 94))
                  v34 = v30 + 33;
                v35 = *v34 - v33;
                v36 = v39;
                if (v39 <= v35)
                {
                  v37 = v8 + 152 * v29;
                  *(_QWORD *)(v37 + 208) = v26;
                  *(_QWORD *)(v37 + 216) = v36;
                  *(_QWORD *)(v8 + 80) |= 0x10uLL;
                }
              }
LABEL_41:
              v31 = v30[17];
              v30[17] = v31 & 0xFFFFFFFFFFFFFF7FLL;
              if (*v21 < 0)
                v30[17] = v31 | 0x80;
              if (*v24 != 7)
                __strlcpy_chk();
            }
          }
        }
      }
    }
LABEL_51:
    v21 += 16;
  }
  while (v18++ < 3);
  result = 0;
  if (v19)
  {
    if (v20)
    {
      result = 0;
      *(_QWORD *)(v8 + 80) |= 1uLL;
    }
  }
  return result;
}

__CFArray *GPTCFCreateMapRuns(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unint64_t v5;
  _DWORD *v6;
  int *v7;
  const __CFAllocator *v8;
  __CFArray *Mutable;
  int v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  CFDictionaryRef v14;
  CFDictionaryRef v15;
  uint64_t v17;
  uint64_t valuePtr;
  int v19;
  size_t size[2];
  __int128 v21;
  void *values;
  CFTypeRef cf;
  void *keys[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)size = 0u;
  v21 = 0u;
  *(_OWORD *)keys = xmmword_24CEC2718;
  values = 0;
  cf = 0;
  v19 = 0;
  v17 = 0;
  valuePtr = 0;
  MKMediaGetGeometry(a1, (uint64_t)size);
  v5 = LODWORD(size[0]);
  v6 = malloc_type_calloc(1uLL, LODWORD(size[0]), 0xABEE5DE3uLL);
  v7 = __error();
  if (v6)
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v10 = GPTReadHeaderBlock(1, size[0], a1, &v19, (uint64_t)v6);
    if (!v10)
    {
      v11 = v5 >> 9;
      valuePtr = 0;
      values = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
      v12 = (v6[21] * v6[20]);
      v13 = ((*((_WORD *)v6 + 42) * *((_WORD *)v6 + 40)) & 0x1FF) != 0 ? (v12 >> 9) + 1 : v12 >> 9;
      v17 = v13 + *((_QWORD *)v6 + 9) * v11;
      cf = CFNumberCreate(v8, kCFNumberSInt64Type, &v17);
      v14 = CFDictionaryCreate(v8, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFRelease(values);
      CFRelease(cf);
      CFArrayAppendValue(Mutable, v14);
      CFRelease(v14);
      v10 = GPTReadHeaderBlock(size[1] / v11 - 1, size[0], a1, &v19, (uint64_t)v6);
      if (!v10)
      {
        valuePtr = *((_QWORD *)v6 + 9) * v11;
        values = CFNumberCreate(v8, kCFNumberSInt64Type, &valuePtr);
        v17 = v11 + v11 * (*((_QWORD *)v6 + 3) - *((_QWORD *)v6 + 9));
        cf = CFNumberCreate(v8, kCFNumberSInt64Type, &v17);
        v15 = CFDictionaryCreate(v8, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFRelease(values);
        CFRelease(cf);
        CFArrayAppendValue(Mutable, v15);
        CFRelease(v15);
      }
    }
    free(v6);
    if (v10 && Mutable)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
  }
  else
  {
    Mutable = 0;
    v10 = *v7;
  }
  *a3 = v10;
  return Mutable;
}

uint64_t GPMUpdateVolumeUUID(uint64_t *a1, int a2, unsigned int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void *v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  result = 22;
  v14 = 22;
  if (a1)
  {
    if ((a2 & 0x80000000) == 0)
    {
      v6 = *a1;
      if (a2 <= *(unsigned __int16 *)(v6 + 94))
      {
        v15[0] = 0;
        v15[1] = 0;
        v7 = v6 + 152 * (unsigned __int16)a2;
        v8 = *(_QWORD *)(v7 + 208);
        v9 = *(_QWORD *)(v7 + 216);
        if (v8 && v9 != 0)
        {
          v13 = 0;
          v12 = 0;
          v11 = (const void *)MKMediaCreateWithSubRange(0, a4, v8 * a3, v9 * a3, &v14);
          result = v14;
          if (!v14)
          {
            result = MKFileSystemDetect((uint64_t)v11, &v13, (int *)&v12 + 1, &v12);
            v14 = result;
            if (!(_DWORD)result && (_DWORD)v12 == 1 && SHIDWORD(v12) >= 2)
            {
              result = MKHFSProcessVolumeUUID((uint64_t)v11, 2, (uint64_t)v15);
              v14 = result;
            }
          }
          if (v11)
          {
            CFRelease(v11);
            return v14;
          }
        }
      }
    }
  }
  return result;
}

uint64_t MKHFSPlusMapFileBlock(uint64_t a1, int a2, unsigned __int8 a3, unsigned int a4, int *a5, const void *a6)
{
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t result;
  int v11;
  _DWORD v12[3];
  int v13;

  if (*(_DWORD *)(a1 + 12) <= a4)
    return 4294967257;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = *(_DWORD *)(a1 + v7 + 20) + v8;
    if (v9 > a4)
    {
      v11 = a4 - v8 + *(_DWORD *)(a1 + v7 + 16);
      goto LABEL_13;
    }
    v7 += 8;
    v8 = v9;
  }
  while ((_DWORD)v7 != 64);
  if (!a6)
    return 84;
  v13 = 0;
  v12[0] = a2;
  v12[1] = a3;
  v12[2] = a4;
  LODWORD(result) = ApplyToHFSPlusExtentRecords(a6, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))FindFileBlock, (uint64_t)v12);
  if ((_DWORD)result)
    result = result;
  else
    result = 22;
  if ((_DWORD)result == -128)
  {
    v11 = v13;
LABEL_13:
    result = 0;
    *a5 = v11;
  }
  return result;
}

uint64_t FindFileBlock(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t result;

  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && (v4 = *(_DWORD *)(a3 + 8), v5 = *(_DWORD *)(a1 + 8), v6 = v4 >= v5, v7 = v4 - v5, v6))
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = *(_DWORD *)(a2 + v8 + 4) + v9;
      if (v10 > v7)
        break;
      v8 += 8;
      v9 = v10;
      if ((_DWORD)v8 == 64)
        goto LABEL_8;
    }
    *(_DWORD *)(a3 + 12) = v7 - v9 + *(_DWORD *)(a2 + v8);
    result = 4294967168;
  }
  else
  {
LABEL_8:
    result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t MKHFSDescriptorIdentity(char *a1)
{
  const char *v1;
  uint64_t v3;

  v1 = (const char *)hfsdescriptors[0];
  if (hfsdescriptors[0])
  {
    v3 = 0;
    do
    {
      if (!strcasecmp(a1, v1))
        break;
      v1 = (const char *)hfsdescriptors[++v3];
    }
    while (v1);
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

uint64_t MKHFSIdentity(unsigned int a1)
{
  unsigned int v1;

  if (a1 >= 5)
    v1 = 0;
  else
    v1 = a1;
  return hfsdescriptors[v1];
}

uint64_t MKRecordHFSRuns(const void *a1, int a2, unsigned __int16 (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t Blocks;
  double Geometry;
  unsigned int v10;
  __int16 v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  float v23;
  CFStringEncoding SystemEncoding;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[17];
  unsigned __int16 v31[2];
  int v32;
  __int16 v33;
  unsigned __int16 v34;
  unsigned int v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  UInt8 v38[3];
  unsigned int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  __int16 v43;
  unsigned __int16 v44;
  unsigned __int16 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  memset(v30, 0, sizeof(v30));
  v27 = 0u;
  v28 = 0u;
  v26 = 0u;
  memset(v25, 0, sizeof(v25));
  Blocks = MKMediaReadBlocks((uint64_t)a1, 2, 1, 0x200u, (char *)v31, 0);
  if (!(_DWORD)Blocks)
  {
    Geometry = MKMediaGetGeometry((uint64_t)a1, (uint64_t)v25);
    LOWORD(v26) = 1;
    LODWORD(v27) = LODWORD(v25[0]) >> 9;
    *((_QWORD *)&v27 + 1) = *((_QWORD *)&v25[0] + 1);
    *(_QWORD *)&v28 = *((_QWORD *)&v25[0] + 1);
    Blocks = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, double))a3)(a4, 0, 0, Geometry);
    if (!(_DWORD)Blocks)
    {
      v10 = bswap32(v31[0]) >> 16;
      switch(v10)
      {
        case 0x4244u:
          WORD1(v26) = 1;
          TAO_HFSMasterDirectoryBlock_BigToHost(v31);
          if (v35 >= 0x200)
          {
            v19 = v35 >> 9;
            HIDWORD(v26) = v35 >> 9;
            Blocks = 22;
            if (v34 < 8u)
              break;
            v20 = v19 * v34;
            if ((unint64_t)v28 < v20)
              break;
            v21 = v36 + v20;
            LODWORD(v22) = v19 * v37;
            v22 = v22 >= v20 ? v20 : v22;
            *((_QWORD *)&v28 + 1) = v21 + 2;
            *(_QWORD *)&v29 = v22;
            *((_QWORD *)&v29 + 1) = v21 - 1;
            DWORD2(v26) = v36;
            v23 = (float)*((unint64_t *)&v27 + 1) / (float)(v21 + 2);
            if (v23 > 10000.0 || v23 < 0.0001)
              break;
            if ((v33 & 0x8080) != 0)
              *(_QWORD *)&v30[0] |= 1uLL;
            if ((v33 & 0x900) != 0x100)
              *(_QWORD *)&v30[0] |= 2uLL;
            if ((a2 & 0x10000) != 0 || v43 != 18475)
            {
              if ((v42 & 0xFFFFFF) == 0x636E65)
                SystemEncoding = HIBYTE(v42);
              else
                SystemEncoding = CFStringGetSystemEncoding();
              if (!uniconvert((char *)v30 + 12, 256, 0x8000100u, 0, v38, 27, SystemEncoding, 0))
                uniconvert((char *)v30 + 12, 256, 0x8000100u, 0, v38, 27, 0, 0);
              Blocks = HFSSuperTidemark((uint64_t)&v26, a2, (uint64_t)v31, a1, a3, a4);
              if ((_DWORD)Blocks)
                break;
              v16 = *((_QWORD *)&v29 + 1) - v36 + 1;
              v17 = v20 - v29;
LABEL_52:
              DWORD2(v30[0]) = v16 / v17;
              Blocks = ((uint64_t (*)(uint64_t, uint64_t, __int128 *))a3)(a4, 3, &v26);
              break;
            }
            Blocks = ((uint64_t (*)(uint64_t, uint64_t, __int128 *))a3)(a4, 2, &v26);
            if (!(_DWORD)Blocks)
            {
              WORD1(v26) = 3;
              DWORD1(v26) = v36 + HIDWORD(v26) * v44;
              *(_QWORD *)&v28 = HIDWORD(v26) * v45;
LABEL_11:
              Blocks = MKMediaReadBlocks((uint64_t)a1, (DWORD1(v26) + 2), 1, 0x200u, (char *)v31, 0);
              if ((_DWORD)Blocks)
                break;
              TAO_HFSPlusVolumeHeader_BigToHost(v31);
              if ((v32 & 0x8080) != 0)
                *(_QWORD *)&v30[0] |= 1uLL;
              if ((v32 & 0x900) != 0x100)
                *(_QWORD *)&v30[0] |= 2uLL;
              if ((v32 & 0x2000) != 0)
                *(_QWORD *)&v30[0] |= 4uLL;
              Blocks = 22;
              if (v39 < 0x200)
                break;
              v12 = (uint8x8_t)vcnt_s8((int8x8_t)v39);
              v12.i16[0] = vaddlv_u8(v12);
              if (v12.i32[0] > 1u)
                break;
              if (v40 < 8)
                break;
              v13 = (unint64_t)v39 >> 9;
              HIDWORD(v26) = v39 >> 9;
              if (v39 >> 9 > v40)
                break;
              v14 = ((_DWORD)v13 << (v39 < 0x400));
              *((_QWORD *)&v28 + 1) = v40 * (unint64_t)v13;
              *(_QWORD *)&v29 = v41 * (unint64_t)v13;
              *((_QWORD *)&v29 + 1) = ~v14 + *((_QWORD *)&v28 + 1) + DWORD1(v26);
              v15 = (float)*((unint64_t *)&v27 + 1) / (float)*((unint64_t *)&v28 + 1);
              if (v15 > 10000.0)
                break;
              if (v15 < 0.0001)
                break;
              Blocks = MKReadHFSParams(a1, (uint64_t)v31, (uint64_t)&v26);
              if ((_DWORD)Blocks)
                break;
              Blocks = HFSSuperTidemark((uint64_t)&v26, a2, (uint64_t)v31, a1, a3, a4);
              if ((_DWORD)Blocks)
                break;
              v16 = *((_QWORD *)&v29 + 1) - DWORD1(v26) + 1;
              v17 = *((_QWORD *)&v28 + 1) - v29 - v14;
              goto LABEL_52;
            }
          }
          else
          {
            Blocks = 22;
          }
          break;
        case 0x482Bu:
          v11 = 2;
          goto LABEL_10;
        case 0x4858u:
          v11 = 4;
LABEL_10:
          WORD1(v26) = v11;
          goto LABEL_11;
        default:
          WORD1(v26) = 0;
          Blocks = 4294967239;
          break;
      }
      a3(a4, 4, 0);
    }
  }
  return Blocks;
}

uint64_t HFSSuperTidemark(uint64_t a1, int a2, uint64_t a3, const void *a4, unsigned __int16 (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  int v11;
  char *v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  const void *v28;
  uint64_t v29;
  unint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  unsigned __int16 (*v34)(uint64_t, uint64_t, uint64_t *);
  uint64_t v35;
  int v36;
  char v37;
  unsigned __int16 v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  BOOL v44;
  unint64_t v45;
  int v46;
  int v47;
  unint64_t v48;
  signed int v49;
  int v50;
  unsigned int v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  int v65;
  uint64_t v67;
  int v68;
  int v69;
  const void *v70;
  uint64_t v71;
  char *v72;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  int v78;
  int v79;
  int v80;
  int v81;
  unsigned int v82;
  unint64_t v83;

  v82 = 0;
  v78 = 0;
  v76 = 0;
  v77 = 0;
  v74 = 0;
  v75 = 0;
  if (a1)
  {
    v11 = *(_DWORD *)(a1 + 12);
    v12 = (char *)malloc_type_malloc((v11 << 9), 0x40573006uLL);
    if (v12)
    {
      v13 = v12;
      v70 = a4;
      v79 = v11 << 12;
      v80 = (v11 << 6) & 0x1FFFFFFF;
      v81 = 64;
      v14 = *(unsigned __int16 *)(a1 + 2);
      if (v14 == 1)
      {
        v15 = *(unsigned __int16 *)(a3 + 18) - 1;
        v71 = a3;
        v16 = *(unsigned __int16 *)(a3 + 28);
        v17 = v15 + 1;
        v18 = *(_DWORD *)(a1 + 12);
        a3 = -1;
      }
      else
      {
        v15 = (*(_DWORD *)(a3 + 44) - 1);
        v18 = *(_DWORD *)(a1 + 12);
        v20 = -2;
        if (v18 > 1)
          v20 = -1;
        v16 = *(unsigned int *)(a1 + 4);
        v17 = v15 + v20 + 1;
        v71 = -1;
      }
      v83 = 0;
      v72 = v13;
      if ((a2 & 3) == 0)
      {
        if ((a2 & 0x40000) == 0)
        {
          LOWORD(v19) = 0;
LABEL_122:
          free(v72);
          return (__int16)v19;
        }
        if (v18 <= 1)
          v46 = -2;
        else
          v46 = -1;
        if (v14 <= 1)
          v47 = 0;
        else
          v47 = v46;
        v48 = bmaddr((int)v15 + v47, &v79);
        v49 = v48;
        v51 = v50;
        v77 = v48;
        v78 = v50;
        if ((v48 & 0x80000000) == 0)
        {
          v52 = HIDWORD(v48);
          do
          {
            if (*(unsigned __int16 *)(a1 + 2) < 2u)
            {
              v54 = *(unsigned int *)(a1 + 12);
              v55 = (v54 * v49) + (unint64_t)*(unsigned __int16 *)(v71 + 14);
              v53 = (uint64_t)v70;
            }
            else
            {
              v53 = (uint64_t)v70;
              LOWORD(v19) = MKHFSPlusMapFileBlock(a3 + 112, 6, 0, v49, (int *)&v82, v70);
              if ((_WORD)v19)
                goto LABEL_122;
              v54 = *(unsigned int *)(a1 + 12);
              v55 = v54 * (unint64_t)v82;
              v13 = v72;
            }
            LOWORD(v19) = MKMediaReadBlocks(v53, v55 + *(unsigned int *)(a1 + 4), v54, 0x200u, v13, &v83);
            if ((_WORD)v19)
              goto LABEL_122;
            if ((v52 & 0x80000000) == 0)
            {
              v56 = v81 - 1;
              v57 = v52;
              v13 = v72;
              while (1)
              {
                v58 = *(_QWORD *)&v72[8 * v57];
                if (v58)
                {
                  v59 = bswap64(v58);
                  *(_QWORD *)&v72[8 * v57] = v59;
                  if ((v51 & 0x80000000) == 0)
                    break;
                }
LABEL_103:
                v51 = v56;
                v44 = v57-- <= 0;
                if (v44)
                {
                  v78 = v56;
                  v51 = v56;
                  goto LABEL_107;
                }
              }
              v60 = v51;
              v61 = v56 - v51;
              while (((v59 >> v61) & 1) == 0)
              {
                ++v61;
                v44 = v60-- <= 0;
                if (v44)
                  goto LABEL_103;
              }
              HIDWORD(v77) = v57;
              v78 = v60;
              break;
            }
            v13 = v72;
LABEL_107:
            LODWORD(v52) = v80 - 1;
            LODWORD(v77) = v49 - 1;
            HIDWORD(v77) = v80 - 1;
            v44 = v49-- <= 0;
          }
          while (!v44);
        }
        v65 = *(_DWORD *)(a1 + 4);
        LOWORD(v19) = 0;
        v64 = v65 + *(_DWORD *)(a1 + 12) + *(_DWORD *)(a1 + 12) * alblock(&v77, &v79) - 1;
LABEL_121:
        *(_QWORD *)(a1 + 56) = v64;
        goto LABEL_122;
      }
      v69 = bmaddr(v15, &v79);
      if (*(_WORD *)(a1 + 2) == 1)
      {
        v23 = a2;
        if ((a2 & 2) != 0)
        {
          LOWORD(v74) = 1;
          v24 = *(unsigned __int16 *)(v71 + 28);
          v75 = 0;
          v76 = v24;
          LOWORD(v19) = a5(a6, 1, &v74);
          if ((_WORD)v19)
            goto LABEL_122;
        }
        v19 = 0;
        v25 = *(unsigned __int16 *)(v71 + 28);
      }
      else
      {
        v19 = 0;
        v25 = *(unsigned int *)(a1 + 4);
        v23 = a2;
        if ((~a2 & 0x20002) == 0 && (_DWORD)v25)
        {
          LOWORD(v74) = 1;
          v75 = 0;
          v76 = v25;
          v19 = a5(a6, 1, &v74);
          LODWORD(v25) = *(_DWORD *)(a1 + 4);
        }
        v25 = v25;
      }
      v75 = v25;
      v76 = 0;
      if ((v23 & 4) != 0)
      {
        LOWORD(v74) = 2;
        v76 = 1448037419;
        v19 = a5(a6, 1, &v74);
        v76 = 0;
      }
      v26 = v16 + v17 * v18;
      LODWORD(v77) = 0;
      if (v69 < 0)
      {
        v27 = 0;
      }
      else
      {
        v27 = 0;
        LODWORD(v21) = 0;
        v67 = a3 + 112;
        v22 = v72;
        v28 = v70;
        while (1)
        {
          v68 = v21;
          if (*(unsigned __int16 *)(a1 + 2) < 2u)
          {
            v29 = *(unsigned int *)(a1 + 12);
            v30 = (v29 * v21) + (unint64_t)*(unsigned __int16 *)(v71 + 14);
          }
          else
          {
            v19 = (unsigned __int16)MKHFSPlusMapFileBlock(v67, 6, 0, v21, (int *)&v82, v28);
            if (v19)
              break;
            v29 = *(unsigned int *)(a1 + 12);
            v30 = v29 * (unint64_t)v82;
            v22 = v72;
          }
          v19 = (unsigned __int16)MKMediaReadBlocks((uint64_t)v28, v30 + *(unsigned int *)(a1 + 4), v29, 0x200u, v22, &v83);
          if (v19)
            break;
          HIDWORD(v77) = 0;
          v31 = v80;
          if (v80 >= 1)
          {
            v32 = 0;
            v33 = v81;
            v22 = v72;
            while (1)
            {
              *(_QWORD *)&v22[8 * v32] = bswap64(*(_QWORD *)&v22[8 * v32]);
              v78 = 0;
              if (v33 >= 1)
                break;
LABEL_48:
              HIDWORD(v77) = ++v32;
              if ((int)v32 >= v31)
                goto LABEL_51;
            }
            v34 = a5;
            v35 = a6;
            v36 = 1;
            v37 = -1;
            v38 = v74;
            while (1)
            {
              v39 = (*(_QWORD *)&v22[8 * v32] >> (v33 + v37)) & 1;
              if (v38 == (_DWORD)v39)
              {
                v40 = v75;
                v41 = v76;
              }
              else
              {
                v42 = v76;
                if (v76)
                {
                  if (((v38 + 1) & a2) != 0)
                  {
                    v19 = v34(v35, 1, &v74);
                    if (v19)
                      goto LABEL_54;
                    v42 = v76;
                    v38 = v74;
                    v22 = v72;
                  }
                  v40 = v75 + v42;
                  v75 = v40;
                  v76 = 0;
                }
                else
                {
                  v40 = v75;
                }
                v41 = 0;
                if (v38 == 1)
                  v27 = v40;
                LOWORD(v74) = v39;
                v38 = v39;
              }
              if (v41 + v40 >= v26)
                break;
              v76 = v41 + *(unsigned int *)(a1 + 12);
              v78 = v36;
              v33 = v81;
              --v37;
              v44 = v36++ < v81;
              if (!v44)
              {
                v31 = v80;
                a6 = v35;
                a5 = v34;
                v23 = a2;
                goto LABEL_48;
              }
            }
            v19 = 0;
LABEL_54:
            a6 = v35;
            a5 = v34;
            v23 = a2;
            break;
          }
          v22 = v72;
LABEL_51:
          LODWORD(v77) = v68 + 1;
          v28 = v70;
          v21 = (v68 + 1);
          if (v68 >= v69)
          {
            v19 = 0;
            break;
          }
        }
      }
      if (v76)
      {
        if ((((unsigned __int16)v74 + 1) & v23) != 0)
          v19 = ((unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        if (v19)
          goto LABEL_122;
        v43 = v75 + v76;
        v75 = v43;
        v76 = 0;
        v44 = v43 <= v26 && v43 > v27;
        if (!v44)
          v43 = v27;
        if ((unsigned __int16)v74 == 1)
          v27 = v43;
        LOWORD(v19) = 0;
      }
      if ((v23 & 4) != 0)
      {
        LOWORD(v74) = 2;
        v76 = 1448037421;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        v76 = 0;
      }
      v45 = *(unsigned int *)(a1 + 4) + *(_QWORD *)(a1 + 32) - 2;
      if ((v23 & 1) != 0 && v75 < v45)
      {
        LOWORD(v74) = 0;
        v76 = v45 + ~v75;
        if (v76)
          LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      if ((v23 & 2) != 0 && v75 <= v45)
      {
        LOWORD(v74) = 1;
        v75 = v45;
        v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      if ((v23 & 1) != 0)
      {
        LOWORD(v74) = 0;
        v75 = *(unsigned int *)(a1 + 4) + *(_QWORD *)(a1 + 32) - 1;
        v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
        if ((v23 & 0x20000) == 0)
          goto LABEL_118;
        v62 = *(unsigned int *)(a1 + 4);
        if (!(_DWORD)v62)
          goto LABEL_118;
        LOWORD(v74) = 0;
        v63 = *(_QWORD *)(a1 + 24);
        v75 = *(_QWORD *)(a1 + 32) + v62;
        v76 = v63 - v75 - 2;
        if (v75 < v63 - 2)
          LOWORD(v19) = a5(a6, 1, &v74);
      }
      else if ((v23 & 0x20000) == 0 || !*(_DWORD *)(a1 + 4))
      {
LABEL_118:
        v64 = v27 - 1;
        goto LABEL_121;
      }
      if ((v23 & 2) != 0)
      {
        LOWORD(v74) = 1;
        v75 = *(_QWORD *)(a1 + 24) - 2;
        v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      if ((v23 & 1) != 0)
      {
        LOWORD(v74) = 0;
        v75 = *(_QWORD *)(a1 + 24) - 1;
        v76 = 1;
        LOWORD(v19) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, char *))a5)(a6, 1, &v74, v21, v22);
      }
      goto LABEL_118;
    }
    LOWORD(v19) = -1;
  }
  else
  {
    LOWORD(v19) = 22;
  }
  return (__int16)v19;
}

uint64_t MKReadHFSParams(const void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unsigned int v7;
  int8x8_t *v8;
  int8x8_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t Blocks;
  unsigned int v13;
  int8x8_t *v14;
  int8x8_t v16;
  size_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  unsigned int v23;
  int v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  unsigned int v29;
  size_t v30;
  uint64_t v31;
  int v32;
  unsigned int v33;
  unsigned int v34;

  v3 = 22;
  if (!a1 || !a2)
    return v3;
  v7 = 2 * *(_DWORD *)(a2 + 40);
  v8 = (int8x8_t *)malloc_type_malloc(v7, 0x21233CF9uLL);
  if (!v8)
    return *__error();
  v9 = v8;
  v34 = 0;
  v10 = a2 + 272;
  v11 = *(_DWORD *)(a2 + 40);
  Blocks = MKHFSPlusMapFileBlock(a2 + 272, 4, 0, 0, (int *)&v34, a1);
  if ((_DWORD)Blocks)
    goto LABEL_6;
  v13 = v11 >> 9;
  Blocks = MKMediaReadBlocks((uint64_t)a1, *(_DWORD *)(a3 + 4) + v34 * (v11 >> 9), 1, 0x200u, (char *)v9, 0);
  if ((_DWORD)Blocks)
    goto LABEL_6;
  if (v9[1].i8[0] != 1)
  {
    v3 = 4294967246;
    goto LABEL_7;
  }
  v16 = (int8x8_t)TAO_BTHeaderRec_BigToHost((unsigned __int16 *)&v9[1] + 3).u64[0];
  Blocks = MKHFSValidate_BTHDR((uint64_t)&v9[1] + 6, v16);
  if ((_DWORD)Blocks)
  {
LABEL_6:
    v3 = Blocks;
LABEL_7:
    v14 = v9;
    goto LABEL_8;
  }
  v17 = v9[4].u16[0];
  v14 = v9;
  if (v7 < v17)
  {
    free(v9);
    v14 = (int8x8_t *)malloc_type_malloc(v17, 0x6E5270ADuLL);
    if (!v14)
      return *__error();
  }
  if (v9[6].u8[3] == 188)
    *(_QWORD *)(a3 + 64) |= 8uLL;
  v30 = v17;
  LODWORD(v18) = v17 >> 9;
  v19 = (v17 >> 9) / v13;
  v33 = v11 >> 9;
  if ((v17 >> 9) % v13)
    v20 = v19 + 1;
  else
    v20 = v19;
  if ((_DWORD)v20)
  {
    v21 = 0;
    v22 = 0;
    v23 = v9[3].i32[0] * v18;
    v24 = v23 / v33;
    v32 = v23 % v33;
    if (v33 >= v18)
      v18 = v18;
    else
      v18 = v33;
    v31 = v18;
    v25 = v11 & 0xFFFFFE00;
    while (1)
    {
      v26 = MKHFSPlusMapFileBlock(v10, 4, 0, v24 + v22, (int *)&v34, a1);
      if ((_DWORD)v26)
        break;
      v34 = *(_DWORD *)(a3 + 4) + v32 + v34 * v33;
      v26 = MKMediaReadBlocks((uint64_t)a1, v34, v31, 0x200u, (char *)v14 + v21, 0);
      if ((_DWORD)v26)
        break;
      ++v22;
      v21 += v25;
      if (!--v20)
        goto LABEL_28;
    }
    v3 = v26;
  }
  else
  {
LABEL_28:
    TAO_BTNodeDescriptor_BigToHost(v14);
    if (!v14[1].i16[1])
      goto LABEL_36;
    v27 = bswap32(*(unsigned __int16 *)((char *)&v14->u16[-1] + v17)) >> 16;
    v3 = 22;
    if (v27 < 0xE || v30 - 518 < v27)
      goto LABEL_8;
    v28 = (char *)v14 + v27;
    TAO_HFSPlusCatalogKey_BigToHost((unsigned __int16 *)((char *)v14 + v27));
    if (*(_DWORD *)(v28 + 2) != 1)
    {
LABEL_36:
      v3 = 4294967246;
      goto LABEL_8;
    }
    v29 = *((unsigned __int16 *)v28 + 3);
    if (v29 <= 0xFF)
    {
      uniconvert((void *)(a3 + 76), 256, 0x8000100u, 0, (const UInt8 *)v28 + 8, 2 * v29, 0x100u, 0);
      v3 = 0;
    }
  }
LABEL_8:
  free(v14);
  if ((_DWORD)v3 == -1)
    return *__error();
  return v3;
}

CFMutableDictionaryRef MKCFCreateHFSInfo(const void *a1, const __CFDictionary *a2, _DWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  int v9;
  BOOL v10;

  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    *v6 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(v7 + 8) = Mutable;
    v9 = MKRecordHFSRuns(a1, *(_DWORD *)v7, (unsigned __int16 (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v9)
      v10 = Mutable == 0;
    else
      v10 = 1;
    if (!v10)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_11;
  }
  return Mutable;
}

uint64_t HFSAllocFileIO(const void *a1, unsigned __int16 *a2, char **a3, int a4)
{
  char **v4;
  uint64_t v5;
  int v7;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int16 *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
  char **v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  unsigned int v35;

  if (!a3)
    return 22;
  v4 = a3;
  v5 = (uint64_t)a2;
  v7 = *a2;
  if (v7 == 18520 || v7 == 18475)
  {
    v9 = *((_DWORD *)a2 + 10);
    v10 = *((_DWORD *)a2 + 11) >> 3;
    if (v10 % v9)
      v11 = v10 / v9 + 1;
    else
      v11 = v10 / v9;
    v12 = v11 * v9;
    v13 = a2 + 64;
    v14 = (uint64_t)a2;
    v5 = -1;
  }
  else
  {
    if (v7 != 16964)
    {
      v27 = 0;
      v17 = 4294967173;
      goto LABEL_43;
    }
    v13 = 0;
    v9 = *((_DWORD *)a2 + 5);
    v10 = a2[9] >> 3;
    if (v10 % v9)
      v11 = v10 / v9 + 1;
    else
      v11 = v10 / v9;
    v12 = v11 * v9;
    v14 = -1;
  }
  if (!a4)
  {
    v15 = (char *)malloc_type_malloc(v12, 0x617773D5uLL);
    v16 = v15;
    if (!v15)
    {
      v27 = 0;
      v17 = 0xFFFFFFFFLL;
      goto LABEL_44;
    }
    goto LABEL_21;
  }
  if (!*a3)
    return 22;
  bzero(&(*a3)[v10 + 1], ~(unint64_t)v10 + v12);
  v15 = 0;
  v16 = *v4;
LABEL_21:
  v29 = v4;
  v30 = v15;
  v32 = v5;
  v18 = 0;
  v19 = 0;
  v20 = v9 >> 9;
  v35 = 0;
  v34 = 0;
  v31 = v14 + 112;
  v21 = v11;
  while (1)
  {
    if (v19 >= v21)
    {
      v17 = 0;
      v4 = v29;
      v27 = v30;
      goto LABEL_43;
    }
    if (v7 == 16964)
    {
      v22 = *(unsigned __int16 *)(v32 + 14) + v19 * v20;
      v23 = v21;
      goto LABEL_31;
    }
    v24 = MKHFSPlusMapFileBlock(v31, 6, 0, v19, (int *)&v35, a1);
    if ((_DWORD)v24)
      break;
    v22 = v35 * (unint64_t)v20;
    if (v13)
    {
      v23 = (*((_DWORD *)v13 + 1) * v20);
      if (v18++ <= 6)
        v13 += 4;
      else
        v13 = 0;
    }
    else
    {
      v23 = v20;
    }
LABEL_31:
    if (a4)
      v26 = MKMediaWriteSectors((uint64_t)a1, v22, v23, v16, &v34);
    else
      v26 = MKMediaReadSectors((uint64_t)a1, v22, v23, v16, &v34);
    v17 = v26;
    v19 += v23 / v20;
    v16 += 512 * v34;
    if ((_DWORD)v26)
      goto LABEL_40;
  }
  v17 = v24;
LABEL_40:
  if (v30)
    free(v30);
  v27 = 0;
  v4 = v29;
LABEL_43:
  if (!a4)
LABEL_44:
    *v4 = v27;
  return v17;
}

uint64_t HFSAllocateSpace(const void *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  unint64_t v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  int v14;
  _BYTE *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  void *v20;

  if (*(_QWORD *)a3 == a4)
    return 0;
  v20 = 0;
  v4 = HFSAllocFileIO(a1, (unsigned __int16 *)a2, (char **)&v20, 0);
  if (!(_DWORD)v4)
  {
    v9 = *(unsigned int *)(a2 + 40);
    if (a4 % v9)
      v10 = a4 / v9 + 1;
    else
      v10 = a4 / v9;
    v11 = *(_DWORD *)(a3 + 12);
    v12 = *(_DWORD *)(a3 + 16);
    if (*(_QWORD *)a3 <= a4)
    {
      v14 = *(_DWORD *)(a2 + 44);
      if (BitsClear((uint64_t)v20, v12 + v11, v10 - v11))
      {
        *(_DWORD *)(a3 + 20) = v10;
        *(_DWORD *)(a3 + 12) = v10;
        *(_QWORD *)a3 = a4;
        v15 = v20;
        v16 = v12 + v11;
        v17 = v10 - v11;
      }
      else
      {
        SetBits(v20, v12, v11, 0);
        v18 = ScanForZeros((uint64_t)v20, v14, v10);
        if (v18 == -1)
          return 28;
        v16 = v18;
        *(_DWORD *)(a3 + 16) = v18;
        *(_DWORD *)(a3 + 20) = v10;
        *(_DWORD *)(a3 + 12) = v10;
        *(_QWORD *)a3 = a4;
        v15 = v20;
        v17 = v10;
      }
      SetBits(v15, v16, v17, 1);
      v13 = *(_DWORD *)(a2 + 48) - (v10 - v11);
    }
    else
    {
      if (!v10)
        *(_DWORD *)(a3 + 16) = 0;
      *(_DWORD *)(a3 + 20) = v10;
      *(_DWORD *)(a3 + 12) = v10;
      *(_QWORD *)a3 = a4;
      SetBits(v20, v12 + v10, v11 - v10, 0);
      v13 = *(_DWORD *)(a2 + 48) + v11 - v10;
    }
    *(_DWORD *)(a2 + 48) = v13;
    v4 = HFSAllocFileIO(a1, (unsigned __int16 *)a2, (char **)&v20, 1);
    free(v20);
  }
  return v4;
}

uint64_t MKHFSValidate_BTHDR(uint64_t a1, int8x8_t a2)
{
  int v2;
  BOOL v3;
  BOOL v4;
  unsigned int v5;
  uint64_t v6;

  a2.i32[0] = *(unsigned __int16 *)(a1 + 18);
  v2 = vaddlv_u8((uint8x8_t)vcnt_s8(a2));
  if ((unsigned __int16)(*(_WORD *)(a1 + 18) - 512) <= 0x7E00u)
  {
    v3 = v2 != 0;
    v4 = v2 == 1;
  }
  else
  {
    v3 = 1;
    v4 = 0;
  }
  if (!v4 && v3)
    return 22;
  v5 = *(_DWORD *)(a1 + 22);
  if (*(_DWORD *)(a1 + 10) >= v5)
    return 22;
  v6 = 22;
  if (*(_DWORD *)(a1 + 14) < v5)
  {
    if (*(_DWORD *)(a1 + 26) <= v5)
      return 0;
    else
      return 22;
  }
  return v6;
}

unsigned __int16 *TAO_HFSMasterDirectoryBlock_BigToHost(unsigned __int16 *result)
{
  uint64_t v1;
  unsigned __int16 *v2;
  uint64_t v3;
  unsigned __int16 *v4;

  v1 = 0;
  *result = bswap32(*result) >> 16;
  result[9] = bswap32(result[9]) >> 16;
  result[14] = bswap32(result[14]) >> 16;
  *(_DWORD *)(result + 15) = bswap32(*(_DWORD *)(result + 15));
  result[17] = bswap32(result[17]) >> 16;
  *((_DWORD *)result + 16) = bswap32(*((_DWORD *)result + 16));
  result[34] = bswap32(result[34]) >> 16;
  *(_DWORD *)(result + 39) = bswap32(*(_DWORD *)(result + 39));
  result[41] = bswap32(result[41]) >> 16;
  result[62] = bswap32(result[62]) >> 16;
  result[63] = bswap32(result[63]) >> 16;
  result[64] = bswap32(result[64]) >> 16;
  *(_DWORD *)(result + 65) = bswap32(*(_DWORD *)(result + 65));
  *(int8x8_t *)(result + 1) = vrev32_s8(*(int8x8_t *)(result + 1));
  *(int8x8_t *)(result + 5) = vrev16_s8(*(int8x8_t *)(result + 5));
  *(int8x8_t *)(result + 10) = vrev32_s8(*(int8x8_t *)(result + 10));
  *(int8x8_t *)(result + 35) = vrev32_s8(*(int8x8_t *)(result + 35));
  *(int8x16_t *)(result + 42) = vrev32q_s8(*(int8x16_t *)(result + 42));
  *(int8x16_t *)(result + 50) = vrev32q_s8(*(int8x16_t *)(result + 50));
  *(int8x8_t *)(result + 58) = vrev32_s8(*(int8x8_t *)(result + 58));
  do
  {
    v2 = &result[v1];
    v2[67] = bswap32(result[v1 + 67]) >> 16;
    v2[68] = bswap32(result[v1 + 68]) >> 16;
    v1 += 2;
  }
  while (v1 != 6);
  v3 = 0;
  *(_DWORD *)(result + 73) = bswap32(*(_DWORD *)(result + 73));
  do
  {
    v4 = &result[v3];
    v4[75] = bswap32(result[v3 + 75]) >> 16;
    v4[76] = bswap32(result[v3 + 76]) >> 16;
    v3 += 2;
  }
  while (v3 != 6);
  return result;
}

unsigned __int16 *TAO_HFSExtentDescriptor_BigToHost(unsigned __int16 *result)
{
  *result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  return result;
}

uint64_t TAO_HFSExtentRecord_BigToHost(uint64_t result)
{
  uint64_t i;
  _WORD *v2;

  for (i = 0; i != 12; i += 4)
  {
    v2 = (_WORD *)(result + i);
    *v2 = bswap32(*(unsigned __int16 *)(result + i)) >> 16;
    v2[1] = bswap32(*(unsigned __int16 *)(result + i + 2)) >> 16;
  }
  return result;
}

uint64_t TAO_HFSExtentKey_BigToHost(uint64_t result)
{
  *(_DWORD *)(result + 2) = bswap32(*(_DWORD *)(result + 2));
  *(_WORD *)(result + 6) = bswap32(*(unsigned __int16 *)(result + 6)) >> 16;
  return result;
}

uint64_t TAO_HFSCatalogKey_BigToHost(uint64_t result)
{
  *(_DWORD *)(result + 2) = bswap32(*(_DWORD *)(result + 2));
  return result;
}

int8x16_t TAO_HFSCatalogFolder_BigToHost(unsigned __int16 *a1)
{
  int8x16_t result;

  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  a1[2] = bswap32(a1[2]) >> 16;
  *(int8x16_t *)(a1 + 3) = vrev32q_s8(*(int8x16_t *)(a1 + 3));
  _TAO_DInfo_BigToHost((int8x16_t *)(a1 + 11));
  a1[20] = bswap32(a1[20]) >> 16;
  a1[19] = bswap32(a1[19]) >> 16;
  *(_DWORD *)(a1 + 21) = bswap32(*(_DWORD *)(a1 + 21));
  a1[24] = bswap32(a1[24]) >> 16;
  result = vrev32q_s8(*(int8x16_t *)(a1 + 25));
  *(int8x16_t *)(a1 + 25) = result;
  *(_DWORD *)(a1 + 33) = bswap32(*(_DWORD *)(a1 + 33));
  return result;
}

int8x16_t _TAO_DInfo_BigToHost(int8x16_t *a1)
{
  int8x16_t result;

  result = vrev16q_s8(*a1);
  *a1 = result;
  return result;
}

unsigned __int16 *_TAO_DXInfo_BigToHost(unsigned __int16 *result)
{
  result[1] = bswap32(result[1]) >> 16;
  *result = bswap32(*result) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  result[5] = bswap32(result[5]) >> 16;
  *((_DWORD *)result + 3) = bswap32(*((_DWORD *)result + 3));
  return result;
}

unsigned __int16 *TAO_HFSCatalogFile_BigToHost(unsigned __int16 *result)
{
  uint64_t v1;
  unsigned __int16 *v2;
  uint64_t i;
  unsigned __int16 *v4;

  v1 = 0;
  *result = bswap32(*result) >> 16;
  *((_DWORD *)result + 5) = bswap32(*((_DWORD *)result + 5));
  result[12] = bswap32(result[12]) >> 16;
  result[17] = bswap32(result[17]) >> 16;
  *((_DWORD *)result + 13) = bswap32(*((_DWORD *)result + 13));
  result[33] = bswap32(result[33]) >> 16;
  *((_DWORD *)result + 17) = bswap32(*((_DWORD *)result + 17));
  result[36] = bswap32(result[36]) >> 16;
  *(int8x8_t *)(result + 2) = vrev32_s8(*(int8x8_t *)(result + 2));
  *(int8x8_t *)(result + 6) = vrev16_s8(*(int8x8_t *)(result + 6));
  *(int8x8_t *)(result + 13) = vrev32_s8(*(int8x8_t *)(result + 13));
  *(int8x16_t *)(result + 18) = vrev32q_s8(*(int8x16_t *)(result + 18));
  *((int8x8_t *)result + 7) = vrev16_s8(*(int8x8_t *)(result + 28));
  do
  {
    v2 = &result[v1];
    v2[37] = bswap32(result[v1 + 37]) >> 16;
    v2[38] = bswap32(result[v1 + 38]) >> 16;
    v1 += 2;
  }
  while (v1 != 6);
  for (i = 0; i != 6; i += 2)
  {
    v4 = &result[i];
    v4[43] = bswap32(result[i + 43]) >> 16;
    v4[44] = bswap32(result[i + 44]) >> 16;
  }
  *(_DWORD *)(result + 49) = bswap32(*(_DWORD *)(result + 49));
  return result;
}

int8x8_t TAO_FInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result;
  int8x8_t v2;

  result = vrev32_s8(*a1);
  v2 = vrev16_s8(a1[1]);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int8x8_t _TAO_FXInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result;

  result = vrev16_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i32[1] = bswap32(a1[1].u32[1]);
  return result;
}

int8x8_t TAO_HFSCatalogThread_BigToHost(unsigned __int16 *a1)
{
  int8x8_t result;

  *a1 = bswap32(*a1) >> 16;
  result = vrev32_s8(*(int8x8_t *)(a1 + 1));
  *(int8x8_t *)(a1 + 1) = result;
  *(_DWORD *)(a1 + 5) = bswap32(*(_DWORD *)(a1 + 5));
  return result;
}

int8x16_t TAO_JournalInfoBlock_BigToHost(uint64_t a1)
{
  uint64_t v1;
  int8x16_t result;

  v1 = 0;
  *(_DWORD *)a1 = bswap32(*(_DWORD *)a1);
  do
  {
    *(int8x16_t *)(a1 + 4 + v1) = vrev32q_s8(*(int8x16_t *)(a1 + 4 + v1));
    v1 += 16;
  }
  while (v1 != 32);
  result = vrev64q_s8(*(int8x16_t *)(a1 + 36));
  *(int8x16_t *)(a1 + 36) = result;
  return result;
}

int8x8_t TAO_HFSPlusExtentKey_BigToHost(unsigned __int16 *a1)
{
  int8x8_t result;

  *a1 = bswap32(*a1) >> 16;
  result = vrev32_s8(*(int8x8_t *)(a1 + 2));
  *(int8x8_t *)(a1 + 2) = result;
  return result;
}

int8x8_t TAO_HFSPlusBSDInfo_BigToHost(int8x8_t *a1)
{
  int8x8_t result;

  result = vrev32_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i32[1] = bswap32(a1[1].u32[1]);
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogKey_BigToHost(unsigned __int16 *result)
{
  uint64_t v1;
  _WORD *v2;

  *result = bswap32(*result) >> 16;
  *(_DWORD *)(result + 1) = bswap32(*(_DWORD *)(result + 1));
  LODWORD(v1) = bswap32(result[3]) >> 16;
  result[3] = v1;
  if (v1 >= 0xFF)
    v1 = 255;
  else
    v1 = v1;
  if ((_DWORD)v1)
  {
    v2 = result + 4;
    do
    {
      *v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

_WORD *TAO_HFSUniStr255_BigToHost(_WORD *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _WORD *v4;

  if (a2 >= 2)
  {
    v2 = bswap32((unsigned __int16)*result) >> 16;
    *result = v2;
    v3 = (a2 - 2) >> 1;
    if (v3 >= v2)
      LOWORD(v3) = v2;
    if ((_WORD)v3)
    {
      v3 = (unsigned __int16)v3;
      v4 = result + 1;
      do
      {
        *v4 = bswap32((unsigned __int16)*v4) >> 16;
        ++v4;
        --v3;
      }
      while (v3);
    }
  }
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogKey_HostToBig(unsigned __int16 *result)
{
  uint64_t v1;
  _WORD *v2;

  *result = bswap32(*result) >> 16;
  *(_DWORD *)(result + 1) = bswap32(*(_DWORD *)(result + 1));
  LODWORD(v1) = result[3];
  result[3] = __rev16(v1);
  if (v1 >= 0xFF)
    v1 = 255;
  else
    v1 = v1;
  if ((_DWORD)v1)
  {
    v2 = result + 4;
    do
    {
      *v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

_WORD *TAO_HFSUniStr255_HostToBig(_WORD *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  _WORD *v4;

  if (a2 >= 2)
  {
    v2 = (unsigned __int16)*result;
    *result = __rev16(v2);
    v3 = (a2 - 2) >> 1;
    if (v3 >= v2)
      LOWORD(v3) = v2;
    if ((_WORD)v3)
    {
      v3 = (unsigned __int16)v3;
      v4 = result + 1;
      do
      {
        *v4 = bswap32((unsigned __int16)*v4) >> 16;
        ++v4;
        --v3;
      }
      while (v3);
    }
  }
  return result;
}

int8x8_t TAO_HFSPlusCatalogFolder_BigToHost(unsigned __int16 *a1)
{
  int8x8_t result;

  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *((_DWORD *)a1 + 9) = bswap32(*((_DWORD *)a1 + 9));
  a1[21] = bswap32(a1[21]) >> 16;
  *((_DWORD *)a1 + 11) = bswap32(*((_DWORD *)a1 + 11));
  _TAO_DInfo_BigToHost((int8x16_t *)a1 + 3);
  a1[33] = bswap32(a1[33]) >> 16;
  a1[32] = bswap32(a1[32]) >> 16;
  *((_DWORD *)a1 + 17) = bswap32(*((_DWORD *)a1 + 17));
  a1[37] = bswap32(a1[37]) >> 16;
  result = vrev32_s8(*(int8x8_t *)(a1 + 38));
  *(int8x8_t *)(a1 + 38) = result;
  *((_DWORD *)a1 + 21) = bswap32(*((_DWORD *)a1 + 21));
  return result;
}

double TAO_HFSPlusCatalogFile_BigToHost(unsigned __int16 *a1)
{
  double result;

  *a1 = bswap32(*a1) >> 16;
  a1[1] = bswap32(a1[1]) >> 16;
  *(int8x16_t *)(a1 + 2) = vrev32q_s8(*(int8x16_t *)(a1 + 2));
  *(int8x16_t *)(a1 + 10) = vrev32q_s8(*(int8x16_t *)(a1 + 10));
  *((_DWORD *)a1 + 9) = bswap32(*((_DWORD *)a1 + 9));
  a1[21] = bswap32(a1[21]) >> 16;
  *(int8x8_t *)(a1 + 22) = vrev32_s8(*(int8x8_t *)(a1 + 22));
  *((_DWORD *)a1 + 13) = bswap32(*((_DWORD *)a1 + 13));
  *(int8x16_t *)(a1 + 28) = vrev16q_s8(*(int8x16_t *)(a1 + 28));
  a1[37] = bswap32(a1[37]) >> 16;
  *(int8x8_t *)(a1 + 38) = vrev32_s8(*(int8x8_t *)(a1 + 38));
  TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 44));
  *(_QWORD *)&result = TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 84)).n128_u64[0];
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogThread_BigToHost(unsigned __int16 *result)
{
  uint64_t v1;
  _WORD *v2;

  *result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  LODWORD(v1) = bswap32(result[4]) >> 16;
  result[4] = v1;
  if (v1 >= 0xFF)
    v1 = 255;
  else
    v1 = v1;
  if ((_DWORD)v1)
  {
    v2 = result + 5;
    do
    {
      *v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

unsigned __int16 *TAO_HFSPlusCatalogThread_HostToBig(unsigned __int16 *result)
{
  uint64_t v1;
  _WORD *v2;

  *result = bswap32(*result) >> 16;
  result[1] = bswap32(result[1]) >> 16;
  *((_DWORD *)result + 1) = bswap32(*((_DWORD *)result + 1));
  LODWORD(v1) = result[4];
  result[4] = __rev16(v1);
  if (v1 >= 0xFF)
    v1 = 255;
  else
    v1 = v1;
  if ((_DWORD)v1)
  {
    v2 = result + 5;
    do
    {
      *v2 = bswap32((unsigned __int16)*v2) >> 16;
      ++v2;
      --v1;
    }
    while (v1);
  }
  return result;
}

unsigned int *TAO_HFSPlusAttrData_BigToHost(unsigned int *result)
{
  *result = bswap32(*result);
  result[3] = bswap32(result[3]);
  return result;
}

double TAO_HFSPlusAttrForkData_BigToHost(int8x8_t *a1)
{
  double result;

  *a1 = vrev32_s8(*a1);
  *(_QWORD *)&result = TAO_HFSPlusForkData_BigToHost((uint64_t)&a1[1]).n128_u64[0];
  return result;
}

__n128 TAO_HFSPlusAttrExtents_BigToHost(int8x8_t *a1)
{
  uint64_t v1;
  int8x8_t *v2;
  float *v3;
  float32x4x2_t v5;
  float32x4x2_t v6;

  v1 = 0;
  *a1 = vrev32_s8(*a1);
  v2 = a1 + 1;
  do
  {
    v3 = (float *)&v2[v1];
    v5 = vld2q_f32(v3);
    v6.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v5.val[0]);
    v6.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v5.val[1]);
    vst2q_f32(v3, v6);
    v1 += 4;
  }
  while (v1 != 8);
  return (__n128)v5.val[0];
}

void TAO_HFSPlusAttrRecord_BigToHost(unsigned int *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  float *v5;
  unsigned int v6;
  float32x4x2_t v7;
  float32x4x2_t v8;

  v2 = *a1;
  v3 = bswap32(*a1);
  switch(v3)
  {
    case 0x30u:
      v4 = 0;
      a1[1] = bswap32(a1[1]);
      do
      {
        v5 = (float *)&a1[v4 + 2];
        v7 = vld2q_f32(v5);
        v8.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v7.val[0]);
        v8.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v7.val[1]);
        vst2q_f32(v5, v8);
        v4 += 8;
      }
      while (v4 != 16);
      v2 = 48;
      break;
    case 0x20u:
      v6 = bswap32(a1[1]);
      *a1 = 32;
      a1[1] = v6;
      TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 2));
      v2 = *a1;
      break;
    case 0x10u:
      a1[3] = bswap32(a1[3]);
      v2 = 16;
      break;
  }
  *a1 = bswap32(v2);
}

void TAO_HFSPlusAttrRecord_HostToBig(unsigned int *a1)
{
  unsigned int v2;
  uint64_t v3;
  float *v4;
  unsigned int v5;
  float32x4x2_t v6;
  float32x4x2_t v7;

  v2 = *a1;
  if (*a1 == 48)
  {
    v3 = 0;
    a1[1] = bswap32(a1[1]);
    do
    {
      v4 = (float *)&a1[v3 + 2];
      v6 = vld2q_f32(v4);
      v7.val[0] = (float32x4_t)vrev32q_s8((int8x16_t)v6.val[0]);
      v7.val[1] = (float32x4_t)vrev32q_s8((int8x16_t)v6.val[1]);
      vst2q_f32(v4, v7);
      v3 += 8;
    }
    while (v3 != 16);
    v2 = 805306368;
  }
  else if (v2 == 32)
  {
    v5 = bswap32(a1[1]);
    *a1 = 0x20000000;
    a1[1] = v5;
    TAO_HFSPlusForkData_BigToHost((uint64_t)(a1 + 2));
    v2 = *a1;
  }
  else if (v2 == 16)
  {
    a1[3] = bswap32(a1[3]);
    v2 = 0x10000000;
  }
  *a1 = bswap32(v2);
}

int8x8_t TAO_BTNodeDescriptor_BigToHost(int8x8_t *a1)
{
  int8x8_t result;

  result = vrev32_s8(*a1);
  *a1 = result;
  a1[1].i16[1] = bswap32(a1[1].u16[1]) >> 16;
  a1[1].i16[2] = bswap32(a1[1].u16[2]) >> 16;
  return result;
}

int8x16_t TAO_BTHeaderRec_BigToHost(unsigned __int16 *a1)
{
  uint64_t v1;
  unsigned __int16 *v2;
  int8x16_t result;

  v1 = 0;
  *a1 = bswap32(*a1) >> 16;
  a1[9] = bswap32(a1[9]) >> 16;
  a1[10] = bswap32(a1[10]) >> 16;
  a1[15] = bswap32(a1[15]) >> 16;
  *((_DWORD *)a1 + 8) = bswap32(*((_DWORD *)a1 + 8));
  *(_DWORD *)(a1 + 19) = bswap32(*(_DWORD *)(a1 + 19));
  *(int8x16_t *)(a1 + 1) = vrev32q_s8(*(int8x16_t *)(a1 + 1));
  *(int8x8_t *)(a1 + 11) = vrev32_s8(*(int8x8_t *)(a1 + 11));
  v2 = a1 + 21;
  do
  {
    result = vrev32q_s8(*(int8x16_t *)&v2[v1]);
    *(int8x16_t *)&v2[v1] = result;
    v1 += 8;
  }
  while (v1 != 32);
  return result;
}

size_t readn(int a1, char *a2, size_t a3)
{
  size_t v6;
  ssize_t v7;

  if (a3)
  {
    v6 = a3;
    while (1)
    {
      v7 = read(a1, a2, v6);
      if (v7 < 0)
      {
        if (*__error() != 4)
          return -1;
        v7 = 0;
      }
      else if (!v7)
      {
        return a3 - v6;
      }
      a2 += v7;
      v6 -= v7;
      if (!v6)
        return a3 - v6;
    }
  }
  v6 = 0;
  return a3 - v6;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3;
  size_t v6;
  ssize_t v7;

  v3 = __nbyte;
  if (__nbyte)
  {
    v6 = __nbyte;
    do
    {
      v7 = write(__fd, __buf, v6);
      if (v7 <= 0)
      {
        if (*__error() != 4)
          return -1;
        v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

_DWORD *TAOpopenl(char *a1, const char *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v12;
  uint64_t *v13;
  char **v14;
  char **v15;
  uint64_t v16;
  char **v17;
  char *v18;
  _DWORD *v19;
  uint64_t *v21;
  char **v22;

  v21 = &a9;
  v12 = 8;
  do
  {
    v13 = v21++;
    v12 += 8;
  }
  while (*v13);
  v14 = (char **)malloc_type_malloc(v12, 0x443D267uLL);
  if (v14)
  {
    v15 = v14;
    v22 = (char **)&a9;
    *v14 = a3;
    v16 = 1;
    do
    {
      v17 = v22++;
      v18 = *v17;
      v14[v16++] = v18;
    }
    while (v18);
    v19 = TAOpopenv(a1, a2, v14);
    free(v15);
  }
  else
  {
    v19 = 0;
    *__error() = 12;
  }
  return v19;
}

_DWORD *TAOpopenv(char *a1, const char *a2, char *const *a3)
{
  const char *v5;
  char *v6;
  _DWORD *v7;
  pid_t v8;
  pid_t v9;
  FILE *v10;
  int v11;
  int v12;
  int *v14;
  int v15;
  int v16;
  uint64_t v17;

  v5 = a1;
  v17 = *MEMORY[0x24BDAC8D0];
  v6 = strchr(a1, 43);
  if (v6)
  {
    if (socketpair(1, 1, 0, &v15) < 0)
      return 0;
    v5 = "r+";
  }
  else
  {
    v12 = *(unsigned __int8 *)v5;
    if (v12 != 119 && v12 != 114 || v5[1] || pipe(&v15) < 0)
      return 0;
  }
  v7 = malloc_type_malloc(0x18uLL, 0x10A00408A00E5F2uLL);
  if (!v7)
  {
    close(v15);
    close(v16);
    return v7;
  }
  v8 = fork();
  if (v8 == -1)
  {
    close(v15);
    close(v16);
    free(v7);
    return 0;
  }
  v9 = v8;
  if (!v8)
  {
    if (*v5 == 114)
    {
      close(v15);
      if (v16 != 1)
      {
        dup2(v16, 1);
        close(v16);
      }
      if (v6)
        dup2(1, 0);
    }
    else
    {
      if (v15)
      {
        dup2(v15, 0);
        close(v15);
      }
      close(v16);
    }
    execv(a2, a3);
    v14 = __error();
    _exit(*v14);
  }
  if (*v5 == 114)
  {
    v10 = fdopen(v15, v5);
    v11 = v16;
  }
  else
  {
    v10 = fdopen(v16, v5);
    v11 = v15;
  }
  close(v11);
  *(_QWORD *)v7 = v10;
  v7[2] = v9;
  return v7;
}

uint64_t TAOpclose(void *a1)
{
  FILE *v2;
  pid_t v3;
  pid_t v4;
  int v6;

  v2 = *(FILE **)a1;
  v3 = *((_DWORD *)a1 + 2);
  v6 = 0;
  fclose(v2);
  do
    v4 = wait4(v3, &v6, 0, 0);
  while (v4 == -1 && *__error() == 4);
  free(a1);
  if (v4 == -1)
    return 0xFFFFFFFFLL;
  else
    return v6;
}

uint64_t TAOlaccess(const char *a1, int a2)
{
  uid_t v5;
  gid_t *v6;
  uint64_t v7;
  gid_t *v8;
  int v9;

  v9 = 0;
  v8 = 0;
  if (TAObuildgrouplist(&v9, &v8))
    return 1;
  v5 = geteuid();
  v6 = v8;
  v7 = TAOlaccess2(a1, a2, v5, v9, (int *)v8);
  free(v6);
  return v7;
}

uint64_t TAObuildgrouplist(int *a1, gid_t **a2)
{
  gid_t *v4;
  gid_t *v5;
  int v6;
  int v7;
  uint64_t result;

  v4 = (gid_t *)malloc_type_malloc(0x40uLL, 0x100004052888210uLL);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = getgroups(16, v4);
  if (v6 < 0)
    return 1;
  v7 = v6;
  result = 0;
  *a1 = v7;
  *a2 = v5;
  return result;
}

uint64_t TAOlaccess2(const char *a1, int a2, int a3, int a4, int *a5)
{
  uint64_t v10;
  int v11;
  unsigned int v12;
  stat v13;

  memset(&v13, 0, sizeof(v13));
  if (lstat(a1, &v13) < 0)
    return *__error();
  if (v13.st_uid == a3)
  {
    if (((~(v13.st_mode >> 6) | 0xFFFFFFF8) & a2) != 0)
      return 13;
    else
      return 0;
  }
  else
  {
    if (a4 < 1)
    {
LABEL_11:
      v12 = 0;
    }
    else
    {
      v10 = a4;
      while (1)
      {
        v11 = *a5++;
        if (v11 == v13.st_gid)
          break;
        if (!--v10)
          goto LABEL_11;
      }
      if (((~(v13.st_mode >> 3) | 0xFFFFFFF8) & a2) == 0)
        return 0;
      v12 = 13;
    }
    if (((~LOBYTE(v13.st_mode) | 0xFFFFFFF8) & a2) != 0)
      return 13;
    else
      return v12;
  }
}

uint64_t TAOsystemv(const char *a1, char *const *a2)
{
  FILE **v2;
  FILE **v3;
  char v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = (FILE **)TAOpopenv("r", a1, a2);
  if (fgets(v5, 1024, *v2))
  {
    v3 = (FILE **)MEMORY[0x24BDAC8E8];
    do
      fputs(v5, *v3);
    while (fgets(v5, 1024, *v2));
  }
  return TAOpclose(v2);
}

uint64_t IONewBuffer(const void ***a1, unsigned int a2)
{
  const void **v4;
  const void **v5;
  size_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = (const void **)malloc_type_malloc(0xA0uLL, 0x10F0040F7EB2C67uLL);
  if (!v4)
    goto LABEL_10;
  v5 = v4;
  *((_DWORD *)v4 + 26) = a2;
  v6 = a2;
  v7 = malloc_type_valloc(a2, 0xD1DF45F9uLL);
  v5[14] = v7;
  if (!v7)
  {
    free(v5);
LABEL_10:
    *a1 = 0;
    return *__error();
  }
  v8 = mprotect(v7, a2, 3);
  if (!(_DWORD)v8)
  {
    v8 = mlock(v5[14], v6);
    if (!(_DWORD)v8)
    {
      *a1 = v5;
      return v8;
    }
  }
  v9 = (void *)v5[14];
  if (v9)
    free(v9);
  free(v5);
  *a1 = 0;
  if ((_DWORD)v8 == -1)
    return *__error();
  return v8;
}

uint64_t IOJobCopyInfo(pthread_mutex_t *a1, const __CFArray *a2, CFMutableDictionaryRef *a3)
{
  CFMutableDictionaryRef Mutable;
  _QWORD v8[2];
  CFRange v9;

  *a3 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8[0] = Mutable;
  v8[1] = a1;
  pthread_mutex_lock(a1);
  v9.length = CFArrayGetCount(a2);
  v9.location = 0;
  CFArrayApplyFunction(a2, v9, (CFArrayApplierFunction)DictKeyFiller, v8);
  pthread_mutex_unlock(a1);
  *a3 = Mutable;
  return 0;
}

uint64_t iCacheDispose(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[2];
  if (v2)
    free(v2);
  free(a1);
  return 0;
}

void InfoFillerGetStateName(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  unsigned int v5;
  CFStringRef v6;

  v5 = *(_DWORD *)(a1 + 168);
  if (v5 >= 6)
    v5 = 6;
  v6 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], off_24CEC2728[v5], 0x600u);
  CFDictionaryAddValue(a3, a2, v6);
  CFRelease(v6);
}

void InfoFillerGetCurInstrNum(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, (const void *)(a1 + 172));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTotalBlocks(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  uint64_t valuePtr;

  valuePtr = *(_QWORD *)(a1 + 200);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetProcessed(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  uint64_t valuePtr;

  valuePtr = *(_QWORD *)(a1 + 208);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetStatusCode(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = *(_DWORD *)(a1 + 532);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTime(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  uint64_t v5;
  time_t v7;
  CFNumberRef v8;
  uint64_t valuePtr;

  if (*(_DWORD *)(a1 + 168) >= 2u)
  {
    v7 = *(_QWORD *)(a1 + 192);
    if (!v7)
      v7 = time(0);
    v5 = v7 - *(_QWORD *)(a1 + 184);
  }
  else
  {
    v5 = -1;
  }
  valuePtr = v5;
  v8 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v8);
  CFRelease(v8);
}

void InfoFillerGetThreadCount(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt16Type, (const void *)(a1 + 248));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBufferCount(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt16Type, (const void *)(a1 + 250));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBufferSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, (const void *)(a1 + 244));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetBlockSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = *(_DWORD *)(a1 + 240);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetPercentThreshold(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt16Type, (const void *)(a1 + 252));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetTimeThreshold(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;

  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt16Type, (const void *)(a1 + 254));
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetChecksum(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  unsigned int v6;
  uint64_t *v7;
  uint64_t *v8;
  unsigned int *v9;
  int v10;
  int v11;
  __int16 *i;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t (**v16)();
  int v17;
  int v18;
  CFIndex v19;
  CFDataRef v20;
  UInt8 bytes[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 544))
  {
    v23 = 0u;
    v24 = 0u;
    *(_OWORD *)bytes = 0u;
    v22 = 0u;
    v6 = *(_DWORD *)(a1 + 552);
    v7 = (uint64_t *)(a1 + 376);
    v8 = (uint64_t *)(a1 + 376);
    while (1)
    {
      v8 = (uint64_t *)*v8;
      if (!v8)
        break;
      if (*((_DWORD *)v8 + 2) == v6)
      {
        v9 = *(unsigned int **)(a1 + 256);
        if (*v9 > v6)
        {
          v10 = (unsigned __int16)InstructionTable;
          if (InstructionTable)
          {
            v11 = LOWORD(v9[12 * v6 + 2]);
            for (i = &word_254B6689C; (unsigned __int16)*i != v11; i += 26)
            {
              if (!(_WORD)--v10)
                return;
            }
            if (*((_DWORD *)i + 9))
            {
              LODWORD(v13) = (unsigned __int16)i[20];
              if (i[20])
              {
                v14 = 0;
                v15 = 0;
                do
                {
                  while (1)
                  {
                    if (StepTable)
                    {
                      v16 = &off_254B66740;
                      v17 = (unsigned __int16)StepTable;
                      while (*((unsigned __int16 *)v16 - 20) != (unsigned __int16)i[v14 + 21])
                      {
                        --v17;
                        v16 += 6;
                        if (!(_WORD)v17)
                          goto LABEL_20;
                      }
                      if ((*((_WORD *)v16 - 3) & 1) != 0)
                        break;
                    }
LABEL_20:
                    if (++v14 >= v13)
                    {
                      if ((v15 & 1) != 0)
                        goto LABEL_26;
                      return;
                    }
                  }
                  if (((unsigned int (*)(uint64_t, uint64_t))*v16)(v8[2], 4))
                    return;
                  v13 = (unsigned __int16)i[20];
                  ++v14;
                  v15 = 1;
                }
                while (v14 < v13);
LABEL_26:
                while (1)
                {
                  v7 = (uint64_t *)*v7;
                  if (!v7)
                    break;
                  if (*((_DWORD *)v7 + 2) == *(_DWORD *)(a1 + 552))
                  {
                    v18 = *(_DWORD *)v7[2] - 4;
                    if (v18 >= 5)
                    {
                      *(_DWORD *)bytes = bswap32(*(unsigned int *)bytes);
                      v19 = 4;
                    }
                    else
                    {
                      v19 = qword_212DE4560[v18];
                    }
                    v20 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], bytes, v19);
                    CFDictionaryAddValue(a3, a2, v20);
                    CFRelease(v20);
                    return;
                  }
                }
              }
            }
          }
        }
        return;
      }
    }
  }
}

void InfoFillerGetSkipSize(uint64_t a1, const void *a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  uint64_t valuePtr;

  valuePtr = *(_QWORD *)(a1 + 216);
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  CFDictionaryAddValue(a3, a2, v5);
  CFRelease(v5);
}

void InfoFillerGetSkipInstrs(uint64_t a1, uint64_t a2, __CFDictionary *a3)
{
  const __CFAllocator *v4;
  __CFArray *Mutable;
  _DWORD *v6;
  unsigned int v7;
  _DWORD *v8;
  __CFDictionary *v9;
  CFNumberRef v10;
  const void *v11;
  const void *v12;
  CFNumberRef v13;
  CFNumberRef v14;
  CFNumberRef v15;
  __int16 valuePtr;
  uint64_t v18;

  v18 = 0;
  valuePtr = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
  if (*(_DWORD *)(a1 + 280))
  {
    v6 = *(_DWORD **)(a1 + 288);
    if (*v6)
    {
      v7 = 0;
      v8 = v6 + 2;
      do
      {
        v9 = CFDictionaryCreateMutable(v4, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        valuePtr = *v8;
        v10 = CFNumberCreate(v4, kCFNumberSInt16Type, &valuePtr);
        CFDictionaryAddValue(v9, CFSTR("Instruction Code"), v10);
        CFRelease(v10);
        v11 = (const void *)*((_QWORD *)v8 + 1);
        if (v11)
          CFDictionaryAddValue(v9, CFSTR("Source Device"), v11);
        v12 = (const void *)*((_QWORD *)v8 + 2);
        if (v12)
          CFDictionaryAddValue(v9, CFSTR("Target Device"), v12);
        v18 = *((_QWORD *)v8 + 3);
        v13 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, CFSTR("Block Count"), v13);
        CFRelease(v13);
        v18 = *((_QWORD *)v8 + 4);
        v14 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, CFSTR("Source Offset"), v14);
        CFRelease(v14);
        v18 = *((_QWORD *)v8 + 5);
        v15 = CFNumberCreate(v4, kCFNumberSInt64Type, &v18);
        CFDictionaryAddValue(v9, CFSTR("Target Offset"), v15);
        CFRelease(v15);
        CFArrayAppendValue(Mutable, v9);
        CFRelease(v9);
        ++v7;
        v8 += 12;
      }
      while (v7 < **(_DWORD **)(a1 + 288));
    }
  }
  CFDictionaryAddValue(a3, CFSTR("Skip Instructions"), Mutable);
  CFRelease(Mutable);
}

uint64_t IOCV(_DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int16 *a9, uint64_t a10)
{
  CC_SHA1_CTX *v10;
  int v11;
  int *v12;
  char **v13;
  int v14;
  int v15;
  int v17;
  char **v18;
  int v19;
  int v20;
  int *v22;
  void *v23;

  switch(a2)
  {
    case 4:
      if (*(_QWORD *)(a10 + 544))
      {
        v12 = &ChecksumDescriptors;
        v13 = off_24CEC2740;
        do
        {
          v15 = *((_DWORD *)v13 + 8);
          v13 += 4;
          v14 = v15;
        }
        while (v15 != -1 && v14 != *a1);
        if (v14 != -1)
          v12 = (int *)v13;
        (*((void (**)(__int16 *))v12 + 3))(a9);
        return 0;
      }
      return 22;
    case 3:
      v17 = *a9;
      *a1 = v17;
      if (!*(_QWORD *)(a10 + 544))
      {
        v18 = off_24CEC2740;
        do
        {
          v20 = *((_DWORD *)v18 + 8);
          v18 += 4;
          v19 = v20;
        }
        while (v20 != -1 && v19 != v17);
        if (v19 == -1)
          v22 = &ChecksumDescriptors;
        else
          v22 = (int *)v18;
        v23 = malloc_type_malloc(*((_QWORD *)v22 + 1), 0xA8079641uLL);
        *(_QWORD *)(a10 + 544) = v23;
        if (!v23)
          return 12;
        (*((void (**)(void))v22 + 2))();
      }
      break;
    case 1:
      v10 = (CC_SHA1_CTX *)*((_QWORD *)a9 + 19);
      if (v10)
      {
        v11 = *((_DWORD *)a9 + 18) * *((_DWORD *)a9 + 22);
        switch(*a1)
        {
          case 2:
            MKBlockChecksum2(v10, *((unsigned __int8 **)a9 + 14), v11);
            break;
          case 3:
            MKImageChecksum(v10, *((unsigned __int8 **)a9 + 14), v11);
            break;
          case 4:
            CC_SHA1_Update(v10, *((const void **)a9 + 14), v11);
            break;
          case 5:
            CC_SHA224_Update((CC_SHA256_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 6:
            CC_SHA256_Update((CC_SHA256_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 7:
            CC_SHA384_Update((CC_SHA512_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          case 8:
            CC_SHA512_Update((CC_SHA512_CTX *)v10, *((const void **)a9 + 14), v11);
            break;
          default:
            MKBlockChecksum(v10, *((unsigned int **)a9 + 14), v11);
            break;
        }
        return 0;
      }
      return 22;
  }
  return 0;
}

uint64_t IOCP()
{
  return 0;
}

_DWORD *ClearFourByteChecksumInitialAction(_DWORD *result)
{
  *result = 0;
  return result;
}

_DWORD *CopyFourByteChecksumFinalAction(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t IOSetParams(uint64_t a1, unsigned int a2)
{
  unsigned int *v2;
  int v3;
  int v6;
  __int16 *i;
  uint64_t result;
  uint64_t *v9;
  uint64_t *v10;
  unsigned int v11;
  unint64_t v12;
  int v13;
  __int16 *v14;
  int v15;
  uint64_t *v16;

  v2 = *(unsigned int **)(a1 + 256);
  if (*v2 <= a2)
    return 22;
  v3 = (unsigned __int16)InstructionTable;
  if (!InstructionTable)
    return 2;
  v6 = LOWORD(v2[12 * a2 + 2]);
  for (i = &word_254B6689C; (unsigned __int16)*i != v6; i += 26)
  {
    if (!(_WORD)--v3)
      return 2;
  }
  v9 = (uint64_t *)(a1 + 376);
  while (1)
  {
    v9 = (uint64_t *)*v9;
    if (!v9)
      break;
    if (*((_DWORD *)v9 + 2) == a2)
    {
      result = 6;
      v10 = v9;
      if (!*((_DWORD *)i + 9))
        return result;
      goto LABEL_16;
    }
  }
  v16 = 0;
  if (!*((_DWORD *)i + 9))
    return 6;
  result = BuildiCache((uint64_t)i, &v16);
  v10 = v16;
  if (!v16)
    return result;
LABEL_16:
  *((_DWORD *)v10 + 2) = a2;
  v11 = (unsigned __int16)i[20];
  if (i[20])
  {
    v12 = 0;
    v13 = (unsigned __int16)StepTable;
    do
    {
      if ((_WORD)v13)
      {
        v14 = &word_254B6673A;
        v15 = v13;
        while (*(v14 - 17) != i[v12 + 21])
        {
          --v15;
          v14 += 24;
          if (!(_WORD)v15)
            goto LABEL_27;
        }
        if ((*v14 & 1) != 0)
        {
          result = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 3))(v10[2], 3);
          if ((_DWORD)result)
            return result;
          v13 = (unsigned __int16)StepTable;
          v11 = (unsigned __int16)i[20];
        }
      }
      else
      {
        v13 = 0;
      }
LABEL_27:
      ++v12;
    }
    while (v12 < v11);
  }
  if (!v9 && !(_DWORD)result)
  {
    stkputbtm(a1 + 368, v10);
    return 0;
  }
  return result;
}

const char *MKISOFSIdentity()
{
  return "ISO9660";
}

const char *ISOCodeSearch(int a1)
{
  const char *result;
  char **v3;
  int v4;

  if (a1 == 32769)
    return "ISO SYSTEM AREA";
  v3 = &off_24CEC2898;
  do
  {
    result = *v3;
    if (!*v3)
      break;
    v4 = *((unsigned __int16 *)v3 - 4);
    v3 += 2;
  }
  while (v4 != a1);
  return result;
}

unsigned __int16 *ISODescriptorSearch(char *a1)
{
  unsigned __int16 *result;

  result = PMLookupDESC(a1, 0, (unsigned __int16 *)&ISODescriptors);
  if (result)
    return (unsigned __int16 *)*result;
  return result;
}

uint64_t ISOCategorize(int a1)
{
  __int16 *v1;
  uint64_t v2;

  v1 = &ISODescriptors;
  while ((unsigned __int16)*v1 != a1)
  {
    v2 = *((_QWORD *)v1 + 3);
    v1 += 8;
    if (!v2)
    {
      v1 = (__int16 *)&unk_24CEC28F0;
      return (unsigned __int16)v1[1];
    }
  }
  return (unsigned __int16)v1[1];
}

uint64_t ISOSetupNewPartitionList(const void **a1, int a2, unsigned __int16 a3)
{
  _DWORD *v4;

  if ((a3 & 0x1FF) != 0)
    return 5;
  v4 = *a1;
  v4[128] = 2097668;
  *((_WORD *)v4 + 259) = a3;
  *((_WORD *)v4 + 260) = 0x7FFF;
  *((_WORD *)v4 + 1) = a3;
  v4[1] = a2;
  *((_WORD *)v4 + 250) = a3 >> 9;
  return PMGenPartitionType(a1, 32769, 0, 16, 0x800u, 0, 0, 0, 0xFFFFu);
}

uint64_t defaultvd2pmrecord(uint64_t a1, unsigned __int8 *a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 554) = *a2;
  return 0;
}

uint64_t VReadISOPartitionsII(const void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _BYTE *))
{
  int v5;
  _BYTE *v10;
  _BYTE *v11;
  char *v12;
  char *v13;
  unsigned __int16 v14;
  unsigned int i;
  int v16;
  unsigned int v17;
  unsigned int v18;
  char *v19;
  char *v20;
  void *v21;
  char *v22;
  void *v23;
  int v24;
  char *v26;
  unsigned int v27;
  _BYTE *v28;
  _BYTE *v29;

  if ((*(_WORD *)(a3 + 4) & 0x1FF) != 0)
  {
    LOWORD(v5) = 5;
    return (__int16)v5;
  }
  v10 = malloc_type_malloc(0x800uLL, 0x454C6FD9uLL);
  if (!v10)
    goto LABEL_31;
  v11 = v10;
  v12 = (char *)malloc_type_calloc(1uLL, 0x430uLL, 0x10800402BBFFE52uLL);
  if (!v12)
  {
    free(v11);
    goto LABEL_31;
  }
  v13 = v12;
  v14 = 0;
  v27 = 0x800u / *(_DWORD *)(a3 + 4);
  v28 = v12 + 16;
  v29 = v12 + 48;
  v26 = v12 + 448;
  for (i = -1; i < 0x20; ++i)
  {
    v16 = a5(a4, 2, 2048, i + 17, 1, v11);
    if (v16)
      break;
    bzero(v13, 0x430uLL);
    if (strncmp(v11 + 1, "CD001", 5uLL))
      break;
    *((_WORD *)v13 + 253) = i + 1;
    *((_WORD *)v13 + 252) = -1;
    *((_DWORD *)v13 + 117) = 2;
    v17 = *v11;
    if (v17 > 1)
    {
      if (v17 != 2)
      {
        if (v17 == 255)
          break;
        continue;
      }
    }
    else
    {
      if (!*v11)
      {
        *((_QWORD *)v13 + 1) = *(unsigned int *)(v11 + 71);
        *((_WORD *)v13 + 277) = 0;
        v22 = (char *)PMCodeSearch(0, 32);
        strncpypad(v29, v22, 0x20uLL, 0);
        strncpypad(v28, v11 + 7, 0x20uLL, 0);
        v23 = malloc_type_malloc(0x800uLL, 0xE1A58C47uLL);
        *((_QWORD *)v13 + 55) = v23;
        if (!v23)
        {
LABEL_28:
          LOWORD(v24) = -1;
LABEL_29:
          v5 = (__int16)v24;
          goto LABEL_30;
        }
        memcpy(v23, v11, 0x800uLL);
        goto LABEL_17;
      }
      if (v17 != 1)
        continue;
      *((_WORD *)*a1 + 259) = *((_WORD *)v11 + 64);
      *((_DWORD *)v13 + 117) = 0;
    }
    v18 = (*((_DWORD *)v11 + 20) - 16) * v27;
    *((_DWORD *)v13 + 2) = 16 * v27;
    *((_DWORD *)v13 + 3) = v18;
    *((_WORD *)v13 + 277) = v17;
    *(_QWORD *)(v13 + 84) = v18;
    v19 = (char *)PMCodeSearch(v17, 32);
    strncpypad(v29, v19, 0x20uLL, 0);
    v20 = (char *)strntrim(v11 + 40, 32);
    strncpypad(v28, v20, 0x20uLL, 0);
    v21 = malloc_type_malloc(0x800uLL, 0xABE66CEDuLL);
    *((_QWORD *)v13 + 55) = v21;
    if (!v21)
      goto LABEL_28;
    memcpy(v21, v11, 0x800uLL);
    MEMORY[0x2199A5D48](v26);
LABEL_17:
    if (!v14)
    {
      v24 = ISOSetupNewPartitionList(a1, *(_DWORD *)(a3 + 8), *(_DWORD *)(a3 + 4));
      if (v24)
        goto LABEL_29;
    }
    LOWORD(v24) = addentry(a1, v13, 0x210uLL, 0x20Au, 0xFFFFu, 0x430u);
    if ((_WORD)v24)
      goto LABEL_29;
    ++v14;
  }
  if ((unsigned __int16)v16 | v14)
    v5 = v16;
  else
    v5 = -5343;
LABEL_30:
  free(v11);
  free(v13);
  if (v5 == -1)
LABEL_31:
    v5 = *__error();
  return (__int16)v5;
}

uint64_t ISOWriteMedia(Ptr *a1, int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _BYTE *))
{
  _BYTE *v8;
  _BYTE *v9;
  SInt8 v10;
  Ptr v11;
  int v12;
  unsigned int v14;
  Ptr v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  tm *v22;
  uint64_t tm_gmtoff;
  uint64_t v24;
  _BYTE *v25;
  unsigned int v26;
  time_t v27;
  char v28[16];
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v8 = malloc_type_calloc(1uLL, 0x800uLL, 0x43E38DCAuLL);
    if (v8)
    {
      v9 = v8;
      v10 = HGetState(a1);
      HLock(a1);
      v11 = *a1;
      if (*((_WORD *)*a1 + 257) != 32 || a2 != 0xFFFF && (a2 & 0x100) != 0)
      {
        LOWORD(v12) = -50;
        goto LABEL_7;
      }
      v25 = v9;
      v26 = *((unsigned __int16 *)v11 + 259);
      if (*((_WORD *)v11 + 261))
      {
        v14 = 0;
        v15 = v11 + 544;
        v16 = 16;
        v12 = -50;
        while (1)
        {
          v17 = *((unsigned __int16 *)v15 + 269);
          if ((v17 - 1) < 2)
            break;
          if (!*((_WORD *)v15 + 269))
          {
            if ((_DWORD)v16 != 17)
            {
              LOWORD(v12) = -5323;
              v9 = v25;
              goto LABEL_7;
            }
            v24 = *((_QWORD *)v15 + 53);
            *(_BYTE *)v24 = 0;
            *(_DWORD *)(v24 + 1) = 808469571;
            *(_WORD *)(v24 + 5) = 305;
            strncpypad((_BYTE *)(v24 + 7), "EL TORITO SPECIFICATION", 0x20uLL, 0);
            *(_DWORD *)(v24 + 71) = *((_DWORD *)v15 - 2);
            goto LABEL_25;
          }
          if (v17 == 255)
            goto LABEL_30;
          v18 = *((_QWORD *)v15 + 53);
          if (v18)
          {
            *(_BYTE *)v18 = v17;
            *(_DWORD *)(v18 + 1) = 808469571;
            *(_WORD *)(v18 + 5) = 305;
LABEL_25:
            v12 = a4(a3, 3, v26, v16, 1, *((_BYTE **)v15 + 53));
            if (v12)
              goto LABEL_30;
            v16 = (v16 + 1);
          }
          ++v14;
          v15 += 1072;
          if (v14 >= *((unsigned __int16 *)v11 + 261))
            goto LABEL_30;
        }
        v19 = *((_QWORD *)v15 + 53);
        *(_BYTE *)v19 = v17;
        *(_DWORD *)(v19 + 1) = 808469571;
        *(_WORD *)(v19 + 5) = 305;
        strncpypad((_BYTE *)(v19 + 40), v15, 0x20uLL, 32);
        strncpypad((_BYTE *)(v19 + 8), "Mac OS X", 0x20uLL, 32);
        if (*(char *)(v19 + 318) <= 32)
          strncpypad((_BYTE *)(v19 + 318), "Apple Computer Inc.", 0x20uLL, 32);
        strncpypad((_BYTE *)(v19 + 446), "ei7dkb", 0x80uLL, 32);
        v20 = *((_DWORD *)v15 - 1);
        *(_DWORD *)(v19 + 80) = v20;
        *(_DWORD *)(v19 + 84) = bswap32(v20);
        *(_QWORD *)(v19 + 120) = 0x100000101000001;
        v21 = *((unsigned __int16 *)v11 + 259);
        *(_WORD *)(v19 + 128) = v21;
        *(_WORD *)(v19 + 130) = bswap32(v21) >> 16;
        v27 = time(0);
        v22 = localtime(&v27);
        tm_gmtoff = v22->tm_gmtoff;
        __sprintf_chk(v28, 0, 0x21uLL, "%4.4d%2.2d%2.2d%2.2d%2.2d%2.2d00-", v22->tm_year + 1900, v22->tm_mon + 1, v22->tm_mday, v22->tm_hour, v22->tm_min, v22->tm_sec);
        v29 = ((((unsigned __int128)(tm_gmtoff * (__int128)0x48D159E26AF37C05) >> 64) & 0x8000000000000000) != 0)
            + ((unsigned __int16)((unsigned __int128)(tm_gmtoff * (__int128)0x48D159E26AF37C05) >> 64) >> 8);
        if (!*(_DWORD *)(v19 + 813))
        {
          *(_OWORD *)(v19 + 813) = *(_OWORD *)v28;
          *(_BYTE *)(v19 + 829) = v29;
        }
        *(_BYTE *)(v19 + 846) = v29;
        *(_OWORD *)(v19 + 830) = *(_OWORD *)v28;
        *(_BYTE *)(v19 + 881) = 1;
        goto LABEL_25;
      }
      v12 = -50;
      v16 = 16;
LABEL_30:
      v9 = v25;
      if (!v12)
      {
        *(_DWORD *)(v25 + 1) = 808469571;
        *(_WORD *)(v25 + 5) = 305;
        *v25 = -1;
        LOWORD(v12) = a4(a3, 3, v26, v16, 1, v25);
      }
LABEL_7:
      free(v9);
    }
    else
    {
      v10 = 0;
      LOWORD(v12) = -1;
    }
  }
  else
  {
    v10 = 0;
    LOWORD(v12) = -109;
  }
  HSetState(a1, v10);
  return (__int16)v12;
}

uint64_t ISOReadMedia(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _BYTE *))
{
  unsigned int v7;
  uint64_t result;
  const void **v9;
  uint64_t v10;
  _DWORD *v11;
  _QWORD v12[3];

  memset(v12, 0, sizeof(v12));
  if (a2 == 0xFFFF)
    v7 = 3584;
  else
    v7 = a2;
  result = a4(a3, 15, 2048, 0, 0, v12);
  if ((_DWORD)result)
  {
    v9 = 0;
  }
  else
  {
    v9 = (const void **)NewHandleClear(528);
    result = MemError();
    if (v9)
    {
      v11 = *v9;
      v11[128] = 33554948;
      *((_WORD *)v11 + 259) = WORD2(v12[0]);
      result = VReadISOPartitionsII(v9, v10, (uint64_t)v12, a3, a4);
      if (!(_DWORD)result)
      {
        if ((v7 & 0x10) == 0 || (result = PMAccountFreespace(v9, 0, v7), !(_DWORD)result))
        {
          if ((v7 & 0x80) != 0)
            result = PMRationalise(v9);
          else
            result = 0;
        }
      }
    }
  }
  *a1 = v9;
  return result;
}

uint64_t ISOCFRecordSections(const UInt8 *a1, __CFArray *a2)
{
  uint64_t v2;
  uint64_t v4;
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  int v8;
  int v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFMutableArrayRef v12;
  CFMutableArrayRef v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  __int16 *v20;
  uint64_t v21;
  __CFDictionary *v22;
  __CFDictionary *v23;
  uint64_t v24;
  unsigned int v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFStringRef v28;
  CFStringRef v29;
  CFStringRef v30;
  CFStringRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  CFNumberRef v35;
  unsigned int v37;
  unsigned int valuePtr;
  uint64_t v39;
  uint64_t v40;
  __int16 v41;

  v2 = 0xFFFFFFFFLL;
  if (!a2)
    return v2;
  v4 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
    return v2;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return v2;
  v7 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("ID"), CFSTR("MAP"));
  v8 = *(unsigned __int16 *)(v4 + 2) >> 9;
  v9 = *(_DWORD *)(v4 + 4);
  valuePtr = 16 * v8;
  v10 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v10)
    goto LABEL_33;
  v11 = v10;
  CFDictionarySetValue(v7, CFSTR("Offset"), v10);
  CFRelease(v11);
  MKCFRecordSectionSize(v7, valuePtr, valuePtr, (v9 * v8), (v9 * v8), *(unsigned __int16 *)(v4 + 518));
  v12 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  if (!v12)
    goto LABEL_33;
  v13 = v12;
  CFDictionarySetValue(v7, CFSTR("Partitions"), v12);
  CFRelease(v13);
  v39 = 0;
  v40 = 0;
  v14 = *(_QWORD *)a1;
  v15 = *(unsigned __int16 *)(*(_QWORD *)a1 + 522);
  if (!*(_WORD *)(*(_QWORD *)a1 + 522))
  {
LABEL_28:
    mkcfstoreref(v7, a1);
    v2 = 0;
    goto LABEL_33;
  }
  v16 = 0;
  v37 = *(unsigned __int16 *)(v14 + 2) >> 9;
  v41 = 0;
  while (1)
  {
    v17 = v14 + 1072 * v16;
    v18 = v17 + 528;
    v19 = *(unsigned __int16 *)(v17 + 1082);
    v20 = &ISODescriptors;
    while ((unsigned __int16)*v20 != v19)
    {
      v21 = *((_QWORD *)v20 + 3);
      v20 += 8;
      if (!v21)
      {
        v20 = (__int16 *)&unk_24CEC28F0;
        break;
      }
    }
    if (v20[1] != 2)
      goto LABEL_27;
    v22 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v22)
    {
      v2 = 0xFFFFFFFFLL;
      goto LABEL_33;
    }
    v23 = v22;
    v24 = CFDictionarySetUUID(v22, CFSTR("GUID"), (CFUUIDBytes *)(v14 + 1072 * v16 + 976));
    if ((_DWORD)v24)
      break;
    if (*(__int16 *)(v14 + 1072 * v16 + 1034) < 0)
    {
      v41 = 0;
    }
    else
    {
      v25 = *(unsigned __int16 *)(v14 + 1072 * v16 + 1034) + 1;
      v41 = v25 / v37;
      if (v37 <= v25)
      {
        v26 = CFNumberCreate(0, kCFNumberSInt16Type, &v41);
        if (v26)
        {
          v27 = v26;
          CFDictionarySetValue(v23, CFSTR("Partition ID"), v26);
          CFRelease(v27);
        }
      }
    }
    if (*(_BYTE *)(v18 + 16))
    {
      v28 = CFStringCreateWithCString(0, (const char *)(v18 + 16), 0);
      if (!v28)
        goto LABEL_29;
      v29 = v28;
      CFDictionarySetValue(v23, CFSTR("Name"), v28);
      CFRelease(v29);
    }
    v30 = CFStringCreateWithCString(0, (const char *)(v18 + 48), 0);
    if (!v30)
      goto LABEL_29;
    v31 = v30;
    CFDictionarySetValue(v23, CFSTR("Type"), v30);
    CFRelease(v31);
    v40 = *(_DWORD *)(v18 + 8) * v37;
    v39 = *(_DWORD *)(v18 + 12) * v37;
    v32 = CFNumberCreate(0, kCFNumberSInt64Type, &v40);
    if (!v32
      || (v33 = v32,
          CFDictionarySetValue(v23, CFSTR("Offset"), v32),
          CFRelease(v33),
          (v34 = CFNumberCreate(0, kCFNumberSInt64Type, &v39)) == 0))
    {
LABEL_29:
      v2 = 22;
      goto LABEL_32;
    }
    v35 = v34;
    CFDictionarySetValue(v23, CFSTR("Size"), v34);
    CFRelease(v35);
    CFArrayAppendValue(v13, v23);
    CFRelease(v23);
    v15 = *(unsigned __int16 *)(v14 + 522);
LABEL_27:
    if (++v16 >= (unint64_t)v15)
      goto LABEL_28;
  }
  v2 = v24;
LABEL_32:
  CFRelease(v23);
LABEL_33:
  CFArrayAppendValue(a2, v7);
  CFRelease(v7);
  return v2;
}

uint64_t stksearch(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  unsigned int v3;
  BOOL v4;

  v2 = (_QWORD *)(a1 + 8);
  v3 = -1;
  do
  {
    v2 = (_QWORD *)*v2;
    ++v3;
    if (v2)
      v4 = v2 == a2;
    else
      v4 = 1;
  }
  while (!v4);
  if (v2)
    return v3;
  else
    return 0xFFFFFFFFLL;
}

_QWORD *stklocate(uint64_t a1, int a2)
{
  _QWORD *result;
  int v3;

  result = *(_QWORD **)(a1 + 8);
  v3 = a2 + 1;
  do
  {
    if (!--v3)
      break;
    result = (_QWORD *)*result;
  }
  while (result);
  return result;
}

uint64_t stkputtop(uint64_t result, _QWORD *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 16);
    *a2 = *(_QWORD *)(result + 8);
    *(_QWORD *)(result + 8) = a2;
    if (!v2)
      *(_QWORD *)(result + 16) = a2;
    ++*(_WORD *)(result + 2);
  }
  return result;
}

uint64_t stkenqueue(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  if (a2)
  {
    if (!a3)
    {
      v3 = *(_QWORD **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = a2;
      *a2 = 0;
      if (!v3)
        v3 = (_QWORD *)(a1 + 8);
      goto LABEL_12;
    }
    if (a3 == (_QWORD *)-1)
    {
      v3 = (_QWORD *)(a1 + 16);
      v4 = *(_QWORD *)(a1 + 16);
      *a2 = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 8) = a2;
      if (!v4)
        goto LABEL_12;
    }
    else
    {
      *a2 = *a3;
      *a3 = a2;
      if (!*a2)
      {
        v3 = (_QWORD *)(a1 + 16);
LABEL_12:
        *v3 = a2;
      }
    }
    v5 = 0;
    ++*(_WORD *)(a1 + 2);
    return v5;
  }
  return 22;
}

uint64_t stkdequeue(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  BOOL v5;
  _QWORD *v6;
  uint64_t v7;

  if (a2)
  {
    v2 = 0;
    v3 = (_QWORD *)(a1 + 8);
    do
    {
      v4 = v2;
      v3 = (_QWORD *)*v3;
      if (v3)
        v5 = v3 == a2;
      else
        v5 = 1;
      v2 = v3;
    }
    while (!v5);
    if (v3)
    {
      v6 = (_QWORD *)*v3;
      if (v4)
      {
        *v4 = v6;
        if (!v6)
          goto LABEL_15;
      }
      else
      {
        *(_QWORD *)(a1 + 8) = v6;
        if (!v6)
        {
          v4 = 0;
LABEL_15:
          *(_QWORD *)(a1 + 16) = v4;
        }
      }
      v7 = 0;
      --*(_WORD *)(a1 + 2);
      return v7;
    }
  }
  return 22;
}

uint64_t stkiterate(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = *(_QWORD **)(a1 + 8);
  while (v4)
  {
    v5 = (_QWORD *)*v4;
    v6 = a3();
    v4 = v5;
    if ((_DWORD)v6)
      return v6;
  }
  return 0;
}

uint64_t stkdestroy(uint64_t a1)
{
  _QWORD *v1;
  __int16 v2;

  if (!a1)
    return 22;
  v1 = *(_QWORD **)(a1 + 8);
  if (v1)
  {
    v2 = *(_WORD *)(a1 + 2);
    do
    {
      v1 = (_QWORD *)*v1;
      --v2;
    }
    while (v1);
    *(_WORD *)(a1 + 2) = v2;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  return (uint64_t)v1;
}

uint64_t stkinit(_QWORD *a1)
{
  uint64_t result;

  if (!a1)
    return 22;
  result = 0;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  return result;
}

double DOSPBR_LtoN(char *__dst, char *__src)
{
  uint64_t v4;
  double result;

  if (__dst != __src)
    memcpy(__dst, __src, 0x200uLL);
  v4 = 0;
  *((_WORD *)__dst + 255) = *((_WORD *)__src + 255);
  do
  {
    result = *(double *)&__src[v4 + 454];
    *(double *)&__dst[v4 + 454] = result;
    v4 += 16;
  }
  while ((_DWORD)v4 != 64);
  return result;
}

uint64_t MBRFSDetect(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, int *a5)
{
  int v5;
  int v6;

  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    v5 = *a5;
    *a5 += 2500;
    v6 = *a2;
    if (v6 == 233 || v6 == 235 && a2[2] == 144)
      *a5 = v5 + 5000;
  }
  return 0;
}

uint64_t MBRSetBootloader(uint64_t a1, uint64_t a2, unint64_t a3, void *__src)
{
  uint64_t result;
  uint64_t v9;
  size_t v10;
  void *v11;

  if (!a1)
    return 22;
  result = 22;
  if ((a2 & 0x8000000000000000) == 0 && *(_WORD *)(a1 + 514) == 8)
  {
    if (*(__int16 *)(a1 + 1082) == -32768)
    {
      v9 = *(_QWORD *)(a1 + 968);
      if (v9 || (v11 = malloc_type_calloc(1uLL, 0x200uLL, 0xE62774D3uLL), (*(_QWORD *)(a1 + 968) = v11) == 0))
      {
        if (446 - a2 >= a3)
          v10 = a3;
        else
          v10 = 446 - a2;
        memcpy((void *)(v9 + a2), __src, v10);
        return 0;
      }
      else
      {
        return *__error();
      }
    }
    else
    {
      return 4294961973;
    }
  }
  return result;
}

uint64_t MBRGetBootloader(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t result;

  *a2 = 0;
  if (!a1 || *(_WORD *)(a1 + 514) != 8)
    return 22;
  if (*(__int16 *)(a1 + 1082) != -32768)
    return 4294961973;
  if (!*(_QWORD *)(a1 + 968))
    return 0;
  v4 = malloc_type_calloc(1uLL, 0x200uLL, 0x5A024F34uLL);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  memcpy(v4, *(const void **)(a1 + 968), 0x1BEuLL);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t MBRSetBootloaderFile(uint64_t a1, char *a2)
{
  int v3;
  int v4;
  ssize_t v5;
  uint64_t v6;
  _BYTE __src[512];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = open(a2, 0, 0);
  if (v3 < 0)
    return *__error();
  v4 = v3;
  v5 = read(v3, __src, 0x1BEuLL);
  if (v5 == -1)
  {
    close(v4);
    return *__error();
  }
  v6 = MBRSetBootloader(a1, 0, v5, __src);
  close(v4);
  if ((_DWORD)v6 == -1)
    return *__error();
  return v6;
}

uint64_t WriteDOSExtendedChain(unsigned __int16 *a1, __int16 *a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, size_t))
{
  size_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  BOOL v23;
  const void *v24;
  unsigned int v25;
  unsigned int v26;
  int v27;
  int v28;
  unsigned int v29;
  int v30;
  unsigned __int16 v31;
  __int16 v32;
  unsigned int v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, size_t);
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  __int16 v40;

  v14 = a1[1];
  v15 = malloc_type_calloc(1uLL, v14, 0x46A3296AuLL);
  if (!v15)
    return 12;
  v16 = v15;
  v17 = 0;
  v38 = -1;
  v39 = 0;
  v40 = -1;
  v18 = (unsigned __int16)*a2;
  *((_WORD *)v15 + 255) = -21931;
  if ((unsigned __int16)*a2 >= a1[261])
  {
LABEL_25:
    *(_DWORD *)(a3 + 12) = v17 - *(_DWORD *)(a3 + 8);
    v32 = a7(a6, 3, v14);
    goto LABEL_26;
  }
  v34 = a4;
  v36 = a7;
  v37 = a6;
  v19 = 0;
  v20 = (uint64_t)v15 + 446;
  v21 = (uint64_t)&a1[536 * v18 + 308];
  v35 = a3;
  while (1)
  {
    v22 = *(unsigned __int16 *)(v21 + 466);
    if (v22 == 5 || (v22 != 133 ? (v23 = v22 == 15) : (v23 = 1), v23))
    {
      v24 = *(const void **)(v21 + 352);
      if (v24)
        memcpy(v16, v24, 0x1BEuLL);
      goto LABEL_23;
    }
    if (v22 >> 12 <= 4)
      break;
LABEL_23:
    v31 = *a2 + 1;
    *a2 = v31;
    v21 += 1072;
    if (a1[261] <= v31)
    {
LABEL_24:
      v17 = v39;
      a6 = v37;
      goto LABEL_25;
    }
  }
  if ((*(_BYTE *)(v21 + 3) & 2) == 0)
    goto LABEL_24;
  if (v19)
  {
    *(_BYTE *)(v20 + 4) = 5;
    v25 = v39;
    v26 = v39 + 1;
    *(_DWORD *)(v20 + 8) = v39;
    *(_DWORD *)(v20 + 12) = 1;
    if (v25 >= *(_DWORD *)(v21 - 80))
    {
      *(_DWORD *)(v35 + 12) = v26 - *(_DWORD *)(v35 + 8);
      v32 = -5323;
      goto LABEL_26;
    }
    v27 = WriteDOSExtendedChain(a1, a2, v20, v34, a5, v37, a7);
    if (v27)
    {
      v32 = v27;
      goto LABEL_32;
    }
    v28 = *(_DWORD *)(v20 + 8);
    v29 = *(_DWORD *)(v20 + 12) + v28;
    if (v26 > v29)
      v29 = v26;
    v39 = v29;
    *(_DWORD *)(v20 + 8) = v28 - v34;
    a3 = v35;
    goto LABEL_22;
  }
  v30 = WriteGutz((uint64_t)a1, a2, &v40, v20, (int *)&v39, &v38, v37, a7);
  a5 = (a5 + 1);
  *(_WORD *)(v21 + 418) = a1[250] * a5 - 1;
  if (!v30)
  {
    *(_DWORD *)(v20 + 8) -= *(_DWORD *)(a3 + 8);
LABEL_22:
    a7 = v36;
    Setupdpp((uint64_t)a1, v20);
    ++v19;
    v20 += 16;
    goto LABEL_23;
  }
  v32 = v30;
  v26 = v39;
LABEL_32:
  *(_DWORD *)(v35 + 12) = v26 - *(_DWORD *)(v35 + 8);
LABEL_26:
  free(v16);
  return v32;
}

CFArrayRef MBRCFCreateMapRuns(uint64_t a1, uint64_t a2, int *a3)
{
  int Sectors;
  CFArrayRef v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  const __CFAllocator *v10;
  unint64_t v12;
  uint64_t valuePtr;
  CFTypeRef v14;
  void *values;
  CFTypeRef cf;
  void *keys[2];
  char v18[512];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24CEC3080;
  Sectors = MKMediaReadSectors(a1, 0, 1uLL, v18, 0);
  if (!Sectors)
  {
    v6 = 0;
    v7 = 63;
    while (1)
    {
      if (*(_DWORD *)&v18[v6 + 458])
      {
        v8 = v18[v6 + 450];
        v9 = v8 == 5 || v8 == 15;
        if (v9 || v8 == 133)
        {
          v5 = 0;
          Sectors = -4;
          goto LABEL_15;
        }
        if (v7 >= *(unsigned int *)&v18[v6 + 454])
          v7 = *(unsigned int *)&v18[v6 + 454];
      }
      v6 += 16;
      if ((_DWORD)v6 == 64)
      {
        v12 = v7;
        valuePtr = 0;
        v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
        cf = CFNumberCreate(v10, kCFNumberSInt64Type, &v12);
        v14 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFRelease(values);
        CFRelease(cf);
        v5 = CFArrayCreate(v10, &v14, 1, MEMORY[0x24BDBD690]);
        CFRelease(v14);
        Sectors = 0;
        goto LABEL_15;
      }
    }
  }
  v5 = 0;
LABEL_15:
  *a3 = Sectors;
  return v5;
}

uint64_t MBRCFSetBootcode(const __CFDictionary *a1, uint64_t a2, unint64_t a3, void *a4)
{
  const __CFArray *Value;
  const __CFDictionary *v8;
  uint64_t *v9;

  if (a1
    && (Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Sections"))) != 0
    && (v8 = CFArrayDictionarySearchWithIndexOptions(Value, CFSTR("ID"), CFSTR("MAP"), 0, 0),
        (v9 = (uint64_t *)mkcfrecoverref(v8)) != 0))
  {
    return MBRSetBootloader(*v9, a2, a3, a4);
  }
  else
  {
    return 22;
  }
}

uint64_t MKBSDCreateDeviceInfo(const char *a1, CFMutableDictionaryRef *a2)
{
  uint64_t MatchingServices;
  const __CFDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  mach_port_t mainPort;

  properties = 0;
  *a2 = 0;
  mainPort = 0;
  existing = 0;
  MatchingServices = MEMORY[0x2199A5790](*MEMORY[0x24BDAD2F0], &mainPort);
  if (!(_DWORD)MatchingServices)
  {
    v6 = IOBSDNameMatching(mainPort, 0, a1);
    if (v6)
    {
      MatchingServices = IOServiceGetMatchingServices(mainPort, v6, &existing);
      if (!(_DWORD)MatchingServices)
      {
        v7 = IOIteratorNext(existing);
        if ((_DWORD)v7)
        {
          v8 = v7;
          MatchingServices = IORegistryEntryCreateCFProperties(v7, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
          if (!(_DWORD)MatchingServices)
          {
            *a2 = CFDictionaryCreateMutableCopy(0, 0, properties);
            CFRelease(properties);
            properties = 0;
            if (*a2)
            {
              CFDictionaryRemoveValue(*a2, CFSTR("Content Hint"));
              MatchingServices = AppendDeviceInfo(v8, *a2);
              IOObjectRelease(v8);
              if ((_DWORD)MatchingServices)
              {
                CFRelease(*a2);
                *a2 = 0;
              }
            }
            else
            {
              MatchingServices = 0;
            }
          }
        }
        else
        {
          MatchingServices = 2;
        }
        IOObjectRelease(existing);
      }
    }
    else
    {
      return 2;
    }
  }
  return MatchingServices;
}

uint64_t AppendDeviceInfo(uint64_t a1, __CFDictionary *a2)
{
  uint64_t v3;
  const __CFAllocator *v4;
  const __CFString *v5;
  CFTypeRef v6;
  const void *v7;
  CFTypeRef v8;
  const void *v9;
  CFTypeRef v10;
  const void *v11;
  const __CFString *v12;
  uint64_t v13;
  CFTypeRef v14;
  CFNumberRef v15;
  CFTypeRef v16;
  const __CFData *v17;
  const __CFData *v18;
  const UInt8 *BytePtr;
  CFNumberRef v20;
  CFTypeRef v21;
  const __CFData *v22;
  const __CFData *v23;
  const UInt8 *v24;
  char *v25;
  CFStringRef v26;
  CFStringRef v27;
  uint64_t ParentEntry;
  char *v29;
  CFStringRef v30;
  CFStringRef v31;
  CFTypeRef v33;
  const void *v34;
  CFTypeRef v35;
  const void *v36;
  CFTypeRef v37;
  io_registry_entry_t parent;
  char v39[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 2;
  v3 = a1;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (const __CFString *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("Physical Interconnect"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (!v5)
  {
    CFDictionaryAddValue(a2, CFSTR("Device Type"), CFSTR("Number 47 Bus"));
    goto LABEL_30;
  }
  CFDictionaryAddValue(a2, CFSTR("Device Type"), v5);
  v6 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("Physical Interconnect Location"), v4, 3u);
  if (v6)
  {
    v7 = v6;
    CFDictionaryAddValue(a2, CFSTR("Physical Interconnect Location"), v6);
    CFRelease(v7);
  }
  if (CFStringCompare(v5, CFSTR("Virtual Interface"), 1uLL) == kCFCompareEqualTo)
    goto LABEL_30;
  if (CFStringCompare(v5, CFSTR("SCSI"), 1uLL) == kCFCompareEqualTo)
  {
    v14 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("IOUnit"), v4, 3u);
    if (!v14)
      goto LABEL_30;
    v11 = v14;
    v12 = CFSTR("Device ID");
    goto LABEL_18;
  }
  if (CFStringCompare(v5, CFSTR("ATA"), 1uLL) == kCFCompareEqualTo)
  {
    v16 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("unit number"), v4, 3u);
    if (!v16)
    {
      v16 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("IOUnit"), v4, 3u);
      if (!v16)
        goto LABEL_30;
    }
    CFDictionaryAddValue(a2, CFSTR("Device ID"), v16);
    CFRelease(v16);
    v17 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("AAPL,bus-id"), v4, 3u);
    if (!v17)
      goto LABEL_30;
    v18 = v17;
    BytePtr = CFDataGetBytePtr(v17);
    v20 = CFNumberCreate(0, kCFNumberSInt32Type, BytePtr);
    CFRelease(v18);
    if (!v20)
      goto LABEL_30;
LABEL_28:
    CFDictionaryAddValue(a2, CFSTR("Device Bus"), v20);
    v15 = v20;
    goto LABEL_29;
  }
  if (CFStringCompare(v5, CFSTR("ATAPI"), 1uLL) == kCFCompareEqualTo)
  {
    v21 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("unit number"), v4, 3u);
    if (!v21)
    {
      v21 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("IOUnit"), v4, 3u);
      if (!v21)
        goto LABEL_30;
    }
    CFDictionaryAddValue(a2, CFSTR("Device ID"), v21);
    CFRelease(v21);
    v22 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("AAPL,bus-id"), v4, 3u);
    if (!v22)
      goto LABEL_30;
    v23 = v22;
    v24 = CFDataGetBytePtr(v22);
    v20 = CFNumberCreate(0, kCFNumberSInt32Type, v24);
    CFRelease(v23);
    goto LABEL_28;
  }
  if (CFStringCompare(v5, CFSTR("FIREWIRE"), 1uLL))
  {
    if (CFStringCompare(v5, CFSTR("USB"), 1uLL) == kCFCompareEqualTo)
    {
      v8 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("USB Address"), v4, 3u);
      if (v8)
      {
        v9 = v8;
        CFDictionaryAddValue(a2, CFSTR("Device ID"), v8);
        CFRelease(v9);
        v10 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("busNumber"), v4, 3u);
        if (v10)
        {
          v11 = v10;
          v12 = CFSTR("Device Bus");
LABEL_18:
          CFDictionaryAddValue(a2, v12, v11);
          v15 = (CFNumberRef)v11;
LABEL_29:
          CFRelease(v15);
        }
      }
    }
  }
  else
  {
    v33 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("IOUnit"), v4, 3u);
    if (v33)
    {
      v34 = v33;
      CFDictionaryAddValue(a2, CFSTR("Device ID"), v33);
      CFRelease(v34);
      v35 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("FireWire Node ID"), v4, 3u);
      if (v35)
      {
        v36 = v35;
        CFDictionaryAddValue(a2, CFSTR("Device Node ID"), v35);
        CFRelease(v36);
        v37 = IORegistryEntrySearchCFProperty(v3, "IOService", CFSTR("GUID"), v4, 3u);
        if (v37)
        {
          v11 = v37;
          v12 = CFSTR("Device Absolute ID");
          goto LABEL_18;
        }
      }
    }
  }
LABEL_30:
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  *(_OWORD *)v39 = 0u;
  v40 = 0u;
  parent = 0;
  v13 = MEMORY[0x2199A57F0](v3, "IOService", v39);
  if ((_DWORD)v13)
    goto LABEL_40;
  v25 = index(v39, 58);
  v26 = CFStringCreateWithCString(0, v25 + 1, 0x600u);
  if (v26)
  {
    v27 = v26;
    CFDictionaryAddValue(a2, CFSTR("IOS Path"), v26);
    CFRelease(v27);
  }
  if (IORegistryEntryInPlane(v3, "IODeviceTree"))
  {
LABEL_36:
    v13 = MEMORY[0x2199A57F0](v3, "IODeviceTree", v39);
    if (!(_DWORD)v13)
    {
      v29 = index(v39, 58);
      v30 = CFStringCreateWithCString(0, v29 + 1, 0x600u);
      if (v30)
      {
        v31 = v30;
        CFDictionaryAddValue(a2, CFSTR("OF Path"), v30);
        CFRelease(v31);
      }
      v13 = 0;
    }
LABEL_40:
    if (!v5)
      return v13;
LABEL_41:
    CFRelease(v5);
    return v13;
  }
  while (1)
  {
    ParentEntry = IORegistryEntryGetParentEntry(v3, "IOService", &parent);
    if ((_DWORD)ParentEntry)
      break;
    v3 = parent;
    if (IORegistryEntryInPlane(parent, "IODeviceTree"))
      goto LABEL_36;
  }
  v13 = ParentEntry;
  if (v5)
    goto LABEL_41;
  return v13;
}

uint64_t MKBSDCFCreateDeviceInfo(const __CFString *a1, CFMutableDictionaryRef *a2)
{
  char buffer[32];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  CFStringGetCString(a1, buffer, 32, 0x600u);
  return MKBSDCreateDeviceInfo(buffer, a2);
}

uint64_t MKMediaListCreate(CFMutableArrayRef *a1, char a2)
{
  CFMutableArrayRef Mutable;
  uint64_t result;
  __CFDictionary *v6;
  const __CFDictionary *v7;
  io_object_t v8;
  io_registry_entry_t v9;
  const __CFAllocator *v10;
  const __CFString *CFProperty;
  const __CFString *v12;
  __CFString *v13;
  io_iterator_t existing[2];

  *(_QWORD *)existing = 0;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  *a1 = Mutable;
  if (!Mutable)
    return 12;
  result = MEMORY[0x2199A5790](*MEMORY[0x24BDAD2F0], existing);
  if ((_DWORD)result)
    return result;
  v6 = IOServiceMatching("IOMedia");
  if (!v6)
    return 12;
  v7 = v6;
  if ((a2 & 1) != 0)
    CFDictionaryAddValue(v6, CFSTR("Whole"), (const void *)*MEMORY[0x24BDBD270]);
  result = IOServiceGetMatchingServices(existing[0], v7, &existing[1]);
  if (!(_DWORD)result)
  {
    v8 = IOIteratorNext(existing[1]);
    if (v8)
    {
      v9 = v8;
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      do
      {
        CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v9, CFSTR("BSD Name"), v10, 0);
        if (CFProperty)
        {
          v12 = CFProperty;
          if ((a2 & 2) != 0)
          {
            v13 = CFStringCreateMutable(0, 0);
            CFStringAppendCString(v13, "/dev/", 0x600u);
            CFStringAppend(v13, v12);
            CFRelease(v12);
            v12 = v13;
          }
          CFArrayAppendValue(*a1, v12);
          CFRelease(v12);
        }
        IOObjectRelease(v9);
        v9 = IOIteratorNext(existing[1]);
      }
      while (v9);
    }
    result = existing[1];
    if (existing[1])
    {
      IOObjectRelease(existing[1]);
      return 0;
    }
  }
  return result;
}

uint64_t PMIndex2Slice(uint64_t a1, int a2)
{
  return pmindex2slice(a1, a1 + 1072 * a2 + 528);
}

uint64_t MKFetchMediaSetup(const void *a1, CFBundleRef bundle, CFTypeRef *a3)
{
  uint64_t v3;
  const __CFURL *v6;
  __CFReadStream *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *Value;
  __CFBundle *v11;
  __CFBundle *v12;

  v3 = 4294967246;
  if (!a1 || !a3)
    return v3;
  if (!bundle)
  {
    v11 = MKAccessLibrary(0);
    if (!v11)
      return 4294961987;
    v12 = v11;
    v6 = CFBundleCopyResourceURL(v11, CFSTR("defaults"), CFSTR("plist"), 0);
    CFRelease(v12);
    if (v6)
      goto LABEL_5;
    return 4294967253;
  }
  v6 = CFBundleCopyResourceURL(bundle, CFSTR("defaults"), CFSTR("plist"), 0);
  if (!v6)
    return 4294967253;
LABEL_5:
  v7 = CFReadStreamCreateWithFile(0, v6);
  CFRelease(v6);
  if (!v7)
    return 4294967273;
  if (CFReadStreamOpen(v7))
  {
    v8 = (const __CFDictionary *)CFPropertyListCreateWithStream(0, v7, 0, 0, 0, 0);
    v9 = v8;
    if (v8)
    {
      Value = CFDictionaryGetValue(v8, a1);
      *a3 = Value;
      if (Value)
      {
        v3 = 0;
        *a3 = CFRetain(Value);
      }
      else
      {
        v3 = 4294966881;
      }
    }
    else
    {
      v3 = 4294967277;
    }
  }
  else
  {
    v9 = 0;
    v3 = 4294967273;
  }
  CFReadStreamClose(v7);
  CFRelease(v7);
  if (v9)
    CFRelease(v9);
  return v3;
}

uint64_t MKGetMediaDefaults(const void *a1, __CFBundle *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  uint64_t result;
  const void *Value;
  const void *v8;
  CFDictionaryRef theDict;

  theDict = 0;
  *a4 = 0;
  *a3 = 0;
  if (!a1)
    return 4294967246;
  result = MKFetchMediaSetup(a1, a2, (CFTypeRef *)&theDict);
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("Drivers"));
    *a3 = Value;
    if (Value)
      *a3 = CFRetain(Value);
    v8 = CFDictionaryGetValue(theDict, CFSTR("Patches"));
    *a4 = v8;
    if (v8)
      *a4 = CFRetain(v8);
    result = (uint64_t)theDict;
    if (theDict)
    {
      CFRelease(theDict);
      return 0;
    }
  }
  return result;
}

__CFDictionary *MKMakePartDictExtended(int a1, const char *a2, const char *a3, int a4, uint64_t a5, int *a6, int a7)
{
  __CFDictionary *Mutable;
  CFStringRef v14;
  const void *v15;
  int v16;
  const void *v17;
  CFNumberRef v18;
  CFStringRef v19;
  CFNumberRef v20;
  int v22;
  int v23;
  __int16 valuePtr;
  char cStr[16];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  v22 = a7;
  v23 = a4;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v14 = CFStringCreateWithCString(0, a2, 0);
    CFDictionarySetValue(Mutable, CFSTR("Partition Name"), v14);
    CFRelease(v14);
    if (a1)
      v15 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
    else
      v15 = CFStringCreateWithCString(0, a3, 0);
    v17 = v15;
    CFDictionarySetValue(Mutable, CFSTR("Partition Type"), v15);
    CFRelease(v17);
    v18 = CFNumberCreate(0, kCFNumberSInt32Type, &v23);
    CFDictionarySetValue(Mutable, CFSTR("Partition Size"), v18);
    CFRelease(v18);
    if ((_DWORD)a5)
    {
      OSType2Ascii(a5, cStr, 3);
      v19 = CFStringCreateWithCString(0, cStr, 0);
      CFDictionarySetValue(Mutable, CFSTR("Partition Signature"), v19);
      CFRelease(v19);
    }
    if (a7)
    {
      v20 = CFNumberCreate(0, kCFNumberSInt32Type, &v22);
      CFDictionarySetValue(Mutable, CFSTR("Partition Options"), v20);
      CFRelease(v20);
    }
    v16 = 0;
  }
  else
  {
    v16 = *__error();
  }
  *a6 = v16;
  return Mutable;
}

uint64_t MKBuildDrivers(Ptr *a1, CFDictionaryRef theDict, const __CFArray *a3, __CFBundle *a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  Ptr *v8;
  const __CFDictionary *Value;
  const __CFDictionary *v15;
  uint64_t Count;
  CFIndex v17;
  const void *ValueAtIndex;
  const __CFDictionary *v19;

  v8 = a1;
  LOWORD(a1) = -50;
  if (v8 && theDict)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Drivers"));
    if (Value)
    {
      v15 = Value;
      Count = (unsigned __int16)CFArrayGetCount(a3);
      if (Count)
      {
        v17 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a3, v17);
          if (!ValueAtIndex)
            break;
          v19 = (const __CFDictionary *)CFDictionaryGetValue(v15, ValueAtIndex);
          if (!v19)
            break;
          LODWORD(a1) = MKBuildDriver(v8, v19, a4, a5, a7, a8);
          if ((_DWORD)a1)
            return (__int16)a1;
          if (Count == ++v17)
            goto LABEL_10;
        }
        LOWORD(a1) = -415;
      }
      else
      {
LABEL_10:
        LOWORD(a1) = 0;
      }
    }
    else
    {
      LOWORD(a1) = -417;
    }
  }
  return (__int16)a1;
}

uint64_t MKBuildDriver(Ptr *a1, CFDictionaryRef theDict, __CFBundle *a3, unsigned int a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  const __CFString *Value;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  CFTypeID v16;
  int v17;
  int v18;
  const __CFBoolean *v20;
  int v21;
  const __CFString *v22;
  const __CFBoolean *v23;
  const __CFBoolean *v24;
  const __CFNumber *v25;
  unsigned int v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFURL *v29;
  int v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  stat v36;
  unsigned int valuePtr;
  char v38[16];
  UInt8 buffer[4];
  _OWORD v40[6];
  Ptr v41;
  uint64_t v42;
  CFRange v43;
  CFRange v44;

  v42 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  memset(v40, 0, sizeof(v40));
  memset(&v36, 0, sizeof(v36));
  valuePtr = 0;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Partition Name"));
  if (!Value
    || !CFStringGetCString(Value, (char *)&v40[2] + 12, 32, 0)
    || (v13 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Partition Type"))) == 0
    || !CFStringGetCString(v13, (char *)((unint64_t)v40 | 0xC), 32, 0))
  {
    v17 = -1;
    v18 = -417;
    goto LABEL_9;
  }
  v14 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Driver Signature"));
  if (v14)
  {
    v15 = v14;
    *(_DWORD *)buffer = 0;
    v16 = CFGetTypeID(v14);
    if (v16 == CFStringGetTypeID())
    {
      v43.location = 0;
      v43.length = 4;
      CFStringGetBytes(v15, v43, 0, 0, 0, buffer, 4, 0);
    }
    else if (v16 == CFDataGetTypeID())
    {
      v44.location = 0;
      v44.length = 4;
      CFDataGetBytes((CFDataRef)v15, v44, buffer);
    }
    DWORD1(v40[0]) = bswap32(*(unsigned int *)buffer);
  }
  v20 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Driver Present"));
  if (v20)
    v21 = CFBooleanGetValue(v20);
  else
    v21 = 0;
  v22 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("Cpu"));
  if (v22)
    CFStringGetCString(v22, (char *)&v40[4] + 12, 16, 0);
  v23 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Chain Compatible"));
  if (v23 && CFBooleanGetValue(v23))
    LOWORD(v40[0]) |= 0x100u;
  v24 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("Chain Driver"));
  if (v24 && CFBooleanGetValue(v24))
    LOWORD(v40[0]) |= 0x200u;
  v25 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Partition Size"));
  if (!v25)
  {
    v26 = 0;
    goto LABEL_34;
  }
  CFNumberGetValue(v25, kCFNumberSInt32Type, &valuePtr);
  v26 = valuePtr;
  if (valuePtr <= 0x7FF)
LABEL_34:
    valuePtr = v26 << 9;
  OSType2Ascii(DWORD1(v40[0]), v38, 2);
  v27 = CFStringCreateWithFormat(0, 0, CFSTR("%s.%s"), (unint64_t)v40 | 0xC, v38, *(_QWORD *)&v36.st_dev, v36.st_ino, *(_QWORD *)&v36.st_uid, *(_QWORD *)&v36.st_rdev, v36.st_atimespec.tv_sec, v36.st_atimespec.tv_nsec, v36.st_mtimespec.tv_sec, v36.st_mtimespec.tv_nsec, v36.st_ctimespec.tv_sec, v36.st_ctimespec.tv_nsec, v36.st_birthtimespec.tv_sec, v36.st_birthtimespec.tv_nsec);
  if (!v27)
  {
    v17 = -1;
    goto LABEL_41;
  }
  v28 = v27;
  v29 = CFBundleCopyResourceURL(a3, v27, CFSTR("drvr"), 0);
  CFRelease(v28);
  if (!v29)
  {
    v17 = -1;
    if (!v21)
    {
LABEL_48:
      v18 = PMWriteDriver(a1, (uint64_t)v40, valuePtr, a4, a5, a6);
      goto LABEL_9;
    }
LABEL_41:
    v18 = -43;
    goto LABEL_9;
  }
  CFURLGetFileSystemRepresentation(v29, 1u, buffer, 1024);
  CFRelease(v29);
  v30 = stat((const char *)buffer, &v36);
  if (v30
    || ((DWORD2(v40[0]) = v36.st_size, v31 = *((unsigned __int16 *)*a1 + 1), !(LODWORD(v36.st_size) % v31))
      ? (v32 = LODWORD(v36.st_size) / v31)
      : (v32 = LODWORD(v36.st_size) / v31 + 1),
        v33 = v32 * v31,
        v41 = NewPtr(v32 * v31),
        v30 = MemError(),
        !v41))
  {
    v18 = v30;
    v17 = -1;
    goto LABEL_9;
  }
  bzero(&v41[DWORD2(v40[0])], (v33 - DWORD2(v40[0])));
  v34 = open((const char *)buffer, 0, 0);
  v17 = v34;
  if (v34 != -1)
  {
    v35 = read(v34, v41, DWORD2(v40[0]));
    if (DWORD2(v40[0]) == v35)
      goto LABEL_48;
  }
  v18 = -1;
LABEL_9:
  if (v41)
    DisposePtr(v41);
  if (v17 != -1)
    close(v17);
  if (v18 == -1)
    v18 = *__error();
  return (__int16)v18;
}

uint64_t MKCreatePatchPartition(const void **a1, CFArrayRef theArray, CFDictionaryRef theDict, const __CFArray *a4, __CFBundle *a5, unsigned int a6, int a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  const void **v9;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  int v17;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v19;
  const void *Value;
  const __CFDictionary *v21;
  const __CFNumber *v22;
  uint64_t v23;
  const __CFNumber *v25;
  unsigned int valuePtr;
  __int16 v29;
  char v30[24];
  uint64_t v31;

  v9 = a1;
  v31 = *MEMORY[0x24BDAC8D0];
  valuePtr = 0;
  strcpy(v30, "Patch Partition");
  LOWORD(a1) = -50;
  if (v9 && theDict)
  {
    v29 = 0;
    if (theArray)
    {
      Count = CFArrayGetCount(theArray);
      if (Count >= 1)
      {
        v15 = Count;
        v16 = 0;
        v17 = 0;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v16);
          if (!ValueAtIndex)
            break;
          v19 = ValueAtIndex;
          Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("Partition Type"));
          if (Value && CFEqual(Value, CFSTR("Apple_Patches")))
          {
            v25 = (const __CFNumber *)CFDictionaryGetValue(v19, CFSTR("Partition Size"));
            if (v25)
            {
              CFNumberGetValue(v25, kCFNumberSInt32Type, &valuePtr);
              v23 = valuePtr;
              if (valuePtr)
                goto LABEL_15;
            }
            break;
          }
          v16 = (__int16)++v17;
        }
        while (v15 > (__int16)v17);
      }
    }
    v21 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("Patches"));
    if (v21)
    {
      v22 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("Partition Size"));
      if (v22)
        CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr);
    }
    v23 = valuePtr;
    if (!valuePtr)
    {
      v23 = 128;
      valuePtr = 128;
    }
LABEL_15:
    valuePtr = PMConvertBlocks(v23, 0x200u, *((unsigned __int16 *)*v9 + 1));
    LODWORD(a1) = PMNewPartitionExtended(v9, 12544, 0, 0, valuePtr, v30, a6, (unsigned __int16 *)&v29, 0);
    if (!(_DWORD)a1)
      LOWORD(a1) = RebuildPatches((uint64_t *)v9, v29, theDict, a4, a5, a6, a8, a9);
  }
  return (__int16)a1;
}

uint64_t RebuildPatches(uint64_t *a1, int a2, const __CFDictionary *a3, const __CFArray *a4, __CFBundle *a5, unsigned int a6, uint64_t a7, uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))
{
  uint64_t result;
  const __CFDictionary *Value;
  const __CFDictionary *v18;
  CFIndex v19;
  uint64_t v20;
  const void *ValueAtIndex;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const __CFString *v29;
  const __CFString *v30;
  CFTypeID v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  const __CFString *v37;
  const __CFURL *v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  __CFBundle *bundle;
  unsigned int v45;
  CFIndex Count;
  stat v47;
  UInt8 v48[4];
  UInt8 v49[16];
  size_t v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  Ptr p;
  char __str[1024];
  uint64_t v57;
  CFRange v58;
  CFRange v59;

  v57 = *MEMORY[0x24BDAC8D0];
  if (a2 < 1)
    return 4294967246;
  *(_WORD *)(*a1 + 1072 * (unsigned __int16)a2 + 1036) = *(_WORD *)(*a1 + 518) >> 9;
  result = VErasePartition(a1, (unsigned __int16)a2, 0, a7, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))a8);
  if ((_DWORD)result)
    return result;
  p = 0;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  *(_OWORD *)v49 = 0u;
  *(_OWORD *)v50 = 0u;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a3, CFSTR("Patches"));
  if (!Value)
  {
    LOWORD(v36) = -417;
    return (__int16)v36;
  }
  v18 = Value;
  Count = CFArrayGetCount(a4);
  if (Count < 1)
  {
    LOWORD(v20) = 0;
    goto LABEL_57;
  }
  v45 = a6;
  v19 = 0;
  v20 = 0;
  bundle = a5;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, v19);
    if (!ValueAtIndex)
      break;
    v22 = (const __CFDictionary *)CFDictionaryGetValue(v18, ValueAtIndex);
    if (!v22)
      break;
    v23 = v22;
    memset(&v47, 0, sizeof(v47));
    *(_OWORD *)v49 = 0u;
    *(_OWORD *)v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    p = 0;
    v24 = (const __CFString *)CFDictionaryGetValue(v22, CFSTR("Patch Name"));
    if (!v24)
      goto LABEL_17;
    CFStringGetPascalString(v24, (StringPtr)&v50[1] + 4, 33, 0);
    v25 = (const __CFString *)CFDictionaryGetValue(v23, CFSTR("Patch Signature"));
    if (!v25
      || (v58.location = 0,
          v58.length = 4,
          CFStringGetBytes(v25, v58, 0, 0, 0, v49, 4, 0),
          (v26 = (const __CFString *)CFDictionaryGetValue(v23, CFSTR("Patch Vendor"))) == 0)
      || (CFStringGetPascalString(v26, (StringPtr)&v52 + 13, 33, 0),
          (v27 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("Major Vers"))) == 0))
    {
LABEL_17:
      v33 = -1;
      v34 = 4294966879;
      goto LABEL_18;
    }
    CFNumberGetValue(v27, kCFNumberSInt16Type, &v49[4]);
    v28 = (const __CFNumber *)CFDictionaryGetValue(v23, CFSTR("Minor Vers"));
    if (v28)
      CFNumberGetValue(v28, kCFNumberSInt16Type, &v49[6]);
    v29 = (const __CFString *)CFDictionaryGetValue(v23, CFSTR("Flags"));
    if (v29)
    {
      v30 = v29;
      *(_DWORD *)v48 = -1;
      v31 = CFGetTypeID(v29);
      if (v31 == CFStringGetTypeID())
      {
        CFStringGetCString(v30, __str, 16, 0);
        v32 = strtoul(__str, 0, 0);
      }
      else if (v31 == CFDataGetTypeID())
      {
        v59.location = 0;
        v59.length = 4;
        CFDataGetBytes((CFDataRef)v30, v59, v48);
        v32 = bswap32(*(unsigned int *)v48);
      }
      else
      {
        v32 = -1;
      }
      *(_DWORD *)&v49[8] = v32;
    }
    v37 = CFStringCreateWithFormat(0, 0, CFSTR("Apple_Patches.%4.4s"), v49);
    v38 = CFBundleCopyResourceURL(bundle, v37, CFSTR("ptch"), 0);
    CFRelease(v37);
    if (!v38 || (v39 = CFURLGetFileSystemRepresentation(v38, 1u, (UInt8 *)__str, 1024), CFRelease(v38), !v39))
    {
      v33 = -1;
      v34 = 4294967253;
      goto LABEL_18;
    }
    v40 = stat(__str, &v47);
    if ((_DWORD)v40)
    {
      v34 = v40;
      v33 = -1;
      goto LABEL_18;
    }
    LODWORD(v50[0]) = v47.st_size;
    p = NewPtr(LODWORD(v47.st_size));
    v41 = MemError();
    if (p)
    {
      v42 = open(__str, 0, 0);
      v33 = v42;
      if (v42 == -1)
      {
        v34 = 0xFFFFFFFFLL;
LABEL_18:
        if (p)
        {
          DisposePtr(p);
          p = 0;
        }
        goto LABEL_20;
      }
      v43 = read(v42, p, LODWORD(v50[0]));
      if (LODWORD(v50[0]) == v43)
        v34 = 0;
      else
        v34 = 0xFFFFFFFFLL;
    }
    else
    {
      v34 = v41;
      v33 = -1;
    }
    if ((_DWORD)v34)
      goto LABEL_18;
LABEL_20:
    if (v33 != -1)
      close(v33);
    if ((_DWORD)v34 == -1)
      v34 = *(unsigned __int16 *)__error();
    if ((_WORD)v34)
    {
      v35 = v34;
      LOWORD(v36) = v34;
      if ((unsigned __int16)v34 != 65493)
        goto LABEL_54;
    }
    else
    {
      v36 = PMAddpatch((uint64_t)a1, a2, v49, (unsigned __int8 *)p, v45, a7, a8);
      if (p)
      {
        DisposePtr(p);
        p = 0;
      }
      v35 = v20;
      if (v36)
        goto LABEL_54;
    }
    ++v19;
    v20 = v35;
    if (Count == v19)
    {
      LOWORD(v36) = v34;
      LOWORD(v20) = v35;
      goto LABEL_54;
    }
  }
  LOWORD(v36) = -415;
LABEL_54:
  if (p)
    DisposePtr(p);
  if (!(_WORD)v36)
LABEL_57:
    LOWORD(v36) = v20;
  return (__int16)v36;
}

uint64_t MKMediaLayout(Ptr *a1, const __CFDictionary *a2, __CFBundle *a3, unsigned int a4, char a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  __CFBundle *v14;
  const __CFDictionary *v15;
  const __CFURL *v16;
  const __CFArray *Value;
  const __CFArray *v18;
  const __CFArray *v19;
  CFIndex v20;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v22;
  Ptr v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  int v27;
  int v28;
  Ptr v29;
  int v30;
  int v31;
  unsigned int v32;
  const __CFString *v33;
  uint64_t v35;
  int v36;
  char v37;
  uint64_t Count;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int v41;
  __int16 v42;
  char v43[34];
  _OWORD v44[5];
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v41 = -50;
  if (!a1)
    return v41;
  v41 = -43;
  v14 = a3;
  if (!a3)
  {
    v14 = MKAccessLibrary(0);
    if (!v14)
      return v41;
  }
  v15 = MKLoadDB(v14, CFSTR("inventory"), (int *)&v41);
  if (!v15)
  {
    v16 = 0;
    goto LABEL_38;
  }
  v37 = a5;
  v39 = a6;
  v40 = a7;
  v16 = MKLoadDB(v14, CFSTR("database"), (int *)&v41);
  v41 = 0;
  Value = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Drivers"));
  v18 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Patches"));
  v19 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("Partitions"));
  if (Value && (v41 = MKBuildDrivers(a1, v15, Value, v14, a4, 0, v39, v40)) != 0
    || v18
    && (v41 = MKCreatePatchPartition((const void **)a1, v19, v15, v18, v14, a4, 0, v39, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, Ptr))v40)) != 0)
  {
LABEL_38:
    if (a3)
      goto LABEL_41;
    goto LABEL_39;
  }
  if (!v19 || (Count = (unsigned __int16)CFArrayGetCount(v19)) == 0)
  {
LABEL_35:
    v41 = 0;
    if (a3)
      goto LABEL_41;
    goto LABEL_39;
  }
  v20 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, v20);
    if (!ValueAtIndex)
      break;
    v22 = ValueAtIndex;
    v42 = 0;
    v46 = 0;
    v45 = 0u;
    memset(v44, 0, sizeof(v44));
    v23 = *a1;
    v24 = MKGetPartitionInfo(ValueAtIndex, *((__int16 *)*a1 + 257), (uint64_t)v44);
    if (v24)
      goto LABEL_47;
    v25 = DWORD2(v45);
    if (!DWORD2(v45))
    {
      v26 = *((unsigned __int16 *)v23 + 261);
      if (v26 >= 2 && (v27 = v26 - 1, *(_WORD *)&v23[1072 * v27 + 1082] == 24320))
      {
        v25 = *(_DWORD *)&v23[1072 * v27 + 540];
        DWORD2(v45) = v25;
      }
      else
      {
        v25 = 0;
      }
    }
    v28 = WORD2(v46);
    if (WORD2(v46) == 12544)
    {
      if (!PMSpecificIndex(a1, 12544, 0, &v42) && v42)
        goto LABEL_34;
      v28 = WORD2(v46);
      v25 = DWORD2(v45);
    }
    v24 = PMNewPartitionExtended((const void **)a1, v28, (char *)&v44[2] + 1, HIDWORD(v45), v25, v44, a4, (unsigned __int16 *)&v42, v46);
    if (v24)
      goto LABEL_24;
    v29 = *a1;
    if (*((__int16 *)*a1 + 257) <= 3)
    {
      v30 = v42;
      if ((v37 & 1) != 0
        && *((_DWORD *)v29 + 1) == *(_DWORD *)&v29[1072 * v42 + 540] + *(_DWORD *)&v29[1072 * v42 + 536])
      {
        v35 = (uint64_t)&v29[1072 * v42 + 528];
        v36 = v42;
        v31 = PMConvertBlocks(10, 0x200u, *((unsigned __int16 *)v29 + 1));
        v30 = v36;
        v32 = (*(_DWORD *)(v35 + 12) - v31) / a4 * a4;
        *(_DWORD *)(v35 + 12) = v32;
        *(_DWORD *)(v35 + 84) = v32;
      }
      if (DWORD1(v45))
        *(_DWORD *)&v29[1072 * v30 + 664] = DWORD1(v45);
      v33 = (const __CFString *)CFDictionaryGetValue(v22, CFSTR("Partition Loader"));
      if (v33)
      {
        CFStringGetCString(v33, v43, 34, 0);
        v24 = MKCreateLoaderPartition((const void **)a1, v14, v15, a4, 0, v42, v43, 1, v39, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))v40);
        if (v24 != 28)
        {
LABEL_24:
          if (v24)
            goto LABEL_47;
        }
      }
    }
LABEL_34:
    if (Count == ++v20)
      goto LABEL_35;
  }
  v24 = -415;
LABEL_47:
  v41 = v24;
  if (!a3)
  {
LABEL_39:
    if (v14)
      CFRelease(v14);
  }
LABEL_41:
  if (v15)
    CFRelease(v15);
  if (v16)
    CFRelease(v16);
  return v41;
}

Handle NewHandle(Size byteCount)
{
  return InternalNewHandle(byteCount, 0);
}

void SetHandleSize(Handle h, Size newSize)
{
  Ptr v3;
  char *v5;
  __int16 v6;

  if (!h || (char)h[2] < 0)
  {
    v6 = -109;
  }
  else
  {
    v3 = *h;
    if (*h)
    {
      v5 = (char *)malloc_type_realloc(v3, newSize, 0x2CEBCF70uLL);
      if (!newSize || v5)
      {
        v6 = 0;
        *h = v5;
        h[1] = (Ptr)newSize;
      }
      else
      {
        v6 = -108;
      }
    }
    else
    {
      v6 = -111;
    }
  }
  MemErr = v6;
}

Size GetHandleSize(Size h)
{
  __int16 v1;

  if (h)
  {
    v1 = 0;
    h = *(_QWORD *)(h + 8);
  }
  else
  {
    v1 = -109;
  }
  MemErr = v1;
  return h;
}

void HUnlock(Handle h)
{
  __int16 v1;

  if (h)
  {
    v1 = 0;
    *((_BYTE *)h + 16) &= ~0x80u;
  }
  else
  {
    v1 = -109;
  }
  MemErr = v1;
}

Ptr NewPtr(Size byteCount)
{
  Ptr result;
  __int16 v2;

  result = (Ptr)malloc_type_malloc(byteCount, 0x5F07003AuLL);
  if (result)
    v2 = 0;
  else
    v2 = -108;
  MemErr = v2;
  return result;
}

Ptr NewPtrClear(Size byteCount)
{
  char *v2;
  char *v3;

  v2 = (char *)malloc_type_malloc(byteCount, 0x7F9C0747uLL);
  v3 = v2;
  if (v2)
  {
    bzero(v2, byteCount);
    MemErr = 0;
  }
  return v3;
}

void DisposePtr(Ptr p)
{
  __int16 v1;

  if (p)
  {
    free(p);
    v1 = 0;
  }
  else
  {
    v1 = -113;
  }
  MemErr = v1;
}

uint64_t MKBlockChecksum2(_DWORD *a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  unint64_t v5;
  int v6;

  v3 = *a1;
  if (a2 && a3)
  {
    v4 = &a2[a3];
    do
    {
      HIDWORD(v5) = v3;
      LODWORD(v5) = v3;
      v6 = *a2++;
      v3 = (v5 >> 31) + v6;
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

uint64_t MKImageChecksum(_DWORD *a1, unsigned __int8 *a2, int a3)
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;

  v3 = *a1;
  if (a2)
  {
    v4 = &a2[a3];
    do
    {
      v5 = *a2++;
      v3 = (v3 + v5);
    }
    while (a2 < v4);
  }
  *a1 = v3;
  return v3;
}

uint64_t DrvrChecksum(unsigned __int8 *a1, int a2)
{
  int v2;
  unsigned __int8 v3;
  unsigned int v4;

  if (a1)
  {
    if (!a2)
      goto LABEL_6;
    v2 = 0;
    do
    {
      --a2;
      v3 = *a1++;
      v4 = v2 + v3;
      v2 = (v4 >> 15) & 1 | (2 * v4);
    }
    while ((_WORD)a2);
    if (!(_WORD)v4)
LABEL_6:
      LOWORD(v2) = -1;
  }
  else
  {
    LOWORD(v2) = 0;
  }
  return (unsigned __int16)v2;
}

__CFDictionary *TAOCopyHFSPlusParametersDict(const __CFDictionary *a1, _DWORD *a2)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  const void *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  CFTypeID v10;
  const __CFNumber *v11;
  const __CFNumber *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  unsigned int v17;
  int v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  CFTypeID v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  FILE **v30;
  FILE **v31;
  const __CFAllocator *v32;
  __CFDictionary *Mutable;
  int v34;
  const __CFString *v35;
  unint64_t v36;
  CFNumberRef v37;
  uint64_t v39;
  uint64_t valuePtr;
  char *__endptr;
  unint64_t v42;
  _OWORD v43[5];
  char __s1[128];
  char v45[16];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char __str[16];
  __int128 v50;
  char v51[32];
  char v52[33];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__str = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  *(_OWORD *)v45 = 0u;
  v46 = 0u;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("volume sectors"));
  if (!Value)
    goto LABEL_80;
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 != CFNumberGetTypeID())
    goto LABEL_80;
  memset(v43, 0, sizeof(v43));
  v39 = 0;
  valuePtr = 0;
  CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
  v7 = CFDictionaryGetValue(a1, CFSTR("journal size"));
  v8 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("block size"));
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v9, kCFNumberSInt64Type, &v39);
      if (snprintf(__str, 0x20uLL, "%llu", v39) > 0x1F)
        goto LABEL_80;
    }
  }
  v11 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("attr node size"));
  v12 = v11;
  if (v11)
  {
    v13 = CFGetTypeID(v11);
    if (v13 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v12, kCFNumberSInt64Type, &v39);
      LODWORD(v12) = snprintf(v45, 0x40uLL, "a=%llu", v39);
      if (v12 > 0x3F)
        goto LABEL_80;
    }
    else
    {
      LODWORD(v12) = 0;
    }
  }
  v14 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("cat node size"));
  if (v14)
  {
    v15 = v14;
    v16 = CFGetTypeID(v14);
    if (v16 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v15, kCFNumberSInt64Type, &v39);
      if ((_DWORD)v12)
      {
        v17 = (_DWORD)v12 + 1;
        v45[v12] = 44;
      }
      else
      {
        v17 = 0;
      }
      v18 = snprintf(&v45[v17], 64 - v17, "c=%llu", v39);
      if (64 - (unint64_t)v17 <= v18)
        goto LABEL_80;
      LODWORD(v12) = v18 + v17;
    }
  }
  v19 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ext node size"));
  if (v19)
  {
    v20 = v19;
    v21 = CFGetTypeID(v19);
    if (v21 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v20, kCFNumberSInt64Type, &v39);
      if ((_DWORD)v12)
      {
        v22 = (_DWORD)v12 + 1;
        v45[(int)v12] = 44;
      }
      else
      {
        v22 = 0;
      }
      if (64 - v22 <= (unint64_t)snprintf(&v45[v22], 64 - v22, "e=%llu", v39))
      {
LABEL_80:
        Mutable = 0;
        goto LABEL_81;
      }
    }
  }
  *(_QWORD *)&v43[0] = "/sbin/newfs_hfs";
  if (v7)
  {
    *((_QWORD *)&v43[0] + 1) = "-J";
    v23 = 2;
  }
  else
  {
    v23 = 1;
  }
  if (__str[0])
  {
    v24 = v23 + 1;
    *((_QWORD *)v43 + v23) = "-b";
    v23 += 2;
    *((_QWORD *)v43 + v24) = __str;
  }
  if (v45[0])
  {
    v25 = v23 + 1;
    *((_QWORD *)v43 + v23) = "-n";
    v23 += 2;
    *((_QWORD *)v43 + v25) = v45;
  }
  *((_QWORD *)v43 + v23) = "-N";
  snprintf(v51, 0x20uLL, "%llub", valuePtr);
  *((_QWORD *)v43 + v23 + 1) = v51;
  *((_QWORD *)&v43[1] + v23) = 0;
  v26 = dup(2);
  if (v26 < 0)
  {
    Mutable = 0;
    LODWORD(v7) = *__error();
    if (!a2)
      return Mutable;
    goto LABEL_83;
  }
  v27 = v26;
  v28 = open("/dev/null", 1, 384);
  if (v28 < 0)
    goto LABEL_77;
  v29 = v28;
  if (dup2(v28, 2) == -1)
  {
    LODWORD(v7) = *__error();
    close(v29);
LABEL_86:
    dup2(v27, 2);
    close(v27);
    Mutable = 0;
    if (!a2)
      return Mutable;
    goto LABEL_83;
  }
  close(v29);
  v30 = (FILE **)TAOpopenv("r", *(const char **)&v43[0], (char *const *)v43);
  if (!v30)
  {
LABEL_77:
    LODWORD(v7) = *__error();
    goto LABEL_86;
  }
  v31 = v30;
  v32 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  while (fgets(__s1, 128, *v31))
  {
    v34 = strnlen(__s1, 0x80uLL) - 1;
    if (__s1[v34] == 10)
    {
      __s1[v34] = 0;
      v35 = CFSTR("block size");
      if (sscanf(__s1, " block-size:%32s", v52) == 1)
        goto LABEL_49;
      v35 = CFSTR("total blocks");
      if (sscanf(__s1, " total blocks:%32s", v52) == 1)
        goto LABEL_49;
      v35 = CFSTR("journal size");
      if (sscanf(__s1, " journal-size:%32s", v52) == 1)
        goto LABEL_49;
      v35 = CFSTR("cat node size");
      if (sscanf(__s1, " catalog b-tree node size:%32s", v52) == 1)
        goto LABEL_49;
      v35 = CFSTR("cat clump size");
      if (sscanf(__s1, " initial catalog file size:%32s", v52) == 1
        || (v35 = CFSTR("ext node size"), sscanf(__s1, " extents b-tree node size:%32s", v52) == 1)
        || (v35 = CFSTR("ext clump size"), sscanf(__s1, " initial extents file size:%32s", v52) == 1)
        || (v35 = CFSTR("alloc clump size"), sscanf(__s1, " initial allocation file size:%32s", v52) == 1)
        || (v35 = CFSTR("data clump size"), sscanf(__s1, " data fork clump size:%32s", v52) == 1)
        || (v35 = CFSTR("resource clump size"), sscanf(__s1, " resource fork clump size:%32s", v52) == 1)
        || (v35 = CFSTR("attr node size"), sscanf(__s1, " attributes b-tree node size:%32s", v52) == 1)
        || (v35 = CFSTR("attr clump size"), sscanf(__s1, " initial attributes file size:%32s", v52) == 1))
      {
LABEL_49:
        __endptr = 0;
        v36 = strtoull(v52, &__endptr, 10);
        v42 = v36;
        if (__endptr)
        {
          switch(*__endptr)
          {
            case 'B':
LABEL_52:
              v36 <<= 9;
              goto LABEL_58;
            case 'C':
            case 'D':
            case 'F':
            case 'H':
            case 'I':
            case 'J':
            case 'L':
            case 'N':
            case 'O':
              break;
            case 'E':
LABEL_53:
              v36 <<= 10;
              goto LABEL_54;
            case 'G':
              goto LABEL_55;
            case 'K':
              goto LABEL_57;
            case 'M':
              goto LABEL_56;
            case 'P':
LABEL_54:
              v36 <<= 10;
LABEL_55:
              v36 <<= 10;
LABEL_56:
              v36 <<= 10;
LABEL_57:
              v36 <<= 10;
LABEL_58:
              v42 = v36;
              break;
            default:
              switch(*__endptr)
              {
                case 'b':
                  goto LABEL_52;
                case 'e':
                  goto LABEL_53;
                case 'g':
                  goto LABEL_55;
                case 'k':
                  goto LABEL_57;
                case 'm':
                  goto LABEL_56;
                case 'p':
                  goto LABEL_54;
                default:
                  goto LABEL_59;
              }
          }
        }
LABEL_59:
        if (v36)
        {
          v37 = CFNumberCreate(v32, kCFNumberSInt64Type, &v42);
          CFDictionarySetValue(Mutable, v35, v37);
          CFRelease(v37);
        }
      }
    }
  }
  TAOpclose(v31);
  dup2(v27, 2);
  close(v27);
  if (CFDictionaryGetValue(Mutable, CFSTR("block size"))
    && CFDictionaryGetValue(Mutable, CFSTR("total blocks"))
    && CFDictionaryGetValue(Mutable, CFSTR("cat node size"))
    && CFDictionaryGetValue(Mutable, CFSTR("cat clump size"))
    && CFDictionaryGetValue(Mutable, CFSTR("ext node size"))
    && CFDictionaryGetValue(Mutable, CFSTR("ext clump size"))
    && CFDictionaryGetValue(Mutable, CFSTR("alloc clump size"))
    && CFDictionaryGetValue(Mutable, CFSTR("data clump size"))
    && CFDictionaryGetValue(Mutable, CFSTR("resource clump size")))
  {
    if (!v7)
      goto LABEL_82;
    if (CFDictionaryGetValue(Mutable, CFSTR("journal size")))
    {
      LODWORD(v7) = 0;
      if (!a2)
        return Mutable;
      goto LABEL_83;
    }
  }
  if (Mutable)
  {
    CFRelease(Mutable);
    goto LABEL_80;
  }
LABEL_81:
  LODWORD(v7) = 22;
LABEL_82:
  if (a2)
LABEL_83:
    *a2 = (_DWORD)v7;
  return Mutable;
}

uint64_t MKFATFSDescriptorIdentity(char *a1)
{
  const char *v1;
  uint64_t v3;

  v1 = (const char *)fatfsdescriptors[0];
  if (fatfsdescriptors[0])
  {
    v3 = 0;
    do
    {
      if (!strcasecmp(a1, v1))
        break;
      v1 = (const char *)fatfsdescriptors[++v3];
    }
    while (v1);
  }
  else
  {
    LOWORD(v3) = 0;
  }
  return (unsigned __int16)v3;
}

uint64_t MKFATFSIdentity(unsigned int a1)
{
  unsigned int v1;

  if (a1 >= 4)
    v1 = 0;
  else
    v1 = a1;
  return fatfsdescriptors[v1];
}

uint64_t MKDetectFATFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v8;
  int v9;
  uint64_t v10;
  _OWORD v12[6];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v8 = 0;
  *a3 = 0;
  if ((*(_WORD *)(a2 + 11) & 0x7F) == 0)
  {
    if (*((unsigned __int16 *)a2 + 255) != 43605)
      return 0;
    *a3 = 500;
    v9 = *a2;
    if (v9 != 233 && (v9 != 235 || a2[2] != 144))
      return 0;
    *a3 = 1000;
    if (*a2 == 235 && a2[1] == 235 && a2[2] == 144)
      return 0;
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    v10 = _MKFATFSReadBPB(a1, (uint64_t)v12);
    v8 = 0;
    if ((_DWORD)v10 != -123 && (_DWORD)v10 != 22)
    {
      if ((_DWORD)v10)
        return v10;
      *a3 += 4000;
      if (a4)
        *a4 = v12[0];
      if (a5)
      {
        v8 = 0;
        *a5 = 3;
        return v8;
      }
      return 0;
    }
  }
  return v8;
}

uint64_t _MKFATFSReadBPB(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  size_t v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  __int16 v32;
  char v33;
  unsigned __int16 v34;
  unsigned __int8 v35;
  unsigned __int16 v36;
  unsigned __int8 v37;
  unsigned __int16 v38;
  unsigned __int16 v39;
  unsigned __int8 v40;
  unsigned __int16 v41;
  int v42;
  unsigned int v43;
  int v44;
  __int16 v45;
  unsigned __int16 v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(a2 + 96) = 0;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  result = MKMediaReadSectors(a1, 0, 1uLL, (char *)&v31, 0);
  if ((_DWORD)result)
    return result;
  if (v31 != 233)
  {
    result = 22;
    if (v31 != 235 || BYTE2(v31) != 144)
      return result;
  }
  v5 = v35;
  *(_WORD *)(a2 + 12) = v35;
  v6 = v34;
  *(_WORD *)(a2 + 8) = v34;
  v7 = v36;
  *(_WORD *)(a2 + 14) = v36;
  v8 = v37;
  *(_WORD *)(a2 + 16) = v37;
  v9 = v38;
  *(_WORD *)(a2 + 18) = v38;
  v10 = v39;
  v11 = v41;
  v12 = v42;
  *(_DWORD *)(a2 + 28) = v41;
  *(_DWORD *)(a2 + 32) = v12;
  *(_WORD *)(a2 + 24) = v40;
  *(_WORD *)(a2 + 4) = 512;
  v13 = v6 >> 9;
  *(_WORD *)(a2 + 6) = v6 >> 9;
  if (!v9)
  {
    if ((_DWORD)v10 || v11 | v46)
      return 22;
    *(_QWORD *)(a2 + 76) = 0x100040FFFFFFFLL;
    v11 = v44;
    *(_DWORD *)(a2 + 28) = v44;
    if ((v45 & 0x80) != 0)
      *(_WORD *)(a2 + 84) = v45 & 0xF;
  }
  v14 = v43;
  if ((_DWORD)v10)
    v14 = v10;
  if (!v14
    || (((_DWORD)v5 - 1) & 0x80) != 0
    || (((_DWORD)v5 - 1) & v5) != 0
    || (unsigned __int16)(v6 - 4097) < 0xF1FFu)
  {
    return 22;
  }
  result = 22;
  if ((((_DWORD)v6 - 1) & v6) != 0)
    return result;
  v15 = v6 * v5;
  if ((v6 * v5) > 0x8000)
    return result;
  v16 = v7 + v11 * v8;
  v17 = *(_DWORD *)(a2 + 76);
  if (v17 == 0xFFFFFFF)
  {
    v18 = v48;
    v19 = (unsigned __int16)v47;
    *(_WORD *)(a2 + 38) = v47;
    v20 = v16 * v13
        + ((unint64_t)(v19 - 2) << (*(_DWORD *)(a2 + 64)
                                                       - *(_DWORD *)(a2 + 72)));
    *(_DWORD *)(a2 + 40) = v18;
    *(_DWORD *)(a2 + 44) = v20;
    *(_DWORD *)(a2 + 20) = v14 * v13;
    *(_DWORD *)(a2 + 48) = (v14 - (unint64_t)v16) / v5;
    *(_DWORD *)(a2 + 52) = v16 * v13;
    v21 = 3;
LABEL_31:
    *(_DWORD *)a2 = v21;
    v24 = 128;
    goto LABEL_32;
  }
  v20 = v16 * v13;
  v22 = ((int)v6 + 32 * v9 - 1) / v6 + v16;
  *(_DWORD *)(a2 + 20) = v14 * v13;
  v23 = (v14 - v22) / v5;
  *(_DWORD *)(a2 + 44) = v16 * v13;
  *(_DWORD *)(a2 + 48) = v23;
  *(_DWORD *)(a2 + 52) = v22 * v13;
  if (v17 == 0xFFFF)
    goto LABEL_30;
  if (v17 != 4095)
  {
    if (v17)
    {
      *(_DWORD *)a2 = 0;
      v24 = 128;
      result = 4294967173;
      goto LABEL_32;
    }
    if (v23 <= 0xFF4)
    {
      *(_QWORD *)(a2 + 76) = 0x2000300000FFFLL;
      goto LABEL_27;
    }
    *(_QWORD *)(a2 + 76) = 0x100020000FFFFLL;
LABEL_30:
    v21 = 2;
    goto LABEL_31;
  }
LABEL_27:
  *(_DWORD *)a2 = 1;
  v24 = 96;
LABEL_32:
  *(_DWORD *)(a2 + 88) = v24 * v6;
  *(_DWORD *)(a2 + 72) = 9;
  *(_WORD *)(a2 + 10) = v15;
  v25 = __clz(__rbit32(v15));
  if ((_WORD)v15)
    v26 = v25 + 1;
  else
    v26 = 0;
  *(_DWORD *)(a2 + 64) = v26 - 1;
  *(_DWORD *)(a2 + 68) = (unsigned __int16)v15 - 1;
  if (((unsigned __int16)v15 & (v15 - 1)) == 0)
  {
    result = MKMediaReadSectors(a1, v20, 1uLL, (char *)&v31, 0);
    if (!(_DWORD)result)
    {
      if ((v34 & 8) != 0 && (_BYTE)v31 && v31 != 229)
      {
        if (v31 == 5)
          LOBYTE(v31) = -27;
        strntrim((const char *)&v31, 8);
        strntrim((const char *)&v32, 3);
        *(_QWORD *)(a2 + 92) = v31;
        if ((_BYTE)v32)
        {
          v27 = a2 + 92 + strlcat((char *)(a2 + 92), ".", 0xCuLL);
          *(_WORD *)v27 = v32;
          *(_BYTE *)(v27 + 2) = v33;
        }
      }
      if (!*(_WORD *)(a2 + 40))
        return 0;
      result = MKMediaReadSectors(a1, *(unsigned __int16 *)(a2 + 40), 1uLL, (char *)&v31, 0);
      if (!(_DWORD)result)
      {
        if ((_DWORD)v31 != 1096897106 || v49 != 1631679090 || v52 != -1437270016)
          return 0;
        result = 0;
        v28 = *(unsigned __int16 *)(a2 + 12);
        if (v50 == -1)
          v29 = 0;
        else
          v29 = v50 * v28;
        v30 = v51 * v28;
        *(_DWORD *)(a2 + 56) = v29;
        *(_DWORD *)(a2 + 60) = v30;
      }
    }
  }
  return result;
}

__CFDictionary *MKFATFSCreateProperties(uint64_t a1, const __CFDictionary *a2, int *a3)
{
  int v6;
  __CFDictionary *Mutable;
  int v8;
  CFStringRef v9;
  CFStringRef v10;
  CFNumberRef v11;
  _OWORD v13[21];
  _OWORD v14[6];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, sizeof(v13));
  v6 = _MKFATFSReadBPB(a1, (uint64_t)v14);
  if (v6)
  {
    Mutable = 0;
    goto LABEL_12;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    goto LABEL_11;
  v8 = LOWORD(v14[0]);
  if (LOWORD(v14[0]) >= 4u)
    v8 = 0;
  v9 = CFStringCreateWithCString(0, (const char *)fatfsdescriptors[v8], 0x8000100u);
  if (v9)
  {
    v10 = v9;
    CFDictionarySetValue(Mutable, CFSTR("FAT Variant"), v9);
    CFRelease(v10);
    if (MKCFOptionBit(a2, CFSTR("High Tide Mark"), 1))
    {
      v6 = FATSuperTidemark((uint64_t)v13, 0x40000, (uint64_t)v14, a1, 0, 0);
      if (v6)
        goto LABEL_12;
      v11 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, (char *)&v13[3] + 8);
      CFDictionarySetValue(Mutable, CFSTR("High Tide Mark"), v11);
      CFRelease(v11);
    }
    v6 = 0;
  }
  else
  {
LABEL_11:
    v6 = -1;
  }
LABEL_12:
  if (a3)
  {
    if (v6 == -1)
      v6 = *__error();
    *a3 = v6;
  }
  return Mutable;
}

uint64_t FATSuperTidemark(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t *), uint64_t a6)
{
  unint64_t v9;
  char *v10;
  char *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  int v16;
  unsigned int v17;
  unint64_t v18;
  int Sectors;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  unsigned int v28;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v39 = 0;
  *(_QWORD *)(a1 + 48) = *(unsigned int *)(a3 + 56);
  v9 = ((unint64_t)*(unsigned int *)(a3 + 48) << (*(_DWORD *)(a3 + 64)
                                                       - *(_DWORD *)(a3 + 72)))
     + *(unsigned int *)(a3 + 52);
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 56) = v9 - 1;
  v10 = (char *)malloc_type_calloc(*(unsigned int *)(a3 + 88), 1uLL, 0x100004077774924uLL);
  if (!v10)
  {
    *(_DWORD *)(a1 + 72) = *(_QWORD *)(a1 + 56) / (*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 48));
    LOWORD(Sectors) = 12;
    return (__int16)Sectors;
  }
  v11 = v10;
  v12 = *(unsigned __int16 *)(a3 + 12);
  v13 = *(unsigned __int16 *)(a3 + 6);
  LOWORD(v39) = 1;
  v15 = *(_DWORD *)(a3 + 48);
  v14 = *(unsigned int *)(a3 + 52);
  v40 = 0;
  v41 = v14;
  if (v15)
  {
    v16 = 0;
    v17 = 0;
    v18 = v13 * (unint64_t)v12;
    Sectors = 12;
    while (1)
    {
      v20 = (v16 + 2) * *(unsigned __int16 *)(a3 + 80) / *(unsigned __int16 *)(a3 + 82);
      v21 = *(_DWORD *)(a3 + 88);
      v22 = v20 / v21;
      v23 = v20 % v21;
      if (!v16 || !(_DWORD)v23)
      {
        v24 = v21 / *(unsigned __int16 *)(a3 + 8);
        v25 = *(unsigned int *)(a3 + 28);
        v26 = v25 - v22 * (unint64_t)v24;
        if (v26 >= v24)
          v26 = v24;
        Sectors = MKMediaReadSectors(a4, (*(unsigned __int16 *)(a3 + 14)+ v25 * *(unsigned __int16 *)(a3 + 84)+ v22 * (unint64_t)v24)* *(unsigned __int16 *)(a3 + 6), v26 * *(unsigned __int16 *)(a3 + 6), v11, 0);
        if (Sectors)
          break;
      }
      v27 = *(_DWORD *)(a3 + 76);
      if (v27 == 0xFFFFFFF)
        v28 = *(_DWORD *)&v11[v23];
      else
        v28 = *(unsigned __int16 *)&v11[v23];
      if (v27 == 4095 && (v16 & 1) != 0)
        v28 >>= 4;
      v30 = (v28 & v27) != 0;
      v31 = (unsigned __int16)v39;
      v14 = v41;
      if ((unsigned __int16)v39 != v30)
      {
        if (v41)
        {
          if (!(_WORD)v39)
            *(_QWORD *)(a1 + 48) += v41;
          if ((a2 & 3) != 0 && ((v31 + 1) & a2) != 0)
          {
            Sectors = a5(a6, 1, &v39);
            v14 = v41;
            if (Sectors)
              goto LABEL_33;
            v31 = (unsigned __int16)v39;
          }
          v32 = v40 + v14;
          v40 = v32;
          if (v31 == 1 && v32 > v17)
            v17 = v32;
        }
        v14 = 0;
        LOWORD(v39) = v30;
      }
      v14 += v18;
      v41 = v14;
      if (++v16 >= *(_DWORD *)(a3 + 48))
        goto LABEL_33;
    }
    if (!v41)
      goto LABEL_43;
  }
  else
  {
    v17 = 0;
    Sectors = 12;
LABEL_33:
    if (!v14)
      goto LABEL_43;
  }
  if ((((unsigned __int16)v39 + 1) & a2) != 0)
    Sectors = a5(a6, 1, &v39);
  if (Sectors)
  {
    v33 = *(_QWORD *)(a1 + 56);
    goto LABEL_44;
  }
  v34 = v40 + v41;
  v40 = v34;
  v41 = 0;
  if (v34 <= v17)
    LODWORD(v34) = v17;
  Sectors = 0;
  if ((unsigned __int16)v39 == 1)
    v17 = v34;
LABEL_43:
  v33 = v17;
  *(_QWORD *)(a1 + 56) = v17;
LABEL_44:
  *(_DWORD *)(a1 + 72) = v33 / (*(_QWORD *)(a1 + 40) - *(_QWORD *)(a1 + 48));
  free(v11);
  if (Sectors == -1)
    Sectors = *__error();
  return (__int16)Sectors;
}

uint64_t MKRecordFATFSRuns(uint64_t a1, int a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t *), uint64_t a4)
{
  uint64_t v8;
  FILE *v10;
  char *v11;
  char *v12;
  int FileDescriptor;
  const char *v14;
  int v15;
  const char *v16;
  const char *v17;
  unint64_t v18;
  unint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[17];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  memset(v23, 0, sizeof(v23));
  v27 = 0u;
  memset(v28, 0, sizeof(v28));
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  MKMediaGetGeometry(a1, (uint64_t)v23);
  v8 = _MKFATFSReadBPB(a1, (uint64_t)&v29);
  if (!(_DWORD)v8)
  {
    if (a2 < 0)
    {
      v10 = (FILE *)*MEMORY[0x24BDAC8D8];
      v11 = (char *)malloc_type_malloc(0x400uLL, 0x7F18E33FuLL);
      if (v11)
      {
        v12 = v11;
        FileDescriptor = MKMediaGetFileDescriptor(a1);
        if (fcntl(FileDescriptor, 50, v12) != -1)
        {
          v14 = "s";
          v15 = v32 * WORD6(v29);
          if (v15 == 1)
            v16 = "";
          else
            v16 = "s";
          if ((_DWORD)v32 == 1)
            v14 = "";
          fprintf(v10, "%s: %u sector%s in %u FAT%u cluster%s (%u bytes/cluster)\n", v12, v15, v16, (_DWORD)v32, dword_212DE45C0[v29], v14, WORD4(v29) * WORD6(v29));
          fprintf(v10, "bps=%u spc=%u res=%u nft=%u", WORD4(v29), WORD6(v29), HIWORD(v29), (unsigned __int16)v30);
          if (WORD1(v30))
            fprintf(v10, " rde=%u", WORD1(v30));
          if ((v29 - 1) >= 2)
          {
            if ((_DWORD)v29 == 3)
            {
              fprintf(v10, " mid=%#x", WORD4(v30));
              fprintf(v10, " spt=%u hds=%u hid=%u", (unsigned __int16)v31, WORD1(v31), WORD2(v31));
              fprintf(v10, " bsec=%u bspf=%u rdcl=%u", DWORD1(v30) / WORD3(v29), HIDWORD(v30), WORD3(v31));
              fwrite(" infs=", 6uLL, 1uLL, v10);
              if (WORD4(v31) == 0xFFFFLL)
                fprintf(v10, "%#x");
              else
                fprintf(v10, "%u");
              fwrite(" bkbs=", 6uLL, 1uLL, v10);
              if (WORD5(v31) == 0xFFFFLL)
                v17 = "%#x";
              else
                v17 = "%u";
              fprintf(v10, v17, WORD5(v31), v21, v22);
            }
          }
          else
          {
            fprintf(v10, " sec=%u mid=%#x spf=%u", DWORD1(v30) / WORD3(v29), WORD4(v30), HIDWORD(v30));
            fprintf(v10, " spt=%u hds=%u hid=%u");
          }
          printf("\nvl=\"%s\"\n", (const char *)&v34 + 12);
        }
        free(v12);
      }
    }
    LOWORD(v24) = 3;
    WORD1(v24) = v29;
    HIDWORD(v24) = WORD3(v29);
    LODWORD(v25) = LODWORD(v23[0]) >> 9;
    v18 = *((_QWORD *)&v23[0] + 1);
    *((_QWORD *)&v25 + 1) = *((_QWORD *)&v23[0] + 1);
    *(_QWORD *)&v26 = *((_QWORD *)&v23[0] + 1);
    v19 = ((unint64_t)v32 << (v33 - BYTE8(v33))) + DWORD1(v32);
    *((_QWORD *)&v26 + 1) = v19;
    *(_QWORD *)&v27 = DWORD2(v32);
    *((_QWORD *)&v27 + 1) = v19 - 1;
    if (BYTE12(v34))
    {
      uniconvert((char *)v28 + 12, 256, 0x8000100u, 0, (const UInt8 *)&v34 + 12, 12, 0x500u, 1u);
      v18 = *((_QWORD *)&v25 + 1);
      v19 = *((_QWORD *)&v26 + 1);
    }
    v20 = (float)v18 / (float)v19;
    v8 = 22;
    if (v20 <= 1000.0 && v20 >= 0.001)
    {
      v8 = a3(a4, 0, 0);
      if (!(_DWORD)v8)
      {
        if ((a2 & 0x40003) == 0 || (v8 = FATSuperTidemark((uint64_t)&v24, a2, (uint64_t)&v29, a1, a3, a4), !(_DWORD)v8))
          v8 = a3(a4, 3, (uint64_t *)&v24);
        a3(a4, 4, 0);
      }
    }
  }
  return v8;
}

CFMutableDictionaryRef MKCFCreateFATFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  int v9;
  BOOL v10;

  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    *v6 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(v7 + 8) = Mutable;
    v9 = MKRecordFATFSRuns(a1, *(_DWORD *)v7, (uint64_t (*)(uint64_t, uint64_t, uint64_t *))MKCFRecordFSInfo, v7);
    if (v9)
      v10 = Mutable == 0;
    else
      v10 = 1;
    if (!v10)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_11;
  }
  return Mutable;
}

CFTypeRef CopyDeviceTreeProperty(const __CFString *a1)
{
  io_registry_entry_t v2;
  io_object_t v3;
  CFTypeRef CFProperty;

  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/");
  if (!v2)
    return 0;
  v3 = v2;
  CFProperty = IORegistryEntryCreateCFProperty(v2, a1, 0, 0);
  IOObjectRelease(v3);
  return CFProperty;
}

uint64_t DevEntryCopyRegistryProperty(char *bsdName, const __CFString *a2, _QWORD *a3)
{
  mach_port_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  CFTypeRef CFProperty;
  uint64_t result;

  v5 = *MEMORY[0x24BDD8B18];
  v6 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, bsdName);
  MatchingService = IOServiceGetMatchingService(v5, v6);
  if (MatchingService)
  {
    v8 = MatchingService;
    CFProperty = IORegistryEntryCreateCFProperty(MatchingService, a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    IOObjectRelease(v8);
    result = 0;
  }
  else
  {
    CFProperty = 0;
    result = 2;
  }
  *a3 = CFProperty;
  return result;
}

uint64_t DevEntryCopyPropertiesForChildMatchingClass(char *bsdName, const char *a2, _QWORD *a3)
{
  mach_port_t v5;
  const __CFDictionary *v6;
  uint64_t MatchingService;
  io_object_t v8;
  uint64_t v9;
  io_object_t v10;
  io_object_t v11;
  CFMutableDictionaryRef v13;
  io_iterator_t iterator;

  iterator = 0;
  v13 = 0;
  v5 = *MEMORY[0x24BDD8B18];
  v6 = IOBSDNameMatching(*MEMORY[0x24BDD8B18], 0, bsdName);
  MatchingService = IOServiceGetMatchingService(v5, v6);
  if ((_DWORD)MatchingService)
  {
    v8 = MatchingService;
    v9 = MEMORY[0x2199A57D8](MatchingService, "IOService", &iterator);
    if (!(_DWORD)v9)
    {
      v10 = IOIteratorNext(iterator);
      if (v10)
      {
        v11 = v10;
        while (!IOObjectConformsTo(v11, a2))
        {
          IOObjectRelease(v11);
          v11 = IOIteratorNext(iterator);
          if (!v11)
            goto LABEL_7;
        }
        IORegistryEntryCreateCFProperties(v11, &v13, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        v9 = 0;
      }
      else
      {
LABEL_7:
        v9 = 22;
      }
    }
    IOObjectRelease(v8);
  }
  else
  {
    v9 = 2;
  }
  if (iterator)
    IOObjectRelease(iterator);
  *a3 = v13;
  return v9;
}

uint64_t MachineBoots9()
{
  const __CFData *v0;
  const char *BytePtr;
  CFIndex Length;
  CFIndex v3;
  CFIndex v4;
  size_t v5;
  uint64_t v6;

  v0 = (const __CFData *)CopyDeviceTreeProperty(CFSTR("compatible"));
  BytePtr = (const char *)CFDataGetBytePtr(v0);
  Length = CFDataGetLength(v0);
  if (Length < 1)
  {
LABEL_6:
    v6 = 0;
  }
  else
  {
    v3 = Length;
    LODWORD(v4) = 0;
    while (strcmp(BytePtr, "MacRISC") && strcmp(BytePtr, "MacRISC2"))
    {
      v5 = strlen(BytePtr);
      BytePtr += v5 + 1;
      v4 = (int)v5 + 1 + (int)v4;
      if (v4 >= v3)
        goto LABEL_6;
    }
    v6 = 1;
  }
  CFRelease(v0);
  return v6;
}

uint64_t MKHFSResizeVolume(unint64_t a1, const void *a2, uint64_t a3)
{
  const __CFDictionary *v6;
  const __CFNumber *Value;
  __CFDictionary *Mutable;
  const __CFDictionary *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  const __CFNumber *v15;
  const __CFDictionary *v16;
  const __CFNumber *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  unint64_t valuePtr;
  unsigned int v29;

  v27 = 0;
  valuePtr = 0;
  v26 = 0;
  v24 = 0;
  v25 = 0;
  v23 = 0;
  v6 = (const __CFDictionary *)MKMediaCopyProperty((uint64_t)a2, (uint64_t)CFSTR("Geometry"));
  Value = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("Sector Count"));
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  v29 = -34;
  if (valuePtr >= a1)
  {
    v29 = MKFileSystemDetect((uint64_t)a2, (int *)&v27 + 1, (int *)&v27, &v26);
    if (!v29)
    {
      v29 = 22;
      if (v26 == 1)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionaryAddValue(Mutable, CFSTR("Record Tidemark"), (const void *)*MEMORY[0x24BDBD270]);
        v9 = MKCFCreateHFSInfo(a2, Mutable, &v29);
        CFRelease(Mutable);
        if (v9)
        {
          v10 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("Tidemark"));
          CFNumberGetValue(v10, kCFNumberSInt64Type, &v25);
          ++v25;
          v11 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("Volume block size"));
          CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)&v24 + 4);
          switch((int)v27)
          {
            case 1:
              v29 = -34;
              if (v25 + 2 <= a1)
              {
                v13 = MKHFSStdResize(a1, (uint64_t)a2);
                goto LABEL_21;
              }
              break;
            case 2:
            case 4:
              v29 = -34;
              v12 = 2;
              if (HIDWORD(v24) >= 0x400)
                v12 = (unint64_t)HIDWORD(v24) >> 9;
              if (v12 + v25 <= a1 && (unint64_t)HIDWORD(v24) >> 9 << 32 >= a1)
              {
                v13 = MKHFSPlusResize(a1, a2);
                goto LABEL_21;
              }
              break;
            case 3:
              v14 = HIDWORD(v24) >> 9;
              v15 = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("Volume offset"));
              CFNumberGetValue(v15, kCFNumberSInt32Type, &v24);
              v16 = (const __CFDictionary *)CFDictionaryGetValue(v9, CFSTR("Container"));
              v17 = (const __CFNumber *)CFDictionaryGetValue(v16, CFSTR("Volume block size"));
              CFNumberGetValue(v17, kCFNumberSInt32Type, &v23);
              v29 = -34;
              if (v14 <= 2)
                v18 = 2;
              else
                v18 = v14;
              v19 = v25 - v24 + v18;
              v20 = (unint64_t)v23 >> 9;
              if (v19 % v20)
                v21 = v19 / v20 + 1;
              else
                v21 = v19 / v20;
              if (v24 + v21 * v20 + 2 <= a1)
              {
                v13 = MKHFSWrappedResize(a1, (uint64_t)a2, a3);
LABEL_21:
                v29 = v13;
              }
              break;
            default:
              break;
          }
          CFRelease(v9);
        }
      }
    }
  }
  return v29;
}

uint64_t MKHFSStdResize(unint64_t a1, uint64_t a2)
{
  uint64_t Sectors;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  size_t v10;
  char *v11;
  char *v12;
  unsigned int v13;
  unsigned int v14;
  unint64_t v15;
  unsigned __int16 v17[7];
  unsigned __int16 v18;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned __int16 v22;
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  Sectors = MKMediaReadSectors(a2, 2uLL, 1uLL, (char *)v17, 0);
  if (!(_DWORD)Sectors)
  {
    TAO_HFSMasterDirectoryBlock_BigToHost(v17);
    v5 = (v22 - v18) << 12;
    if (v5 >= 0x10000)
      v5 = 0x10000;
    v6 = (unsigned __int16)((unint64_t)v21 >> 9);
    if (((v5 * v6) | 0x15) >= a1)
    {
      v7 = a1 - 2;
      v8 = (a1 - 2 - v22) / v6;
      if ((v8 & 7) != 0)
        v9 = ((unsigned __int16)v8 >> 3) + 1;
      else
        v9 = (unsigned __int16)v8 >> 3;
      v10 = ((_WORD)v9 + (((v9 & 0x1FF) != 0) << 9)) & 0x7E00;
      v11 = (char *)malloc_type_calloc(1uLL, v10, 0x37D4924EuLL);
      if (v11)
      {
        v12 = v11;
        v13 = v20;
        if ((unsigned __int16)v8 < v20)
          v13 = (unsigned __int16)v8;
        v14 = v13 >> 12;
        if ((v13 & 0xFFF) != 0)
          v15 = v14 + 1;
        else
          v15 = v14;
        Sectors = MKMediaReadSectors(a2, v18, v15, v11, 0);
        if (!(_DWORD)Sectors)
        {
          if (8 * v9 > (unsigned __int16)v8)
            SetBits(v12, (unsigned __int16)v8, 8 * v9 - (unsigned __int16)v8, 0);
          if ((v9 & 0x1FF) != 0)
            bzero(&v12[v9], 512 - (v9 & 0x1FF));
          v23 += v8 - v20;
          v20 = v8;
          if ((unsigned __int16)v8 < v19)
            v19 = 0;
          TAO_HFSMasterDirectoryBlock_BigToHost(v17);
          Sectors = MKMediaWriteSectors(a2, 2uLL, 1uLL, (char *)v17, 0);
          if (!(_DWORD)Sectors)
          {
            Sectors = MKMediaWriteSectors(a2, v7, 1uLL, (char *)v17, 0);
            if (!(_DWORD)Sectors)
            {
              TAO_HFSMasterDirectoryBlock_BigToHost(v17);
              Sectors = MKMediaWriteSectors(a2, v18, v10, v12, 0);
              if (!(_DWORD)Sectors)
                Sectors = MKMediaEraseSectors(a2, v10 + v18, v22 - (v10 + v18), 0);
            }
          }
        }
        free(v12);
      }
      else
      {
        return 12;
      }
    }
    else
    {
      return 4294967262;
    }
  }
  return Sectors;
}

uint64_t MKHFSPlusResize(unint64_t a1, const void *a2)
{
  uint64_t Sectors;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  const __CFDictionary *v14;
  char *v15;
  char *v16;
  CFTypeID v17;
  char *v18;
  CFTypeID v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  CFTypeID v22;
  char *v23;
  CFTypeID v24;
  char *v25;
  CFTypeID v26;
  char *v27;
  CFTypeID v28;
  unsigned int v29;
  unint64_t v30;
  unsigned int v31;
  size_t v32;
  int v33;
  int v34;
  const __CFNumber *Value;
  const __CFNumber *v37;
  CFTypeID v38;
  uint64_t v39;
  unsigned int v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t valuePtr;
  char v46[44];
  uint64_t v47;
  _DWORD v48[28];
  _QWORD v49[10];
  uint64_t v50[10];
  uint64_t v51[10];
  uint64_t v52[22];

  v52[21] = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  memset(v52, 0, 160);
  memset(v51, 0, sizeof(v51));
  memset(v50, 0, sizeof(v50));
  memset(v49, 0, sizeof(v49));
  memset(v48, 0, sizeof(v48));
  v43 = 0;
  v44 = 0;
  v41 = 0;
  v42 = 0;
  Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v48, 0);
  if (!(_DWORD)Sectors)
  {
    TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6 = CFNumberCreate(v4, kCFNumberSInt64Type, &valuePtr);
    CFDictionaryAddValue(Mutable, CFSTR("volume sectors"), v6);
    CFRelease(v6);
    if ((v48[1] & 0x2000) != 0)
    {
      v44 = 0;
      v7 = CFNumberCreate(v4, kCFNumberSInt64Type, &v44);
      CFDictionaryAddValue(Mutable, CFSTR("journal size"), v7);
      CFRelease(v7);
    }
    v8 = CFNumberCreate(v4, kCFNumberSInt32Type, &v48[10]);
    CFDictionaryAddValue(Mutable, CFSTR("block size"), v8);
    CFRelease(v8);
    Sectors = GetBTreeNodeSize((uint64_t)a2, v52, v48[10], (_DWORD *)&v43 + 1);
    if (!(_DWORD)Sectors)
    {
      if (HIDWORD(v43))
      {
        v9 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
        CFDictionaryAddValue(Mutable, CFSTR("attr node size"), v9);
        CFRelease(v9);
      }
      Sectors = GetBTreeNodeSize((uint64_t)a2, v51, v48[10], (_DWORD *)&v43 + 1);
      if (!(_DWORD)Sectors)
      {
        v10 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
        CFDictionaryAddValue(Mutable, CFSTR("cat node size"), v10);
        CFRelease(v10);
        Sectors = GetBTreeNodeSize((uint64_t)a2, v50, v48[10], (_DWORD *)&v43 + 1);
        if (!(_DWORD)Sectors)
        {
          v11 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v43 + 4);
          CFDictionaryAddValue(Mutable, CFSTR("ext node size"), v11);
          CFRelease(v11);
          v12 = TAOCopyHFSPlusParametersDict(Mutable, &v43);
          v13 = v12;
          if ((_DWORD)v43)
            v14 = 0;
          else
            v14 = v12;
          if (!v14)
          {
LABEL_28:
            v29 = v48[11];
            v30 = valuePtr / ((unint64_t)v48[10] >> 9);
            v31 = v30 >> 3;
            if ((v30 & 7) != 0)
              v32 = v31 + 1;
            else
              v32 = v31;
            v16 = (char *)malloc_type_calloc(1uLL, v32, 0x1435ADE7uLL);
            if (!v16)
            {
              Sectors = 12;
              goto LABEL_56;
            }
            Sectors = ReadWriteFileToFromBuffer(a2, v16, v32, (uint64_t)v49, v48[10] >> 9, 0);
            if ((_DWORD)Sectors)
              goto LABEL_56;
            if (8 * (int)v32 > v30)
              SetBits(v16, v30, 8 * v32 - v30, 0);
            if (v29 < v30)
            {
              v33 = 8 * LODWORD(v49[0]);
              if (8 * v49[0] >= (unint64_t)v30)
                v33 = v30;
              SetBits(v16, v29, v33 - v29, 0);
            }
            v48[12] += v30 - v48[11];
            v48[11] = v30;
            if (v48[13] > v30)
              v48[13] = 0;
            if (v48[10] > 0x200u)
              v34 = 1;
            else
              v34 = 2;
            if (v29 < v30)
              SetBits(v16, v29 - v34, 1u, 0);
            SetBits(v16, v30 - v34, 1u, 1);
            if (v49[0] < v32)
            {
              Sectors = GrowAllocFile((uint64_t)v48, v16, v30, a2);
              if ((_DWORD)Sectors)
              {
LABEL_56:
                if (!v14)
                  goto LABEL_58;
                goto LABEL_57;
              }
            }
            if (!v14 || (v48[1] & 0x2000) == 0)
            {
LABEL_50:
              TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
              Sectors = MKMediaWriteSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v48, 0);
              if (!(_DWORD)Sectors)
              {
                Sectors = MKMediaWriteSectors((uint64_t)a2, valuePtr - 2, 1uLL, (char *)v48, 0);
                if (!(_DWORD)Sectors)
                {
                  TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v48);
                  Sectors = ReadWriteFileToFromBuffer(a2, v16, v32, (uint64_t)v49, v48[10] >> 9, 1);
                }
              }
              goto LABEL_56;
            }
            Value = (const __CFNumber *)CFDictionaryGetValue(v14, CFSTR("journal size"));
            if (Value)
            {
              v37 = Value;
              v38 = CFGetTypeID(Value);
              if (v38 == CFNumberGetTypeID())
              {
                CFNumberGetValue(v37, kCFNumberSInt64Type, &v44);
                v39 = MKMediaReadSectors((uint64_t)a2, ((v48[10] >> 9) * v48[3]), 1uLL, v46, 0);
                if ((_DWORD)v39)
                {
LABEL_64:
                  Sectors = v39;
                  goto LABEL_57;
                }
                TAO_JournalInfoBlock_BigToHost((uint64_t)v46);
                if (v44 == v47)
                  goto LABEL_50;
                ChangeJournalSize((uint64_t)v48, v44, v16, v30, (uint64_t)v46);
                v41 = v46;
                LODWORD(v42) = v48[10];
                v40 = ApplyToHFSPlusCatalogRecords(a2, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))UpdateDotJournalFile, (uint64_t)&v41);
                if (v40)
                  Sectors = v40;
                else
                  Sectors = 22;
                if ((_DWORD)Sectors == -128)
                {
                  TAO_JournalInfoBlock_BigToHost((uint64_t)v46);
                  v39 = MKMediaWriteSectors((uint64_t)a2, ((v48[10] >> 9) * v48[3]), 1uLL, v46, 0);
                  if (!(_DWORD)v39)
                    goto LABEL_50;
                  goto LABEL_64;
                }
LABEL_57:
                CFRelease(v13);
LABEL_58:
                if (v16)
                  free(v16);
                return Sectors;
              }
            }
LABEL_54:
            Sectors = 22;
            goto LABEL_57;
          }
          v15 = (char *)CFDictionaryGetValue(v14, CFSTR("cat clump size"));
          v16 = v15;
          if (!v15)
            goto LABEL_54;
          v17 = CFGetTypeID(v15);
          if (v17 == CFNumberGetTypeID())
          {
            CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v51[1]);
            v18 = (char *)CFDictionaryGetValue(v14, CFSTR("ext clump size"));
            v16 = v18;
            if (!v18)
              goto LABEL_54;
            v19 = CFGetTypeID(v18);
            if (v19 == CFNumberGetTypeID())
            {
              CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v50[1]);
              v20 = (const __CFNumber *)CFDictionaryGetValue(v14, CFSTR("attr clump size"));
              if (v52[0])
              {
                v21 = v20;
                if (v20)
                {
                  v22 = CFGetTypeID(v20);
                  if (v22 != CFNumberGetTypeID())
                    goto LABEL_53;
                  CFNumberGetValue(v21, kCFNumberSInt32Type, &v52[1]);
                }
              }
              v23 = (char *)CFDictionaryGetValue(v14, CFSTR("alloc clump size"));
              v16 = v23;
              if (!v23)
                goto LABEL_54;
              v24 = CFGetTypeID(v23);
              if (v24 == CFNumberGetTypeID())
              {
                CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v49[1]);
                v25 = (char *)CFDictionaryGetValue(v14, CFSTR("data clump size"));
                v16 = v25;
                if (!v25)
                  goto LABEL_54;
                v26 = CFGetTypeID(v25);
                if (v26 == CFNumberGetTypeID())
                {
                  CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v48[15]);
                  v27 = (char *)CFDictionaryGetValue(v14, CFSTR("resource clump size"));
                  v16 = v27;
                  if (!v27)
                    goto LABEL_54;
                  v28 = CFGetTypeID(v27);
                  if (v28 == CFNumberGetTypeID())
                  {
                    CFNumberGetValue((CFNumberRef)v16, kCFNumberSInt32Type, &v48[14]);
                    goto LABEL_28;
                  }
                }
              }
            }
          }
LABEL_53:
          v16 = 0;
          goto LABEL_54;
        }
      }
    }
  }
  return Sectors;
}

uint64_t MKHFSWrappedResize(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Sectors;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  size_t v11;
  size_t v12;
  _BYTE *v13;
  _BYTE *v14;
  unint64_t v16;
  const void *v17;
  unsigned int v18;
  __int128 v19;
  __int128 v20;
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
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0;
  Sectors = MKMediaReadSectors(a2, 2uLL, 1uLL, (char *)&v19, 0);
  if (!(_DWORD)Sectors)
  {
    TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19);
    if ((WORD6(v20) - HIWORD(v19)) << 12 >= 0x10000)
      v7 = 0x10000;
    else
      v7 = (WORD6(v20) - HIWORD(v19)) << 12;
    v8 = (unint64_t)DWORD1(v20) >> 9;
    if (WORD6(v20) + v7 * (_DWORD)v8 + 2 >= a1)
    {
      v9 = a1 - 2;
      v10 = (a1 - 2 - WORD6(v20)) / v8;
      if ((v10 & 7) != 0)
        v11 = ((unsigned __int16)v10 >> 3) + 1;
      else
        v11 = (unsigned __int16)v10 >> 3;
      v12 = ((_WORD)v11 + (((v11 & 0x1FF) != 0) << 9)) & 0x7E00;
      v13 = malloc_type_malloc(v12, 0x8152B5EEuLL);
      if (v13)
      {
        v14 = v13;
        memset(v13, 255, v11);
        if (8 * (int)v11 > (unsigned __int16)v10)
          SetBits(v14, (unsigned __int16)v10, 8 * v11 - (unsigned __int16)v10, 0);
        if ((v11 & 0x1FF) != 0)
          bzero(&v14[v11], 512 - (v11 & 0x1FF));
        LOWORD(v27) = v10 - WORD1(v20) + v27;
        WORD1(v20) = v10;
        if ((unsigned __int16)v10 < (unsigned __int16)v20)
          LOWORD(v20) = 0;
        TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19);
        Sectors = MKMediaWriteSectors(a2, 2uLL, 1uLL, (char *)&v19, 0);
        if ((_DWORD)Sectors
          || (Sectors = MKMediaWriteSectors(a2, v9, 1uLL, (char *)&v19, 0), (_DWORD)Sectors)
          || (TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)&v19),
              Sectors = MKMediaWriteSectors(a2, HIWORD(v19), v12, v14, 0),
              (_DWORD)Sectors)
          || (Sectors = MKMediaEraseSectors(a2, v12 + HIWORD(v19), WORD6(v20) - (v12 + HIWORD(v19)), 0),
              (_DWORD)Sectors))
        {
          free(v14);
        }
        else
        {
          v16 = (DWORD1(v20) >> 9) * (unsigned __int16)v27;
          v17 = (const void *)MKMediaCreateWithSubRange(*MEMORY[0x24BDBD240], a2, WORD6(v20) + (DWORD1(v20) >> 9) * HIWORD(v26), v16, &v18);
          Sectors = v18;
          if (!v18)
            Sectors = MKHFSResizeVolume(v16, v17, a3);
          free(v14);
          if (v17)
            CFRelease(v17);
        }
      }
      else
      {
        return 12;
      }
    }
    else
    {
      return 4294967262;
    }
  }
  return Sectors;
}

uint64_t MKHFSGetResizeLimits(uint64_t a1, const void *a2)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v5;
  const __CFNumber *Value;
  int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  const __CFNumber *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unsigned int v28;
  uint64_t valuePtr;
  uint64_t v30;
  int v31;
  unsigned int Sectors;
  unsigned __int16 v33[20];
  unsigned int v34;
  int v35;
  unsigned __int16 v36[7];
  unsigned __int16 v37;
  unsigned __int16 v38;
  unsigned int v39;
  unsigned __int16 v40;
  unsigned __int16 v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  Sectors = 22;
  if (a1)
  {
    v31 = 0;
    valuePtr = 0;
    v30 = 0;
    v28 = 0;
    Sectors = MKFileSystemDetect((uint64_t)a2, &v31, (int *)&v30 + 1, &v30);
    if (!Sectors)
    {
      Sectors = 22;
      if ((_DWORD)v30 == 1)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        CFDictionaryAddValue(Mutable, CFSTR("Record Tidemark"), (const void *)*MEMORY[0x24BDBD270]);
        v5 = MKCFCreateHFSInfo(a2, Mutable, &Sectors);
        CFRelease(Mutable);
        if (v5)
        {
          Value = (const __CFNumber *)CFDictionaryGetValue(v5, CFSTR("Tidemark"));
          CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
          ++valuePtr;
          v7 = HIDWORD(v30);
          *(_DWORD *)(a1 + 28) = HIDWORD(v30);
          switch(v7)
          {
            case 1:
              Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v36, 0);
              if (!Sectors)
              {
                TAO_HFSMasterDirectoryBlock_BigToHost(v36);
                v14 = v39 >> 9;
                *(_DWORD *)(a1 + 24) = v39 >> 9;
                v15 = v40;
                v16 = (v40 - v37) << 12;
                if (v16 >= 0x10000)
                  v16 = 0x10000;
                *(_QWORD *)a1 = v40 + v14 * v38 + 2;
                *(_QWORD *)(a1 + 8) = (v16 * v14) | 0x15;
                v17 = v15 + valuePtr;
                goto LABEL_26;
              }
              break;
            case 2:
            case 4:
              Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v33, 0);
              if (!Sectors)
              {
                TAO_HFSPlusVolumeHeader_BigToHost(v33);
                v8 = v34;
                v9 = v35;
                v10 = (unint64_t)v34 >> 9;
                *(_DWORD *)(a1 + 24) = v10;
                *(_QWORD *)a1 = (v9 * v10);
                *(_QWORD *)(a1 + 8) = v10 << 32;
                v11 = v8 >= 0x400;
                v12 = 2;
                if (v11)
                  v12 = v10;
                v13 = valuePtr + v12;
                goto LABEL_27;
              }
              break;
            case 3:
              Sectors = MKMediaReadSectors((uint64_t)a2, 2uLL, 1uLL, (char *)v36, 0);
              if (!Sectors)
              {
                TAO_HFSMasterDirectoryBlock_BigToHost(v36);
                v18 = (const __CFNumber *)CFDictionaryGetValue(v5, CFSTR("Volume offset"));
                CFNumberGetValue(v18, kCFNumberSInt32Type, &v28);
                Sectors = MKMediaReadSectors((uint64_t)a2, v28 + 2, 1uLL, (char *)v33, 0);
                if (!Sectors)
                {
                  TAO_HFSPlusVolumeHeader_BigToHost(v33);
                  v19 = v34;
                  v20 = v34 >> 9;
                  *(_DWORD *)(a1 + 24) = v34 >> 9;
                  v21 = v40;
                  v22 = (unint64_t)v39 >> 9;
                  v23 = (v40 - v37) << 12;
                  if (v23 >= 0x10000)
                    v23 = 0x10000;
                  *(_QWORD *)a1 = v40 + 2 + v22 * v38;
                  *(_QWORD *)(a1 + 8) = (_DWORD)v21 + 2 + v23 * v22;
                  if (v19 >= 0x400)
                    v24 = v20;
                  else
                    v24 = 2;
                  v25 = valuePtr - v28 + v24;
                  if (v25 % v22)
                    v26 = v25 / v22 + 1;
                  else
                    v26 = v25 / v22;
                  v17 = v21 + v26 * v22 + v22 * v41;
LABEL_26:
                  v13 = v17 + 2;
LABEL_27:
                  *(_QWORD *)(a1 + 16) = v13;
                }
              }
              break;
            default:
              break;
          }
          CFRelease(v5);
        }
      }
    }
  }
  return Sectors;
}

_BYTE *SetBits(_BYTE *result, unsigned int a2, unsigned int a3, int a4)
{
  unsigned int v5;
  unsigned int v6;
  _BYTE *v7;
  unsigned int v8;
  int v9;
  int v10;
  unint64_t v11;
  char v12;
  unsigned int v13;
  char *v14;
  int v15;
  int v16;
  unint64_t v17;
  char v18;

  v5 = a3;
  v6 = a2;
  v7 = result;
  if ((a2 & 7) != 0)
  {
    v8 = 8 - (a2 & 7);
    v9 = -1 << v8;
    if (v8 > a3)
      v10 = 8 - (a2 & 7);
    else
      v10 = a3;
    if (v8 > a3)
      LOBYTE(v9) = (-1 << v8) & 0xFE | ~(-1 << (v8 - a3));
    v11 = (unint64_t)a2 >> 3;
    if (a4)
      v12 = result[v11] | ~(_BYTE)v9;
    else
      v12 = result[v11] & v9;
    result[v11] = v12;
    v6 = v8 + a2;
    v5 = v10 - v8;
  }
  v13 = v5 - 8;
  if (v5 >= 8)
  {
    v14 = &result[v6 >> 3];
    if (a4)
      v15 = -1;
    else
      v15 = 0;
    result = memset(v14, v15, (v13 >> 3) + 1);
    v6 += (v13 & 0xFFFFFFF8) + 8;
    v5 &= 7u;
  }
  if (v5)
  {
    v16 = -1 << (8 - v5);
    v17 = (unint64_t)v6 >> 3;
    if (a4)
      v18 = v7[v17] | v16;
    else
      v18 = v7[v17] & ~(_BYTE)v16;
    v7[v17] = v18;
  }
  return result;
}

BOOL BitsClear(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  int v5;
  unsigned __int8 *v6;

  if ((a2 & 7) != 0)
  {
    v3 = 8 - (a2 & 7);
    v4 = -1 << v3;
    if (v3 > a3)
      v5 = 8 - (a2 & 7);
    else
      v5 = a3;
    if (v3 > a3)
      LOBYTE(v4) = (-1 << v3) & 0xFE | ~(-1 << (v3 - a3));
    if ((*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) & (~(_BYTE)v4 | 0xFFFFFF00)) != 0)
      return 0;
    a2 += v3;
    a3 = v5 - v3;
  }
  if (a3 >= 8)
  {
    v6 = (unsigned __int8 *)(a1 + (a2 >> 3));
    while (!*v6++)
    {
      a2 += 8;
      a3 -= 8;
      if (a3 <= 7)
        return !a3 || !(*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) >> (8 - a3));
    }
    return 0;
  }
  return !a3 || !(*(unsigned __int8 *)(a1 + ((unint64_t)a2 >> 3)) >> (8 - a3));
}

uint64_t ScanForZeros(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  BOOL v8;
  BOOL v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;

  v3 = (a2 & 0xFFFFFFE0) - a3;
  v4 = 0;
  v9 = __CFADD__(v3, 1);
  v5 = v3 + 1;
  if (!v9)
  {
    do
    {
      if ((v4 & 0x1F) == 0)
        goto LABEL_51;
      v6 = bswap32(*(_DWORD *)(a1 + 4 * (v4 >> 5)));
      v7 = 0x80000000 >> (v4 & 0x1F);
      v8 = v4 < v5;
      v9 = (v7 & v6) == 0 || v4 >= v5;
      if (v9)
      {
        v7 = 1;
      }
      else
      {
        do
        {
          v10 = v6 & (v7 >> 1);
          v7 >>= 1;
          v4 = (v4 + 1);
          v8 = v4 < v5;
        }
        while (v10 && v4 < v5);
      }
      if (!v7 || !v8)
      {
LABEL_51:
        while (v4 < v5)
        {
          v11 = *(_DWORD *)(a1 + 4 * (v4 >> 5));
          if (v11 != -1)
          {
            v12 = bswap32(v11);
            if ((v12 & 0x80000000) != 0 && v4 < v5)
            {
              v13 = 0x80000000;
              do
              {
                v4 = (v4 + 1);
                if ((v12 & (v13 >> 1)) == 0)
                  break;
                v13 >>= 1;
              }
              while (v4 < v5);
            }
            break;
          }
          v4 = (v4 + 32);
        }
        if (v4 >= v5)
          break;
      }
      v14 = v4 + a3;
      v15 = v4;
      v16 = v4 & 0x1F;
      if ((v4 & 0x1F) == 0)
        goto LABEL_36;
      v17 = bswap32(*(_DWORD *)(a1 + 4 * (v4 >> 5)));
      v18 = 0x80000000 >> v16;
      v15 = v4;
      if (((0x80000000 >> v16) & v17) != 0 || v4 >= v14)
      {
        if (v4 >= v14)
          break;
      }
      else
      {
        do
        {
          v20 = v18;
          v15 = (v15 + 1);
          if (v18 < 2)
            break;
          if ((v17 & (v18 >> 1)) != 0)
            break;
          v18 >>= 1;
        }
        while (v15 < v14);
        if (v15 >= v14)
          break;
        if (v20 < 2)
        {
LABEL_36:
          while (v15 < v14)
          {
            v21 = *(_DWORD *)(a1 + 4 * (v15 >> 5));
            if (v21)
            {
              v22 = bswap32(v21);
              if ((v22 & 0x80000000) == 0 && v15 < v14)
              {
                v23 = 0x80000000;
                do
                {
                  v15 = (v15 + 1);
                  if ((v22 & (v23 >> 1)) != 0)
                    break;
                  v23 >>= 1;
                }
                while (v15 < v14);
              }
              break;
            }
            v15 = (v15 + 32);
          }
          if (v15 >= v14)
            break;
        }
      }
      v4 = v15;
    }
    while (v15 < v5);
  }
  if (v4 >= v5)
    return 0xFFFFFFFFLL;
  else
    return v4;
}

uint64_t GetBTreeNodeSize(uint64_t a1, uint64_t *a2, unsigned int a3, _DWORD *a4)
{
  uint64_t v5;
  uint64_t result;
  char v7[14];
  unsigned __int16 v8[249];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = *a2;
  if (*a2)
  {
    result = MKMediaReadSectors(a1, *((_DWORD *)a2 + 4) * (a3 >> 9), 1uLL, v7, 0);
    if ((_DWORD)result)
      return result;
    TAO_BTHeaderRec_BigToHost(v8);
    LODWORD(v5) = v8[9];
  }
  result = 0;
  *a4 = v5;
  return result;
}

uint64_t GrowAllocFile(uint64_t a1, _BYTE *a2, unsigned int a3, const void *a4)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  int v18;
  uint64_t result;
  int v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  char *v25;
  _DWORD *v26;
  int v27;
  unsigned int v28;
  uint64_t v29;
  int v30;
  int v31;
  BOOL v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD *v37;
  _OWORD v38[4];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a3 >> 3;
  if ((a3 & 7) != 0)
    ++v8;
  v9 = *(_DWORD *)(a1 + 40);
  v10 = *(_DWORD *)(a1 + 120);
  if (v8 <= v10)
  {
    v12 = *(_DWORD *)(a1 + 124);
    v16 = v10 / v9 - v12;
  }
  else
  {
    v11 = v8 / v9;
    if (v8 % v9)
      ++v11;
    v12 = *(_DWORD *)(a1 + 124);
    v13 = v11 - v12;
    v14 = v10 / v9;
    v15 = v13 / v14;
    if (v13 % v14)
      ++v15;
    v16 = v15 * v14;
  }
  v17 = 0;
  v18 = 0;
  memset(v38, 0, sizeof(v38));
  v36 = 0;
  v37 = 0;
  v35 = 0;
  do
  {
    v18 += *(_DWORD *)(a1 + 132 + v17);
    if (v18 == v12)
    {
      v20 = 0;
      v21 = (_OWORD *)(a1 + 128);
      goto LABEL_19;
    }
    v17 += 8;
  }
  while (v17 != 64);
  LODWORD(v35) = 6;
  LODWORD(v36) = v12;
  v37 = v38;
  LODWORD(result) = ApplyToHFSPlusExtentRecords(a4, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))LastExtentFinder, (uint64_t)&v35);
  if ((_DWORD)result)
    result = result;
  else
    result = 22;
  if ((_DWORD)result == -128)
  {
    v20 = v36;
    v12 = *(_DWORD *)(a1 + 124);
    v21 = v38;
LABEL_19:
    v22 = 0;
    v23 = 4;
    v24 = v20;
    do
    {
      v24 += *(_DWORD *)((char *)v21 + v23);
      if (v24 == v12)
        break;
      ++v22;
      v23 += 8;
    }
    while (v22 != 8);
    v25 = (char *)v21 + 8 * v22;
    v27 = *((_DWORD *)v25 + 1);
    v26 = v25 + 4;
    v28 = v27 + *((_DWORD *)v21 + 2 * v22);
    if (BitsClear((uint64_t)a2, v28, v16))
    {
      SetBits(a2, v28, v16, 1);
      *v26 += v16;
      if (!v20)
        goto LABEL_35;
    }
    else
    {
      v29 = 0;
      v30 = v20;
      do
      {
        SetBits(a2, *(_DWORD *)((char *)v21 + v29), *(_DWORD *)((char *)v21 + v29 + 4), 0);
        v30 += *(_DWORD *)((char *)v21 + v29 + 4);
        v31 = *(_DWORD *)(a1 + 124);
        if (v30 == v31)
          break;
        v32 = v29 == 56;
        v29 += 8;
      }
      while (!v32);
      v33 = v31 - v20 + v16;
      v34 = ScanForZeros((uint64_t)a2, a3, v33);
      if (v34 == -1)
        return 4294967262;
      v21[2] = 0u;
      v21[3] = 0u;
      *v21 = 0u;
      v21[1] = 0u;
      *(_DWORD *)v21 = v34;
      *((_DWORD *)v21 + 1) = v33;
      SetBits(a2, v34, v33, 1);
      if (!v20)
      {
LABEL_35:
        result = 0;
        *(_DWORD *)(a1 + 124) += v16;
        *(_QWORD *)(a1 + 112) += *(_DWORD *)(a1 + 40) * v16;
        *(_DWORD *)(a1 + 48) -= v16;
        return result;
      }
    }
    LODWORD(result) = ApplyToHFSPlusExtentRecords(a4, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))LastExtentWriter, (uint64_t)&v35);
    if ((_DWORD)result)
      result = result;
    else
      result = 22;
    if ((_DWORD)result == -128)
      goto LABEL_35;
  }
  return result;
}

_BYTE *ChangeJournalSize(uint64_t a1, unint64_t a2, _BYTE *a3, int a4, uint64_t a5)
{
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  _BYTE *result;
  unsigned int v17;
  _DWORD *v18;
  unsigned int v19;
  _BYTE *v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  unsigned int v25;

  v9 = *(_QWORD *)(a5 + 44);
  v10 = *(unsigned int *)(a1 + 40);
  if (v9 % v10)
    v11 = v9 / v10 + 1;
  else
    v11 = v9 / v10;
  if (a2 % v10)
    v12 = a2 / v10 + 1;
  else
    v12 = a2 / v10;
  v13 = *(_QWORD *)(a5 + 36);
  if (v13 % v10)
    v14 = v13 / v10 + 1;
  else
    v14 = v13 / v10;
  if (v9 <= a2)
  {
    if (BitsClear((uint64_t)a3, v14 + v11, v12 - v11))
    {
      *(_QWORD *)(a5 + 44) = a2;
      v21 = a3;
      v22 = v14 + v11;
      v23 = v12 - v11;
    }
    else
    {
      SetBits(a3, v14, v11, 0);
      v24 = ScanForZeros((uint64_t)a3, a4, v12);
      if (v24 == -1)
      {
        result = SetBits(a3, v14, v11, 1);
        v12 = v11;
        goto LABEL_18;
      }
      v22 = v24;
      *(_QWORD *)(a5 + 36) = *(unsigned int *)(a1 + 40) * (unint64_t)v24;
      *(_QWORD *)(a5 + 44) = a2;
      v21 = a3;
      v23 = v12;
    }
    result = SetBits(v21, v22, v23, 1);
LABEL_18:
    v17 = v11 - v12;
    v25 = *(_DWORD *)(a1 + 48);
    v18 = (_DWORD *)(a1 + 48);
    v15 = v25;
    goto LABEL_19;
  }
  *(_QWORD *)(a5 + 44) = a2;
  v15 = v11 - v12;
  result = SetBits(a3, v14 + v12, v15, 0);
  v19 = *(_DWORD *)(a1 + 48);
  v18 = (_DWORD *)(a1 + 48);
  v17 = v19;
LABEL_19:
  *v18 = v17 + v15;
  *(_DWORD *)a5 |= 4u;
  return result;
}

uint64_t UpdateDotJournalFile(uint64_t a1, uint64_t a2, unsigned int *a3, char *a4)
{
  CFStringRef v7;
  uint64_t result;
  char v9;

  if (*(_DWORD *)(a1 + 2) == 2 && *(_WORD *)a2 == 2)
  {
    v7 = CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x24BDBD240], (const UniChar *)(a1 + 8), *(unsigned __int16 *)(a1 + 6));
    result = CFEqual(v7, CFSTR(".journal"));
    if ((_DWORD)result)
    {
      *(_QWORD *)(a2 + 88) = *(_QWORD *)(*(_QWORD *)a3 + 44);
      *(_DWORD *)(a2 + 100) = *(_QWORD *)(*(_QWORD *)a3 + 44) / (unint64_t)a3[2];
      *(_DWORD *)(a2 + 104) = *(_QWORD *)(*(_QWORD *)a3 + 36) / (unint64_t)a3[2];
      *(_DWORD *)(a2 + 108) = *(_QWORD *)(*(_QWORD *)a3 + 44) / (unint64_t)a3[2];
      result = 4294967168;
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
    result = 0;
  }
  *a4 = v9;
  return result;
}

uint64_t ReadWriteFileToFromBuffer(const void *a1, char *a2, unint64_t a3, uint64_t a4, unsigned int a5, int a6)
{
  uint64_t v8;
  const void *v10;
  size_t v11;
  size_t v12;
  __int128 v13;
  __int128 v14;
  size_t v15;
  unsigned int v16;
  uint64_t v17;
  _DWORD *v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  size_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  int v29;
  uint64_t Sectors;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  size_t __n;
  size_t __na;
  uint64_t v44;
  uint64_t v45;
  _OWORD *v46;
  _OWORD v47[4];
  uint64_t v48;

  v8 = a4;
  v10 = a1;
  v48 = *MEMORY[0x24BDAC8D0];
  v11 = *(unsigned int *)(a4 + 12);
  v12 = a5 << 9;
  v13 = *(_OWORD *)(a4 + 32);
  v47[0] = *(_OWORD *)(a4 + 16);
  v47[1] = v13;
  v14 = *(_OWORD *)(a4 + 64);
  __n = a3 / v12;
  if (a3 / v12 >= v11)
    LODWORD(v15) = v11;
  else
    v15 = a3 / v12;
  v47[2] = *(_OWORD *)(a4 + 48);
  v47[3] = v14;
  if (!(_DWORD)v15)
  {
    v17 = 0;
    v19 = 0;
    v16 = 0;
LABEL_22:
    if (__n >= v11 || (v25 = a3 - __n * v12) == 0)
    {
      v27 = 0;
      if (!a6)
        goto LABEL_65;
      goto LABEL_36;
    }
    v26 = malloc_type_calloc(1uLL, v12, 0x3DC9522DuLL);
    if (!v26)
      return 12;
    v27 = v26;
    __na = v25;
    if (v19 == *((_DWORD *)v47 + 2 * v17 + 1))
    {
      if (++v17 == 8)
      {
        v44 = 6;
        v45 = v16;
        v46 = v47;
        v28 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v44);
        v17 = 0;
        v23 = v28 ? v28 : 22;
        if ((_DWORD)v23 != -128)
          goto LABEL_67;
      }
      v19 = 0;
      v10 = a1;
    }
    v29 = *((_DWORD *)v47 + 2 * v17) + v19;
    if (a6)
    {
      memcpy(v27, a2, __na);
      Sectors = MKMediaWriteSectors((uint64_t)v10, v29 * a5, a5, (char *)v27, 0);
      if (!(_DWORD)Sectors)
      {
LABEL_64:
        ++v16;
        ++v19;
        v10 = a1;
        if (!a6)
          goto LABEL_65;
LABEL_36:
        v31 = *(_DWORD *)(v8 + 12);
        if (v16 < v31)
        {
          if (v19 == *((_DWORD *)v47 + 2 * v17 + 1))
          {
            if (++v17 == 8)
            {
              v44 = 6;
              v45 = v16;
              v46 = v47;
              v32 = ApplyToHFSPlusExtentRecords(v10, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v44);
              if (v32)
                v23 = v32;
              else
                v23 = 22;
              if ((_DWORD)v23 != -128)
                goto LABEL_66;
              v17 = 0;
              v31 = *(_DWORD *)(v8 + 12);
            }
            v19 = 0;
          }
          if (v16 < v31)
          {
            while (1)
            {
              v33 = v8;
              v34 = v31 - v16;
              v35 = *((_DWORD *)v47 + 2 * v17 + 1) - v19 >= v34 ? v34 : *((_DWORD *)v47 + 2 * v17 + 1) - v19;
              v36 = MKMediaEraseSectors((uint64_t)a1, (*((_DWORD *)v47 + 2 * v17) + v19) * a5, v35 * a5, 0);
              if ((_DWORD)v36)
                break;
              v16 += v35;
              v8 = v33;
              v31 = *(_DWORD *)(v33 + 12);
              if (v16 < v31 && ++v17 == 8)
              {
                v44 = 6;
                v45 = v16;
                v46 = v47;
                v37 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v44);
                if (v37)
                  v23 = v37;
                else
                  v23 = 22;
                if ((_DWORD)v23 != -128)
                  goto LABEL_66;
                v17 = 0;
                v31 = *(_DWORD *)(v33 + 12);
              }
              v19 = 0;
              v23 = 0;
              if (v16 >= v31)
                goto LABEL_66;
            }
            v23 = v36;
LABEL_66:
            if (!v27)
              return v23;
LABEL_67:
            free(v27);
            return v23;
          }
        }
LABEL_65:
        v23 = 0;
        goto LABEL_66;
      }
    }
    else
    {
      Sectors = MKMediaReadSectors((uint64_t)v10, v29 * a5, a5, (char *)v27, 0);
      if (!(_DWORD)Sectors)
      {
        memcpy(a2, v27, __na);
        goto LABEL_64;
      }
    }
    v23 = Sectors;
    goto LABEL_67;
  }
  v16 = 0;
  v17 = 0;
  v18 = v47;
  while (1)
  {
    v19 = *((_DWORD *)v47 + 2 * v17 + 1) >= v15 - v16 ? v15 - v16 : *((_DWORD *)v47 + 2 * v17 + 1);
    v20 = *v18 * a5;
    v21 = v19 * a5;
    v22 = a6
        ? MKMediaWriteSectors((uint64_t)v10, v20, v21, a2, 0)
        : MKMediaReadSectors((uint64_t)v10, v20, v21, a2, 0);
    v23 = v22;
    if ((_DWORD)v22)
      return v23;
    a2 += (v12 * v19);
    v16 += v19;
    if (v16 >= v15)
    {
      v8 = a4;
      v11 = *(unsigned int *)(a4 + 12);
      v10 = a1;
      goto LABEL_22;
    }
    if (++v17 == 8)
    {
      v44 = 6;
      v45 = v16;
      v46 = v47;
      v24 = ApplyToHFSPlusExtentRecords(a1, (uint64_t (*)(unsigned __int16 *, uint64_t, uint64_t, char *, __n128))GetFileExtentRecord, (uint64_t)&v44);
      v17 = 0;
      v23 = v24 ? v24 : 22;
      if ((_DWORD)v23 != -128)
        return v23;
    }
    v18 = (_DWORD *)v47 + 2 * v17;
    v10 = a1;
  }
}

uint64_t GetFileExtentRecord(uint64_t a1, __int128 *a2, uint64_t a3, _BYTE *a4)
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;

  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && *(_DWORD *)(a3 + 8) == *(_DWORD *)(a1 + 8))
  {
    v4 = *(_OWORD **)(a3 + 16);
    v5 = *a2;
    v6 = a2[1];
    v7 = a2[3];
    v4[2] = a2[2];
    v4[3] = v7;
    *v4 = v5;
    v4[1] = v6;
    result = 4294967168;
  }
  else
  {
    result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t LastExtentFinder(uint64_t a1, __int128 *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  int v5;
  uint64_t result;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3 && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4))
  {
    v4 = 4;
    v5 = *(_DWORD *)(a1 + 8);
    while (1)
    {
      v5 += *(_DWORD *)((char *)a2 + v4);
      if (v5 == *(_DWORD *)(a3 + 8))
        break;
      v4 += 8;
      if (v4 == 68)
        goto LABEL_6;
    }
    *(_DWORD *)(a3 + 8) = *(_DWORD *)(a1 + 8);
    v7 = *(_OWORD **)(a3 + 16);
    v8 = *a2;
    v9 = a2[1];
    v10 = a2[3];
    v7[2] = a2[2];
    v7[3] = v10;
    *v7 = v8;
    v7[1] = v9;
    result = 4294967168;
  }
  else
  {
LABEL_6:
    result = 0;
  }
  *a4 = 0;
  return result;
}

uint64_t LastExtentWriter(uint64_t a1, _OWORD *a2, uint64_t a3, _BYTE *a4)
{
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t result;

  if (*(_DWORD *)(a1 + 4) == *(_DWORD *)a3
    && *(unsigned __int8 *)(a1 + 2) == *(unsigned __int8 *)(a3 + 4)
    && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a3 + 8))
  {
    v4 = *(__int128 **)(a3 + 16);
    v5 = *v4;
    v6 = v4[1];
    v7 = v4[3];
    a2[2] = v4[2];
    a2[3] = v7;
    *a2 = v5;
    a2[1] = v6;
    result = 4294967168;
  }
  else
  {
    result = 0;
  }
  *a4 = 1;
  return result;
}

uint64_t MKReadHFSMDBVHB(uint64_t a1, int *a2, _BYTE *a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t result;
  char *v11;
  _BYTE *v12;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  _BYTE v21[512];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  result = 4294967246;
  if (!a1 || !a2)
    return result;
  *a2 = 0;
  v11 = a3 ? a3 : v21;
  result = MKMediaReadSectors(a1, 2uLL, 1uLL, v11, 0);
  if ((_DWORD)result)
    return result;
  if (*(_WORD *)v11 != 17474)
  {
    v15 = 0;
    v17 = 0;
LABEL_18:
    v18 = *(unsigned __int16 *)v11;
    if (*a2 == 3)
    {
      if (v18 != 11080)
        return 4294967173;
      goto LABEL_28;
    }
    v19 = __rev16(v18);
    if (v19 == 18475)
    {
      v20 = 2;
    }
    else
    {
      if (v19 != 18520)
      {
        if (!*a2)
          return 4294967173;
        goto LABEL_28;
      }
      v20 = 4;
    }
    *a2 = v20;
LABEL_28:
    TAO_HFSPlusVolumeHeader_BigToHost((unsigned __int16 *)v11);
    if (*a2 != 3)
      return 0;
    if (a4)
      *a4 = v15;
    if (!a5)
      return 0;
    result = 0;
    *a5 = v17;
    return result;
  }
  TAO_HFSMasterDirectoryBlock_BigToHost((unsigned __int16 *)v11);
  v12 = v21;
  if (a3)
    v13 = a3;
  else
    v13 = v21;
  if (*((_WORD *)v13 + 62) != 18475)
  {
    result = 0;
    *a2 = 1;
    return result;
  }
  *a2 = 3;
  if (a3)
    v12 = a3;
  v14 = (unint64_t)*((unsigned int *)v12 + 5) >> 9;
  v15 = *((unsigned __int16 *)v12 + 14) + *((unsigned __int16 *)v12 + 63) * (unint64_t)v14;
  v16 = *((unsigned __int16 *)v12 + 64);
  result = MKMediaReadSectors(a1, v15 + 2, 1uLL, v11, 0);
  if (!(_DWORD)result)
  {
    v17 = v16 * (unint64_t)v14;
    goto LABEL_18;
  }
  return result;
}

uint64_t MKWriteHFSMDBVHB(uint64_t a1, int a2, void *__src, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _OWORD v13[2];
  unsigned __int16 __dst[256];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  result = 4294967246;
  if (a1 && __src)
  {
    memset(v13, 0, sizeof(v13));
    memcpy(__dst, __src, sizeof(__dst));
    MKMediaGetGeometry(a1, (uint64_t)v13);
    switch(__dst[0])
    {
      case 0x4858u:
        v10 = *((_QWORD *)&v13[0] + 1);
        TAO_HFSPlusVolumeHeader_BigToHost(__dst);
        break;
      case 0x482Bu:
        v11 = a5 + a4;
        if (a2 == 3)
          v12 = a4 + 2;
        else
          v12 = 2;
        if (a2 == 3)
          v10 = v11;
        else
          v10 = *((_QWORD *)&v13[0] + 1);
        TAO_HFSPlusVolumeHeader_BigToHost(__dst);
        goto LABEL_16;
      case 0x4244u:
        v10 = *((_QWORD *)&v13[0] + 1);
        TAO_HFSMasterDirectoryBlock_BigToHost(__dst);
        break;
      default:
        return 4294967173;
    }
    v12 = 2;
LABEL_16:
    result = MKMediaWriteSectors(a1, v12, 1uLL, (char *)__dst, 0);
    if (!(_DWORD)result)
      return MKMediaWriteSectors(a1, v10 - 2, 1uLL, (char *)__dst, 0);
  }
  return result;
}

uint64_t MKHFSReadFile(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, char *a6)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;

  v10 = 0;
  v11 = 0;
  v12 = *(unsigned int *)(a2 + 40);
  if (a4 % v12)
    v13 = a4 / v12 + 1;
  else
    v13 = a4 / v12;
  if (a5 % v12)
    v14 = a5 / v12 + 1;
  else
    v14 = a5 / v12;
  LODWORD(result) = 22;
  LODWORD(v16) = *(_DWORD *)(a2 + 40);
  do
  {
    v17 = v13 - v11;
    if (v13 < v11)
      goto LABEL_15;
    v18 = *(unsigned int *)(a3 + v10 + 20);
    if (v13 >= v11 + v18)
      goto LABEL_15;
    v19 = v17 + *(unsigned int *)(a3 + v10 + 16);
    v20 = v18 - v17;
    v21 = v14 >= v20 ? v20 : v14;
    LODWORD(result) = MKMediaReadBlocks(a1, v19, v21, v16, a6, 0);
    if ((_DWORD)result)
      break;
    v13 += v21;
    v14 -= v21;
    v16 = *(unsigned int *)(a2 + 40);
    a6 += v21 * v16;
LABEL_15:
    v11 += *(unsigned int *)(a3 + v10 + 20);
    v10 += 8;
  }
  while (v10 != 64);
  if (v14)
    v22 = 27;
  else
    v22 = 0;
  if ((_DWORD)result)
    return result;
  else
    return v22;
}

uint64_t MKHFSWriteFile(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, char *a6)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unsigned int v22;

  v10 = 0;
  v11 = 0;
  v12 = *(unsigned int *)(a2 + 40);
  if (a4 % v12)
    v13 = a4 / v12 + 1;
  else
    v13 = a4 / v12;
  if (a5 % v12)
    v14 = a5 / v12 + 1;
  else
    v14 = a5 / v12;
  LODWORD(result) = 22;
  LODWORD(v16) = *(_DWORD *)(a2 + 40);
  do
  {
    v17 = v13 - v11;
    if (v13 < v11)
      goto LABEL_15;
    v18 = *(unsigned int *)(a3 + v10 + 20);
    if (v13 >= v11 + v18)
      goto LABEL_15;
    v19 = v17 + *(unsigned int *)(a3 + v10 + 16);
    v20 = v18 - v17;
    v21 = v14 >= v20 ? v20 : v14;
    LODWORD(result) = MKMediaWriteBlocks(a1, v19, v21, v16, a6, 0);
    if ((_DWORD)result)
      break;
    v13 += v21;
    v14 -= v21;
    v16 = *(unsigned int *)(a2 + 40);
    a6 += v21 * v16;
LABEL_15:
    v11 += *(unsigned int *)(a3 + v10 + 20);
    v10 += 8;
  }
  while (v10 != 64);
  if (v14)
    v22 = 27;
  else
    v22 = 0;
  if ((_DWORD)result)
    return result;
  else
    return v22;
}

uint64_t MKDetectAPFS(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  *a3 = 0;
  if (a4)
    *a4 = 0;
  if (*(_DWORD *)(a2 + 32) == 1112758350)
  {
    *a3 = 5000;
    if (a5)
      *a5 = 2;
  }
  return 0;
}

const char *MKAPFSIdentity()
{
  return "APFS";
}

uint64_t MKRecordAPFSRuns(uint64_t a1, int a2, uint64_t (*a3)(_QWORD, uint64_t, _QWORD *), uint64_t a4)
{
  double Geometry;
  uint64_t v8;
  const __CFDictionary *FreespaceInfo;
  const __CFDictionary *v10;
  const __CFString *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  CFIndex v17;
  const void *v18;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v27;
  void *key;
  uint64_t Count;
  unint64_t valuePtr;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[2];
  _OWORD v37[2];
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v39 = 0u;
  v40 = 0u;
  v38 = 0;
  memset(v37, 0, sizeof(v37));
  v34 = 0;
  v35 = 0;
  v36[0] = 0;
  v36[1] = a1;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  valuePtr = 0;
  Geometry = MKMediaGetGeometry(a1, (uint64_t)v37);
  LODWORD(v38) = LODWORD(v37[0]) >> 9;
  LOWORD(v39) = 2;
  LODWORD(v40) = LODWORD(v37[0]) >> 9;
  *((_QWORD *)&v40 + 1) = *((_QWORD *)&v37[0] + 1);
  v8 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, double))a3)(a4, 0, 0, Geometry);
  if (!(_DWORD)v8)
  {
    FreespaceInfo = (const __CFDictionary *)APFSContainerGetFreespaceInfo();
    if (!FreespaceInfo)
      return 12;
    v10 = FreespaceInfo;
    Value = (const __CFString *)CFDictionaryGetValue(FreespaceInfo, (const void *)*MEMORY[0x24BDFD330]);
    if (CFStringCompare(Value, CFSTR("APFS"), 1uLL))
    {
      v8 = 4294961996;
    }
    else
    {
      v12 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDFD310]);
      CFNumberGetValue(v12, kCFNumberSInt64Type, &valuePtr);
      HIDWORD(v39) = valuePtr >> 9;
      v13 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDFD338]);
      CFNumberGetValue(v13, kCFNumberSInt64Type, &v41);
      v14 = (const __CFNumber *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDFD340]);
      CFNumberGetValue(v14, kCFNumberSInt64Type, (char *)&v42 + 8);
      *((_QWORD *)&v41 + 1) = v41;
      if (HIDWORD(v39) >= 2)
      {
        *((_QWORD *)&v42 + 1) *= HIDWORD(v39);
        *(_QWORD *)&v41 = v41 * HIDWORD(v39);
        *((_QWORD *)&v41 + 1) = v41;
      }
      v15 = (const __CFArray *)CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BDFD328]);
      if (v15)
      {
        LOWORD(v34) = 0;
        LOWORD(v31) = 1;
        if ((a2 & 3) != 0)
        {
          v16 = v15;
          Count = (unsigned __int16)CFArrayGetCount(v15);
          if (Count)
          {
            v17 = 0;
            key = (void *)*MEMORY[0x24BDFD318];
            v18 = (const void *)*MEMORY[0x24BDFD320];
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v17);
              if (!ValueAtIndex)
                break;
              v20 = ValueAtIndex;
              v21 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, key);
              CFNumberGetValue(v21, kCFNumberSInt64Type, &v35);
              v22 = (const __CFNumber *)CFDictionaryGetValue(v20, v18);
              CFNumberGetValue(v22, kCFNumberSInt64Type, v36);
              if (HIDWORD(v39) >= 2)
              {
                v35 *= HIDWORD(v39);
                v36[0] *= HIDWORD(v39);
              }
              if ((((unsigned __int16)v31 + 1) & a2) != 0)
              {
                v33 = v35 - v32;
                if (v35 != v32)
                {
                  v23 = a3(a4, 1, &v31);
                  if ((_DWORD)v23)
                    goto LABEL_29;
                  v24 = v32 + v33;
                  v32 = v24;
                  if (v24 > *((_QWORD *)&v42 + 1))
                    *((_QWORD *)&v42 + 1) = v24;
                }
              }
              if ((((unsigned __int16)v34 + 1) & a2) != 0)
              {
                v23 = a3(a4, 1, &v34);
                if ((_DWORD)v23)
                  goto LABEL_29;
              }
              *(_QWORD *)&v42 = v42 + v36[0];
              v32 = v35 + v36[0];
              ++v17;
            }
            while (Count != v17);
            v25 = (unsigned __int16)v31 + 1;
          }
          else
          {
            v25 = 2;
          }
          if ((v25 & a2) != 0)
          {
            v33 = v41 - v32;
            if ((_QWORD)v41 != v32)
            {
              v8 = a3(a4, 1, &v31);
              if ((_DWORD)v8)
                goto LABEL_30;
              v27 = v32 + v33;
              v32 = v27;
              if (v27 > *((_QWORD *)&v42 + 1))
                *((_QWORD *)&v42 + 1) = v27;
            }
          }
        }
        DWORD2(v43) = *((_QWORD *)&v42 + 1) / (*((_QWORD *)&v41 + 1) - (_QWORD)v42);
        v23 = a3(a4, 3, &v39);
LABEL_29:
        v8 = v23;
        goto LABEL_30;
      }
      v8 = 2;
    }
LABEL_30:
    CFRelease(v10);
  }
  if ((_DWORD)v8 == -1)
    return *__error();
  return v8;
}

uint64_t MKAPFS_IO(uint64_t a1, int a2, uint64_t a3)
{
  const void *v5;
  const void *v6;
  int v7;
  uint64_t result;
  unsigned int v9;
  uint64_t v10;

  v10 = 0;
  if (!a1)
    return 22;
  if (a2 == 1)
  {
    if (a3)
      return MKMediaReadBlocks(*(_QWORD *)a1, *(_QWORD *)a3 / (uint64_t)*(unsigned int *)(a1 + 8), *(_QWORD *)(a3 + 8) / (uint64_t)*(unsigned int *)(a1 + 8), *(_DWORD *)(a1 + 8), *(char **)(a3 + 16), 0);
    return 22;
  }
  if (a2 != 2)
    return 4294961996;
  if (!a3)
    return 22;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  MKMediaGetAttributes(*(_QWORD *)a1, (double *)&v10);
  v5 = (const void *)MKMediaCopyProperty(*(_QWORD *)a1, (uint64_t)CFSTR("Writable"));
  if (v5)
  {
    v6 = v5;
    v7 = CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDBD270]);
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }
  result = 0;
  *(_DWORD *)a3 = *(_DWORD *)(a1 + 8);
  *(_QWORD *)(a3 + 8) = *(_QWORD *)(a1 + 16) / (unint64_t)*(unsigned int *)(a1 + 40);
  if ((v10 & HIDWORD(v10) & 1) != 0)
    v9 = 1;
  else
    v9 = (v7 == 0) & ((v10 & HIDWORD(v10)) >> 4);
  *(_DWORD *)(a3 + 20) = v7;
  *(_DWORD *)(a3 + 24) = v9;
  return result;
}

CFMutableDictionaryRef MKCFCreateAPFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  CFMutableDictionaryRef Mutable;
  int v9;
  BOOL v10;

  v6 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    *v6 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_QWORD *)(v7 + 8) = Mutable;
    v9 = MKRecordAPFSRuns(a1, *(_DWORD *)v7, (uint64_t (*)(_QWORD, uint64_t, _QWORD *))MKCFRecordFSInfo, v7);
    if (v9)
      v10 = Mutable == 0;
    else
      v10 = 1;
    if (!v10)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free((void *)v7);
    if (a3)
    {
      if (v9 != -1)
      {
LABEL_12:
        *a3 = v9;
        return Mutable;
      }
LABEL_11:
      v9 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_11;
  }
  return Mutable;
}

uint64_t _MKMediaFileInitialize(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const __CFAllocator *v4;
  __CFDictionary *Mutable;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  CFStringRef v10;
  const char *v12;
  int v13;
  uint64_t v14;

  v14 = 0;
  if (!a1 || *(_DWORD *)a1 != 1296786550)
    return 22;
  if (*(_DWORD *)(a1 + 4) == -1)
  {
    v12 = *(const char **)(a1 + 8);
    if (v12)
    {
      v13 = _MKMediaOpenFile(v12, theDict, (int *)&v14 + 1, (int *)&v14);
      if (v13 < 0)
        return *__error();
      *(_DWORD *)(a1 + 4) = v13;
      goto LABEL_8;
    }
    return 22;
  }
  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("Writable"));
    if (Value)
      HIDWORD(v14) = CFEqual(Value, (CFTypeRef)*MEMORY[0x24BDBD270]);
  }
  *(_QWORD *)(a1 + 8) = strdup("<unknown file>");
LABEL_8:
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 16) = Mutable;
  if (!Mutable)
    return 12;
  v6 = (const void *)*MEMORY[0x24BDBD270];
  v7 = (const void *)*MEMORY[0x24BDBD268];
  if (HIDWORD(v14))
    v8 = (const void *)*MEMORY[0x24BDBD270];
  else
    v8 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionaryAddValue(Mutable, CFSTR("Writable"), v8);
  if ((_DWORD)v14)
    v9 = v6;
  else
    v9 = v7;
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Shared Writer"), v9);
  v10 = CFStringCreateWithCString(v4, *(const char **)(a1 + 8), 0x8000100u);
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("Path"), v10);
  CFRelease(v10);
  return 0;
}

void _MKMediaFileDeinitialize(void *a1)
{
  _MKMediaCommonDeinitialize(a1);
}

__CFDictionary *_MKMediaFileCopyProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;

  v2 = *(const __CFDictionary **)(a1 + 16);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v2)
    MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  else
    MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = MutableCopy;
  _MKMediaFileGetGeoProperties((_DWORD *)a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaDeviceSetProperty()
{
  return 0;
}

__CFDictionary *_MKMediaBlockDeviceCopyProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;

  v2 = *(const __CFDictionary **)(a1 + 16);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v2)
    MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  else
    MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = MutableCopy;
  _MKMediaBlockDeviceGetGeoProperties((_DWORD *)a1, MutableCopy);
  return v5;
}

__CFDictionary *_MKMediaSubRangeCopyProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;

  v2 = *(const __CFDictionary **)(a1 + 32);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v2)
    MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  else
    MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = MutableCopy;
  _MKMediaSubRangeGetGeoProperties(a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaSubRangeSetProperty()
{
  return 0;
}

CFStringRef _MKMediaSubRangeDescription(uint64_t a1, const __CFDictionary *a2)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("<MKMediaRef>: [sub range of %@]"), *(_QWORD *)(a1 + 8));
}

CFStringRef _MKMediaCFRuntimeCopyFormattingDesc(uint64_t a1, CFDictionaryRef formatOptions)
{
  uint64_t (*v4)(_QWORD, CFDictionaryRef, _QWORD);
  CFStringRef result;

  v4 = *(uint64_t (**)(_QWORD, CFDictionaryRef, _QWORD))(a1 + 64);
  if (!v4)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], formatOptions, CFSTR("%s <%p>"), "MKMedia", a1);
  result = (CFStringRef)v4(*(_QWORD *)(a1 + 88), formatOptions, 0);
  if (!result)
    return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], formatOptions, CFSTR("%s <%p>"), "MKMedia", a1);
  return result;
}

uint64_t MKMediaCreateWithFileDescriptor(uint64_t a1, int a2, const __CFDictionary *a3, _DWORD *a4)
{
  int *v8;
  uint64_t result;
  int v10;
  void *v11;
  stat v12;
  int v13;

  if (a2 == -1)
  {
    result = 0;
    v10 = 22;
    goto LABEL_14;
  }
  memset(&v12, 0, sizeof(v12));
  if (fstat(a2, &v12))
  {
    v8 = __error();
    result = 0;
    v10 = *v8;
    goto LABEL_14;
  }
  if ((v12.st_mode & 0xF000) == 0x8000)
  {
    v11 = &kMKMediaFileVector;
  }
  else if (devname(v12.st_rdev, 0x6000u))
  {
    v11 = &kMKMediaBlockDeviceVector;
  }
  else
  {
    v11 = &kMKMediaCharDeviceVector;
  }
  result = (uint64_t)malloc_type_malloc(0x18uLL, 0x10300406712BA52uLL);
  if (!result)
  {
    v10 = 12;
LABEL_14:
    v13 = v10;
    if (!a4)
      return result;
    goto LABEL_15;
  }
  *(_DWORD *)result = 1296786550;
  *(_DWORD *)(result + 4) = a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  v13 = 0;
  result = MKMediaCreate(a1, result, (uint64_t)v11, a3, &v13);
  if (a4)
LABEL_15:
    *a4 = v13;
  return result;
}

uint64_t MKMediaCopyProperties(uint64_t result)
{
  if (result)
    return (*(uint64_t (**)(_QWORD))(result + 48))(*(_QWORD *)(result + 88));
  return result;
}

uint64_t MKMediaSetProperty(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return (*(uint64_t (**)(_QWORD))(a1 + 56))(*(_QWORD *)(a1 + 88));
  else
    return 22;
}

uint64_t _MKMediaBufferPoolGetBuffer(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (pthread_mutex_t *)(a1 + 48);
  if (pthread_mutex_lock((pthread_mutex_t *)(a1 + 48)))
    return 0;
  while (!*(_DWORD *)(a1 + 116))
  {
    if (pthread_cond_wait((pthread_cond_t *)a1, v2))
      return 0;
  }
  v4 = *(unsigned int *)(a1 + 112);
  if ((int)v4 < 1)
  {
    LODWORD(v5) = 0;
  }
  else
  {
    v5 = 0;
    while (*(_DWORD *)(*(_QWORD *)(a1 + 136) + 4 * v5))
    {
      if (v4 == ++v5)
        goto LABEL_12;
    }
  }
  if ((_DWORD)v5 == (_DWORD)v4)
  {
LABEL_12:
    v3 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 128) + (*(_DWORD *)(a1 + 120) * v5);
    *(_DWORD *)(*(_QWORD *)(a1 + 136) + 4 * v5) = 1;
    --*(_DWORD *)(a1 + 116);
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t _MKMediaBufferPoolReturnBuffer(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t result;

  v4 = (pthread_mutex_t *)(a1 + 48);
  result = pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  if (!(_DWORD)result)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 136) + (((a2 - *(_QWORD *)(a1 + 128)) / *(unsigned int *)(a1 + 120)) << 32 >> 30)) = 0;
    ++*(_DWORD *)(a1 + 116);
    pthread_mutex_unlock(v4);
    return pthread_cond_signal((pthread_cond_t *)a1);
  }
  return result;
}

uint64_t MKMediaGetFileDescriptor(uint64_t a1)
{
  _DWORD *v1;

  if (a1 && (v1 = *(_DWORD **)(a1 + 88)) != 0 && *v1 == 1296786550)
    return v1[1];
  else
    return 0xFFFFFFFFLL;
}

double MKMediaGetAttributes(uint64_t a1, double *a2)
{
  double result;

  if (a1)
  {
    if (a2)
    {
      result = *(double *)(a1 + 124);
      *a2 = result;
    }
  }
  return result;
}

uint64_t RankScheme(_DWORD *a1, _DWORD *a2)
{
  return (*a1 - *a2);
}

const __CFDictionary *CFArrayDictionarySearch(const __CFArray *a1, const void *a2, const __CFString *a3)
{
  return CFArrayDictionarySearchWithIndexOptions(a1, a2, a3, 0, 0);
}

uint64_t MKCFCreatePartitions(int a1, const __CFDictionary *a2, CFArrayRef theArray, __CFBundle *a4, const __CFDictionary *a5, const __CFDictionary *a6, unsigned int a7, const __CFDictionary *a8, uint64_t a9)
{
  switch(a1)
  {
    case 16:
      return GPTCFCreatePartitions(a2, theArray, a4, (uint64_t)a5, a6, a7, a8, a9);
    case 8:
      return MBRCFCreatePartitions(a2, theArray, a7, a8);
    case 1:
      return APMCFCreatePartitions(a2, theArray, a4, a5, (int)a6, a7, a8, a9, (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))MKMediaDeviceIO);
  }
  return 4294961989;
}

uint64_t MKCFRecordPartitions(uint64_t *a1, const __CFArray *a2)
{
  int v2;
  __int16 v4;

  v4 = 0;
  v2 = *(__int16 *)(*a1 + 514);
  if (v2 == 8)
    return MBRCFRecordPartitions(a1, a2, 1, 0xFEu, &v4);
  if (v2 == 1)
    return APMCFRecordPartitions(a1, a2, 0xFEu, &v4);
  return 22;
}

uint64_t MKCFSetPartitionGroupStatus(CFDictionaryRef theDict, const void *a2, uint64_t a3, uint64_t a4)
{
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v10;
  const __CFDictionary *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  uint64_t v14;
  CFIndex Count;
  CFIndex v16;
  CFIndex v17;
  const __CFDictionary *v18;
  const __CFDictionary *v19;
  const void *v20;
  const __CFNumber *v21;
  uint64_t v22;
  int v23;
  uint64_t result;
  const void *v25;
  uint64_t v26;
  uint64_t valuePtr;

  if (!theDict)
    return 22;
  v26 = 0;
  valuePtr = 0;
  do
  {
    Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("Schemes"));
    if (!Value)
      return *__error();
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
  }
  while (!ValueAtIndex);
  v10 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Sections"));
  if (!v10)
    return *__error();
  v11 = CFArrayDictionarySearchWithIndexOptions(v10, CFSTR("ID"), CFSTR("MAP"), 0, 0);
  if (!v11)
    return *__error();
  v12 = (const __CFArray *)CFDictionaryGetValue(v11, CFSTR("Partitions"));
  if (!v12)
    return *__error();
  v13 = v12;
  if (a4)
    v14 = a4;
  else
    v14 = ~a3;
  Count = CFArrayGetCount(v12);
  if (Count >= 1)
  {
    v16 = Count;
    v17 = 0;
    while (1)
    {
      v18 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v17);
      if (v18)
        break;
LABEL_23:
      if (v16 == ++v17)
        return 0;
    }
    v19 = v18;
    v20 = CFDictionaryGetValue(v18, CFSTR("GUID"));
    v21 = (const __CFNumber *)CFDictionaryGetValue(v19, CFSTR("Status"));
    v26 = 0;
    valuePtr = 0;
    if (v21)
    {
      CFNumberGetValue(v21, kCFNumberSInt64Type, &valuePtr);
      v22 = valuePtr & v14;
      v26 = valuePtr & v14;
      if (!a2)
        goto LABEL_20;
    }
    else
    {
      v22 = 0;
      if (!a2)
        goto LABEL_20;
    }
    v23 = CFEqual(v20, a2);
    v22 = v26;
    if (v23)
    {
      v22 = v26 | a3;
      v26 |= a3;
    }
LABEL_20:
    if (v22 != valuePtr)
    {
      result = (uint64_t)CFNumberCreate(0, kCFNumberSInt64Type, &v26);
      if (!result)
        return result;
      v25 = (const void *)result;
      CFDictionarySetValue(v19, CFSTR("Status"), (const void *)result);
      CFRelease(v25);
    }
    goto LABEL_23;
  }
  return 0;
}

__CFArray *MKCFCreateMapRuns(const void *a1, uint64_t a2, _DWORD *a3)
{
  __CFArray *result;
  size_t __nel[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  int v19;

  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__nel = 0u;
  v7 = 0u;
  v19 = MKMediaSchemesDetect(__nel, a2, 0, a1);
  if (v19)
  {
    result = 0;
  }
  else
  {
    qsort((char *)__nel + 4, LOWORD(__nel[0]), 0x30uLL, (int (__cdecl *)(const void *, const void *))RankScheme);
    switch(LODWORD(__nel[1]))
    {
      case 0x10:
        result = GPTCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      case 8:
        result = MBRCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      case 1:
        result = APMCFCreateMapRuns((uint64_t)a1, 0, &v19);
        break;
      default:
        result = 0;
        v19 = -5307;
        break;
    }
  }
  *a3 = v19;
  return result;
}

uint64_t MKCFWriteMediaContent(uint64_t a1, CFDictionaryRef theDict, const __CFString *a3, unint64_t a4, size_t a5, char *a6)
{
  const __CFString *v9;
  __int128 v11;
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v14;
  const __CFDictionary *v15;
  const __CFArray *v16;
  const __CFDictionary *v17;
  const __CFDictionary *v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  uint64_t v21;
  size_t v22;
  char *v23;
  char *v24;
  size_t v25;
  uint64_t Blocks;
  char *v27;
  size_t v28;
  _OWORD v30[2];
  unint64_t v31;
  unint64_t valuePtr;
  unsigned int v33;
  size_t size[2];
  __int128 v35;
  unint64_t v36;

  v9 = a3;
  v33 = 0;
  v31 = 0;
  valuePtr = 0;
  v11 = 0uLL;
  memset(v30, 0, sizeof(v30));
  if (a3)
  {
    if (!theDict)
      return 22;
    Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("Schemes"));
    if (!Value)
      return 22;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
    if (!ValueAtIndex)
      return 22;
    v14 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Sections"));
    if (!v14)
      return 22;
    v15 = CFArrayDictionarySearchWithIndexOptions(v14, CFSTR("ID"), CFSTR("MAP"), 0, 0);
    if (!v15)
      return 22;
    v16 = (const __CFArray *)CFDictionaryGetValue(v15, CFSTR("Partitions"));
    if (!v16)
      return 22;
    v17 = CFArrayDictionarySearchWithIndexOptions(v16, CFSTR("GUID"), v9, 0, 0);
    if (!v17)
      return 4294961953;
    v18 = v17;
    MKMediaGetGeometry(a1, (uint64_t)v30);
    v19 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Offset"));
    if (!v19)
      return 22;
    CFNumberGetValue(v19, kCFNumberSInt64Type, &valuePtr);
    v20 = (const __CFNumber *)CFDictionaryGetValue(v18, CFSTR("Size"));
    if (!v20)
      return 22;
    CFNumberGetValue(v20, kCFNumberSInt64Type, &v31);
    a1 = MKMediaCreateWithSubRange(0, a1, valuePtr, v31, &v33);
    v21 = v33;
    v9 = (const __CFString *)a1;
    v11 = 0uLL;
    if (v33)
      goto LABEL_31;
  }
  v36 = 0;
  *(_OWORD *)size = v11;
  v35 = v11;
  MKMediaGetGeometry(a1, (uint64_t)size);
  v22 = LODWORD(size[0]);
  v23 = (char *)malloc_type_calloc(1uLL, LODWORD(size[0]), 0xBA10234DuLL);
  if (!v23)
    goto LABEL_30;
  v24 = v23;
  if (!a5)
  {
    free(v23);
    goto LABEL_30;
  }
  while (1)
  {
    v25 = a4 % v22;
    if (!(a4 % v22))
      break;
    Blocks = MKMediaReadBlocks(a1, a4 / v22, 1, v22, v24, 0);
    if ((_DWORD)Blocks
      || ((v27 = &v24[v25], a5 >= v22 - v25) ? (v28 = v22 - v25) : (v28 = a5),
          memcpy(v27, a6, v28),
          Blocks = MKMediaWriteBlocks(a1, a4 / v22, 1, v22, v24, 0),
          (_DWORD)Blocks))
    {
LABEL_28:
      v21 = Blocks;
      goto LABEL_29;
    }
LABEL_24:
    a6 += v28;
    a4 += v28;
    a5 -= v28;
    if (!a5)
      goto LABEL_25;
  }
  if (a5 >= v22)
  {
    Blocks = MKMediaWriteBlocks(a1, a4 / v22, a5 / v22, v22, a6, &v36);
    if ((_DWORD)Blocks)
      goto LABEL_28;
    v28 = v36 * v22;
    goto LABEL_24;
  }
  v21 = MKMediaReadBlocks(a1, a4 / v22, 1, v22, v24, 0);
  if (!(_DWORD)v21)
  {
    memcpy(v24, a6, a5);
    v21 = MKMediaWriteBlocks(a1, a4 / v22, 1, v22, v24, 0);
    if (!(_DWORD)v21)
    {
LABEL_25:
      free(v24);
      v21 = 0;
      goto LABEL_31;
    }
  }
LABEL_29:
  free(v24);
  if ((_DWORD)v21 == -1)
LABEL_30:
    v21 = *__error();
LABEL_31:
  if (v9)
    CFRelease(v9);
  if ((_DWORD)v21 == -1)
    return *__error();
  return v21;
}

uint64_t MKCFSetBootcode(CFDictionaryRef theDict, uint64_t a2, unint64_t a3, void *a4)
{
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  const __CFString *v11;
  uint64_t result;
  char buffer[32];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (theDict)
  {
    while (1)
    {
      Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("Schemes"));
      if (!Value)
        break;
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, 0);
      if (ValueAtIndex)
      {
        v10 = ValueAtIndex;
        v11 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ID"));
        if (v11 && CFStringGetCString(v11, buffer, 32, 0))
        {
          if (PMSchemeSearchByDescriptor(buffer, 0) != 8)
            return 4294967292;
          result = MBRCFSetBootcode(v10, a2, a3, a4);
          if ((_DWORD)result == -1)
            return *__error();
          return result;
        }
        return 22;
      }
    }
  }
  return 22;
}

uint64_t MKReportMedia(const __CFDictionary *a1, const __CFDictionary *a2, uint64_t a3, FILE *a4)
{
  FILE *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFDictionary *Value;
  const __CFDictionary *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  int v19;
  const __CFString *v20;
  unint64_t v21;
  uint64_t UUID;
  const __CFArray *v24;
  const __CFArray *v25;
  CFIndex v26;
  int v27;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v29;
  const __CFString *v30;
  int v31;
  const __CFString *v32;
  char *v33;
  const __CFArray *v34;
  const __CFArray *v35;
  int v36;
  CFIndex v37;
  const __CFDictionary *v38;
  const __CFDictionary *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFNumber *v43;
  const __CFNumber *v44;
  const __CFNumber *v45;
  const __CFNumber *v46;
  const __CFNumber *v47;
  const __CFArray *v48;
  const __CFArray *v49;
  int v50;
  int v51;
  const char *v52;
  size_t v53;
  unint64_t v54;
  CFIndex v55;
  uint64_t v56;
  const __CFDictionary *v57;
  const __CFDictionary *v58;
  const __CFNumber *v59;
  const __CFString *v60;
  const __CFString *v61;
  CFTypeID TypeID;
  const char *v63;
  const __CFString *v64;
  const __CFString *v65;
  CFTypeID v66;
  __int128 v67;
  __int128 v68;
  const __CFNumber *v69;
  const __CFNumber *v70;
  CFTypeID v71;
  const __CFNumber *v72;
  const __CFNumber *v73;
  CFTypeID v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  const __CFArray *v81;
  CFIndex v82;
  uint64_t Count;
  int v84;
  uint64_t v85;
  const __CFArray *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int valuePtr;
  __int16 v92;
  int v93;
  uint64_t v94;
  unint64_t v95;
  int v96;
  char v97[64];
  uint64_t v98;
  uint64_t v99;
  __int128 v100;
  _QWORD v101[10];
  char v102[32];
  char buffer[32];
  uuid_t uu;
  char v105[64];
  char out[48];
  _OWORD v107[2];
  _OWORD v108[2];
  _OWORD v109[2];
  uint64_t v110;
  char v111[64];
  unsigned __int8 v112[8];
  uint64_t v113;
  char v114[38];
  char v115[64];
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;

  v120 = *MEMORY[0x24BDAC8D0];
  v98 = 0;
  v99 = 0;
  if (!a1)
    return 22;
  if (a4)
    v7 = a4;
  else
    v7 = (FILE *)*MEMORY[0x24BDAC8E8];
  if (MKCFOptionBit(a2, CFSTR("Simple Report"), 1))
  {
    v8 = 0;
    LOWORD(v98) = 1;
LABEL_11:
    v9 = v8 | MKCFOptionBit(a2, CFSTR("Show Ending Offset"), 1);
    v10 = MKCFOptionBit(a2, CFSTR("Show UUID"), 2);
    v11 = v9 | v10 | MKCFOptionBit(a2, CFSTR("Show Freespace"), 4);
    HIDWORD(v98) = v11 | MKCFOptionBit(a2, CFSTR("Show Shims"), 8);
    goto LABEL_12;
  }
  if (MKCFOptionBit(a2, CFSTR("Report Format #1"), 1))
  {
    v8 = 0;
    LOWORD(v98) = 2;
    goto LABEL_11;
  }
  if (MKCFOptionBit(a2, CFSTR("Report Format #2"), 1))
  {
    LOWORD(v98) = 3;
    v8 = 5;
    goto LABEL_11;
  }
LABEL_12:
  if (!a3)
    return 22;
  v100 = 0u;
  memset(v101, 0, sizeof(v101));
  v12 = (const __CFDictionary *)MKMediaCopyProperties(a3);
  if (!v12)
    return 22;
  v13 = v12;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v12, CFSTR("Geometry"));
  if (Value)
  {
    v15 = Value;
    v16 = (const __CFNumber *)CFDictionaryGetValue(Value, CFSTR("Block Size"));
    if (v16)
      CFNumberGetValue(v16, kCFNumberSInt32Type, (char *)&v100 + 8);
    v17 = (const __CFNumber *)CFDictionaryGetValue(v15, CFSTR("Sector Count"));
    if (v17)
      CFNumberGetValue(v17, kCFNumberSInt64Type, &v100);
    v18 = (const __CFNumber *)CFDictionaryGetValue(v15, CFSTR("Maximum Transfer Sector Count"));
    if (v18)
      CFNumberGetValue(v18, kCFNumberSInt64Type, v101);
  }
  v19 = MKCFOptionBit(v13, CFSTR("Writable"), 1);
  LODWORD(v101[1]) |= v19;
  v20 = (const __CFString *)CFDictionaryGetValue(v13, CFSTR("Path"));
  if (v20)
    CFStringGetCString(v20, (char *)&v101[1] + 4, 64, 0);
  CFRelease(v13);
  v21 = DWORD2(v100);
  fputc(10, v7);
  scalenumstr((_QWORD)v100 << 9, v97);
  fprintf(v7, "MEDIA: \"%s\"; Size %s", (const char *)&v101[1] + 4, v97);
  if ((unsigned __int16)v98 > 1u)
  {
    fprintf(v7, " [%lld x %ld]", (unint64_t)v100 / (unsigned __int16)(v21 >> 9), DWORD2(v100));
    if ((v101[0] & 0xFFFFFFFFFFFEFFFFLL) != 0)
      fprintf(v7, "; Max Transfer Blocks %lld");
  }
  else
  {
    fprintf(v7, "; Blocksize %ld");
  }
  fputc(10, v7);
  buffer[0] = 0;
  v24 = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("Schemes"));
  if (!v24)
    return 0;
  v25 = v24;
  Count = (unsigned __int16)CFArrayGetCount(v24);
  if (!Count)
    return 0;
  v26 = 0;
  v27 = 0;
  v87 = 0;
  v81 = v25;
  while (1)
  {
    v102[0] = 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v25, v26);
    if (!ValueAtIndex)
    {
      if (++v26 == Count)
        goto LABEL_165;
      goto LABEL_162;
    }
    v29 = ValueAtIndex;
    v30 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ID"));
    if (!v30)
      goto LABEL_165;
    CFStringGetCString(v30, buffer, 32, 0x600u);
    v31 = PMSchemeSearchByDescriptor(buffer, &v87);
    v32 = (const __CFString *)CFDictionaryGetValue(v29, CFSTR("Name"));
    if (!v32)
      goto LABEL_165;
    CFStringGetCString(v32, v102, 32, 0x600u);
    fprintf(v7, "SCHEME: %i %s", v27 + 1, buffer);
    if ((unsigned __int16)v98 >= 2u)
    {
      fprintf(v7, ", \"%s\" [%d]", v102, v31);
      v33 = v87;
      if (v87)
      {
        if (strcasecmp(v87, v102))
          fprintf(v7, " **official name varies. \"%s\"", v33);
      }
    }
    fputc(10, v7);
    LOWORD(v99) = v31;
    v92 = 0;
    valuePtr = 0;
    v89 = 0;
    v90 = 0;
    v88 = 0;
    v110 = 0;
    memset(v109, 0, sizeof(v109));
    memset(v108, 0, sizeof(v108));
    memset(v107, 0, sizeof(v107));
    memset(out, 0, 38);
    v34 = (const __CFArray *)CFDictionaryGetValue(v29, CFSTR("Sections"));
    if (v34)
    {
      v35 = v34;
      v36 = CFArrayGetCount(v34);
      v84 = v36;
      if (v36 >= 1)
      {
        v37 = 0;
        memset(uu, 0, sizeof(uu));
        v85 = v36;
        v86 = v35;
        v82 = v26;
        while (1)
        {
          v38 = (const __CFDictionary *)CFArrayGetValueAtIndex(v35, v37);
          if (v38)
            break;
          UUID = 0;
          ++v37;
          v35 = v86;
LABEL_156:
          if (v37 == v85)
            goto LABEL_161;
        }
        v39 = v38;
        if (CFDictionaryGetUUID(v38, CFSTR("GUID"), uu))
          uuid_clear(uu);
        else
          uuid_unparse(uu, out);
        v40 = (const __CFString *)CFDictionaryGetValue(v39, CFSTR("ID"));
        if (v40)
          CFStringGetCString(v40, (char *)v109, 40, 0x600u);
        v41 = (const __CFString *)CFDictionaryGetValue(v39, CFSTR("Type"));
        if (v41)
          CFStringGetCString(v41, (char *)v107, 32, 0);
        v42 = (const __CFString *)CFDictionaryGetValue(v39, CFSTR("Name"));
        if (v42)
          CFStringGetCString(v42, (char *)v108, 32, 0);
        v43 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Overhead"));
        if (v43)
          CFNumberGetValue(v43, kCFNumberSInt32Type, &valuePtr);
        fprintf(v7, "SECTION: %i", ++v37);
        if (v84 != 1)
          fprintf(v7, " of %i", v84);
        fprintf(v7, " Type:'%s'", (const char *)v109);
        if (strcasecmp("MAP", (const char *)v109))
        {
          fprintf(v7, "; \"%s\"", (const char *)v109);
          if (LOBYTE(v107[0]))
            fprintf(v7, ", Name:\"%s\"", (const char *)v108);
          v35 = v86;
          if (!strcasecmp("DDM", (const char *)v109))
            fwrite("\n[ Not implemented ]", 0x14uLL, 1uLL, v7);
          UUID = 0;
          goto LABEL_155;
        }
        v92 = 512;
        v44 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Media Block Size"));
        if (v44)
          CFNumberGetValue(v44, kCFNumberSInt16Type, &v92);
        v45 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Media Offset"));
        if (v45)
          CFNumberGetValue(v45, kCFNumberSInt64Type, &v88);
        v46 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Media Block Count"));
        if (v46)
          CFNumberGetValue(v46, kCFNumberSInt64Type, &v89);
        v47 = (const __CFNumber *)CFDictionaryGetValue(v39, CFSTR("Section Block Count"));
        if (v47)
          CFNumberGetValue(v47, kCFNumberSInt64Type, &v90);
        if (v89)
        {
          scalenumstr(v89 << 9, v105);
          fprintf(v7, "; Size %s [%lld x %d]", v105, v90, 512);
        }
        if ((unsigned __int16)v98 >= 2u)
        {
          fprintf(v7, "; Offset %lld Blocks (%lld", v88, v89);
          if (valuePtr)
            fprintf(v7, " + %u", valuePtr);
          fwrite(") x 512", 7uLL, 1uLL, v7);
          if ((unsigned __int16)v98 >= 2u && v92 != 512)
            fprintf(v7, "; [Actual Blocksize %i]", v92);
        }
        if ((v98 & 0x200000000) != 0)
          fprintf(v7, "; UUID: %s\n", out);
        fputc(10, v7);
        v48 = (const __CFArray *)CFDictionaryGetValue(v39, CFSTR("Partitions"));
        if (v48)
        {
          v49 = v48;
          v50 = CFArrayGetCount(v48);
          v51 = v50;
          if (v50)
          {
            if ((unsigned __int16)v98 < 2u)
            {
              fprintf(v7, "ID Type                 Size   Name             (%d)\n", v50);
              v52 = "-- -------------------- ------ --------------------\n";
              v53 = 52;
            }
            else
            {
              fwrite("ID Type                 Offset       Size         ", 0x32uLL, 1uLL, v7);
              if ((v98 & 0x100000000) != 0)
                fwrite("End          ", 0xDuLL, 1uLL, v7);
              fprintf(v7, "Name                      (%i)\n", v51);
              fwrite("-- -------------------- ------------ ------------", 0x31uLL, 1uLL, v7);
              if ((v98 & 0x100000000) != 0)
                fwrite(" ------------", 0xDuLL, 1uLL, v7);
              v52 = " -------------------- --------\n";
              v53 = 31;
            }
            fwrite(v52, v53, 1uLL, v7);
            v96 = 0;
            v94 = 0;
            v95 = 0;
            v113 = 0;
            *(_QWORD *)v112 = 0;
            v93 = 0;
            v54 = v88;
            if (v51 >= 1)
            {
              v55 = 0;
              v56 = v51;
              while (1)
              {
                LOBYTE(v116) = 0;
                v115[0] = 0;
                v114[0] = 0;
                v96 = 0;
                v94 = 0;
                v95 = 0;
                v93 = 0;
                v57 = (const __CFDictionary *)CFArrayGetValueAtIndex(v49, v55);
                if (v57)
                  break;
                UUID = 0xFFFFFFFFLL;
LABEL_141:
                if (v56 == ++v55)
                  goto LABEL_144;
              }
              v58 = v57;
              v59 = (const __CFNumber *)CFDictionaryGetValue(v57, CFSTR("Partition ID"));
              if (v59)
                CFNumberGetValue(v59, kCFNumberIntType, &v96);
              v60 = (const __CFString *)CFDictionaryGetValue(v58, CFSTR("Type"));
              if (v60)
              {
                v61 = v60;
                TypeID = CFStringGetTypeID();
                if (TypeID == CFGetTypeID(v61))
                {
                  CFStringGetCString(v61, v115, 64, 0x600u);
                  UUID = MKTypeClassify((unsigned __int16)v99, v61, 0, &v93, 0, 0);
                  goto LABEL_102;
                }
                v116 = *(_OWORD *)"Bad type";
                v117 = unk_212DE466A;
                v118 = xmmword_212DE467A;
                v119 = unk_212DE468A;
                v93 = 7;
                UUID = 0xFFFFFFFFLL;
LABEL_105:
                v64 = (const __CFString *)CFDictionaryGetValue(v58, CFSTR("Name"));
                if (v64)
                {
                  v65 = v64;
                  v66 = CFStringGetTypeID();
                  if (v66 == CFGetTypeID(v65))
                  {
                    CFStringGetCString(v65, (char *)&v116, 64, 0x600u);
                    goto LABEL_110;
                  }
                  v63 = "Bad name";
LABEL_109:
                  v67 = *((_OWORD *)v63 + 1);
                  v116 = *(_OWORD *)v63;
                  v117 = v67;
                  v68 = *((_OWORD *)v63 + 3);
                  v118 = *((_OWORD *)v63 + 2);
                  v119 = v68;
                }
LABEL_110:
                v69 = (const __CFNumber *)CFDictionaryGetValue(v58, CFSTR("Offset"));
                if (v69)
                {
                  v70 = v69;
                  v71 = CFNumberGetTypeID();
                  if (v71 == CFGetTypeID(v70))
                    CFNumberGetValue(v70, kCFNumberSInt64Type, &v95);
                }
                v72 = (const __CFNumber *)CFDictionaryGetValue(v58, CFSTR("Size"));
                if (v72)
                {
                  v73 = v72;
                  v74 = CFNumberGetTypeID();
                  if (v74 == CFGetTypeID(v73))
                    CFNumberGetValue(v73, kCFNumberSInt64Type, &v94);
                }
                v75 = v95;
                if (v95 <= v54)
                  v76 = v54;
                else
                  v76 = v95;
                if ((unsigned __int16)v98 < 2u)
                {
                  v78 = v96;
                  scalenumstr(v94 << 9, v111);
                  fprintf(v7, "%2i %-20.20s %6s", v78, v115, v111);
                  if ((_BYTE)v116 && strcasecmp("untitled", (const char *)&v116))
                    fprintf(v7, " %-20.20s");
                }
                else
                {
                  if ((v98 & 0x400000000) != 0
                    && (uint64_t)(v76 - v54) >= 1
                    && (v76 - v54 > 0x1F || (v98 & 0x800000000) != 0))
                  {
                    fprintf(v7, "   %-20s %12llu %12llu", "Free", v54, v76 - v54);
                    if ((v98 & 0x100000000) != 0)
                      fprintf(v7, " %12llu", v76 - 1);
                    fputc(10, v7);
                    v75 = v95;
                  }
                  fprintf(v7, "%2i %-20.20s %12llu %12llu", v96, v115, v75, v94);
                  if ((v98 & 0x100000000) != 0)
                  {
                    v77 = v94 - 1;
                    if (!v94)
                      v77 = 0;
                    fprintf(v7, " %12llu", v77 + v95);
                  }
                  if ((_BYTE)v116 && strcasecmp("untitled", (const char *)&v116))
                    fprintf(v7, " %-20.20s", (const char *)&v116);
                  if ((v98 & 0x200000000) != 0)
                  {
                    UUID = CFDictionaryGetUUID(v58, CFSTR("GUID"), v112);
                    uuid_unparse(v112, v114);
                    if (!uuid_is_null(v112))
                      fprintf(v7, " %36s");
                  }
                }
                fputc(10, v7);
                v54 = v94 + v95;
                goto LABEL_141;
              }
              UUID = 0xFFFFFFFFLL;
LABEL_102:
              if (v93 != 3)
                goto LABEL_105;
              v63 = "Explicit Record";
              goto LABEL_109;
            }
            UUID = 0;
LABEL_144:
            if ((unsigned __int16)v98 < 2u)
            {
              v25 = v81;
              v26 = v82;
            }
            else
            {
              v25 = v81;
              v26 = v82;
              if ((v98 & 0x400000000) != 0)
              {
                v79 = v89 + v88;
                v80 = v89 + v88 - v54;
                if (v80 >= 1 && ((unint64_t)v80 > 0xF || (v98 & 0x800000000) != 0))
                {
                  fprintf(v7, "   %-20s %12llu %12llu", "Free", v54, v89 + v88 - v54);
                  if ((v98 & 0x100000000) != 0)
                    fprintf(v7, " %12llu", v79 - 1);
                  fputc(10, v7);
                }
              }
            }
          }
          else
          {
            UUID = 0;
          }
        }
        else
        {
          UUID = 22;
        }
        v35 = v86;
LABEL_155:
        fputc(10, v7);
        goto LABEL_156;
      }
    }
    UUID = 22;
LABEL_161:
    if (++v26 == Count)
      break;
LABEL_162:
    v27 = v26;
  }
  if ((_DWORD)UUID == -1)
  {
LABEL_165:
    UUID = *__error();
    if ((_DWORD)UUID == -1)
      return *__error();
  }
  return UUID;
}

char *scalenumstr(unint64_t a1, char *a2)
{
  unsigned __int16 v3;
  uint64_t v4;

  if (a1 < 0x401)
  {
    v4 = 0;
  }
  else
  {
    v3 = 0;
    do
    {
      if ((a1 & 0x3FF) <= 0x200)
        a1 >>= 10;
      else
        a1 = (a1 >> 10) + 1;
      v3 += 3;
    }
    while (a1 > 0x400);
    v4 = v3 / 3u;
  }
  sprintf(a2, "%hd %s", a1, *((const char **)&off_24CEC31C8 + v4));
  return a2;
}

uint64_t MKShowMedia(const __CFDictionary *a1, uint64_t a2, FILE *a3)
{
  __CFDictionary *Mutable;
  uint64_t v7;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("Report Format #2"), (const void *)*MEMORY[0x24BDBD270]);
  v7 = MKReportMedia(a1, Mutable, a2, a3);
  CFRelease(Mutable);
  return v7;
}

uint64_t MKMediaCreateWithEmbeddedHFSPlus(uint64_t result, int *a2)
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  int v8;

  v8 = -50;
  if (result)
  {
    v3 = result;
    v7 = 0;
    v5 = 0;
    v6 = 0;
    v4 = MKReadHFSMDBVHB(result, &v7, 0, &v6, &v5);
    result = 0;
    v8 = v4;
    if (!v4)
    {
      if (v7 == 3)
      {
        result = MKMediaCreateWithSubRange(*MEMORY[0x24BDBD240], v3, v6, v5, &v8);
        if (result)
          v8 = 0;
      }
      else
      {
        result = 0;
        v8 = -123;
      }
    }
  }
  if (a2)
    *a2 = v8;
  return result;
}

uint64_t MKStartupFileCreate(const void *a1, CFDictionaryRef theDict)
{
  const __CFData *Value;
  const __CFData *v5;
  CFTypeID v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  CFTypeID v9;
  int64_t v10;
  CFIndex Length;
  uint64_t result;
  const void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  const UInt8 *BytePtr;
  size_t v18;
  uint64_t valuePtr;
  unint64_t v20;
  unint64_t v21;
  unsigned int v22;
  int v23;
  _BYTE __src[40];
  unsigned int v25;
  _QWORD v26[11];

  v26[10] = *MEMORY[0x24BDAC8D0];
  valuePtr = -1;
  if (!theDict)
    return 4294967246;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("Data"));
  v5 = Value;
  if (Value)
  {
    v6 = CFGetTypeID(Value);
    if (v6 != CFDataGetTypeID())
      return 4294967246;
  }
  v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("Size"));
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 != CFNumberGetTypeID() || !CFNumberGetValue(v8, kCFNumberSInt64Type, &valuePtr))
      return 4294967246;
  }
  v10 = valuePtr;
  if (v5)
  {
    Length = CFDataGetLength(v5);
    if (v10 != -1)
    {
      if (v10 >= Length)
      {
        v10 = valuePtr;
        goto LABEL_15;
      }
      return 4294967246;
    }
    valuePtr = Length;
    v10 = Length;
  }
  else if (valuePtr == -1)
  {
    return 4294967246;
  }
LABEL_15:
  v23 = 0;
  v20 = 0;
  v21 = 0;
  result = MKReadHFSMDBVHB((uint64_t)a1, &v23, __src, &v21, &v20);
  v22 = result;
  if ((_DWORD)result)
    return result;
  if (v23 == 4)
    goto LABEL_19;
  if (v23 != 3)
  {
    if (v23 != 2)
      return 4294967173;
LABEL_19:
    v13 = CFRetain(a1);
    goto LABEL_20;
  }
  v13 = (const void *)MKMediaCreateWithSubRange(*MEMORY[0x24BDBD240], (uint64_t)a1, v21, v20, &v22);
  result = v22;
  if (!v22)
  {
LABEL_20:
    result = HFSAllocateSpace(v13, (uint64_t)__src, (uint64_t)v26, v10);
    v22 = result;
    if (!(_DWORD)result)
    {
      v14 = v10 / v25;
      if (v10 % v25)
        ++v14;
      v15 = v14 * v25;
      if (!v15)
        goto LABEL_27;
      v16 = malloc_type_calloc(v14 * v25, 1uLL, 0x100004077774924uLL);
      if (v5)
      {
        BytePtr = CFDataGetBytePtr(v5);
        v18 = CFDataGetLength(v5);
        memcpy(v16, BytePtr, v18);
      }
      result = MKHFSWriteFile((uint64_t)v13, (uint64_t)__src, (uint64_t)v26, 0, v15, (char *)v16);
      v22 = result;
      if (!(_DWORD)result)
      {
LABEL_27:
        result = MKWriteHFSMDBVHB((uint64_t)v13, v23, __src, v21, v20);
        v22 = result;
      }
    }
  }
  if (v13)
  {
    CFRelease(v13);
    return v22;
  }
  return result;
}

uint64_t MKBSDMountinfo(const char *a1, statfs **a2)
{
  int v4;
  statfs *v5;
  int v6;
  int v7;
  statfs *v9;

  v9 = 0;
  *a2 = 0;
  v4 = getmntinfo(&v9, 2);
  if (v4 < 1)
  {
LABEL_5:
    v7 = *__error();
  }
  else
  {
    v5 = v9;
    v6 = v4 + 1;
    while (strcmp(v5->f_mntfromname, a1))
    {
      v9 = ++v5;
      if (--v6 <= 1)
        goto LABEL_5;
    }
    LOWORD(v7) = 0;
    *a2 = v5;
  }
  return (__int16)v7;
}

uint64_t MKBSDMountpoint(const char *a1, char *a2)
{
  uint64_t v3;
  statfs *v5;

  v5 = 0;
  v3 = MKBSDMountinfo(a1, &v5);
  if (v5)
    strlcpy(a2, v5->f_mntfromname, 0x400uLL);
  return v3;
}

uint64_t addentry32(const void **a1, const void *a2, size_t size, unsigned int a4, int a5)
{
  int v7;
  char *v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;

  if (a1)
  {
    v7 = size;
    v10 = (char *)*a1;
    v11 = size;
    if (!v10)
    {
      v10 = (char *)malloc_type_calloc(1uLL, size, 0xE5CC5226uLL);
      *a1 = v10;
      if (!v10)
        return *__error();
    }
    v12 = a5 & 0xFFFFFFFE;
    v13 = *(_DWORD *)&v10[v11 - 4];
    if (v13 >= a4)
      v14 = a4;
    else
      v14 = *(_DWORD *)&v10[v11 - 4];
    v15 = v7 + v14 * v12;
    v16 = moveblockextended(a1, v15, v12, 0, v7 + v13 * v12);
    if ((_WORD)v16)
    {
      v17 = v16 << 16;
      if (v16 << 16 == -65536)
        return *__error();
    }
    else
    {
      memmove((char *)*a1 + v15, a2, v12);
      v17 = 0;
      *(_DWORD *)((char *)*a1 + v11 - 4) = v13 + 1;
    }
  }
  else
  {
    v17 = 1441792;
  }
  return (v17 >> 16);
}

uint64_t delentry32(const void ***a1, unsigned int a2, unsigned int a3, int a4)
{
  const void **v6;
  unsigned int v7;
  __int16 v8;

  if (a1)
  {
    v6 = *a1;
    v7 = *(_DWORD *)((char *)v6 + a2 - 4);
    if (v7 <= a3)
    {
      return -110;
    }
    else
    {
      v8 = moveblockextended(v6, a2 + (a4 & 0xFFFFFFFE) * a3, -(a4 & 0xFFFFFFFE), 0, a2 + v7 * (a4 & 0xFFFFFFFE));
      if (!v8)
      {
        v8 = 0;
        *(_DWORD *)((char *)*a1 + a2 - 4) = v7 - 1;
      }
    }
  }
  else
  {
    return 22;
  }
  return v8;
}

uint64_t ntfs_show_attr(uint64_t a1)
{
  int v2;
  const char *v3;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 8);
  puts("\nAttribute");
  printf("type            %8X\n", *(_DWORD *)a1);
  printf("record length   %8X\n", *(_DWORD *)(a1 + 4));
  v3 = "non-resident";
  if (!v2)
    v3 = "resident";
  printf("flags           %8X %12s\n", *(unsigned __int8 *)(a1 + 8), v3);
  if (*(_BYTE *)(a1 + 9))
  {
    printf("name %2i        %s\n", *(unsigned __int8 *)(a1 + 9), (const char *)(a1 + *(unsigned __int8 *)(a1 + 10)));
    printf("name length     %8X\n", *(unsigned __int8 *)(a1 + 9));
    printf("name offset     %8X\n", *(unsigned __int8 *)(a1 + 10));
  }
  if (*(_BYTE *)(a1 + 12))
    printf("compression     %8X\n", *(unsigned __int8 *)(a1 + 12));
  if (*(_WORD *)(a1 + 14))
    printf("index           %8X\n", *(unsigned __int16 *)(a1 + 14));
  if (v2)
  {
    printf("vcnstart        %8lli\n", *(_QWORD *)(a1 + 16));
    printf("vcnend          %8lli\n", *(_QWORD *)(a1 + 24));
    result = printf("offset          %8i\n", *(unsigned __int16 *)(a1 + 32));
    if (*(_WORD *)(a1 + 34))
      result = printf("cmpr algo       %8i\n", *(unsigned __int16 *)(a1 + 34));
    if (*(_DWORD *)(a1 + 36))
      result = printf("reserved        %8i\n", *(_DWORD *)(a1 + 36));
    if (*(_QWORD *)(a1 + 40))
      result = printf("allocated       %8lli\n", *(_QWORD *)(a1 + 40));
    if (*(_QWORD *)(a1 + 48))
      result = printf("length          %8lli\n", *(_QWORD *)(a1 + 48));
    if (*(_QWORD *)(a1 + 56))
      return printf("initialized     %8lli\n");
  }
  else
  {
    printf("length          %8i\n", *(unsigned __int16 *)(a1 + 16));
    if (*(_WORD *)(a1 + 18))
      printf("reserved        %8i\n", *(unsigned __int16 *)(a1 + 18));
    result = printf("offset          %8i\n", *(unsigned __int16 *)(a1 + 20));
    if (*(_WORD *)(a1 + 22))
      return printf("indexed         %8i\n");
  }
  return result;
}

const char *MKNTFSIdentity()
{
  return "NTFS";
}

uint64_t MKDetectNTFS(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  int v5;

  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  *a3 = 0;
  if (*((unsigned __int16 *)a2 + 255) == 43605)
  {
    *a3 = 1000;
    v5 = *a2;
    if ((v5 == 233 || v5 == 235 && a2[2] == 144) && *(_QWORD *)(a2 + 3) == 0x202020205346544ELL)
    {
      *a3 = 5000;
      if (a5)
        *a5 = 4;
    }
  }
  return 0;
}

uint64_t MKRecordNTFSRuns()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t *);
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t *);
  int v5;
  int v6;
  uint64_t v7;
  uint64_t Blocks;
  uint64_t v9;
  void *v10;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  float v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  const UInt8 *v25;
  uint64_t v26;
  int v27;
  unsigned __int8 *v28;
  unsigned __int8 *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  int64_t v47;
  char *v48;
  int v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _OWORD v53[2];
  void *v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _DWORD v61[70];
  char v62[6];
  __int16 v63;
  unsigned __int16 v64;
  unsigned __int8 v65;
  unsigned __int16 v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  char v70;
  char v71;
  uint64_t v72;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = (uint64_t (*)(uint64_t, uint64_t, uint64_t *))v3;
  v6 = v5;
  v7 = v0;
  v72 = *MEMORY[0x24BDAC8D0];
  v55 = 0;
  v56 = 0;
  v54 = 0;
  memset(v53, 0, sizeof(v53));
  v50 = 0;
  v51 = 0;
  v52 = 0;
  v60 = 0u;
  memset(v61, 0, 272);
  v58 = 0u;
  v59 = 0u;
  v57 = 0u;
  Blocks = MKMediaReadBlocks(v0, 0, 1, 0x800u, v62, 0);
  v9 = Blocks;
  if (!(_DWORD)Blocks)
  {
    v49 = 0;
    MKDetectNTFS(Blocks, (unsigned __int8 *)v62, &v49, 0, 0);
    if (v49 < 5000)
    {
      v9 = 4294967173;
      goto LABEL_4;
    }
    MKMediaGetGeometry(v7, (uint64_t)v53);
    LOWORD(v57) = 4;
    LODWORD(v58) = LODWORD(v53[0]) >> 9;
    *((_QWORD *)&v58 + 1) = *((_QWORD *)&v53[0] + 1) * ((unint64_t)LODWORD(v53[0]) >> 9);
    *(_QWORD *)&v59 = *((_QWORD *)&v58 + 1);
    v12 = v64;
    v9 = 22;
    if ((unsigned __int16)(v64 + 0x7FFF) >= 0x81FFu && ((v64 - 1) & v64) == 0)
    {
      if (v65)
      {
        if (v65 <= 0x80u && ((v65 - 1) & v65) == 0)
        {
          v13 = v65 * v64;
          if (v13 <= 0x10000)
          {
            v14 = v65 / (v64 >> 9);
            v15 = v67 / v65;
            HIDWORD(v57) = v64 >> 9;
            *((_QWORD *)&v59 + 1) = v15 * v14;
            if (v15 * v14 >= 0x40)
            {
              v16 = (float)(*((_QWORD *)&v53[0] + 1) * ((unint64_t)LODWORD(v53[0]) >> 9)) / (float)(v15 * v14);
              if (v16 <= 1000.0 && v16 >= 0.001 && v68 <= v15 && v69 <= v15)
              {
                if (v70 < 0)
                {
                  if ((unsigned __int16)-v70 > 0xEu)
                    goto LABEL_4;
                  v17 = 1 << -v70;
                }
                else
                {
                  if (v70 > 0x40)
                    goto LABEL_4;
                  v17 = v13 * v70;
                }
                if ((v17 & (v17 - 1)) == 0)
                {
                  if (v71 < 0)
                  {
                    if ((unsigned __int16)-v71 > 0x10u)
                      goto LABEL_4;
                    v18 = 1 << -v71;
                  }
                  else
                  {
                    if (v71 > 0x40)
                      goto LABEL_4;
                    v18 = v13 * v71;
                  }
                  if ((v18 & (v18 - 1)) == 0)
                  {
                    v19 = v17 / v64;
                    if (v17 % v64)
                      LOWORD(v19) = v19 + 1;
                    v20 = (unsigned __int16)v19;
                    v47 = v68 * v14;
                    v9 = MKMediaReadBlocks(v7, v68 * v14 + 2 * (_DWORD)v20 + (unsigned __int16)v19, v20, v64, v62, 0);
                    if (!(_DWORD)v9)
                    {
                      v45 = v17;
                      if (ntfs_fixup((uint64_t)v62, v17, v12))
                      {
LABEL_38:
                        v9 = 22;
                        goto LABEL_4;
                      }
                      v21 = v66;
                      v22 = (unsigned __int8 *)&v62[(unsigned __int16)v17];
                      v23 = &v22[-2 * (v63 & 0x7FFF)];
                      v24 = (unsigned __int8 *)&v62[v66];
                      if (v24 < v23)
                      {
                        while (1)
                        {
                          if (*(_DWORD *)v24 == -1)
                            goto LABEL_46;
                          if (*(_DWORD *)v24 == 96)
                            break;
                          v21 += *((unsigned __int16 *)v24 + 2);
                          v24 = (unsigned __int8 *)&v62[(unsigned __int16)v21];
                          if (v24 >= v23)
                            goto LABEL_46;
                        }
                        v25 = &v24[*((unsigned __int16 *)v24 + 10)];
                        v26 = *((unsigned __int16 *)v24 + 8);
                        if (&v25[v26] > (const UInt8 *)&v72)
                          goto LABEL_38;
                        uniconvert(&v61[3], 256, 0x8000100u, 0, v25, v26, 0x14000100u, 1u);
                      }
LABEL_46:
                      v9 = MKMediaReadBlocks(v7, v47 + (6 * v20), v20, v12, v62, 0);
                      if (!(_DWORD)v9)
                      {
                        if (ntfs_fixup((uint64_t)v62, v45, v12))
                          goto LABEL_38;
                        v27 = v66;
                        v28 = &v22[-2 * (v63 & 0x7FFF)];
                        v29 = (unsigned __int8 *)&v62[v66];
                        if (v29 < v28)
                        {
                          v9 = 2;
                          while (1)
                          {
                            if (*(_DWORD *)v29 == -1)
                              goto LABEL_54;
                            if (*(_DWORD *)v29 == 128)
                              break;
                            v27 += *((unsigned __int16 *)v29 + 2);
                            v29 = (unsigned __int8 *)&v62[(unsigned __int16)v27];
                            if (v29 >= v28)
                              goto LABEL_4;
                          }
                          v30 = *((unsigned __int16 *)v29 + 16);
                          if (*((unsigned __int16 *)v29 + 2) <= v30)
                            goto LABEL_38;
                          ntfs_runtovrun(&v55, &v54, &v56, &v29[v30]);
                          v9 = v4(v2, 0, 0);
                          if ((_DWORD)v9)
                            goto LABEL_4;
                          v46 = v55;
                          v31 = *(_QWORD *)v55;
                          v48 = (char *)malloc_type_malloc(0x2000uLL, 0x484A0BFDuLL);
                          if (!v48)
                          {
                            v9 = 0xFFFFFFFFLL;
                            goto LABEL_4;
                          }
                          v32 = *((_QWORD *)v29 + 6);
                          if ((v32 & 0x1FF) != 0)
                            v33 = ((v32 >> 9) & 0xFFFFFFFFFFFFFLL) + 1;
                          else
                            v33 = (v32 >> 9) & 0xFFFFFFFFFFFFFLL;
                          v44 = v33;
                          if ((v6 & 0x40003) == 0)
                            goto LABEL_92;
                          if (v33)
                          {
                            v42 = v31 * v14;
                            v43 = 0;
LABEL_64:
                            v34 = MKMediaReadBlocks(v7, v43 + v42, 16, 0x200u, v48, 0);
                            if ((_DWORD)v34)
                            {
LABEL_95:
                              v9 = v34;
LABEL_85:
                              if (v52)
                              {
                                if ((((unsigned __int16)v50 + 1) & v6) != 0)
                                  v9 = v4(v2, 1, &v50);
                                if ((_DWORD)v9)
                                {
LABEL_93:
                                  v4(v2, 4, 0);
                                  free(v48);
                                  v10 = v46;
                                  if (v46)
                                    goto LABEL_5;
                                  goto LABEL_6;
                                }
                                v41 = v51 + v52;
                                v51 += v52;
                                v52 = 0;
                                if ((unsigned __int16)v50 == 1 && v41 > *((_QWORD *)&v60 + 1))
                                  *((_QWORD *)&v60 + 1) = v41;
                              }
LABEL_92:
                              v61[2] = *((_QWORD *)&v60 + 1) / (*((_QWORD *)&v59 + 1) - (_QWORD)v60);
                              v9 = v4(v2, 3, (uint64_t *)&v57);
                              goto LABEL_93;
                            }
                            v35 = 0;
                            v36 = (unsigned __int16)v50;
                            v37 = v52;
LABEL_66:
                            v38 = 0;
                            while (1)
                            {
                              v39 = (*(_QWORD *)&v48[8 * v35] >> v38) & 1;
                              if ((_DWORD)v39 != v36)
                              {
                                if (v37)
                                {
                                  if (!v36)
                                    *(_QWORD *)&v60 = v60 + v37;
                                  if (((v36 + 1) & v6) != 0)
                                  {
                                    v34 = v4(v2, 1, &v50);
                                    if ((_DWORD)v34)
                                      goto LABEL_95;
                                    v37 = v52;
                                    v36 = (unsigned __int16)v50;
                                  }
                                  v40 = v51 + v37;
                                  v51 = v40;
                                  v52 = 0;
                                  if (v36 == 1 && v40 > *((_QWORD *)&v60 + 1))
                                    *((_QWORD *)&v60 + 1) = v40;
                                }
                                v37 = 0;
                                LOWORD(v50) = v39;
                                v36 = v39;
                              }
                              if (v37 + v51 >= *((_QWORD *)&v59 + 1))
                                break;
                              v37 += v14;
                              v52 = v37;
                              if (++v38 == 64)
                              {
                                if (++v35 != 1024)
                                  goto LABEL_66;
                                v9 = 0;
                                v43 += 16;
                                if (v44 > v43)
                                  goto LABEL_64;
                                goto LABEL_85;
                              }
                            }
                          }
                          v9 = 0;
                          goto LABEL_85;
                        }
LABEL_54:
                        v9 = 2;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_4:
  v4(v2, 4, 0);
  v10 = v55;
  if (v55)
LABEL_5:
    free(v10);
LABEL_6:
  if (v54)
    free(v54);
  if ((_DWORD)v9 == -1)
    return *__error();
  return v9;
}

uint64_t ntfs_fixup(uint64_t a1, unint64_t a2, unsigned int a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned __int16 *v5;
  int v6;
  _WORD *v7;
  uint64_t v8;

  if (*(_DWORD *)a1 == 1162627398)
  {
    v3 = *(unsigned __int16 *)(a1 + 6);
    if ((v3 - 1) * a3 == a2)
    {
      v4 = *(unsigned __int16 *)(a1 + 4);
      if (v4 >= a2)
      {
        printf("ntfs_fixup: invalid offset: %x");
      }
      else
      {
        if (v3 < 2)
          return 0;
        v5 = (unsigned __int16 *)(a1 + v4);
        v6 = *v5;
        v7 = (_WORD *)(a1 + a3 - 2);
        v8 = 1;
        while ((unsigned __int16)*v7 == v6)
        {
          *v7 = v5[v8];
          v7 = (_WORD *)((char *)v7 + a3);
          if (v3 == (_DWORD)++v8)
            return 0;
        }
        printf("ntfs_fixup: fixup %d doesn't match\n");
      }
    }
    else
    {
      printf("ntfs_fixup: bad fixups number: %d for %ld bytes block\n");
    }
  }
  else
  {
    printf("ntfs_fixup: magic doesn't match: %08x != %08x\n");
  }
  return 22;
}

_QWORD *ntfs_runtovrun(_QWORD *a1, _QWORD *a2, _QWORD *a3, _BYTE *a4)
{
  unsigned int v8;
  size_t v9;
  int v10;
  _QWORD *v11;
  _QWORD *result;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v8 = *a4;
  if (*a4)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v10 += (v8 >> 4) + (v8 & 0xF) + 1;
      ++v9;
      v8 = a4[v10];
    }
    while (a4[v10]);
  }
  else
  {
    v9 = 0;
  }
  v11 = malloc_type_malloc(8 * v9, 0x100004000313F17uLL);
  result = malloc_type_calloc(v9, 8uLL, 0x100004000313F17uLL);
  v13 = *a4;
  if (*a4)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    do
    {
      result[v15] = 0;
      if ((v13 & 0xF) != 0)
      {
        v17 = 0;
        v18 = 0;
        do
        {
          v18 += a4[++v16] << v17;
          result[v15] = v18;
          v17 += 8;
        }
        while (8 * (v13 & 0xF) != v17);
      }
      v19 = v16 + 1;
      if (v13 >= 0x10)
      {
        v21 = v13 >> 4;
        if ((char)a4[v16 + (v13 >> 4)] < 0)
        {
          v27 = 0;
          v23 = -1 << (8 * v21);
          if (v21 <= 1)
            v24 = 1;
          else
            v24 = v21;
          v28 = v19;
          do
          {
            v29 = a4[v28++];
            v23 |= v29 << v27;
            v27 += 8;
          }
          while (8 * v24 != v27);
        }
        else
        {
          v22 = 0;
          v23 = 0;
          if (v21 <= 1)
            v24 = 1;
          else
            v24 = v21;
          v25 = v19;
          do
          {
            v26 = a4[v25++];
            v23 |= v26 << v22;
            v22 += 8;
          }
          while (8 * v24 != v22);
        }
        v19 += v24;
        v14 += v23;
        if (v23)
          v20 = v14;
        else
          v20 = 0;
      }
      else
      {
        v20 = 0;
      }
      v11[v15++] = v20;
      v13 = a4[v19];
      v16 = v19;
    }
    while (a4[v19]);
  }
  else
  {
    v15 = 0;
  }
  *a1 = v11;
  *a2 = result;
  *a3 = v15;
  return result;
}

CFMutableDictionaryRef MKCFCreateNTFSInfo(uint64_t a1, const __CFDictionary *a2, _DWORD *a3)
{
  _DWORD *v5;
  _QWORD *v6;
  CFMutableDictionaryRef Mutable;
  int v8;
  BOOL v9;

  v5 = malloc_type_calloc(1uLL, 0x20uLL, 0x1020040CA22B68AuLL);
  if (v5)
  {
    v6 = v5;
    *v5 = FSConvertOptions(a2);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v6[1] = Mutable;
    v8 = MKRecordNTFSRuns();
    if (v8)
      v9 = Mutable == 0;
    else
      v9 = 1;
    if (!v9)
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
    free(v6);
    if (a3)
    {
      if (v8 != -1)
      {
LABEL_12:
        *a3 = v8;
        return Mutable;
      }
LABEL_11:
      v8 = *__error();
      goto LABEL_12;
    }
  }
  else
  {
    Mutable = 0;
    if (a3)
      goto LABEL_11;
  }
  return Mutable;
}

uint64_t PMCategoryStr(char *a1, _WORD *a2)
{
  int v3;
  __int16 v4;
  uint64_t result;

  v3 = APMDescriptorSearch(a1);
  v4 = v3;
  result = APMCategorize(v3);
  if (a2)
    *a2 = v4;
  return result;
}

uint64_t VBIOO(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))a1)(*(_QWORD *)(a1 + 8), a2, a3, (*(_DWORD *)(a1 + 16) + a4));
}

unint64_t PMConvertBlocks64(unint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2)
  {
    if (a2 != a3)
      return (a2 >> 9) * result / (a3 >> 9);
  }
  return result;
}

_DWORD *PMConvertRecord(_DWORD *result, unsigned int a2, int a3, int a4, unsigned int a5)
{
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;

  if (a4 != a5 && a4 && a5)
  {
    result[22] = result[22] & 0xFFBFFFFF | ((a5 == 1) << 22);
    v5 = result[2] * a4;
    v6 = result[3] * a4;
    if (a2 <= 3 && a3 == 4097)
    {
      v7 = (v5 + v6 - 1) / a5;
      result[2] = 1;
      result[3] = v7;
LABEL_14:
      result[21] = v7;
      return result;
    }
    if (v5 % a5)
      v8 = v5 / a5 + 1;
    else
      v8 = v5 / a5;
    if (v6 % a5)
      v7 = v6 / a5 + 1;
    else
      v7 = v6 / a5;
    result[2] = v8;
    result[3] = v7;
    if (result[21])
      goto LABEL_14;
  }
  return result;
}

uint64_t PMSearchBlock(uint64_t *a1, int a2, __int16 *a3)
{
  uint64_t v3;
  __int16 v4;
  __int16 v5;

  if (a3)
    *a3 = -1;
  if (!a1)
    return -109;
  v3 = *a1;
  if (!*a1)
  {
    v4 = -1;
    v5 = -50;
    if (!a3)
      return v5;
    goto LABEL_13;
  }
  if (!*(_WORD *)(v3 + 522))
  {
LABEL_9:
    v4 = -1;
    v5 = -5343;
    if (!a3)
      return v5;
    goto LABEL_13;
  }
  v4 = 0;
  while (*(_DWORD *)(v3 + 1072 * v4 + 536) != a2)
  {
    if (*(unsigned __int16 *)(v3 + 522) <= ++v4)
      goto LABEL_9;
  }
  v5 = 0;
  if (a3)
LABEL_13:
    *a3 = v4;
  return v5;
}

uint64_t PMIndexCompare(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  v2 = *(unsigned __int16 *)(a1 + 506);
  if (v2 == 0xFFFF)
    v2 = *(unsigned __int16 *)(a1 + 504);
  v3 = *(unsigned __int16 *)(a2 + 506);
  if (v3 == 0xFFFF)
    v3 = *(unsigned __int16 *)(a2 + 504);
  if (v2 != 0xFFFF && v3 != 0xFFFF)
    return ((__int16)v2 - (__int16)v3);
  v5 = *(_DWORD *)(a1 + 8);
  v6 = *(_DWORD *)(a2 + 8);
  v7 = v5 == v6;
  if (v5 > v6)
    v8 = 1;
  else
    v8 = -1;
  if (v7)
    return 0;
  else
    return v8;
}

uint64_t PMISODetect(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  const void *v5;
  __int16 v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  __int16 v12;
  int v13;
  int v14;
  __int16 v15;
  _OWORD v16[2];
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15 = 0;
  v17 = 0u;
  memset(v16, 0, sizeof(v16));
  v13 = 0;
  v14 = 0;
  v12 = 0;
  v4 = *(unsigned __int16 *)(*a1 + 2);
  v5 = (const void *)MKMediaCreateWithBIOVector(0, a2, a3, 0, &v15);
  v6 = v15;
  if (!v15)
  {
    v6 = MKDetectISO((uint64_t)v5, &v13, &v14, (uint64_t)v16);
    v15 = v6;
    if (v13)
    {
      if (!v6)
      {
        v7 = HIDWORD(v17);
        if (WORD4(v17) && WORD4(v17) != v4)
          v7 = HIDWORD(v17) * (WORD4(v17) >> 9) / (v4 >> 9);
        v8 = *a1;
        v9 = PMPSpecificIndex(*a1, 4097, 0, &v12);
        v15 = v9;
        if (v9)
        {
          v10 = 0;
        }
        else
        {
          v10 = *(_DWORD *)(v8 + 1072 * v12 + 540) + *(_DWORD *)(v8 + 1072 * v12 + 536);
          v7 -= v10;
        }
        v6 = PMGenPartitionType((const void **)a1, 16393, v10, v7, v4, 2097171, v16, 0, 0xFFFFu);
        v15 = v6;
      }
    }
  }
  if (v5)
  {
    CFRelease(v5);
    return v15;
  }
  return v6;
}

uint64_t VReadPartitions(const void ***a1, unsigned int a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unsigned __int16 *))
{
  uint64_t v7;
  int v8;
  const void **v9;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unsigned __int16 v15;
  Size v16;
  char *v17;
  int v18;
  const void *v19;
  _DWORD *v20;
  unsigned __int16 v21;
  __int16 v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  __int16 v28;
  int v29;
  unsigned int v30;
  int v31;
  _OWORD *v32;
  _DWORD *v33;
  int v34;
  int v35;
  int v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  __int16 v43;
  _OWORD v44[2];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v41 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  v39 = 0;
  v44[0] = *(_OWORD *)"Single Volume";
  v44[1] = unk_212DE46D4;
  if (a2 == 0xFFFF)
    v7 = 3584;
  else
    v7 = a2;
  v8 = a4(a3, 15, 0, 0, 0, (unsigned __int16 *)&v37);
  if (v8)
    goto LABEL_5;
  if ((v7 & 0x400) != 0)
  {
    v12 = v38;
    v11 = HIDWORD(v37);
    if ((v38 * ((unint64_t)HIDWORD(v37) >> 9)) >> 32)
    {
      v9 = 0;
      LOWORD(v8) = -5308;
      goto LABEL_6;
    }
  }
  else
  {
    v11 = HIDWORD(v37);
    v12 = v38;
  }
  v13 = v11;
  if (HIDWORD(v12))
  {
    v13 = v11;
    while ((v13 & 0x80000000) == 0)
    {
      v13 *= 2;
      HIDWORD(v37) = v13;
      v14 = v12 >> 33;
      v12 >>= 1;
      v38 = v12;
      if (!v14)
        goto LABEL_15;
    }
    v13 = 0;
    HIDWORD(v37) = 0;
    v38 = 0;
    v43 = 5;
LABEL_18:
    if (v13 <= 0x400)
      v15 = 1024;
    else
      v15 = v13;
    v16 = v15;
    v17 = NewPtr(v16);
    LOWORD(v8) = MemError();
    v43 = v8;
    if (!v17)
      goto LABEL_5;
    v18 = a4(a3, 130, v16, 0, 1, (unsigned __int16 *)v17);
    v43 = v18;
    if (v18)
    {
      v9 = 0;
LABEL_27:
      DisposePtr(v17);
      LOWORD(v8) = v43;
      goto LABEL_6;
    }
    v19 = (const void *)MKMediaCreateWithBIOVector(0, a3, (uint64_t)a4, 0, &v43);
    v9 = 0;
    if (v43)
      goto LABEL_25;
    v9 = (const void **)NewHandleClear(528);
    v43 = MemError();
    if (!v9)
      goto LABEL_25;
    v20 = *v9;
    v20[128] = 33554948;
    v21 = WORD2(v37);
    *((_WORD *)v20 + 259) = WORD2(v37);
    if ((v7 & 0x400) != 0)
      v22 = 512;
    else
      v22 = v21;
    *((_WORD *)v20 + 1) = v22;
    v23 = v21 | 0x200;
    v24 = (v21 >> 9) * v38;
    if (v23 == 512)
      v24 = v38;
    v20[1] = v24;
    *((_WORD *)v20 + 250) = (unsigned __int16)v11 >> 9;
    v40 = 0;
    LODWORD(v41) = 0;
    v43 = GPTSchemeDetect((uint64_t)v17, (uint64_t)&v37, (uint64_t)v19, (unsigned int *)&v41);
    if (v43)
      goto LABEL_25;
    v25 = MKMBRSchemeDetect((uint64_t)v17, (uint64_t)&v37, a3, (uint64_t)a4, &v41);
    v43 = v25;
    if (v25)
      goto LABEL_25;
    if ((int)v41 < 5000)
      goto LABEL_43;
    v43 = MKISOSchemeDetect((uint64_t)v19, &v40);
    if (v43)
      goto LABEL_25;
    if (v40 > 4999 || (int)v41 < 5000)
    {
LABEL_43:
      LODWORD(v41) = 0;
      v27 = MKAPMSchemeDetect(v17, (uint64_t)&v37, a3, a4, (int *)&v41);
      v43 = v27;
      if (v27)
        goto LABEL_25;
      if ((int)v41 >= 5000)
      {
        if ((v7 & 0x100) != 0)
          v28 = APMReadRawMediaMap(v9, v7, a3, a4);
        else
          v28 = APMReadMediaMap((uint64_t *)v9, v7, a3, a4);
        goto LABEL_67;
      }
      if ((v7 & 0x40) != 0)
      {
        LODWORD(v41) = 0;
        if ((v7 & 0x400) != 0)
        {
          v38 *= (unint64_t)HIDWORD(v37) >> 9;
          HIDWORD(v37) = 512;
        }
        v43 = MKFileSystemDetect((uint64_t)v19, (int *)&v41, &v42, (_DWORD *)&v41 + 1);
        if (v43)
          goto LABEL_25;
        v30 = WORD2(v37);
        v31 = v38;
        v32 = *v9;
        v32[2] = 0u;
        v32[3] = 0u;
        v32[4] = 0u;
        v32[5] = 0u;
        v32[6] = 0u;
        v32[7] = 0u;
        v32[8] = 0u;
        v32[9] = 0u;
        v32[10] = 0u;
        v32[11] = 0u;
        v32[12] = 0u;
        v32[13] = 0u;
        v32[14] = 0u;
        v32[15] = 0u;
        v32[16] = 0u;
        v32[17] = 0u;
        v32[18] = 0u;
        v32[19] = 0u;
        v32[20] = 0u;
        v32[21] = 0u;
        v32[22] = 0u;
        v32[23] = 0u;
        v32[24] = 0u;
        v32[25] = 0u;
        v32[26] = 0u;
        v32[27] = 0u;
        v32[28] = 0u;
        v32[29] = 0u;
        v32[30] = 0u;
        v32[31] = 0u;
        *v32 = 0u;
        v32[1] = 0u;
        v33 = *v9;
        v33[128] = 8389124;
        *((_WORD *)v33 + 1) = v30;
        v33[1] = v31;
        *((_WORD *)v33 + 250) = v30 >> 9;
        if ((int)v41 >= 5000)
        {
          v34 = 20225;
          switch(HIDWORD(v41))
          {
            case 1:
              if (v42 == 4)
                v34 = 16395;
              else
                v34 = 0x4000;
              break;
            case 3:
              break;
            case 4:
              v34 = 16398;
              break;
            case 6:
              v34 = 16386;
              break;
            default:
              goto LABEL_65;
          }
          v36 = PMGenPartitionType(v9, v34, 0, v38, WORD2(v37), 2097168, v44, 0, 0xFFFFu);
          v43 = v36;
          if (!v36)
            PMISODetect((uint64_t *)v9, a3, (uint64_t)a4);
          goto LABEL_25;
        }
LABEL_65:
        if (PMISODetect((uint64_t *)v9, a3, (uint64_t)a4))
        {
          *((_WORD *)*v9 + 257) = 1;
          v28 = PMGenPartitionType(v9, 16394, 0, v38, WORD2(v37), 2097168, "Whole Device", 0, 0xFFFFu);
          goto LABEL_67;
        }
        goto LABEL_25;
      }
      v29 = VReadISOPartitionsII(v9, v7, (uint64_t)&v37, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, _BYTE *))a4);
      v43 = v29;
      if (v29)
      {
        v43 = -5345;
        goto LABEL_25;
      }
    }
    else
    {
      v26 = VReadDosPartitions(v9, v7, 0, (uint64_t)&v37, a3, (uint64_t)a4);
      v43 = v26;
      if (v26)
        goto LABEL_25;
      if ((v7 & 0x800) == 0)
      {
LABEL_60:
        if ((v7 & 0x80) == 0)
          goto LABEL_25;
        goto LABEL_64;
      }
      PMSortMapII((Ptr *)v9, 0);
    }
    if ((v7 & 0x10) == 0)
      goto LABEL_60;
    v35 = PMAccountFreespace(v9, 0, v7);
    v43 = v35;
    if ((v7 & 0x80) != 0 && !v35)
    {
LABEL_64:
      v28 = PMRationalise(v9);
LABEL_67:
      v43 = v28;
    }
LABEL_25:
    if (v19)
      CFRelease(v19);
    goto LABEL_27;
  }
LABEL_15:
  LOWORD(v8) = 5;
  v43 = 5;
  if ((v13 & 0x1FF) == 0)
    goto LABEL_18;
LABEL_5:
  v9 = 0;
LABEL_6:
  *a1 = v9;
  return (__int16)v8;
}

uint64_t VErasePartition(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v5;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  if (!a1)
    return -50;
  v5 = *a1;
  if (*(unsigned __int16 *)(*a1 + 522) <= a2)
    return -5343;
  v7 = *(unsigned __int16 *)(v5 + 2);
  v8 = (unsigned int *)(v5 + 1072 * a2);
  v8[154] &= ~0x100000u;
  v9 = v8[134];
  v10 = v8[135];
  if (v10 >= a3)
    v11 = a3;
  else
    v11 = v10;
  if (a3)
    v12 = v11;
  else
    v12 = v10;
  return a5(a4, 4, v7, v9, v12, 0);
}

uint64_t PMNewPartitionListExtended(const void ***a1, unsigned int a2, unsigned int a3, int a4, int a5, char a6)
{
  return PMNewPartitionListInternal(a1, 0, a2, a3, a4, a5, a6);
}

uint64_t PMWriteContentExtended(uint64_t *a1, int a2, const char *a3, int a4, unsigned int a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t, char *))
{
  if (a1)
    return PMWriteContentInternal(*a1, a2, a3, a4, a5, 0, a6, a7);
  else
    return 4294967246;
}

uint64_t PMMediaWrite(uint64_t *a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t))
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;

  if (!a1)
    return -50;
  v6 = *a1;
  if (a2 >= *(unsigned __int16 *)(*a1 + 522))
    return -50;
  v8 = *(unsigned __int16 *)(v6 + 2);
  v9 = v6 + 1072 * a2;
  if (a3 % v8)
    v10 = a3 / v8 + 1;
  else
    v10 = a3 / v8;
  if (v10 > *(_DWORD *)(v9 + 540))
    return -5341;
  return a6(a5, 3);
}

uint64_t FindSTOC(_DWORD *a1, unsigned int a2, unsigned int a3, unsigned __int16 **a4)
{
  unsigned __int16 *v4;
  unsigned int v5;
  unsigned __int16 *v6;
  unsigned int v7;
  __int16 v8;

  if (a2 && *a1 != bswap32(a2))
  {
    return -43;
  }
  else
  {
    v4 = (unsigned __int16 *)(a1 + 8);
    v5 = a1[1];
    if (v5)
    {
      v6 = (unsigned __int16 *)((char *)v4 + bswap32(v5));
      v7 = __rev16(a3);
      while (1)
      {
        if (*v4 == v7)
        {
          v8 = 0;
          if (a4)
            goto LABEL_14;
          return v8;
        }
        if (!v4[1])
          break;
        v4 = (unsigned __int16 *)((char *)v4 + __rev16(v4[1]));
        if (v4 >= v6)
          goto LABEL_8;
      }
      v8 = -39;
      if (!a4)
        return v8;
    }
    else
    {
LABEL_8:
      v8 = -192;
      if (!a4)
        return v8;
    }
LABEL_14:
    *a4 = v4;
  }
  return v8;
}

uint64_t STOCRead(unsigned int a1, unsigned int a2, _WORD *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, size_t *))
{
  int v12;
  __int16 v13;
  _DWORD *v14;
  _DWORD *v15;
  int v16;
  int STOC;
  unsigned __int16 *v18;
  uint64_t v19;
  unsigned __int16 *v21;
  size_t size[3];

  memset(size, 0, sizeof(size));
  v21 = 0;
  v12 = a6(a5, 15, 0, 0, 0, size);
  v13 = v12;
  if (!v12)
  {
    v14 = malloc_type_malloc(HIDWORD(size[0]), 0xAEEAE90CuLL);
    if (v14)
    {
      v15 = v14;
      v16 = a6(a5, 2, WORD2(size[0]), a4, 1, (size_t *)v14);
      v13 = v16;
      if (!v16)
      {
        STOC = FindSTOC(v15, a1, a2, &v21);
        v13 = STOC;
        if (!STOC)
        {
          v18 = v21;
          *a3 = bswap32(*v21) >> 16;
          v19 = bswap32(v18[1]) >> 16;
          a3[1] = v19;
          memcpy(a3 + 2, v18 + 2, v19 - 4);
        }
      }
      free(v15);
    }
    else
    {
      return -1;
    }
  }
  return v13;
}

uint64_t STOCWrite(unsigned __int16 *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, size_t *))
{
  int v10;
  __int16 v11;
  char *v12;
  char *v13;
  int v14;
  int STOC;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  size_t size[3];

  memset(size, 0, sizeof(size));
  v18 = 0;
  v10 = a5(a4, 15, 0, 0, 0, size);
  v11 = v10;
  if (!v10)
  {
    v12 = (char *)malloc_type_malloc(HIDWORD(size[0]), 0x936E04E7uLL);
    if (!v12)
      return -1;
    v13 = v12;
    v14 = a5(a4, 2, WORD2(size[0]), a3, 1, (size_t *)v12);
    v11 = v14;
    if (v14)
      goto LABEL_4;
    STOC = FindSTOC(v13, a2, *a1, &v18);
    v11 = STOC;
    if (STOC)
    {
      if (STOC == -43)
      {
        *(_DWORD *)v13 = bswap32(a2);
        *((_DWORD *)v13 + 1) = bswap32(HIDWORD(size[0]));
        *((_DWORD *)v13 + 2) = 256;
        *((_QWORD *)v13 + 2) = time(0);
        v17 = (unsigned __int16 *)(v13 + 32);
        v18 = (unsigned __int16 *)(v13 + 32);
LABEL_15:
        if (bswap32(*((_DWORD *)v13 + 1)) + (_DWORD)v13 - (_DWORD)v17 < a1[1])
          goto LABEL_16;
LABEL_17:
        *v17 = bswap32(*a1) >> 16;
        v17[1] = bswap32(a1[1]) >> 16;
        memcpy(v17 + 2, a1 + 2, a1[1] - 4);
        *((_QWORD *)v13 + 3) = bswap32(time(0));
        v11 = a5(a4, 3, WORD2(size[0]), a3, 1, (size_t *)v13);
        goto LABEL_4;
      }
      if (STOC == -192)
      {
        v17 = v18;
        goto LABEL_15;
      }
    }
    else if (a1[1] > v18[1])
    {
LABEL_16:
      v11 = -5344;
      goto LABEL_4;
    }
    if (STOC)
    {
LABEL_4:
      free(v13);
      return v11;
    }
    v17 = v18;
    goto LABEL_17;
  }
  return v11;
}

uint64_t MKMediaDeviceOpenExtended(char *a1, char a2, uint64_t a3, uint64_t *a4)
{
  const void **v7;
  uint64_t v8;
  __CFDictionary *Mutable;
  const __CFDictionary *v10;
  const void **v11;
  int v13;

  v7 = (const void **)MEMORY[0x24BDBD268];
  v13 = 0;
  v8 = *MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v10 = Mutable;
  v11 = (const void **)MEMORY[0x24BDBD270];
  if ((a2 & 2) == 0)
    v11 = v7;
  CFDictionaryAddValue(Mutable, CFSTR("Writable"), *v11);
  *a4 = MKMediaCreateWithPath(v8, a1, v10, &v13);
  return (__int16)v13;
}

uint64_t MKMediaDeviceOpen(char *a1, char a2, uint64_t *a3)
{
  return MKMediaDeviceOpenExtended(a1, a2, (uint64_t)a3, a3);
}

uint64_t MKMediaDeviceClose(const void *a1)
{
  if (a1)
  {
    CFRelease(a1);
    return 0;
  }
  else
  {
    return -5327;
  }
}

uint64_t _MKMediaBIOVectorInitialize(uint64_t a1, const __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  const void *Value;
  const void *v6;
  CFTypeID TypeID;
  _BOOL4 v8;
  const void *v10;
  const void *v11;
  CFTypeID v12;
  CFTypeID v13;
  const void *v14;
  _BOOL4 v15;
  const void *v16;
  const void *v17;
  const void *v18;

  if (!a1)
    return 22;
  if (*(_DWORD *)a1 != 1296786038)
    return 22;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 24) = Mutable;
  if (!Mutable)
    return 12;
  if (!a2)
  {
    v14 = (const void *)*MEMORY[0x24BDBD270];
    v16 = (const void *)*MEMORY[0x24BDBD268];
    v15 = 1;
LABEL_19:
    v17 = v16;
    goto LABEL_20;
  }
  Value = CFDictionaryGetValue(a2, CFSTR("Writable"));
  v8 = Value
    && (v6 = Value, TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(v6))
    && CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDBD270]) != 0;
  v10 = CFDictionaryGetValue(a2, CFSTR("Shared Writer"));
  if (v10)
  {
    v11 = v10;
    v12 = CFBooleanGetTypeID();
    v13 = CFGetTypeID(v11);
    v14 = (const void *)*MEMORY[0x24BDBD270];
    if (v12 == v13)
    {
      v15 = CFEqual(v11, (CFTypeRef)*MEMORY[0x24BDBD270]) == 0;
      goto LABEL_18;
    }
  }
  else
  {
    v14 = (const void *)*MEMORY[0x24BDBD270];
  }
  v15 = 1;
LABEL_18:
  Mutable = *(__CFDictionary **)(a1 + 24);
  v16 = (const void *)*MEMORY[0x24BDBD268];
  v17 = v14;
  if (!v8)
    goto LABEL_19;
LABEL_20:
  CFDictionaryAddValue(Mutable, CFSTR("Writable"), v17);
  if (v15)
    v18 = v16;
  else
    v18 = v14;
  CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 24), CFSTR("Shared Writer"), v18);
  return 0;
}

void _MKMediaBIOVectorDeinitialize(_QWORD *a1)
{
  const void *v2;

  if (a1 && *(_DWORD *)a1 == 1296786038)
  {
    v2 = (const void *)a1[3];
    if (v2)
      CFRelease(v2);
    free(a1);
  }
}

const void *_MKMediaBIOVectorCopyProperty(uint64_t a1, void *key)
{
  const __CFDictionary *v4;
  const void *v5;
  const void *Value;
  __CFDictionary *Mutable;

  if (!key)
    return 0;
  v4 = *(const __CFDictionary **)(a1 + 24);
  if (v4 && (v5 = CFDictionaryGetValue(v4, key)) != 0)
  {
    Value = v5;
    Mutable = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    _MKMediaBIOVectorGetGeoProperties(a1, Mutable);
    Value = CFDictionaryGetValue(Mutable, key);
    if (!Value)
      goto LABEL_8;
  }
  CFRetain(Value);
LABEL_8:
  if (Mutable)
    CFRelease(Mutable);
  return Value;
}

__CFDictionary *_MKMediaBIOVectorCopyProperties(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFAllocator *v3;
  __CFDictionary *MutableCopy;
  __CFDictionary *v5;

  v2 = *(const __CFDictionary **)(a1 + 24);
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (v2)
    MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v2);
  else
    MutableCopy = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = MutableCopy;
  _MKMediaBIOVectorGetGeoProperties(a1, MutableCopy);
  return v5;
}

uint64_t _MKMediaBIOVectorSetProperty()
{
  return 0;
}

CFStringRef _MKMediaBIOVectorDescription(uint64_t a1, const __CFDictionary *a2)
{
  int v4;
  const char *dli_sname;
  BOOL v6;
  Dl_info v8;

  memset(&v8, 0, sizeof(v8));
  v4 = dladdr(*(const void **)(a1 + 8), &v8);
  dli_sname = v8.dli_sname;
  if (v4)
    v6 = v8.dli_sname == 0;
  else
    v6 = 1;
  if (v6)
  {
    dli_sname = "unknown";
    v8.dli_sname = "unknown";
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, CFSTR("<MKMediaRef>: [BIOVector %s<%p> refcon %p]"), dli_sname, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _MKMediaBIOVectorReadSectors(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  if ((a3 | a2) >> 32)
    return 22;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 16), 2, 512, a2, a3, a4);
  if (a5)
  {
    if (!(_DWORD)result)
      *a5 = a3;
  }
  return result;
}

uint64_t _MKMediaBIOVectorWriteSectors(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;

  if ((a3 | a2) >> 32)
    return 22;
  result = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 8))(*(_QWORD *)(a1 + 16), 3, 512, a2, a3, a4);
  if (a5)
  {
    if (!(_DWORD)result)
      *a5 = a3;
  }
  return result;
}

uint64_t MKMediaCreateWithBIOVector(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, _WORD *a5)
{
  uint64_t result;
  int v11;

  v11 = 22;
  if (a3)
  {
    result = (uint64_t)malloc_type_malloc(0x20uLL, 0x10A00402946438FuLL);
    if (result)
    {
      *(_DWORD *)result = 1296786038;
      *(_QWORD *)(result + 8) = a3;
      *(_QWORD *)(result + 16) = a2;
      *(_QWORD *)(result + 24) = 0;
      v11 = 0;
      result = MKMediaCreate(a1, result, (uint64_t)&_MKMediaBIOVectorVector, a4, &v11);
      if (!a5)
        return result;
    }
    else
    {
      v11 = 12;
      if (!a5)
        return result;
    }
  }
  else
  {
    result = 0;
    if (!a5)
      return result;
  }
  *a5 = v11;
  return result;
}

uint64_t _MKMediaBIOVectorGetGeoProperties(uint64_t a1, __CFDictionary *a2)
{
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 && *(_DWORD *)a1 == 1296786038)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v3 = (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, uint64_t *))(a1 + 8))(*(_QWORD *)(a1 + 16), 15, 0, 0, 0, &v5);
    if (!v3)
      LOWORD(v3) = _MKMediaSetupGeometry(a2, SHIDWORD(v5), (v6 * (unint64_t)HIDWORD(v5)) >> 9, (HIDWORD(v5) * (unsigned __int16)v7) >> 9);
    if ((_WORD)v3 == 0xFFFF)
      return *__error();
  }
  else
  {
    LOWORD(v3) = 22;
  }
  return (__int16)v3;
}

uint64_t APFSContainerGetFreespaceInfo()
{
  return MEMORY[0x24BDFD280]();
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC310](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
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

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC340](md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC348](c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC350](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A8](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x24BDBB7D8](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
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

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x24BDBBA80](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
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

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
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

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x24BDBC208](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x24BDBC218](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x24BDBC230](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x24BDBC258](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x24BDBC4B0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
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

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

Boolean CFStringGetPascalString(CFStringRef theString, StringPtr buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC678](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x24BDBC968](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x24BDBC988](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x24BDBC9A8](stream);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
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

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

kern_return_t IORegistryEntryGetPath(io_registry_entry_t entry, const io_name_t plane, io_string_t path)
{
  return MEMORY[0x24BDD8900](*(_QWORD *)&entry, plane, path);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return MEMORY[0x24BDD8920](*(_QWORD *)&entry, plane);
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

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

char *__cdecl devname(dev_t a1, mode_t a2)
{
  return (char *)MEMORY[0x24BDADC28](*(_QWORD *)&a1, a2);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x24BDAE058](a1, a2);
}

int dup(int a1)
{
  return MEMORY[0x24BDAE0B8](*(_QWORD *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x24BDAE0C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int execv(const char *__path, char *const *__argv)
{
  return MEMORY[0x24BDAE250](__path, __argv);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

pid_t fork(void)
{
  return MEMORY[0x24BDAE418]();
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x24BDAE518](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x24BDAE638](*(_QWORD *)&a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x24BDAE690](a1, *(_QWORD *)&a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x24BEDF200](file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x24BEDF240](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x24BEDF248](file, buf, *(_QWORD *)&len);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x24BDAE888](a1, *(_QWORD *)&a2);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x24BDAE8C8](*(_QWORD *)&a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x24BDAEB20](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED90](size, type_id);
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

int mlock(const void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFA0](a1, a2);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFC8](a1, a2, *(_QWORD *)&a3);
}

int munlock(const void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFE8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x24BDAF5D0](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
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

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
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

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x24BDAFE58](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFEE8](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
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

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x24BDAFF50](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0030](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0040](__str, __endptr, *(_QWORD *)&__base);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x24BDB0300](uu);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0308](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0310](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x24BDB0318](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0328](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0330](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0338](uu, out);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0348](uu, out);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x24BDB0470](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

