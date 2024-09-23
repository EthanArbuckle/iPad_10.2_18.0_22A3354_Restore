float GSMainScreenScaleFactor()
{
  float result;

  result = *(float *)&__screenScale;
  if (*(float *)&__screenScale == 0.0)
  {
    FetchScreenInfoFromCapabilities();
    return *(float *)&__screenScale;
  }
  return result;
}

void *GSEventRegisterEventCallBack(void *result)
{
  __eventCallBack = result;
  return result;
}

void GSEventInitialize()
{
  _GSEventInitializeApp(0, 0);
}

CGFloat GSSetMainScreenInfo(double a1, double a2, float a3, float a4)
{
  __screenWidth = (int)a1;
  __screenHeight = (int)a2;
  __screenScale = LODWORD(a3);
  __screenOrientation = LODWORD(a4);
  return ResetTransforms();
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  uint64_t result;
  uint64_t state64;

  result = GetHardwareKeyboardToken();
  if ((_DWORD)result)
  {
    state64 = 0;
    if (notify_get_state(result, &state64))
    {
      result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return (_BYTE)state64 != 0;
    }
  }
  return result;
}

uint64_t GetHardwareKeyboardToken()
{
  uint64_t result;
  uint32_t v1;

  result = AttachedKeyboardToken;
  if (!AttachedKeyboardToken)
  {
    v1 = notify_register_check((const char *)kGSEventHardwareKeyboardAvailabilityChangedNotification, &AttachedKeyboardToken);
    result = AttachedKeyboardToken;
    if (v1)
    {
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        result = 0;
        AttachedKeyboardToken = 0;
      }
    }
  }
  return result;
}

void GSEventPushRunLoopMode(void *value)
{
  __CFArray *Mutable;

  Mutable = (__CFArray *)__runLoopModeStack;
  if (!__runLoopModeStack)
  {
    Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    __runLoopModeStack = (uint64_t)Mutable;
  }
  CFArrayAppendValue(Mutable, value);
  CFRunLoopStop((CFRunLoopRef)__eventRunLoop);
}

void GSInitialize()
{
  CFMachPortRef v0;

  if ((GSInitialize_sInitialized & 1) == 0)
  {
    v0 = CFMachPortCreate(0, 0, 0, 0);
    if (v0)
      CFRelease(v0);
    __GSEventClassInitialize();
    __GSKeyboardClassInitialize();
    CGFontDBSetInitializer();
    GSInitialize_sInitialized = 1;
  }
}

uint64_t __GSEventClassInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kGSEventTypeID = result;
  return result;
}

uint64_t __GSKeyboardClassInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kGSKeyboardTypeID = result;
  return result;
}

void GSEventRunModal(int a1)
{
  const __CFArray *v2;
  CFIndex Count;
  const __CFString *ValueAtIndex;
  const __CFString *v5;
  __CFRunLoop *Current;
  __CFRunLoop *v7;

  while (!a1 || (__exitRunModal & 1) == 0)
  {
    if (!__runLoopModeStack
      || CFArrayGetCount((CFArrayRef)__runLoopModeStack) < 1
      || (v2 = (const __CFArray *)__runLoopModeStack,
          Count = CFArrayGetCount((CFArrayRef)__runLoopModeStack),
          (ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v2, Count - 1)) == 0))
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s: NULL run loop mode. Exiting loop\n", "GSEventRunModal");
      break;
    }
    v5 = ValueAtIndex;
    if (__timeEventHandling)
    {
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddObserver(Current, (CFRunLoopObserverRef)timingObserver, v5);
    }
    CFRunLoopRunInMode(v5, 6.31139904e10, 0);
    if (__timeEventHandling)
    {
      v7 = CFRunLoopGetCurrent();
      CFRunLoopRemoveObserver(v7, (CFRunLoopObserverRef)timingObserver, v5);
    }
  }
  __exitRunModal = 0;
}

void _GSEventInitializeApp(int a1, NSObject *a2)
{
  char *IdentifierCString;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  int v8;
  char *v9;

  if ((_GSEventInitializeApp__initialized & 1) == 0)
  {
    _GSEventInitializeApp__initialized = 1;
    _GSEventInitializeShared(a2);
    IdentifierCString = GetIdentifierCString();
    if (!IdentifierCString)
      _GSEventInitializeApp_cold_1();
    if (strlen(IdentifierCString) >= 0x80)
      _GSEventInitializeApp_cold_2(&v9);
    if (a1)
    {
      if ((_GSEventInitializeApp__backboard & 1) == 0)
      {
        _GSEventInitializeApp__backboard = 1;
        v8 = 256;
        v5 = _GSRegisterPurpleNamedPortInPrivateNamespace(__PurpleWorkspacePortName);
        __workspacePort = v5;
        v6 = (unsigned int *)MEMORY[0x1E0C83DA0];
        MEMORY[0x1CAA372D4](*MEMORY[0x1E0C83DA0], v5, 1, &v8, 1);
        AddSourceForEventPort(__workspacePort, a2);
        v7 = _GSRegisterPurpleNamedPortInPrivateNamespace(__PurpleSystemEventPortName);
        __systemEventPort = v7;
        MEMORY[0x1CAA372D4](*v6, v7, 1, &v8, 1);
        AddSourceForEventPort(__systemEventPort, a2);
      }
    }
  }
}

void _GSEventInitializeShared(NSObject *a1)
{
  CFRunLoopSourceContext v1;

  if (a1)
  {
    __eventDeliveryQueue = (uint64_t)a1;
    dispatch_retain(a1);
  }
  else
  {
    __eventRunLoop = (uint64_t)CFRunLoopGetCurrent();
    CFRetain((CFTypeRef)__eventRunLoop);
  }
  if (__eventRunLoop)
  {
    *(_OWORD *)&v1.cancel = xmmword_1E81F1958;
    memset(&v1, 0, 64);
    __signalRunLoopSource = (uint64_t)CFRunLoopSourceCreate(0, -1, &v1);
    CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, (CFRunLoopSourceRef)__signalRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, (CFRunLoopSourceRef)__signalRunLoopSource, CFSTR("GSEventReceiveRunLoopMode"));
  }
}

char *GetIdentifierCString()
{
  char *result;
  __CFBundle *MainBundle;
  const __CFString *Identifier;
  const __CFString *v3;
  CFIndex Length;
  uint64_t v5;
  const char *v6;
  CFIndex v7;
  const char *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  result = (char *)GetIdentifierCString___identifierCString;
  if (!GetIdentifierCString___identifierCString)
  {
    MainBundle = CFBundleGetMainBundle();
    if (MainBundle)
    {
      Identifier = CFBundleGetIdentifier(MainBundle);
      if (Identifier)
      {
        v3 = Identifier;
        Length = CFStringGetLength(Identifier);
        CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
        MEMORY[0x1E0C80A78]();
        v6 = (char *)v9 - v5;
        if (CFStringGetCString(v3, (char *)v9 - v5, v7, 0x8000100u))
          GetIdentifierCString___identifierCString = (uint64_t)strdup(v6);
      }
    }
    result = (char *)GetIdentifierCString___identifierCString;
    if (!GetIdentifierCString___identifierCString)
    {
      v8 = getprogname();
      if (v8)
      {
        result = strdup(v8);
        GetIdentifierCString___identifierCString = (uint64_t)result;
      }
      else
      {
        return (char *)GetIdentifierCString___identifierCString;
      }
    }
  }
  return result;
}

void GSEventRun()
{
  BOOL v0;

  if (__timeEventHandling)
    v0 = timingObserver == 0;
  else
    v0 = 0;
  if (v0)
    timingObserver = (uint64_t)CFRunLoopObserverCreate(0, 0xFFFFFFFuLL, 1u, 9999, (CFRunLoopObserverCallBack)timingObserverCallback, 0);
  GSEventRunModal(0);
}

CGFloat ResetTransforms()
{
  CGFloat result;
  double v1;
  double v2;
  CGFloat v3;
  CGFloat v4;
  CGAffineTransform v5;
  CGAffineTransform t2;
  CGAffineTransform v7;

  LODWORD(result) = __screenOrientation;
  if (*(float *)&__screenOrientation != 0.0)
  {
    CGAffineTransformMakeRotation(&v7, (float)-*(float *)&__screenOrientation);
    *(CGAffineTransform *)__screenWindowTransform = v7;
    v1 = (float)((float)__screenWidth / *(float *)&__screenScale);
    v2 = (float)((float)__screenHeight / *(float *)&__screenScale);
    v3 = v7.c * v2 + v7.a * v1;
    v4 = v7.d * v2 + v7.b * v1;
    *(float *)&v1 = v3;
    *(float *)&v4 = v4;
    CGAffineTransformMakeTranslation(&t2, fmaxf(-*(float *)&v1, 0.0), fmaxf(-*(float *)&v4, 0.0));
    v5 = *(CGAffineTransform *)__screenWindowTransform;
    CGAffineTransformConcat(&v7, &v5, &t2);
    *(CGAffineTransform *)__screenPositionTransform = v7;
    return v7.tx;
  }
  return result;
}

CGColorRef GSColorCreateColorWithDeviceRGBA(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColorSpace *DeviceRGB;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  DeviceRGB = (CGColorSpace *)GetDeviceRGBColorSpace_sDeviceRGBColorSpace;
  if (!GetDeviceRGBColorSpace_sDeviceRGBColorSpace)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    GetDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)DeviceRGB;
  }
  return CGColorCreate(DeviceRGB, components);
}

CGColorRef GSColorCreateColorWithDeviceRGBAInfo(uint64_t a1)
{
  if (*(_BYTE *)a1)
    return GSColorCreateColorWithDeviceRGBA(*(float *)(a1 + 4), *(float *)(a1 + 8), *(float *)(a1 + 12), *(float *)(a1 + 16));
  else
    return 0;
}

CGColorRef GSColorCreateWithDeviceWhite(CGFloat a1, CGFloat a2)
{
  CGColorSpace *DeviceGray;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  DeviceGray = (CGColorSpace *)GetDeviceGrayColorSpace_sGenericGrayColorSpace;
  if (!GetDeviceGrayColorSpace_sGenericGrayColorSpace)
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    GetDeviceGrayColorSpace_sGenericGrayColorSpace = (uint64_t)DeviceGray;
  }
  return CGColorCreate(DeviceGray, components);
}

void GSColorGetRGBAComponents(CGColor *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  CGColorSpaceRef ColorSpace;
  CGColorSpaceRef DeviceRGB;
  CGColor *v12;
  uint64_t v13;
  const void *v14;
  const CGFloat *Components;

  ColorSpace = CGColorGetColorSpace(a1);
  DeviceRGB = (CGColorSpaceRef)GetDeviceRGBColorSpace_sDeviceRGBColorSpace;
  if (!GetDeviceRGBColorSpace_sDeviceRGBColorSpace)
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    GetDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)DeviceRGB;
  }
  v12 = a1;
  if (ColorSpace != DeviceRGB)
  {
    if (!DeviceRGB)
      GetDeviceRGBColorSpace_sDeviceRGBColorSpace = (uint64_t)CGColorSpaceCreateDeviceRGB();
    v13 = MEMORY[0x1CAA370B8]();
    if (!v13)
      goto LABEL_11;
    v14 = (const void *)v13;
    v12 = (CGColor *)CGColorTransformConvertColor();
    CFRelease(v14);
  }
  if (!v12)
  {
LABEL_11:
    *a5 = 0;
    *a4 = 0;
    *a3 = 0;
    *a2 = 0;
    return;
  }
  Components = CGColorGetComponents(v12);
  if (Components)
  {
    *a2 = *(_QWORD *)Components;
    *a3 = *((_QWORD *)Components + 1);
    *a4 = *((_QWORD *)Components + 2);
    *a5 = *((_QWORD *)Components + 3);
  }
  else
  {
    *a5 = 0;
    *a4 = 0;
    *a3 = 0;
    *a2 = 0;
  }
  if (v12 != a1)
    CFRelease(v12);
}

void GSColorGetRGBAInfo(CGColor *a1@<X0>, uint64_t a2@<X8>)
{
  float v3;
  float v4;
  float v5;
  float v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (a1)
  {
    v9 = 0.0;
    v10 = 0.0;
    v7 = 0.0;
    v8 = 0.0;
    GSColorGetRGBAComponents(a1, &v10, &v9, &v8, &v7);
    *(_BYTE *)a2 = 1;
    v3 = v10;
    v4 = v9;
    *(float *)(a2 + 4) = v3;
    *(float *)(a2 + 8) = v4;
    v5 = v8;
    v6 = v7;
    *(float *)(a2 + 12) = v5;
    *(float *)(a2 + 16) = v6;
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)(a2 + 16) = 0;
  }
}

uint64_t GSEventGetTypeID()
{
  return __kGSEventTypeID;
}

__n128 GSEventCreateWithEventRecord(unsigned int *a1)
{
  uint64_t v1;
  __n128 result;

  v1 = CreateWithEventRecord(a1);
  result = *(__n128 *)(v1 + 40);
  *(__n128 *)(v1 + 24) = result;
  *(_QWORD *)(v1 + 72) = 0;
  return result;
}

uint64_t CreateWithEventRecord(unsigned int *a1)
{
  uint64_t Instance;
  uint64_t v3;

  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
    memcpy((void *)(Instance + 16), a1, a1[18] + 88);
  return v3;
}

uint64_t GSEventCopy(uint64_t a1)
{
  uint64_t Instance;
  uint64_t v3;

  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
    memcpy((void *)(Instance + 16), (const void *)(a1 + 16), *(unsigned int *)(a1 + 88) + 88);
  return v3;
}

__CFDictionary *GSEventCreatePlistRepresentation(uint64_t a1)
{
  __CFDictionary *Mutable;
  CFIndex v3;
  CFDataRef v4;
  CFNumberRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CFDictionaryRef DictionaryRepresentation;
  double v15;
  double v16;
  CFDictionaryRef v18;

  Mutable = CFDictionaryCreateMutable(0, 8, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v3 = *(unsigned int *)(a1 + 88);
  if ((_DWORD)v3)
  {
    v4 = CFDataCreate(0, (const UInt8 *)(a1 + 104), v3);
    CFDictionarySetValue(Mutable, CFSTR("Data"), v4);
    CFRelease(v4);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v5 = CFNumberCreate(0, kCFNumberSInt64Type, (const void *)(a1 + 64));
    CFDictionarySetValue(Mutable, CFSTR("Time"), v5);
    CFRelease(v5);
  }
  if (*(_DWORD *)(a1 + 16))
  {
    v6 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 16));
    CFDictionarySetValue(Mutable, CFSTR("Type"), v6);
    CFRelease(v6);
  }
  if (*(_DWORD *)(a1 + 80))
  {
    v7 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 80));
    CFDictionarySetValue(Mutable, CFSTR("Flags"), v7);
    CFRelease(v7);
  }
  if (*(_DWORD *)(a1 + 20))
  {
    v8 = CFNumberCreate(0, kCFNumberSInt32Type, (const void *)(a1 + 20));
    CFDictionarySetValue(Mutable, CFSTR("Subtype"), v8);
    CFRelease(v8);
  }
  v9 = *(double *)(a1 + 24);
  v10 = *(double *)(a1 + 32);
  v11 = *MEMORY[0x1E0C9D538];
  v12 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (v9 != *MEMORY[0x1E0C9D538] || v10 != v12)
  {
    DictionaryRepresentation = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v9);
    CFDictionarySetValue(Mutable, CFSTR("Location"), DictionaryRepresentation);
    CFRelease(DictionaryRepresentation);
  }
  v15 = *(double *)(a1 + 40);
  v16 = *(double *)(a1 + 48);
  if (v15 != v11 || v16 != v12)
  {
    v18 = CGPointCreateDictionaryRepresentation(*(CGPoint *)&v15);
    CFDictionarySetValue(Mutable, CFSTR("WindowLocation"), v18);
    CFRelease(v18);
  }
  return Mutable;
}

