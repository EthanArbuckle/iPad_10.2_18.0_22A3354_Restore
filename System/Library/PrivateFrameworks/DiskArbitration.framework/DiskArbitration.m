uint64_t _DAAuthorize()
{
  return 0;
}

void _DADispatchCallback(void *cf, int a2, uint64_t a3, unsigned int a4, const __CFData *a5, const __CFNumber *a6)
{
  const __CFData *v7;
  int v11;
  char *v12;
  const __CFDictionary *v13;
  const __CFNumber *IntegerValue;
  const __CFNumber *v15;
  unsigned int v16;
  uint64_t v17;
  const void *v18;
  const void *v19;
  int v20;
  const __CFData *v21;
  unsigned int ID;
  char *v23;
  const UInt8 *BytePtr;
  unsigned int Length;
  int v26;
  const void *v27;

  v7 = a5;
  if (a5)
  {
    v11 = CFGetAllocator(cf);
    v7 = (const __CFData *)_DADiskCreateFromSerialization(v11, cf, v7);
  }
  v12 = DAGetCallbackFromSession((char *)cf, a2);
  if (v12)
  {
    v13 = (const __CFDictionary *)v12;
    IntegerValue = ___CFDictionaryGetIntegerValue((const __CFDictionary *)v12, CFSTR("DACallbackAddress"));
    v15 = ___CFDictionaryGetIntegerValue(v13, CFSTR("DACallbackContext"));
    v16 = ___CFDictionaryGetIntegerValue(v13, CFSTR("DACallbackBlock"));
    if (IntegerValue)
    {
      switch(a4)
      {
        case 0u:
        case 4u:
          if (v16)
            (*((void (**)(const __CFNumber *, const __CFData *))IntegerValue + 2))(IntegerValue, v7);
          else
            ((void (*)(const __CFData *, const __CFNumber *))IntegerValue)(v7, v15);
          goto LABEL_47;
        case 1u:
        case 5u:
        case 7u:
        case 0xCu:
        case 0xDu:
          if (v16)
            (*((void (**)(const __CFNumber *, const __CFData *, const __CFNumber *))IntegerValue + 2))(IntegerValue, v7, a6);
          else
            ((void (*)(const __CFData *, const __CFNumber *, const __CFNumber *))IntegerValue)(v7, a6, v15);
          goto LABEL_46;
        case 2u:
        case 6u:
        case 8u:
        case 0xEu:
          if (v16)
            v17 = (*((uint64_t (**)(const __CFNumber *, const __CFData *))IntegerValue + 2))(IntegerValue, v7);
          else
            v17 = ((uint64_t (*)(const __CFData *, const __CFNumber *))IntegerValue)(v7, v15);
          v18 = (const void *)*MEMORY[0x24BDBD430];
          if (v17)
            v19 = (const void *)v17;
          else
            v19 = (const void *)*MEMORY[0x24BDBD430];
          if (!v19)
            break;
          goto LABEL_32;
        case 3u:
          if (v16)
            (*((void (**)(const __CFNumber *, const __CFData *, const __CFNumber *))IntegerValue + 2))(IntegerValue, v7, a6);
          else
            ((void (*)(const __CFData *, const __CFNumber *, const __CFNumber *))IntegerValue)(v7, a6, v15);
          goto LABEL_47;
        case 9u:
          if (v16)
            (*((void (**)(const __CFNumber *, const __CFData *))IntegerValue + 2))(IntegerValue, v7);
          else
            ((void (*)(const __CFData *, const __CFNumber *))IntegerValue)(v7, v15);
          v18 = (const void *)*MEMORY[0x24BDBD430];
          v19 = (const void *)*MEMORY[0x24BDBD430];
          if (!*MEMORY[0x24BDBD430])
            break;
LABEL_32:
          v20 = ___CFNumberGetIntegerValue(a6);
          if (_DASessionGetID((uint64_t)cf)
            || !_DASessionIsKeepAlive((uint64_t)cf)
            || !_DASessionRecreate(cf))
          {
            v27 = v18;
            if (v19 == v18)
              v21 = 0;
            else
              v21 = _DASerialize((const __CFAllocator *)*MEMORY[0x24BDBD240]);
            ID = _DASessionGetID((uint64_t)cf);
            v23 = (char *)_DADiskGetID((uint64_t)v7);
            if (v21)
            {
              v26 = v20;
              BytePtr = CFDataGetBytePtr(v21);
              Length = CFDataGetLength(v21);
              _DAServerSessionQueueResponse(ID, a2, a2, a4, v23, (uint64_t)BytePtr, Length, v26);
              CFRelease(v21);
            }
            else
            {
              _DAServerSessionQueueResponse(ID, a2, a2, a4, v23, 0, 0, v20);
            }
            v18 = v27;
          }
          if (v19 != v18)
            CFRelease(v19);
          break;
        case 0xAu:
          if (!v16)
            goto LABEL_46;
          goto LABEL_24;
        case 0xFu:
          if (!v16)
            goto LABEL_27;
          (*((void (**)(const __CFNumber *))IntegerValue + 2))(IntegerValue);
          goto LABEL_47;
        case 0x10u:
LABEL_27:
          ((void (*)(const __CFNumber *))IntegerValue)(v15);
          goto LABEL_47;
        case 0x11u:
LABEL_24:
          (*((void (**)(const __CFNumber *, const __CFNumber *))IntegerValue + 2))(IntegerValue, a6);
          goto LABEL_46;
        default:
          goto LABEL_47;
      }
    }
  }
  if (a4 <= 0x11 && ((1 << a4) & 0x234A2) != 0)
LABEL_46:
    DARemoveCallbackFromSessionWithKey((uint64_t)cf, a2);
LABEL_47:
  if (v7)
    CFRelease(v7);
}

uint64_t _DAInitialize()
{
  return pthread_once(&_DAInitialize_initialize, __DAInitialize);
}

void __DAInitialize()
{
  const __CFAllocator *v0;
  CFMutableDictionaryRef Mutable;
  const __CFDictionary *v2;
  __CFDictionary *v3;
  const __CFDictionary *v4;
  const void *v5;
  __CFDictionary *v6;
  const __CFDictionary *v7;
  __CFDictionary *v8;
  const __CFDictionary *v9;
  __CFArray *v10;
  const __CFArray *v11;
  __CFArray *v12;
  const __CFArray *v13;

  _DADiskInitialize();
  _DASessionInitialize();
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    __DAInitialize_cold_1();
  v2 = Mutable;
  ___CFDictionarySetIntegerValue(Mutable, CFSTR("DAMediaSize"), 0);
  kDADiskDescriptionMatchMediaUnformatted = v2;
  v3 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v3)
    __DAInitialize_cold_2();
  v4 = v3;
  v5 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(v3, CFSTR("DAMediaWhole"), (const void *)*MEMORY[0x24BDBD270]);
  kDADiskDescriptionMatchMediaWhole = v4;
  v6 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v6)
    __DAInitialize_cold_3();
  v7 = v6;
  CFDictionarySetValue(v6, CFSTR("DAVolumeMountable"), v5);
  kDADiskDescriptionMatchVolumeMountable = v7;
  v8 = CFDictionaryCreateMutable(v0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v8)
    __DAInitialize_cold_4();
  v9 = v8;
  CFDictionarySetValue(v8, CFSTR("DAVolumeMountable"), (const void *)*MEMORY[0x24BDBD268]);
  kDADiskDescriptionMatchVolumeUnrecognized = v9;
  v10 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
  if (!v10)
    __DAInitialize_cold_5();
  v11 = v10;
  CFArrayAppendValue(v10, CFSTR("DAVolumeName"));
  kDADiskDescriptionWatchVolumeName = v11;
  v12 = CFArrayCreateMutable(v0, 0, MEMORY[0x24BDBD690]);
  if (!v12)
    __DAInitialize_cold_6();
  v13 = v12;
  CFArrayAppendValue(v12, CFSTR("DAVolumePath"));
  kDADiskDescriptionWatchVolumePath = v13;
}

void _DARegisterCallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, const __CFDictionary *a6, CFMutableDataRef a7, unsigned int a8)
{
  const __CFAllocator *v16;
  CFMutableDictionaryRef v17;
  int v18;
  mach_port_t ID;
  uint64_t v20;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v23;
  int v24;

  if (!a1
    || !_DASessionGetID(a1)
    && _DASessionIsKeepAlive(a1)
    && _DASessionRecreate(a1))
  {
    return;
  }
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a6)
    a6 = _DASerializeDiskDescription((const __CFAllocator *)*MEMORY[0x24BDBD240], a6);
  if (a7)
    a7 = _DASerialize(v16);
  v17 = DACallbackCreate(v16, a2, a3, a4, a5, a6, a7, a8);
  v18 = DAAddCallbackToSession(a1, v17);
  CFRelease(v17);
  ID = _DASessionGetID(a1);
  v20 = v18;
  if (!a6)
  {
    BytePtr = 0;
    Length = 0;
    if (a7)
      goto LABEL_11;
LABEL_13:
    v23 = 0;
    v24 = 0;
    goto LABEL_14;
  }
  BytePtr = CFDataGetBytePtr(a6);
  Length = CFDataGetLength(a6);
  if (!a7)
    goto LABEL_13;
LABEL_11:
  v23 = CFDataGetBytePtr(a7);
  v24 = CFDataGetLength(a7);
LABEL_14:
  _DAServerSessionRegisterCallback(ID, v20, v20, a4, a5, (uint64_t)BytePtr, Length, (uint64_t)v23, v24);
  if (a6)
    CFRelease(a6);
  if (a7)
    CFRelease(a7);
}

uint64_t _DAUnregisterCallback(uint64_t result, const __CFNumber *a2, const __CFNumber *a3)
{
  uint64_t v5;
  int v6;
  mach_port_t ID;

  if (result)
  {
    v5 = result;
    if (_DASessionGetID(result)
      || !_DASessionIsKeepAlive(v5)
      || (result = _DASessionRecreate(v5), !(_DWORD)result))
    {
      v6 = DARemoveCallbackFromSession(v5, a2, a3);
      ID = _DASessionGetID(v5);
      return _DAServerSessionUnregisterCallback(ID, v6, v6);
    }
  }
  return result;
}

void DADiskClaimCommon(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void (**a5)(_QWORD, _QWORD, _QWORD), uint64_t a6, unsigned int a7)
{
  CFAllocatorRef *v11;
  const __CFAllocator *v13;
  CFMutableDictionaryRef v14;
  uint64_t Session;
  int v16;
  const __CFData *v17;
  const __CFData *v18;
  uint64_t v19;
  DAReturn v20;
  DADissenterRef v21;

  v11 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (!a1)
  {
    v20 = -119930877;
    if (!a5)
      return;
    goto LABEL_9;
  }
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = DACallbackCreate((const __CFAllocator *)*MEMORY[0x24BDBD240], a3, a4, 0xFFFFFFFF, 0, 0, 0, a7);
  Session = _DADiskGetSession(a1);
  v16 = DAAddCallbackToSession(Session, v14);
  CFRelease(v14);
  v17 = ___CFNumberCreateWithIntegerValue(v13, v16);
  v18 = ___CFNumberCreateWithIntegerValue(v13, v16);
  v19 = _DADiskGetSession(a1);
  v20 = __DAQueueRequest(v19, 1, a1, a2, v17, v18, (uint64_t)a5, a6, a7);
  if (v17)
    CFRelease(v17);
  if (v18)
    CFRelease(v18);
  if (a5)
  {
LABEL_9:
    if (v20)
    {
      v21 = DADissenterCreate(*v11, v20, 0);
      if (a7)
      {
        ((void (**)(_QWORD, uint64_t, DADissenterRef))a5)[2](a5, a1, v21);
        _Block_release(a5);
      }
      else
      {
        ((void (*)(uint64_t, DADissenterRef, uint64_t))a5)(a1, v21, a6);
      }
      CFRelease(v21);
    }
  }
}

