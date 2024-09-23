uint64_t IOSurfaceAcceleratorSetCustomFilter(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, uint64_t a8)
{
  uint64_t result;
  _OWORD v10[2];

  memset(v10, 0, sizeof(v10));
  result = prepareCustomFilter(a2, a3, a4, a5, a6, a7, a8, (uint64_t)v10);
  if (!(_DWORD)result)
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 4u, v10, 0x20uLL, 0, 0);
  return result;
}

uint64_t prepareCustomFilter(int a1, int a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  if (a1 && a2 && a3 && a4 && a5 && a6 && a7 && a8)
  {
    v8 = 0;
    *(_DWORD *)a8 = a1;
    *(_DWORD *)(a8 + 4) = a2;
    *(_DWORD *)(a8 + 8) = a3;
    *(_DWORD *)(a8 + 12) = a4;
    *(_DWORD *)(a8 + 16) = a5;
    *(_DWORD *)(a8 + 20) = a6;
    *(_QWORD *)(a8 + 24) = a7;
  }
  else
  {
    v8 = 3758097090;
    if (log_level_enabled(1u, 0))
      log_msg(1, 0, 255, (uint64_t)"prepareCustomFilter", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 986, (uint64_t)"Missing custom filter setting", v9, v11);
  }
  return v8;
}

uint64_t ioSurfaceAcceleratorFinalize(uint64_t a1)
{
  IONotificationPort *v2;
  uint64_t v3;

  v2 = *(IONotificationPort **)(a1 + 16);
  if (v2)
    IONotificationPortDestroy(v2);
  v3 = *(unsigned int *)(a1 + 36);
  if ((_DWORD)v3)
    v3 = IOServiceClose(v3);
  return log_stop(v3);
}

uint64_t IOSurfaceAcceleratorCreate(uint64_t a1, const __CFDictionary *a2, uint64_t *a3)
{
  uint64_t Instance;
  int Strength;
  uint32_t v7;
  const char *v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  const __CFNumber *v11;
  mach_port_t v12;
  const __CFDictionary *v13;
  io_service_t MatchingService;
  uint64_t v15;
  const __CFDictionary *v16;
  io_connect_t v17;
  __int128 valuePtr;
  uint64_t v20;
  io_connect_t connect;

  valuePtr = xmmword_206286EE8;
  v20 = 500000;
  *a3 = 0;
  if (!kIOSurfaceAcceleratorID)
    pthread_once(&IOSurfaceAcceleratorGetTypeID_once, (void (*)(void))ioSurfaceAcceleratorClassInitialize);
  connect = 0;
  Instance = _CFRuntimeCreateInstance();
  *(_QWORD *)(Instance + 24) = 0;
  *(_QWORD *)(Instance + 32) = 0;
  *(_QWORD *)(Instance + 16) = 0;
  *(_DWORD *)(Instance + 44) = 0;
  if (a2)
  {
    if (CFDictionaryGetValue(a2, CFSTR("Sharpener")))
    {
      Strength = srs_getStrength(a2);
      *(_DWORD *)(Instance + 44) = 1;
      v7 = Strength | 0xB00000;
      v8 = "AppleSRSDriver";
    }
    else
    {
      v7 = 0;
      v8 = "AppleM2ScalerCSCDriver";
    }
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("PriorityBand"));
    if (Value)
      CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
    v10 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("DutyCycleDuration"));
    if (v10)
      CFNumberGetValue(v10, kCFNumberSInt64Type, (char *)&valuePtr + 8);
    v11 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("HistogramDuration"));
    if (v11)
      CFNumberGetValue(v11, kCFNumberSInt64Type, &v20);
  }
  else
  {
    v7 = 0;
    v8 = "AppleM2ScalerCSCDriver";
  }
  if (checkIsVirtualized_once != -1)
    dispatch_once(&checkIsVirtualized_once, &__block_literal_global);
  v12 = *MEMORY[0x24BDD8B18];
  if (checkIsVirtualized_is_virtualized)
  {
    v13 = IOServiceMatching("AppleM2ScalerParavirtDriver");
    MatchingService = IOServiceGetMatchingService(v12, v13);
    if (!MatchingService)
    {
      v15 = 3758097088;
      fwrite("IOServiceMatchingfailed for: AppleM2ScalerParavirtDriver\n", 0x39uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
LABEL_28:
      CFRelease((CFTypeRef)Instance);
      return v15;
    }
  }
  else
  {
    v16 = IOServiceMatching(v8);
    MatchingService = IOServiceGetMatchingService(v12, v16);
    if (!MatchingService)
    {
      v15 = 3758097088;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "IOServiceMatchingfailed for: %s\n", v8);
      goto LABEL_28;
    }
  }
  v15 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], v7, &connect);
  if ((_DWORD)v15)
    goto LABEL_28;
  v17 = connect;
  *(_DWORD *)(Instance + 32) = MatchingService;
  *(_DWORD *)(Instance + 36) = v17;
  *a3 = Instance;
  if (checkIsVirtualized_once != -1)
    dispatch_once(&checkIsVirtualized_once, &__block_literal_global);
  if (!checkIsVirtualized_is_virtualized
    && IOConnectCallStructMethod(*(_DWORD *)(Instance + 36), 0xAu, &valuePtr, 0x18uLL, 0, 0))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Failed to set client property for: %s\n", v8);
  }
  return 0;
}

uint64_t IOSurfaceAcceleratorTransformSurface(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  _OWORD v11[27];

  memset(v11, 0, sizeof(v11));
  if (a6)
  {
    *(_OWORD *)((char *)v11 + 8) = *(_OWORD *)a6;
    *((_QWORD *)&v11[1] + 1) = *(_QWORD *)(a6 + 16);
  }
  prepareTransformRectangles(a5, (uint64_t)v11);
  result = prepareTransformBuffersAndOptions(a2, a3, a4, 0, (uint64_t)v11);
  if (!(_DWORD)result)
    return transformSurface(a1, (char *)v11, a4);
  return result;
}

uint64_t transformSurface(uint64_t a1, char *inputStruct, CFDictionaryRef theDict)
{
  const __CFString *Value;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  int v11;
  uint64_t v12;
  const __CFString *v14;
  const __CFString *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  size_t outputStructCnt;
  _OWORD outputStruct[5];
  uint64_t v21;
  uint64_t inputStructa;
  __int128 v23;
  uint64_t v24;
  int v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  if (*(_DWORD *)(a1 + 44) != 1)
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 1u, inputStruct, 0x1B0uLL, 0, 0);
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v21 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  outputStructCnt = 88;
  inputStructa = *(_QWORD *)inputStruct;
  v23 = *(_OWORD *)(inputStruct + 8);
  v24 = *((_QWORD *)inputStruct + 3);
  v25 = 0;
  Value = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("SharpenerMode"));
  if (!Value)
    goto LABEL_7;
  v6 = Value;
  v7 = 1;
  if (CFStringCompare(Value, CFSTR("SharpenerMode_Static"), 1uLL) == kCFCompareEqualTo)
    goto LABEL_8;
  if (CFStringCompare(v6, CFSTR("SharpenerMode_Dynamic"), 1uLL))
  {
    if (log_level_enabled(2u, 0))
      log_msg(2, 0, 255, (uint64_t)"srs_getMode", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 335, (uint64_t)"unknown sharpener mode\n", v8, v18);
LABEL_7:
    v7 = 1;
    goto LABEL_8;
  }
  v7 = 0;