uint64_t GSEventCreateWithPlist(const __CFDictionary *a1)
{
  const __CFData *Value;
  const __CFNumber *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  uint64_t Instance;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  const __CFData *v14;
  const UInt8 *BytePtr;
  size_t Length;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = 0u;
  Value = (const __CFData *)CFDictionaryGetValue(a1, CFSTR("Data"));
  if (Value)
    DWORD2(v22) = CFDataGetLength(Value);
  v3 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Time"));
  if (v3)
    CFNumberGetValue(v3, kCFNumberSInt64Type, &v21);
  v4 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Type"));
  if (v4)
    CFNumberGetValue(v4, kCFNumberIntType, &v18);
  v5 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Flags"));
  if (v5)
    CFNumberGetValue(v5, kCFNumberSInt32Type, &v22);
  v6 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("Subtype"));
  if (v6)
    CFNumberGetValue(v6, kCFNumberSInt32Type, (char *)&v18 + 4);
  v7 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("Location"));
  if (v7)
    CGPointMakeWithDictionaryRepresentation(v7, (CGPoint *)((char *)&v18 + 8));
  v8 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("WindowLocation"));
  if (v8)
    CGPointMakeWithDictionaryRepresentation(v8, (CGPoint *)((char *)&v19 + 8));
  Instance = _CFRuntimeCreateInstance();
  v10 = Instance;
  if (Instance)
  {
    v11 = v19;
    *(_OWORD *)(Instance + 16) = v18;
    *(_OWORD *)(Instance + 32) = v11;
    *(_QWORD *)(Instance + 96) = v23;
    v12 = v22;
    v13 = v20;
    *(_OWORD *)(Instance + 64) = v21;
    *(_OWORD *)(Instance + 80) = v12;
    *(_OWORD *)(Instance + 48) = v13;
    if (DWORD2(v22))
    {
      v14 = (const __CFData *)CFDictionaryGetValue(a1, CFSTR("Data"));
      BytePtr = CFDataGetBytePtr(v14);
      Length = CFDataGetLength(v14);
      memcpy((void *)(v10 + 104), BytePtr, Length);
    }
    *(_OWORD *)(v10 + 24) = *(_OWORD *)(v10 + 40);
    *(_QWORD *)(v10 + 72) = 0;
  }
  return v10;
}

__n128 GSEventGetHandInfo@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a1 + 104);
  v3 = *(_OWORD *)(a1 + 120);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 136);
  return result;
}

__n128 GSEventGetPathInfoAtIndex@<Q0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  __int128 v4;
  __n128 result;

  v3 = a1 + 48 * a2;
  v4 = *(_OWORD *)(v3 + 160);
  *(_OWORD *)a3 = *(_OWORD *)(v3 + 144);
  *(_OWORD *)(a3 + 16) = v4;
  result = *(__n128 *)(v3 + 176);
  *(__n128 *)(a3 + 32) = result;
  return result;
}

__n128 GSEventSetPathInfoAtIndex(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = a1 + 48 * a3;
  result = *(__n128 *)a2;
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 160) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 176) = v5;
  *(__n128 *)(v3 + 144) = result;
  return result;
}

uint64_t GSEventDisableHandEventCoalescing(uint64_t result)
{
  __disableHandEventCoalescing = result;
  return result;
}

double GSEventGetInnerMostPathPosition(uint64_t a1)
{
  uint64_t v1;

  v1 = 160;
  if (!*(_BYTE *)(a1 + 138))
    v1 = 40;
  return *(double *)(a1 + v1);
}

double GSEventGetLocationInWindow(uint64_t a1)
{
  return *(double *)(a1 + 40);
}

double GSEventGetOuterMostPathPosition(uint64_t a1)
{
  uint64_t v1;

  if (*(_BYTE *)(a1 + 138))
    v1 = a1 + 48 * (*(unsigned __int8 *)(a1 + 138) - 1) + 160;
  else
    v1 = a1 + 40;
  return *(double *)v1;
}

BOOL GSEventIsHandEvent(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) == 3001;
}

BOOL GSEventIsChordingHandEvent(uint64_t a1)
{
  int v1;
  BOOL v2;
  BOOL v3;

  if (*(_DWORD *)(a1 + 16) != 3001)
    return 0;
  v1 = *(unsigned __int16 *)(a1 + 110);
  if (*(unsigned __int16 *)(a1 + 108) <= 1u)
  {
    v2 = v1 != 0;
    v3 = v1 == 1;
  }
  else
  {
    v2 = 1;
    v3 = 0;
  }
  return !v3 && v2;
}

uint64_t GSEventShouldRouteToFrontMost(uint64_t a1)
{
  return (*(_DWORD *)(a1 + 16) >> 17) & 1;
}

uint64_t GSEventRemoveShouldRouteToFrontMost(uint64_t result)
{
  *(_DWORD *)(result + 16) &= ~0x20000u;
  return result;
}

uint64_t GSEventGetType(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = *(_DWORD *)(a1 + 16) & 0xFFFDFFFF;
  if ((_DWORD)result == 3001)
  {
    v3 = *(_DWORD *)(a1 + 104) - 1;
    if (v3 > 5)
      return 0;
    else
      return dword_1C8909C60[v3];
  }
  return result;
}

uint64_t GSEventGetSubType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t GSEventSetLocationInWindow(uint64_t result, double a2, double a3)
{
  *(double *)(result + 40) = a2;
  *(double *)(result + 48) = a3;
  return result;
}

uint64_t GSEventSetType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

float GSEventGetDeltaX(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 22)
    return (float)*(int *)(a1 + 108);
  else
    return (float)*(__int16 *)(a1 + 108);
}

float GSEventGetDeltaY(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 16) == 22)
    return (float)*(int *)(a1 + 104);
  else
    return (float)*(__int16 *)(a1 + 110);
}

float GSEventAccelerometerAxisX(uint64_t a1)
{
  return *(float *)(a1 + 104);
}

float GSEventAccelerometerAxisY(uint64_t a1)
{
  return *(float *)(a1 + 108);
}

float GSEventAccelerometerAxisZ(uint64_t a1)
{
  return *(float *)(a1 + 112);
}

uint64_t GSEventDeviceOrientation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 104);
}

uint64_t GSEventGetClickCount()
{
  return 1;
}

double GSEventGetTimestamp(uint64_t a1)
{
  return (double)*(unint64_t *)(a1 + 64) / 1000000000.0;
}

uint64_t GSEventGetHIDTimestamp(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t GSEventGetWindow(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t GSEventIsForceQuitEvent(uint64_t result)
{
  if (result)
  {
    if ((*(_DWORD *)(result + 16) & 0xFFFDFFFF) == 0x7D7)
      return (*(unsigned __int8 *)(result + 108) >> 3) & 1;
    else
      return 0;
  }
  return result;
}

uint64_t _GSEventGetGSEventRecord(uint64_t a1)
{
  return a1 + 16;
}

uint64_t GSEventGetUsagePage(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 88);
  if (v1 == 4 || v1 == 8)
    return *(unsigned int *)(a1 + 104);
  else
    return 12;
}

CFStringRef GSEventCopyCharacters(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 114), *(unsigned __int16 *)(a1 + 112));
}

CFStringRef GSEventCopyCharactersIgnoringModifiers(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 164), *(unsigned __int16 *)(a1 + 162));
}

CFStringRef GSEventCopyMarkedCharacters(uint64_t a1)
{
  return CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 214), *(unsigned __int16 *)(a1 + 212));
}

uint64_t GSEventGetCharacterSet(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 110);
}

uint64_t GSEventGetModifierFlags(uint64_t a1)
{
  return *(unsigned int *)(a1 + 80);
}

uint64_t GSEventGetKeyFlags(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 262);
}

uint64_t GSEventIsKeyRepeating(uint64_t a1)
{
  return *(_WORD *)(a1 + 262) & 1;
}

BOOL GSEventIsHardwareKeyboardEvent(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;
  BOOL v4;

  v1 = *(_DWORD *)(a1 + 16);
  v2 = v1 >= 0xE;
  v4 = v1 == 14;
  v3 = (1 << v1) & 0x4C00;
  v4 = !v4 && v2 || v3 == 0;
  return !v4 && *(unsigned __int16 *)(a1 + 264) == 1;
}

BOOL GSEventSourceIsHardware(uint64_t a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;
  BOOL v4;
  int v5;
  BOOL v6;

  v1 = *(_DWORD *)(a1 + 16);
  v2 = (v1 & 0xFFFDFFFF) - 1000 > 0x13 || ((1 << (v1 + 24)) & 0xC3FC3) == 0;
  if (v2 && ((v1 & 0xFFFDFFFF) == 0xBB9 || (v1 & 0xFFFDFFFE) != 0x3FE))
  {
    v4 = v1 > 0xE;
    v5 = (1 << v1) & 0x5C00;
    v6 = v4 || v5 == 0;
    if (!v6 && *(_DWORD *)(a1 + 88) == 162)
    {
      v3 = *(unsigned __int16 *)(a1 + 264);
      return v3 == 1;
    }
LABEL_15:
    v3 = 0;
    return v3 == 1;
  }
  if (*(_DWORD *)(a1 + 88) != 8)
    goto LABEL_15;
  v3 = *(unsigned __int16 *)(a1 + 108);
  return v3 == 1;
}

uint64_t GSEventGetHardwareKeyboardType()
{
  uint64_t result;
  uint64_t state64;

  result = GetHardwareKeyboardToken();
  if ((_DWORD)result)
  {
    state64 = 0;
    if (notify_get_state(result, &state64))
    {
      result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return BYTE2(state64);
    }
  }
  return result;
}

uint64_t GSEventGetHardwareKeyboardCountry()
{
  uint64_t result;
  uint64_t state64;

  result = GetHardwareKeyboardToken();
  if ((_DWORD)result)
  {
    state64 = 0;
    if (notify_get_state(result, &state64))
    {
      result = AttachedKeyboardToken;
      if (AttachedKeyboardToken)
      {
        notify_cancel(AttachedKeyboardToken);
        result = 0;
        AttachedKeyboardToken = 0;
      }
    }
    else
    {
      return BYTE1(state64);
    }
  }
  return result;
}

uint64_t GSEventSetHardwareKeyboardAttached(int a1, unsigned int a2)
{
  return GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(a1, a2, 0);
}

uint64_t GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(int a1, unsigned int a2, unsigned int a3)
{
  uint64_t result;

  result = GetHardwareKeyboardToken();
  if ((_DWORD)result)
  {
    notify_set_state(result, ((unint64_t)a2 << 8) | ((unint64_t)a3 << 16) | (a1 != 0));
    return notify_post((const char *)kGSEventHardwareKeyboardAvailabilityChangedNotification);
  }
  return result;
}

void GSEventSetCharacters(uint64_t a1, CFStringRef theString)
{
  unsigned int Length;
  CFRange v5;

  Length = (unsigned __int16)CFStringGetLength(theString);
  if (Length >= 0x18)
    v5.length = 24;
  else
    v5.length = Length;
  *(_WORD *)(a1 + 112) = v5.length;
  v5.location = 0;
  CFStringGetCharacters(theString, v5, (UniChar *)(a1 + 114));
}

uint64_t GSEventGetSenderPID(uint64_t a1)
{
  return *(unsigned int *)(a1 + 84);
}

uint64_t GSEventIsTabKeyEvent(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;

  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 16) & 0xFFFDFFFF;
    if (v2 == 3001)
    {
      v3 = *(_DWORD *)(result + 104) - 1;
      if (v3 > 5)
        v2 = 0;
      else
        v2 = dword_1C8909C60[v3];
    }
    if (v2 == 14 || (v2 & 0xFFFDFFFE) == 10)
      return GSEventIsKeyCharacterEventType(result, 9) || GSEventIsKeyCharacterEventType(v1, 25);
    else
      return 0;
  }
  return result;
}

BOOL GSEventIsKeyCharacterEventType(uint64_t a1, int a2)
{
  unsigned int v3;
  unsigned int v4;
  const __CFString *v6;
  const __CFString *v7;
  _BOOL8 v8;

  v3 = *(_DWORD *)(a1 + 16) & 0xFFFDFFFF;
  if (v3 == 3001)
  {
    v4 = *(_DWORD *)(a1 + 104) - 1;
    if (v4 > 5)
      v3 = 0;
    else
      v3 = dword_1C8909C60[v4];
  }
  if (v3 != 14 && (v3 & 0xFFFDFFFE) != 10)
    return 0;
  v6 = CFStringCreateWithCharacters(0, (const UniChar *)(a1 + 164), *(unsigned __int16 *)(a1 + 162));
  if (!v6)
    return 0;
  v7 = v6;
  v8 = CFStringGetLength(v6) == 1 && CFStringGetCharacterAtIndex(v7, 0) == a2;
  CFRelease(v7);
  return v8;
}

uint64_t GSEventGetKeyCode(uint64_t result)
{
  unsigned int v1;
  unsigned int v2;

  if (result)
  {
    v1 = *(_DWORD *)(result + 16) & 0xFFFDFFFF;
    if (v1 == 3001)
    {
      v2 = *(_DWORD *)(result + 104) - 1;
      if (v2 > 5)
        v1 = 0;
      else
        v1 = dword_1C8909C60[v2];
    }
    if (v1 == 14 || (v1 & 0xFFFDFFFE) == 10)
      return *(unsigned __int16 *)(result + 104);
    else
      return 0;
  }
  return result;
}

uint64_t GSEventCreateKeyEvent(unsigned int a1, const __CFString *a2, const __CFString *a3, int a4, __int16 a5, __int16 a6, __int16 a7, double a8, double a9)
{
  uint64_t result;
  unsigned __int16 Length;
  unsigned __int16 v19;
  unsigned __int16 v20;
  unsigned __int16 v21;
  _OWORD v22[3];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[10];
  uint64_t v27;
  CFRange v28;
  CFRange v29;

  result = 0;
  v27 = *MEMORY[0x1E0C80C00];
  if (a1 <= 0xE && ((1 << a1) & 0x4C00) != 0)
  {
    v25 = 0u;
    memset(v26, 0, 154);
    v23 = 0u;
    v24 = 0u;
    memset(v22, 0, sizeof(v22));
    DWORD2(v24) = 162;
    LODWORD(v24) = a4;
    *(_QWORD *)&v23 = GSCurrentEventTimestamp();
    Length = CFStringGetLength(a2);
    if (Length <= 0x18uLL)
      v19 = Length;
    else
      v19 = 24;
    LOWORD(v26[0]) = v19;
    v28.length = v19;
    v28.location = 0;
    CFStringGetCharacters(a2, v28, (UniChar *)v26 + 1);
    v20 = CFStringGetLength(a3);
    if (v20 <= 0x18uLL)
      v21 = v20;
    else
      v21 = 24;
    WORD1(v26[3]) = v21;
    v29.length = v21;
    v29.location = 0;
    CFStringGetCharacters(a3, v29, (UniChar *)&v26[3] + 2);
    WORD4(v25) = a5;
    WORD3(v26[9]) = a6;
    WORD4(v26[9]) = a7;
    result = CreateWithEventRecord((unsigned int *)v22);
    *(_OWORD *)(result + 24) = *(_OWORD *)(result + 40);
    *(_QWORD *)(result + 72) = 0;
    *(_DWORD *)(result + 16) = a1;
    *(double *)(result + 40) = a8;
    *(double *)(result + 48) = a9;
  }
  return result;
}