uint64_t __DAQueueRequest(uint64_t a1, int a2, uint64_t a3, int a4, const __CFData *a5, const __CFData *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  uint64_t v9;
  const __CFAllocator *v18;
  CFMutableDictionaryRef v19;
  int v20;
  mach_port_t ID;
  char *v22;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v25;
  unsigned int v26;

  v9 = 4175036419;
  if (!a1
    || !_DASessionGetID(a1)
    && _DASessionIsKeepAlive(a1)
    && _DASessionRecreate(a1))
  {
    return v9;
  }
  v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a5)
    a5 = _DASerialize((const __CFAllocator *)*MEMORY[0x24BDBD240]);
  if (a6)
    a6 = _DASerialize(v18);
  v19 = DACallbackCreate(v18, a7, a8, 0xFFFFFFFF, 0, 0, 0, a9);
  v20 = DAAddCallbackToSession(a1, v19);
  CFRelease(v19);
  ID = _DASessionGetID(a1);
  v22 = (char *)_DADiskGetID(a3);
  if (!a5)
  {
    BytePtr = 0;
    Length = 0;
    if (a6)
      goto LABEL_11;
LABEL_13:
    v25 = 0;
    v26 = 0;
    goto LABEL_14;
  }
  BytePtr = CFDataGetBytePtr(a5);
  Length = CFDataGetLength(a5);
  if (!a6)
    goto LABEL_13;
LABEL_11:
  v25 = CFDataGetBytePtr(a6);
  v26 = CFDataGetLength(a6);
LABEL_14:
  v9 = _DAServerSessionQueueRequest(ID, a2, v22, a4, (uint64_t)BytePtr, Length, (uint64_t)v25, v26, v20, v20);
  if (a5)
    CFRelease(a5);
  if (a6)
    CFRelease(a6);
  return v9;
}

void DADiskClaim(DADiskRef disk, DADiskClaimOptions options, DADiskClaimReleaseCallback release, void *releaseContext, DADiskClaimCallback callback, void *callbackContext)
{
  DADiskClaimCommon((uint64_t)disk, options, (uint64_t)release, (uint64_t)releaseContext, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)callbackContext, 0);
}

void DADiskEjectCommon(uint64_t a1, int a2, void (**a3)(_QWORD, _QWORD, _QWORD), uint64_t a4, int a5)
{
  uint64_t Session;
  DAReturn v11;
  DADissenterRef v12;

  if (a1)
  {
    _DADiskGetSession(a1);
    Session = _DADiskGetSession(a1);
    v11 = __DAQueueRequest(Session, 5, a1, a2, 0, 0, (uint64_t)a3, a4, a5);
    if (!a3)
      return;
  }
  else
  {
    v11 = -119930877;
    if (!a3)
      return;
  }
  if (v11)
  {
    v12 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0);
    if (a5)
    {
      ((void (**)(_QWORD, uint64_t, DADissenterRef))a3)[2](a3, a1, v12);
      _Block_release(a3);
    }
    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a3)(a1, v12, a4);
    }
    CFRelease(v12);
  }
}

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
  DADiskEjectCommon((uint64_t)disk, options, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)context, 0);
}

Boolean DADiskIsClaimed(DADiskRef disk)
{
  uint64_t Session;
  mach_port_name_t SessionID;
  const char *ID;
  int v7;

  v7 = 0;
  if (!disk)
    return 0;
  Session = _DADiskGetSession((uint64_t)disk);
  if (!_DADiskGetSessionID((uint64_t)disk)
    && _DASessionIsKeepAlive(Session)
    && _DASessionRecreate(Session))
  {
    return 0;
  }
  SessionID = _DADiskGetSessionID((uint64_t)disk);
  ID = (const char *)_DADiskGetID((uint64_t)disk);
  _DAServerDiskIsClaimed(SessionID, ID, &v7);
  return v7;
}

void DADiskMount(DADiskRef disk, CFURLRef path, DADiskMountOptions options, DADiskMountCallback callback, void *context)
{
  DADiskMountWithArgumentsCommon((uint64_t)disk, path, options, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)context, 0, 0);
}

void DADiskMountWithArguments(DADiskRef disk, CFURLRef path, DADiskMountOptions options, DADiskMountCallback callback, void *context, CFStringRef *arguments)
{
  DADiskMountWithArgumentsCommon((uint64_t)disk, path, options, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)context, (uint64_t)arguments, 0);
}

void DADiskMountWithArgumentsCommon(uint64_t a1, const void *a2, int a3, void (**a4)(_QWORD, _QWORD, _QWORD), uint64_t a5, uint64_t a6, int a7)
{
  __CFString *MutableCopy;
  _QWORD *v15;
  uint64_t Session;
  const __CFData *v18;
  DAReturn v19;
  DADissenterRef v20;

  if (!a6 || !*(_QWORD *)a6)
  {
    MutableCopy = 0;
    goto LABEL_10;
  }
  if (*(_QWORD *)(a6 + 8))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, *(CFStringRef *)a6);
    if (MutableCopy && *(_QWORD *)(a6 + 8))
    {
      v15 = (_QWORD *)(a6 + 16);
      do
      {
        CFStringAppend(MutableCopy, CFSTR(","));
        CFStringAppend(MutableCopy, (CFStringRef)*(v15 - 1));
      }
      while (*v15++);
    }
LABEL_10:
    if (!a2)
      goto LABEL_12;
    goto LABEL_11;
  }
  MutableCopy = (__CFString *)CFRetain(*(CFTypeRef *)a6);
  if (a2)
LABEL_11:
    CFRetain(a2);
LABEL_12:
  if (a1)
  {
    _DADiskGetSession(a1);
    Session = _DADiskGetSession(a1);
    if (a2)
      v18 = (const __CFData *)CFURLGetString((CFURLRef)a2);
    else
      v18 = 0;
    v19 = __DAQueueRequest(Session, 7, a1, a3, v18, (const __CFData *)MutableCopy, (uint64_t)a4, a5, a7);
    if (MutableCopy)
      goto LABEL_19;
  }
  else
  {
    v19 = -119930877;
    if (MutableCopy)
LABEL_19:
      CFRelease(MutableCopy);
  }
  if (a2)
    CFRelease(a2);
  if (a4 && v19)
  {
    v20 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v19, 0);
    if (a7)
    {
      ((void (**)(_QWORD, uint64_t, DADissenterRef))a4)[2](a4, a1, v20);
      _Block_release(a4);
    }
    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a4)(a1, v20, a5);
    }
    CFRelease(v20);
  }
}

void DADiskRenameCommon(uint64_t a1, CFTypeRef cf, int a3, void (**a4)(_QWORD, _QWORD, _QWORD), uint64_t a5, int a6)
{
  DAReturn v10;
  CFTypeID v13;
  uint64_t Session;
  DADissenterRef v15;

  v10 = -119930877;
  if (a1)
  {
    if (cf)
    {
      v13 = CFGetTypeID(cf);
      if (v13 == CFStringGetTypeID())
      {
        _DADiskGetSession(a1);
        Session = _DADiskGetSession(a1);
        v10 = __DAQueueRequest(Session, 12, a1, a3, (const __CFData *)cf, 0, (uint64_t)a4, a5, a6);
      }
    }
  }
  if (a4 && v10)
  {
    v15 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v10, 0);
    if (a6)
    {
      ((void (**)(_QWORD, uint64_t, DADissenterRef))a4)[2](a4, a1, v15);
      _Block_release(a4);
    }
    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a4)(a1, v15, a5);
    }
    CFRelease(v15);
  }
}

void DADiskProbeWithBlockCommon(uint64_t a1, void (**a2)(_QWORD))
{
  uint64_t Session;
  int v5;

  if (a1)
  {
    Session = _DADiskGetSession(a1);
    v5 = __DAQueueRequest(Session, 10, a1, 0, 0, 0, (uint64_t)a2, 0, 1u);
    if (!a2)
      return;
  }
  else
  {
    v5 = -119930877;
    if (!a2)
      return;
  }
  if (v5)
  {
    a2[2](a2);
    _Block_release(a2);
  }
}

void DADiskRename(DADiskRef disk, CFStringRef name, DADiskRenameOptions options, DADiskRenameCallback callback, void *context)
{
  DADiskRenameCommon((uint64_t)disk, name, options, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)context, 0);
}

void DADiskSetFSKitAdditionsCommon(uint64_t a1, const __CFData *a2, void (**a3)(_QWORD))
{
  uint64_t Session;
  int v7;

  if (a1)
  {
    Session = _DADiskGetSession(a1);
    v7 = __DAQueueRequest(Session, 17, a1, 0, a2, 0, (uint64_t)a3, 0, 1u);
    if (!a3)
      return;
  }
  else
  {
    v7 = -119930877;
    if (!a3)
      return;
  }
  if (v7)
  {
    a3[2](a3);
    _Block_release(a3);
  }
}

void DADiskUnmountCommon(uint64_t a1, int a2, void (**a3)(_QWORD, _QWORD, _QWORD), uint64_t a4, int a5)
{
  uint64_t Session;
  DAReturn v11;
  DADissenterRef v12;

  if (a1)
  {
    _DADiskGetSession(a1);
    Session = _DADiskGetSession(a1);
    v11 = __DAQueueRequest(Session, 13, a1, a2, 0, 0, (uint64_t)a3, a4, a5);
    if (!a3)
      return;
  }
  else
  {
    v11 = -119930877;
    if (!a3)
      return;
  }
  if (v11)
  {
    v12 = DADissenterCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0);
    if (a5)
    {
      ((void (**)(_QWORD, uint64_t, DADissenterRef))a3)[2](a3, a1, v12);
      _Block_release(a3);
    }
    else
    {
      ((void (*)(uint64_t, DADissenterRef, uint64_t))a3)(a1, v12, a4);
    }
    CFRelease(v12);
  }
}

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
  DADiskUnmountCommon((uint64_t)disk, options, (void (**)(_QWORD, _QWORD, _QWORD))callback, (uint64_t)context, 0);
}

void DARegisterDiskAppearedCallback(DASessionRef session, CFDictionaryRef match, DADiskAppearedCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0, 0, match, 0, 0);
}

void DARegisterDiskDescriptionChangedCallback(DASessionRef session, CFDictionaryRef match, CFArrayRef watch, DADiskDescriptionChangedCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 3u, 0, match, watch, 0);
}