LABEL_8:
  v26 = v7;
  HIDWORD(v27) = getpid();
  LODWORD(v27) = srs_getStrength(theDict);
  v9 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("SharpenerSourceCleaness"));
  if (!v9)
  {
LABEL_14:
    v11 = 1;
    goto LABEL_19;
  }
  v10 = v9;
  if (CFStringCompare(v9, CFSTR("SharpenerSourceCleaness_Noisy"), 1uLL))
  {
    v11 = 1;
    if (CFStringCompare(v10, CFSTR("SharpenerSourceCleaness_Normal"), 1uLL) == kCFCompareEqualTo)
      goto LABEL_19;
    if (CFStringCompare(v10, CFSTR("SharpenerSourceCleaness_Clean"), 1uLL))
    {
      if (log_level_enabled(2u, 0))
        log_msg(2, 0, 255, (uint64_t)"srs_getSourceCleaness", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 399, (uint64_t)"unknown sharpener cleaness\n", v12, v18);
      goto LABEL_14;
    }
    v11 = 2;
  }
  else
  {
    v11 = 0;
  }
LABEL_19:
  DWORD1(v27) = v11;
  v14 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("SharpenerSourceSharpness"));
  if (!v14)
  {
LABEL_24:
    v16 = 1;
    goto LABEL_26;
  }
  v15 = v14;
  if (CFStringCompare(v14, CFSTR("SharpenerSourceSharpness_Blur"), 1uLL) == kCFCompareEqualTo)
  {
    v16 = 0;
    goto LABEL_26;
  }
  v16 = 1;
  if (CFStringCompare(v15, CFSTR("SharpenerSourceSharpness_Sharp"), 1uLL))
  {
    if (log_level_enabled(2u, 0))
      log_msg(2, 0, 255, (uint64_t)"srs_getSourceSharpness", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 426, (uint64_t)"unknown sharpener sharpness\n", v17, v18);
    goto LABEL_24;
  }
LABEL_26:
  DWORD2(v27) = v16;
  return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 1u, &inputStructa, 0x58uLL, outputStruct, &outputStructCnt);
}

__n128 prepareTransformRectangles(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  if (a1)
  {
    *(_OWORD *)(a2 + 40) = *(_OWORD *)a1;
    result = *(__n128 *)(a1 + 16);
    v3 = *(_OWORD *)(a1 + 32);
    *(__n128 *)(a2 + 56) = result;
    *(_OWORD *)(a2 + 96) = v3;
  }
  return result;
}