unint64_t GSCurrentEventTimestamp()
{
  uint64_t v0;

  v0 = mach_absolute_time();
  if (GetTimebase_once != -1)
    dispatch_once(&GetTimebase_once, &__block_literal_global_35);
  return v0 * GetTimebase___timebase / HIDWORD(GetTimebase___timebase);
}

void GSEventSendKeyEvent(unsigned int a1, const __CFString *a2, const __CFString *a3, int a4, __int16 a5, __int16 a6, __int16 a7, double a8, double a9)
{
  uint64_t KeyEvent;
  const void *v10;

  if (a1 <= 0xE && ((1 << a1) & 0x4C00) != 0)
  {
    KeyEvent = GSEventCreateKeyEvent(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    if (KeyEvent)
    {
      v10 = (const void *)KeyEvent;
      GSGetPurpleApplicationPort();
      CFRelease(v10);
    }
  }
}

uint64_t GSSendEvent(unsigned int *a1, unsigned int a2)
{
  CFIndex v4;
  CFIndex v5;
  CFIndex v6;
  _DWORD *ValueAtIndex;
  uint64_t v8;
  _QWORD *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  _DWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  pthread_t v19;
  pthread_attr_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2 - 1 > 0xFFFFFFFD)
    return 268435459;
  pthread_mutex_lock(&__dispatchQueuesLock);
  if (__dispatchQueues && (v4 = CFArrayGetCount((CFArrayRef)__dispatchQueues), v4 >= 1))
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v6);
      if (ValueAtIndex[4] == a2)
        break;
      if (v5 == ++v6)
        goto LABEL_7;
    }
    v14 = ValueAtIndex;
    v15 = CreateWithEventRecord(a1);
    PurplePushEvent(v14, v15);
    v8 = 0;
  }
  else
  {
LABEL_7:
    v8 = _GSSendEvent((int *)a1, a2, 0);
    if ((_DWORD)v8 == 268435460)
    {
      if (!__dispatchQueues)
        __dispatchQueues = (uint64_t)CFArrayCreateMutable(0, 0, 0);
      v9 = malloc_type_malloc(0x18uLL, 0x1020040EDCEB4C7uLL);
      *v9 = 0;
      v9[1] = 0;
      *((_DWORD *)v9 + 4) = a2;
      CFArrayAppendValue((CFMutableArrayRef)__dispatchQueues, v9);
      memset(&v20, 0, sizeof(v20));
      pthread_attr_init(&v20);
      pthread_attr_setdetachstate(&v20, 2);
      v19 = 0;
      pthread_create(&v19, &v20, (void *(__cdecl *)(void *))DispatchThread, (void *)a2);
      pthread_attr_destroy(&v20);
      if (__dispatchQueues)
      {
        Count = CFArrayGetCount((CFArrayRef)__dispatchQueues);
        if (Count >= 1)
        {
          v11 = Count;
          v12 = 0;
          while (1)
          {
            v13 = CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v12);
            if (v13[4] == a2)
              break;
            if (v11 == ++v12)
              goto LABEL_19;
          }
          v16 = v13;
          v17 = CreateWithEventRecord(a1);
          PurplePushEvent(v16, v17);
        }
      }
LABEL_19:
      v8 = 268435460;
    }
  }
  pthread_mutex_unlock(&__dispatchQueuesLock);
  return v8;
}

uint64_t GSGetPurpleApplicationPort()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    GSGetPurpleApplicationPort_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  return 0;
}

BOOL GSEventQueueContainsMouseEvent()
{
  uint64_t *v0;
  uint64_t v1;
  unsigned int v2;

  v0 = &_queue;
  do
  {
    v0 = (uint64_t *)*v0;
    if (!v0)
      break;
    v1 = v0[1];
    v2 = *(_DWORD *)(v1 + 16) & 0xFFFDFFFF;
    if (v2 == 3001)
    {
      if ((*(_DWORD *)(v1 + 104) - 1) < 6)
        return v0 != 0;
      v2 = 0;
    }
  }
  while (v2 - 7 < 0xFFFFFFFA);
  return v0 != 0;
}

void GSEventInitializeAsExtension()
{
  if ((GSEventInitializeAsExtension__initialized & 1) == 0)
  {
    GSEventInitializeAsExtension__initialized = 1;
    _GSEventInitializeShared(0);
  }
}

void GSEventInitializeWorkspaceWithQueue(NSObject *a1)
{
  _GSEventInitializeApp(1, a1);
}

uint64_t GSEventFinishedActivating(int a1, int a2, char a3, char a4)
{
  _BOOL4 v7;
  char *IdentifierCString;
  size_t v9;
  int v10;
  size_t v11;
  _DWORD *v12;
  size_t v13;
  unsigned int v14;
  _QWORD v16[2];

  v7 = a1 != 0;
  v16[1] = *MEMORY[0x1E0C80C00];
  IdentifierCString = GetIdentifierCString();
  v9 = strlen(IdentifierCString);
  v10 = v9;
  v11 = v9 + 1;
  v12 = (_DWORD *)((char *)v16 - ((MEMORY[0x1E0C80A78]() + 114) & 0xFFFFFFFFFFFFFFF0));
  bzero(v12, v13);
  *v12 = 2001;
  v12[18] = v10 + 11;
  v12[22] = a2;
  v12[23] = 2 * v7;
  *((_BYTE *)v12 + 96) = a3;
  *((_BYTE *)v12 + 97) = a4;
  memcpy((char *)v12 + 98, IdentifierCString, v11);
  v14 = GSGetPurpleSystemEventPort();
  return GSSendEvent(v12, v14);
}

uint64_t GSSendSystemEvent(unsigned int *a1)
{
  unsigned int v2;

  v2 = GSGetPurpleSystemEventPort();
  return GSSendEvent(a1, v2);
}

uint64_t GSEventCreateApplicationSuspendEvent(int a1, int a2, char a3, char a4, char a5, const __CFString *a6, double a7)
{
  char *IdentifierCString;
  size_t v15;
  size_t v16;
  char *v17;
  uint64_t result;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  IdentifierCString = GetIdentifierCString();
  v15 = strlen(IdentifierCString);
  MEMORY[0x1E0C80A78]();
  v17 = (char *)v19 - ((v16 + 15) & 0x1FFFFFFF0);
  bzero(v17, v16);
  *(_DWORD *)v17 = a1;
  *((_DWORD *)v17 + 18) = v15 + 153;
  if (a6)
    CFStringGetCString(a6, v17 + 96, 128, 0x8000100u);
  *((double *)v17 + 28) = a7;
  *((_DWORD *)v17 + 58) = a2;
  v17[236] = a3;
  v17[237] = a4;
  v17[238] = a5;
  memcpy(v17 + 239, IdentifierCString, v15 + 1);
  result = CreateWithEventRecord((unsigned int *)v17);
  *(_OWORD *)(result + 24) = *(_OWORD *)(result + 40);
  *(_QWORD *)(result + 72) = 0;
  return result;
}

void GSSendApplicationSuspendEvent(int a1, int a2, char a3, char a4, char a5, const __CFString *a6, double a7)
{
  uint64_t ApplicationSuspendEvent;
  const void *v8;
  unsigned int *v9;
  unsigned int v10;

  ApplicationSuspendEvent = GSEventCreateApplicationSuspendEvent(a1, a2, a3, a4, a5, a6, a7);
  if (ApplicationSuspendEvent)
  {
    v8 = (const void *)ApplicationSuspendEvent;
    v9 = (unsigned int *)(ApplicationSuspendEvent + 16);
    v10 = GSGetPurpleSystemEventPort();
    GSSendEvent(v9, v10);
    CFRelease(v8);
  }
}

void GSSendApplicationFinishedBackgroundContentFetchingEvent(int a1, int a2)
{
  GSSendApplicationFinishedBackgroundContentFetchingEventWithSequenceNumber(0, a1, a2);
}

void GSSendApplicationFinishedBackgroundContentFetchingEventWithSequenceNumber(int a1, int a2, int a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _DWORD v10[9];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(v10, 0, 28);
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 2017;
  v10[5] = a1;
  v10[1] = 16;
  v10[7] = a2;
  v10[8] = a3;
  v3 = CreateWithEventRecord(&v5);
  *(_OWORD *)(v3 + 24) = *(_OWORD *)(v3 + 40);
  *(_QWORD *)(v3 + 72) = 0;
  v4 = GSGetPurpleSystemEventPort();
  GSSendEvent((unsigned int *)(v3 + 16), v4);
  CFRelease((CFTypeRef)v3);
}

uint64_t GSSendWorkspaceEvent(unsigned int *a1)
{
  unsigned int v2;

  v2 = GSGetPurpleSystemEventPort();
  return GSSendEvent(a1, v2);
}

void GSSendApplicationFinishedBackgroundNotificationActionEvent()
{
  uint64_t v0;
  unsigned int v1;
  unsigned int v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _DWORD v7[7];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(v7, 0, sizeof(v7));
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v3 = 0u;
  v2 = 2020;
  v7[1] = 8;
  v0 = CreateWithEventRecord(&v2);
  *(_OWORD *)(v0 + 24) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 72) = 0;
  v1 = GSGetPurpleSystemEventPort();
  GSSendEvent((unsigned int *)(v0 + 16), v1);
  CFRelease((CFTypeRef)v0);
}

void GSSendApplicationSuspendedSettingsUpdatedEvent(int a1, char a2, char a3, char a4, const __CFString *a5, double a6)
{
  GSSendApplicationSuspendEvent(2011, a1, a2, a3, a4, a5, a6);
}

void GSSendAppPreferencesChanged(const __CFString *a1, const __CFString *a2)
{
  CFIndex Length;
  uint64_t v5;
  const char *v6;
  CFIndex v7;
  char *v8;
  unsigned int v9;
  CFIndex v10;
  CFIndex v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15[2];

  v15[1] = *(char **)MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  MEMORY[0x1E0C80A78]();
  v6 = (char *)v15 - v5;
  CFStringGetCString(a1, (char *)v15 - v5, v7, 0x8000100u);
  v15[0] = 0;
  asprintf(v15, "%s.gsEvents", v6);
  v8 = v15[0];
  if (v15[0])
  {
    LODWORD(v15[0]) = 0;
    if (bootstrap_look_up2())
      v9 = 0;
    else
      v9 = v15[0];
    if (v9 - 1 <= 0xFFFFFFFD)
    {
      v10 = CFStringGetLength(a2);
      v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u) + 1;
      MEMORY[0x1E0C80A78]();
      v13 = (char *)v15 - v12;
      bzero((char *)v15 - v12, v14);
      *(_DWORD *)v13 = 60;
      CFStringGetCString(a2, v13 + 88, v11, 0x8000100u);
      *((_DWORD *)v13 + 18) = strlen(v13 + 88) + 1;
      GSSendEvent((unsigned int *)v13, v9);
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v9);
    }
    free(v8);
  }
}

uint64_t GSCopyPurpleNamedPort()
{
  if (bootstrap_look_up2())
    return 0;
  else
    return 0;
}

void GSEventSendApplicationOpenURL(const __CFURL *a1, unsigned int a2)
{
  const __CFString *v3;
  const __CFString *v4;
  CFIndex Length;
  CFIndex v6;
  size_t v7;
  char *v8;
  _DWORD *v9;
  UInt8 *v10;
  _BYTE v11[96];
  _QWORD v12[117];
  CFRange v13;

  v12[116] = *MEMORY[0x1E0C80C00];
  v3 = CFURLGetString(a1);
  if (v3)
  {
    v4 = v3;
    Length = CFStringGetLength(v3);
    v6 = Length;
    v7 = Length + 97;
    if ((unint64_t)(Length + 97) < 0x401)
    {
      v10 = (UInt8 *)v12;
      v9 = v11;
    }
    else
    {
      v8 = (char *)malloc_type_malloc(Length + 97, 0x6E501A1BuLL);
      if (!v8)
        return;
      v9 = v8;
      v10 = (UInt8 *)(v8 + 96);
    }
    bzero(v9, v7);
    *v9 = 2006;
    v9[18] = v6 + 9;
    v13.location = 0;
    v13.length = v6;
    CFStringGetBytes(v4, v13, 0x8000100u, 0, 0, v10, v6 + 1, 0);
    GSSendEvent(v9, a2);
    if (v9 != (_DWORD *)v11)
      free(v9);
  }
}

uint64_t GSGetPurpleSystemAppPort()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v0)
    GSGetPurpleSystemAppPort_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  return 0;
}

uint64_t GSGetPurpleSystemEventPort()
{
  ipc_space_t *v0;
  int v1;
  int v2;
  mach_port_type_t ptype;
  int v5;

  pthread_mutex_lock(&GSGetPurpleSystemEventPort_portLock);
  ptype = 0;
  v0 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (mach_port_type(*MEMORY[0x1E0C83DA0], GSGetPurpleSystemEventPort_port, &ptype) || (ptype & 0x100000) != 0)
  {
    if ((GSGetPurpleSystemEventPort_port + 1) >= 2)
      mach_port_deallocate(*v0, GSGetPurpleSystemEventPort_port);
    v5 = 0;
    v1 = bootstrap_look_up2();
    v2 = v5;
    if (v1)
      v2 = 0;
    GSGetPurpleSystemEventPort_port = v2;
  }
  pthread_mutex_unlock(&GSGetPurpleSystemEventPort_portLock);
  return GSGetPurpleSystemEventPort_port;
}

uint64_t GSCopyPurpleNamedPerPIDPort()
{
  bootstrap_look_up2();
  if (bootstrap_look_up2())
    return 0;
  else
    return 0;
}

uint64_t GSRegisterPurpleNamedPort(const char *a1)
{
  return _GSRegisterPurpleNamedPortInPrivateNamespace(a1);
}

uint64_t _GSRegisterPurpleNamedPortInPrivateNamespace(const char *a1)
{
  ipc_space_t *v2;
  kern_return_t inserted;
  mach_error_t v4;
  char *v6;
  char *v7;
  mach_port_name_t name;

  name = 0;
  if (bootstrap_check_in2())
  {
    v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
    inserted = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
    if (inserted || (inserted = mach_port_insert_right(*v2, name, name, 0x14u)) != 0)
    {
      v4 = inserted;
    }
    else
    {
      v4 = bootstrap_register2();
      mach_port_deallocate(*v2, name);
      if (!v4)
        return name;
    }
    mach_port_mod_refs(*v2, name, 1u, -1);
    v7 = 0;
    v6 = mach_error_string(v4);
    asprintf(&v7, "Couldn't register %s with the bootstrap server. Error: %s (%d).\nThis generally means that another instance of this process was already running or is hung in the debugger.", a1, v6, v4);
    syslog(3, "%s %s", "_GSRegisterPurpleNamedPortInPrivateNamespace", v7);
    _GSWriteStackshot(v7);
    *MEMORY[0x1E0C9AA90] = v7;
    abort();
  }
  return name;
}