void DARegisterDiskDisappearedCallback(DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 4u, 0, match, 0, 0);
}

void DARegisterDiskEjectApprovalCallback(DASessionRef session, CFDictionaryRef match, DADiskEjectApprovalCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 6u, 0, match, 0, 0);
}

void DARegisterDiskPeekCallback(DASessionRef session, CFDictionaryRef match, CFIndex order, DADiskPeekCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 9u, order, match, 0, 0);
}

void DARegisterDiskMountApprovalCallback(DASessionRef session, CFDictionaryRef match, DADiskMountApprovalCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 8u, 0, match, 0, 0);
}

void DARegisterDiskUnmountApprovalCallback(DASessionRef session, CFDictionaryRef match, DADiskUnmountApprovalCallback callback, void *context)
{
  _DARegisterCallback((uint64_t)session, (uint64_t)callback, (uint64_t)context, 0xEu, 0, match, 0, 0);
}

void DADiskUnclaim(DADiskRef disk)
{
  uint64_t Session;
  unsigned int SessionID;
  const char *ID;

  if (disk)
  {
    Session = _DADiskGetSession((uint64_t)disk);
    if (_DADiskGetSessionID((uint64_t)disk)
      || !_DASessionIsKeepAlive(Session)
      || !_DASessionRecreate(Session))
    {
      SessionID = _DADiskGetSessionID((uint64_t)disk);
      ID = (const char *)_DADiskGetID((uint64_t)disk);
      _DAServerDiskUnclaim(SessionID, ID);
    }
  }
}

uint64_t _DADiskSetAdoption(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t Session;
  mach_port_name_t SessionID;
  const char *ID;

  _DADiskGetSession(a1);
  result = _DAAuthorize();
  if (!(_DWORD)result)
  {
    Session = _DADiskGetSession(a1);
    if (!_DADiskGetSessionID(a1)
      && _DASessionIsKeepAlive(Session)
      && _DASessionRecreate(Session))
    {
      return 4175036419;
    }
    else
    {
      SessionID = _DADiskGetSessionID(a1);
      ID = (const char *)_DADiskGetID(a1);
      return _DAServerDiskSetAdoption(SessionID, ID, a2);
    }
  }
  return result;
}

uint64_t _DADiskSetEncoding(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t Session;
  mach_port_name_t SessionID;
  const char *ID;

  _DADiskGetSession(a1);
  result = _DAAuthorize();
  if (!(_DWORD)result)
  {
    Session = _DADiskGetSession(a1);
    if (!_DADiskGetSessionID(a1)
      && _DASessionIsKeepAlive(Session)
      && _DASessionRecreate(Session))
    {
      return 4175036419;
    }
    else
    {
      SessionID = _DADiskGetSessionID(a1);
      ID = (const char *)_DADiskGetID(a1);
      return _DAServerDiskSetEncoding(SessionID, ID, a2);
    }
  }
  return result;
}

void DARegisterIdleCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DARegisterCallback(a1, a2, a3, 0xFu, 0, 0, 0, 0);
}

void DARegisterDiskListCompleteCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DARegisterCallback(a1, a2, a3, 0x10u, 0, 0, 0, 0);
}

void DARegisterIdleCallbackWithBlock(uint64_t a1, void *aBlock)
{
  void *v3;

  v3 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v3, 0, 0xFu, 0, 0, 0, 1u);
}

void DARegisterDiskAppearedCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0, 0, 0, a2, 0, 1u);
}

void DARegisterDiskDescriptionChangedCallbackBlock(uint64_t a1, const __CFDictionary *a2, __CFData *a3, void *aBlock)
{
  void *v7;

  v7 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v7, 0, 3u, 0, a2, a3, 1u);
}

void DARegisterDiskDisappearedCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0, 4u, 0, a2, 0, 1u);
}

void DARegisterDiskEjectApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0, 6u, 0, a2, 0, 1u);
}

void DARegisterDiskPeekCallbackBlock(uint64_t a1, const __CFDictionary *a2, uint64_t a3, void *aBlock)
{
  void *v7;

  v7 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v7, 0, 9u, a3, a2, 0, 1u);
}

void DARegisterDiskMountApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0, 8u, 0, a2, 0, 1u);
}

void DARegisterDiskUnmountApprovalCallbackBlock(uint64_t a1, const __CFDictionary *a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  _DARegisterCallback(a1, (uint64_t)v5, 0, 0xEu, 0, a2, 0, 1u);
}

void DADiskMountWithBlock(uint64_t a1, const void *a2, int a3, void *aBlock)
{
  void *v7;

  v7 = _Block_copy(aBlock);
  DADiskMountWithArgumentsCommon(a1, a2, a3, (void (**)(_QWORD, _QWORD, _QWORD))v7, 0, 0, 1);
}

void DADiskMountWithArgumentsAndBlock(uint64_t a1, const void *a2, int a3, void *aBlock, uint64_t a5)
{
  void *v9;

  v9 = _Block_copy(aBlock);
  DADiskMountWithArgumentsCommon(a1, a2, a3, (void (**)(_QWORD, _QWORD, _QWORD))v9, 0, a5, 1);
}

void DADiskRenameWithBlock(uint64_t a1, const void *a2, int a3, void *aBlock)
{
  void *v7;

  v7 = _Block_copy(aBlock);
  DADiskRenameCommon(a1, a2, a3, (void (**)(_QWORD, _QWORD, _QWORD))v7, 0, 1);
}

void DADiskUnmountWithBlock(uint64_t a1, int a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  DADiskUnmountCommon(a1, a2, (void (**)(_QWORD, _QWORD, _QWORD))v5, 0, 1);
}

void DADiskEjectWithBlock(uint64_t a1, int a2, void *aBlock)
{
  void *v5;

  v5 = _Block_copy(aBlock);
  DADiskEjectCommon(a1, a2, (void (**)(_QWORD, _QWORD, _QWORD))v5, 0, 1);
}

void DADiskClaimWithBlock(uint64_t a1, int a2, void *aBlock, const void *a4)
{
  void *v7;
  void *v8;

  v7 = _Block_copy(aBlock);
  v8 = _Block_copy(a4);
  DADiskClaimCommon(a1, a2, (uint64_t)v7, 0, (void (**)(_QWORD, _QWORD, _QWORD))v8, 0, 1u);
}

void DADiskSetFSKitAdditions(uint64_t a1, const __CFData *a2, void *aBlock)
{
  void (**v5)(_QWORD);

  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  DADiskSetFSKitAdditionsCommon(a1, a2, v5);
}

void DADiskProbeWithBlock(uint64_t a1, void *aBlock)
{
  if (aBlock)
    aBlock = _Block_copy(aBlock);
  DADiskProbeWithBlockCommon(a1, (void (**)(_QWORD))aBlock);
}

_QWORD *_DADiskCreate(uint64_t a1, const void *a2, const char *a3)
{
  _QWORD *Instance;

  if (!a2)
    return 0;
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    CFRetain(a2);
    Instance[2] = 0;
    Instance[3] = 0;
    Instance[4] = strdup(a3);
    Instance[5] = a2;
    if (!strncmp(a3, "/dev/", 5uLL))
      Instance[3] = strdup(a3 + 5);
  }
  return Instance;
}

_QWORD *_DADiskCreateFromSerialization(int a1, CFTypeRef cf, const __CFData *a3)
{
  const __CFAllocator *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  const __CFData *Value;
  const UInt8 *BytePtr;
  const char *v10;
  CFAllocatorRef v11;
  _QWORD *v12;

  if (!a3)
    return 0;
  v5 = CFGetAllocator(cf);
  v6 = _DAUnserializeDiskDescription(v5, a3);
  if (!v6)
    return 0;
  v7 = v6;
  Value = (const __CFData *)CFDictionaryGetValue(v6, CFSTR("DADiskID"));
  if (Value && (BytePtr = CFDataGetBytePtr(Value)) != 0)
  {
    v10 = (const char *)BytePtr;
    v11 = CFGetAllocator(cf);
    v12 = _DADiskCreate((uint64_t)v11, cf, v10);
    if (v12)
    {
      CFDictionaryRemoveValue(v7, CFSTR("DADiskID"));
      v12[2] = CFRetain(v7);
    }
  }
  else
  {
    v12 = 0;
  }
  CFRelease(v7);
  return v12;
}

uint64_t _DADiskGetID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t _DADiskGetSession(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t _DADiskGetSessionID(uint64_t a1)
{
  return _DASessionGetID(*(_QWORD *)(a1 + 40));
}

uint64_t _DADiskInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kDADiskTypeID = result;
  return result;
}

void _DADiskSetDescription(uint64_t a1, CFTypeRef cf)
{
  const void *v4;

  v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 16) = 0;
  }
  if (cf)
  {
    CFRetain(cf);
    *(_QWORD *)(a1 + 16) = cf;
  }
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  const void *v2;
  __CFDictionary *v3;
  mach_port_name_t ID;
  const __CFAllocator *v5;
  unsigned int v7;
  const UInt8 *v8;

  if (!disk)
    return 0;
  v2 = (const void *)*((_QWORD *)disk + 2);
  if (v2)
  {
    CFRetain(v2);
    return (CFDictionaryRef)*((_QWORD *)disk + 2);
  }
  else
  {
    v8 = 0;
    v7 = 0;
    ID = _DASessionGetID(*((_QWORD *)disk + 5));
    v3 = 0;
    if (!_DAServerDiskCopyDescription(ID, *((const char **)disk + 4), &v8, &v7))
    {
      v5 = CFGetAllocator(disk);
      v3 = _DAUnserializeDiskDescriptionWithBytes(v5, v8, v7);
      CFDictionaryRemoveValue(v3, CFSTR("DADiskID"));
      MEMORY[0x212BF3DB8](*MEMORY[0x24BDAEC58], v8, v7);
    }
  }
  return v3;
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  const char *v1;
  mach_port_t v2;
  const __CFDictionary *v3;

  if (!disk)
    return 0;
  v1 = (const char *)*((_QWORD *)disk + 3);
  if (!v1)
    return 0;
  v2 = *MEMORY[0x24BDD8B20];
  v3 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, v1);
  return IOServiceGetMatchingService(v2, v3);
}

DADiskRef DADiskCopyWholeDisk(DADiskRef disk)
{
  DASessionRef *v1;
  io_service_t v2;
  io_registry_entry_t v3;
  CFTypeRef v4;
  const __CFAllocator *v5;
  CFTypeRef CFProperty;
  const __CFAllocator *v8;
  io_registry_entry_t parent;

  v1 = (DASessionRef *)disk;
  if (disk)
  {
    v2 = DADiskCopyIOMedia(disk);
    if (v2)
    {
      v3 = v2;
      v4 = (CFTypeRef)*MEMORY[0x24BDBD270];
      do
      {
        parent = 0;
        if (IOObjectConformsTo(v3, "IOMedia"))
        {
          v5 = CFGetAllocator(v1);
          CFProperty = IORegistryEntryCreateCFProperty(v3, CFSTR("Whole"), v5, 0);
          if (CFProperty)
          {
            if (CFProperty == v4)
            {
              v8 = CFGetAllocator(v1);
              v1 = (DASessionRef *)DADiskCreateFromIOMedia(v8, v1[5], v3);
              IOObjectRelease(v3);
              CFRelease(v4);
              return (DADiskRef)v1;
            }
            CFRelease(CFProperty);
          }
        }
        IORegistryEntryGetParentEntry(v3, "IOService", &parent);
        IOObjectRelease(v3);
        v3 = parent;
      }
      while (parent);
    }
    return 0;
  }
  return (DADiskRef)v1;
}