uint64_t prepareTransformBuffersAndOptions(__IOSurface *a1, IOSurfaceRef buffer, const __CFDictionary *a3, char a4, uint64_t a5)
{
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  const __CFArray *Value;
  CFIndex Count;
  CFIndex v21;
  CFIndex i;
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v24;
  CFTypeID v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  const __CFArray *v30;
  const __CFArray *v31;
  CFIndex v32;
  CFIndex v33;
  CFIndex v34;
  const __CFData *v35;
  const __CFData *v36;
  CFIndex Length;
  CFIndex v38;
  const UInt8 *BytePtr;
  const UInt8 *v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t v46;
  CFTypeRef v47;
  const void *v48;
  int v49;
  uint64_t BulkAttachments;
  char v52;
  uint64_t v53;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69[2];
  unsigned int v70[2];
  unsigned int v71[2];
  unsigned int v72[2];
  unint64_t v73;
  unint64_t valuePtr[7];
  char v75;

  if (!buffer || !a1 || !a5)
  {
    v12 = 3758097090;
    if (!log_level_enabled(1u, 0))
      return v12;
    v14 = "Missing transform buffer reference";
    v15 = 1029;
LABEL_133:
    log_msg(1, 0, 255, (uint64_t)"prepareTransformBuffersAndOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", v15, (uint64_t)v14, v13, v61);
    return v12;
  }
  *(_QWORD *)(a5 + 88) = 0;
  *(_DWORD *)(a5 + 4) = IOSurfaceGetID(buffer);
  *(_DWORD *)a5 = IOSurfaceGetID(a1);
  *(_DWORD *)(a5 + 72) = IOSurfaceGetWidth(a1);
  *(_DWORD *)(a5 + 76) = IOSurfaceGetHeight(a1);
  *(_DWORD *)(a5 + 112) = IOSurfaceGetWidth(buffer);
  *(_DWORD *)(a5 + 116) = IOSurfaceGetHeight(buffer);
  *(_QWORD *)(a5 + 80) = 0;
  if (!a3)
  {
    *(_QWORD *)(a5 + 32) |= 0x2000uLL;
LABEL_117:
    v47 = IOSurfaceCopyValue(buffer, (CFStringRef)*MEMORY[0x24BDD8E48]);
    if (v47)
    {
      v48 = v47;
      if (CFEqual(v47, (CFTypeRef)*MEMORY[0x24BDD8E70]) || CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E68]))
      {
        v12 = 0;
        v49 = 1;
      }
      else if (CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E60]))
      {
        v12 = 0;
        v49 = 2;
      }
      else if (CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E80]))
      {
        v12 = 0;
        v49 = 3;
      }
      else if (CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E78]))
      {
        v12 = 0;
        v49 = 4;
      }
      else if (CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E58]))
      {
        v12 = 0;
        v49 = 5;
      }
      else if (CFEqual(v48, (CFTypeRef)*MEMORY[0x24BDD8E50]))
      {
        v12 = 0;
        v49 = 6;
      }
      else
      {
        v12 = 3758097090;
        if (log_level_enabled(1u, 0))
          log_msg(1, 0, 255, (uint64_t)"setCositeControl", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 916, (uint64_t)"Invalid cositing control", v60, v61);
        v49 = 0;
      }
      CFRelease(v48);
    }
    else
    {
      v73 = 116;
      BulkAttachments = IOSurfaceGetBulkAttachments();
      v12 = BulkAttachments;
      if (v73 == 116 && (_DWORD)BulkAttachments == 0)
        v52 = v75 - 1;
      else
        v52 = -1;
      if (v52 > 6u)
        v49 = 0;
      else
        v49 = dword_206286ECC[v52];
    }
    if (!(_DWORD)v12 && v49)
      *(_QWORD *)(a5 + 32) |= (v49 << 15);
    if (!(_DWORD)v12 && (a4 & 1) == 0)
    {
      v12 = 0;
      *(_QWORD *)(a5 + 32) |= 0x1000uLL;
    }
    return v12;
  }
  *(_QWORD *)v71 = 0;
  *(_QWORD *)v72 = 0;
  *(_QWORD *)v69 = 0;
  *(_QWORD *)v70 = 0;
  v68 = 0;
  if (getNumber(a3, CFSTR("UnwireSurface"), &v68))
    *(_QWORD *)(a5 + 32) |= (unint64_t)v68 << 35;
  v67 = 0;
  if (!getNumber(a3, CFSTR("Transform"), &v67))
  {
LABEL_10:
    v66 = 0;
    if (getNumber(a3, CFSTR("DitherControl"), &v66))
    {
      v10 = v66;
      if (v66 >= 4)
      {
        if (log_level_enabled(1u, 0))
          log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 375, (uint64_t)"Invalid dither control setting: 0x%x", v11, v66);
        goto LABEL_131;
      }
    }
    else
    {
      v10 = 1;
    }
    *(_QWORD *)(a5 + 32) |= v10 << 13;
    if (getBoolean(a3, CFSTR("CustomFilter")))
      *(_QWORD *)(a5 + 32) |= 0x40uLL;
    if (getBoolean(a3, CFSTR("NearestFilter")))
      *(_QWORD *)(a5 + 32) |= 0x80uLL;
    if (getBoolean(a3, CFSTR("OptOutBlitClip")))
      *(_QWORD *)(a5 + 32) |= 0x100uLL;
    if (getBoolean(a3, CFSTR("LockInScaler")))
      *(_QWORD *)(a5 + 32) |= 0x200uLL;
    if (getBoolean(a3, CFSTR("SkipAsyncCallback")))
      *(_QWORD *)(a5 + 32) |= 0x400uLL;
    if (getBoolean(a3, CFSTR("FixUpscaling")))
      *(_QWORD *)(a5 + 32) |= 0x1000uLL;
    v65 = 0;
    if (getNumber(a3, CFSTR("AlphaOverride"), &v65))
    {
      *(_QWORD *)(a5 + 32) |= 0x40000uLL;
      *(_DWORD *)(a5 + 168) = v65;
    }
    *(_QWORD *)(a5 + 204) = 0;
    v64 = 0;
    if (getNumber(a3, CFSTR("WriteOnlyModeAlpha"), &v64))
    {
      *(_WORD *)(a5 + 204) = v64;
      if (getNumber(a3, CFSTR("WriteOnlyModeRedLuma"), &v64))
      {
        *(_WORD *)(a5 + 206) = v64;
        if (getNumber(a3, CFSTR("WriteOnlyModeGreenCb"), &v64))
        {
          *(_WORD *)(a5 + 208) = v64;
          if (getNumber(a3, CFSTR("WriteOnlyModeBlueCr"), &v64))
          {
            *(_WORD *)(a5 + 210) = v64;
            *(_QWORD *)(a5 + 32) |= 0x1000000000000uLL;
          }
        }
      }
    }
    if (getBoolean(a3, CFSTR("FilmGrainEnable")))
      *(_QWORD *)(a5 + 32) |= 0x2000000000000uLL;
    if (getNumber(a3, CFSTR("BorderFillX"), &v72[1])
      && getNumber(a3, CFSTR("BorderFillY"), v72)
      && getNumber(a3, CFSTR("BorderFillWidth"), &v71[1])
      && getNumber(a3, CFSTR("BorderFillHeight"), v71)
      && getNumber(a3, CFSTR("BorderFillRedY"), v70)
      && getNumber(a3, CFSTR("BorderFillGreenCb"), &v69[1])
      && getNumber(a3, CFSTR("BorderFillBlueCr"), v69))
    {
      *(_QWORD *)(a5 + 32) |= 0x10000000uLL;
      v16 = v72[0];
      *(_DWORD *)(a5 + 172) = v72[1];
      *(_DWORD *)(a5 + 176) = v16;
      v17 = v71[0];
      *(_DWORD *)(a5 + 180) = v71[1];
      *(_DWORD *)(a5 + 184) = v17;
      v18 = v69[1];
      *(_DWORD *)(a5 + 192) = v70[0];
      *(_DWORD *)(a5 + 196) = v18;
      *(_DWORD *)(a5 + 200) = v69[0];
      if (getNumber(a3, CFSTR("BorderFillAlpha"), &v70[1]))
        *(_DWORD *)(a5 + 188) = v70[1];
    }
    if (getNumber(a3, CFSTR("HistogramBinMode"), (unsigned int *)(a5 + 220)))
    {
      *(_QWORD *)(a5 + 32) |= 0x20000000uLL;
      getNumber(a3, CFSTR("HistogramOffsetX"), (unsigned int *)(a5 + 224));
      getNumber(a3, CFSTR("HistogramOffsetY"), (unsigned int *)(a5 + 228));
      getNumber(a3, CFSTR("HistogramWidth"), (unsigned int *)(a5 + 232));
      getNumber(a3, CFSTR("HistogramHeight"), (unsigned int *)(a5 + 236));
      if (*(_DWORD *)(a5 + 220) == 2)
      {
        Value = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("HistogramPixelBins"));
        Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          v21 = Count;
          for (i = 0; i != v21; ++i)
          {
            ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, i);
            if (!ValueAtIndex || (v24 = ValueAtIndex, v25 = CFGetTypeID(ValueAtIndex), v25 != CFNumberGetTypeID()))
            {
              if (log_level_enabled(1u, 0))
              {
                v55 = "Could not retrieve histogram bin array";
                v56 = 557;
                goto LABEL_166;
              }
              goto LABEL_131;
            }
            LODWORD(valuePtr[0]) = 0;
            CFNumberGetValue(v24, kCFNumberSInt32Type, valuePtr);
            v26 = LODWORD(valuePtr[0]);
            if (HIWORD(LODWORD(valuePtr[0])))
            {
              if (log_level_enabled(1u, 0))
                log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 550, (uint64_t)"Invalid histogram pixel value: %u", v57, v26);
              goto LABEL_131;
            }
            *(_DWORD *)(a5 + 240 + 4 * i) = valuePtr[0];
          }
        }
      }
    }
    v63 = 0;
    if (getNumber(a3, CFSTR("ZeroFill"), &v63) && v63)
      *(_QWORD *)(a5 + 32) |= 0x40000000uLL;
    v62 = 0;
    if (getNumber(a3, CFSTR("ColorRemapMode"), &v62))
    {
      if (v62 >= 5)
        goto LABEL_131;
      *(_QWORD *)(a5 + 32) |= (unint64_t)v62 << 36;
    }
    if (getBoolean(a3, CFSTR("DisablePseudoLinearScaling")))
      *(_QWORD *)(a5 + 32) |= 0x80000000uLL;
    if (getBoolean(a3, CFSTR("PixelAveraging")))
      *(_QWORD *)(a5 + 32) |= 0x100000000uLL;
    if (getBoolean(a3, CFSTR("EdgeMirroring")))
      *(_QWORD *)(a5 + 32) |= 0x200000000uLL;
    if (getBoolean(a3, CFSTR("DirectionalScalingEnable")))
      *(_QWORD *)(a5 + 32) |= 0x8000000000uLL;
    if (getBoolean(a3, CFSTR("HDREnable")))
      *(_QWORD *)(a5 + 32) |= 0x10000000000uLL;
    if (getBoolean(a3, CFSTR("NoiseEstimationEnable")))
      *(_QWORD *)(a5 + 32) |= 0x40000000000uLL;
    if (getBoolean(a3, CFSTR("EnhanceEnable")))
      *(_QWORD *)(a5 + 32) |= 0x20000000000uLL;
    if (getBoolean(a3, CFSTR("ReadOnly")))
      *(_QWORD *)(a5 + 32) |= 0x80000000000uLL;
    if (getBoolean(a3, CFSTR("HtpcLargeHeaders")))
      *(_QWORD *)(a5 + 32) |= 0x100000000000uLL;
    if (getBoolean(a3, CFSTR("VraScaling")))
      *(_QWORD *)(a5 + 32) |= 0x200000000000uLL;
    if (getBoolean(a3, CFSTR("NoPowerEarlyBail")))
      *(_QWORD *)(a5 + 32) |= 0x400000000000uLL;
    if (getBoolean(a3, CFSTR("HighPriority")) && log_level_enabled(1u, 0))
      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 689, (uint64_t)"HighPriority (kIOSurfaceAcceleratorHighPriorityCString) deprecated!\n", v27, v61);
    if (getBoolean(a3, CFSTR("ReducedPrecisionFractionalOffsets")))
      *(_QWORD *)(a5 + 32) |= 0x4000000000000uLL;
    if (getBoolean(a3, CFSTR("NoCoalesceAsyncIOFenceWrites")))
      *(_QWORD *)(a5 + 32) |= 0x8000000000000uLL;
    if (getBoolean(a3, CFSTR("DestinationSurfaceDisplayBound")))
      *(_QWORD *)(a5 + 32) |= 0x10000000000000uLL;
    valuePtr[0] = 0;
    if (getNumberU64(a3, CFSTR("SharedEventSrcRef"), valuePtr))
    {
      *(_DWORD *)(a5 + 120) = MEMORY[0x20BCF1224](valuePtr[0]);
      getNumberU64(a3, CFSTR("SharedEventSrcWait"), (unint64_t *)(a5 + 128));
      getNumberU64(a3, CFSTR("SharedEventSrcSignal"), (unint64_t *)(a5 + 136));
    }
    v73 = 0;
    if (getNumberU64(a3, CFSTR("SharedEventDstRef"), &v73))
    {
      *(_DWORD *)(a5 + 144) = MEMORY[0x20BCF1224](v73);
      getNumberU64(a3, CFSTR("SharedEventDstWait"), (unint64_t *)(a5 + 152));
      getNumberU64(a3, CFSTR("SharedEventDstSignal"), (unint64_t *)(a5 + 160));
    }
    for (j = 0; j != 160; j += 40)
    {
      v29 = a5 + j;
      *(_DWORD *)(v29 + 272) = 0;
      *(_DWORD *)(v29 + 292) = 0;
    }
    v30 = (const __CFArray *)CFDictionaryGetValue(a3, CFSTR("IOSurfaceAcceleratorCommApi"));
    if (v30)
    {
      v31 = v30;
      v32 = CFArrayGetCount(v30);
      if (v32 >= 1)
      {
        v33 = v32;
        v34 = 0;
        while (1)
        {
          v35 = (const __CFData *)CFArrayGetValueAtIndex(v31, v34);
          if (v35)
          {
            v36 = v35;
            Length = CFDataGetLength(v35);
            if (Length)
            {
              v38 = Length;
              BytePtr = CFDataGetBytePtr(v36);
              if (BytePtr)
              {
                if (v38 != 40)
                {
                  if (log_level_enabled(1u, 0))
                  {
                    v55 = "Invalid Comm data size\n";
                    v56 = 787;
                    goto LABEL_166;
                  }
                  goto LABEL_131;
                }
                v40 = BytePtr;
                v41 = *(_DWORD *)BytePtr;
                v42 = *(_DWORD *)BytePtr;
                switch(*(_DWORD *)BytePtr)
                {
                  case 0:
                    break;
                  case 1:
                    v42 = 0;
                    v41 = 568;
                    break;
                  case 2:
                    v41 = 36872;
                    v42 = 1;
                    break;
                  case 3:
                    v41 = *((_DWORD *)BytePtr + 4);
                    v42 = 2;
                    break;
                  case 4:
                    v41 = *((_DWORD *)BytePtr + 4);
                    v42 = 3;
                    break;
                  default:
                    if (log_level_enabled(1u, 0))
                      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 831, (uint64_t)"Invalid inbound comm data type: %d\n", v59, *(unsigned int *)v40);
                    goto LABEL_131;
                }
                v43 = a5 + 40 * v42;
                *(_DWORD *)(v43 + 272) = *(_DWORD *)BytePtr;
                *(_DWORD *)(v43 + 288) = v41;
                v44 = *((_DWORD *)BytePtr + 5);
                v45 = v44;
                switch(v44)
                {
                  case 0:
                    break;
                  case 1:
                    v45 = 380;
                    break;
                  case 2:
                    v45 = 4104;
                    break;
                  case 3:
                    v45 = *((_DWORD *)BytePtr + 8);
                    break;
                  default:
                    if (log_level_enabled(1u, 0))
                      log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", 856, (uint64_t)"Invalid outbound comm data type: %d\n", v58, *((unsigned int *)v40 + 5));
                    goto LABEL_131;
                }
                v46 = a5 + 40 * v42;
                *(_DWORD *)(v46 + 292) = v44;
                *(_DWORD *)(v46 + 304) = v45;
                *(_QWORD *)(v46 + 280) = *((_QWORD *)BytePtr + 1);
                *(_QWORD *)(v46 + 296) = *((_QWORD *)BytePtr + 3);
              }
            }
          }
          if (v33 == ++v34)
            goto LABEL_117;
        }
      }
    }
    goto LABEL_117;
  }
  if ((v67 & 0xFFFFFFFC & ((v67 & 0xFFFFFFFC) - 1)) == 0)
  {
    *(_QWORD *)(a5 + 32) |= v67;
    goto LABEL_10;
  }
  if (log_level_enabled(1u, 0))
  {
    v61 = v67;
    v55 = "Invalid flip/rotate settings: 0x%x";
    v56 = 351;
LABEL_166:
    log_msg(1, 0, 255, (uint64_t)"createOptions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAcceleratorPreparator.cpp", v56, (uint64_t)v55, v53, v61);
  }