uint64_t GSRegisterPurpleNamedPerPIDPort(const char *a1)
{
  return _GSRegisterPurpleNamedPortInPrivateNamespace(a1);
}

uint64_t GSSetTimeEventHandling(uint64_t result)
{
  uint64_t v1;

  __timeEventHandling = result;
  if ((result & 1) == 0)
  {
    result = firstTimeBlock;
    if (firstTimeBlock)
    {
      do
      {
        v1 = *(_QWORD *)(result + 196616);
        free((void *)result);
        result = v1;
      }
      while (v1);
    }
    firstTimeBlock = 0;
  }
  return result;
}

uint64_t GSGetTimeEventHandling()
{
  return __timeEventHandling;
}

_QWORD *GSSaveEventHandlingTimes()
{
  _QWORD *result;

  if (__timeEventHandling)
    return saveEventTimes();
  return result;
}

_QWORD *saveEventTimes()
{
  uint64_t v0;
  char *IdentifierCString;
  pid_t v2;
  int v3;
  FILE *i;
  int *v5;
  uint64_t v6;
  double *v7;
  _QWORD *result;
  _QWORD *v9;
  char __str[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v0 = firstTimeBlock;
  IdentifierCString = GetIdentifierCString();
  v2 = getpid();
  v3 = saveEventTimes_fileCount++;
  snprintf(__str, 0x400uLL, "/tmp/%s-%d-%d.txt", IdentifierCString, v2, v3);
  for (i = fopen(__str, "w"); v0; v0 = *((_QWORD *)v5 + 1))
  {
    v5 = (int *)(v0 + 196608);
    if (i && *v5 >= 1)
    {
      v6 = 0;
      v7 = (double *)(v0 + 8);
      do
      {
        fprintf(i, "%f %f %f\n", *(v7 - 1), *v7, *v7 - *(v7 - 1));
        ++v6;
        v7 += 2;
      }
      while (v6 < *v5);
    }
  }
  if (i)
    fclose(i);
  result = (_QWORD *)firstTimeBlock;
  if (firstTimeBlock)
  {
    do
    {
      v9 = (_QWORD *)result[24577];
      free(result);
      result = v9;
    }
    while (v9);
  }
  firstTimeBlock = 0;
  return result;
}

void timingObserverCallback(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  CFAbsoluteTime Current;
  uint64_t v5;
  CFAbsoluteTime v6;
  uint64_t v7;
  uint64_t v8;

  if (firstTimeBlock)
  {
    if (*(int *)(currentTimeBlock + 196608) < 12288)
      goto LABEL_6;
    v3 = malloc_type_malloc(0x30010uLL, 0x10200404C3AE429uLL);
    *(_QWORD *)(currentTimeBlock + 196616) = v3;
  }
  else
  {
    v3 = malloc_type_malloc(0x30010uLL, 0x10200404C3AE429uLL);
    firstTimeBlock = (uint64_t)v3;
  }
  currentTimeBlock = (uint64_t)v3;
  v3[49152] = 0;
  *((_QWORD *)v3 + 24577) = 0;
LABEL_6:
  if (a2 == 1)
  {
LABEL_9:
    Current = CFAbsoluteTimeGetCurrent();
    v5 = currentTimeBlock + 16 * *(int *)(currentTimeBlock + 196608);
    *(CFAbsoluteTime *)v5 = Current;
    *(_QWORD *)(v5 + 8) = 0;
    return;
  }
  if (a2 != 128)
  {
    if (a2 != 64)
      return;
    goto LABEL_9;
  }
  v6 = CFAbsoluteTimeGetCurrent();
  v7 = currentTimeBlock;
  v8 = *(int *)(currentTimeBlock + 196608);
  *(CFAbsoluteTime *)(currentTimeBlock + 16 * v8 + 8) = v6;
  *(_DWORD *)(v7 + 196608) = v8 + 1;
}

void GSEventStopModal()
{
  __CFRunLoop *Current;

  __exitRunModal = 1;
  Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void GSEventPopRunLoopMode(const __CFString *a1)
{
  const __CFArray *v1;
  CFIndex Count;
  const __CFString *ValueAtIndex;
  __CFArray *v5;
  CFIndex v6;

  v1 = (const __CFArray *)__runLoopModeStack;
  if (__runLoopModeStack)
  {
    Count = CFArrayGetCount((CFArrayRef)__runLoopModeStack);
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, Count - 1);
    if (ValueAtIndex)
    {
      if (CFStringCompare(a1, ValueAtIndex, 0) == kCFCompareEqualTo)
      {
        v5 = (__CFArray *)__runLoopModeStack;
        v6 = CFArrayGetCount((CFArrayRef)__runLoopModeStack);
        CFArrayRemoveValueAtIndex(v5, v6 - 1);
      }
    }
  }
  CFRunLoopStop((CFRunLoopRef)__eventRunLoop);
}

uint64_t GSSendSystemAppEvent()
{
  GSGetPurpleSystemAppPort();
  return 268435459;
}

uint64_t _GSSendEvent(int *a1, int a2, int a3)
{
  size_t v6;
  int v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  size_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  char *v18;
  mach_msg_option_t v19;
  uint64_t v20;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  if (*a1 == 3001)
    v6 = 28 * *((unsigned __int8 *)a1 + 122) + 120;
  else
    v6 = a1[18] + 84;
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v22 - v8;
  if (v6 < 0x401)
  {
    v10 = (char *)v22 - v8;
  }
  else
  {
    v10 = (char *)malloc_type_malloc(v6, 0x1B5451E2uLL);
    v7 = *a1;
  }
  *((_DWORD *)v10 + 6) = v7;
  *((_DWORD *)v10 + 7) = a1[1];
  *((float32x4_t *)v10 + 2) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 2)), *(float64x2_t *)(a1 + 6));
  *((_DWORD *)v10 + 12) = 0;
  *((_DWORD *)v10 + 15) = 0;
  *((_DWORD *)v10 + 16) = a1[16];
  *((_DWORD *)v10 + 17) = 0;
  *((_DWORD *)v10 + 18) = v6 - 84;
  *(_QWORD *)(v10 + 76) = *((_QWORD *)a1 + 10);
  v11 = *((_QWORD *)a1 + 10);
  if (v11)
  {
    if (GetTimebase_once != -1)
      dispatch_once(&GetTimebase_once, &__block_literal_global_35);
    v12 = v11 * (unint64_t)GetTimebase___timebase / HIDWORD(GetTimebase___timebase);
  }
  else
  {
    v12 = GSCurrentEventTimestamp();
  }
  *(_QWORD *)(v10 + 52) = v12;
  v13 = *((unsigned int *)v10 + 18);
  if (*a1 == 3001 && v13 >= 0x28)
  {
    *((_DWORD *)v10 + 21) = a1[22];
    *((_WORD *)v10 + 44) = *((_WORD *)a1 + 46);
    *((_WORD *)v10 + 45) = *((_WORD *)a1 + 47);
    *((_DWORD *)v10 + 23) = a1[24];
    *((_DWORD *)v10 + 24) = a1[25];
    *((_DWORD *)v10 + 25) = a1[26];
    *((_DWORD *)v10 + 26) = a1[27];
    *((_DWORD *)v10 + 27) = a1[28];
    *((_DWORD *)v10 + 28) = a1[29];
    v10[116] = *((_BYTE *)a1 + 120);
    v10[117] = *((_BYTE *)a1 + 121);
    v14 = *((unsigned __int8 *)a1 + 122);
    v10[118] = v14;
    if (v14 && 8 * v14 + 40 <= v13)
    {
      v15 = 0;
      v16 = a1 + 32;
      v17 = 28 * v14;
      do
      {
        v18 = &v10[v15];
        v18[120] = *(_BYTE *)v16;
        *(_WORD *)(v18 + 121) = *(_WORD *)((char *)v16 + 1);
        *(_QWORD *)(v18 + 124) = *(_QWORD *)(v16 + 1);
        *(float32x2_t *)(v18 + 132) = vcvt_f32_f64(*((float64x2_t *)v16 + 1));
        *(_QWORD *)(v18 + 140) = v16[8];
        v15 += 28;
        v16 += 12;
      }
      while (v17 != v15);
    }
  }
  else
  {
    memcpy(v10 + 84, a1 + 22, v13);
  }
  *(_DWORD *)v10 = 19;
  *((_DWORD *)v10 + 1) = v6;
  *((_DWORD *)v10 + 2) = a2;
  *((_DWORD *)v10 + 3) = 0;
  if (a3)
    v19 = 1;
  else
    v19 = 17;
  *((_DWORD *)v10 + 4) = 0;
  *((_DWORD *)v10 + 5) = 123;
  v20 = mach_msg((mach_msg_header_t *)v10, v19, (v6 + 3) & 0xFFFFFFFC, 0, 0, 0, 0);
  if (v10 != v9)
    free(v10);
  return v20;
}

uint64_t GSSendSimpleEventWithSubtype(unsigned int a1, unsigned int a2, unsigned int a3)
{
  unsigned int v4[2];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4[0] = a1;
  v4[1] = a2;
  return GSSendEvent(v4, a3);
}

uint64_t GSSendSimpleEvent(unsigned int a1, unsigned int a2)
{
  unsigned int v3[2];
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v3[0] = a1;
  v3[1] = 0;
  return GSSendEvent(v3, a2);
}

uint64_t GSEventVibrateForDuration(int a1)
{
  unsigned int v1;
  unsigned int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  v3 = 1100;
  v9 = 0;
  v10 = a1;
  DWORD1(v8) = 4;
  v1 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v3, v1);
}

uint64_t GSEventStopVibrator()
{
  unsigned int v0;
  unsigned int v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  v3 = 0u;
  v8 = 0;
  v2 = 1100;
  DWORD1(v7) = 4;
  v0 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v2, v0);
}

uint64_t GSEventLockDevice()
{
  unsigned int v0;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = GSGetPurpleSystemEventPort();
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v3 = 0u;
  v2 = 1014;
  return GSSendEvent((unsigned int *)&v2, v0);
}

uint64_t GSEventResetIdleTimer()
{
  NSObject *v0;
  unsigned int v1;
  unsigned int v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (GSEventsIdleTimerLog_onceToken != -1)
    dispatch_once(&GSEventsIdleTimerLog_onceToken, &__block_literal_global_37);
  v0 = GSEventsIdleTimerLog_logTag;
  if (os_log_type_enabled((os_log_t)GSEventsIdleTimerLog_logTag, OS_LOG_TYPE_FAULT))
    GSEventResetIdleTimer_cold_1(v0);
  v9 = 0;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 0u;
  v3 = 100;
  v1 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v3, v1);
}

uint64_t GSEventAccessoryAvailabilityChanged(int a1, int a2)
{
  unsigned int v2;
  unsigned int v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v8 = 0u;
  v7 = 0u;
  v6 = 0u;
  v5 = 0u;
  v4 = 4000;
  v10 = 0;
  v11 = a1;
  DWORD1(v9) = 8;
  v12 = a2;
  v2 = GSGetPurpleSystemEventPort();
  return GSSendEvent(&v4, v2);
}

uint64_t GSEventGetAccessoryKeyStateInfo(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t GSEventCreateAccessoryKeyStateEvent(uint64_t result, int a2)
{
  if (result)
  {
    if ((*(_DWORD *)(result + 16) & 0xFFFDFFFF) == 0xFA1)
    {
      result = GSEventCopy(result);
      *(_DWORD *)(result + 80) = a2;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

double GSMainScreenPixelSize()
{
  if (*(float *)&__screenScale == 0.0)
    FetchScreenInfoFromCapabilities();
  return (float)__screenWidth;
}

CGFloat FetchScreenInfoFromCapabilities()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const __CFNumber *Value;
  const __CFNumber *v3;
  const __CFNumber *v4;
  const __CFNumber *v5;
  const __CFData *v6;
  const __CFData *v7;
  const UInt8 *BytePtr;
  unint64_t Length;
  const UInt8 *v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  BOOL v15;

  __screenScale = 1065353216;
  v0 = (const __CFDictionary *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    Value = (const __CFNumber *)CFDictionaryGetValue(v0, CFSTR("main-screen-width"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberIntType, &__screenWidth);
    v3 = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("main-screen-height"));
    if (v3)
      CFNumberGetValue(v3, kCFNumberIntType, &__screenHeight);
    v4 = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("main-screen-scale"));
    if (v4)
      CFNumberGetValue(v4, kCFNumberFloatType, &__screenScale);
    v5 = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("main-screen-orientation"));
    if (v5)
      CFNumberGetValue(v5, kCFNumberFloatType, &__screenOrientation);
    CFRelease(v1);
  }
  v6 = (const __CFData *)MGCopyAnswer();
  if (v6)
  {
    v7 = v6;
    BytePtr = CFDataGetBytePtr(v6);
    Length = CFDataGetLength(v7);
    if (Length >= 0x10)
    {
      v10 = &BytePtr[Length & 0xFFFFFFFFFFFFFFF0];
      v11 = *((double *)v10 - 2);
      v12 = *(float *)&__screenOrientation;
      if (fabs(*(float *)&__screenOrientation) >= 0.00000011920929
        && (fabs(v12 + -1.57079633) < 0.00000011920929 || fabs(v12 + -4.71238898) < 0.00000011920929))
      {
        v13 = *((double *)v10 - 1);
      }
      else
      {
        v13 = *((double *)v10 - 2);
        v11 = *((double *)v10 - 1);
      }
      if (v13 != (double)__screenWidth && v11 != (double)__screenHeight)
      {
        __screenWidth = (int)v13;
        __screenHeight = (int)v11;
      }
    }
    CFRelease(v7);
  }
  if (*(float *)&__screenScale == 1.0)
  {
    v14 = __screenHeight == 960 || __screenHeight == 1136;
    v15 = v14;
    if (__screenWidth == 640 && v15
      || __screenWidth == 1536 && __screenHeight == 2048
      || __screenWidth == 2048 && __screenHeight == 1536)
    {
      __screenScale = 0x40000000;
    }
  }
  return ResetTransforms();
}

double GSMainScreenPointSize()
{
  float v0;

  v0 = *(float *)&__screenScale;
  if (*(float *)&__screenScale == 0.0)
  {
    FetchScreenInfoFromCapabilities();
    v0 = *(float *)&__screenScale;
  }
  return (float)((float)__screenWidth / v0);
}

float GSMainScreenOrientation()
{
  if (*(float *)&__screenScale == 0.0)
    FetchScreenInfoFromCapabilities();
  return *(float *)&__screenOrientation;
}

double GSMainScreenWindowTransform@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;

  if (*(float *)&__screenScale == 0.0)
    FetchScreenInfoFromCapabilities();
  v2 = *(_OWORD *)&__screenWindowTransform[16];
  *a1 = *(_OWORD *)__screenWindowTransform;
  a1[1] = v2;
  result = *(double *)&__screenWindowTransform[32];
  a1[2] = *(_OWORD *)&__screenWindowTransform[32];
  return result;
}

double GSMainScreenPositionTransform@<D0>(_OWORD *a1@<X8>)
{
  __int128 v2;
  double result;

  if (*(float *)&__screenScale == 0.0)
    FetchScreenInfoFromCapabilities();
  v2 = *(_OWORD *)&__screenPositionTransform[16];
  *a1 = *(_OWORD *)__screenPositionTransform;
  a1[1] = v2;
  result = *(double *)&__screenPositionTransform[32];
  a1[2] = *(_OWORD *)&__screenPositionTransform[32];
  return result;
}