DADiskRef DADiskCreateFromIOMedia(CFAllocatorRef allocator, DASessionRef session, io_service_t media)
{
  const __CFString *CFProperty;
  const __CFString *v6;
  __DADisk *v7;
  char buffer[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!media)
    return 0;
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(media, CFSTR("BSD Name"), allocator, 0);
  if (!CFProperty)
    return 0;
  v6 = CFProperty;
  CFStringGetCString(CFProperty, buffer, 1024, 0x8000100u);
  v7 = DADiskCreateFromBSDName(allocator, session, buffer);
  CFRelease(v6);
  return v7;
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  char *v6;
  char __s[1024];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!name)
    return 0;
  v6 = strstr((char *)name, "://disk");
  if (!v6)
  {
    if (!strncmp(name, "/dev/", 5uLL))
    {
      __strlcpy_chk();
      return (DADiskRef)_DADiskCreate((uint64_t)allocator, session, __s);
    }
    __strlcpy_chk();
    goto LABEL_8;
  }
  if (strchr(v6 + 3, 47))
  {
    __strlcpy_chk();
    strlen(__s);
LABEL_8:
    __strlcat_chk();
  }
  return (DADiskRef)_DADiskCreate((uint64_t)allocator, session, __s);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  UInt8 *v5;
  char *v6;
  char *v7;
  char *v8;
  __DADisk *v9;
  char v11[1024];
  _OWORD v12[135];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!path)
    return 0;
  v5 = ___CFURLCopyFileSystemRepresentation(path);
  if (!v5)
    return 0;
  v6 = (char *)v5;
  memset(v12, 0, 512);
  if (___statfs((const char *)v5, v12, 2)
    && (!realpath_DARWIN_EXTSN(v6, v11) || ___statfs(v11, v12, 2))
    || (v7 = _DAVolumeCopyID((uint64_t)v12)) == 0)
  {
    v9 = 0;
  }
  else
  {
    v8 = v7;
    v9 = (__DADisk *)_DADiskCreate((uint64_t)allocator, session, v7);
    free(v8);
  }
  free(v6);
  return v9;
}

const char *__cdecl DADiskGetBSDName(const char *disk)
{
  if (disk)
    return (const char *)*((_QWORD *)disk + 3);
  return disk;
}

CFTypeID DADiskGetTypeID(void)
{
  _DAInitialize();
  return __kDADiskTypeID;
}

void __DADiskDeallocate(_QWORD *a1)
{
  const void *v2;
  void *v3;
  void *v4;
  const void *v5;

  v2 = (const void *)a1[2];
  if (v2)
    CFRelease(v2);
  v3 = (void *)a1[3];
  if (v3)
    free(v3);
  v4 = (void *)a1[4];
  if (v4)
    free(v4);
  v5 = (const void *)a1[5];
  if (v5)
    CFRelease(v5);
}

BOOL __DADiskEqual(uint64_t a1, uint64_t a2)
{
  return strcmp(*(const char **)(a1 + 32), *(const char **)(a2 + 32)) == 0;
}

uint64_t __DADiskHash(uint64_t a1)
{
  strlen(*(const char **)(a1 + 32));
  return CFHashBytes();
}

CFStringRef __DADiskCopyFormattingDescription(_QWORD *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("%s"), a1[4]);
}

CFStringRef __DADiskCopyDescription(_QWORD *a1)
{
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  v2 = CFGetAllocator(a1);
  v3 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<DADisk %p [%p]>{id = %s}"), a1, v3, a1[4]);
}

DADissenterRef DADissenterCreate(CFAllocatorRef allocator, DAReturn status, CFStringRef string)
{
  CFMutableDictionaryRef Mutable;
  pid_t v6;

  Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v6 = getpid();
    ___CFDictionarySetIntegerValue(Mutable, CFSTR("DAProcessID"), v6);
    ___CFDictionarySetIntegerValue(Mutable, CFSTR("DAStatus"), status);
    if (string)
      CFDictionarySetValue(Mutable, CFSTR("DAStatusString"), string);
  }
  return Mutable;
}

const __CFNumber *DADissenterGetProcessID(const __CFDictionary *a1)
{
  return ___CFDictionaryGetIntegerValue(a1, CFSTR("DAProcessID"));
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return ___CFDictionaryGetIntegerValue(dissenter, CFSTR("DAStatus"));
}

CFStringRef DADissenterGetStatusString(DADissenterRef dissenter)
{
  return (CFStringRef)CFDictionaryGetValue(dissenter, CFSTR("DAStatusString"));
}

uint64_t ___statfs(const char *a1, void *a2, int a3)
{
  int v6;
  int v7;
  statfs *v8;
  statfs *v9;
  int v10;
  uint64_t v11;
  const char *f_mntonname;
  uint64_t v13;
  int v14;

  v6 = getfsstat(0, 0, 2);
  if (v6 < 1)
    return 0xFFFFFFFFLL;
  v7 = 2168 * v6;
  v8 = (statfs *)malloc_type_malloc(2168 * v6, 0x100004087E0324AuLL);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = v8;
  v10 = getfsstat(v8, v7, a3);
  if (v10 < 1)
  {
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = v10;
    f_mntonname = v9->f_mntonname;
    v13 = 0xFFFFFFFFLL;
    do
    {
      if (!strcmp(f_mntonname, a1))
      {
        memcpy(a2, f_mntonname - 88, 0x878uLL);
        v14 = *((_DWORD *)f_mntonname - 8);
        v13 = 0;
        if (v14 == geteuid())
          break;
      }
      f_mntonname += 2168;
      --v11;
    }
    while (v11);
  }
  free(v9);
  return v13;
}

uint64_t ___CFArrayContainsValue(const __CFArray *a1, const void *a2)
{
  CFRange v5;

  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  return CFArrayContainsValue(a1, v5, a2);
}

BOOL ___CFArrayContainsString(const __CFArray *a1, const __CFString *a2)
{
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  BOOL v7;
  const __CFString *ValueAtIndex;
  CFTypeID v9;

  Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    return 0;
  }
  else
  {
    v5 = Count;
    v6 = 0;
    v7 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a1, v6);
      v9 = CFGetTypeID(ValueAtIndex);
      if (v9 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, a2, 1uLL) == kCFCompareEqualTo)
        break;
      v7 = v5 > ++v6;
    }
    while (v5 != v6);
  }
  return v7;
}

void ___CFArrayRemoveValue(const __CFArray *a1, const void *a2)
{
  CFIndex FirstIndexOfValue;
  CFRange v5;

  v5.length = CFArrayGetCount(a1);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(a1, v5, a2);
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex(a1, FirstIndexOfValue);
}

vm_address_t ___CFDataCopyBytes(const __CFData *a1, unsigned int *a2)
{
  unsigned int Length;
  void *v5;
  const UInt8 *BytePtr;
  vm_address_t address;

  address = 0;
  Length = CFDataGetLength(a1);
  *a2 = Length;
  vm_allocate(*MEMORY[0x24BDAEC58], &address, Length, 1);
  v5 = (void *)address;
  if (!address)
    return 0;
  BytePtr = CFDataGetBytePtr(a1);
  memmove(v5, BytePtr, *a2);
  return address;
}

const __CFNumber *___CFDictionaryGetIntegerValue(const __CFDictionary *a1, const void *a2)
{
  const __CFNumber *result;
  uint64_t valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

void ___CFDictionarySetIntegerValue(void *a1, const void *a2, uint64_t a3)
{
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFGetAllocator(a1);
  v6 = CFNumberCreate(v5, kCFNumberSInt64Type, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFDictionarySetValue((CFMutableDictionaryRef)a1, a2, v6);
    CFRelease(v7);
  }
}

CFNumberRef ___CFNumberCreateWithIntegerValue(const __CFAllocator *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  return CFNumberCreate(a1, kCFNumberSInt64Type, &valuePtr);
}

const __CFNumber *___CFNumberGetIntegerValue(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

UInt8 *___CFStringCopyCString(const __CFString *a1)
{
  CFIndex Length;
  UInt8 *v3;
  CFIndex maxBufLen;
  CFRange v6;
  CFRange v7;

  if (!a1)
    return 0;
  maxBufLen = 0;
  Length = CFStringGetLength(a1);
  v6.location = 0;
  v6.length = Length;
  if (!CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, 0, &maxBufLen))
    return 0;
  v3 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0xF4C2DB0DuLL);
  if (v3)
  {
    v7.location = 0;
    v7.length = Length;
    CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v3, maxBufLen, 0);
    v3[maxBufLen] = 0;
  }
  return v3;
}

UInt8 *___CFURLCopyFileSystemRepresentation(const __CFURL *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  UInt8 *v3;

  if (!a1)
    return 0;
  v1 = CFURLCopyFileSystemPath(a1, kCFURLPOSIXPathStyle);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = ___CFStringCopyCString(v1);
  CFRelease(v2);
  return v3;
}

const char *_DACallbackKindGetName(unsigned int a1)
{
  if (a1 > 0x11)
    return "Unknown Kind";
  else
    return __kDAKindNameList[a1];
}