LABEL_131:
  v12 = 3758097090;
  if (log_level_enabled(1u, 0))
  {
    v14 = "Error decoding options dictionary\n";
    v15 = 1039;
    goto LABEL_133;
  }
  return v12;
}

const __CFBoolean *getBoolean(const __CFDictionary *a1, const __CFString *a2)
{
  const __CFBoolean *result;

  result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
    return (const __CFBoolean *)(CFBooleanGetValue(result) != 0);
  return result;
}

BOOL getNumber(const __CFDictionary *a1, const __CFString *a2, unsigned int *a3)
{
  const __CFNumber *Value;
  const __CFNumber *v5;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  v5 = Value;
  if (Value)
    CFNumberGetValue(Value, kCFNumberIntType, a3);
  return v5 != 0;
}

BOOL getNumberU64(const __CFDictionary *a1, const __CFString *a2, unint64_t *a3)
{
  const __CFNumber *Value;
  const __CFNumber *v5;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  v5 = Value;
  if (Value)
    CFNumberGetValue(Value, kCFNumberLongLongType, a3);
  return v5 != 0;
}

uint64_t IOSurfaceAcceleratorGetHistogram(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  uint64_t v9;
  unsigned int v10;
  unsigned int valuePtr;
  uint64_t inputStruct;

  v3 = 3758097084;
  result = 3758097090;
  if (a1 && a2)
  {
    valuePtr = 0;
    v6 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(*(_DWORD *)(a1 + 32), "IOService", CFSTR("IOSurfaceAcceleratorCapabilitiesDict"), 0, 0);
    if (v6)
    {
      v7 = v6;
      inputStruct = 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("kSurfaceAcceleratorCapabilitiesHistogramValues"));
      if (Value)
      {
        CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
        v9 = a2 + 4;
        inputStruct = a2 + 4;
        v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 7u, &inputStruct, 8uLL, 0, 0);
        if (!(_DWORD)v3)
        {
          *(_QWORD *)(a2 + 1544) = v9;
          v10 = valuePtr;
          *(_QWORD *)(a2 + 1552) = v9 + 4 * valuePtr;
          *(_QWORD *)(a2 + 1560) = v9 + 8 * v10;
          *(_DWORD *)a2 = v10;
        }
      }
      CFRelease(v7);
      return v3;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t ioSurfaceAcceleratorClassInitialize()
{
  kIOSurfaceAcceleratorID = _CFRuntimeRegisterClass();
  return log_start(4, 2u, 0x3FFFFF, 0x37u);
}

uint64_t log_start(uint64_t result, unsigned int a2, int a3, unsigned __int8 a4)
{
  int v4;
  uint64_t v5;
  int v6;

  gIosaLogListenerMask = 0;
  gIosaLogListenerRegisteredCount = 0;
  if (a2 >= 5)
    v4 = 5;
  else
    v4 = a2;
  gIosaLogVerbosity = v4;
  gIosaLogModuleMask = a3 & 0x3FFFFF;
  gIosaLogHeaderMask = a4;
  if ((result & 2) != 0)
  {
    gIosaLogListenerMask = 2;
    v5 = 1;
    gIosaLogListenerRegisteredCount = 1;
    gIosaLogListenerQueue[0] = (uint64_t)printf_listener;
    v6 = 6;
    if ((result & 4) == 0)
      return result;
    goto LABEL_8;
  }
  v5 = 0;
  v6 = 4;
  if ((result & 4) != 0)
  {
LABEL_8:
    gIosaLogListenerMask = v6;
    gIosaLogListenerRegisteredCount = v5 + 1;
    gIosaLogListenerQueue[v5] = (uint64_t)syslog_listener;
  }
  return result;
}

uint64_t log_set_verbosity(uint64_t result)
{
  int v1;

  if (result >= 5)
    v1 = 5;
  else
    v1 = result;
  gIosaLogVerbosity = v1;
  return result;
}

uint64_t log_set_module_mask(uint64_t result)
{
  gIosaLogModuleMask = result & 0x3FFFFF;
  return result;
}

uint64_t log_set_header_mask(uint64_t result)
{
  gIosaLogHeaderMask = result;
  return result;
}

uint64_t printf_listener(int *a1, const char *a2, va_list a3)
{
  char __str[256];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  log_format_munge(__str, a2, a1);
  return vprintf(__str, a3);
}

void syslog_listener(int *a1, const char *a2, char *a3)
{
  uint64_t v5;
  int v6;
  char __str[256];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  log_format_munge(__str, a2, a1);
  v5 = a1[1];
  if (v5 > 5)
    v6 = -1;
  else
    v6 = dword_206286EA8[v5];
  vsyslog(v6, __str, a3);
}

uint64_t log_level_enabled(unsigned int a1, int a2)
{
  if (a2 == 1)
    return 1;
  else
    return (gIosaLogVerbosity >= a1) & (gIosaLogModuleMask >> a2);
}

uint64_t log_msg(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  if (!gIosaLogListenerMask)
    return result;
  v10 = gIosaLogHeaderMask & a3;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  LODWORD(v12) = gIosaLogHeaderMask & a3;
  if ((gIosaLogHeaderMask & a3 & 1) == 0)
  {
    if ((gIosaLogHeaderMask & a3 & 2) == 0)
      goto LABEL_4;
LABEL_17:
    DWORD1(v12) = result;
    if ((gIosaLogHeaderMask & a3 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  *(_QWORD *)&v13 = "IOSA";
  if ((gIosaLogHeaderMask & a3 & 2) != 0)
    goto LABEL_17;
LABEL_4:
  if ((gIosaLogHeaderMask & a3 & 4) != 0)
LABEL_5:
    DWORD2(v12) = a2;
LABEL_6:
  if ((gIosaLogHeaderMask & a3 & 0x38) != 0)
  {
    *((_QWORD *)&v13 + 1) = a4;
    *(_QWORD *)&v14 = a5;
    *((_QWORD *)&v14 + 1) = a6;
  }
  if ((gIosaLogHeaderMask & a3 & 0x40) != 0)
    result = pthread_threadid_np(0, (__uint64_t *)&v15);
  if (v10 < 0)
  {
    result = mach_continuous_time();
    *((_QWORD *)&v15 + 1) = result;
  }
  if (gIosaLogListenerRegisteredCount)
  {
    v11 = 0;
    do
      result = ((uint64_t (*)(__int128 *, uint64_t, uint64_t *))gIosaLogListenerQueue[v11++])(&v12, a7, &a9);
    while (v11 < gIosaLogListenerRegisteredCount);
  }
  return result;
}

uint64_t log_panic_debug_enabled()
{
  return 0;
}

void log_panic_debug(int a1, const char *a2, const char *a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  char __str[512];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = snprintf(__str, 0x200uLL, "[%s][%s:%zu, %s] ", log_module_desc[a1], a3, a4, a2);
  vsnprintf(&__str[v10], 512 - v10, a5, &a9);
  syslog(3, "%s", __str);
  abort();
}

uint64_t log_format_munge(char *__str, const char *a2, int *a3)
{
  int v6;
  unsigned int v7;
  int v8;
  const char *v9;
  size_t v10;
  size_t v11;
  size_t v12;
  BOOL v13;
  size_t v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  size_t v18;
  size_t v19;
  BOOL v20;
  size_t v21;
  char v23[25];
  char v24[25];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = *a3;
  if ((*a3 & 1) != 0)
  {
    v8 = snprintf(__str, 0xFFuLL, "[%-*s]", 4, *((const char **)a3 + 2));
    if ((v8 - 256) < 0xFFFFFF01)
      log_format_munge();
    v7 = v8;
    v6 = *a3;
    if ((*a3 & 2) == 0)
    {
LABEL_3:
      if ((v6 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v7 = 0;
    if ((v6 & 2) == 0)
      goto LABEL_3;
  }
  v7 += snprintf(&__str[v7], 255 - v7, "[%-*s]", 5, log_level_desc[a3[1]]);
  if (v7 - 256 < 0xFFFFFF01)
    log_format_munge();
  v6 = *a3;
  if ((*a3 & 0x40) == 0)
  {
LABEL_4:
    if ((v6 & 0x80) == 0)
      goto LABEL_5;
LABEL_13:
    v7 += snprintf(&__str[v7], 255 - v7, "[0x%016llx]", *((_QWORD *)a3 + 7));
    if (v7 - 256 < 0xFFFFFF01)
      log_format_munge();
    v6 = *a3;
    if ((*a3 & 4) == 0)
      goto LABEL_17;
    goto LABEL_15;
  }
LABEL_11:
  v7 += snprintf(&__str[v7], 255 - v7, "[0x%08llx]", *((_QWORD *)a3 + 6));
  if (v7 - 256 < 0xFFFFFF01)
    log_format_munge();
  v6 = *a3;
  if ((*a3 & 0x80) != 0)
    goto LABEL_13;
LABEL_5:
  if ((v6 & 4) != 0)
  {
LABEL_15:
    v7 += snprintf(&__str[v7], 255 - v7, "[%-*s]", 12, log_module_desc[a3[2]]);
    if (v7 - 256 < 0xFFFFFF01)
      log_format_munge();
    v6 = *a3;
  }
  if ((v6 & 0x38) == 0)
    goto LABEL_28;
LABEL_17:
  if ((~v6 & 0x18) == 0)
  {
    v9 = (const char *)*((_QWORD *)a3 + 4);
    v10 = strlen(v9) - 1;
    v11 = v10;
    while (v11)
    {
      v12 = v11 - 1;
      v13 = v9[v11] != 47 || v11 >= v10;
      --v11;
      if (!v13)
      {
        v14 = v12 + 2;
        goto LABEL_31;
      }
    }
    v14 = 0;
LABEL_31:
    str_truncate(v24, &v9[v14]);
    str_truncate(v23, *((const char **)a3 + 3));
    if ((v7 & 0x80000000) != 0)
      log_format_munge();
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s %*s:%-*lu]", 24, v23, 24, v24, 4, *((_QWORD *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00)
      log_format_munge();
    goto LABEL_46;
  }
  if ((v6 & 0x10) != 0)
  {
    v16 = (const char *)*((_QWORD *)a3 + 4);
    v17 = strlen(v16) - 1;
    v18 = v17;
    while (v18)
    {
      v19 = v18 - 1;
      v20 = v16[v18] != 47 || v18 >= v17;
      --v18;
      if (!v20)
      {
        v21 = v19 + 2;
        goto LABEL_42;
      }
    }
    v21 = 0;
LABEL_42:
    str_truncate(v24, &v16[v21]);
    if ((v7 & 0x80000000) != 0)
      log_format_munge();
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s:%-*lu]", 24, v24, 4, *((_QWORD *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00)
      log_format_munge();
    goto LABEL_46;
  }
  if ((v6 & 8) != 0)
  {
    str_truncate(v24, *((const char **)a3 + 3));
    v7 += snprintf(&__str[v7], 255 - v7, "[%*s:%-*lu]", 24, v24, 4, *((_QWORD *)a3 + 5));
    if (v7 - 256 <= 0xFFFFFF00)
      log_format_munge();
  }
  else
  {
LABEL_28:
    if (!v7)
    {
      v15 = 0;
      return snprintf(&__str[v15], 255 - v15, "%s", a2);
    }
  }
LABEL_46:
  if (v7 == 255)
  {
    v15 = 255;
  }
  else
  {
    v15 = v7 + 1;
    __str[v7] = 32;
  }
  return snprintf(&__str[v15], 255 - v15, "%s", a2);
}

char *str_truncate(char *a1, const char *__s)
{
  size_t v4;
  char *v5;
  const char *v6;
  size_t v7;
  const char *v8;

  v4 = strlen(__s);
  if (v4 > 0x18)
  {
    v8 = &__s[v4];
    strncpy(a1, __s, 0x10uLL);
    a1[16] = 46;
    v5 = a1 + 17;
    v6 = v8 - 7;
    v7 = 7;
  }
  else
  {
    v5 = a1;
    v6 = __s;
    v7 = 24;
  }
  return strncpy(v5, v6, v7);
}

uint64_t IOSurfaceAcceleratorGetTypeID()
{
  uint64_t result;

  result = kIOSurfaceAcceleratorID;
  if (!kIOSurfaceAcceleratorID)
  {
    pthread_once(&IOSurfaceAcceleratorGetTypeID_once, (void (*)(void))ioSurfaceAcceleratorClassInitialize);
    return kIOSurfaceAcceleratorID;
  }
  return result;
}

uint64_t IOSurfaceAcceleratorGetServiceObject(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 3758097084;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 32);
      *a3 = *(_DWORD *)(a1 + 36);
    }
  }
  return result;
}

uint64_t srs_getStrength(const __CFDictionary *a1)
{
  const __CFString *Value;
  const __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  Value = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("Strength"));
  if (!Value)
    return 0;
  v2 = Value;
  v3 = 1;
  if (CFStringCompare(Value, CFSTR("StrengthWeak"), 1uLL))
  {
    if (CFStringCompare(v2, CFSTR("StrengthNormal"), 1uLL) == kCFCompareEqualTo)
      return 0;
    if (CFStringCompare(v2, CFSTR("StrengthStrong"), 1uLL) == kCFCompareEqualTo)
      return 3;
    v3 = 0;
    if (log_level_enabled(2u, 0))
    {
      log_msg(2, 0, 255, (uint64_t)"srs_getStrength", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/IOSurfaceAccelerator/IOSurfaceAccelerator.c", 367, (uint64_t)"unknown sharpener strength\n", v4, v6);
      return 0;
    }
  }
  return v3;
}

uint64_t IOSurfaceAcceleratorGetID(mach_port_t *a1, mach_port_t *a2)
{
  uint64_t result;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;

  outputCnt = 1;
  result = 3758097090;
  if (a1 && a2)
  {
    if (a1[11] == 1)
    {
      result = 0;
      a1[10] = 255;
    }
    else
    {
      v5 = a1[10];
      if (v5)
      {
        result = 0;
      }
      else
      {
        output = 0;
        result = IOConnectCallScalarMethod(a1[9], 5u, 0, 0, &output, &outputCnt);
        if ((_DWORD)result)
        {
          v5 = a1[10];
        }
        else
        {
          v5 = output;
          a1[10] = output;
        }
      }
      *a2 = v5;
    }
  }
  return result;
}

CFRunLoopSourceRef IOSurfaceAcceleratorGetRunLoopSource(CFRunLoopSourceRef result)
{
  CFRunLoopSourceRef v1;
  IONotificationPort *v2;
  uint64_t v3;
  uint64_t MachPort;

  if (result)
  {
    v1 = result;
    result = (CFRunLoopSourceRef)*((_QWORD *)result + 3);
    if (!result)
    {
      v2 = (IONotificationPort *)*((_QWORD *)v1 + 2);
      if (v2 || (v2 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]), (*((_QWORD *)v1 + 2) = v2) != 0))
      {
        v3 = *((unsigned int *)v1 + 9);
        MachPort = IONotificationPortGetMachPort(v2);
        MEMORY[0x20BCF1170](v3, 0, MachPort, 0);
        result = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)v1 + 2));
        *((_QWORD *)v1 + 3) = result;
      }
      else
      {
        return (CFRunLoopSourceRef)*((_QWORD *)v1 + 3);
      }
    }
  }
  return result;
}