BOOL __GSEventEqual(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)(a1 + 16) == *(_DWORD *)(a2 + 16) && *(_QWORD *)(a1 + 64) == *(_QWORD *)(a2 + 64);
}

unint64_t __GSEventHash(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64) / 0x3E8uLL;
}

CFStringRef __GSEventCopyDescription(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator((CFTypeRef)a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<GSEvent %p>{type = %x, windowLoc = (%f, %f)}"), a1, *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void PurpleEventSignalCallback()
{
  _PurpleEventCallback(0);
}

uint64_t PurpleEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
    __lastRecievedPort = a4;
  if (a1)
    a1 = CreateWithMachMessage(a1);
  _PurpleEventCallback(a1);
  return 0;
}

uint64_t CreateWithMachMessage(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t Instance;
  float32x2_t v7;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _DWORD *v12;

  v1 = *(unsigned int *)(a1 + 4);
  if (v1 < 0x54)
    return 0;
  v3 = v1 - 84;
  if (*(_DWORD *)(a1 + 24) != 3001)
  {
    if (v3 >= *(unsigned int *)(a1 + 72))
      goto LABEL_9;
    return 0;
  }
  if (v3 < 0x24 || 28 * (unint64_t)*(unsigned __int8 *)(a1 + 118) + 36 > v3)
    return 0;
LABEL_9:
  Instance = _CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    *(_DWORD *)(Instance + 16) = *(_DWORD *)(a1 + 24);
    v7 = *(float32x2_t *)(a1 + 40);
    *(float64x2_t *)(Instance + 24) = vcvtq_f64_f32(*(float32x2_t *)(a1 + 32));
    *(_DWORD *)(Instance + 20) = *(_DWORD *)(a1 + 28);
    *(float64x2_t *)(Instance + 40) = vcvtq_f64_f32(v7);
    *(_DWORD *)(Instance + 56) = 0;
    *(_QWORD *)(Instance + 64) = *(_QWORD *)(a1 + 52);
    *(_QWORD *)(Instance + 72) = 0;
    *(_DWORD *)(Instance + 80) = *(_DWORD *)(a1 + 64);
    *(_DWORD *)(Instance + 84) = 0;
    v8 = *(unsigned int *)(a1 + 72);
    *(_DWORD *)(Instance + 88) = v8;
    *(_QWORD *)(Instance + 96) = *(_QWORD *)(a1 + 76);
    if (*(_DWORD *)(a1 + 24) == 3001)
    {
      *(_DWORD *)(Instance + 104) = *(_DWORD *)(a1 + 84);
      *(_WORD *)(Instance + 108) = *(_WORD *)(a1 + 88);
      *(_WORD *)(Instance + 110) = *(_WORD *)(a1 + 90);
      *(_DWORD *)(Instance + 112) = *(_DWORD *)(a1 + 92);
      *(_DWORD *)(Instance + 116) = *(_DWORD *)(a1 + 96);
      *(_DWORD *)(Instance + 120) = *(_DWORD *)(a1 + 100);
      *(_DWORD *)(Instance + 124) = *(_DWORD *)(a1 + 104);
      *(_DWORD *)(Instance + 128) = *(_DWORD *)(a1 + 108);
      *(_DWORD *)(Instance + 132) = *(_DWORD *)(a1 + 112);
      *(_BYTE *)(Instance + 136) = *(_BYTE *)(a1 + 116);
      *(_BYTE *)(Instance + 137) = *(_BYTE *)(a1 + 117);
      *(_BYTE *)(Instance + 138) = *(_BYTE *)(a1 + 118);
      if (*(_BYTE *)(a1 + 118))
      {
        v9 = 0;
        v10 = a1 + 120;
        v11 = (_QWORD *)(Instance + 184);
        do
        {
          *((_BYTE *)v11 - 40) = *(_BYTE *)v10;
          *(_WORD *)((char *)v11 - 39) = *(_WORD *)(v10 + 1);
          *(_QWORD *)((char *)v11 - 36) = *(_QWORD *)(v10 + 4);
          *(float64x2_t *)(v11 - 3) = vcvtq_f64_f32(*(float32x2_t *)(v10 + 12));
          *((_DWORD *)v11 - 2) = *(_DWORD *)(v10 + 20);
          *v11 = 0;
          v11 += 6;
          ++v9;
          v10 += 28;
        }
        while (v9 < *(unsigned __int8 *)(a1 + 118));
      }
    }
    else
    {
      memcpy((void *)(Instance + 104), (const void *)(a1 + 84), v8);
    }
    v12 = (_DWORD *)(((*(unsigned int *)(a1 + 4) + 3) & 0x1FFFFFFFCLL) + a1);
    if (!*v12 && v12[1] >= 0x20u)
      *(_DWORD *)(v4 + 84) = v12[10];
  }
  return v4;
}

void _PurpleEventCallback(uint64_t cf)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  BOOL v17;
  int v18;
  uint64_t *v20;
  _QWORD *v21;
  CFTypeRef *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  BOOL v32;
  CFTypeRef *v33;
  int v34;
  char v35;
  CFTypeRef v36;
  uint64_t v37;
  uint64_t v38;

  v1 = (char *)cf;
  if (cf && _queue)
  {
    PurplePushEvent(&_queue, cf);
    v1 = 0;
  }
  if (__lastRecievedPort)
  {
    v2 = ReceiveEvent(__lastRecievedPort);
    if (v2)
    {
      v3 = v2;
      do
      {
        PurplePushEvent(&_queue, v3);
        v3 = ReceiveEvent(__lastRecievedPort);
      }
      while (v3);
    }
  }
  if (!v1)
  {
    if (!_queue)
      return;
    v6 = *(_QWORD *)_queue;
    v1 = *(char **)(_queue + 8);
    free((void *)_queue);
    _queue = v6;
    if (v6)
    {
      if (v1)
        goto LABEL_9;
    }
    else
    {
      qword_1EF8FD120 = 0;
      if (v1)
        goto LABEL_9;
    }
    if (!v6)
      return;
    goto LABEL_97;
  }
LABEL_9:
  v4 = *((_DWORD *)v1 + 4);
  if (__disableHandEventCoalescing && v4 == 3001)
  {
    if (*((_DWORD *)v1 + 26) != 2)
      __disableHandEventCoalescing = 0;
LABEL_14:
    v5 = *((_DWORD *)v1 + 26);
    if (v5 != 2 && v5 != 5)
      goto LABEL_52;
    goto LABEL_22;
  }
  if ((v4 & 0xFFFDFFFF) == 0xBB9)
    goto LABEL_14;
  if ((v4 & 0xFFFDFFFF) - 5 <= 1)
  {
LABEL_22:
    v7 = _queue;
    if (!_queue)
      goto LABEL_52;
    v8 = (_QWORD *)_queue;
    while (1)
    {
      v9 = v8;
      v8 = (_QWORD *)*v8;
      v10 = (char *)v9[1];
      v11 = *((_DWORD *)v1 + 4);
      v12 = *((_DWORD *)v10 + 4);
      if (v11 == 3001 && v12 == 3001)
      {
        v13 = *((_DWORD *)v1 + 26);
        v14 = *((_DWORD *)v10 + 26);
        if (v13 != 5 && v14 != 5 && v13 == v14 && __disableHandEventCoalescing == 0)
        {
LABEL_43:
          CFRelease(v1);
          if ((_QWORD *)_queue == v9)
            v20 = &_queue;
          else
            v20 = (uint64_t *)v7;
          if ((_QWORD *)_queue == v9)
            v7 = (uint64_t)v8;
          *v20 = (uint64_t)v8;
          if ((_QWORD *)qword_1EF8FD120 == v9)
            qword_1EF8FD120 = v7;
          free(v9);
          v1 = v10;
          v9 = (_QWORD *)v7;
          goto LABEL_51;
        }
        v17 = v13 != 2 || v14 > 6;
        v18 = (1 << v14) & 0x62;
        if (!v17 && v18 != 0)
          goto LABEL_52;
      }
      else if (v11 == v12)
      {
        goto LABEL_43;
      }
LABEL_51:
      v7 = (uint64_t)v9;
      if (!v8)
        goto LABEL_52;
    }
  }
  if ((v4 & 0xFFFDFFFE) == 0x3F2)
  {
    v21 = (_QWORD *)_queue;
    v37 = 0;
    v38 = _queue;
    if (_queue)
    {
      v22 = 0;
      v23 = 0;
      do
      {
        v24 = (uint64_t)v21;
        v21 = (_QWORD *)*v21;
        v25 = *(_QWORD *)(v24 + 8);
        v26 = *((_DWORD *)v1 + 4);
        if (!v22)
        {
          v34 = *(_DWORD *)(v25 + 16);
          if (v26 == 1010 && v34 == 1011 || (v22 = 0, v26 == 1011) && v34 == 1010)
          {
            v37 = v38;
            v22 = (CFTypeRef *)v24;
          }
          goto LABEL_85;
        }
        v27 = *(_DWORD *)(v25 + 16);
        if (v26 == 3001 && v27 == 3001)
        {
          v28 = *((_DWORD *)v1 + 26);
          v29 = *(_DWORD *)(v25 + 104);
          if (v28 == 5 || v29 == 5)
            goto LABEL_85;
          v32 = v28 == v29 && __disableHandEventCoalescing == 0;
          if (v32)
            v33 = 0;
          else
            v33 = v22;
          if ((v32 & v23) == 1)
            goto LABEL_90;
        }
        else
        {
          v32 = v26 == v27;
          v35 = (v26 == v27) & v23;
          if (v32)
            v33 = 0;
          else
            v33 = v22;
          if ((v35 & 1) != 0)
          {
LABEL_90:
            v36 = *v22;
            RemoveNode((CFTypeRef *)v24, &v38, (uint64_t)v21);
            RemoveNode(v22, &v37, (uint64_t)*v22);
            v22 = 0;
            if (v36 == (CFTypeRef)v24)
              v38 = v37;
            v23 = 1;
            continue;
          }
        }
        v23 |= v32;
        v22 = v33;
LABEL_85:
        v38 = v24;
      }
      while (v21);
    }
  }
LABEL_52:
  *(_OWORD *)(v1 + 24) = *(_OWORD *)(v1 + 40);
  *((_QWORD *)v1 + 9) = 0;
  if (__timeEventHandling && *((_DWORD *)v1 + 4) == 2007)
    saveEventTimes();
  if (__eventCallBack)
    __eventCallBack(v1);
  CFRelease(v1);
  if (_queue)
  {
LABEL_97:
    if (__signalRunLoopSource)
      CFRunLoopSourceSignal((CFRunLoopSourceRef)__signalRunLoopSource);
  }
}

_QWORD *PurplePushEvent(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;
  _QWORD *v5;

  result = malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  *result = 0;
  result[1] = a2;
  v5 = (_QWORD *)a1[1];
  if (v5)
    *v5 = result;
  a1[1] = result;
  if (!*a1)
    *a1 = result;
  return result;
}

uint64_t ReceiveEvent(mach_port_name_t rcv_name)
{
  mach_msg_header_t *p_msg;
  mach_msg_return_t v3;
  mach_msg_size_t v4;
  mach_msg_header_t *v5;
  mach_msg_size_t v6;
  uint64_t v7;
  mach_msg_header_t msg;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&msg.msgh_bits = 0x40000000000;
  msg.msgh_remote_port = 0;
  msg.msgh_local_port = rcv_name;
  p_msg = &msg;
  v3 = mach_msg(&msg, 50331910, 0, 0x400u, rcv_name, 0, 0);
  if (v3 == 268451844)
  {
    v4 = ((msg.msgh_size + 3) & 0xFFFFFFFC) + 52;
    v5 = (mach_msg_header_t *)malloc_type_malloc(v4, 0x29910CD4uLL);
    if (v5)
    {
      p_msg = v5;
      v6 = v4;
    }
    else
    {
      v6 = 1024;
    }
    p_msg->msgh_bits = 0;
    p_msg->msgh_size = v6;
    p_msg->msgh_remote_port = 0;
    p_msg->msgh_local_port = rcv_name;
    v3 = mach_msg(p_msg, 2, 0, v6, rcv_name, 0, 0);
  }
  if (v3 == 268451843)
  {
    v7 = 0;
  }
  else
  {
    if (v3)
      ReceiveEvent_cold_1(v3);
    v7 = CreateWithMachMessage((uint64_t)p_msg);
  }
  if (p_msg != &msg)
    free(p_msg);
  return v7;
}

void RemoveNode(CFTypeRef *a1, uint64_t *a2, uint64_t a3)
{
  if ((CFTypeRef *)_queue == a1)
    _queue = a3;
  else
    a2 = (uint64_t *)*a2;
  *a2 = a3;
  if ((CFTypeRef *)qword_1EF8FD120 == a1)
    qword_1EF8FD120 = 0;
  CFRelease(a1[1]);
  free(a1);
}

void AddSourceForEventPort(uintptr_t handle, dispatch_queue_t queue)
{
  unsigned int v2;
  NSObject *v3;
  _QWORD handler[5];

  v2 = handle;
  if (queue)
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80D98], handle, 0, queue);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = ___AddDispatchSourceForEventPort_block_invoke;
    handler[3] = &__block_descriptor_tmp;
    handler[4] = v3;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_resume(v3);
  }
  else
  {
    _AddRunLoopSourceForEventPort(handle, (const __CFString *)*MEMORY[0x1E0C9B270]);
    _AddRunLoopSourceForEventPort(v2, CFSTR("GSEventReceiveRunLoopMode"));
  }
}

void _AddRunLoopSourceForEventPort(unsigned int a1, const __CFString *a2)
{
  __CFRunLoopSource *v3;
  CFRunLoopSourceContext context;

  context.version = 1;
  context.info = (void *)a1;
  memset(&context.retain, 0, 40);
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))GetPortForInfo;
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))PurpleEventCallback;
  v3 = CFRunLoopSourceCreate(0, -1, &context);
  CFRunLoopAddSource((CFRunLoopRef)__eventRunLoop, v3, a2);
  CFRelease(v3);
}

void _GSWriteStackshot(const char *a1)
{
  const char *v1;

  v1 = a1;
  if (_GSWriteStackshot_once == -1)
  {
    if (a1)
      goto LABEL_3;
  }
  else
  {
    dispatch_once(&_GSWriteStackshot_once, &__block_literal_global);
    if (v1)
    {
LABEL_3:
      if (*v1)
        goto LABEL_5;
    }
  }
  v1 = "(Unknown)";
LABEL_5:
  if (_GSWriteStackshot_dyfunc_WriteStackshotReport_stdc)
    _GSWriteStackshot_dyfunc_WriteStackshotReport_stdc(v1, 3131936839);
}