CFMutableDataRef _DASerialize(const __CFAllocator *a1)
{
  CFMutableDataRef Mutable;

  Mutable = CFDataCreateMutable(a1, 0);
  if (Mutable && !__CFBinaryPlistWriteToStream())
  {
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef _DASerializeDiskDescription(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v5;
  const __CFUUID *Value;
  CFStringRef v7;
  CFStringRef v8;
  const __CFURL *v9;
  CFStringRef v10;
  CFStringRef v11;
  const __CFUUID *v12;
  CFStringRef v13;
  CFStringRef v14;
  CFMutableDataRef v15;

  if (!theDict)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, theDict);
  if (!MutableCopy)
    return 0;
  v5 = MutableCopy;
  Value = (const __CFUUID *)CFDictionaryGetValue(theDict, CFSTR("DAMediaUUID"));
  if (Value)
  {
    v7 = CFUUIDCreateString(a1, Value);
    if (v7)
    {
      v8 = v7;
      CFDictionarySetValue(v5, CFSTR("DAMediaUUID"), v7);
      CFRelease(v8);
    }
  }
  v9 = (const __CFURL *)CFDictionaryGetValue(theDict, CFSTR("DAVolumePath"));
  if (v9)
  {
    v10 = CFURLCopyFileSystemPath(v9, kCFURLPOSIXPathStyle);
    if (v10)
    {
      v11 = v10;
      CFDictionarySetValue(v5, CFSTR("DAVolumePath"), v10);
      CFRelease(v11);
    }
  }
  v12 = (const __CFUUID *)CFDictionaryGetValue(theDict, CFSTR("DAVolumeUUID"));
  if (v12)
  {
    v13 = CFUUIDCreateString(a1, v12);
    if (v13)
    {
      v14 = v13;
      CFDictionarySetValue(v5, CFSTR("DAVolumeUUID"), v13);
      CFRelease(v14);
    }
  }
  v15 = _DASerialize(a1);
  CFRelease(v5);
  return v15;
}

CFPropertyListRef _DAUnserialize(const __CFAllocator *a1, const __CFData *a2)
{
  return CFPropertyListCreateWithData(a1, a2, 0, 0, 0);
}

__CFDictionary *_DAUnserializeDiskDescription(const __CFAllocator *a1, const __CFData *a2)
{
  const __CFDictionary *v3;
  __CFDictionary *v4;
  const __CFString *Value;
  CFUUIDRef v6;
  CFUUIDRef v7;
  const __CFString *v8;
  CFURLRef v9;
  CFURLRef v10;
  const __CFString *v11;
  CFUUIDRef v12;
  CFUUIDRef v13;

  v3 = (const __CFDictionary *)CFPropertyListCreateWithData(a1, a2, 1uLL, 0, 0);
  v4 = v3;
  if (v3)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v3, CFSTR("DAMediaUUID"));
    if (Value)
    {
      v6 = CFUUIDCreateFromString(a1, Value);
      if (v6)
      {
        v7 = v6;
        CFDictionarySetValue(v4, CFSTR("DAMediaUUID"), v6);
        CFRelease(v7);
      }
    }
    v8 = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("DAVolumePath"));
    if (v8)
    {
      v9 = CFURLCreateWithFileSystemPath(a1, v8, kCFURLPOSIXPathStyle, 1u);
      if (v9)
      {
        v10 = v9;
        CFDictionarySetValue(v4, CFSTR("DAVolumePath"), v9);
        CFRelease(v10);
      }
    }
    v11 = (const __CFString *)CFDictionaryGetValue(v4, CFSTR("DAVolumeUUID"));
    if (v11)
    {
      v12 = CFUUIDCreateFromString(a1, v11);
      if (v12)
      {
        v13 = v12;
        CFDictionarySetValue(v4, CFSTR("DAVolumeUUID"), v12);
        CFRelease(v13);
      }
    }
  }
  return v4;
}

__CFDictionary *_DAUnserializeDiskDescriptionWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  const __CFData *v4;
  const __CFData *v5;
  __CFDictionary *v6;

  if (!a2)
    return 0;
  v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = _DAUnserializeDiskDescription(a1, v4);
  CFRelease(v5);
  return v6;
}

CFPropertyListRef _DAUnserializeWithBytes(const __CFAllocator *a1, const UInt8 *a2, CFIndex a3)
{
  const __CFData *v4;
  const __CFData *v5;
  CFPropertyListRef v6;

  if (!a2)
    return 0;
  v4 = CFDataCreateWithBytesNoCopy(a1, a2, a3, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFPropertyListCreateWithData(a1, v4, 0, 0, 0);
  CFRelease(v5);
  return v6;
}

char *_DAVolumeCopyID(uint64_t a1)
{
  char *v3;
  char v4[1024];
  char v5[1024];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(), !__DAVolumeGetDeviceIDForLifsMount(v5, v4, 1024)))
  {
    asprintf(&v3, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    asprintf(&v3, "%s");
  }
  else
  {
    asprintf(&v3, "%s?owner=%u");
  }
  return v3;
}

uint64_t __DAVolumeGetDeviceIDForLifsMount(char *a1, char *a2, int a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;

  v6 = strstr(a1, "://");
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if (!strncmp(a1, "apfs", 4uLL))
    return 0xFFFFFFFFLL;
  v8 = v7 + 3;
  v9 = strrchr(v8, 47);
  if (!v9)
    return 0xFFFFFFFFLL;
  *v9 = 0;
  strlcpy(a2, v8, a3);
  return 0;
}

char *_DAVolumeGetID(uint64_t a1)
{
  char v3[1024];
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  if (!strcmp((const char *)(a1 + 72), "lifs")
    && (__strlcpy_chk(), !__DAVolumeGetDeviceIDForLifsMount(v4, v3, 1024)))
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "/dev/%s");
  }
  else if (!strncmp((const char *)(a1 + 1112), "/dev/", 5uLL))
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "%s");
  }
  else
  {
    snprintf(_DAVolumeGetID_id, 0x411uLL, "%s?owner=%u");
  }
  return _DAVolumeGetID_id;
}

uint64_t _DAVolumeGetDevicePathForLifsMount(uint64_t a1, char *a2, int a3)
{
  char *v5;
  const char *v6;
  char *v7;
  char __s1[1024];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  __strlcpy_chk();
  v5 = strstr(__s1, "://");
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5 + 3;
  v7 = strrchr(v5 + 3, 47);
  if (!v7)
    return 0xFFFFFFFFLL;
  *v7 = 0;
  strlcpy(a2, "/dev/", a3);
  strlcat(a2, v6, a3);
  return 0;
}

uint64_t _DASessionCallback(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t result;
  const __CFAllocator *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v13;
  int IntegerValue;
  const __CFNumber *v15;
  const __CFData *Value;
  const __CFNumber *v17;
  unsigned int v18;
  unsigned int v19;
  const UInt8 *v20;

  v20 = 0;
  v19 = 0;
  result = _DAServerSessionCopyCallbackQueue(a4[9], &v20, &v19);
  if (!(_DWORD)result)
  {
    v6 = CFGetAllocator(a4);
    v7 = (const __CFArray *)_DAUnserializeWithBytes(v6, v20, v19);
    if (v7)
    {
      v8 = v7;
      Count = CFArrayGetCount(v7);
      if (Count >= 1)
      {
        v10 = Count;
        for (i = 0; i != v10; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
          if (ValueAtIndex)
          {
            v13 = ValueAtIndex;
            IntegerValue = ___CFDictionaryGetIntegerValue(ValueAtIndex, CFSTR("DACallbackAddress"));
            v15 = ___CFDictionaryGetIntegerValue(v13, CFSTR("DACallbackContext"));
            Value = (const __CFData *)CFDictionaryGetValue(v13, CFSTR("DACallbackArgument0"));
            v17 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("DACallbackArgument1"));
            v18 = ___CFDictionaryGetIntegerValue(v13, CFSTR("DACallbackKind"));
            _DADispatchCallback(a4, IntegerValue, (uint64_t)v15, v18, Value, v17);
          }
        }
      }
      CFRelease(v8);
    }
    return MEMORY[0x212BF3DB8](*MEMORY[0x24BDAEC58], v20, v19);
  }
  return result;
}

uint64_t _DASessionGetID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t _DASessionIsKeepAlive(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 144);
}

uint64_t _DASessionInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kDASessionTypeID = result;
  return result;
}

uint64_t _DASessionScheduleWithRunLoop(uint64_t result)
{
  int v1;
  uint64_t v2;
  ipc_space_t *v3;
  const __CFAllocator *v4;
  CFMachPortRef v5;
  __CFMachPort *v6;
  const __CFAllocator *v7;
  CFRunLoopSourceRef RunLoopSource;
  int v9;
  mach_port_t Port;
  CFMachPortContext v11;
  int v12;
  mach_port_name_t name;

  v1 = *(_DWORD *)(result + 56);
  *(_DWORD *)(result + 56) = v1 + 1;
  if (!v1)
  {
    v2 = result;
    name = 0;
    v3 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    result = mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name);
    if (!(_DWORD)result)
    {
      v12 = 1;
      if (!MEMORY[0x212BF3C5C](*v3, name, 1, &v12, 1))
      {
        v11.version = 0;
        v11.info = (void *)v2;
        v11.retain = (const void *(__cdecl *)(const void *))MEMORY[0x24BDBC2A8];
        v11.release = (void (__cdecl *)(const void *))MEMORY[0x24BDBC298];
        v11.copyDescription = 0;
        v4 = CFGetAllocator((CFTypeRef)v2);
        v5 = CFMachPortCreateWithPort(v4, name, (CFMachPortCallBack)_DASessionCallback, &v11, 0);
        if (v5)
        {
          v6 = v5;
          v7 = CFGetAllocator((CFTypeRef)v2);
          RunLoopSource = CFMachPortCreateRunLoopSource(v7, v6, 0);
          if (RunLoopSource)
          {
            *(_QWORD *)(v2 + 16) = v6;
            *(_QWORD *)(v2 + 40) = RunLoopSource;
            v9 = *(_DWORD *)(v2 + 36);
            Port = CFMachPortGetPort(v6);
            return _DAServerSessionSetClientPort(v9, Port);
          }
          CFMachPortInvalidate(v6);
          CFRelease(v6);
        }
      }
      return mach_port_mod_refs(*v3, name, 1u, -1);
    }
  }
  return result;
}

uint64_t _DASessionUnscheduleFromRunLoop(uint64_t result)
{
  uint64_t v1;
  int v2;
  __CFRunLoopSource *v3;
  mach_port_name_t Port;

  v1 = result;
  v2 = *(_DWORD *)(result + 56);
  if (v2 == 1)
  {
    v3 = *(__CFRunLoopSource **)(result + 40);
    if (v3)
    {
      CFRunLoopSourceInvalidate(v3);
      CFRelease(*(CFTypeRef *)(v1 + 40));
      *(_QWORD *)(v1 + 40) = 0;
    }
    result = *(_QWORD *)(v1 + 16);
    if (result)
    {
      Port = CFMachPortGetPort((CFMachPortRef)result);
      CFMachPortInvalidate(*(CFMachPortRef *)(v1 + 16));
      CFRelease(*(CFTypeRef *)(v1 + 16));
      result = mach_port_mod_refs(*MEMORY[0x24BDAEC58], Port, 1u, -1);
      *(_QWORD *)(v1 + 16) = 0;
    }
    v2 = *(_DWORD *)(v1 + 56);
  }
  if (v2)
    *(_DWORD *)(v1 + 56) = v2 - 1;
  return result;
}

CFTypeID DAApprovalSessionGetTypeID(void)
{
  _DAInitialize();
  return __kDASessionTypeID;
}