uint64_t IOSurfaceAcceleratorTransferSurface(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return convertToTransform(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t convertToTransform(uint64_t a1, __IOSurface *a2, IOSurfaceRef buffer, const __CFDictionary *a4, uint32x2_t *a5, __int128 *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unint64_t v11;
  uint64_t result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[3];
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
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  memset(v16, 0, sizeof(v16));
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  if (a7)
  {
    *((_QWORD *)&v13 + 1) = a7;
    *(_QWORD *)&v14 = a8;
    *((_QWORD *)&v14 + 1) = a9;
  }
  if (a5 && a6)
  {
    v11 = (a5[2].i32[1] << 14) | ((unint64_t)a5->u32[1] << 16);
    *((_QWORD *)&v15 + 1) = (a5[2].i32[0] << 14) | ((unint64_t)a5->u32[0] << 16);
    *(_QWORD *)&v16[0] = v11;
    *(uint64x2_t *)((char *)v16 + 8) = vshll_n_u32(a5[1], 0x10uLL);
    v17 = *a6;
  }
  result = prepareTransformBuffersAndOptions(a2, buffer, a4, 1, (uint64_t)&v13);
  if (!(_DWORD)result)
    return transformSurface(a1, (char *)&v13, a4);
  return result;
}

uint64_t IOSurfaceAcceleratorAbortTransfers(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 36), 2u, 0, 0, 0, 0);
}