uint64_t DispatchThread(int a1)
{
  _opaque_pthread_t *v2;
  BOOL v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  uint64_t **ValueAtIndex;
  uint64_t **v8;
  uint64_t *v9;
  int *v10;
  uint64_t *v11;
  const __CFArray *v12;
  CFIndex FirstIndexOfValue;
  sched_param v15;
  CFRange v16;

  v15 = (sched_param)63;
  v2 = pthread_self();
  pthread_setschedparam(v2, 2, &v15);
  v3 = 0;
  while (1)
  {
    pthread_mutex_lock(&__dispatchQueuesLock);
    if (__dispatchQueues && (Count = CFArrayGetCount((CFArrayRef)__dispatchQueues), Count >= 1))
    {
      v5 = Count;
      v6 = 0;
      while (1)
      {
        ValueAtIndex = (uint64_t **)CFArrayGetValueAtIndex((CFArrayRef)__dispatchQueues, v6);
        if (*((_DWORD *)ValueAtIndex + 4) == a1)
          break;
        if (v5 == ++v6)
          goto LABEL_7;
      }
      v8 = ValueAtIndex;
    }
    else
    {
LABEL_7:
      v8 = 0;
    }
    v9 = *v8;
    if (!*v8)
      break;
    v11 = (uint64_t *)*v9;
    v10 = (int *)v9[1];
    free(v9);
    *v8 = v11;
    if (!v11)
      v8[1] = 0;
    pthread_mutex_unlock(&__dispatchQueuesLock);
    if (v10 != 0 && !v3)
    {
      v3 = _GSSendEvent(v10 + 4, a1, 1) == 268435459;
      goto LABEL_16;
    }
    if (v10)
LABEL_16:
      CFRelease(v10);
  }
  v12 = (const __CFArray *)__dispatchQueues;
  v16.length = CFArrayGetCount((CFArrayRef)__dispatchQueues);
  v16.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v12, v16, v8);
  CFArrayRemoveValueAtIndex((CFMutableArrayRef)__dispatchQueues, FirstIndexOfValue);
  free(v8);
  if (!CFArrayGetCount((CFArrayRef)__dispatchQueues))
  {
    CFRelease((CFTypeRef)__dispatchQueues);
    __dispatchQueues = 0;
  }
  pthread_mutex_unlock(&__dispatchQueuesLock);
  return 0;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t GSSystemHasCapability(const __CFString *a1)
{
  if (CFStringCompare(a1, CFSTR("explicitContentRestriction"), 0))
    abort();
  return MGGetBoolAnswer();
}

uint64_t GSKeyboardGetTypeID()
{
  return __kGSKeyboardTypeID;
}

uint64_t GSKeyboardHWKeyboardLayoutsPlist()
{
  uint64_t result;
  CFStringRef v1;
  const __CFString *v2;
  uint64_t v3;
  const char *v4;
  CFIndex v5;
  size_t v6;
  const __CFURL *v7;
  __CFReadStream *v8;
  CFPropertyListFormat format[2];

  format[1] = *(CFPropertyListFormat *)MEMORY[0x1E0C80C00];
  result = GSKeyboardHWKeyboardLayoutsPlist_plist;
  if (!GSKeyboardHWKeyboardLayoutsPlist_plist)
  {
    v1 = KeyboardLayoutsResourcePath();
    v2 = CFStringCreateWithFormat(0, 0, CFSTR("%@/USBKeyboardLayouts.plist"), v1);
    CFStringGetMaximumSizeOfFileSystemRepresentation(v2);
    MEMORY[0x1E0C80A78]();
    v4 = (char *)format - v3;
    CFStringGetFileSystemRepresentation(v2, (char *)format - v3, v5);
    v6 = strlen(v4);
    v7 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)v4, v6, 0);
    v8 = CFReadStreamCreateWithFile(0, v7);
    CFRelease(v2);
    CFRelease(v7);
    if (v8)
    {
      CFReadStreamOpen(v8);
      format[0] = 0;
      GSKeyboardHWKeyboardLayoutsPlist_plist = (uint64_t)CFPropertyListCreateWithStream(0, v8, 0, 0, format, 0);
      CFReadStreamClose(v8);
      CFRelease(v8);
      return GSKeyboardHWKeyboardLayoutsPlist_plist;
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "*** error: cannot create stream: %s\n", v4);
      return 0;
    }
  }
  return result;
}

CFStringRef KeyboardLayoutsResourcePath()
{
  CFStringRef result;
  const __CFString *v1;

  result = (CFStringRef)KeyboardLayoutsResourcePath_path;
  if (!KeyboardLayoutsResourcePath_path)
  {
    v1 = GSSystemRootDirectory();
    result = CFStringCreateWithFormat(0, 0, CFSTR("%@/System/Library/KeyboardLayouts/USBKeyboardLayouts.bundle"), v1);
    KeyboardLayoutsResourcePath_path = (uint64_t)result;
  }
  return result;
}

uint64_t GSKeyboardCreate(const __CFString *a1, int a2)
{
  return GSKeyboardCreateWithCountryCode(a1, a2, 0);
}

uint64_t GSKeyboardCreateWithCountryCode(const __CFString *a1, int a2, int a3)
{
  uint64_t Instance;
  uint64_t v7;
  int v8;
  void *v9;
  size_t v10;
  const __CFDictionary *Locale;
  void *v13;
  size_t v14;
  int v15;

  v15 = 0;
  v13 = 0;
  v14 = 0;
  if (!InitFileDataForLayoutName(a1, &v15, &v14, &v13))
    return 0;
  Instance = _CFRuntimeCreateInstance();
  v7 = Instance;
  if (Instance)
  {
    v8 = 2 * (a3 == 15);
    if (a2 != 255)
      v8 = a2;
    *(_DWORD *)(Instance + 16) = v15;
    v9 = v13;
    v10 = v14;
    *(_QWORD *)(Instance + 24) = v13;
    *(_QWORD *)(Instance + 32) = v10;
    *(_QWORD *)(Instance + 40) = v9;
    *(_DWORD *)(Instance + 48) = v8;
    *(_BYTE *)(Instance + 62) = a3;
    *(_QWORD *)(Instance + 52) = 0;
    *(_WORD *)(Instance + 60) = 0;
    if (a1)
    {
      *(_QWORD *)(Instance + 72) = CFRetain(a1);
      Locale = KeyboardLayoutCreateLocale((uint64_t)a1);
    }
    else
    {
      Locale = 0;
      *(_QWORD *)(v7 + 72) = 0;
    }
    *(_QWORD *)(v7 + 160) = Locale;
    *(_QWORD *)(v7 + 168) = 0;
    *(_QWORD *)(v7 + 144) = 0;
    *(_QWORD *)(v7 + 152) = 0;
    *(_DWORD *)(v7 + 64) = 1490092032;
    pthread_mutex_init((pthread_mutex_t *)(v7 + 80), 0);
  }
  else
  {
    munmap(v13, v14);
    close(v15);
  }
  return v7;
}

uint64_t InitFileDataForLayoutName(const __CFString *a1, int *a2, size_t *a3, _QWORD *a4)
{
  const __CFDictionary *v8;
  const void *Value;
  CFStringRef v10;
  const __CFString *v11;
  const __CFString *v12;
  char *v13;
  CFIndex v14;
  int v15;
  int v16;
  FILE *v17;
  int *v18;
  char *v19;
  FILE *v20;
  int *v21;
  char *v22;
  uint64_t result;
  size_t v24;
  unsigned int v25;
  void *v26;
  stat v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFDictionary *)GSKeyboardHWKeyboardLayoutsForName((uint64_t)a1);
  if (v8
    && (Value = CFDictionaryGetValue(v8, CFSTR("KeyLayoutFileName")),
        v10 = KeyboardLayoutsResourcePath(),
        (v11 = CFStringCreateWithFormat(0, 0, CFSTR("%@/uchrs/%@"), v10, Value)) != 0)
    || (v12 = GSSystemRootDirectory(),
        (v11 = CFStringCreateWithFormat(0, 0, CFSTR("%@/System/Library/CoreServices/SpringBoard.app/US.uchr"), v12)) != 0))
  {
    CFStringGetMaximumSizeOfFileSystemRepresentation(v11);
    v13 = (char *)&v27 - ((MEMORY[0x1E0C80A78]() + 16) & 0xFFFFFFFFFFFFFFF0);
    CFStringGetFileSystemRepresentation(v11, v13, v14);
    CFRelease(v11);
    v15 = open(v13, 0, 256);
    if (v15 < 0)
    {
      v20 = (FILE *)*MEMORY[0x1E0C80C10];
      v21 = __error();
      v22 = strerror(*v21);
      fprintf(v20, "GSKeyboardRef: file open error: %s, (%s)\n", v13, v22);
      return 0;
    }
    v16 = v15;
    memset(&v27, 0, sizeof(v27));
    if (stat(v13, &v27))
      goto LABEL_6;
    LODWORD(v24) = v27.st_size;
    if (!v27.st_size)
      goto LABEL_7;
    v25 = getpagesize();
    v24 = v24 % v25 ? v25 + v25 * (v24 / v25) : v24;
    v26 = mmap(0, v24, 1, 1, v16, 0);
    if ((_DWORD)v26 == -1)
    {
LABEL_6:
      v17 = (FILE *)*MEMORY[0x1E0C80C10];
      v18 = __error();
      v19 = strerror(*v18);
      fprintf(v17, "GSKeyboardRef: stat error: %s\n", v19);
LABEL_7:
      close(v16);
      return 0;
    }
    *a2 = v16;
    *a3 = v24;
    result = 1;
    *a4 = v26;
  }
  else
  {
    CFStringGetCString(a1, (char *)&v27, 127, 0x8000100u);
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "GSKeyboardRef: cannot find keylayout for: %s\n", (const char *)&v27);
    return 0;
  }
  return result;
}

const __CFDictionary *KeyboardLayoutCreateLocale(uint64_t a1)
{
  const __CFDictionary *result;
  const __CFString *Value;

  result = (const __CFDictionary *)GSKeyboardHWKeyboardLayoutsForName(a1);
  if (result)
  {
    Value = (const __CFString *)CFDictionaryGetValue(result, CFSTR("Locale"));
    return CFLocaleCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value);
  }
  return result;
}

void GSKeyboardRelease(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    v2 = *(const void **)(a1 + 144);
    if (v2)
      CFRelease(v2);
    v3 = *(const void **)(a1 + 152);
    if (v3)
      CFRelease(v3);
    v4 = *(const void **)(a1 + 168);
    if (v4)
      CFRelease(v4);
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 80));
    munmap(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32));
    close(*(_DWORD *)(a1 + 16));
    CFRelease((CFTypeRef)a1);
  }
}

uint64_t GSKeyboardReset(uint64_t result)
{
  uint64_t v1;
  pthread_mutex_t *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  if (result)
  {
    v1 = result;
    v2 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    v3 = *(const void **)(v1 + 144);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(v1 + 144) = 0;
    }
    v4 = *(const void **)(v1 + 152);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(v1 + 152) = 0;
    }
    v5 = *(const void **)(v1 + 168);
    if (v5)
    {
      CFRelease(v5);
      *(_QWORD *)(v1 + 168) = 0;
    }
    *(_WORD *)(v1 + 60) = 0;
    *(_QWORD *)(v1 + 52) = 0;
    return pthread_mutex_unlock(v2);
  }
  return result;
}

void GSKeyboardSetLayout(uint64_t a1, const __CFString *a2)
{
  pthread_mutex_t *v4;
  const __CFString *v5;
  void *v6;
  size_t v7;
  int v8;
  const void *v9;
  uint64_t v10;
  size_t v11;
  const void *v12;
  uint64_t v13;
  size_t v14;
  int v15;

  if (a1)
  {
    if (a2)
    {
      v4 = (pthread_mutex_t *)(a1 + 80);
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
      v5 = *(const __CFString **)(a1 + 72);
      pthread_mutex_unlock(v4);
      if (CFStringCompare(v5, a2, 0))
      {
        v15 = 0;
        v13 = 0;
        v14 = 0;
        if (InitFileDataForLayoutName(a2, &v15, &v14, &v13))
        {
          pthread_mutex_lock(v4);
          v6 = *(void **)(a1 + 24);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = *(_DWORD *)(a1 + 16);
          v9 = *(const void **)(a1 + 72);
          *(_DWORD *)(a1 + 16) = v15;
          v10 = v13;
          v11 = v14;
          *(_QWORD *)(a1 + 24) = v13;
          *(_QWORD *)(a1 + 32) = v11;
          *(_QWORD *)(a1 + 40) = v10;
          *(_DWORD *)(a1 + 52) = 0;
          *(_QWORD *)(a1 + 72) = CFRetain(a2);
          *(_QWORD *)(a1 + 160) = KeyboardLayoutCreateLocale((uint64_t)a2);
          v12 = *(const void **)(a1 + 168);
          if (v12)
          {
            CFRelease(v12);
            *(_QWORD *)(a1 + 168) = 0;
          }
          pthread_mutex_unlock(v4);
          munmap(v6, v7);
          close(v8);
          CFRelease(v9);
        }
      }
    }
  }
}

uint64_t GSKeyboardGetLayout(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(_QWORD *)(v1 + 72);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetLocale(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(_QWORD *)(v1 + 160);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardSetHardwareKeyboardAttached(uint64_t result, int a2)
{
  if (result)
    return GSEventSetHardwareKeyboardAttachedWithCountryCodeAndType(a2, *(unsigned __int8 *)(result + 62), *(unsigned __int8 *)(result + 48));
  return result;
}

uint64_t GSKeyboardSetTranslationOptions(uint64_t result, int a2)
{
  uint64_t v3;
  pthread_mutex_t *v4;

  if (result)
  {
    v3 = result;
    v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    if ((a2 & 1) == 0 && (*(_BYTE *)(v3 + 64) & 1) != 0)
    {
      *(_DWORD *)(v3 + 58) = 0;
      *(_WORD *)(v3 + 56) &= ~4u;
    }
    *(_DWORD *)(v3 + 64) = a2;
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t GSKeyboardGetTranslationOptions(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(unsigned int *)(v1 + 64);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetModifierState(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(unsigned __int16 *)(v1 + 56) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetLiveModifierState(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(unsigned __int16 *)(v1 + 58) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetStickyLockModifierState(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(unsigned __int16 *)(v1 + 60) << 16;
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardGetHWKeyboardType(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 48);
  if ((int)result <= 201)
  {
    switch((_DWORD)result)
    {
      case 0:
        LODWORD(result) = 202;
        goto LABEL_16;
      case 1:
        LODWORD(result) = 203;
        goto LABEL_16;
      case 2:
        LODWORD(result) = 207;
LABEL_16:
        if ((result - 204) >= 0xFFFFFFFE || (_DWORD)result == 207 || (_DWORD)result == 0)
          return result;
        else
          return 0;
    }
LABEL_13:
    if (result > 0xCF || (result - 194) >= 0xFFFFFF5D)
      LODWORD(result) = (((int)result - 1) % 3u) | 0xCC;
    goto LABEL_16;
  }
  if ((result - 202) > 5 || ((1 << (result + 54)) & 0x23) == 0)
    goto LABEL_13;
  return result;
}

uint64_t GSKeyboardSetLayoutContext(uint64_t result, const void *a2)
{
  uint64_t v3;
  pthread_mutex_t *v4;
  const void *v5;
  CFTypeRef v6;

  if (result)
  {
    v3 = result;
    v4 = (pthread_mutex_t *)(result + 80);
    pthread_mutex_lock((pthread_mutex_t *)(result + 80));
    v5 = *(const void **)(v3 + 168);
    if (v5 != a2)
    {
      if (v5)
        CFRelease(v5);
      if (a2)
        v6 = CFRetain(a2);
      else
        v6 = 0;
      *(_QWORD *)(v3 + 168) = v6;
    }
    return pthread_mutex_unlock(v4);
  }
  return result;
}

uint64_t GSKeyboardGetLayoutContext(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v2;

  v1 = a1;
  if (a1)
  {
    v2 = (pthread_mutex_t *)(a1 + 80);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
    v1 = *(_QWORD *)(v1 + 168);
    pthread_mutex_unlock(v2);
  }
  return v1;
}

uint64_t GSKeyboardHWKeyboardNormalizeInput(uint64_t a1, const void **a2, _DWORD *a3)
{
  pthread_mutex_t *v6;
  unsigned __int16 Value;
  unsigned int v8;
  UniChar v10[8];
  int v11;
  unsigned __int16 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  GSKeyboardEnsureHWKeyboardNormalizationMap(a1);
  Value = (unsigned __int16)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 144), *a2);
  if (Value)
  {
    v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 152), *a2);
    v12 = 8;
    MEMORY[0x1E0C80A78]();
    v11 = 0;
    if (!GSKeyTranslate(a1, Value, 0, 0, 1, &v11, 8u, &v12, (uint64_t)v10))
    {
      *a2 = (id)CFStringCreateWithCharacters((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, v12);
      *a3 |= v8;
    }
  }
  return pthread_mutex_unlock(v6);
}

void GSKeyboardEnsureHWKeyboardNormalizationMap(uint64_t a1)
{
  const __CFAllocator *v2;
  const CFDictionaryKeyCallBacks *v3;
  __CFDictionary *v4;
  uint64_t i;
  const void *v6;
  uint64_t j;
  CFStringRef v8;
  UniChar v9[12];
  CFMutableDictionaryRef Mutable;
  int v11;
  unsigned __int16 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a1 + 144))
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v3 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], 0);
    v4 = CFDictionaryCreateMutable(v2, 0, v3, 0);
    for (i = 0; i != 16; ++i)
    {
      v6 = (const void *)GSKeyboardEnsureHWKeyboardNormalizationMap_modifierCombinations[i];
      for (j = 4; j != 57; ++j)
      {
        v12 = 8;
        MEMORY[0x1E0C80A78]();
        v11 = 0;
        if (!GSKeyTranslate(a1, (unsigned __int16)j, 0, SWORD1(v6), 1, &v11, v12, &v12, (uint64_t)v9))
        {
          v8 = CFStringCreateWithCharacters(v2, v9, v12);
          if (!CFDictionaryContainsKey(v4, v8))
          {
            CFDictionarySetValue(v4, v8, v6);
            CFDictionarySetValue(Mutable, v8, (const void *)j);
          }
          CFRelease(v8);
        }
      }
    }
    *(_QWORD *)(a1 + 144) = Mutable;
    *(_QWORD *)(a1 + 152) = v4;
  }
}