CFTypeID DASessionGetTypeID(void)
{
  _DAInitialize();
  return __kDASessionTypeID;
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  uint64_t Instance;
  uint64_t v2;
  unsigned int v3;
  int v4;
  unint64_t v5;
  ipc_space_t *v6;
  int v7;
  char *v8;
  char *v9;
  int v10;
  char *image_name;
  char *v13;
  pid_t v14;
  int v15;
  int v16;
  mach_port_name_t name;
  mach_port_t special_port;

  _DAInitialize();
  Instance = _CFRuntimeCreateInstance();
  v2 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 44) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_QWORD *)(Instance + 64) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *(_DWORD *)(v2 + 72) = 0;
    *(_BYTE *)(v2 + 144) = 0;
    *(_DWORD *)(v2 + 148) = -1;
    pthread_mutex_init((pthread_mutex_t *)(v2 + 80), 0);
    if (!*(_QWORD *)(v2 + 64))
      DASessionCreate_cold_1();
    do
    {
      v3 = __ldxr(&sessionCount);
      v4 = v3 + 1;
    }
    while (__stxr(v3 + 1, &sessionCount));
    HIDWORD(v5) = 652835029 * v4;
    LODWORD(v5) = 652835029 * v4;
    if ((v5 >> 3) <= 0x418937 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
      DASessionCreate_cold_2(v4);
    special_port = 0;
    v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    if (task_get_special_port(*MEMORY[0x24BDAEC58], 4, &special_port))
      goto LABEL_10;
    name = 0;
    v7 = bootstrap_look_up2();
    mach_port_deallocate(*v6, special_port);
    if (v7
      || (v16 = 0,
          v8 = (char *)_dyld_get_image_name(0),
          v9 = basename(v8),
          v10 = _DAServerSessionCreate(name, v9, &v16),
          mach_port_deallocate(*v6, name),
          v10))
    {
LABEL_10:
      CFRelease((CFTypeRef)v2);
      return 0;
    }
    else
    {
      image_name = (char *)_dyld_get_image_name(0);
      v13 = basename(image_name);
      *(_QWORD *)(v2 + 24) = strdup(v13);
      v14 = getpid();
      v15 = v16;
      *(_DWORD *)(v2 + 32) = v14;
      *(_DWORD *)(v2 + 36) = v15;
    }
  }
  return (DASessionRef)v2;
}

void DASessionScheduleWithRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  __CFRunLoopSource *v6;

  if (session)
  {
    _DASessionScheduleWithRunLoop((uint64_t)session);
    v6 = (__CFRunLoopSource *)*((_QWORD *)session + 5);
    if (v6)
      CFRunLoopAddSource(runLoop, v6, runLoopMode);
  }
}

void DASessionSetDispatchQueue(DASessionRef session, dispatch_queue_t queue)
{
  NSObject *v4;
  ipc_space_t *v5;
  dispatch_source_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[5];
  mach_port_name_t v11;
  _QWORD handler[5];
  mach_port_name_t v13;
  mach_port_t previous;
  int v15;
  mach_port_name_t name;

  if (session)
  {
    v4 = *((_QWORD *)session + 6);
    if (v4)
    {
      dispatch_source_cancel(v4);
      dispatch_release(*((dispatch_object_t *)session + 6));
      *((_QWORD *)session + 6) = 0;
    }
    if (queue)
    {
      name = 0;
      v5 = (ipc_space_t *)MEMORY[0x24BDAEC58];
      if (!mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, &name))
      {
        v15 = 1;
        if (MEMORY[0x212BF3C5C](*v5, name, 1, &v15, 1)
          || (v6 = dispatch_source_create(MEMORY[0x24BDAC9E0], name, 0, queue)) == 0
          || (*((_QWORD *)session + 6) = v6,
              CFRetain(session),
              previous = 0,
              mach_port_request_notification(*v5, name, 70, 1u, name, 0x15u, &previous)))
        {
          mach_port_mod_refs(*v5, name, 1u, -1);
        }
        else
        {
          v7 = *((_QWORD *)session + 6);
          v8 = MEMORY[0x24BDAC760];
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 0x40000000;
          handler[2] = __DASessionSetDispatchQueue_block_invoke;
          handler[3] = &__block_descriptor_tmp;
          v13 = name;
          handler[4] = session;
          dispatch_source_set_cancel_handler(v7, handler);
          v9 = *((_QWORD *)session + 6);
          v10[0] = v8;
          v10[1] = 0x40000000;
          v10[2] = __DASessionSetDispatchQueue_block_invoke_2;
          v10[3] = &__block_descriptor_tmp_2;
          v11 = name;
          v10[4] = session;
          dispatch_source_set_event_handler(v9, v10);
          dispatch_resume(*((dispatch_object_t *)session + 6));
          _DAServerSessionSetClientPort(*((_DWORD *)session + 9), name);
        }
      }
    }
  }
}

void DASessionUnscheduleFromRunLoop(DASessionRef session, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  __CFRunLoopSource *v4;

  if (session)
  {
    v4 = (__CFRunLoopSource *)*((_QWORD *)session + 5);
    if (v4)
      CFRunLoopRemoveSource(runLoop, v4, runLoopMode);
    _DASessionUnscheduleFromRunLoop((uint64_t)session);
  }
}

CFMutableDictionaryRef DACallbackCreate(const __CFAllocator *a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, const void *a6, const void *a7, unsigned int a8)
{
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v16;

  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = Mutable;
  if (Mutable)
  {
    ___CFDictionarySetIntegerValue(Mutable, CFSTR("DACallbackAddress"), a2);
    ___CFDictionarySetIntegerValue(v16, CFSTR("DACallbackContext"), a3);
    ___CFDictionarySetIntegerValue(v16, CFSTR("DACallbackKind"), a4);
    ___CFDictionarySetIntegerValue(v16, CFSTR("DACallbackOrder"), a5);
    ___CFDictionarySetIntegerValue(v16, CFSTR("DACallbackBlock"), a8);
    if (a6)
      CFDictionarySetValue(v16, CFSTR("DACallbackMatch"), a6);
    if (a7)
      CFDictionarySetValue(v16, CFSTR("DACallbackWatch"), a7);
  }
  return v16;
}

uint64_t DAAddCallbackToSession(uint64_t result, const void *a2)
{
  uint64_t v3;
  pthread_mutex_t *v4;
  int v5;
  CFNumberRef v6;
  int v7;
  unsigned int valuePtr;

  if (result)
  {
    v3 = result;
    v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    v5 = *(_DWORD *)(v3 + 72) + 1;
    *(_DWORD *)(v3 + 72) = v5;
    valuePtr = v5;
    while (1)
    {
      v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(v3 + 64), v6))
        break;
      v7 = *(_DWORD *)(v3 + 72);
      *(_DWORD *)(v3 + 72) = v7 + 1;
      valuePtr = v7 + 1;
      if (v7 == -1)
      {
        *(_DWORD *)(v3 + 72) = 1;
        valuePtr = 1;
      }
      CFRelease(v6);
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 64), v6, a2);
    CFRelease(v6);
    pthread_mutex_unlock(v4);
    return valuePtr;
  }
  return result;
}

void DARemoveCallbackFromSessionWithKey(uint64_t a1, int a2)
{
  CFNumberRef v3;
  const __CFDictionary *Value;
  unsigned int IntegerValue;
  const __CFNumber *v6;
  int v7;
  int valuePtr;

  v7 = 0;
  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), v3);
    IntegerValue = ___CFDictionaryGetIntegerValue(Value, CFSTR("DACallbackBlock"));
    v6 = ___CFDictionaryGetIntegerValue(Value, CFSTR("DACallbackAddress"));
    if (IntegerValue)
      _Block_release(v6);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), v3);
    CFNumberGetValue(v3, kCFNumberSInt32Type, &v7);
    *(_DWORD *)(a1 + 72) = v7 - 1;
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
    CFRelease(v3);
  }
}

uint64_t DARemoveCallbackFromSession(uint64_t a1, const __CFNumber *a2, const __CFNumber *a3)
{
  uint64_t v3;
  CFIndex Count;
  const void **v7;
  const void **v8;
  const __CFDictionary **v9;
  CFNumberRef *v10;
  const __CFDictionary *v11;
  const __CFNumber *IntegerValue;
  const __CFNumber *v13;
  unsigned int v14;
  unsigned int v16;
  CFNumberRef v17;
  pthread_mutex_t *v19;
  uint64_t v20;
  const void **v21;
  unsigned int valuePtr;

  v3 = a1;
  valuePtr = 0;
  if (a1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    Count = CFDictionaryGetCount(*(CFDictionaryRef *)(v3 + 64));
    v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(v3 + 64), v7, v8);
    pthread_mutex_unlock((pthread_mutex_t *)(v3 + 80));
    if (Count < 1)
    {
      v3 = 0;
    }
    else
    {
      v19 = (pthread_mutex_t *)(v3 + 80);
      v20 = v3;
      v21 = v8;
      v9 = (const __CFDictionary **)v8;
      v10 = (CFNumberRef *)v7;
      while (1)
      {
        v11 = *v9;
        IntegerValue = ___CFDictionaryGetIntegerValue(*v9, CFSTR("DACallbackAddress"));
        v13 = ___CFDictionaryGetIntegerValue(v11, CFSTR("DACallbackContext"));
        v14 = ___CFDictionaryGetIntegerValue(v11, CFSTR("DACallbackBlock"));
        if (IntegerValue == a2 && v13 == a3)
          break;
        ++v10;
        ++v9;
        if (!--Count)
        {
          v3 = 0;
          goto LABEL_14;
        }
      }
      v16 = v14;
      v17 = *v10;
      CFNumberGetValue(*v10, kCFNumberSInt32Type, &valuePtr);
      if (v16)
        _Block_release(a2);
      pthread_mutex_lock(v19);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v20 + 64), v17);
      *(_DWORD *)(v20 + 72) = valuePtr - 1;
      pthread_mutex_unlock(v19);
      v3 = valuePtr;
LABEL_14:
      v8 = v21;
    }
    free(v7);
    free(v8);
  }
  return v3;
}

char *DAGetCallbackFromSession(char *a1, int a2)
{
  char *Value;
  CFNumberRef v3;
  pthread_mutex_t *v4;
  int valuePtr;

  Value = a1;
  valuePtr = a2;
  if (a1)
  {
    v3 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
    v4 = (pthread_mutex_t *)(Value + 80);
    pthread_mutex_lock((pthread_mutex_t *)(Value + 80));
    Value = (char *)CFDictionaryGetValue(*((CFDictionaryRef *)Value + 8), v3);
    pthread_mutex_unlock(v4);
    CFRelease(v3);
  }
  return Value;
}