uint64_t IOSurfaceAcceleratorTransferSurfaceWithSwap()
{
  return 0;
}

uint64_t IOSurfaceAcceleratorConditionalTransferSurfaceWithSwap(uint64_t a1, __IOSurface *a2, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, uint64_t a9)
{
  return convertToTransform(a1, a2, a3, a4, 0, 0, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorBlitSurface(uint64_t a1, __IOSurface *a2, uint32x2_t *a3, IOSurfaceRef buffer, __int128 *a5, const __CFDictionary *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return convertToTransform(a1, a2, buffer, a6, a3, a5, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorBlitSurfaceWithSwap()
{
  return 0;
}

uint64_t IOSurfaceAcceleratorAbortCaptures(uint64_t a1)
{
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 36), 3u, 0, 0, 0, 0);
}

uint64_t IOSurfaceAcceleratorCaptureSurface(uint64_t a1, IOSurfaceRef buffer, const __CFDictionary *a3, int a4, unsigned int a5, unsigned int a6, int a7, int a8, int a9, int a10, __int128 a11, uint64_t a12)
{
  uint64_t v19;
  const __CFNumber *Value;
  int valuePtr;
  __int128 inputStruct;
  uint64_t v24;
  uint64_t v25;
  IOSurfaceID ID;
  unsigned int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;

  v19 = 3758097090;
  inputStruct = a11;
  v24 = a12;
  v25 = 0;
  ID = IOSurfaceGetID(buffer);
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a8;
  v31 = a9;
  v32 = a10;
  v33 = a4;
  if (a9 + a7 <= a5 && a10 + a8 <= a6)
  {
    if (!a3)
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    Value = (const __CFNumber *)CFDictionaryGetValue(a3, CFSTR("Transform"));
    if (!Value)
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    valuePtr = 0;
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    if ((valuePtr & 0xFFFFFFFC & ((valuePtr & 0xFFFFFFFC) - 1)) == 0)
    {
      v25 = 2 * valuePtr;
      return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 0, &inputStruct, 0x40uLL, 0, 0);
    }
  }
  return v19;
}

uint64_t IOSurfaceAcceleratorSetFilterCoefficients(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  _DWORD *v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v8;
  _DWORD *v9;
  _DWORD *v10;
  char v11;
  char v12;
  unsigned int v13;
  uint64_t v14;
  _DWORD *v15;
  _DWORD *v16;
  uint64_t i;
  uint64_t v18;
  _DWORD *v19;
  uint64_t j;
  uint64_t v21;
  _DWORD *v22;
  uint64_t k;
  uint64_t v24;
  _DWORD *v25;
  uint64_t m;
  uint64_t v27;

  v4 = 3758097085;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "WARNING: Use of %s is DEPRECATED. Please use IOSurfaceAcceleratorSetCustomFilter SPI instead.\n", "IOReturn IOSurfaceAcceleratorSetFilterCoefficients(IOSurfaceAcceleratorRef, IOSurfaceAcceleratorFilter *)");
  v5 = malloc_type_malloc(0x600uLL, 0xA1BA475EuLL);
  if (v5)
  {
    v6 = v5;
    v7 = a2 + 321;
    v8 = a2 + 129;
    v9 = a2 + 193;
    v10 = a2 + 1;
    v11 = 1;
    while (1)
    {
      v12 = v11;
      v13 = *a2 & 0xF;
      if (v13 > 7)
      {
        v4 = 3758097090;
        goto LABEL_26;
      }
      v14 = 0;
      v15 = v7;
      v16 = v6;
      do
      {
        for (i = 0; i != 16; ++i)
          v16[i] = v15[i * 4];
        ++v14;
        ++v15;
        v16 += 16;
      }
      while (v14 != 4);
      v18 = 0;
      v19 = v8;
      do
      {
        for (j = 0; j != 16; ++j)
          v16[j] = v19[j * 4];
        ++v18;
        ++v19;
        v16 += 16;
      }
      while (v18 != 4);
      v21 = 0;
      v22 = v9;
      do
      {
        for (k = 0; k != 128; k += 8)
          *v16++ = v22[k];
        ++v21;
        ++v22;
      }
      while (v21 != 8);
      v24 = 0;
      v25 = v10;
      do
      {
        for (m = 0; m != 128; m += 8)
          *v16++ = v25[m];
        ++v24;
        ++v25;
      }
      while (v24 != 8);
      v27 = IOSurfaceAcceleratorSetCustomFilter(a1, (0x40000 - (v13 << 15)) >> 3, 4, 16, (0x40000 - (v13 << 15)) >> 3, 8, 16, (uint64_t)v6);
      if ((_DWORD)v27)
        break;
      if ((*a2 & 0x80000000) != 0)
      {
        v11 = 0;
        a2 += 385;
        v7 += 385;
        v8 += 385;
        v9 += 385;
        v10 += 385;
        if ((v12 & 1) != 0)
          continue;
      }
      v4 = 0;
      goto LABEL_26;
    }
    v4 = v27;
LABEL_26:
    free(v6);
  }
  return v4;
}