uint64_t GSKeyTranslate(uint64_t a1, unsigned int a2, unsigned int a3, __int16 a4, char a5, int *a6, unsigned int a7, unsigned __int16 *a8, uint64_t a9)
{
  uint64_t v10;
  __int16 v11;
  unsigned __int8 v12;
  uint64_t result;
  int v17;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int HWKeyboardType;
  unsigned int *v25;
  int v26;
  unsigned int *v27;
  uint64_t v28;
  unsigned __int16 *v29;
  FILE **v30;
  unsigned int *v31;
  unsigned int v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  __int16 v38;
  uint64_t v39;
  _WORD *v40;
  uint64_t v41;
  uint64_t v42;
  unsigned __int16 *v43;
  _BOOL4 v45;
  int v46;
  int v47;
  unsigned __int16 *v48;
  unsigned int v49;
  unsigned int *v50;
  uint64_t v51;
  int v52;
  unsigned __int16 *v53;
  unsigned int v54;
  int v55;
  unsigned int *v56;
  int v57;
  __int16 v58;
  unsigned int v59;
  __int16 v60;
  unsigned __int16 v61;
  int v62;
  unsigned __int16 v63;
  unsigned __int16 v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  int v69;
  int v70;

  if (!a1)
    return 0xFFFFFFFFLL;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = a4 & 0xFAFE | 0x101;
  if ((a4 & 0x400) == 0)
    v11 = a4;
  if ((v11 & 0x100) != 0)
    LOBYTE(v11) = v11 & 0xFE | 1;
  if ((v11 & 0x80) != 0)
    LOBYTE(v11) = v11 & 0x6F | 0x10;
  if ((v11 & 0x20) != 0)
    LOBYTE(v11) = v11 & 0xDD | 2;
  if ((v11 & 0x40) != 0)
    v12 = v11 & 0xB7 | 8;
  else
    v12 = v11;
  if (!v10 || *(_WORD *)v10 != 4098)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a9)
  {
    if (a8)
    {
      if (a6)
      {
        if (a3 <= 3)
        {
          v17 = *(_DWORD *)(v10 + 8);
          if (v17)
          {
            *a8 = 0;
            v21 = (unsigned __int16)*a6;
            if (a3)
              v22 = 0;
            else
              v22 = (unsigned __int16)*a6;
            v23 = HIWORD(*a6);
            v70 = (unsigned __int16)*a6;
            if (a3 == 2)
              v21 = HIWORD(*a6);
            v67 = v21;
            if (a3 != 2)
              v23 = v22;
            v69 = v23;
            HWKeyboardType = GSKeyboardGetHWKeyboardType(a1);
            v25 = (unsigned int *)(v10 + 12);
            v26 = v17 - 1;
            if (v17 != 1)
            {
              v27 = (unsigned int *)(v10 + 40);
              while (HWKeyboardType < *v27 || HWKeyboardType > v27[1])
              {
                v27 += 7;
                if (!--v26)
                  goto LABEL_37;
              }
              v25 = v27;
            }
LABEL_37:
            v28 = v25[2];
            v29 = (unsigned __int16 *)(v10 + v28);
            v30 = (FILE **)MEMORY[0x1E0C80C10];
            if (v28 > 0x4000)
            {
              v31 = v25;
              fprintf((FILE *)*MEMORY[0x1E0C80C10], "GSKeyTranslate - uchr may be corrupt, keyLayoutPtr %08lX, keyModsToTableNumPtr %08lX, keyModifiersToTableNumOffset %08X\n", v10, v10 + v28, v28);
              v30 = (FILE **)MEMORY[0x1E0C80C10];
              v25 = v31;
            }
            if (*v29 != 12289)
            {
              fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyModifiersToTableNumFormat %04X\n", *v29);
              result = 0xFFFFFFFFLL;
              v33 = v69;
              v34 = v70;
LABEL_83:
              *a6 = v34 | (v33 << 16);
              return result;
            }
            if (v12 >= *((_DWORD *)v29 + 1))
              v32 = v29[1];
            else
              v32 = *((unsigned __int8 *)v29 + v12 + 8);
            v35 = v10 + v25[3];
            v34 = v70;
            if (*(_WORD *)v35 == 16385)
            {
              if (*(unsigned __int16 *)(v35 + 2) <= a2)
              {
                LOWORD(v37) = -1;
                v38 = -16385;
                v36 = a9;
              }
              else
              {
                v36 = a9;
                if (*(_DWORD *)(v35 + 4) <= v32)
                {
                  LOWORD(v37) = -1;
                  v38 = -16385;
                }
                else
                {
                  v37 = *(__int16 *)(v10 + *(unsigned int *)(v35 + 4 * v32 + 8) + 2 * a2);
                  v38 = v37 - 0x4000;
                  if (v37 >= 0x4000)
                  {
                    v39 = v25[4];
                    if ((_DWORD)v39)
                    {
                      v40 = (_WORD *)(v10 + v39);
                      if (*v40 == 20481)
                      {
                        v41 = v37 & 0x3FFF;
                        if (v41 >= (unsigned __int16)v40[1])
                        {
                          fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, stateRecordIndex %04X >= keyStateRecordCount %04X\n");
                        }
                        else
                        {
                          v42 = *(unsigned int *)&v40[2 * v41 + 2];
                          v43 = (unsigned __int16 *)(v10 + v42);
                          v45 = (a5 & 1) == 0 && a3 != 1;
                          if (v67)
                          {
                            v46 = v43[2];
                            if (v43[2])
                            {
                              v47 = v43[3];
                              if (v47 != 2)
                              {
                                if (v47 == 1)
                                {
                                  v48 = (unsigned __int16 *)(v42 + v10 + 10);
                                  while (1)
                                  {
                                    v49 = *(v48 - 1);
                                    if (v67 <= v49)
                                      break;
                                    --v46;
                                    v48 += 2;
                                    if (!(_WORD)v46)
                                      goto LABEL_101;
                                  }
                                  if (v67 == v49)
                                  {
                                    result = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v48, a7, a8, a9);
                                    v55 = 0;
LABEL_123:
                                    v33 = v69;
                                    if (a3 == 3 && v55 == 0)
                                    {
                                      v33 = 0x8000;
                                      v34 = 0;
                                    }
                                    else
                                    {
                                      v34 = v55;
                                    }
                                    goto LABEL_83;
                                  }
                                  goto LABEL_101;
                                }
                                fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, invalid stateEntryFormat %04X\n");
                                goto LABEL_66;
                              }
                              v53 = (unsigned __int16 *)(v42 + v10 + 14);
                              do
                              {
                                v54 = *(v53 - 3);
                                if (v67 < v54)
                                  break;
                                if (*((unsigned __int8 *)v53 - 4) + v54 >= v67)
                                {
                                  v58 = (v67 - v54) * *((unsigned __int8 *)v53 - 3);
                                  v59 = *(v53 - 1);
                                  if (v59 >= 0xFFFE)
                                    v60 = 0;
                                  else
                                    v60 = (v67 - v54) * *((unsigned __int8 *)v53 - 3);
                                  v61 = v60 + v59;
                                  v62 = *v53;
                                  v63 = v62 + v58;
                                  if (v62)
                                    v64 = v63;
                                  else
                                    v64 = 0;
                                  v65 = (uint64_t)v25;
                                  v66 = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, v61, a7, a8, a9);
                                  if (v45)
                                    v55 = v64;
                                  else
                                    v55 = 0;
                                  if (v66)
                                  {
                                    result = 0xFFFFFFFFLL;
                                  }
                                  else if ((a5 & 1) != 0 || (a3 | 2) == 3)
                                  {
                                    result = GSKeyEmitStateTerminator(v10, v65, v64, a7, a8, a9);
                                  }
                                  else
                                  {
                                    result = 0;
                                  }
                                  goto LABEL_123;
                                }
                                --v46;
                                v53 += 4;
                              }
                              while ((_WORD)v46);
                            }
LABEL_101:
                            if (a3 == 3
                              || (v56 = v25,
                                  v57 = GSKeyEmitStateTerminator(v10, (uint64_t)v25, v67, a7, a8, a9),
                                  v25 = v56,
                                  !v57))
                            {
                              result = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v43, a7, a8, a9);
                            }
                            else
                            {
                              result = 0xFFFFFFFFLL;
                            }
                            v33 = 0;
                            if (v45)
                              v34 = v43[1];
                            else
                              v34 = 0;
                            goto LABEL_83;
                          }
                          v68 = (uint64_t)v25;
                          v52 = GSKeyEmitCharOrSequence(v10, (uint64_t)v25, *v43, a7, a8, a9);
                          if (v45)
                            v34 = v43[1];
                          if (!v52)
                          {
                            if ((a5 & 1) != 0 || (a3 | 2) == 3)
                              result = GSKeyEmitStateTerminator(v10, v68, v43[1], a7, a8, a9);
                            else
                              result = 0;
                            goto LABEL_67;
                          }
                        }
                      }
                      else
                      {
                        fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyStateRecordsIndexFormat %04X\n");
                      }
                    }
                    else
                    {
                      fwrite("GSKeyTranslate - uchr may be corrupt, keyStateRecordsIndexOffset 0\n", 0x43uLL, 1uLL, *v30);
                    }
LABEL_66:
                    result = 0xFFFFFFFFLL;
LABEL_67:
                    v33 = v69;
                    goto LABEL_83;
                  }
                }
              }
              v33 = v69;
              if (v67)
              {
                if (a3 == 3)
                {
                  v33 = 0;
                  v34 = 0;
                }
                else
                {
                  v50 = v25;
                  v33 = 0;
                  if (GSKeyEmitStateTerminator(v10, (uint64_t)v25, v67, a7, a8, v36))
                  {
                    result = 0xFFFFFFFFLL;
                    v34 = 0;
                    goto LABEL_83;
                  }
                  v34 = 0;
                  v25 = v50;
                }
              }
              if (v38 < 0)
              {
                if ((unsigned __int16)v37 > 0xFFFDu)
                {
                  result = 0;
                }
                else
                {
                  v51 = *a8;
                  if (v51 >= a7)
                  {
                    result = 0xFFFFFFFFLL;
                  }
                  else
                  {
                    result = 0;
                    *a8 = v51 + 1;
                    *(_WORD *)(v36 + 2 * v51) = v37;
                  }
                }
              }
              else
              {
                result = GSKeyEmitSequence(v10, (uint64_t)v25, (unsigned __int16)v37, a7, a8, v36);
              }
              goto LABEL_83;
            }
            fprintf(*v30, "GSKeyTranslate - uchr may be corrupt, keyToCharTableIndexFormat %04X\n");
            goto LABEL_66;
          }
        }
      }
    }
  }
  return result;
}

uint64_t GSKeyboardGetKeyCodeForChar(uint64_t a1, int a2, unsigned int a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  BOOL v10;
  BOOL v11;
  int v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned __int16 v17[8];
  int v18;
  unsigned __int16 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (pthread_mutex_t *)(a1 + 80);
  v7 = pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  v8 = HIWORD(a3);
  v9 = 4;
  do
  {
    v19 = 8;
    MEMORY[0x1E0C80A78](v7);
    v18 = 0;
    v7 = GSKeyTranslate(a1, (unsigned __int16)v9, 0, v8, 1, &v18, v19, &v19, (uint64_t)v17);
    if ((_DWORD)v7)
      v10 = 1;
    else
      v10 = v19 == 0;
    v11 = !v10 && v17[0] == a2;
    v12 = v11;
    v13 = v9 + 1;
    if (v11)
      break;
    v10 = v9++ == 56;
  }
  while (!v10);
  v14 = v13 - 1;
  if (v12)
    v15 = v14;
  else
    v15 = 0xFFFFFFFFLL;
  pthread_mutex_unlock(v6);
  return v15;
}

uint64_t GSKeyboardTranslateKeyWithModifiers(uint64_t a1, int a2, unsigned int a3, int a4, char a5, unsigned int a6, unsigned __int16 *a7, uint64_t a8)
{
  __int16 v12;
  pthread_mutex_t *v16;
  int v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  int v22;

  v12 = HIWORD(a4);
  v16 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  if (a2 == 88)
    v17 = 40;
  else
    v17 = a2;
  if (a2 == 133)
    v18 = 54;
  else
    v18 = v17;
  if (a2 == 50)
    v19 = 49;
  else
    v19 = v18;
  if (a3 == 1)
  {
    v20 = 0;
  }
  else
  {
    v22 = 0;
    v20 = GSKeyTranslate(a1, v19, a3, v12, a5, &v22, a6, a7, a8);
  }
  pthread_mutex_unlock(v16);
  return v20;
}

uint64_t GSKeyboardTranslateKey(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, unsigned __int16 *a6, uint64_t a7, unsigned __int16 *a8, uint64_t a9, unsigned __int16 *a10, uint64_t a11)
{
  int v12;

  v12 = 0;
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a5, a6, a7, a8, a9, (unsigned __int16 *)&v12 + 1, 0, (unsigned __int16 *)&v12, 0, a10, a11, 7);
}