uint64_t _DASessionRecreate(uint64_t a1)
{
  ipc_space_t *v2;
  int v3;
  char *image_name;
  char *v5;
  int v6;
  uint64_t v7;
  char *v9;
  char *v10;
  pid_t v11;
  int v12;
  CFIndex Count;
  int v14;
  CFNumberRef v15;
  CFNumberRef v16;
  const __CFDictionary *Value;
  int v18;
  const __CFData *v19;
  const __CFData *v20;
  const __CFData *v21;
  mach_port_t v22;
  uint64_t v23;
  const UInt8 *BytePtr;
  const UInt8 *v25;
  int Length;
  CFIndex v27;
  pthread_mutex_t *v28;
  int IntegerValue;
  int valuePtr;
  int v31;
  mach_port_name_t name;
  mach_port_t special_port[4];

  valuePtr = 1;
  if (a1)
  {
    special_port[0] = 0;
    v2 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    if (!task_get_special_port(*MEMORY[0x24BDAEC58], 4, special_port))
    {
      name = 0;
      v3 = bootstrap_look_up2();
      mach_port_deallocate(*v2, special_port[0]);
      if (!v3)
      {
        v31 = 0;
        image_name = (char *)_dyld_get_image_name(0);
        v5 = basename(image_name);
        v6 = _DAServerSessionCreate(name, v5, &v31);
        mach_port_deallocate(*v2, name);
        if (!v6)
        {
          v9 = (char *)_dyld_get_image_name(0);
          v10 = basename(v9);
          *(_QWORD *)(a1 + 24) = strdup(v10);
          v11 = getpid();
          v12 = v31;
          *(_DWORD *)(a1 + 32) = v11;
          *(_DWORD *)(a1 + 36) = v12;
          DASessionSetDispatchQueue((DASessionRef)a1, *(dispatch_queue_t *)(a1 + 152));
          pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
          Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 64));
          v28 = (pthread_mutex_t *)(a1 + 80);
          pthread_mutex_unlock((pthread_mutex_t *)(a1 + 80));
          if (Count < 1)
            return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
          v14 = 0;
          v27 = Count;
          while (1)
          {
            v15 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
            if (v15)
              break;
LABEL_19:
            ++valuePtr;
            if (Count <= v14)
              return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
          }
          v16 = v15;
          pthread_mutex_lock(v28);
          Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), v16);
          pthread_mutex_unlock(v28);
          if (!Value)
          {
LABEL_18:
            CFRelease(v16);
            goto LABEL_19;
          }
          IntegerValue = ___CFDictionaryGetIntegerValue(Value, CFSTR("DACallbackKind"));
          v18 = ___CFDictionaryGetIntegerValue(Value, CFSTR("DACallbackOrder"));
          v19 = (const __CFData *)CFDictionaryGetValue(Value, CFSTR("DACallbackMatch"));
          v20 = (const __CFData *)CFDictionaryGetValue(Value, CFSTR("DACallbackWatch"));
          v21 = v20;
          v22 = *(_DWORD *)(a1 + 36);
          v23 = valuePtr;
          if (v19)
          {
            BytePtr = CFDataGetBytePtr(v19);
            LODWORD(v19) = CFDataGetLength(v19);
            if (v21)
            {
LABEL_14:
              v25 = CFDataGetBytePtr(v21);
              Length = CFDataGetLength(v21);
LABEL_17:
              _DAServerSessionRegisterCallback(v22, v23, v23, IntegerValue, v18, (uint64_t)BytePtr, (int)v19, (uint64_t)v25, Length);
              ++v14;
              Count = v27;
              goto LABEL_18;
            }
          }
          else
          {
            BytePtr = 0;
            if (v20)
              goto LABEL_14;
          }
          v25 = 0;
          Length = 0;
          goto LABEL_17;
        }
      }
    }
  }
  v7 = 4175036419;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(special_port[0]) = 0;
    _os_log_impl(&dword_2127E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "failed to establish session with diskarbitrationd", (uint8_t *)special_port, 2u);
  }
  return v7;
}

uint64_t DASessionKeepAlive(uint64_t a1, dispatch_queue_t queue)
{
  _QWORD handler[5];

  if (!a1)
    return 4175036419;
  *(_BYTE *)(a1 + 144) = 1;
  *(_QWORD *)(a1 + 152) = queue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 0x40000000;
  handler[2] = __DASessionKeepAlive_block_invoke;
  handler[3] = &__block_descriptor_tmp_5;
  handler[4] = a1;
  *(_DWORD *)(a1 + 148) = notify_register_dispatch("com.apple.diskarbitrationd.launched", (int *)(a1 + 148), queue, handler);
  return _DAServerSessionSetKeepAlive(*(_DWORD *)(a1 + 36));
}

uint64_t __DASessionDeallocate(uint64_t a1)
{
  void *v2;
  int v3;
  mach_port_name_t v4;
  const __CFDictionary *v5;
  CFIndex Count;
  const void **v7;
  const void **v8;
  const __CFDictionary **v9;
  const __CFDictionary *v10;
  const __CFNumber *IntegerValue;
  unsigned int v12;

  if (*(_QWORD *)(a1 + 16))
    __DASessionDeallocate_cold_3();
  if (*(_QWORD *)(a1 + 40))
    __DASessionDeallocate_cold_2();
  if (*(_QWORD *)(a1 + 48))
    __DASessionDeallocate_cold_1();
  v2 = *(void **)(a1 + 24);
  if (v2)
    free(v2);
  v3 = *(_DWORD *)(a1 + 148);
  if (v3 != -1)
    notify_cancel(v3);
  v4 = *(_DWORD *)(a1 + 36);
  if (v4)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], v4);
  v5 = *(const __CFDictionary **)(a1 + 64);
  if (v5)
  {
    Count = CFDictionaryGetCount(v5);
    v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), v7, v8);
    if (Count >= 1)
    {
      v9 = (const __CFDictionary **)v8;
      do
      {
        v10 = *v9;
        IntegerValue = ___CFDictionaryGetIntegerValue(*v9, CFSTR("DACallbackAddress"));
        if (___CFDictionaryGetIntegerValue(v10, CFSTR("DACallbackBlock")))
          _Block_release(IntegerValue);
        ++v9;
        --Count;
      }
      while (Count);
    }
    free(v7);
    free(v8);
    CFRelease(*(CFTypeRef *)(a1 + 64));
  }
  do
    v12 = __ldxr(&sessionCount);
  while (__stxr(v12 - 1, &sessionCount));
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
}

BOOL __DASessionEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
}

uint64_t __DASessionHash(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

CFStringRef __DASessionCopyFormattingDescription(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("%s [%d]:%d"), *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 36));
}

CFStringRef __DASessionCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;
  CFAllocatorRef v3;

  v2 = CFGetAllocator((CFTypeRef)a1);
  v3 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<DASession %p [%p]>{id = %s [%d]:%d}"), a1, v3, *(_QWORD *)(a1 + 24), *(unsigned int *)(a1 + 32), *(unsigned int *)(a1 + 36));
}