uint64_t IOSurfaceAcceleratorKernelTests(uint64_t a1, _DWORD *inputStruct)
{
  if (*inputStruct <= 0x3E8u)
    return IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 6u, inputStruct, 0xFA8uLL, 0, 0);
  else
    return 3758097090;
}

uint64_t IOSurfaceAcceleratorGetFrameworkInfo(_QWORD *a1)
{
  uint64_t result;

  result = 3758097090;
  if (a1)
  {
    *a1 = 0;
    return 3758097136;
  }
  return result;
}

uint64_t IOSurfaceAcceleratorGetDiag(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  _DWORD *inputStruct;

  inputStruct = a2;
  v2 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      v2 = 3758097089;
      if (*a2 == 1766084715)
      {
        v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 8u, &inputStruct, 8uLL, 0, 0);
        if ((_DWORD)v2)
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "[iosaDiag] IOSurfaceAcceleratorGetDiag returned %x\n", v2);
      }
    }
  }
  return v2;
}

double IOSurfaceAcceleratorGetTransformEstimation(uint64_t a1, IOSurfaceRef buffer, __IOSurface *a3, const __CFDictionary *a4, uint64_t a5, uint64_t a6)
{
  double result;
  uint64_t v13;
  __int128 v14;
  _OWORD v15[4];
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
  _QWORD inputStruct[2];

  if (a1 && a6)
  {
    v13 = 0;
    v14 = 0uLL;
    memset(v15, 0, sizeof(v15));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    inputStruct[0] = v15;
    inputStruct[1] = &v13;
    DWORD2(v16) = IOSurfaceGetWidth(buffer);
    HIDWORD(v16) = IOSurfaceGetHeight(buffer);
    LODWORD(v19) = IOSurfaceGetWidth(a3);
    DWORD1(v19) = IOSurfaceGetHeight(a3);
    prepareTransformRectangles(a5, (uint64_t)v15);
    if (!prepareTransformBuffersAndOptions(buffer, a3, a4, 0, (uint64_t)v15))
    {
      IOConnectCallStructMethod(*(_DWORD *)(a1 + 36), 9u, inputStruct, 0x10uLL, 0, 0);
      *(_DWORD *)a6 = v13;
      result = *(double *)&v14;
      *(_OWORD *)(a6 + 8) = v14;
    }
  }
  return result;
}