uint64_t GSKeyboardTranslateKeyExtendedCommand(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12, unsigned __int16 *a13, uint64_t a14)
{
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, 7);
}

uint64_t GSKeyboardTranslateKeyExtended(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12)
{
  unsigned __int16 v13;

  v13 = 0;
  return GSKeyboardTranslateKeyExtendedCommandWithUsagePage(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, &v13, 0, a11, a12, 7);
}

uint64_t GSKeyboardTranslateKeyExtendedCommandWithUsagePage(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned __int16 *a5, uint64_t a6, unsigned __int16 *a7, uint64_t a8, unsigned __int16 *a9, uint64_t a10, unsigned __int16 *a11, uint64_t a12, unsigned __int16 *a13, uint64_t a14, uint64_t a15)
{
  pthread_mutex_t *v23;
  unsigned int v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  BOOL v31;
  int v32;
  __int16 v33;
  __int16 v34;
  int v35;
  __int16 v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  __int16 v46;
  __int16 v47;
  int v49;
  pthread_mutex_t *v50;
  int *v51;
  int v52;

  v23 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  v24 = *(_DWORD *)(a1 + 64);
  switch(a2)
  {
    case 0xE0u:
    case 0xE4u:
      v25 = 16;
      a2 = 224;
      switch((v24 >> 22) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE1u:
    case 0xE5u:
      v25 = 16;
      a2 = 224;
      switch((v24 >> 19) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE2u:
    case 0xE6u:
      v25 = 16;
      a2 = 224;
      switch((v24 >> 25) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    case 0xE3u:
    case 0xE7u:
      v25 = 16;
      a2 = 224;
      switch((v24 >> 28) & 7)
      {
        case 1u:
          goto LABEL_9;
        case 2u:
          goto LABEL_12;
        case 3u:
          goto LABEL_16;
        case 4u:
          goto LABEL_13;
        case 5u:
          goto LABEL_14;
        default:
          goto LABEL_11;
      }
    default:
      if (!a2)
      {
LABEL_11:
        pthread_mutex_unlock(v23);
        return 0;
      }
      if (a2 == 57)
      {
        v25 = 16;
        a2 = 224;
        switch(HIWORD(v24) & 7)
        {
          case 1:
LABEL_9:
            if (a3)
            {
              *(_WORD *)(a1 + 58) &= ~4u;
              v26 = *(_WORD *)(a1 + 56);
            }
            else
            {
              v26 = *(_WORD *)(a1 + 56) ^ 4;
              *(_WORD *)(a1 + 56) = v26;
              *(_WORD *)(a1 + 58) |= 4u;
            }
            v25 = 4;
            a2 = 57;
            goto LABEL_49;
          case 2:
LABEL_12:
            v25 = 2;
            a2 = 225;
            goto LABEL_16;
          case 3:
            goto LABEL_16;
          case 4:
LABEL_13:
            v25 = 8;
            a2 = 226;
            goto LABEL_16;
          case 5:
LABEL_14:
            v25 = 1;
            a2 = 227;
            goto LABEL_16;
          default:
            goto LABEL_11;
        }
      }
      v25 = 0;
LABEL_16:
      v28 = a15 == 255;
      v29 = a15 == 65281;
      if (a2 == 3)
      {
        v30 = a15 == 65281;
      }
      else
      {
        v28 = 0;
        v30 = 0;
      }
      if (a2 != 48)
        v29 = 0;
      v31 = a15 == 12 && a2 == 669;
      v32 = v28 || v29;
      if (v31)
        v32 = 1;
      if (v30 | v32)
        v25 = 1024;
      if (!v25)
      {
        if ((v24 & 1) == 0)
          goto LABEL_41;
        v34 = *(_WORD *)(a1 + 60);
        *(_WORD *)(a1 + 56) &= v34;
        v33 = *(_WORD *)(a1 + 58) & v34;
        goto LABEL_40;
      }
      if ((v24 & 1) == 0)
      {
        if (a3)
        {
          *(_WORD *)(a1 + 56) &= ~(_WORD)v25;
          v33 = *(_WORD *)(a1 + 58) & ~(_WORD)v25;
LABEL_40:
          *(_WORD *)(a1 + 58) = v33;
          goto LABEL_41;
        }
        v37 = *(_WORD *)(a1 + 56) | v25;
LABEL_39:
        *(_WORD *)(a1 + 56) = v37;
        v33 = *(_WORD *)(a1 + 58) | v25;
        goto LABEL_40;
      }
      if (a3)
        goto LABEL_41;
      v35 = *(unsigned __int16 *)(a1 + 60);
      if ((v35 & v25) != 0)
      {
        *(_WORD *)(a1 + 56) &= ~(_WORD)v25;
        *(_WORD *)(a1 + 58) &= ~(_WORD)v25;
        v36 = v35 & ~(_WORD)v25;
      }
      else
      {
        v49 = *(unsigned __int16 *)(a1 + 56);
        if ((v49 & v25) == 0)
        {
          v37 = v49 | v25;
          goto LABEL_39;
        }
        v36 = v35 | v25;
      }
      *(_WORD *)(a1 + 60) = v36;
LABEL_41:
      v26 = *(_WORD *)(a1 + 56);
      switch(a2)
      {
        case 0x32u:
          a2 = 49;
          break;
        case 0x85u:
          v26 &= 0xFFDDu;
          a2 = 54;
          break;
        case 0x58u:
          a2 = 40;
          break;
      }
LABEL_49:
      v27 = 0;
      *a7 = 0;
      *a5 = 0;
      *a13 = 0;
      if (a3 != 1 && !v25)
      {
        v50 = v23;
        v38 = a6;
        v39 = v26;
        v51 = (int *)(a1 + 52);
        v27 = GSKeyTranslate(a1, a2, a3, v26, 0, (int *)(a1 + 52), a4, a5, v38);
        v40 = a2 & 0xFFFC;
        if (v38 && v40 == 108)
        {
          v41 = *a5;
          if (v41 < a4)
          {
            *a5 = v41 + 1;
            *(_WORD *)(v38 + 2 * v41) = 16;
          }
          *v51 = 0;
        }
        v52 = 0;
        GSKeyTranslate(a1, a2, 3u, 0, 1, &v52, a4, a7, a8);
        if (a8)
        {
          if (v40 == 108)
          {
            v42 = *a7;
            if (v42 < a4)
            {
              *a7 = v42 + 1;
              *(_WORD *)(a8 + 2 * v42) = 16;
            }
          }
        }
        if ((v39 & 0x22) != 0)
        {
          v52 = 0;
          GSKeyTranslate(a1, a2, 3u, v39 & 0x22, 1, &v52, a4, a9, a10);
          if (a9)
          {
            if (a10)
            {
              if (v40 == 108)
              {
                v43 = *a9;
                if (v43 < a4)
                {
                  *a9 = v43 + 1;
                  *(_WORD *)(a10 + 2 * v43) = 16;
                }
              }
            }
          }
        }
        else
        {
          *a9 = 0;
        }
        if ((v39 & 0x501) != 0)
        {
          v52 = 0;
          GSKeyTranslate(a1, a2, 3u, 257, 1, &v52, a4, a11, a12);
          if (a11)
          {
            if (a12)
            {
              if (v40 == 108)
              {
                v44 = *a11;
                if (v44 < a4)
                {
                  *a11 = v44 + 1;
                  *(_WORD *)(a12 + 2 * v44) = 16;
                }
              }
            }
          }
        }
        else
        {
          *a11 = 0;
        }
        v45 = *v51;
        if ((unsigned __int16)*v51)
        {
          v52 = *v51;
          GSKeyTranslate(a1, a2, 1u, v39, 0, &v52, a4, a13, a14);
          LOWORD(v45) = *(_WORD *)(a1 + 52);
        }
        v23 = v50;
        v46 = *(_WORD *)(a1 + 56);
        if ((_WORD)v45)
        {
          *(_WORD *)(a1 + 56) = v46 | 0x200;
          v47 = *(_WORD *)(a1 + 58) | 0x200;
        }
        else
        {
          *(_WORD *)(a1 + 56) = v46 & 0xFDFF;
          v47 = *(_WORD *)(a1 + 58) & 0xFDFF;
        }
        *(_WORD *)(a1 + 58) = v47;
      }
      pthread_mutex_unlock(v23);
      return v27;
  }
}

uint64_t GSKeyboardIsGlobeKeyUsagePair(uint64_t a1, uint64_t a2)
{
  _BOOL4 v2;
  _BOOL4 v3;
  _BOOL4 v4;
  BOOL v5;
  int v6;

  v2 = a1 == 255;
  v3 = a1 == 65281;
  if (a2 == 3)
  {
    v4 = a1 == 65281;
  }
  else
  {
    v2 = 0;
    v4 = 0;
  }
  if (a2 != 48)
    v3 = 0;
  v5 = a1 == 12 && a2 == 669;
  v6 = v2 || v3;
  if (v5)
    v6 = 1;
  return v4 | v6;
}

BOOL __GSKeyboardEqual(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40);
}

CFStringRef __GSKeyboardCopyDescription(_QWORD *a1)
{
  const __CFAllocator *v2;

  v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("<GSKeyboard %p>{layout = %p}"), a1, a1[5]);
}

uint64_t GSKeyboardHWKeyboardLayoutsForName(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;

  if (!a1)
    return 0;
  if (GSKeyboardHWKeyboardLayoutsForName_onceToken != -1)
    dispatch_once(&GSKeyboardHWKeyboardLayoutsForName_onceToken, &__block_literal_global_0);
  v2 = (void *)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts;
  objc_sync_enter((id)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts);
  v3 = objc_msgSend((id)GSKeyboardHWKeyboardLayoutsForName_loadedHWLayouts, "objectForKey:", a1);
  if (!v3)
  {
    v5 = -[__CFString stringByAppendingPathComponent:]((id)KeyboardLayoutsResourcePath(), "stringByAppendingPathComponent:", CFSTR("USBKeyboardLayouts.plist"));
    if (v5)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, 0);
      if (v6)
      {
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", a1, 0);
        _CFPropertyListCreateFiltered();
        v3 = 0;

      }
    }
  }
  objc_sync_exit(v2);
  return v3;
}

void sub_1C8909214(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t GSKeyEmitStateTerminator(uint64_t a1, uint64_t a2, int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6;
  unsigned __int16 *v7;
  int v8;

  v6 = *(unsigned int *)(a2 + 20);
  if (!(_DWORD)v6)
    return 0;
  v7 = (unsigned __int16 *)(a1 + v6);
  v8 = *v7;
  if (v8 == 24577)
  {
    if (a3 && v7[1] > (unsigned __int16)(a3 - 1))
      return GSKeyEmitCharOrSequence(a1, a2, v7[(unsigned __int16)(a3 - 1) + 2], a4, a5, a6);
    return 0;
  }
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "GSKeyTranslate - uchr may be corrupt, keyStateTerminatorsFormat %04X\n", v8);
  return 0xFFFFFFFFLL;
}

uint64_t GSKeyEmitSequence(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6;
  unsigned __int16 *v7;
  int v8;
  unsigned __int16 *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t result;
  unsigned int v14;
  _WORD *v15;
  __int16 *v16;
  __int16 v17;
  uint64_t v18;

  v6 = *(unsigned int *)(a2 + 24);
  if (!(_DWORD)v6)
    goto LABEL_14;
  v7 = (unsigned __int16 *)(a1 + v6);
  v8 = *v7;
  if (v8 != 28673)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "GSKeyTranslate - uchr may be corrupt, keySequenceDataIndexFormat %04X\n", v8);
    return 0xFFFFFFFFLL;
  }
  if ((a3 & 0x3FFF) >= v7[1])
  {
LABEL_14:
    if (a3 > 0xFFFD)
      return 0;
    v18 = (unsigned __int16)*a5;
    if (v18 < a4)
    {
      result = 0;
      *a5 = v18 + 1;
      *(_WORD *)(a6 + 2 * v18) = a3;
      return result;
    }
    return 0xFFFFFFFFLL;
  }
  v9 = &v7[a3 & 0x3FFF];
  v10 = v9[2];
  v11 = (v9[3] - v10) >> 1;
  v12 = (unsigned __int16)*a5;
  if ((unsigned __int16)v11 <= (unsigned __int16)(a4 - v12))
    result = 0;
  else
    result = 0xFFFFFFFFLL;
  if ((unsigned __int16)v11 <= (unsigned __int16)(a4 - v12))
    v14 = (v9[3] - v10) >> 1;
  else
    v14 = a4 - v12;
  *a5 = v14 + v12;
  if ((_WORD)v14)
  {
    v15 = (_WORD *)(a6 + 2 * v12);
    v16 = (__int16 *)((char *)v7 + v10);
    do
    {
      --v14;
      v17 = *v16++;
      *v15++ = v17;
    }
    while ((_WORD)v14);
  }
  return result;
}

uint64_t GSKeyEmitCharOrSequence(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _WORD *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t result;

  if ((__int16)a3 < -16384)
    return GSKeyEmitSequence(a1, a2, a3, a4, a5, a6);
  if (a3 > 0xFFFD)
    return 0;
  v6 = (unsigned __int16)*a5;
  if (v6 >= a4)
    return 0xFFFFFFFFLL;
  result = 0;
  *a5 = v6 + 1;
  *(_WORD *)(a6 + 2 * v6) = a3;
  return result;
}

const __CFString *GSSystemRootDirectory()
{
  return CFSTR("/");
}

void GSGetPurpleApplicationPort_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C8902000, MEMORY[0x1E0C81028], a3, "GSGetPurpleApplicationPort() is no longer supported, and always returns MACH_PORT_NULL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _GSEventInitializeApp_cold_1()
{
  fputs("Unable to determine CFBundleIdentifier or process name for current process\n", (FILE *)*MEMORY[0x1E0C80C10]);
  *MEMORY[0x1E0C9AA90] = "Unable to determine CFBundleIdentifier or process name for current process\n";
  abort();
}

void _GSEventInitializeApp_cold_2(char **a1)
{
  *a1 = 0;
  asprintf(a1, "CFBundleIdentifier must be less than %i UTF8 bytes\n", 128);
  fputs(*a1, (FILE *)*MEMORY[0x1E0C80C10]);
  *MEMORY[0x1E0C9AA90] = *a1;
  abort();
}

void GSGetPurpleSystemAppPort_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1C8902000, MEMORY[0x1E0C81028], a3, "GSGetPurpleSystemAppPort() is no longer supported, and always returns MACH_PORT_NULL.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void GSEventResetIdleTimer_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C8902000, log, OS_LOG_TYPE_FAULT, "See rdar://56333187 - Call to deprecated GSEventResetIdleTimer() which will be removed in iOS 14.0. See the radar for replacement options.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void ReceiveEvent_cold_1(int a1)
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "mach_msg() error %x\n", a1);
  abort();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98810](allocator, callout, context, shouldFreeInfo);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
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

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C60](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D00](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGFontDBSetInitializer()
{
  return MEMORY[0x1E0C9C7B8]();
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D528]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x1E0C9D530](dict, point);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

uint64_t bootstrap_check_in2()
{
  return MEMORY[0x1E0C81700]();
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

uint64_t bootstrap_register2()
{
  return MEMORY[0x1E0C81728]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F30](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
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

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int getpagesize(void)
{
  return MEMORY[0x1E0C83740]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
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

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setschedparam(pthread_t a1, int a2, const sched_param *a3)
{
  return MEMORY[0x1E0C84F10](a1, *(_QWORD *)&a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
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

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