uint64_t _DAServerDiskCopyDescription(mach_port_name_t a1, const char *a2, _QWORD *a3, _DWORD *a4)
{
  int v7;
  mach_msg_size_t v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_port_name_t rcv_name[4];
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
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
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
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
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  *(_OWORD *)rcv_name = 0u;
  memset(v15, 0, sizeof(v15));
  *((_QWORD *)&v15[0] + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v7 = mig_strncpy_zerofill((char *)&v15[1] + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)&v15[1] + 8, a2, 1024);
  LODWORD(v15[1]) = 0;
  DWORD1(v15[1]) = v7;
  v8 = ((v7 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[0] = 5395;
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  *(_QWORD *)&v15[0] = 0;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v10 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v8, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (DWORD1(v15[0]) == 71)
      {
        v11 = 4294966988;
      }
      else if (DWORD1(v15[0]) == 100)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v11 = 4294966996;
            if (LODWORD(v15[1]))
            {
              if (rcv_name[2])
                v11 = 4294966996;
              else
                v11 = LODWORD(v15[1]);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_27;
        }
        v11 = 4294966996;
        if (DWORD2(v15[0]) == 1 && rcv_name[1] == 56 && !rcv_name[2] && BYTE7(v15[1]) == 1)
        {
          v12 = DWORD2(v15[1]);
          if (DWORD2(v15[1]) == DWORD1(v16))
          {
            v11 = 0;
            *a3 = *(_QWORD *)((char *)v15 + 12);
            *a4 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t _DAServerDiskGetOptions(mach_port_name_t a1, const char *a2, _DWORD *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x100000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 101)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = DWORD1(v14[0]);
                return v9;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_25;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t _DAServerDiskGetUserUID(mach_port_name_t a1, const char *a2, _DWORD *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x200000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 102)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = DWORD1(v14[0]);
                return v9;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_25;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t _DAServerDiskIsClaimed(mach_port_name_t a1, const char *a2, _DWORD *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[64];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x300000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v13) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v13) == 103)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v9 = LODWORD(v14[0]);
              if (!LODWORD(v14[0]))
              {
                *a3 = DWORD1(v14[0]);
                return v9;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v10 = 1;
            else
              v10 = LODWORD(v14[0]) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = LODWORD(v14[0]);
            goto LABEL_25;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t _DAServerDiskSetAdoption(mach_port_name_t a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  mach_msg_size_t v7;
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[65];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = v6 + 44;
  *(_DWORD *)((char *)v14 + v6 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x400000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v9 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v7, 0x2Cu, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_special_reply_port();
      return v10;
    }
    if (DWORD1(v13) == 71)
    {
      v10 = 4294966988;
    }
    else if (DWORD1(v13) == 104)
    {
      v10 = 4294966996;
      if ((rcv_name[0] & 0x80000000) == 0 && rcv_name[1] == 36 && !rcv_name[2])
      {
        v10 = LODWORD(v14[0]);
        if (!LODWORD(v14[0]))
          return v10;
      }
    }
    else
    {
      v10 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
  }
  return v10;
}

uint64_t _DAServerDiskSetEncoding(mach_port_name_t a1, const char *a2, int a3)
{
  int v5;
  uint64_t v6;
  mach_msg_size_t v7;
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  mach_port_name_t rcv_name[4];
  __int128 v13;
  _OWORD v14[65];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(v14, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v13 = 0u;
  *((_QWORD *)&v13 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v14 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v14 + 8, a2, 1024);
  LODWORD(v14[0]) = 0;
  DWORD1(v14[0]) = v5;
  v6 = (v5 + 3) & 0xFFFFFFFC;
  v7 = v6 + 44;
  *(_DWORD *)((char *)v14 + v6 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v13 = 0x500000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v9 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v7, 0x2Cu, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v9)
    {
      mig_dealloc_special_reply_port();
      return v10;
    }
    if (DWORD1(v13) == 71)
    {
      v10 = 4294966988;
    }
    else if (DWORD1(v13) == 105)
    {
      v10 = 4294966996;
      if ((rcv_name[0] & 0x80000000) == 0 && rcv_name[1] == 36 && !rcv_name[2])
      {
        v10 = LODWORD(v14[0]);
        if (!LODWORD(v14[0]))
          return v10;
      }
    }
    else
    {
      v10 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
  }
  return v10;
}

uint64_t _DAServerDiskSetOptions(mach_port_name_t a1, const char *a2, int a3, int a4)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  char *v10;
  mach_port_name_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  mach_port_name_t rcv_name[4];
  __int128 v16;
  _OWORD v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  memset(v17, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v16 = 0u;
  *((_QWORD *)&v16 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 48;
  v10 = (char *)rcv_name + v8;
  *((_DWORD *)v10 + 10) = a3;
  *((_DWORD *)v10 + 11) = a4;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v16 = 0x600000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v12 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x2Cu, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v12)
    {
      mig_dealloc_special_reply_port();
      return v13;
    }
    if (DWORD1(v16) == 71)
    {
      v13 = 4294966988;
    }
    else if (DWORD1(v16) == 106)
    {
      v13 = 4294966996;
      if ((rcv_name[0] & 0x80000000) == 0 && rcv_name[1] == 36 && !rcv_name[2])
      {
        v13 = LODWORD(v17[0]);
        if (!LODWORD(v17[0]))
          return v13;
      }
    }
    else
    {
      v13 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)rcv_name);
  }
  return v13;
}

uint64_t _DAServerDiskUnclaim(unsigned int a1, const char *a2)
{
  int v3;
  int v4;
  __int128 v6;
  __int128 v7;
  _OWORD v8[64];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(v8, 0, 480);
  v6 = 0u;
  v7 = 0u;
  *((_QWORD *)&v7 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v3 = mig_strncpy_zerofill((char *)v8 + 8, a2, 1024);
  else
    v3 = mig_strncpy((char *)v8 + 8, a2, 1024);
  v4 = v3;
  LODWORD(v8[0]) = 0;
  DWORD1(v8[0]) = v3;
  LODWORD(v6) = 19;
  *((_QWORD *)&v6 + 1) = a1;
  *(_QWORD *)&v7 = 0x700000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, ((v4 + 3) & 0xFFFFFFFC) + 40, 0, 0, 0, 0);
}

uint64_t _DAServerSessionCopyCallbackQueue(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x800000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 108)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_24;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t _DAServerSessionCreate(mach_port_name_t a1, const char *a2, _DWORD *a3)
{
  int v5;
  mach_msg_size_t v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  mach_port_name_t rcv_name[4];
  __int128 v12;
  _OWORD v13[64];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  memset(v13, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v12 = 0u;
  *((_QWORD *)&v12 + 1) = *MEMORY[0x24BDAC470];
  if (MEMORY[0x24BDAEF18])
    v5 = mig_strncpy_zerofill((char *)v13 + 8, a2, 1024);
  else
    v5 = mig_strncpy((char *)v13 + 8, a2, 1024);
  LODWORD(v13[0]) = 0;
  DWORD1(v13[0]) = v5;
  v6 = ((v5 + 3) & 0xFFFFFFFC) + 40;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v12 = 0x900000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v8 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v6, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (DWORD1(v12) == 71)
      {
        v9 = 4294966988;
      }
      else if (DWORD1(v12) == 109)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 36)
          {
            v9 = 4294966996;
            if (LODWORD(v13[0]))
            {
              if (rcv_name[2])
                v9 = 4294966996;
              else
                v9 = LODWORD(v13[0]);
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_26;
        }
        v9 = 4294966996;
        if (DWORD2(v12) == 1 && rcv_name[1] == 40 && !rcv_name[2] && WORD3(v13[0]) << 16 == 1114112)
        {
          v9 = 0;
          *a3 = HIDWORD(v12);
          return v9;
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t _DAServerSessionQueueRequest(mach_port_t a1, int a2, char *src, int a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  int v14;
  uint64_t v15;
  mach_msg_size_t v16;
  char *v17;
  mach_port_t special_reply_port;
  uint64_t v19;
  uint64_t v20;
  mach_msg_header_t rcv_name;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  _BYTE v29[24];
  _OWORD v30[66];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v29[8] = 0u;
  memset(v30, 0, 432);
  memset(&rcv_name, 0, sizeof(rcv_name));
  v23 = 2;
  v24 = a5;
  v25 = 16777472;
  v26 = a6;
  v27 = a7;
  v28 = 16777472;
  *(_QWORD *)v29 = a8;
  *(_QWORD *)&v29[4] = *MEMORY[0x24BDAC470];
  *(_DWORD *)&v29[12] = a2;
  if (MEMORY[0x24BDAEF18])
    v14 = mig_strncpy_zerofill((char *)v30, src, 1024);
  else
    v14 = mig_strncpy((char *)v30, src, 1024);
  *(_DWORD *)&v29[16] = 0;
  *(_DWORD *)&v29[20] = v14;
  v15 = (v14 + 3) & 0xFFFFFFFC;
  v16 = v15 + 108;
  v17 = (char *)&rcv_name + v15;
  *((_DWORD *)v17 + 20) = a4;
  *((_DWORD *)v17 + 21) = a6;
  *((_DWORD *)v17 + 22) = a8;
  *(_QWORD *)(v17 + 92) = a9;
  *(_QWORD *)(v17 + 100) = a10;
  special_reply_port = mig_get_special_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = special_reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0xA00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&rcv_name);
    special_reply_port = rcv_name.msgh_local_port;
  }
  v19 = mach_msg(&rcv_name, 3162115, v16, 0x2Cu, special_reply_port, 0, 0);
  v20 = v19;
  if ((v19 - 268435458) > 0xE || ((1 << (v19 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v19)
    {
      mig_dealloc_special_reply_port();
      return v20;
    }
    if (rcv_name.msgh_id == 71)
    {
      v20 = 4294966988;
    }
    else if (rcv_name.msgh_id == 110)
    {
      v20 = 4294966996;
      if ((rcv_name.msgh_bits & 0x80000000) == 0 && rcv_name.msgh_size == 36 && !rcv_name.msgh_remote_port)
      {
        v20 = HIDWORD(v24);
        if (!HIDWORD(v24))
          return v20;
      }
    }
    else
    {
      v20 = 4294966995;
    }
    mach_msg_destroy(&rcv_name);
  }
  return v20;
}

uint64_t _DAServerSessionQueueResponse(unsigned int a1, uint64_t a2, uint64_t a3, int a4, char *src, uint64_t a6, unsigned int a7, int a8)
{
  int v11;
  uint64_t v12;
  char *v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  _BYTE v19[40];
  _OWORD v20[64];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v19[24] = 0u;
  memset(v20, 0, 432);
  *(_OWORD *)&v19[8] = 0u;
  memset(&v15, 0, sizeof(v15));
  v16 = 1;
  v17 = a6;
  v18 = 16777472;
  *(_QWORD *)v19 = a7;
  *(_QWORD *)&v19[4] = *MEMORY[0x24BDAC470];
  *(_QWORD *)&v19[12] = a2;
  *(_QWORD *)&v19[20] = a3;
  *(_DWORD *)&v19[28] = a4;
  if (MEMORY[0x24BDAEF18])
    v11 = mig_strncpy_zerofill((char *)v20, src, 1024);
  else
    v11 = mig_strncpy((char *)v20, src, 1024);
  *(_DWORD *)&v19[32] = 0;
  *(_DWORD *)&v19[36] = v11;
  v12 = (v11 + 3) & 0xFFFFFFFC;
  v13 = (char *)&v15 + v12;
  *((_DWORD *)v13 + 20) = a7;
  *((_DWORD *)v13 + 21) = a8;
  v15.msgh_bits = -2147483629;
  *(_QWORD *)&v15.msgh_remote_port = a1;
  *(_QWORD *)&v15.msgh_voucher_port = 0xB00000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&v15);
  return mach_msg(&v15, 2097153, v12 + 88, 0, 0, 0, 0);
}

uint64_t _DAServerSessionRegisterCallback(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  mach_msg_header_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v15 = 2;
  v16 = a6;
  v17 = 16777472;
  v18 = a7;
  v19 = a8;
  v20 = 16777472;
  v21 = a9;
  v22 = *MEMORY[0x24BDAC470];
  v23 = a2;
  v24 = a3;
  v25 = a4;
  v26 = a5;
  v27 = a7;
  v28 = a9;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v14.msgh_bits = 2147489043;
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(_QWORD *)&v14.msgh_voucher_port = 0xC00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set(&v14);
    special_reply_port = v14.msgh_local_port;
  }
  v11 = mach_msg(&v14, 3162115, 0x64u, 0x2Cu, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v11)
    {
      mig_dealloc_special_reply_port();
      return v12;
    }
    if (v14.msgh_id == 71)
    {
      v12 = 4294966988;
    }
    else if (v14.msgh_id == 112)
    {
      v12 = 4294966996;
      if ((v14.msgh_bits & 0x80000000) == 0 && *(_QWORD *)&v14.msgh_size == 36)
      {
        v12 = HIDWORD(v16);
        if (!HIDWORD(v16))
          return v12;
      }
    }
    else
    {
      v12 = 4294966995;
    }
    mach_msg_destroy(&v14);
  }
  return v12;
}

uint64_t _DAServerSessionRelease(mach_port_t a1)
{
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0xD00000000;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t _DAServerSessionSetKeepAlive(int a1)
{
  mach_port_name_t special_reply_port;
  uint64_t v3;
  uint64_t v4;
  _BYTE msg[36];
  uint64_t v7;

  v7 = 0;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0xE00000000;
  if (MEMORY[0x24BDB0418])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v3 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_special_reply_port();
      return v4;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v4 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 114)
    {
      v4 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        v4 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32])
          return v4;
      }
    }
    else
    {
      v4 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v4;
}

uint64_t _DAServerSessionSetClientPort(int a1, int a2)
{
  _BYTE msg[28];
  int v4;
  int v5;
  int v6;

  v5 = 0;
  *(_OWORD *)&msg[4] = 0u;
  v4 = a2;
  v6 = 1310720;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_QWORD *)&msg[20] = 0x10000000FLL;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t _DAServerSessionUnregisterCallback(mach_port_t a1, uint64_t a2, uint64_t a3)
{
  mach_msg_header_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *MEMORY[0x24BDAC470];
  v6 = a2;
  v7 = a3;
  *(_QWORD *)&v4.msgh_bits = 19;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 16;
  v4.msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x24BDB0418])
    voucher_mach_msg_set(&v4);
  return mach_msg(&v4, 2097153, 0x30u, 0, 0, 0, 0);
}

void __DAInitialize_cold_1()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 95, "match");
}

void __DAInitialize_cold_2()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 107, "match");
}

void __DAInitialize_cold_3()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 119, "match");
}

void __DAInitialize_cold_4()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 131, "match");
}

void __DAInitialize_cold_5()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 143, "watch");
}

void __DAInitialize_cold_6()
{
  __assert_rtn("__DAInitialize", "DiskArbitration.c", 155, "watch");
}

void DASessionCreate_cold_1()
{
  __assert_rtn("__DASessionCreate", "DASession.c", 161, "session->_register");
}

void DASessionCreate_cold_2(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_2127E8000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Now using %d DASessionRef objects", (uint8_t *)v1, 8u);
}

void __DASessionDeallocate_cold_1()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 202, "session->_source2 == NULL");
}

void __DASessionDeallocate_cold_2()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 201, "session->_source == NULL");
}

void __DASessionDeallocate_cold_3()
{
  __assert_rtn("__DASessionDeallocate", "DASession.c", 200, "session->_client == NULL");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB838](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x24BDBB880](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
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

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x24BDBBEE0](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

uint64_t CFHashBytes()
{
  return MEMORY[0x24BDBBF18]();
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x24BDBBFC8](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
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

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC8A8](anURL);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

uint64_t __CFBinaryPlistWriteToStream()
{
  return MEMORY[0x24BDBD188]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x24BDAC908]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x24BDACA40](*(_QWORD *)&image_index);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x24BDAD2B0](a1);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x24BDAD2E8]();
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x24BDAE608](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x24BDAEB80](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x24BDAEB90](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x24BDAEC08](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x24BDAEC10](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x24BDAEEE8]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x24BDAEF00]();
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF10](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x24BDAEF18](dest, src, *(_QWORD *)&len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
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

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x24BDAFFA8](__s, *(_QWORD *)&__c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x24BDB0170](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