uint64_t IOSurfaceAcceleratorParavirtProcessGuestData(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  size_t *v6;
  mach_port_t v7;
  uint32_t v8;
  const void *v9;
  size_t v10;

  result = 3758097090;
  if (a2 && *(_DWORD *)(a1 + 36))
  {
    if (*(_DWORD *)a2 == 2)
    {
      v9 = (const void *)(a2 + 8);
      if (*(_QWORD *)(a2 + 16))
      {
        *(_QWORD *)(a2 + 16) = 0;
        *(_QWORD *)(a2 + 24) = 0;
        *(_QWORD *)(a2 + 32) = 0;
      }
      *(_DWORD *)(a2 + 128) = 0;
      *(_QWORD *)(a2 + 136) = 0;
      *(_QWORD *)(a2 + 144) = 0;
      *(_DWORD *)(a2 + 152) = 0;
      *(_QWORD *)(a2 + 160) = 0;
      *(_QWORD *)(a2 + 168) = 0;
      v7 = *(_DWORD *)(a1 + 36);
      v8 = 1;
      v10 = 432;
      v5 = 0;
      v6 = 0;
    }
    else
    {
      if (*(_DWORD *)a2 != 1)
        goto LABEL_11;
      v5 = *(void **)(a2 + 16);
      if (!v5)
        goto LABEL_11;
      v6 = (size_t *)(a2 + 24);
      v7 = *(_DWORD *)(a1 + 36);
      v8 = 11;
      v9 = 0;
      v10 = 0;
    }
    result = IOConnectCallStructMethod(v7, v8, v9, v10, v5, v6);
LABEL_11:
    *(_DWORD *)(a2 + 4) = result;
  }
  return result;
}

CFStringRef ioSurfaceAcceleratorCopyFormatDescription(const void *a1, const __CFDictionary *a2)
{
  CFIndex v4;

  v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOSurface %p refcnt=%d>"), a1, v4);
}

uint64_t ioSurfaceAcceleratorCopyDebugDescription()
{
  return 0;
}

uint64_t __checkIsVirtualized_block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  BOOL v3;
  char v4;
  size_t v5;
  int v6;

  v6 = 0;
  v5 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v6, &v5, 0, 0);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = v6 == 0;
  v2 = !v1;
  checkIsVirtualized_is_virtualized = v2;
  if (!v1)
  {
    v6 = 0;
    v5 = 4;
    result = sysctlbyname("debug.iosa.simulated_model", &v6, &v5, 0, 0);
    if ((_DWORD)result)
      v3 = 1;
    else
      v3 = v6 == 0;
    v4 = v3;
    checkIsVirtualized_is_virtualized = v4;
  }
  return result;
}

void log_format_munge()
{
  __assert_rtn("operator()", "Log.cpp", 319, "char_count >= 0");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 390, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 415, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 403, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 361, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 353, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 345, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 337, "( char_count > 0) &&(char_count < length)");
}

{
  __assert_rtn("log_format_munge", "Log.cpp", 329, "( char_count > 0) &&(char_count < length)");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x24BDD86A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x24BDD8BB0]();
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

uint64_t IOSurfaceSharedEventGetMachPort()
{
  return MEMORY[0x24BDD8DC8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x24BDAF9C8](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x24BDB0128](*(_QWORD *)&a1, a2);
}

int vprintf(const char *a1, va_list a2)
{
  return MEMORY[0x24BDB0430](a1, a2);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

