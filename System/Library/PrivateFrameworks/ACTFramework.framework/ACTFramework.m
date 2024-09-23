BOOL ACT_IsPanoramaSupported()
{
  const void *v0;
  _BOOL8 v1;

  v0 = (const void *)MGCopyAnswer();
  v1 = v0 == (const void *)*MEMORY[0x24BDBD270];
  CFRelease(v0);
  return v1;
}

void addOrReplaceKeyValueToTargetDictionary(void *key, const void *a2, CFDictionaryRef theDict)
{
  if (CFDictionaryContainsKey(theDict, key))
    CFDictionaryReplaceValue(theDict, key, a2);
  else
    CFDictionaryAddValue(theDict, key, a2);
}

__CFDictionary *ACT_CopyDefaultConfigurationForPanorama()
{
  const __CFDictionary *v0;
  char *v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  __CFBundle *BundleWithIdentifier;
  const __CFURL *v6;
  __CFReadStream *v7;
  __CFReadStream *v8;
  CFPropertyListRef v9;
  const void *v10;
  CFIndex Count;
  const void **v12;
  CFIndex v13;
  __CFDictionary *MutableCopy;
  const __CFString *v15;
  const __CFString *v16;
  CFPropertyListRef v17;
  const void *v18;
  size_t v19;
  CFErrorRef error;
  int v21[2];
  char __s1[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)v21 = 0x200000006;
  v19 = 64;
  *(_OWORD *)__s1 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v0 = 0;
  if (sysctl(v21, 2u, __s1, &v19, 0, 0))
    return v0;
  v2 = strstr(__s1, "AP");
  if (v2 || (v2 = strstr(__s1, "DEV")) != 0)
    *v2 = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], __s1, 0x201u);
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.ACTFramework"));
  v6 = CFBundleCopyResourceURL(BundleWithIdentifier, CFSTR("firebreak-Configuration"), CFSTR("plist"), v4);
  if (v6)
  {
    error = 0;
    v7 = CFReadStreamCreateWithFile(v3, v6);
    if (v7)
    {
      v8 = v7;
      CFReadStreamOpen(v7);
      v9 = CFPropertyListCreateWithStream(v3, v8, 0, 0, 0, &error);
      if (v9)
      {
        v10 = v9;
        v0 = (const __CFDictionary *)CFRetain(v9);
        CFRelease(v10);
      }
      else
      {
        v0 = 0;
      }
      CFReadStreamClose(v8);
      CFRelease(v8);
      if (!v4)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  v0 = 0;
  if (v4)
LABEL_11:
    CFRelease(v4);
LABEL_12:
  if (v6)
    CFRelease(v6);
  if (v0)
  {
    Count = CFDictionaryGetCount(v0);
    v12 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues(v0, v12, 0);
    v13 = Count - 1;
    if (Count == 1)
    {
      free(v12);
    }
    else
    {
      MutableCopy = 0;
      v15 = (const __CFString *)*MEMORY[0x24BDBD590];
      v16 = (const __CFString *)*MEMORY[0x24BDBD570];
      do
      {
        v17 = CFPreferencesCopyValue((CFStringRef)v12[v13], CFSTR("com.apple.act"), v15, v16);
        if (v17)
        {
          v18 = v17;
          if (!MutableCopy)
            MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, v0);
          CFDictionaryReplaceValue(MutableCopy, v12[v13], v18);
          CFRelease(v18);
        }
        --v13;
      }
      while (v13);
      free(v12);
      if (MutableCopy)
      {
        CFRelease(v0);
        return MutableCopy;
      }
    }
  }
  return v0;
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCapture(uint64_t a1)
{
  return ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata(a1, 0);
}

uint64_t ACT_FigSampleBufferProcessorStartPanoramaCaptureWithMetadata(uint64_t a1, const void *a2)
{
  uint64_t DerivedStorage;
  uint64_t v4;
  uint64_t result;
  __CFCalendar *v6;
  CFAbsoluteTime Current;
  uint64_t v8;
  double HostTime;
  int v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  CFTypeRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char __filename[1024];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 216))
    return 0xFFFFFFFFLL;
  v4 = DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 217) || *(_BYTE *)(DerivedStorage + 219))
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)(DerivedStorage + 460))
  {
    if (!*(_BYTE *)(DerivedStorage + 472))
    {
      v18 = 0;
      v19 = 0;
      v17 = 0;
      v6 = CFCalendarCreateWithIdentifier((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFCalendarIdentifier)*MEMORY[0x24BDBD3B8]);
      Current = CFAbsoluteTimeGetCurrent();
      CFCalendarDecomposeAbsoluteTime(v6, Current, "yMdHms", (char *)&v19 + 4, &v19, (char *)&v18 + 4, &v18, (char *)&v17 + 4, &v17);
      CFRelease(v6);
      snprintf((char *)(v4 + 472), 0x100uLL, "/var/mobile/Library/Caches/com.apple.camera/Pano_%d-%d-%d_%d-%d-%d", HIDWORD(v19), v19, HIDWORD(v18), v18, HIDWORD(v17), v17);
      if (mkdir((const char *)(v4 + 472), 0x1FFu) == -1)
      {
        bzero(__filename, 0x400uLL);
        confstr(65537, __filename, 0x400uLL);
        snprintf((char *)(v4 + 472), 0x100uLL, "%s", __filename);
        mkdir((const char *)(v4 + 472), 0x1FFu);
      }
    }
    if (!*(_QWORD *)(v4 + 464))
    {
      __sprintf_chk(__filename, 0, 0x100uLL, "%s/panoLog.txt", (const char *)(v4 + 472));
      *(_QWORD *)(v4 + 464) = fopen(__filename, "w+");
      ACTLogMessageImp(1, "{panoLog|Version:200}\n");
      ACTLogMessageImp(1, "%s\n", (const char *)(v4 + 472));
      ACTLogMessageImp(1, "{Pano|sliceOffsetToZero:%d}\n", *(_QWORD *)(v4 + 376));
    }
    if (!*(_QWORD *)(v4 + 752))
    {
      __sprintf_chk(__filename, 0, 0x100uLL, "%s/panoArchive.tar", (const char *)(v4 + 472));
      *(_QWORD *)(v4 + 752) = archive_write_new();
      archive_write_set_compression_none();
      archive_write_set_format_ar_bsd();
      archive_write_open_filename();
    }
    if (!*(_QWORD *)(v4 + 760))
      *(_QWORD *)(v4 + 760) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 150, MEMORY[0x24BDBD690]);
  }
  v8 = *(_QWORD *)(v4 + 880);
  if (v8)
    RobustPano_startCapture(v8, (uint64_t)a2, (const char *)(v4 + 472));
  HostTime = GetHostTime();
  ACTLogMessageImp(1, "ACT_FigSampleBufferProcessorStartPanoramaCapture started %.2f\n", HostTime);
  v10 = *(_DWORD *)(v4 + 168);
  *(_DWORD *)(v4 + 172) = v10;
  v11 = 0.0;
  if (v10 != 1)
    v11 = (double)*(int *)(v4 + 328);
  *(_QWORD *)(v4 + 312) = 0;
  *(double *)(v4 + 296) = v11;
  ACTLogMessageImp(1, "{SwingEstimator|direction:%d}\n", v10);
  setACTRegistrationDirection(*(_QWORD *)(v4 + 448), *(_DWORD *)(v4 + 172));
  setPanoramaDirection(*(_QWORD **)(v4 + 440));
  v14 = *(void **)(v4 + 880);
  if (v14)
    RobustPano_setDirection(v14, (const char *)*(unsigned int *)(v4 + 172), v12, v13);
  v15 = 0.0;
  if (*(_DWORD *)(v4 + 172) == 2)
    v15 = (float)*(int *)(v4 + 328);
  *(float *)(v4 + 280) = v15;
  *(float *)(v4 + 284) = v15;
  *(_BYTE *)(v4 + 216) = 1;
  if (!a2)
    return 0;
  v16 = CFRetain(a2);
  result = 0;
  *(_QWORD *)(v4 + 736) = v16;
  return result;
}

double GetHostTime()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&qword_253E99A10 == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_253E99A10 = (double)v0 / (double)v1 * 0.000000001;
  }
  return *(double *)&qword_253E99A10 * (double)mach_absolute_time();
}

void ACT_FigSampleBufferProcessorStopPanoramaCapture()
{
  uint64_t DerivedStorage;
  void *v1;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(void **)(DerivedStorage + 880);
  if (v1)
    RobustPano_stopCapture(v1);
  ACTThreadMutexLock(*(_QWORD *)(DerivedStorage + 896));
}

void sub_227611B20()
{
  uint64_t v0;

  ACTThreadMutexLock(*(_QWORD *)(v0 + 904));
}

void sub_227611B28()
{
  uint64_t v0;

  ACTThreadMutexLock(*(_QWORD *)(v0 + 912));
}

uint64_t sub_227611B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 920);
  if (v1)
    ACTThreadMutexLock(v1);
  *(_WORD *)(v0 + 216) = 0;
  *(_BYTE *)(v0 + 218) = 1;
  *(_DWORD *)(v0 + 172) = *(_DWORD *)(v0 + 168);
  ACTThreadMutexUnlock(*(_QWORD *)(v0 + 896));
  ACTThreadMutexUnlock(*(_QWORD *)(v0 + 904));
  ACTThreadMutexUnlock(*(_QWORD *)(v0 + 912));
  v2 = *(_QWORD *)(v0 + 920);
  if (v2)
    ACTThreadMutexUnlock(v2);
  return 0;
}

void _createDebugWriteThread(uint64_t a1)
{
  uint64_t DerivedStorage;
  const __CFAllocator *v3;
  const CFDictionaryKeyCallBacks *v4;
  const CFDictionaryValueCallBacks *v5;
  const __CFDictionary *v6;
  const __CFDictionary *Mutable;
  __CFArray *v8;
  CFNumberRef v9;
  uint64_t v10;
  CFNumberRef v11;
  CFNumberRef v12;
  __CFDictionary *IOSurfacePropertiesDictionary;
  uint64_t v14;
  CVPixelBufferRef *v15;
  void *BaseAddress;
  size_t DataSize;
  __CVBuffer *v18;
  uint64_t i;
  CFNumberRef v20;
  const __CFDictionary *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  CFDictionaryRef pixelBufferAttributes;
  void *values;
  int valuePtr;
  void *v29[2];
  void *keys[2];
  CVPixelBufferRef pixelBufferOut[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  valuePtr = 1;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v4 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v5 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v6 = CFDictionaryCreate(v3, MEMORY[0x24BDC56F0], (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  Mutable = CFDictionaryCreateMutable(0, 0, v4, v5);
  pixelBufferAttributes = Mutable;
  v8 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v25 = 875704422;
  v9 = CFNumberCreate(0, kCFNumberSInt32Type, &v25);
  CFArrayAppendValue(v8, v9);
  CFRelease(v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v8);
  CFRelease(v8);
  v10 = *(_QWORD *)(DerivedStorage + 368);
  v23 = *(_QWORD *)(DerivedStorage + 360);
  v24 = v10;
  v11 = CFNumberCreate(v3, kCFNumberLongType, &v23);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v11);
  CFRelease(v11);
  v12 = CFNumberCreate(v3, kCFNumberLongType, &v24);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v12);
  CFRelease(v12);
  IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(1);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
  CFRelease(IOSurfacePropertiesDictionary);
  applyWiringAssertionToProperties(&pixelBufferAttributes);
  CVPixelBufferPoolCreate(v3, v6, pixelBufferAttributes, (CVPixelBufferPoolRef *)(DerivedStorage + 800));
  CFRelease(v6);
  CFRelease(pixelBufferAttributes);
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v32 = 0u;
  v33 = 0u;
  *(_OWORD *)pixelBufferOut = 0u;
  if (valuePtr >= 1)
  {
    v14 = 0;
    v15 = pixelBufferOut;
    do
    {
      CVPixelBufferPoolCreatePixelBuffer(v3, *(CVPixelBufferPoolRef *)(DerivedStorage + 800), v15);
      CVPixelBufferLockBaseAddress(*v15, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(*v15);
      DataSize = CVPixelBufferGetDataSize(*v15);
      bzero(BaseAddress, DataSize);
      v18 = *v15++;
      CVPixelBufferUnlockBaseAddress(v18, 0);
      ++v14;
    }
    while (v14 < valuePtr);
    if (valuePtr >= 1)
    {
      for (i = 0; i < valuePtr; CVPixelBufferRelease(pixelBufferOut[i++]))
        ;
    }
  }
  if (*(_QWORD *)(DerivedStorage + 920))
    goto LABEL_16;
  v22 = *(_QWORD *)(DerivedStorage + 392);
  v20 = CFNumberCreate(v3, kCFNumberIntType, &v22);
  keys[0] = CFSTR("ACTThreadBufferRingSize");
  keys[1] = CFSTR("ACTThreadIdentifier");
  v29[0] = v20;
  v29[1] = CFSTR("com.act.debugWrite");
  v21 = CFDictionaryCreate(v3, (const void **)keys, (const void **)v29, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(DerivedStorage + 920) = ACTThreadCreate((uint64_t)sub_227611F80, a1, 10, v21);
  CFRelease(v21);
  CFRelease(v20);
  if (*(_QWORD *)(DerivedStorage + 920))
  {
LABEL_16:
    if (!*(_QWORD *)(DerivedStorage + 56))
      CMSimpleQueueCreate(v3, 64, (CMSimpleQueueRef *)(DerivedStorage + 56));
    *(_BYTE *)(DerivedStorage + 772) = 0;
  }
  else
  {
    fig_log_get_emitter();
    FigSignalErrorAt3();
  }
}

uint64_t sub_227611F80()
{
  uint64_t DerivedStorage;
  __IOSurface *v1;
  __IOSurface *v2;
  double HostTime;
  int v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  const __CFNumber *Attachment;
  uint64_t v10;
  void *BaseAddress;
  double v12;
  int v13;
  double v14;
  int v15;
  double v16;
  int v18;
  int valuePtr;
  char v20[256];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 56));
  if (v1)
  {
    v2 = v1;
    do
    {
      HostTime = GetHostTime();
      valuePtr = 0;
      v4 = *(_DWORD *)(DerivedStorage + 460);
      if ((v4 & 5) == 1)
      {
        v5 = (const __CFNumber *)IOSurfaceCopyValue(v2, CFSTR("ID"));
        if (v5)
        {
          v6 = v5;
          CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
          CFRelease(v6);
        }
        ACTLogMessageImp(1, "{DebugWrite%d|BeginTS:%.3f}\n", valuePtr, HostTime);
        __sprintf_chk(v20, 0, 0x100uLL, "slice%3d.jpeg", valuePtr);
        v18 = 0;
        v7 = (const __CFNumber *)IOSurfaceCopyValue(v2, CFSTR("jpegSize"));
        if (v7)
        {
          v8 = v7;
          CFNumberGetValue(v7, kCFNumberIntType, &v18);
          CFRelease(v8);
        }
        if (archive_position_compressed() + v18 < 14000000 || (*(_BYTE *)(DerivedStorage + 460) & 0x20) != 0)
        {
          IOSurfaceLock(v2, 1u, 0);
          v10 = *(_QWORD *)(DerivedStorage + 752);
          BaseAddress = IOSurfaceGetBaseAddress(v2);
          sub_2276172B0(v10, (uint64_t)v20, (uint64_t)BaseAddress, v18);
          IOSurfaceUnlock(v2, 1u, 0);
        }
        else
        {
          ACTLogMessageImp(1, "{DebugWrite%d|Slice not written due to size constraint}\n", valuePtr);
        }
      }
      else if ((v4 & 6) == 2)
      {
        Attachment = (const __CFNumber *)CVBufferGetAttachment(v2, CFSTR("ID"), 0);
        if (Attachment)
          CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
        ACTLogMessageImp(1, "{DebugWrite%d|BeginTS:%.3f}\n", valuePtr, HostTime);
        __sprintf_chk(v20, 0, 0x100uLL, "%s/slice%3d.yuvf", (const char *)(DerivedStorage + 472), valuePtr);
        addCVPixelBufferToPanoArchive(*(_QWORD *)(DerivedStorage + 752), (uint64_t)v20, v2, 0);
      }
      v12 = (GetHostTime() - HostTime) * 1000.0;
      v13 = valuePtr;
      v14 = GetHostTime();
      ACTLogMessageImp(1, "{DebugWrite%d|took:%.3f} {DebugWrite%d|BufferReleaseTS:%.3f}\n", v13, v12, v13, v14);
      v15 = valuePtr;
      v16 = GetHostTime();
      ACTLogMessageImp(1, "{DebugWrite%d|EndTS:%.3f}\n", v15, v16);
      CFRelease(v2);
      v2 = (__IOSurface *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 56));
    }
    while (v2);
  }
  return 0;
}

void _invalidateDebugWriteThread()
{
  uint64_t DerivedStorage;
  _BYTE *v1;
  const void *v2;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(_BYTE **)(DerivedStorage + 920);
  if (v1)
  {
    ACTThreadRelease(v1);
    *(_QWORD *)(DerivedStorage + 920) = 0;
  }
  v2 = *(const void **)(DerivedStorage + 56);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(DerivedStorage + 56) = 0;
  }
}

uint64_t ACT_FigSampleBufferProcessorCreateForPanoramaWithOptions(int a1, const __CFDictionary *a2, _QWORD *a3)
{
  float CFPreferenceFloat;
  const __CFNumber *Value;
  float valuePtr;

  if (a2 && a3)
  {
    CFPreferenceFloat = getCFPreferenceFloat(CFSTR("ACTPanoramaPreviewScale"), CFSTR("com.apple.act"), 0.066667);
    valuePtr = CFPreferenceFloat;
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ACTPanoramaPreviewScale"));
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberFloatType, &valuePtr);
      CFPreferenceFloat = valuePtr;
    }
    return ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewScale(a1, a2, CFPreferenceFloat, a3);
  }
  else
  {
    fig_log_get_emitter();
    return FigSignalErrorAt3();
  }
}

uint64_t ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewScale(int a1, CFDictionaryRef theDict, float a3, _QWORD *a4)
{
  const __CFNumber *Value;
  const __CFNumber *v8;
  uint64_t v9;
  uint64_t CFPreferenceNumber;
  unsigned int v12;
  int valuePtr;

  v12 = 10800;
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ACTFrameWidth"));
  if (!Value)
    return 0xFFFFFFFFLL;
  valuePtr = 0;
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ACTPanoramaMaxWidth"));
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberIntType, &v12);
    v9 = v12;
  }
  else
  {
    v9 = 10800;
  }
  CFPreferenceNumber = getCFPreferenceNumber(CFSTR("ACTPanoramaMaxWidth"), CFSTR("com.apple.act"), v9);
  v12 = CFPreferenceNumber;
  return ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize((float)((float)(int)CFPreferenceNumber * a3), (float)((float)valuePtr * a3), CFPreferenceNumber, theDict, a4);
}

uint64_t ACT_FigSampleBufferProcessorCreateForPanoramaWithOptionsAndPreviewSize(double a1, double a2, uint64_t a3, const __CFDictionary *a4, _QWORD *a5)
{
  const void *v9;
  const __CFAllocator *v10;
  uint64_t v11;
  uint64_t DerivedStorage;
  const __CFBoolean *Value;
  _BOOL8 v14;
  const void *v15;
  const void *v16;
  const __CFNumber *v17;
  _QWORD *v18;
  const __CFNumber *v19;
  _DWORD *v20;
  uint64_t v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  uint64_t v27;
  const __CFNumber *v28;
  int *v29;
  int v30;
  const __CFNumber *v31;
  _QWORD *v32;
  const __CFNumber *v33;
  _QWORD *v34;
  const __CFBoolean *v35;
  const __CFDictionary *v36;
  const __CFDictionary *v37;
  const __CFNumber *v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  _BOOL4 v43;
  __CFDictionary *v44;
  const __CFDictionary *v45;
  const __CFNumber *v46;
  const __CFNumber *v47;
  _BOOL4 v48;
  _BOOL8 v49;
  const void *v50;
  const __CFString *v51;
  const __CFString *v52;
  CFTypeID v53;
  const __CFNumber *v54;
  const void *v55;
  const __CFNumber *v56;
  const __CFNumber *v57;
  const __CFNumber *v58;
  const __CFNumber *v59;
  const __CFNumber *v60;
  const __CFNumber *v61;
  const __CFBoolean *v62;
  const __CFBoolean *v63;
  const __CFNumber *v64;
  const __CFBoolean *v65;
  BOOL v66;
  int CFPreferenceNumber;
  CFNumberRef v68;
  CFNumberRef v69;
  const __CFDictionary *v70;
  const __CFDictionary *v71;
  const __CFDictionary *v72;
  _BOOL4 v73;
  _QWORD *v74;
  const CMBufferCallbacks *CallbacksForUnsortedSampleBuffers;
  uint64_t v76;
  uint64_t v77;
  float v78;
  uint64_t v79;
  float v80;
  float v81;
  __int128 v82;
  SInt32 v83;
  _QWORD *BlendingContext;
  size_t BytesPerRowOfPlane;
  size_t Height;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const __CFDictionary *v91;
  int v93;
  _BOOL4 v94;
  CMSampleTimingInfo sampleTiming;
  CFTypeRef v96;
  _QWORD v97[4];
  __int128 v98;
  __int128 v99;
  CFTypeRef cf;
  int v101;
  int8x16_t v102;
  __int128 v103;
  __int128 v104;
  SInt32 IntValue;
  uint64_t valuePtr;
  CFTypeRef v107;
  void *keys[2];
  __int128 v109;
  __int128 v110;
  void *values;
  const __CFString *v112;
  uint64_t v113;
  CGRect v114;

  v113 = *MEMORY[0x24BDAC8D0];
  v9 = (const void *)MGCopyAnswer();
  if (v9 == (const void *)*MEMORY[0x24BDBD268])
  {
    v15 = (const void *)MGCopyAnswer();
    v16 = (const void *)*MEMORY[0x24BDBD270];
    CFRelease(v15);
    if (v15 != v16)
      return 0xFFFFFFFFLL;
  }
  if (v9)
    CFRelease(v9);
  v107 = 0;
  if (!a4 || !a5)
  {
    fig_log_get_emitter();
    return FigSignalErrorAt3();
  }
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  FigSampleBufferProcessorGetClassID();
  v11 = CMDerivedObjectCreate();
  if (!(_DWORD)v11)
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    bzero((void *)DerivedStorage, 0x408uLL);
    *(_DWORD *)(DerivedStorage + 400) = 959459438;
    Value = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("forceMaxComputation"));
    if (Value)
      v14 = CFBooleanGetValue(Value) != 0;
    else
      v14 = 0;
    *(_BYTE *)(DerivedStorage + 808) = v14;
    *(_BYTE *)(DerivedStorage + 808) = (int)getCFPreferenceNumber(CFSTR("forceMaxComputation"), CFSTR("com.apple.act"), v14) > 0;
    v17 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaBufferRingSize"));
    v18 = (_QWORD *)(DerivedStorage + 392);
    if (v17)
      CFNumberGetValue(v17, kCFNumberCFIndexType, v18);
    else
      *v18 = 64;
    *(_QWORD *)(DerivedStorage + 408) = 64;
    v19 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaBlendingVersion"));
    v20 = (_DWORD *)(DerivedStorage + 200);
    if (v19)
    {
      CFNumberGetValue(v19, kCFNumberCFIndexType, (void *)(DerivedStorage + 200));
      v21 = *v20;
    }
    else
    {
      v21 = 0;
      *v20 = 0;
    }
    *v20 = getCFPreferenceNumber(CFSTR("ACTPanoramaBlendingVersion"), CFSTR("com.apple.act"), v21);
    v22 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTFrameWidth"));
    if (v22)
    {
      CFNumberGetValue(v22, kCFNumberCFIndexType, (void *)(DerivedStorage + 352));
      v23 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTFrameHeight"));
      if (v23)
      {
        CFNumberGetValue(v23, kCFNumberCFIndexType, (void *)(DerivedStorage + 344));
        *(_QWORD *)(DerivedStorage + 360) = (int)getCFPreferenceNumber(CFSTR("ACTPanoramaSliceWidth"), CFSTR("com.apple.act"), 240);
        v24 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaSliceWidth"));
        if (v24)
          CFNumberGetValue(v24, kCFNumberCFIndexType, (void *)(DerivedStorage + 360));
        v25 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaMaxWidth"));
        if (v25)
          CFNumberGetValue(v25, kCFNumberIntType, (void *)(DerivedStorage + 328));
        *(_DWORD *)(DerivedStorage + 328) = getCFPreferenceNumber(CFSTR("ACTPanoramaMaxWidth"), CFSTR("com.apple.act"), *(unsigned int *)(DerivedStorage + 328));
        v26 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaMaxFrameRate"));
        if (v26)
          CFNumberGetValue(v26, kCFNumberIntType, (void *)(DerivedStorage + 432));
        v27 = ((*(_QWORD *)(DerivedStorage + 344) - *(_QWORD *)(DerivedStorage + 360)) >> 1) & 0x7FFFFFFFFFFFFFF0;
        *(_QWORD *)(DerivedStorage + 368) = *(_QWORD *)(DerivedStorage + 352);
        *(_QWORD *)(DerivedStorage + 376) = v27;
        v28 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaDefaultDirection"));
        v29 = (int *)(DerivedStorage + 168);
        if (v28)
        {
          CFNumberGetValue(v28, kCFNumberIntType, (void *)(DerivedStorage + 168));
          v30 = *v29;
        }
        else
        {
          v30 = 0;
          *v29 = 0;
        }
        *(_DWORD *)(DerivedStorage + 172) = v30;
        v31 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaPreviewThumbnailMaxWidth"));
        v32 = (_QWORD *)(DerivedStorage + 416);
        if (v31)
          CFNumberGetValue(v31, kCFNumberCFIndexType, v32);
        else
          *v32 = 0;
        v33 = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaPreviewThumbnailMaxHeight"));
        v34 = (_QWORD *)(DerivedStorage + 424);
        if (v33)
          CFNumberGetValue(v33, kCFNumberCFIndexType, v34);
        else
          *v34 = 0;
        v35 = (const __CFBoolean *)CFDictionaryGetValue(a4, CFSTR("kACTPanoramaUseHEIF"));
        if (v35)
          LOBYTE(v35) = CFBooleanGetValue(v35);
        *(_BYTE *)(DerivedStorage + 436) = (_BYTE)v35;
        *(_DWORD *)(DerivedStorage + 176) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultRegistrationMethod"), CFSTR("com.apple.act"), 1);
        *(_DWORD *)(DerivedStorage + 180) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultPredictionMethod"), CFSTR("com.apple.act"), 2);
        *(_DWORD *)(DerivedStorage + 184) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultFallback"), CFSTR("com.apple.act"), 1);
        *(_DWORD *)(DerivedStorage + 188) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultPrediction"), CFSTR("com.apple.act"), 1);
        *(_DWORD *)(DerivedStorage + 192) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultMFDriftCorrectorFlag"), CFSTR("com.apple.act"), 2);
        *(_DWORD *)(DerivedStorage + 196) = getCFPreferenceNumber(CFSTR("ACTPanoramaDefaultBlendingConfig"), CFSTR("com.apple.act"), 0);
        valuePtr = 0;
        IntValue = 0;
        v103 = 0u;
        v104 = 0u;
        v102 = vextq_s8(*(int8x16_t *)(DerivedStorage + 344), *(int8x16_t *)(DerivedStorage + 344), 8uLL);
        LOBYTE(v103) = (int)getCFPreferenceNumber(CFSTR("enableTranslationCorrection"), CFSTR("com.apple.act"), 1) > 0;
        v36 = (const __CFDictionary *)CFDictionaryGetValue(a4, CFSTR("ACTPanoramaTranslationCorrection"));
        if (v36)
        {
          v37 = v36;
          v38 = (const __CFNumber *)CFDictionaryGetValue(v36, CFSTR("movingAverageFilterSize"));
          CFNumberGetValue(v38, kCFNumberIntType, (char *)&v103 + 4);
          v39 = (const __CFNumber *)CFDictionaryGetValue(v37, CFSTR("referenceMeanStartingFrame"));
          CFNumberGetValue(v39, kCFNumberIntType, (char *)&v103 + 8);
          v40 = (const __CFNumber *)CFDictionaryGetValue(v37, CFSTR("atlasTranslationShiftLowThreshold"));
          CFNumberGetValue(v40, kCFNumberFloat32Type, (char *)&v103 + 12);
          v41 = (const __CFNumber *)CFDictionaryGetValue(v37, CFSTR("atlasTranslationShiftHighThreshold"));
          CFNumberGetValue(v41, kCFNumberFloat32Type, &v104);
          v42 = (const __CFNumber *)CFDictionaryGetValue(v37, CFSTR("atlasTranslationCorrectionStrength"));
          CFNumberGetValue(v42, kCFNumberFloat32Type, (char *)&v104 + 4);
        }
        *(_DWORD *)(DerivedStorage + 460) = getCFPreferenceNumber(CFSTR("writeSlicesToDisc"), CFSTR("com.apple.act"), 4);
        *(_DWORD *)(DerivedStorage + 24) = getCFPreferenceNumber(CFSTR("processingQueueMaxDepth"), CFSTR("com.apple.act"), 24);
        *(float *)(DerivedStorage + 816) = getCFPreferenceFloat(CFSTR("ghostingSpeedScale"), CFSTR("com.apple.act"), 6.4);
        *(float *)(DerivedStorage + 820) = getCFPreferenceFloat(CFSTR("ghostingSpeedScaleLowLight"), CFSTR("com.apple.act"), 6.4);
        *(float *)(DerivedStorage + 824) = getCFPreferenceFloat(CFSTR("ghostingSpeedScaleBrightLight"), CFSTR("com.apple.act"), 6.4);
        *(float *)(DerivedStorage + 828) = 1.0
                                         / getCFPreferenceFloat(CFSTR("ghostingSpeedScaleLowLightIntegrationTime"), CFSTR("com.apple.act"), 100.0);
        *(float *)(DerivedStorage + 832) = 1.0
                                         / getCFPreferenceFloat(CFSTR("ghostingSpeedScaleBrightLightIntegrationTime"), CFSTR("com.apple.act"), 400.0);
        *(float *)(DerivedStorage + 836) = getCFPreferenceFloat(CFSTR("ghostingSpeedMaxOffset"), CFSTR("com.apple.act"), 32.0);
        *(float *)(DerivedStorage + 840) = getCFPreferenceFloat(CFSTR("minGoodOverlap"), CFSTR("com.apple.act"), 0.5);
        *(float *)(DerivedStorage + 848) = getCFPreferenceFloat(CFSTR("minGoodFovOverlap"), CFSTR("com.apple.act"), 0.95);
        *(float *)(DerivedStorage + 844) = getCFPreferenceFloat(CFSTR("minRequiredOverlap"), CFSTR("com.apple.act"), 0.33);
        *(_DWORD *)(DerivedStorage + 852) = *(_DWORD *)(DerivedStorage + 840);
        *(float *)(DerivedStorage + 160) = getCFPreferenceFloat(CFSTR("userStoppedBoundary"), CFSTR("com.apple.act"), 48.0);
        *(float *)(DerivedStorage + 164) = getCFPreferenceFloat(CFSTR("userStoppedThreshold"), CFSTR("com.apple.act"), (float)*(unint64_t *)(DerivedStorage + 360));
        *(_DWORD *)(DerivedStorage + 856) = getCFPreferenceNumber(CFSTR("fovMargin"), CFSTR("com.apple.act"), 5460);
        *(_DWORD *)(DerivedStorage + 860) = getCFPreferenceNumber(CFSTR("gdcMargin"), CFSTR("com.apple.act"), 40);
        v43 = (int)getCFPreferenceNumber(CFSTR("ACTPanoramaGPUDownscale"), CFSTR("com.apple.act"), 0) > 0;
        v44 = ACT_CopyDefaultConfigurationForPanorama();
        if (v44)
        {
          v45 = v44;
          v46 = (const __CFNumber *)CFDictionaryGetValue(v44, CFSTR("ACTPanoramaPowerBlurSlope"));
          v47 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaPowerBlurBias"));
          v48 = 0;
          if (v46 && v47)
          {
            if (CFNumberGetValue(v47, kCFNumberSInt32Type, &valuePtr))
              v48 = CFNumberGetValue(v46, kCFNumberSInt32Type, (char *)&valuePtr + 4) != 0;
            else
              v48 = 0;
          }
          v51 = (const __CFString *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaBPNRMode"));
          v94 = v51 != 0;
          if (v51)
          {
            v52 = v51;
            v53 = CFGetTypeID(v51);
            if (v53 == CFStringGetTypeID())
              IntValue = CFStringGetIntValue(v52);
            else
              CFNumberGetValue((CFNumberRef)v52, kCFNumberSInt32Type, &IntValue);
          }
          v54 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ACTJPEGPhotoQuality"));
          if (v54)
            CFNumberGetValue(v54, kCFNumberSInt32Type, (void *)(DerivedStorage + 400));
          v55 = CFDictionaryGetValue(v45, CFSTR("ACTPanoramaOptions"));
          v50 = v55;
          if (v55)
            CFRetain(v55);
          v56 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ghostingSpeedScaleLowLightIntegrationTime"));
          if (v56)
          {
            CFNumberGetValue(v56, kCFNumberFloat32Type, (void *)(DerivedStorage + 828));
            *(float *)(DerivedStorage + 828) = 1.0 / *(float *)(DerivedStorage + 828);
          }
          v57 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ghostingSpeedScaleBrightLightIntegrationTime"));
          if (v57)
          {
            CFNumberGetValue(v57, kCFNumberFloat32Type, (void *)(DerivedStorage + 832));
            *(float *)(DerivedStorage + 832) = 1.0 / *(float *)(DerivedStorage + 832);
          }
          v58 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ghostingSpeedScaleLowLight"));
          if (v58)
            CFNumberGetValue(v58, kCFNumberFloat32Type, (void *)(DerivedStorage + 820));
          v59 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ghostingSpeedScaleBrightLight"));
          if (v59)
            CFNumberGetValue(v59, kCFNumberFloat32Type, (void *)(DerivedStorage + 824));
          v60 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("fovMargin"));
          if (v60)
            CFNumberGetValue(v60, kCFNumberIntType, (void *)(DerivedStorage + 856));
          v61 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("gdcMargin"));
          if (v61)
            CFNumberGetValue(v61, kCFNumberIntType, (void *)(DerivedStorage + 860));
          v62 = (const __CFBoolean *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaGPUDownscale"));
          if (v62)
            v43 = CFBooleanGetValue(v62) != 0;
          v63 = (const __CFBoolean *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaRobustPano"));
          v49 = v63 && CFBooleanGetValue(v63);
          *(_BYTE *)(DerivedStorage + 888) = v49;
          v64 = (const __CFNumber *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaRobustPanoNRFversion"));
          if (v64)
            CFNumberGetValue(v64, kCFNumberIntType, (char *)&v104 + 8);
          else
            DWORD2(v104) = 2;
          v65 = (const __CFBoolean *)CFDictionaryGetValue(v45, CFSTR("ACTPanoramaRobustPanoNRFUsePanoType"));
          v66 = v65 && CFBooleanGetValue(v65);
          BYTE12(v104) = v66;
          CFRelease(v45);
        }
        else
        {
          v49 = 0;
          v94 = 0;
          v48 = 0;
          v50 = 0;
        }
        CFPreferenceNumber = getCFPreferenceNumber(CFSTR("robustPano.enable"), CFSTR("com.apple.act"), v49);
        *(_BYTE *)(DerivedStorage + 888) = (int)getCFPreferenceNumber(CFSTR("robustPano.disableV1"), CFSTR("com.apple.act"), *(unsigned __int8 *)(DerivedStorage + 888)) > 0;
        *(_BYTE *)DerivedStorage = 1;
        *(_BYTE *)(DerivedStorage + 437) = (int)getCFPreferenceNumber(CFSTR("robustPano.disableCropping"), CFSTR("com.apple.act"), 0) > 0;
        v101 = *(_QWORD *)(DerivedStorage + 392);
        v68 = CFNumberCreate(v10, kCFNumberIntType, &v101);
        v69 = v68;
        if (*(_QWORD *)(DerivedStorage + 896)
          || (keys[0] = CFSTR("ACTThreadBufferRingSize"),
              keys[1] = CFSTR("ACTThreadIdentifier"),
              values = v68,
              v112 = CFSTR("com.act.registration"),
              v70 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]), *(_QWORD *)(DerivedStorage + 896) = ACTThreadCreate((uint64_t)sub_227613738, (uint64_t)v107, 14, v70), CFRelease(v70), *(_QWORD *)(DerivedStorage + 896)))
        {
          if (*(_QWORD *)(DerivedStorage + 904)
            || (keys[0] = CFSTR("ACTThreadBufferRingSize"),
                keys[1] = CFSTR("ACTThreadIdentifier"),
                values = v69,
                v112 = CFSTR("com.act.assembly"),
                v71 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]), *(_QWORD *)(DerivedStorage + 904) = ACTThreadCreate((uint64_t)sub_2276142D0, (uint64_t)v107, 14, v71), CFRelease(v71), *(_QWORD *)(DerivedStorage + 904)))
          {
            if (*(_QWORD *)(DerivedStorage + 912)
              || (keys[0] = CFSTR("ACTThreadBufferRingSize"),
                  keys[1] = CFSTR("ACTThreadIdentifier"),
                  values = v69,
                  v112 = CFSTR("com.act.preview"),
                  v72 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]), *(_QWORD *)(DerivedStorage + 912) = ACTThreadCreate((uint64_t)sub_227614634, (uint64_t)v107, 14, v72), CFRelease(v72), *(_QWORD *)(DerivedStorage + 912)))
            {
              v93 = CFPreferenceNumber;
              v73 = v43;
              v74 = (_QWORD *)(DerivedStorage + 928);
              if (*(_QWORD *)(DerivedStorage + 928) || (IntValue - 4) >= 5 && IntValue != 1)
                goto LABEL_89;
              keys[0] = CFSTR("ACTThreadBufferRingSize");
              keys[1] = CFSTR("ACTThreadIdentifier");
              values = v69;
              v112 = CFSTR("com.act.nr");
              v91 = CFDictionaryCreate(v10, (const void **)keys, (const void **)&values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
              *v74 = ACTThreadCreate((uint64_t)sub_2276156D4, (uint64_t)v107, 7, v91);
              CFRelease(v91);
              if (*v74)
              {
                if (!*(_QWORD *)(DerivedStorage + 1016))
                  *(_QWORD *)(DerivedStorage + 1016) = FigSimpleMutexCreate();
                *(_OWORD *)(DerivedStorage + 993) = 0u;
                *(_OWORD *)(DerivedStorage + 984) = 0u;
                *(_OWORD *)(DerivedStorage + 968) = 0u;
                if (!*(_QWORD *)(DerivedStorage + 1024))
                  *(_QWORD *)(DerivedStorage + 1024) = FigSemaphoreCreate();
LABEL_89:
                if (!*(_QWORD *)(DerivedStorage + 32))
                {
                  CallbacksForUnsortedSampleBuffers = CMBufferQueueGetCallbacksForUnsortedSampleBuffers();
                  v76 = CMBufferQueueCreate(v10, 0, CallbacksForUnsortedSampleBuffers, (CMBufferQueueRef *)(DerivedStorage + 32));
                  if ((_DWORD)v76)
                    goto LABEL_125;
                }
                if (!*(_QWORD *)(DerivedStorage + 40))
                {
                  v76 = CMSimpleQueueCreate(v10, *(_DWORD *)(DerivedStorage + 408), (CMSimpleQueueRef *)(DerivedStorage + 40));
                  if ((_DWORD)v76)
                    goto LABEL_125;
                }
                if (!*(_QWORD *)(DerivedStorage + 48))
                {
                  v76 = CMSimpleQueueCreate(v10, *(_DWORD *)(DerivedStorage + 408), (CMSimpleQueueRef *)(DerivedStorage + 48));
                  if ((_DWORD)v76)
                    goto LABEL_125;
                }
                FigRegisterIOSurfacePixelTransferCapability();
                if (!*(_QWORD *)(DerivedStorage + 64))
                {
                  keys[0] = 0;
                  v76 = VTImageRotationSessionCreate();
                  if ((_DWORD)v76)
                    goto LABEL_125;
                  *(void **)(DerivedStorage + 64) = keys[0];
                }
                if (!*(_QWORD *)(DerivedStorage + 72))
                {
                  keys[0] = 0;
                  v76 = VTImageRotationSessionCreate();
                  if ((_DWORD)v76)
                    goto LABEL_125;
                  *(void **)(DerivedStorage + 72) = keys[0];
                }
                if (*(_QWORD *)(DerivedStorage + 80))
                {
LABEL_104:
                  v114.origin.y = (double)*(unint64_t *)(DerivedStorage + 376);
                  v114.size.width = (double)*(unint64_t *)(DerivedStorage + 368);
                  v114.size.height = (double)*(unint64_t *)(DerivedStorage + 360);
                  v114.origin.x = 0.0;
                  cf = CGRectCreateDictionaryRepresentation(v114);
                  *(_QWORD *)(DerivedStorage + 792) = CFDictionaryCreate(v10, MEMORY[0x24BE158A0], &cf, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
                  CFRelease(cf);
                  v77 = *(_QWORD *)(DerivedStorage + 360);
                  v78 = (float)*(unint64_t *)(DerivedStorage + 352);
                  *(_OWORD *)(DerivedStorage + 936) = 0u;
                  *(_OWORD *)(DerivedStorage + 952) = 0u;
                  v79 = *(int *)(DerivedStorage + 328);
                  v80 = a1 / (float)(int)v79;
                  *(float *)(DerivedStorage + 332) = v80;
                  v81 = a2 / v78;
                  *(float *)(DerivedStorage + 336) = v81;
                  v82 = *(_OWORD *)(DerivedStorage + 368);
                  v97[2] = 875704422;
                  v97[3] = v77;
                  v98 = v82;
                  v99 = 0u;
                  v97[0] = v79;
                  v97[1] = (unint64_t)(float)(ceilf((float)(unint64_t)v82 * 0.1)
                                                   + (float)(unint64_t)v82);
                  LODWORD(v99) = *(_DWORD *)(DerivedStorage + 200);
                  BYTE4(v99) = *(_BYTE *)(DerivedStorage + 888);
                  BYTE12(v99) = *(_BYTE *)(DerivedStorage + 808);
                  v83 = IntValue;
                  if (!v94)
                    v83 = 0;
                  DWORD2(v99) = v83;
                  BlendingContext = createBlendingContext((uint64_t)v97);
                  *(_QWORD *)(DerivedStorage + 440) = BlendingContext;
                  if (v50)
                  {
                    setBlendingContextOptions(BlendingContext);
                    BlendingContext = *(_QWORD **)(DerivedStorage + 440);
                  }
                  BlendingContext[2] = v74;
                  setBlendingForceMaxComputation(BlendingContext);
                  sub_2276158D8();
                  if (v48)
                    setPowerBlurTuning(*(_QWORD *)(DerivedStorage + 440), valuePtr, SHIDWORD(valuePtr));
                  v96 = 0;
                  FigCreatePixelBufferAttributesWithIOSurfaceSupport();
                  applyWiringAssertionToProperties((CFDictionaryRef *)&v96);
                  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
                  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
                  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
                  FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
                  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 88), 0);
                  CFRelease(v96);
                  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(DerivedStorage + 136), 0);
                  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 136));
                  *(_QWORD *)(DerivedStorage + 272) = PixelShuffler_constructor(BytesPerRowOfPlane, Height);
                  memset(&sampleTiming, 0, sizeof(sampleTiming));
                  CMVideoFormatDescriptionCreateForImageBuffer(v10, *(CVImageBufferRef *)(DerivedStorage + 88), (CMVideoFormatDescriptionRef *)(DerivedStorage + 112));
                  CMSampleBufferCreateForImageBuffer(v10, *(CVImageBufferRef *)(DerivedStorage + 88), 1u, 0, 0, *(CMVideoFormatDescriptionRef *)(DerivedStorage + 112), &sampleTiming, (CMSampleBufferRef *)(DerivedStorage + 96));
                  sub_227615908();
                  ACTLogAddListener((uint64_t)sub_2276159DC, 7, DerivedStorage);
                  if (*(_DWORD *)(DerivedStorage + 460))
                    _createDebugWriteThread((uint64_t)v107);
                  *(_QWORD *)(DerivedStorage + 448) = createACTRegistrationContext();
                  sub_227615A60(DerivedStorage, v87, v88, v89);
                  setACTRegistrationForceMaxComputation(*(_QWORD *)(DerivedStorage + 448), *(_BYTE *)(DerivedStorage + 808));
                  if (v73)
                    v90 = ACTPano_GPUDownscaler();
                  else
                    v90 = 0;
                  *(_QWORD *)(DerivedStorage + 872) = v90;
                  if (v93 >= 1)
                  {
                    *(int8x16_t *)keys = v102;
                    v109 = v103;
                    v110 = v104;
                    *(_QWORD *)(DerivedStorage + 880) = RobustPano_new((uint64_t)keys);
                  }
                  v11 = 0;
                  *a5 = v107;
                  v107 = 0;
                  *(_QWORD *)(DerivedStorage + 464) = 0;
                  goto LABEL_126;
                }
                keys[0] = 0;
                v76 = VTImageRotationSessionCreate();
                if (!(_DWORD)v76)
                {
                  *(void **)(DerivedStorage + 80) = keys[0];
                  goto LABEL_104;
                }
LABEL_125:
                v11 = v76;
LABEL_126:
                if (v69)
                  CFRelease(v69);
                if (v50)
                  CFRelease(v50);
                goto LABEL_130;
              }
            }
          }
        }
        fig_log_get_emitter();
        v76 = FigSignalErrorAt3();
        goto LABEL_125;
      }
    }
    v11 = 0;
  }
LABEL_130:
  if (v107)
    CFRelease(v107);
  return v11;
}

uint64_t sub_227613738(uint64_t a1)
{
  uint64_t DerivedStorage;
  opaqueCMSampleBuffer *v3;
  opaqueCMSampleBuffer *v4;
  const __CFString *v5;
  const __CFAllocator *v6;
  __CVBuffer *ImageBuffer;
  uint64_t v8;
  const __CFNumber *Attachment;
  int v10;
  double HostTime;
  const __CFDictionary *v12;
  CFTypeRef v13;
  __CFDictionary *v14;
  CFTypeRef v15;
  uint64_t v16;
  CVImageBufferRef v17;
  __CVBuffer *v18;
  const __CFAllocator *v19;
  const __CFString *v20;
  uint64_t v21;
  opaqueCMSampleBuffer *v22;
  __CVBuffer *v23;
  int32_t Count;
  double v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  int v29;
  double v30;
  unint64_t v31;
  double v32;
  unsigned int ACTRegistrationMethodUsed;
  const __CFNumber *v34;
  __int128 v35;
  double v36;
  size_t Height;
  size_t Width;
  int v39;
  float v40;
  __CFNotificationCenter *v41;
  float v42;
  double v43;
  float v44;
  float v45;
  double v46;
  float v47;
  CFNumberRef v48;
  CFNumberRef v49;
  opaqueCMSampleBuffer *v50;
  double Seconds;
  float v52;
  CFNumberRef v53;
  opaqueCMSimpleQueue *v54;
  CFDictionaryRef Attachments;
  CFTypeRef v56;
  const void *v57;
  int v58;
  double v59;
  __CVBuffer *v60;
  const __CFDictionary *v61;
  float v62;
  const __CFString *Value;
  int v64;
  _DWORD *v65;
  int v66;
  __CFNotificationCenter *v67;
  double v68;
  double v69;
  float v70;
  float v71;
  float v72;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v74;
  int v75;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v77;
  CFNumberRef v78;
  CFTypeRef v79;
  CFTypeRef v80;
  CFTypeRef v81;
  int v82;
  double v83;
  const __CFString *theString2;
  void *v86;
  const __CFString *v87;
  const __CFString *key;
  const __CFString *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __CVBuffer *buffer;
  opaqueCMSampleBuffer *v94;
  int valuePtr;
  CMTime time;
  CMTime v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE v100[32];
  __int128 v101;
  CMTime v102;
  CMTime v103;
  uint64_t v104;

  v104 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(DerivedStorage + 32));
  if (v3)
  {
    v4 = v3;
    v5 = CFSTR("MetadataDictionary");
    key = (const __CFString *)*MEMORY[0x24BDD9470];
    v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v89 = (const __CFString *)*MEMORY[0x24BDD9210];
    v87 = (const __CFString *)*MEMORY[0x24BE104E8];
    theString2 = (const __CFString *)*MEMORY[0x24BE105A0];
    v86 = (void *)*MEMORY[0x24BE11488];
    v91 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    v92 = *MEMORY[0x24BDBD8B8];
    v90 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
    do
    {
      ImageBuffer = CMSampleBufferGetImageBuffer(v4);
      v8 = FigSampleBufferRetain();
      buffer = ImageBuffer;
      Attachment = (const __CFNumber *)CVBufferGetAttachment(ImageBuffer, CFSTR("ID"), 0);
      valuePtr = 0;
      if (Attachment)
      {
        CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
        v10 = valuePtr;
      }
      else
      {
        v10 = 0;
      }
      HostTime = GetHostTime();
      ACTLogMessageImp(1, "{Registration%d|BeginTS:%.3f}\n", v10, HostTime);
      if (*(_QWORD *)(DerivedStorage + 464))
        ++*(_DWORD *)(DerivedStorage + 780);
      if (!*(_QWORD *)(DerivedStorage + 728))
      {
        v12 = (const __CFDictionary *)CMGetAttachment(v4, key, 0);
        if (v12)
          *(_QWORD *)(DerivedStorage + 728) = CFDictionaryCreateMutableCopy(v6, 0, v12);
        v13 = CMGetAttachment(v4, v89, 0);
        v14 = *(__CFDictionary **)(DerivedStorage + 728);
        if (v14 && v13)
          CFDictionaryAddValue(v14, v89, v13);
      }
      v94 = (opaqueCMSampleBuffer *)v8;
      if (!*(_QWORD *)(DerivedStorage + 744))
      {
        v15 = CMGetAttachment(v4, v87, 0);
        *(_QWORD *)(DerivedStorage + 744) = v15;
        if (v15)
          CFRetain(v15);
      }
      *(_OWORD *)v100 = v92;
      *(_OWORD *)&v100[16] = v91;
      v101 = v90;
      v98 = 0;
      v99 = 0;
      v16 = CMBaseObjectGetDerivedStorage();
      v17 = CMSampleBufferGetImageBuffer(v4);
      if (!v17)
        goto LABEL_77;
      v18 = v17;
      getIspTxTy(v4, (_DWORD *)&v98 + 1, &v98);
      if (*(_DWORD *)(v16 + 172))
      {
        v19 = v6;
        v20 = v5;
        v21 = a1;
        CFRetain(v4);
        CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(v16 + 40), v4);
        ACTThreadWakeup();
        v22 = *(opaqueCMSampleBuffer **)(v16 + 104);
        if (v22)
          v23 = CMSampleBufferGetImageBuffer(v22);
        else
          v23 = 0;
        Count = CMSimpleQueueGetCount(*(CMSimpleQueueRef *)(v16 + 40));
        v25 = GetHostTime();
        v26 = *(_QWORD *)(v16 + 376);
        v27 = *(_QWORD *)(v16 + 448);
        if (v23)
        {
          setACTRegistrationCurTxTy(v27, *((float *)&v98 + 1), *(float *)&v98);
          v28 = registerSampleBuffers(*(_QWORD *)(v16 + 448), v23, v26, v18, v26, *(_QWORD *)(v16 + 360), v100, (_DWORD *)&v99 + 1, 0);
        }
        else
        {
          v28 = registerSampleBuffers(v27, v18, v26, 0, v26, *(_QWORD *)(v16 + 360), v100, (_DWORD *)&v99 + 1, 1u);
        }
        v29 = v28;
        setACTRegistrationPrevTxTy(*(_QWORD *)(v16 + 448), *((float *)&v98 + 1), *(float *)&v98);
        v30 = GetHostTime();
        if (v29 < 0)
        {
          ACTLogMessageImp(1, "{performSliceRegistration|registrationError:%d}\n", v29);
          a1 = v21;
          v5 = v20;
          v6 = v19;
        }
        else
        {
          v31 = Count;
          if (v23 && *(_QWORD *)(v16 + 464))
          {
            v32 = v30;
            memset(&v102, 0, 32);
            ACTRegistrationMethodUsed = getACTRegistrationMethodUsed(*(_QWORD *)(v16 + 448));
            getACTRegistrationMethodDescription(ACTRegistrationMethodUsed, (char *)&v102);
            v34 = (const __CFNumber *)CVBufferGetAttachment(v18, CFSTR("ID"), 0);
            if (v34)
              CFNumberGetValue(v34, kCFNumberIntType, &v99);
            __sprintf_chk((char *)&v103, 0, 0x40uLL, "Registration%d", v99);
            v35 = v101;
            v36 = *((float *)&v99 + 1);
            Height = CVPixelBufferGetHeight(v18);
            Width = CVPixelBufferGetWidth(v18);
            ACTLogMessageImp(1, "{%s|method:%s} {%s|tx:%.3f} {%s|ty:%.3f} {%s|quality:%.3f} {%s|depth:%ld} {%s|height:%ld} {%s|width:%ld} {%s|took:%.3f}\n", (const char *)&v103, (const char *)&v102, (const char *)&v103, *(double *)&v35, (const char *)&v103, *((double *)&v35 + 1), (const char *)&v103, v36, (const char *)&v103, v31, (const char *)&v103, Height, (const char *)&v103, Width, (const char *)&v103, (v32 - v25) * 1000.0);
          }
          a1 = v21;
          v5 = v20;
          v6 = v19;
          if (*(_BYTE *)(v16 + 218))
            goto LABEL_77;
          if (*(_QWORD *)(v16 + 408) > v31)
          {
            v39 = *(_DWORD *)(v16 + 172);
            if (v39 == 1)
            {
              v42 = *(float *)(v16 + 280);
              if (v42 == 0.0)
                v42 = v42 + (float)((float)*(unint64_t *)(v16 + 344) * 0.5);
              v43 = *((double *)&v101 + 1) + v42;
              v44 = v43;
              if (v43 <= *(float *)(v16 + 284))
                v45 = *(float *)(v16 + 284);
              else
                v45 = v43;
            }
            else
            {
              if (v39 == 2)
              {
                v40 = *(float *)(v16 + 280);
                if (v40 == (float)*(int *)(v16 + 328))
                  v40 = v40 + (float)((float)*(unint64_t *)(v16 + 344) * -0.5);
              }
              else
              {
                v40 = *(float *)(v16 + 280);
              }
              v46 = *((double *)&v101 + 1) + v40;
              v44 = v46;
              if (v46 >= *(float *)(v16 + 284))
                v45 = *(float *)(v16 + 284);
              else
                v45 = v46;
            }
            *(float *)(v16 + 284) = v45;
            *(float *)(v16 + 280) = v44;
            v47 = *(float *)(v16 + 288) - *(double *)&v101;
            *(float *)(v16 + 288) = v47;
            v48 = CFNumberCreate(v19, kCFNumberFloatType, (const void *)(v16 + 280));
            CVBufferSetAttachment(v18, CFSTR("ACTPreviewAssemblyPositionXMetadataKey"), v48, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v48);
            v49 = CFNumberCreate(v19, kCFNumberFloatType, (const void *)(v16 + 288));
            CVBufferSetAttachment(v18, CFSTR("ACTPreviewAssemblyPositionYMetadataKey"), v49, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v49);
            v50 = *(opaqueCMSampleBuffer **)(v16 + 104);
            if (v50)
            {
              memset(&v102, 0, sizeof(v102));
              CMSampleBufferGetPresentationTimeStamp(&v102, v50);
              memset(&v97, 0, sizeof(v97));
              CMSampleBufferGetPresentationTimeStamp(&v97, v4);
              time = v97;
              Seconds = CMTimeGetSeconds(&time);
              time = v102;
              v52 = Seconds - CMTimeGetSeconds(&time);
              *(float *)&time.value = v52;
              v53 = CFNumberCreate(v19, kCFNumberFloatType, &time);
              CVBufferSetAttachment(v18, CFSTR("ACTDeltaPTSAttachmentKey"), v53, kCVAttachmentMode_ShouldPropagate);
              CFRelease(v53);
            }
            v54 = *(opaqueCMSimpleQueue **)(v16 + 40);
            Attachments = CVBufferGetAttachments(v18, kCVAttachmentMode_ShouldPropagate);
            v56 = CFRetain(Attachments);
            CMSimpleQueueEnqueue(v54, v56);
            ++*(_DWORD *)(v16 + 784);
            ACTThreadWakeup();
            v57 = *(const void **)(v16 + 104);
            if (v57)
            {
              CFRelease(v57);
              if (*(_QWORD *)(v16 + 464))
              {
                v58 = v99 - 1;
                v59 = GetHostTime();
                ACTLogMessageImp(1, "{Registration%d|BufferReleaseTS:%.3f}\n", v58, v59);
              }
            }
            v60 = CMSampleBufferGetImageBuffer(v4);
            v61 = (const __CFDictionary *)CVBufferGetAttachment(v60, v5, 0);
            v62 = 0.0;
            if (v61 && (Value = (const __CFString *)CFDictionaryGetValue(v61, v86)) != 0)
            {
              if (CFStringCompare(Value, theString2, 0))
              {
                v64 = 0;
                v65 = (_DWORD *)(v16 + 840);
              }
              else
              {
                v62 = (float)*(int *)(v16 + 856);
                v64 = *(_DWORD *)(v16 + 860);
                v65 = (_DWORD *)(v16 + 848);
              }
              *(_DWORD *)(v16 + 852) = *v65;
              setMaxOverlapPercent(*(_QWORD **)(v16 + 440));
            }
            else
            {
              v64 = 0;
            }
            *(_DWORD *)(v16 + 864) = v64;
            *(_QWORD *)(v16 + 104) = FigSampleBufferRetain();
            v66 = *(_DWORD *)(v16 + 172);
            if (v66 == 2)
            {
              if ((float)(*(float *)(v16 + 280) - (float)(v62 + (float)((float)*(unint64_t *)(v16 + 344) * 0.5))) > 0.0)
                goto LABEL_69;
            }
            else if (v66 != 1
                   || *(float *)(v16 + 280) <= (float)((float)*(int *)(v16 + 328)
                                                     - (float)(v62
                                                             + (float)((float)*(unint64_t *)(v16 + 344) * 0.5))))
            {
LABEL_69:
              v70 = *(float *)(v16 + 284);
              v71 = *(float *)(v16 + 280);
              v72 = *(float *)(v16 + 164);
              if (vabds_f32(v70, v71) > v72)
              {
                if (*(_DWORD *)(v16 + 172) == 1)
                {
                  if ((float)(v70 - v71) > v72)
                  {
                    LocalCenter = CFNotificationCenterGetLocalCenter();
                    CFNotificationCenterPostNotification(LocalCenter, CFSTR("ACTPanoramaErrorNotifications"), CFSTR("ACTPanoramaUserStopped"), 0, 1u);
                    if (*(_QWORD *)(v16 + 464))
                    {
                      memset(&v102, 0, sizeof(v102));
                      CMSampleBufferGetPresentationTimeStamp(&v102, v4);
                      v97 = v102;
                      CMTimeGetSeconds(&v97);
                      GetHostTime();
                      ACTLogMessageImp(1, "UserStopped triggered with buffer %p, %.2f, at %.2f storage->previewAssemblyPositionMaxX %d storage->previewAssemblyPositionX %.3f \n");
                    }
                  }
                }
                else if ((float)(v71 - v70) > v72)
                {
                  v74 = CFNotificationCenterGetLocalCenter();
                  CFNotificationCenterPostNotification(v74, CFSTR("ACTPanoramaErrorNotifications"), CFSTR("ACTPanoramaUserStopped"), 0, 1u);
                  if (*(_QWORD *)(v16 + 464))
                  {
                    memset(&v102, 0, sizeof(v102));
                    CMSampleBufferGetPresentationTimeStamp(&v102, v4);
                    v97 = v102;
                    CMTimeGetSeconds(&v97);
                    GetHostTime();
                    ACTLogMessageImp(1, "UserStopped triggered with buffer %p, %.2f, at %.2f storage->previewAssemblyPositionMaxX %.3f storage->previewAssemblyPositionX %.3f \n");
                  }
                }
              }
              goto LABEL_77;
            }
            v67 = CFNotificationCenterGetLocalCenter();
            CFNotificationCenterPostNotification(v67, CFSTR("ACTPanoramaErrorNotifications"), CFSTR("ACTPanoramaMaxSizeReached"), 0, 1u);
            *(_BYTE *)(v16 + 218) = 1;
            if (*(_QWORD *)(v16 + 464))
            {
              memset(&v102, 0, sizeof(v102));
              CMSampleBufferGetPresentationTimeStamp(&v102, v4);
              v97 = v102;
              v68 = CMTimeGetSeconds(&v97);
              v69 = GetHostTime();
              ACTLogMessageImp(1, "ACTPanoramaMaxSizeReached triggered with buffer %p, %.2f, at %.2f\n", v4, v68, v69);
            }
            goto LABEL_69;
          }
          v41 = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(v41, CFSTR("ACTPanoramaErrorNotifications"), CFSTR("ACTPanoramaMaxSizeReached"), 0, 1u);
          *(_BYTE *)(v16 + 218) = 1;
          ACTLogMessageImp(4, "assemblyQueue full\n");
        }
      }
      else
      {
        FigSampleBufferRelease();
        *(_QWORD *)(v16 + 104) = FigSampleBufferRetain();
      }
LABEL_77:
      v75 = *(_DWORD *)(DerivedStorage + 460);
      if ((v75 & 3) != 0)
      {
        if (*(_DWORD *)(DerivedStorage + 172) | *(_DWORD *)(DerivedStorage + 460) & 8)
        {
          if (!*(_BYTE *)(DerivedStorage + 772))
          {
            sub_227617CF4(a1, v94, 1);
            *(_BYTE *)(DerivedStorage + 772) = 1;
          }
          sub_227617CF4(a1, v4, 0);
        }
      }
      else if ((v75 & 4) != 0)
      {
        Mutable = CFDictionaryCreateMutable(v6, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        if (Mutable)
        {
          v77 = Mutable;
          memset(&v103, 0, sizeof(v103));
          CMSampleBufferGetPresentationTimeStamp(&v103, v4);
          v102.value = 0;
          *(CMTime *)v100 = v103;
          v102.value = CMTimeGetSeconds((CMTime *)v100);
          v78 = CFNumberCreate(v6, kCFNumberFloat64Type, &v102);
          v79 = CVBufferGetAttachment(buffer, v5, 0);
          if (v79)
            CFDictionaryAddValue(v77, v5, v79);
          v80 = CVBufferGetAttachment(buffer, CFSTR("ACTRegistrationTransformationKey"), 0);
          if (v80)
            CFDictionaryAddValue(v77, CFSTR("ACTRegistrationTransformationKey"), v80);
          CFDictionaryAddValue(v77, CFSTR("CaptureTimeInSeconds"), v78);
          CFRelease(v78);
          v81 = CVBufferGetAttachment(buffer, CFSTR("ID"), 0);
          if (v81)
            CFDictionaryAddValue(v77, CFSTR("ID"), v81);
          CFArrayAppendValue(*(CFMutableArrayRef *)(DerivedStorage + 760), v77);
          CFRelease(v77);
        }
      }
      FigSampleBufferRelease();
      FigSampleBufferRelease();
      v82 = valuePtr;
      v83 = GetHostTime();
      ACTLogMessageImp(1, "{Registration%d|EndTS:%.3f}\n", v82, v83);
      v4 = (opaqueCMSampleBuffer *)CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(DerivedStorage + 32));
    }
    while (v4);
  }
  return 0;
}

uint64_t sub_2276142D0()
{
  uint64_t DerivedStorage;
  void *v1;
  void *v2;
  double HostTime;
  CFTypeID v4;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v6;
  double v7;
  const __CFNumber *Attachment;
  const __CFNumber *v9;
  int v10;
  const __CFNumber *Value;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  double v18;
  int v19;
  double v20;
  int v22;
  int valuePtr;
  char v24[8];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = (void *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 40));
  if (v1)
  {
    v2 = v1;
    do
    {
      valuePtr = 0;
      HostTime = GetHostTime();
      v4 = CFGetTypeID(v2);
      if (v4 == CMSampleBufferGetTypeID())
      {
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v2);
        v6 = (__CVBuffer *)cropAndRotateBufferForBlending(*(_QWORD **)(DerivedStorage + 440), ImageBuffer);
        v7 = GetHostTime();
        Attachment = (const __CFNumber *)CVBufferGetAttachment(ImageBuffer, CFSTR("ID"), 0);
        v9 = Attachment;
        if (Attachment)
          CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
        CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 48), v2);
        ACTThreadWakeup();
        ACTLogMessageImp(1, "{Blending%d|cropAndRotateBufferForBlendingTook:%.3f}\n", valuePtr, v7 - HostTime);
        v10 = *(_DWORD *)(DerivedStorage + 460);
        if ((v10 & 2) != 0 && (v10 & 4) == 0 && valuePtr >= 1)
        {
          CVPixelBufferRetain(v6);
          CVBufferSetAttachment(v6, CFSTR("ID"), v9, kCVAttachmentMode_ShouldNotPropagate);
          CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 56), v6);
          ACTThreadWakeup();
        }
      }
      else
      {
        CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 48), v2);
        ACTThreadWakeup();
        Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ID"));
        v22 = 0;
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberIntType, &v22);
          v12 = v22;
        }
        else
        {
          v12 = 0;
        }
        ACTLogMessageImp(1, "{Blending%d|BeginTS:%.3f}\n", v12, HostTime);
        if (!*(_BYTE *)(DerivedStorage + 888))
        {
          blendSliceIntoContext(*(_QWORD **)(DerivedStorage + 440));
          v13 = *(_QWORD **)(DerivedStorage + 440);
          if (v13[1])
          {
            if (*(_QWORD *)(DerivedStorage + 928))
            {
              *(_QWORD *)v24 = 0;
              getCroppingArea(v13);
              v14 = *(_QWORD *)(DerivedStorage + 360);
              v15 = -v14;
              if (v14)
              {
                v16 = -*(_DWORD *)v24;
                MEMORY[0x2276B4590](*(_QWORD *)(DerivedStorage + 1016));
                *(double *)(DerivedStorage + 936) = (double)0;
                *(double *)(DerivedStorage + 944) = (double)*(unint64_t *)v24;
                *(double *)(DerivedStorage + 952) = (double)v15;
                *(double *)(DerivedStorage + 960) = (double)v16;
                MEMORY[0x2276B459C](*(_QWORD *)(DerivedStorage + 1016));
              }
              ACTThreadWakeup();
            }
          }
        }
        if (*(_QWORD *)(DerivedStorage + 464))
        {
          if (v22 < 1)
            __sprintf_chk(v24, 0, 0x40uLL, "BlendingFirstFrame");
          else
            __sprintf_chk(v24, 0, 0x40uLL, "Blending%d");
          v17 = (GetHostTime() - HostTime) * 1000.0;
          v18 = GetHostTime();
          ACTLogMessageImp(1, "{%s|took:%.3f} {%s|BufferReleaseTS:%.3f}\n", v24, v17, v24, v18);
        }
        v19 = v22;
        v20 = GetHostTime();
        ACTLogMessageImp(1, "{Blending%d|EndTS:%.3f}\n", v19, v20);
      }
      v2 = (void *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 40));
    }
    while (v2);
  }
  return 0;
}

uint64_t sub_227614634()
{
  uint64_t DerivedStorage;
  void *v1;
  void *v2;
  float v3;
  const __CFAllocator *v4;
  _BOOL4 v5;
  double HostTime;
  CFTypeID v7;
  CFTypeID TypeID;
  const __CFNumber *Value;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  int v15;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v17;
  const __CFNumber *Attachment;
  int v19;
  float v20;
  float v21;
  float v22;
  float v23;
  const __CFData *v24;
  const UInt8 *BytePtr;
  const __CFNumber *v26;
  double v27;
  float v28;
  float v29;
  float v30;
  int v31;
  int v32;
  float v33;
  const void *ModelSpecificName;
  int v35;
  const void *v36;
  float v37;
  int v38;
  const void *v39;
  float v40;
  _BOOL4 v41;
  double v42;
  size_t Width;
  double Height;
  size_t v45;
  double v46;
  double v47;
  double v48;
  int v49;
  double v50;
  void *v51;
  size_t v52;
  double v53;
  double v54;
  signed int v55;
  double v56;
  const __CFDictionary *v57;
  const __CFDictionary *v58;
  const __CFNumber *v59;
  int v60;
  const __CFBoolean *v61;
  _BOOL4 v62;
  double v63;
  const __CFNumber *v64;
  const __CFNumber *v65;
  const __CFNumber *v66;
  const __CFNumber *v67;
  const __CFNumber *v68;
  const __CFNumber *v69;
  int v70;
  double v71;
  CVImageBufferRef v72;
  const __CFDictionary *v73;
  const __CFNumber *v74;
  int v75;
  double v76;
  int v77;
  double v78;
  double v79;
  size_t v80;
  double v81;
  int v82;
  double v83;
  CFNumberRef v84;
  CFNumberRef v85;
  char *BaseAddress;
  size_t BytesPerRow;
  size_t v88;
  size_t v89;
  size_t v90;
  __CVBuffer *v91;
  void *v92;
  size_t DataSize;
  int v94;
  size_t v95;
  size_t i;
  size_t v97;
  int v98;
  int v99;
  int j;
  int v101;
  int v102;
  size_t v103;
  int v104;
  char *v105;
  size_t v106;
  int v107;
  uint64_t v108;
  unint64_t v109;
  int v110;
  int v111;
  size_t v112;
  size_t v113;
  int v114;
  int v115;
  uint64_t v116;
  int v117;
  unint64_t v118;
  size_t v119;
  double v120;
  int v121;
  unint64_t v122;
  double v123;
  int v124;
  unint64_t v125;
  size_t v126;
  size_t v127;
  int v128;
  int v129;
  uint64_t v130;
  char *v131;
  int v132;
  unint64_t v133;
  double v134;
  size_t v135;
  int v136;
  int v137;
  uint64_t v138;
  uint64_t v139;
  int v140;
  uint64_t v141;
  CFDictionaryRef DictionaryRepresentation;
  CFNumberRef v143;
  CFNumberRef v144;
  CFNumberRef v145;
  void (*v146)(_QWORD, _QWORD, _QWORD);
  double v147;
  int v148;
  double v149;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  CFTypeRef cf2;
  void *v160;
  const __CFAllocator *allocator;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  int valuePtr;
  float v171[3];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = (void *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 48));
  if (v1)
  {
    v2 = v1;
    v158 = (void *)*MEMORY[0x24BE10A38];
    v156 = (void *)*MEMORY[0x24BE10AD0];
    v157 = (void *)*MEMORY[0x24BE10CC0];
    v154 = (void *)*MEMORY[0x24BE10AA8];
    v155 = (void *)*MEMORY[0x24BE10AA0];
    v153 = (void *)*MEMORY[0x24BE10A98];
    v152 = (void *)*MEMORY[0x24BE10A88];
    v151 = (void *)*MEMORY[0x24BE10A90];
    v160 = (void *)*MEMORY[0x24BE11488];
    v3 = 1.0;
    cf2 = (CFTypeRef)*MEMORY[0x24BE105A8];
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    while (1)
    {
      valuePtr = -1;
      v168 = 0;
      v169 = 0;
      v5 = *(_BYTE *)(DerivedStorage + 217) == 0;
      v167 = 0;
      if (*(_BYTE *)(DerivedStorage + 218))
      {
        CFRelease(v2);
        return 0;
      }
      HostTime = GetHostTime();
      v7 = CFGetTypeID(v2);
      TypeID = CMSampleBufferGetTypeID();
      if (v7 != TypeID)
      {
        Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ID"));
        if (Value)
          CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
        v10 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("MetadataDictionary"));
        v11 = v10;
        if (v10)
        {
          v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("ExposureTime"));
          if (v12)
            CFNumberGetValue(v12, kCFNumberFloat32Type, (char *)&v168 + 4);
        }
        v13 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ACTPreviewAssemblyPositionXMetadataKey"));
        if (v13)
        {
          CFNumberGetValue(v13, kCFNumberIntType, (char *)&v169 + 4);
          HIDWORD(v169) = vcvts_n_s32_f32(ceilf(*(float *)(DerivedStorage + 332) * (float)SHIDWORD(v169)), 2uLL);
        }
        v14 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ACTPreviewAssemblyPositionYMetadataKey"));
        if (v14)
        {
          CFNumberGetValue(v14, kCFNumberIntType, &v169);
          v15 = v169;
        }
        else
        {
          v15 = (int)*(float *)(DerivedStorage + 288);
        }
        LODWORD(v169) = vcvtps_s32_f32(*(float *)(DerivedStorage + 336) * (float)v15);
        v20 = *(float *)(DerivedStorage + 828);
        if (*((float *)&v168 + 1) >= v20)
        {
          v22 = *(float *)(DerivedStorage + 820);
        }
        else
        {
          v21 = *(float *)(DerivedStorage + 832);
          if (*((float *)&v168 + 1) <= v21)
            v22 = *(float *)(DerivedStorage + 824);
          else
            v22 = *(float *)(DerivedStorage + 824)
                + (float)((float)(*(float *)(DerivedStorage + 820) - *(float *)(DerivedStorage + 824))
                        * (float)((float)(*((float *)&v168 + 1) - v21) / (float)(v20 - v21)));
        }
        v23 = v22 / *((float *)&v168 + 1);
        if ((float)(*(float *)(DerivedStorage + 836) * 30.0) < (float)(v22 / *((float *)&v168 + 1)))
          v23 = *(float *)(DerivedStorage + 836) * 30.0;
        *(float *)(DerivedStorage + 812) = *(float *)(DerivedStorage + 332) * v23;
        v171[0] = 0.033333;
        v24 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ACTRegistrationTransformationKey"));
        if (!v24)
          goto LABEL_58;
        BytePtr = CFDataGetBytePtr(v24);
        v26 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, CFSTR("ACTDeltaPTSAttachmentKey"));
        if (v26)
          CFNumberGetValue(v26, kCFNumberFloatType, v171);
        v27 = *((double *)BytePtr + 5);
        v28 = v27;
        v29 = fabsf(v28);
        v30 = (float)*(unint64_t *)(DerivedStorage + 360);
        if (v29 >= v30)
        {
          v31 = 4;
          goto LABEL_34;
        }
        if (v29 > (float)((float)(v3 - *(float *)(DerivedStorage + 844)) * v30))
        {
          v31 = 3;
          goto LABEL_34;
        }
        if (v29 <= (float)((float)(v3 - *(float *)(DerivedStorage + 852)) * v30))
        {
          if (v29 > (float)(v22 / (float)(*((float *)&v168 + 1) * (float)(v3 / v171[0]))))
            v167 = 1;
        }
        else
        {
          v31 = 2;
LABEL_34:
          v167 = v31;
        }
        v32 = *(_DWORD *)(DerivedStorage + 172);
        if (v32 == 2)
        {
          if (v27 <= 0.0)
            goto LABEL_41;
        }
        else if (v32 != 1 || v27 >= 0.0)
        {
LABEL_41:
          v33 = (float)(v3 - *(float *)(DerivedStorage + 852)) * v30;
          if ((float)(v22 / (float)(*((float *)&v168 + 1) * (float)(v3 / v171[0]))) < v33)
            v33 = v22 / (float)(*((float *)&v168 + 1) * (float)(v3 / v171[0]));
          *(float *)&v168 = v29 / v33;
          ModelSpecificName = (const void *)FigCaptureGetModelSpecificName();
          v35 = CFEqual(ModelSpecificName, CFSTR("D84"));
          if (v11)
          {
            if (v35)
            {
              v36 = CFDictionaryGetValue(v11, v160);
              if (v36)
              {
                if (CFEqual(v36, cf2))
                {
                  v37 = *(float *)&v168 * 0.8;
                  *(float *)&v168 = v37;
                }
              }
            }
          }
          if (CFEqual(ModelSpecificName, CFSTR("D93")))
          {
            if (!v11)
              goto LABEL_56;
          }
          else
          {
            v38 = CFEqual(ModelSpecificName, CFSTR("D94"));
            if (!v11 || !v38)
              goto LABEL_56;
          }
          v39 = CFDictionaryGetValue(v11, v160);
          if (v39 && CFEqual(v39, cf2))
          {
            v40 = *(float *)&v168 * 0.8;
            *(float *)&v168 = v40;
          }
LABEL_56:
          if (*(_QWORD *)(DerivedStorage + 464))
            ACTLogMessageImp(1, "{Preview%d|previewMotionSpeedScale:%f} {Preview%d|xDeviationCondition:%d} {Preview%d|exposureTime:%f} {Preview%d|deltaPTS:%f} {Preview%d|currentGhostingSpeedScale:%f}\n", valuePtr, *(float *)&v168, valuePtr, v167, valuePtr, *((float *)&v168 + 1), valuePtr, v171[0], valuePtr, v22);
LABEL_58:
          CFRelease(v2);
          v41 = 0;
          goto LABEL_117;
        }
        v167 = ~v167;
        goto LABEL_41;
      }
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v2);
      v17 = ImageBuffer;
      if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
      {
        Attachment = (const __CFNumber *)CVBufferGetAttachment(ImageBuffer, CFSTR("ID"), 0);
        if (Attachment)
        {
          CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
          v19 = valuePtr;
          if (!valuePtr)
            v5 = 1;
        }
        else
        {
          v19 = valuePtr;
        }
        v42 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|M2MBeginTS:%.3f}\n", v19, v42);
      }
      Width = CVPixelBufferGetWidth(v17);
      Height = (double)CVPixelBufferGetHeight(v17);
      v45 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 128));
      v46 = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 128));
      v47 = 0.0;
      if (v5)
      {
        v48 = 0.0;
      }
      else
      {
        v49 = *(_DWORD *)(DerivedStorage + 172);
        Height = Height * 0.5;
        v46 = v46 * 0.5;
        if (v49 == 1)
          v47 = 0.0;
        else
          v47 = Height;
        if (v49 == 1)
          v48 = 0.0;
        else
          v48 = v46;
      }
      v50 = (double)Width;
      v51 = *(void **)(DerivedStorage + 872);
      if (v51)
        ACTPano_GPUDownscaler_downscale(v51, (const char *)v17, *(_QWORD *)(DerivedStorage + 128), 0.0, v47, v50, Height, 0.0, v48, (double)v45);
      else
        scaleCropAndRotatePixelBuffer(*(_QWORD *)(DerivedStorage + 64), v17, *(CVBufferRef *)(DerivedStorage + 128), 0.0, v47, v50, Height, 0.0, v48, (double)v45, v46);
      v52 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 136));
      v53 = (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 136));
      v54 = 0.0;
      if (!v5)
      {
        v55 = ((int)(v53 * 0.5) + 1) & 0xFFFFFFFE;
        if (*(_DWORD *)(DerivedStorage + 172) == 1)
          v54 = 0.0;
        else
          v54 = v53 - (double)v55;
        v53 = (double)v55;
      }
      v56 = (double)v52;
      scaleCropAndRotatePixelBuffer(*(_QWORD *)(DerivedStorage + 64), *(CVBufferRef *)(DerivedStorage + 128), *(CVBufferRef *)(DerivedStorage + 136), 0.0, v48, (double)v45, v46, 0.0, v54, (double)v52, v53);
      v3 = 1.0;
      if (valuePtr >= 1)
      {
        v57 = (const __CFDictionary *)CVBufferGetAttachment(v17, CFSTR("MetadataDictionary"), 0);
        if (v57)
        {
          v58 = v57;
          v59 = (const __CFNumber *)CFDictionaryGetValue(v57, v158);
          if (v59)
          {
            v171[0] = 0.0;
            CFNumberGetValue(v59, kCFNumberIntType, v171);
            v60 = LODWORD(v171[0]);
            v61 = (const __CFBoolean *)CFDictionaryGetValue(v58, v157);
            v62 = v61 && CFBooleanGetValue(v61) != 0;
            if ((float)(256.0 / (float)v60) != 1.0 || *(_BYTE *)(DerivedStorage + 808))
              break;
          }
        }
      }
LABEL_103:
      v72 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v2);
      v73 = (const __CFDictionary *)CMGetAttachment(v72, CFSTR("MetadataDictionary"), 0);
      if (v73)
      {
        v74 = (const __CFNumber *)CFDictionaryGetValue(v73, CFSTR("ExposureTime"));
        if (v74)
          CFNumberGetValue(v74, kCFNumberFloat32Type, (char *)&v168 + 4);
      }
      if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
      {
        v75 = valuePtr;
        v76 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|BufferReleaseTS:%.3f}\n", v75, v76);
        v77 = valuePtr;
        v78 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|M2MStage1took:%.3f}\n", v77, (v78 - HostTime) * 1000.0);
      }
      HostTime = GetHostTime();
      v79 = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v80 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v81 = 0.0;
      if (!v5)
      {
        v79 = v79 * 0.5;
        if (*(_DWORD *)(DerivedStorage + 172) == 1)
          v81 = v79;
        else
          v81 = 0.0;
      }
      scaleAndRotatePixelBuffer(*(_QWORD *)(DerivedStorage + 80), *(CVBufferRef *)(DerivedStorage + 136), *(CVBufferRef *)(DerivedStorage + 144), 0.0, v54, v56, v53, v81, 0.0, v79, (double)v80);
      if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
      {
        v82 = valuePtr;
        v83 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|M2MStage2took:%.3f}\n", v82, (v83 - HostTime) * 1000.0);
      }
      v41 = v5;
      CFRelease(v2);
      if (*(_BYTE *)(DerivedStorage + 217))
        goto LABEL_213;
LABEL_117:
      if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
        ACTLogMessageImp(1, "{Preview%d|BeginTS:%.3f}\n", valuePtr, HostTime);
      v84 = CFNumberCreate(v4, kCFNumberIntType, &v167);
      CVBufferSetAttachment(*(CVBufferRef *)(DerivedStorage + 88), CFSTR("ACTPanoramaPreviewXDeviation"), v84, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v84);
      v85 = CFNumberCreate(v4, kCFNumberFloatType, &v168);
      CVBufferSetAttachment(*(CVBufferRef *)(DerivedStorage + 88), CFSTR("ACTPanoramaPreviewMotionSpeedScale"), v85, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v85);
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 88));
      BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(DerivedStorage + 88));
      v88 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 88));
      v89 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 88));
      v90 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v91 = *(__CVBuffer **)(DerivedStorage + 152);
      if (v7 != TypeID && v91 && !*(_DWORD *)(DerivedStorage + 168))
      {
        v92 = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 88));
        DataSize = CVPixelBufferGetDataSize(*(CVPixelBufferRef *)(DerivedStorage + 88));
        bzero(v92, DataSize);
        CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 152), 1uLL);
        if (*(_DWORD *)(DerivedStorage + 172) == 1)
        {
          v94 = v169;
          v95 = v89 - (int)v169;
          if (v90 < v95)
            v95 = v90;
          if (v95)
          {
            for (i = 0; i < v97; ++i)
            {
              if ((int)i + v94 >= 0)
              {
                CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 152));
                v94 = v169;
              }
              v97 = v89 - v94;
              if (v90 < v97)
                v97 = v90;
            }
          }
        }
        else
        {
          v98 = v169;
          v99 = v89 - v169;
          if ((int)v89 - (int)v169 >= (int)v90)
            v99 = v90;
          if (v99 >= 1)
          {
            for (j = 0; j < v101; ++j)
            {
              if (v98 + j >= 0)
              {
                CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 152));
                v98 = v169;
              }
              v101 = v89 - v98;
              if ((int)v89 - v98 >= (int)v90)
                v101 = v90;
            }
          }
        }
        CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 152), 1uLL);
        CVPixelBufferRelease(*(CVPixelBufferRef *)(DerivedStorage + 152));
        v91 = 0;
        *(_QWORD *)(DerivedStorage + 152) = 0;
      }
      if (v7 != TypeID && valuePtr)
        goto LABEL_151;
      v102 = *(_DWORD *)(DerivedStorage + 172);
      if (v102 == 2)
      {
        HIDWORD(v169) = 4 * v88;
        if (!v91)
          goto LABEL_150;
        goto LABEL_149;
      }
      if (v102 != 1)
      {
        v121 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 88));
        HIDWORD(v169) = 2 * (v121 - CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 144)));
        v91 = *(__CVBuffer **)(DerivedStorage + 152);
        if (!v91)
          goto LABEL_150;
LABEL_149:
        CVPixelBufferRelease(v91);
        *(_QWORD *)(DerivedStorage + 152) = 0;
        goto LABEL_150;
      }
      HIDWORD(v169) = 0;
      if (v91)
        goto LABEL_149;
LABEL_150:
      *(_QWORD *)(DerivedStorage + 152) = CVPixelBufferRetain(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v41 = 1;
LABEL_151:
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 144), 1uLL);
      v103 = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v104 = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v105 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v106 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(DerivedStorage + 144));
      v107 = *(_DWORD *)(DerivedStorage + 172);
      if (v107)
      {
        if (v107 == 1)
        {
          if (v41)
          {
            v108 = 0;
            v109 = 4 * v103;
            v110 = SHIDWORD(v169) / 4;
            *(double *)(DerivedStorage + 296) = (double)(SHIDWORD(v169) / 4);
            *(double *)(DerivedStorage + 312) = (double)v103;
          }
          else
          {
            v122 = vcvtms_u32_f32((float)v103 * 0.5);
            v109 = 4 * (v103 - v122);
            v108 = 4 * v122;
            *(_QWORD *)(DerivedStorage + 296) = 0;
            v123 = *(double *)(DerivedStorage + 312);
            v124 = HIDWORD(v169);
            v125 = 4 * v88 - SHIDWORD(v169);
            if (v109 < v125)
              v125 = v109;
            if (v123 <= (double)((v125 + SHIDWORD(v169)) >> 2))
              v123 = (double)((v125 + SHIDWORD(v169)) >> 2);
            *(double *)(DerivedStorage + 312) = v123;
            v110 = v124 / 4;
          }
          v126 = v88 - v110;
          if (v109 >= 4 * v126)
            v127 = 4 * v126;
          else
            v127 = v109;
          v128 = v169;
          v129 = v89 - v169;
          if ((int)v89 - (int)v169 >= v104)
            v129 = v104;
          if (v129 >= 1)
          {
            v130 = 0;
            v131 = &v105[v108];
            do
            {
              if ((((_DWORD)v130 + v128) & 0x80000000) == 0)
              {
                memcpy(&BaseAddress[BytesPerRow * (v130 + v128) + SHIDWORD(v169)], v131, v127);
                v128 = v169;
              }
              ++v130;
              v132 = v89 - v128;
              if ((int)v89 - v128 >= v104)
                v132 = v104;
              v131 += v106;
            }
            while (v130 < v132);
          }
        }
        else
        {
          if (v41)
          {
            v118 = 4 * v103;
            v119 = SHIDWORD(v169);
            *(double *)(DerivedStorage + 296) = (double)(SHIDWORD(v169) / 4);
            v120 = (double)v103;
          }
          else
          {
            v133 = vcvtms_u32_f32((float)v103 * 0.5);
            v118 = 4 * v133;
            v134 = *(double *)(DerivedStorage + 296);
            v119 = SHIDWORD(v169);
            if (v134 >= (double)((SHIDWORD(v169) - 4 * v133) >> 2))
              v134 = (double)((SHIDWORD(v169) - 4 * v133) >> 2);
            *(double *)(DerivedStorage + 296) = v134;
            v120 = (double)v88 - v134;
          }
          *(double *)(DerivedStorage + 312) = v120;
          if (v118 >= v119)
            v135 = v119;
          else
            v135 = v118;
          v136 = v169;
          v137 = v89 - v169;
          if ((int)v89 - (int)v169 >= v104)
            v137 = v104;
          if (v137 >= 1)
          {
            v138 = 0;
            v139 = -(uint64_t)v118;
            do
            {
              if ((((_DWORD)v138 + v136) & 0x80000000) == 0)
              {
                memcpy(&BaseAddress[BytesPerRow * (v138 + v136) + SHIDWORD(v169) + v139], v105, v135);
                v136 = v169;
              }
              ++v138;
              v140 = v89 - v136;
              if ((int)v89 - v136 >= v104)
                v140 = v104;
              v105 += v106;
            }
            while (v138 < v140);
          }
        }
      }
      else
      {
        v111 = SHIDWORD(v169) / 4;
        v112 = v88 - SHIDWORD(v169) / 4;
        if (4 * v103 >= 4 * v112)
          v113 = 4 * v112;
        else
          v113 = 4 * v103;
        v114 = v169;
        v115 = v89 - v169;
        if ((int)v89 - (int)v169 >= v104)
          v115 = v104;
        if (v115 >= 1)
        {
          v116 = 0;
          do
          {
            if ((((_DWORD)v116 + v114) & 0x80000000) == 0)
            {
              memcpy(&BaseAddress[BytesPerRow * (v116 + v114) + SHIDWORD(v169)], v105, v113);
              v114 = v169;
            }
            ++v116;
            v117 = v89 - v114;
            if ((int)v89 - v114 >= v104)
              v117 = v104;
            v105 += v106;
          }
          while (v116 < v117);
          v111 = SHIDWORD(v169) / 4;
        }
        *(double *)(DerivedStorage + 296) = (double)v111;
        *(double *)(DerivedStorage + 312) = (double)v103;
      }
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 144), 1uLL);
      *(_QWORD *)(DerivedStorage + 304) = 0;
      *(double *)(DerivedStorage + 320) = (double)v89;
      v141 = CMBaseObjectGetDerivedStorage();
      LODWORD(v171[0]) = vcvtms_s32_f32(*(float *)(v141 + 288));
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(v141 + 296));
      CVBufferSetAttachment(*(CVBufferRef *)(v141 + 88), CFSTR("ACTPanoramaPreviewCropRect"), DictionaryRepresentation, kCVAttachmentMode_ShouldPropagate);
      CFRelease(DictionaryRepresentation);
      v4 = allocator;
      v143 = CFNumberCreate(allocator, kCFNumberIntType, v171);
      CVBufferSetAttachment(*(CVBufferRef *)(v141 + 88), CFSTR("ACTPanoramaPreviewYDeviation"), v143, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v143);
      v144 = CFNumberCreate(allocator, kCFNumberFloatType, (const void *)(v141 + 812));
      CVBufferSetAttachment(*(CVBufferRef *)(v141 + 88), CFSTR("ACTPanoramaPreviewIdealAdvancement"), v144, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v144);
      v145 = CFNumberCreate(allocator, kCFNumberIntType, (const void *)(v141 + 172));
      CVBufferSetAttachment(*(CVBufferRef *)(v141 + 88), CFSTR("ACTPanoramaDefaultDirection"), v145, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v145);
      v146 = *(void (**)(_QWORD, _QWORD, _QWORD))(v141 + 8);
      if (v146)
        v146(*(_QWORD *)(v141 + 16), 0, *(_QWORD *)(v141 + 96));
      if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
      {
        v147 = (GetHostTime() - HostTime) * 1000.0;
        v148 = valuePtr;
        v149 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|took:%.3f} {Preview%d|EndTS:%.3f}\n", v148, v147, v148, v149);
      }
LABEL_213:
      v2 = (void *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(DerivedStorage + 48));
      if (!v2)
        return 0;
    }
    v63 = GetHostTime();
    LODWORD(v171[0]) = 1;
    v165 = 1;
    v166 = 1;
    v163 = 1;
    v164 = 1;
    v162 = 1;
    v64 = (const __CFNumber *)CFDictionaryGetValue(v58, v156);
    if (v64)
      CFNumberGetValue(v64, kCFNumberIntType, v171);
    v65 = (const __CFNumber *)CFDictionaryGetValue(v58, v155);
    if (v65)
      CFNumberGetValue(v65, kCFNumberIntType, &v166);
    else
      v166 = LODWORD(v171[0]);
    v66 = (const __CFNumber *)CFDictionaryGetValue(v58, v154);
    if (v66)
      CFNumberGetValue(v66, kCFNumberIntType, &v165);
    v67 = (const __CFNumber *)CFDictionaryGetValue(v58, v153);
    if (v67)
      CFNumberGetValue(v67, kCFNumberIntType, &v164);
    else
      v164 = v165;
    v68 = (const __CFNumber *)CFDictionaryGetValue(v58, v152);
    if (v68)
      CFNumberGetValue(v68, kCFNumberIntType, &v163);
    v69 = (const __CFNumber *)CFDictionaryGetValue(v58, v151);
    if (v69)
    {
      CFNumberGetValue(v69, kCFNumberIntType, &v162);
      if (!v62)
      {
LABEL_102:
        v70 = valuePtr;
        v71 = GetHostTime();
        ACTLogMessageImp(1, "{Preview%d|exposureBlendingTook:%f}", v70, v71 - v63);
        goto LABEL_103;
      }
    }
    else
    {
      v162 = v163;
      if (!v62)
        goto LABEL_102;
    }
    PixelShuffler_yuv420ExposureMap();
    goto LABEL_102;
  }
  return 0;
}

uint64_t sub_2276156D4()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double HostTime;
  int v7;
  __CVBuffer *TargetContext;
  double v9;
  int v10;
  int v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = *(_QWORD *)(DerivedStorage + 440);
  if (v1)
  {
    v2 = *(int **)(v1 + 8);
    if (v2)
    {
      v3 = DerivedStorage;
      v15 = 0;
      v16 = 0;
      v13 = 0;
      v14 = 0;
      do
      {
        MEMORY[0x2276B4590](*(_QWORD *)(v3 + 1016));
        v4 = (unint64_t)*(double *)(v3 + 936);
        v15 = (unint64_t)*(double *)(v3 + 944);
        v16 = v4;
        v5 = (unint64_t)*(double *)(v3 + 952);
        v13 = (unint64_t)*(double *)(v3 + 960);
        v14 = v5;
        *(_DWORD *)(v3 + 1004) = *(_DWORD *)(v3 + 1000);
        MEMORY[0x2276B459C](*(_QWORD *)(v3 + 1016));
        HostTime = GetHostTime();
        v7 = v2[40];
        v2[40] = v7 + 1;
        __sprintf_chk(v17, 0, 0x20uLL, "NoiseReduction%d", v7);
        ACTLogMessageImp(1, "{%s|inRect:%d,%d,%d,%d} {%s|BeginTS:%.3f}\n", v17, v16, v15, v14, v13, v17, HostTime);
        setACTNoiseReductionCropRect((uint64_t)v2, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14, (uint64_t *)&v13, *(unsigned __int8 *)(v3 + 1008));
        TargetContext = (__CVBuffer *)getTargetContext(*(_QWORD **)(v3 + 440));
        ACTNoiseReduction(v2, TargetContext);
        v9 = GetHostTime();
        ACTLogMessageImp(1, "{%s|outRect:%d,%d,%d,%d} {%s|took:%.3f} {%s|EndTS:%.3f}\n", v17, v16, v15, v14, v13, v17, v9 - HostTime, v17, v9);
        MEMORY[0x2276B4590](*(_QWORD *)(v3 + 1016));
        *(double *)(v3 + 968) = (double)v16;
        *(double *)(v3 + 976) = (double)v15;
        *(double *)(v3 + 984) = (double)v14;
        *(double *)(v3 + 992) = (double)v13;
        if (*(_BYTE *)(v3 + 1008))
        {
          FigSemaphoreSignal();
          *(_BYTE *)(v3 + 1008) = 0;
        }
        v10 = *(_DWORD *)(v3 + 1004);
        v11 = *(_DWORD *)(v3 + 1000);
        MEMORY[0x2276B459C](*(_QWORD *)(v3 + 1016));
      }
      while (v10 != v11);
    }
  }
  return 0;
}

uint64_t sub_2276158D8()
{
  uint64_t DerivedStorage;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  result = resetBlendingContext(*(_QWORD **)(DerivedStorage + 440));
  *(_BYTE *)(DerivedStorage + 772) = 0;
  *(_BYTE *)(DerivedStorage + 218) = 0;
  return result;
}

void sub_227615908()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  __CVBuffer *v2;
  void *BaseAddress;
  size_t DataSize;
  char v5[256];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = DerivedStorage;
  if ((*(_BYTE *)(DerivedStorage + 460) & 0x10) != 0)
  {
    __sprintf_chk(v5, 0, 0x100uLL, "%s/finalPreview.yuvf", (const char *)(DerivedStorage + 472));
    dumpCVPixelBufferToRawFile(*(__CVBuffer **)(v1 + 88), v5, 0);
  }
  v2 = *(__CVBuffer **)(v1 + 152);
  if (v2)
  {
    CVPixelBufferRelease(v2);
    *(_QWORD *)(v1 + 152) = 0;
  }
  *(_DWORD *)(v1 + 280) = 0;
  *(_DWORD *)(v1 + 288) = 0;
  *(_BYTE *)(v1 + 120) = 1;
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(v1 + 88));
  DataSize = CVPixelBufferGetDataSize(*(CVPixelBufferRef *)(v1 + 88));
  bzero(BaseAddress, DataSize);
}

void sub_2276159DC(int a1, uint64_t a2, char *a3)
{
  FILE *v4;
  FILE *v5;

  if (a2)
  {
    if ((a1 - 1) > 1)
    {
      if (a1 == 4)
      {
        v5 = *(FILE **)(a2 + 464);
        if (v5)
          fprintf(v5, "ERROR: %s", a3);
        syslog(3, "ERROR: %s", a3);
      }
    }
    else
    {
      v4 = *(FILE **)(a2 + 464);
      if (v4)
        fputs(a3, v4);
    }
  }
}

_QWORD *sub_227615A60(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *result;

  v5 = *(const void **)(a1 + 104);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 104) = 0;
  }
  v6 = *(void **)(a1 + 880);
  if (v6)
    RobustPano_reset(v6, a2, a3, a4);
  v7 = *(_QWORD *)(a1 + 448);
  if (v7)
  {
    resetACTRegistrationContext(*(_QWORD *)(a1 + 368), *(_QWORD *)(a1 + 360), v7);
    setACTRegistrationInvokeFallback(*(_QWORD *)(a1 + 448), *(_DWORD *)(a1 + 184) != 0);
    setACTRegistrationUsePrediction(*(_QWORD *)(a1 + 448), *(_DWORD *)(a1 + 188) != 0);
    setACTRegistrationMethod(*(_DWORD **)(a1 + 448), *(_DWORD *)(a1 + 176));
    setACTPredictionMethod(*(_QWORD *)(a1 + 448), *(_DWORD *)(a1 + 180));
    setACTRegistrationMFDriftCorrectorFlag(*(_QWORD *)(a1 + 448), *(_DWORD *)(a1 + 192));
    setACTRegistrationCSVLogLevel(*(_QWORD *)(a1 + 448), *(_DWORD *)(a1 + 460) != 0);
  }
  result = *(_QWORD **)(a1 + 440);
  if (result)
    return (_QWORD *)set_Defaults_ACTBlendingConfig(result, *(unsigned int *)(a1 + 196));
  return result;
}

uint64_t sub_227615B20()
{
  const char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t DerivedStorage;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  _BYTE *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  void *v11;
  void *v12;
  const void *v13;
  _QWORD *v14;
  const void *v15;
  const void *v16;
  const void *v17;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(_BYTE **)(DerivedStorage + 896);
  if (v4)
  {
    ACTThreadRelease(v4);
    *(_QWORD *)(DerivedStorage + 896) = 0;
  }
  v5 = *(_BYTE **)(DerivedStorage + 904);
  if (v5)
  {
    ACTThreadRelease(v5);
    *(_QWORD *)(DerivedStorage + 904) = 0;
  }
  v6 = *(_BYTE **)(DerivedStorage + 912);
  if (v6)
  {
    *(_QWORD *)(DerivedStorage + 912) = 0;
    ACTThreadRelease(v6);
  }
  v7 = *(_BYTE **)(DerivedStorage + 928);
  if (v7)
  {
    ACTThreadRelease(v7);
    *(_QWORD *)(DerivedStorage + 928) = 0;
    if (*(_QWORD *)(DerivedStorage + 1016))
    {
      FigSimpleMutexDestroy();
      *(_QWORD *)(DerivedStorage + 1016) = 0;
    }
    if (*(_QWORD *)(DerivedStorage + 1024))
    {
      FigSemaphoreDestroy();
      *(_QWORD *)(DerivedStorage + 1024) = 0;
    }
  }
  v8 = *(const void **)(DerivedStorage + 32);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(DerivedStorage + 32) = 0;
  }
  v9 = *(const void **)(DerivedStorage + 40);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(DerivedStorage + 40) = 0;
  }
  v10 = *(const void **)(DerivedStorage + 48);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(DerivedStorage + 48) = 0;
  }
  if (*(_QWORD *)(DerivedStorage + 64))
  {
    MEMORY[0x2276B46BC]();
    CFRelease(*(CFTypeRef *)(DerivedStorage + 64));
    *(_QWORD *)(DerivedStorage + 64) = 0;
  }
  if (*(_QWORD *)(DerivedStorage + 72))
  {
    MEMORY[0x2276B46BC]();
    CFRelease(*(CFTypeRef *)(DerivedStorage + 72));
    *(_QWORD *)(DerivedStorage + 72) = 0;
  }
  if (*(_QWORD *)(DerivedStorage + 80))
  {
    MEMORY[0x2276B46BC]();
    CFRelease(*(CFTypeRef *)(DerivedStorage + 80));
    *(_QWORD *)(DerivedStorage + 80) = 0;
  }
  v11 = *(void **)(DerivedStorage + 872);
  if (v11)
  {
    *(_QWORD *)(DerivedStorage + 872) = 0;
    ACTPano_GPUDownscaler_destroy(v11);
  }
  v12 = *(void **)(DerivedStorage + 880);
  if (v12)
  {
    *(_QWORD *)(DerivedStorage + 880) = 0;
    RobustPano_invalidate(v12);
    RobustPano_release(v12);
  }
  sub_227615A60(DerivedStorage, v0, v1, v2);
  _invalidateDebugWriteThread();
  sub_227615908();
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 88), 0);
  CVPixelBufferRelease(*(CVPixelBufferRef *)(DerivedStorage + 88));
  *(_QWORD *)(DerivedStorage + 88) = 0;
  FigSampleBufferRelease();
  *(_QWORD *)(DerivedStorage + 96) = 0;
  v13 = *(const void **)(DerivedStorage + 112);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(DerivedStorage + 112) = 0;
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(DerivedStorage + 128));
  *(_QWORD *)(DerivedStorage + 128) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(DerivedStorage + 136));
  *(_QWORD *)(DerivedStorage + 136) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(DerivedStorage + 144));
  *(_QWORD *)(DerivedStorage + 144) = 0;
  v14 = *(_QWORD **)(DerivedStorage + 272);
  if (v14)
    PixelShuffler_destructor(v14);
  *(_QWORD *)(DerivedStorage + 272) = 0;
  v15 = *(const void **)(DerivedStorage + 792);
  if (v15)
  {
    CFRelease(v15);
    *(_QWORD *)(DerivedStorage + 792) = 0;
  }
  CVPixelBufferPoolRelease(*(CVPixelBufferPoolRef *)(DerivedStorage + 800));
  *(_QWORD *)(DerivedStorage + 800) = 0;
  deleteACTRegistrationContext(*(void **)(DerivedStorage + 448));
  *(_QWORD *)(DerivedStorage + 448) = 0;
  deleteBlendingContext(*(_QWORD **)(DerivedStorage + 440));
  *(_QWORD *)(DerivedStorage + 440) = 0;
  v16 = *(const void **)(DerivedStorage + 736);
  if (v16)
  {
    CFRelease(v16);
    *(_QWORD *)(DerivedStorage + 736) = 0;
  }
  v17 = *(const void **)(DerivedStorage + 728);
  if (v17)
  {
    CFRelease(v17);
    *(_QWORD *)(DerivedStorage + 728) = 0;
  }
  ACTLogReset();
  return 0;
}

__CFString *sub_227615D30(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<FigSampleBufferProcessor_Panorama %p>"), a1);
  return Mutable;
}

uint64_t sub_227615D84(uint64_t a1, const void *a2, uint64_t a3, CFNumberRef *a4)
{
  uint64_t DerivedStorage;
  uint64_t v8;
  const __CFAllocator *v10;
  std::__fs::filesystem::path *p_p;
  CFNumberType v12;
  double HostTime;
  uint64_t v14;
  int Width;
  std::__fs::filesystem::path __p;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!a4)
  {
    fig_log_get_emitter();
    return FigSignalErrorAt3();
  }
  v8 = DerivedStorage;
  if (CFEqual(a2, CFSTR("HighResPanorama")))
  {
    if (*(_QWORD *)(v8 + 880))
    {
      RobustPano_finishProcessing();
      __p.__pn_.__r_.__value_.__r.__words[0] = 0;
      RobustPano_copyProperty(*(void **)(v8 + 880), a2, a3, (uint64_t *)&__p);
      CFDictionaryGetValue((CFDictionaryRef)__p.__pn_.__r_.__value_.__l.__data_, CFSTR("Assembly"));
    }
    HostTime = GetHostTime();
    if (*(_QWORD *)(v8 + 464))
      ACTLogMessageImp(1, "{Finishing|BeginTS:%.3f}\n", HostTime);
    *(_BYTE *)(v8 + 219) = 1;
    if (!*(_BYTE *)(v8 + 217) && !*(_BYTE *)(v8 + 216))
      ACTThreadMutexLock(*(_QWORD *)(v8 + 896));
    ACT_FigSampleBufferProcessorStopPanoramaCapture();
  }
  if (CFEqual(a2, CFSTR("writeSlicesToDisc")))
  {
    v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    p_p = (std::__fs::filesystem::path *)(v8 + 460);
  }
  else
  {
    if (CFEqual(a2, CFSTR("ACTPanoramaPreviewScale")))
    {
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      p_p = (std::__fs::filesystem::path *)(v8 + 332);
      v12 = kCFNumberFloatType;
      goto LABEL_17;
    }
    if (CFEqual(a2, CFSTR("ACTPanoramaMaxWidth")))
    {
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      p_p = (std::__fs::filesystem::path *)(v8 + 328);
    }
    else
    {
      if (CFEqual(a2, CFSTR("ACTPanoramaPreviewWidth")))
      {
        Width = CVPixelBufferGetWidth(*(CVPixelBufferRef *)(v8 + 88));
      }
      else
      {
        if (!CFEqual(a2, CFSTR("ACTPanoramaPreviewHeight")))
        {
          if (CFEqual(a2, CFSTR("ACTPanoramaDefaultDirection")))
          {
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 168);
          }
          else if (CFEqual(a2, CFSTR("ACTPanoramaDefaultRegistrationMethod")))
          {
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 176);
          }
          else if (CFEqual(a2, CFSTR("ACTPanoramaDefaultPredictionMethod")))
          {
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 180);
          }
          else if (CFEqual(a2, CFSTR("ACTPanoramaDefaultFallback")))
          {
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 184);
          }
          else if (CFEqual(a2, CFSTR("ACTPanoramaDefaultPrediction")))
          {
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 188);
          }
          else
          {
            if (!CFEqual(a2, CFSTR("ACTPanoramaDefaultBlendingConfig")))
              return 4294954512;
            v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
            p_p = (std::__fs::filesystem::path *)(v8 + 196);
          }
          goto LABEL_8;
        }
        Width = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(v8 + 88));
      }
      LODWORD(__p.__pn_.__r_.__value_.__l.__data_) = Width;
      v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      p_p = &__p;
    }
  }
LABEL_8:
  v12 = kCFNumberIntType;
LABEL_17:
  v14 = 0;
  *a4 = CFNumberCreate(v10, v12, p_p);
  return v14;
}

uint64_t sub_2276171E0(uint64_t a1, const void *a2, const __CFNumber *a3)
{
  uint64_t DerivedStorage;
  _DWORD *v7;
  uint64_t result;
  _DWORD *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (*(_BYTE *)(DerivedStorage + 217))
    return 0xFFFFFFFFLL;
  v7 = (_DWORD *)DerivedStorage;
  if (*(_BYTE *)(DerivedStorage + 216))
    return 0xFFFFFFFFLL;
  if (CFEqual(a2, CFSTR("writeSlicesToDisc")))
  {
    v9 = v7 + 115;
    v10 = v7[115];
    CFNumberGetValue(a3, kCFNumberIntType, v9);
    if (!v10)
    {
      if (*v9)
        _createDebugWriteThread(a1);
    }
    return 0;
  }
  result = CFEqual(a2, CFSTR("ACTPanoramaDefaultDirection"));
  if ((_DWORD)result)
  {
    CFNumberGetValue(a3, kCFNumberIntType, v7 + 42);
    v7[43] = v7[42];
    sub_227615908();
    sub_227615A60((uint64_t)v7, v11, v12, v13);
    return 0;
  }
  return result;
}

uint64_t sub_2276172B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v6;
  uint64_t v7;
  uint64_t v8;

  archive_entry_new();
  archive_entry_set_pathname();
  archive_entry_set_size();
  archive_entry_set_filetype();
  archive_entry_set_perm();
  time(0);
  archive_entry_set_mtime();
  if (archive_write_header())
  {
    v6 = "Failed to write archive header for %@ with status %d: %s";
LABEL_5:
    v7 = archive_errno();
    v8 = archive_error_string();
    ACTLogMessageImp(4, v6, a2, v7, v8);
    return archive_entry_free();
  }
  if (archive_write_data() != a4)
  {
    v6 = "Failed to write archive data for %@ with status %d: %s";
    goto LABEL_5;
  }
  return archive_entry_free();
}

void sub_2276173A4(uint64_t a1)
{
  uint64_t DerivedStorage;
  float v3;
  float v4;
  float Width;
  size_t v6;
  size_t Height;
  CVReturn v8;
  CVPixelBufferRef v9;
  BOOL v10;
  size_t BytesPerRow;
  size_t v12;
  char *BaseAddress;
  double v14;
  char *v15;
  char *v16;
  float v17;
  char *v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  double v27;
  __CVBuffer *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  float v34;
  __int16 IOSurfaceBackedCVPixelBufferWithAttributes;
  BOOL v36;
  double v37;
  double v38;
  double HostTime;
  CFTypeRef cf;
  CFDictionaryRef pixelBufferAttributes;
  CVPixelBufferRef pixelBufferOut;

  HostTime = GetHostTime();
  pixelBufferOut = 0;
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  pixelBufferAttributes = 0;
  v3 = *(double *)(DerivedStorage + 312);
  if (floorf(v3) >= (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 88)))
  {
    Width = (float)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(DerivedStorage + 88));
  }
  else
  {
    v4 = *(double *)(DerivedStorage + 312);
    Width = floorf(v4);
  }
  v6 = (unint64_t)Width;
  Height = CVPixelBufferGetHeight(*(CVPixelBufferRef *)(DerivedStorage + 88));
  applyWiringAssertionToProperties(&pixelBufferAttributes);
  v8 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v6, Height, 0x42475241u, pixelBufferAttributes, &pixelBufferOut);
  if (pixelBufferAttributes)
    CFRelease(pixelBufferAttributes);
  v9 = pixelBufferOut;
  if (v8)
    v10 = 1;
  else
    v10 = pixelBufferOut == 0;
  if (!v10)
  {
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
    v12 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(DerivedStorage + 88));
    BaseAddress = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(DerivedStorage + 88));
    v14 = *(double *)(DerivedStorage + 296);
    v15 = (char *)CVPixelBufferGetBaseAddress(pixelBufferOut);
    if (Height)
    {
      v16 = v15;
      v17 = v14;
      v18 = &BaseAddress[vcvts_n_u32_f32(floorf(v17), 2uLL)];
      do
      {
        memcpy(v16, v18, BytesPerRow);
        v18 += v12;
        v16 += BytesPerRow;
        --Height;
      }
      while (Height);
    }
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    v9 = pixelBufferOut;
  }
  if (v9)
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 72), CFSTR("ACTPanoramaThumbnail"), v9);
    CVPixelBufferRelease(v9);
  }
  v19 = *(_QWORD **)(a1 + 80);
  v20 = v19[53];
  if (v20)
  {
    v21 = v19[52];
    if (v21)
    {
      v22 = (float)*(unint64_t *)(a1 + 88);
      v23 = (float)v21 / v22;
      v24 = (float)*(unint64_t *)(a1 + 96);
      if (v23 >= (float)((float)v20 / v24))
        v23 = (float)v20 / v24;
      v25 = fminf(v23, 1.0);
      v26 = (float)(int)((vcvtps_s32_f32(v25 * v22) + 1) & 0xFFFFFFFE);
      v27 = v26;
      v38 = (float)(int)((vcvtps_s32_f32(v25 * v24) + 1) & 0xFFFFFFFE);
      ACTLogMessageImp(1, "{Finishing|ThumbnailMaxWidth:%d}{Finishing|ThumbnailMaxHeight:%d}{Finishing|ThumbnailScale:%f}{Finishing|ThumbnailWidth:%f}{Finishing|ThumbnailHeight:%f}\n", v21, v20, v25, v26, v38);
      v28 = *(__CVBuffer **)(a1 + 104);
      pixelBufferOut = 0;
      v30 = *(double *)(a1 + 40);
      v29 = *(double *)(a1 + 48);
      v32 = *(double *)(a1 + 56);
      v31 = *(double *)(a1 + 64);
      if (v25 < 0.25)
      {
        v33 = (float)(int)((vcvtps_s32_f32((float)*(unint64_t *)(a1 + 88) * 0.25) + 1) & 0xFFFFFFFE);
        v34 = (float)(int)((vcvtps_s32_f32((float)*(unint64_t *)(a1 + 96) * 0.25) + 1) & 0xFFFFFFFE);
        pixelBufferAttributes = 0;
        applyWiringAssertionToProperties(&pixelBufferAttributes);
        FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
        if (pixelBufferAttributes)
        {
          CFRelease(pixelBufferAttributes);
          pixelBufferAttributes = 0;
        }
        if (pixelBufferOut)
        {
          scaleCropAndRotatePixelBuffer(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 64), *(CVBufferRef *)(a1 + 104), pixelBufferOut, v30, v29, v32, v31, 0.0, 0.0, v33, v34);
          v28 = pixelBufferOut;
          v29 = 0.0;
          v32 = v33;
          v30 = 0.0;
          v31 = v34;
        }
        v27 = v26;
      }
      cf = 0;
      pixelBufferAttributes = 0;
      applyWiringAssertionToProperties((CFDictionaryRef *)&cf);
      IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (IOSurfaceBackedCVPixelBufferWithAttributes)
        v36 = 1;
      else
        v36 = pixelBufferAttributes == 0;
      if (!v36)
      {
        scaleCropAndRotatePixelBuffer(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 64), v28, pixelBufferAttributes, v30, v29, v32, v31, 0.0, 0.0, v27, v38);
        CFDictionaryAddValue(*(CFMutableDictionaryRef *)(a1 + 72), CFSTR("ACTPanoramaPreviewThumbnailBuffer"), pixelBufferAttributes);
        CVPixelBufferRelease(pixelBufferAttributes);
      }
      if (pixelBufferOut)
        CVPixelBufferRelease(pixelBufferOut);
      v19 = *(_QWORD **)(a1 + 80);
    }
  }
  if (v19[58])
  {
    v37 = GetHostTime();
    ACTLogMessageImp(1, "{Finishing|ThumbnailCreationTime:%.3f}\n", v37 - HostTime);
    ACTLogMessageImp(1, "{Finishing|EndTS:%.3f} {Finishing|TotalTime:%.3f}\n", v37, v37 - *(double *)(a1 + 112));
  }
}

void sub_2276177C0()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  ACTThreadMutexLock(*(_QWORD *)(DerivedStorage + 912));
}

uint64_t sub_2276177E8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2[1] = v1;
  v2[2] = v0;
  ACTThreadMutexUnlock(v2[114]);
  return 0;
}

uint64_t sub_227617808(uint64_t a1, opaqueCMSampleBuffer *a2)
{
  uint64_t DerivedStorage;
  void *v5;
  Float64 Seconds;
  const __CFDictionary *v7;
  int v8;
  int Value;
  int v10;
  uint64_t v11;
  void *v12;
  __CFNotificationCenter *LocalCenter;
  CMTime time;
  CMTime v16;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (CMSampleBufferGetImageBuffer(a2))
  {
    if (*(_BYTE *)(DerivedStorage + 217))
    {
      v5 = *(void **)(DerivedStorage + 880);
      if (v5)
        RobustPano_processSampleBuffer(v5, a2);
      sub_2276179F0(a1, a2);
      return 0;
    }
    if (*(_BYTE *)(DerivedStorage + 216))
    {
      v7 = (const __CFDictionary *)CMGetAttachment(a2, CFSTR("ClientSpecifiedMetadata"), 0);
      v8 = *(_DWORD *)(DerivedStorage + 220);
      *(_DWORD *)(DerivedStorage + 220) = v8 + 1;
      if (v7)
      {
        v16.value = 0;
        if (CFDictionaryGetValueIfPresent(v7, (const void *)*MEMORY[0x24BE11860], (const void **)&v16))
        {
          Value = CFBooleanGetValue((CFBooleanRef)v16.value);
          v10 = *(_DWORD *)(DerivedStorage + 220);
          if (v10 <= 29 && !Value)
            return 0;
          if (Value)
            goto LABEL_23;
        }
        else if (*(int *)(DerivedStorage + 220) <= 29)
        {
          return 0;
        }
      }
      else if (v8 <= 28)
      {
        return 0;
      }
      ACTLogMessageImp(4, "Error: Lock Failure \n");
      v10 = *(_DWORD *)(DerivedStorage + 220);
LABEL_23:
      ACTLogMessageImp(1, "{Pano|FramesBeforeCaptureActive:%d}\n", v10);
      *(_WORD *)(DerivedStorage + 216) = 256;
      *(_DWORD *)(DerivedStorage + 220) = 0;
      v12 = *(void **)(DerivedStorage + 880);
      if (v12)
        RobustPano_processSampleBuffer(v12, a2);
      sub_2276179F0(a1, a2);
      LocalCenter = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(LocalCenter, CFSTR("kACTPanoramaStatusNotifications"), CFSTR("kACTPanoramaCaptureBecameActive"), 0, 1u);
      return 0;
    }
    v11 = *(_QWORD *)(DerivedStorage + 912);
    if (v11 && !ACTThreadIsLocked(v11))
    {
      CFRetain(a2);
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 48), a2);
      ACTThreadWakeup();
    }
  }
  else if (*(_QWORD *)(DerivedStorage + 464) && *(_BYTE *)(DerivedStorage + 217))
  {
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetPresentationTimeStamp(&v16, a2);
    time = v16;
    Seconds = CMTimeGetSeconds(&time);
    ACTLogMessageImp(4, "Frame Drop PTS:%.3f\n", Seconds);
  }
  return 0;
}

void sub_2276179F0(uint64_t a1, void *a2)
{
  uint64_t DerivedStorage;
  double HostTime;
  opaqueCMBufferQueue *v5;
  CMItemCount BufferCount;
  CMBufferRef v7;
  CFTypeRef v8;
  const void *v9;
  __CVBuffer *ImageBuffer;
  const __CFAllocator *v11;
  CFNumberRef v12;
  __CVBuffer *v13;
  float v14;
  CFNumberRef v15;
  __CVBuffer *v16;
  double Seconds;
  double v18;
  CMTime time;
  CMTime v20;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  HostTime = GetHostTime();
  if (!*(_BYTE *)(DerivedStorage + 384))
  {
    ACTLogMessageImp(1, "ghosting Speed %.2f scale lowLight %.2f scale brightLight %.2f integrationTime lowLight %.2f integrationTime brightLight %.2f maxOffset %.2f previewScaleX %f previewScaleY %f minGoodOverlap %.2f minRequiredOverlap %.2f\n", *(float *)(DerivedStorage + 812), *(float *)(DerivedStorage + 820), *(float *)(DerivedStorage + 824), 1.0 / *(float *)(DerivedStorage + 828), 1.0 / *(float *)(DerivedStorage + 832), *(float *)(DerivedStorage + 836), *(float *)(DerivedStorage + 332), *(float *)(DerivedStorage + 336), *(float *)(DerivedStorage + 840), *(float *)(DerivedStorage + 844));
    ACTLogMessageImp(1, "{BlendingVersion:%d}\n", *(_DWORD *)(DerivedStorage + 200));
    *(_BYTE *)(DerivedStorage + 384) = 1;
  }
  v5 = *(opaqueCMBufferQueue **)(DerivedStorage + 32);
  if (v5)
  {
    BufferCount = CMBufferQueueGetBufferCount(v5);
    if ((unint64_t)BufferCount >= *(_QWORD *)(DerivedStorage + 392))
    {
      v7 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(DerivedStorage + 32));
      ACTLogMessageImp(4, "dropping %p\n", v7);
      if (v7)
        CFRelease(v7);
    }
    v8 = CMGetAttachment(a2, CFSTR("ClientSpecifiedMetadata"), 0);
    if (v8)
    {
      v9 = v8;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
      CVBufferSetAttachment(ImageBuffer, CFSTR("MetadataDictionary"), v9, kCVAttachmentMode_ShouldPropagate);
    }
    ++*(_DWORD *)(DerivedStorage + 776);
    if (BufferCount >= *(unsigned int *)(DerivedStorage + 24))
    {
      if (*(_QWORD *)(DerivedStorage + 464))
      {
        memset(&v20, 0, sizeof(v20));
        CMSampleBufferGetPresentationTimeStamp(&v20, (CMSampleBufferRef)a2);
        time = v20;
        Seconds = CMTimeGetSeconds(&time);
        v18 = GetHostTime();
        ACTLogMessageImp(4, "Received NOT QUEUED: %p, %.2f, at %.2f QDepth: %ld\n", a2, Seconds, v18, BufferCount);
        ++*(_DWORD *)(DerivedStorage + 788);
      }
    }
    else
    {
      CMBufferQueueEnqueue(*(CMBufferQueueRef *)(DerivedStorage + 32), a2);
      if (*(_QWORD *)(DerivedStorage + 464))
      {
        v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, (const void *)(DerivedStorage + 768));
        v13 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        CVBufferSetAttachment(v13, CFSTR("ID"), v12, kCVAttachmentMode_ShouldPropagate);
        CFRelease(v12);
        memset(&v20, 0, sizeof(v20));
        CMSampleBufferGetPresentationTimeStamp(&v20, (CMSampleBufferRef)a2);
        time = v20;
        v14 = CMTimeGetSeconds(&time);
        *(float *)&time.value = v14;
        v15 = CFNumberCreate(v11, kCFNumberFloatType, &time);
        v16 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)a2);
        CVBufferSetAttachment(v16, CFSTR("CaptureTimeInSeconds"), v15, kCVAttachmentMode_ShouldNotPropagate);
        CFRelease(v15);
        ACTLogMessageImp(1, "{Received%d|buffer:%p} {Received%d|PTS:%.3f} {Received%d|TS:%.3f} {Received%d|QDepth:%ld}\n", *(_DWORD *)(DerivedStorage + 768), a2, *(_DWORD *)(DerivedStorage + 768), *(float *)&time.value, *(_DWORD *)(DerivedStorage + 768), HostTime, *(_DWORD *)(DerivedStorage + 768), BufferCount);
        ++*(_DWORD *)(DerivedStorage + 768);
      }
      ACTThreadWakeup();
    }
  }
}

void sub_227617CF4(uint64_t a1, opaqueCMSampleBuffer *a2, int a3)
{
  uint64_t DerivedStorage;
  __CVBuffer *ImageBuffer;
  const __CFNumber *Attachment;
  const __CFNumber *v8;
  const __CFAllocator *v9;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  CFNumberRef v12;
  CFTypeRef v13;
  CFTypeRef v14;
  const void *v15;
  CFTypeRef v16;
  CFNumberRef v17;
  double HostTime;
  IOSurfaceRef IOSurface;
  CFNumberRef v20;
  double v21;
  double v22;
  double v23;
  _QWORD *v24;
  int v25;
  double v26;
  int v27;
  CMTime time;
  CMTime v29;
  int valuePtr;

  if (a2)
  {
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    ImageBuffer = CMSampleBufferGetImageBuffer(a2);
    Attachment = (const __CFNumber *)CVBufferGetAttachment(ImageBuffer, CFSTR("ID"), 0);
    v8 = Attachment;
    valuePtr = 0;
    if (Attachment)
      CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
    v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v11 = Mutable;
      memset(&v29, 0, sizeof(v29));
      CMSampleBufferGetPresentationTimeStamp(&v29, a2);
      time = v29;
      time.value = CMTimeGetSeconds(&time);
      v12 = CFNumberCreate(v9, kCFNumberFloat64Type, &time);
      v13 = CVBufferGetAttachment(ImageBuffer, CFSTR("MetadataDictionary"), 0);
      if (v13)
        CFDictionaryAddValue(v11, CFSTR("MetadataDictionary"), v13);
      v14 = CVBufferGetAttachment(ImageBuffer, CFSTR("ACTRegistrationTransformationKey"), 0);
      if (v14)
        CFDictionaryAddValue(v11, CFSTR("ACTRegistrationTransformationKey"), v14);
      CFDictionaryAddValue(v11, CFSTR("CaptureTimeInSeconds"), v12);
      CFRelease(v12);
      v15 = (const void *)*MEMORY[0x24BE104E8];
      v16 = CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE104E8], 0);
      if (v16)
        CFDictionaryAddValue(v11, v15, v16);
      if (v8)
        CFDictionaryAddValue(v11, CFSTR("ID"), v8);
      v27 = *(_DWORD *)(DerivedStorage + 172);
      v17 = CFNumberCreate(v9, kCFNumberSInt32Type, &v27);
      CFDictionaryAddValue(v11, CFSTR("PanoramaDirection"), v17);
      CFRelease(v17);
      CFArrayAppendValue(*(CFMutableArrayRef *)(DerivedStorage + 760), v11);
      CFRelease(v11);
    }
    HostTime = GetHostTime();
    if ((*(_DWORD *)(DerivedStorage + 460) & 5) == 1)
    {
      v29.value = 0;
      LODWORD(time.value) = 0;
      IOSurface = CVPixelBufferGetIOSurface(ImageBuffer);
      if (MEMORY[0x2276B4488](IOSurface, 0, &v29, &time) || !v29.value)
        goto LABEL_26;
      v20 = CFNumberCreate(v9, kCFNumberIntType, &time);
      IOSurfaceSetValue((IOSurfaceRef)v29.value, CFSTR("jpegSize"), v20);
      CFRelease(v20);
      IOSurfaceSetValue((IOSurfaceRef)v29.value, CFSTR("ID"), v8);
      if (CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 56), (const void *)v29.value))
      {
        ACTLogMessageImp(4, "Error - Could not enqueue for debug write slice id %d\n", valuePtr);
LABEL_26:
        v25 = valuePtr;
        v26 = GetHostTime();
        ACTLogMessageImp(1, "{DebugWrite%d|sendBufferToDebugWrite:%.3f}\n", v25, v26 - HostTime);
        return;
      }
    }
    else
    {
      if (valuePtr && !a3)
        goto LABEL_26;
      v29.value = 0;
      v21 = (double)*(unint64_t *)(DerivedStorage + 376);
      v22 = (double)*(unint64_t *)(DerivedStorage + 368);
      v23 = (double)*(unint64_t *)(DerivedStorage + 360);
      CVPixelBufferPoolCreatePixelBuffer(v9, *(CVPixelBufferPoolRef *)(DerivedStorage + 800), (CVPixelBufferRef *)&v29);
      if (*(_DWORD *)(DerivedStorage + 172) == 1)
        v24 = (_QWORD *)MEMORY[0x24BDBD268];
      else
        v24 = (_QWORD *)MEMORY[0x24BDBD270];
      MEMORY[0x2276B46D4](*(_QWORD *)(DerivedStorage + 72), *MEMORY[0x24BDF9610], *v24);
      scaleCropAndRotatePixelBuffer(*(_QWORD *)(DerivedStorage + 72), ImageBuffer, (CVBufferRef)v29.value, 0.0, v21, v22, v23, 0.0, 0.0, v23, v22);
      CVBufferSetAttachment((CVBufferRef)v29.value, CFSTR("ID"), v8, kCVAttachmentMode_ShouldNotPropagate);
      CMSimpleQueueEnqueue(*(CMSimpleQueueRef *)(DerivedStorage + 56), (const void *)v29.value);
    }
    ACTThreadWakeup();
    goto LABEL_26;
  }
}

__CFDictionary *createIOSurfacePropertiesDictionary(int a1)
{
  const __CFDictionary *IOSurfacePropertiesDictionary;
  int v3;
  __CFDictionary *MutableCopy;
  CFNumberRef v5;
  int valuePtr;

  IOSurfacePropertiesDictionary = (const __CFDictionary *)FigCreateIOSurfacePropertiesDictionary();
  if (a1)
    v3 = 1280;
  else
    v3 = 0;
  valuePtr = v3;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, IOSurfacePropertiesDictionary);
  CFRelease(IOSurfacePropertiesDictionary);
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDD8E40], v5);
  CFRelease(v5);
  return MutableCopy;
}

uint64_t scaleAndRotatePixelBuffer(uint64_t a1, CVBufferRef sourceBuffer, CVBufferRef destinationBuffer, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v11;
  uint64_t v23;

  v11 = 0;
  if (sourceBuffer)
  {
    if (destinationBuffer)
    {
      CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
      v23 = MEMORY[0x2276B46E0](a1, sourceBuffer, destinationBuffer, a4, a5, a6, a7, a8, a9, a10, a11);
      v11 = v23;
      if ((_DWORD)v23)
        syslog(3, "scaleAndRotatePixelBuffer failed %d", v23);
    }
  }
  return v11;
}

uint64_t scalePixelBuffer(OpaqueVTPixelTransferSession *a1, CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  uint64_t v3;
  uint64_t v7;

  v3 = 0;
  if (sourceBuffer)
  {
    if (destinationBuffer)
    {
      CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
      v7 = VTPixelTransferSessionTransferImage(a1, sourceBuffer, destinationBuffer);
      v3 = v7;
      if ((_DWORD)v7)
        syslog(3, "scalePixelBuffer failed %d", v7);
    }
  }
  return v3;
}

uint64_t scaleCropAndRotatePixelBuffer(uint64_t a1, CVBufferRef sourceBuffer, CVBufferRef destinationBuffer, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v11;
  uint64_t v23;

  v11 = 0;
  if (sourceBuffer)
  {
    if (destinationBuffer)
    {
      CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
      v23 = MEMORY[0x2276B46E0](a1, sourceBuffer, destinationBuffer, a4, a5, a6, a7, a8, a9, a10, a11);
      v11 = v23;
      if ((_DWORD)v23)
        syslog(3, "scaleAndRotatePixelBuffer failed %d", v23);
    }
  }
  return v11;
}

uint64_t CVPixelBufferToJPEG(uint64_t a1, _DWORD *a2)
{
  __CFDictionary *Mutable;
  CFNumberRef v5;
  int v7;
  int v8;
  uint64_t v9;

  v9 = 0;
  v7 = 1061997773;
  v8 = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v5 = CFNumberCreate(0, kCFNumberFloatType, &v7);
  CFDictionaryAddValue(Mutable, CFSTR("kCGImageDestinationLossyCompressionQuality"), v5);
  CFRelease(v5);
  MEMORY[0x2276B447C](a1, Mutable, 0, &v9, &v8);
  if (a2)
    *a2 = v8;
  if (Mutable)
    CFRelease(Mutable);
  return v9;
}

FILE *dumpCVPixelBufferToJPEGFile(uint64_t a1, char *__filename)
{
  FILE *result;
  FILE *v4;
  __IOSurface *v5;
  __IOSurface *v6;
  void *BaseAddress;
  size_t __size;

  LODWORD(__size) = 0;
  result = fopen(__filename, "wb");
  if (result)
  {
    v4 = result;
    v5 = (__IOSurface *)CVPixelBufferToJPEG(a1, &__size);
    if (v5)
    {
      v6 = v5;
      IOSurfaceLock(v5, 1u, 0);
      BaseAddress = IOSurfaceGetBaseAddress(v6);
      fwrite(BaseAddress, (int)__size, 1uLL, v4);
      IOSurfaceUnlock(v6, 1u, 0);
      CFRelease(v6);
    }
    fclose(v4);
    return (FILE *)__size;
  }
  return result;
}

uint64_t dumpCVPixelBufferToRawFile(__CVBuffer *a1, const char *a2, int a3)
{
  size_t PlaneCount;
  OSType PixelFormatType;
  int v8;
  FILE *v9;
  FILE *v10;
  size_t i;
  uint64_t v12;
  char *BaseAddressOfPlane;
  size_t v14;
  size_t Width;
  char *v16;
  size_t v17;
  size_t v18;
  char *BaseAddress;
  uint64_t v20;
  size_t BytesPerRow;
  size_t Height;
  int v23;
  size_t v24;
  size_t v25;
  size_t j;
  void *v27;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t __ptr;

  PlaneCount = CVPixelBufferGetPlaneCount(a1);
  PixelFormatType = CVPixelBufferGetPixelFormatType(a1);
  v8 = PixelFormatType;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(PixelFormatType), (int32x4_t)xmmword_22764B930))) & 1) != 0
    || PixelFormatType == 875704438
    || !a3
    || PixelFormatType == 875704422)
  {
    v9 = fopen(a2, "wb");
    if (v9)
    {
      v10 = v9;
      __ptr = CVPixelBufferGetWidth(a1);
      fwrite(&__ptr, 1uLL, 8uLL, v10);
      __ptr = CVPixelBufferGetHeight(a1);
      fwrite(&__ptr, 1uLL, 8uLL, v10);
      if (PlaneCount)
      {
        for (i = 0; i != PlaneCount; ++i)
        {
          __ptr = CVPixelBufferGetBytesPerRowOfPlane(a1, i);
          fwrite(&__ptr, 1uLL, 8uLL, v10);
        }
        v12 = (8 * PlaneCount + 16);
        CVPixelBufferLockBaseAddress(a1, 1uLL);
        if (PlaneCount > 1)
        {
          if (a3 && (v8 & 0xFFFFFFEF) == 0x34323066)
          {
            BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
            if (CVPixelBufferGetHeightOfPlane(a1, 0))
            {
              v14 = 0;
              do
              {
                Width = CVPixelBufferGetWidth(a1);
                fwrite(BaseAddressOfPlane, 1uLL, Width, v10);
                v12 = v12 + CVPixelBufferGetWidth(a1);
                BaseAddressOfPlane += CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
                ++v14;
              }
              while (CVPixelBufferGetHeightOfPlane(a1, 0) > v14);
            }
            v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
            if (CVPixelBufferGetHeightOfPlane(a1, 1uLL))
            {
              v17 = 0;
              do
              {
                v18 = CVPixelBufferGetWidth(a1);
                fwrite(v16, 1uLL, v18, v10);
                v12 = v12 + CVPixelBufferGetWidth(a1);
                v16 += CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
                ++v17;
              }
              while (CVPixelBufferGetHeightOfPlane(a1, 1uLL) > v17);
            }
          }
          else
          {
            for (j = 0; j != PlaneCount; ++j)
            {
              v27 = CVPixelBufferGetBaseAddressOfPlane(a1, j);
              BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, j);
              HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, j);
              fwrite(v27, 1uLL, HeightOfPlane * BytesPerRowOfPlane, v10);
              LODWORD(v27) = CVPixelBufferGetBytesPerRowOfPlane(a1, j);
              v12 = v12 + CVPixelBufferGetHeightOfPlane(a1, j) * (_DWORD)v27;
            }
          }
          goto LABEL_36;
        }
      }
      else
      {
        CVPixelBufferLockBaseAddress(a1, 1uLL);
        v12 = 16;
      }
      BaseAddress = (char *)CVPixelBufferGetBaseAddress(a1);
      if (!a3)
      {
        BytesPerRow = CVPixelBufferGetBytesPerRow(a1);
        Height = CVPixelBufferGetHeight(a1);
        fwrite(BaseAddress, 1uLL, Height * BytesPerRow, v10);
        v23 = CVPixelBufferGetBytesPerRow(a1);
        v12 = v12 + CVPixelBufferGetHeight(a1) * v23;
LABEL_36:
        CVPixelBufferUnlockBaseAddress(a1, 1uLL);
        fclose(v10);
        return v12;
      }
      if (v8 > 2037741157)
      {
        v20 = 2;
        if (v8 == 2037741158 || v8 == 2037741171)
        {
LABEL_30:
          if (CVPixelBufferGetHeight(a1))
          {
            v24 = 0;
            do
            {
              v25 = CVPixelBufferGetWidth(a1);
              fwrite(BaseAddress, 1uLL, v25 * v20, v10);
              v12 = v12 + CVPixelBufferGetWidth(a1) * (_DWORD)v20;
              BaseAddress += CVPixelBufferGetBytesPerRow(a1);
              ++v24;
            }
            while (CVPixelBufferGetHeight(a1) > v24);
          }
          goto LABEL_36;
        }
      }
      else if (v8 == 32 || v8 == 1111970369)
      {
        v20 = 4;
        goto LABEL_30;
      }
      v20 = 1;
      goto LABEL_30;
    }
  }
  return 0;
}

uint64_t dumpSurfaceToRawFile(__IOSurface *a1, const char *a2, int a3)
{
  size_t PlaneCount;
  OSType PixelFormat;
  int v8;
  FILE *v9;
  FILE *v10;
  char *BaseAddress;
  uint64_t v12;
  uint64_t v13;
  char *BaseAddressOfPlane;
  size_t v15;
  size_t Width;
  size_t v17;
  void *v18;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRow;
  size_t Height;
  size_t v23;
  size_t v24;
  char *v25;
  size_t v26;
  size_t v27;

  PlaneCount = IOSurfaceGetPlaneCount(a1);
  PixelFormat = IOSurfaceGetPixelFormat(a1);
  v8 = PixelFormat;
  if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_s32(vdupq_n_s32(PixelFormat), (int32x4_t)xmmword_22764B930))) & 1) != 0
    || PixelFormat == 875704438
    || !a3
    || PixelFormat == 875704422)
  {
    v9 = fopen(a2, "wb");
    if (v9)
    {
      v10 = v9;
      IOSurfaceLock(a1, 0, 0);
      if (PlaneCount > 1)
      {
        if (a3 && (v8 & 0xFFFFFFEF) == 0x34323066)
        {
          BaseAddressOfPlane = (char *)IOSurfaceGetBaseAddressOfPlane(a1, 0);
          if (IOSurfaceGetHeightOfPlane(a1, 0))
          {
            v15 = 0;
            LODWORD(v13) = 0;
            do
            {
              Width = IOSurfaceGetWidth(a1);
              fwrite(BaseAddressOfPlane, 1uLL, Width, v10);
              v13 = v13 + IOSurfaceGetWidth(a1);
              BaseAddressOfPlane += IOSurfaceGetBytesPerRowOfPlane(a1, 0);
              ++v15;
            }
            while (IOSurfaceGetHeightOfPlane(a1, 0) > v15);
          }
          else
          {
            v13 = 0;
          }
          v25 = (char *)IOSurfaceGetBaseAddressOfPlane(a1, 1uLL);
          if (IOSurfaceGetHeightOfPlane(a1, 1uLL))
          {
            v26 = 0;
            do
            {
              v27 = IOSurfaceGetWidth(a1);
              fwrite(v25, 1uLL, v27, v10);
              v13 = v13 + IOSurfaceGetWidth(a1);
              v25 += IOSurfaceGetBytesPerRowOfPlane(a1, 1uLL);
              ++v26;
            }
            while (IOSurfaceGetHeightOfPlane(a1, 1uLL) > v26);
          }
        }
        else
        {
          v17 = 0;
          LODWORD(v13) = 0;
          do
          {
            v18 = IOSurfaceGetBaseAddressOfPlane(a1, v17);
            BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(a1, v17);
            HeightOfPlane = IOSurfaceGetHeightOfPlane(a1, v17);
            fwrite(v18, 1uLL, HeightOfPlane * BytesPerRowOfPlane, v10);
            LODWORD(v18) = IOSurfaceGetBytesPerRowOfPlane(a1, v17);
            v13 = v13 + IOSurfaceGetHeightOfPlane(a1, v17++) * (_DWORD)v18;
          }
          while (PlaneCount != v17);
        }
        goto LABEL_35;
      }
      BaseAddress = (char *)IOSurfaceGetBaseAddress(a1);
      if (!a3)
      {
        BytesPerRow = IOSurfaceGetBytesPerRow(a1);
        Height = IOSurfaceGetHeight(a1);
        fwrite(BaseAddress, 1uLL, Height * BytesPerRow, v10);
        goto LABEL_30;
      }
      if (v8 > 2037741157)
      {
        v12 = 2;
        if (v8 == 2037741158 || v8 == 2037741171)
        {
LABEL_26:
          if (IOSurfaceGetHeight(a1))
          {
            v23 = 0;
            LODWORD(v13) = 0;
            do
            {
              v24 = IOSurfaceGetWidth(a1);
              fwrite(BaseAddress, 1uLL, v24 * v12, v10);
              v13 = v13 + IOSurfaceGetWidth(a1) * (_DWORD)v12;
              BaseAddress += IOSurfaceGetBytesPerRow(a1);
              ++v23;
            }
            while (IOSurfaceGetHeight(a1) > v23);
            goto LABEL_35;
          }
LABEL_30:
          v13 = 0;
LABEL_35:
          IOSurfaceUnlock(a1, 0, 0);
          fclose(v10);
          return v13;
        }
      }
      else if (v8 == 32 || v8 == 1111970369)
      {
        v12 = 4;
        goto LABEL_26;
      }
      v12 = 1;
      goto LABEL_26;
    }
  }
  return 0;
}

uint64_t readPlanar420vFrameIntoCVPixelBuffer(int a1, off_t a2, size_t a3, unint64_t a4, CVPixelBufferRef pixelBuffer)
{
  size_t v10;
  char *BaseAddressOfPlane;
  char *v12;
  size_t BytesPerRowOfPlane;
  size_t v14;
  ssize_t v15;
  unint64_t v16;
  off_t v17;
  ssize_t v18;
  off_t v19;
  size_t v20;
  ssize_t v21;
  unint64_t v22;
  ssize_t v23;
  unint64_t v25;
  __CVBuffer *pixelBuffera;
  off_t __offseta;

  v10 = a4 * a3;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v12 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  pixelBuffera = pixelBuffer;
  v14 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  v25 = a4;
  __offseta = a2;
  if (BytesPerRowOfPlane == a3)
  {
    v15 = pread(a1, BaseAddressOfPlane, v10, a2);
  }
  else
  {
    v15 = 0;
    if (a4)
    {
      v16 = a4;
      v17 = __offseta;
      do
      {
        v18 = pread(a1, BaseAddressOfPlane, a3, v17);
        v17 += a3;
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v15 += v18;
        --v16;
      }
      while (v16);
    }
  }
  if (v15 == v10)
  {
    v19 = v10 + __offseta;
    v20 = v10 >> 1;
    if (v14 == a3 >> 1)
    {
      v21 = pread(a1, v12, v20, v19);
    }
    else if (v25 >= 2)
    {
      v21 = 0;
      v22 = v25 >> 1;
      do
      {
        v23 = pread(a1, v12, a3, v19);
        v19 += a3;
        v12 += v14;
        v21 += v23;
        --v22;
      }
      while (v22);
    }
    else
    {
      v21 = 0;
    }
    if (v21 != v20)
      syslog(3, "Read count mismatch for Cb plane");
  }
  else
  {
    syslog(3, "Read count mismatch for Y plane");
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffera, 0);
  return 0;
}

uint64_t readPlanary420FrameIntoCVPixelBuffer(int a1, off_t a2, size_t a3, unint64_t a4, CVPixelBufferRef pixelBuffer)
{
  unint64_t v6;
  size_t v9;
  char *BaseAddressOfPlane;
  char *v11;
  char *v12;
  size_t BytesPerRowOfPlane;
  size_t v14;
  ssize_t v15;
  off_t v16;
  ssize_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  ssize_t v21;
  unint64_t v22;
  unint64_t v23;
  off_t v24;
  off_t v25;
  ssize_t v26;
  unint64_t v27;
  size_t v29;
  unint64_t v30;
  __CVBuffer *pixelBuffera;
  size_t v32;

  v6 = a4;
  v9 = a4 * a3;
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  v11 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  v12 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 2uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v14 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  pixelBuffera = pixelBuffer;
  v29 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 2uLL);
  v30 = v6;
  v32 = v9;
  if (BytesPerRowOfPlane == a3)
  {
    v15 = pread(a1, BaseAddressOfPlane, v9, a2);
  }
  else
  {
    v15 = 0;
    if (v6)
    {
      v16 = a2;
      do
      {
        v17 = pread(a1, BaseAddressOfPlane, a3, v16);
        v16 += a3;
        BaseAddressOfPlane += BytesPerRowOfPlane;
        v15 += v17;
        --v6;
      }
      while (v6);
    }
  }
  v18 = v32;
  if (v15 == v32)
  {
    v19 = v32 >> 2;
    v20 = a3 >> 1;
    if (v20 == v14)
    {
      v21 = pread(a1, v11, v32 >> 2, v32 + a2);
      v22 = v30;
    }
    else
    {
      v22 = v30;
      if (v30 >= 2)
      {
        v23 = v30 >> 1;
        v24 = v32 + a2;
        do
        {
          v21 = pread(a1, v11, v20, v24);
          v24 += v20;
          v11 += v14;
          --v23;
        }
        while (v23);
        v18 = v32;
      }
      else
      {
        v21 = 0;
      }
    }
    if (v21 == v19)
    {
      v25 = v32 + a2 + (v18 >> 2);
      if (v20 == v29)
      {
        v26 = pread(a1, v12, v19, v25);
      }
      else if (v22 >= 2)
      {
        v27 = v22 >> 1;
        do
        {
          v26 = pread(a1, v12, v20, v25);
          v25 += v20;
          v12 += v29;
          --v27;
        }
        while (v27);
      }
      else
      {
        v26 = 0;
      }
      if (v26 != v19)
        syslog(3, "Read count mismatch for Cr plane");
    }
    else
    {
      syslog(3, "Read count mismatch for Cb plane");
    }
  }
  else
  {
    syslog(3, "Read count mismatch for Y plane");
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffera, 0);
  return 0;
}

CVPixelBufferRef createCVPixelBufferFromPlanary420File(int a1, off_t a2)
{
  ssize_t v4;
  CVPixelBufferRef v5;
  CVReturn v6;
  size_t v8;
  size_t __buf;
  CVPixelBufferRef pixelBufferOut;

  __buf = 0;
  pixelBufferOut = 0;
  v8 = 0;
  v4 = pread(a1, &__buf, 8uLL, a2);
  v5 = 0;
  if (v4 == 8)
  {
    if (pread(a1, &v8, 8uLL, a2 + 8) == 8)
    {
      v6 = CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], __buf, v8, 0x34323066u, 0, &pixelBufferOut);
      v5 = pixelBufferOut;
      if (!v6)
      {
        readPlanary420FrameIntoCVPixelBuffer(a1, a2 + 16, __buf, v8, pixelBufferOut);
        return pixelBufferOut;
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

_QWORD *createACTRegistrationContext()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  int v3;

  v0 = malloc_type_calloc(1uLL, 0x88uLL, 0x1030040EA86B388uLL);
  if (!v0)
  {
    v3 = 33;
LABEL_8:
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", v3);
    deleteACTRegistrationContext(v0);
    return 0;
  }
  v1 = malloc_type_calloc(1uLL, 0xB8uLL, 0x10A004006781751uLL);
  v0[3] = v1;
  if (!v1)
  {
    v3 = 40;
    goto LABEL_8;
  }
  v2 = malloc_type_calloc(1uLL, 0x1088uLL, 0x1000040BD4C5F4CuLL);
  v0[4] = v2;
  if (!v2)
  {
    v3 = 48;
    goto LABEL_8;
  }
  v0[12] = 0;
  v0[13] = 0;
  v0[15] = 0;
  v0[16] = 0;
  return v0;
}

void deleteACTRegistrationContext(void *a1)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v2 = (uint64_t *)*((_QWORD *)a1 + 3);
    if (v2)
    {
      ABRegDisposeContext(v2);
      free(*((void **)a1 + 3));
    }
    v3 = *((_QWORD *)a1 + 4);
    if (v3)
    {
      MFRegDisposeContext(v3);
      free(*((void **)a1 + 4));
    }
    v4 = (void *)*((_QWORD *)a1 + 12);
    if (v4)
      free(v4);
    free(a1);
  }
}

uint64_t resetACTRegistrationContext(int a1, int a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  int v8;
  uint64_t v9;

  if (a3)
  {
    *(_QWORD *)a3 = 1;
    *(_DWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 12) = 1;
    *(_BYTE *)(a3 + 116) = 0;
    *(_QWORD *)(a3 + 16) = 2;
    *(_WORD *)(a3 + 92) = 0;
    setACTRegistrationCSVLogLevel(a3, 0);
    v6 = MEMORY[0x24BDBD8B8];
    v7 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
    *(_OWORD *)(a3 + 40) = *MEMORY[0x24BDBD8B8];
    *(_OWORD *)(a3 + 56) = v7;
    *(_OWORD *)(a3 + 72) = *(_OWORD *)(v6 + 32);
    *(_BYTE *)(a3 + 95) = 1;
    if (ABRegInitContext(a1, a2, 0, 0, *(_BYTE *)(a3 + 93), 0, *(int **)(a3 + 24)))
    {
      v8 = 143;
    }
    else
    {
      if (!MFRegInitContext(*(_DWORD *)(a3 + 16), 0, *(_BYTE *)(a3 + 93), 0, *(_QWORD *)(a3 + 32)))
      {
        v9 = 0;
        *(_DWORD *)(a3 + 88) = 0;
        *(_QWORD *)(a3 + 120) = 0;
        *(_QWORD *)(a3 + 128) = 0;
        return v9;
      }
      v8 = 149;
    }
    v9 = 4294967294;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -2, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", v8);
  }
  else
  {
    v9 = 4294967294;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -2, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 113);
  }
  return v9;
}

_DWORD *setACTRegistrationMethod(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

uint64_t setACTPredictionMethod(uint64_t result, int a2)
{
  *(_DWORD *)(result + 4) = a2;
  return result;
}

uint64_t setACTRegistrationMethodUsed(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t setACTRegistrationDirection(uint64_t result, int a2)
{
  *(_DWORD *)(result + 20) = a2;
  return result;
}

uint64_t setACTRegistrationInvokeFallback(uint64_t result, char a2)
{
  *(_BYTE *)(result + 12) = a2;
  return result;
}

uint64_t setACTRegistrationForceMaxComputation(uint64_t result, char a2)
{
  *(_BYTE *)(result + 116) = a2;
  return result;
}

uint64_t setACTRegistrationMFDriftCorrectorFlag(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

uint64_t setACTRegistrationSyslogLevel(uint64_t result, char a2)
{
  *(_BYTE *)(result + 92) = a2;
  return result;
}

uint64_t setACTRegistrationLogLevel(uint64_t result, char a2)
{
  *(_BYTE *)(result + 93) = a2;
  return result;
}

void setACTRegistrationCSVLogLevel(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  char *v5;

  v4 = a1 + 96;
  v3 = *(void **)(a1 + 96);
  *(_BYTE *)(v4 - 2) = a2;
  if (v3)
  {
    free(v3);
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    a2 = *(unsigned __int8 *)(a1 + 94);
  }
  if (a2)
  {
    v5 = (char *)malloc_type_calloc(0x2000uLL, 1uLL, 0x100004077774924uLL);
    *(_QWORD *)v4 = v5;
    if (v5)
    {
      *(_QWORD *)(a1 + 104) = 0x2000;
      __sprintf_chk(v5, 0, 0x2000uLL, "time (2nd), warmup, status, qualityMain, method, prediction, fallback, txPrediction, tyPrediction, predictionReliable, txMain, tyMain, tx, ty, txMotionFilter, tyMotionFilter, xAlpha, xBeta, nXRingBufferElements, tXBegin, tXEnd, yAlpha, yBeta, nYRingBufferElements, tYBegin, tYEnd, slice1FirstBytes, slice2FirstBytes\n");
      *(_DWORD *)(a1 + 112) = 0;
    }
    else
    {
      ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 1092);
      if (*(_QWORD *)v4)
      {
        free(*(void **)v4);
        *(_QWORD *)v4 = 0;
        *(_QWORD *)(v4 + 8) = 0;
      }
    }
  }
}

__n128 setACTRegistrationCumulativeTransform(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)(a1 + 40) = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 16);
  result = *(__n128 *)(a2 + 32);
  *(__n128 *)(a1 + 72) = result;
  return result;
}

uint64_t registerSampleBuffers(uint64_t a1, CVPixelBufferRef pixelBuffer, uint64_t a3, __CVBuffer *a4, uint64_t a5, int a6, _OWORD *a7, _DWORD *a8, unsigned __int8 a9)
{
  double v9;
  double v10;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  unsigned __int128 v24;
  int v25;
  int v26;
  __int128 v27;
  float v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  float v35;
  int v36;
  uint64_t v37;
  float v38;
  float v39;
  int v40;
  float v41;
  float v42;
  char *BaseAddressOfPlane;
  unsigned __int8 *v44;
  unsigned __int8 *v45;
  size_t BytesPerRowOfPlane;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  char v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  float v59;
  char v60;
  float v61;
  float v62;
  float v63;
  unsigned __int128 v64;
  float v65;
  __int128 v66;
  __int128 v67;
  int v68;
  __int128 v69;
  __int128 v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  unsigned __int128 v77;
  __int128 v78;
  __int128 v79;
  unsigned __int128 v80;
  int v81;
  __int128 v82;
  __int128 v83;
  unsigned __int128 v84;

  if (*(_DWORD *)a1)
  {
    CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    if (a9)
    {
      v20 = ACTRegistrationWarmup(pixelBuffer, a3, (uint64_t)a4, v19, a1);
      if ((v20 & 0x80000000) == 0)
        return 0;
      v21 = v20;
      ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", v20, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 189);
    }
    else if (pixelBuffer && a4)
    {
      v23 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
      v82 = *MEMORY[0x24BDBD8B8];
      v22 = v82;
      v83 = v23;
      v24 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
      v84 = v24;
      v78 = v82;
      v79 = v23;
      v80 = v24;
      if (*(_BYTE *)(a1 + 13))
      {
        v64 = v24;
        v67 = v23;
        v70 = v82;
        v25 = ACTPreRegisterSlices(pixelBuffer, v18, a4, v19, *(_DWORD *)(a1 + 4), (uint64_t)&v82, &v81, a1);
        if (v25)
        {
          v26 = v25;
          v60 = 0;
        }
        else if (*(int *)(a1 + 88) < 7)
        {
          v60 = 0;
          v26 = 0;
        }
        else
        {
          v26 = 0;
          v78 = v82;
          v79 = v83;
          v80 = v84;
          v60 = 1;
        }
        v23 = v67;
        v22 = v70;
        v24 = v64;
      }
      else
      {
        v60 = 0;
        v26 = 0;
      }
      v75 = v22;
      v76 = v23;
      v77 = v24;
      v74 = 0;
      v48 = ACTRegisterSlices(pixelBuffer, v18, a4, a5, *(_DWORD *)a1, (int *)&v74, (uint64_t)&v78, (uint64_t)&v75, (float *)&v74 + 1, a1);
      v21 = v48;
      if ((v48 & 0x80000000) != 0)
      {
        ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", v48, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 250);
      }
      else
      {
        v72 = v26;
        v10 = *((double *)&v77 + 1);
        *(_QWORD *)&v9 = v77;
        v59 = *((float *)&v74 + 1);
        if (*(_BYTE *)(a1 + 12) && (_DWORD)v48 == 1 && (v52 = v74) != 0)
        {
          v66 = v76;
          v69 = v75;
          if (ACTRegisterSlices(pixelBuffer, v49, a4, a5, v74, (int *)&v73 + 1, (uint64_t)&v78, (uint64_t)&v75, (float *)&v74 + 1, a1))
          {
            *(_DWORD *)(a1 + 8) = *(_DWORD *)a1;
            v75 = v69;
            v76 = v66;
            v77 = __PAIR128__(*(unint64_t *)&v10, *(unint64_t *)&v9);
            *((float *)&v74 + 1) = v59;
          }
          else
          {
            *(_DWORD *)(a1 + 8) = v52;
          }
          v54 = v60;
          v55 = v72;
          v53 = 1;
        }
        else
        {
          v53 = 0;
          *(_DWORD *)(a1 + 8) = *(_DWORD *)a1;
          v54 = v60;
          v55 = v72;
        }
        v58 = v53;
        v56 = ACTPostRegisterSlices(pixelBuffer, v49, a4, v50, v55, v21, v51, v53, v54, (uint64_t)&v82, (uint64_t)&v75, v57, a1);
        if ((v56 & 0x80000000) != 0)
        {
          v21 = v56;
          ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", v56, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 349);
        }
        else
        {
          v21 = 0;
        }
      }
    }
    else
    {
      v21 = 4294967293;
      ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 194);
    }
  }
  else
  {
    v21 = 0xFFFFFFFFLL;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 178);
  }
  v27 = v76;
  *a7 = v75;
  a7[1] = v27;
  a7[2] = v77;
  *a8 = HIDWORD(v74);
  if (*(_BYTE *)(a1 + 94))
  {
    v73 = 0;
    MFGetMotionFilterIncrementalTranslation(pixelBuffer, a4, *(_QWORD *)(a1 + 32), (float *)&v73 + 1, (float *)&v73);
    v71 = *(_DWORD *)(a1 + 8);
    v68 = *(unsigned __int8 *)(a1 + 13);
    v28 = *(double *)&v84;
    v29 = *((double *)&v84 + 1);
    v63 = v29;
    v65 = v28;
    v30 = v9;
    v31 = v10;
    v61 = v31;
    v62 = v30;
    v32 = v73;
    v33 = *(_QWORD *)(a1 + 32);
    v34 = *(float *)(v33 + 2076);
    v35 = *(float *)(v33 + 2080);
    v36 = *(_DWORD *)(v33 + 24);
    v37 = *(_QWORD *)(v33 + 2104);
    v38 = *(float *)(v33 + 4176);
    v39 = *(float *)(v33 + 4180);
    v40 = *(_DWORD *)(v33 + 2124);
    v41 = *(float *)(v33 + 4204);
    v42 = *(float *)(v33 + 4208);
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    v44 = (unsigned __int8 *)&BaseAddressOfPlane[CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0) * a3];
    v45 = (unsigned __int8 *)CVPixelBufferGetBaseAddressOfPlane(a4, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, 0);
    ACTAddCSVMetadata(a4, a9, v21, v71, v68, v58 & 1, v60 & 1, (uint64_t)&v75, v59, v65, v63, v62, v61, *((float *)&v32 + 1), *(float *)&v32, v34, v35, v36, *(float *)&v37,
      *((float *)&v37 + 1),
      v38,
      v39,
      v40,
      v41,
      v42,
      v44,
      &v45[BytesPerRowOfPlane * a5],
      a1);
  }
  *(_BYTE *)(a1 + 95) = 0;
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  CVPixelBufferUnlockBaseAddress(a4, 1uLL);
  return v21;
}

uint64_t getACTRegistrationMethod(unsigned int *a1)
{
  return *a1;
}

uint64_t ACTRegistrationWarmup(__CVBuffer *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v12;
  char __format[512];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  __sprintf_chk(__format, 0, 0x200uLL, "{ACTRegistration|log:Warmup}");
  if (*(_BYTE *)(a5 + 92))
    syslog(5, "%s", __format);
  if (*(_BYTE *)(a5 + 93))
    ACTLogMessageImp(1, __format);
  if (*(_DWORD *)(a5 + 4) != 3 && (*(_DWORD *)a5 | 2) != 3)
    return 0;
  if ((unint64_t)a1 | a3)
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    v12 = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
    if (ABRegUpdateIntegralImage((uint64_t)BaseAddressOfPlane + BytesPerRowOfPlane * a2, v12, *(unsigned int **)(a5 + 24)))return 4294967289;
    else
      return 0;
  }
  else
  {
    v9 = 4294967293;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 544);
  }
  return v9;
}

uint64_t ACTPreRegisterSlices(__CVBuffer *a1, uint64_t a2, __CVBuffer *a3, uint64_t a4, int a5, uint64_t a6, _DWORD *a7, uint64_t a8)
{
  uint64_t result;
  double v15;
  int v16;
  double v17;
  int v18;
  uint64_t v19;
  char v20[512];
  char __format[512];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  getACTRegistrationMethodDescription(*(_DWORD *)(a8 + 4), v20);
  __sprintf_chk(__format, 0, 0x200uLL, "{ACTRegistration|predictionMethod:%s}", v20);
  if (*(_BYTE *)(a8 + 92))
    syslog(5, "%s", __format);
  if (*(_BYTE *)(a8 + 93))
    ACTLogMessageImp(1, __format);
  v19 = 0;
  v18 = 0;
  if (a5)
  {
    if (a5 != 2)
      return 0xFFFFFFFFLL;
    if (MFRegRegisterSlices(a1, a3, *(_QWORD *)(a8 + 32), (float *)&v19 + 1, (float *)&v19, &v18))
      return 4294967290;
    v16 = v18;
    v17 = *((float *)&v19 + 1);
    v15 = *(float *)&v19;
  }
  else
  {
    v15 = 0.0;
    v16 = 0;
    v17 = 0.0;
  }
  result = 0;
  *(double *)(a6 + 32) = v17;
  *(double *)(a6 + 40) = v15;
  *a7 = v16;
  return result;
}

uint64_t getACTPredictionMethod(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

BOOL ACTQueryPredictorValidator(uint64_t a1)
{
  return *(_DWORD *)(a1 + 88) > 6;
}

uint64_t ACTRegisterSlices(__CVBuffer *a1, uint64_t a2, __CVBuffer *a3, uint64_t a4, int a5, int *a6, uint64_t a7, uint64_t a8, float *a9, uint64_t a10)
{
  uint64_t v17;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t v20;
  unsigned int v21;
  unsigned int v22;
  int updated;
  int v24;
  __int128 v25;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CGAffineTransform v31;
  uint64_t v32;
  unint64_t v33;
  char v34[512];
  char __format[512];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  getACTRegistrationMethodDescription(*(_DWORD *)a10, v34);
  __sprintf_chk(__format, 0, 0x200uLL, "{ACTRegistration|registrationMethod:%s}", v34);
  if (*(_BYTE *)(a10 + 92))
    syslog(5, "%s", __format);
  if (*(_BYTE *)(a10 + 93))
    ACTLogMessageImp(1, __format);
  *(_OWORD *)a8 = *(_OWORD *)a7;
  *(_OWORD *)(a8 + 16) = *(_OWORD *)(a7 + 16);
  *(_OWORD *)(a8 + 32) = *(_OWORD *)(a7 + 32);
  if (a5 == 1 || a5 == 3)
  {
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    v20 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
    *(float *)&v21 = *(double *)(a7 + 32);
    *(float *)&v22 = *(double *)(a7 + 40);
    v33 = __PAIR64__(v21, v22);
    updated = ABRegUpdateIntegralImage((uint64_t)BaseAddressOfPlane + BytesPerRowOfPlane * a4, v20, *(unsigned int **)(a10 + 24));
    v32 = 0;
    if (!updated)
    {
      updated = ABRegRegisterSlicesRobust(10, 0.5, 5, *(_DWORD *)(a10 + 20), *(_QWORD *)(a10 + 24), (float *)&v33 + 1, (float *)&v33, (_DWORD *)&v32 + 1, (float *)&v32);
      *(_DWORD *)a9 = v32;
    }
    if (!correctTxTyWithIspData((float *)&v33 + 1, (float *)&v33, (float *)a10))
    {
      ACTLogMessageImp(1, "{ACTRegistration|txty corrected %f %f}\n", *((float *)&v33 + 1), *(float *)&v33);
      updated = 0;
    }
    v17 = 4294967292;
    v24 = 2;
    if ((updated & 0x80000000) == 0 && updated != 1)
    {
      CGAffineTransformMakeTranslation(&v31, *((float *)&v33 + 1), *(float *)&v33);
      v25 = *(_OWORD *)&v31.c;
      *(_OWORD *)a8 = *(_OWORD *)&v31.a;
      *(_OWORD *)(a8 + 16) = v25;
      *(_OWORD *)(a8 + 32) = *(_OWORD *)&v31.tx;
      v17 = *a9 < 0.175;
      v24 = 2 * v17;
    }
    *a6 = v24;
  }
  else
  {
    if (a5 != 2)
    {
      v17 = 0xFFFFFFFFLL;
      ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)");
      return v17;
    }
    LODWORD(v31.a) = 0;
    v33 = 0;
    if (MFRegRegisterSlices(a1, a3, *(_QWORD *)(a10 + 32), (float *)&v31, (float *)&v33 + 1, &v33))
    {
      *a6 = 0;
      v17 = 4294967292;
    }
    else
    {
      v17 = 0;
      v27 = *((float *)&v33 + 1);
      *(double *)(a8 + 32) = *(float *)&v31.a;
      *(double *)(a8 + 40) = v27;
    }
  }
  __sprintf_chk(__format, 0, 0x200uLL, "{ACTRegistration|tx:%.3f}{ACTRegistration|ty:%.3f}{ACTRegistration|quality:%.3f}", *(double *)(a8 + 32), *(double *)(a8 + 40), *a9);
  if (*(_BYTE *)(a10 + 92))
    syslog(5, "%s", __format);
  if (*(_BYTE *)(a10 + 93))
    ACTLogMessageImp(1, __format, v28, v29, v30);
  return v17;
}

uint64_t getACTRegistrationInvokeFallback(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t ACTPostRegisterSlices(__CVBuffer *a1, uint64_t a2, __CVBuffer *a3, uint64_t a4, int a5, int a6, uint64_t a7, int a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  float v22;
  float v23;
  int v24;
  double v25;
  double v26;
  float v27;
  float v28;
  int updated;
  int v30;
  int v32;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v35;
  char __format[512];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  __sprintf_chk(__format, 0, 0x200uLL, "{ACTRegistration|postRegistration}");
  if (*(_BYTE *)(a13 + 92))
    syslog(5, "%s", __format);
  if (*(_BYTE *)(a13 + 93))
    ACTLogMessageImp(1, __format);
  v18 = *(_OWORD *)(a13 + 56);
  *(_OWORD *)&t1.a = *(_OWORD *)(a13 + 40);
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a13 + 72);
  memset(&v35, 0, sizeof(v35));
  v19 = *(_OWORD *)(a11 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a11;
  *(_OWORD *)&t2.c = v19;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a11 + 32);
  CGAffineTransformConcat(&v35, &t1, &t2);
  v20 = *(_OWORD *)&v35.c;
  *(_OWORD *)(a13 + 40) = *(_OWORD *)&v35.a;
  *(_OWORD *)(a13 + 56) = v20;
  *(_OWORD *)(a13 + 72) = *(_OWORD *)&v35.tx;
  if (!(a6 | a5) && *(_DWORD *)(a13 + 16) && *(_DWORD *)(a13 + 8) != 2 && *(_DWORD *)(a13 + 4) == 2 && a9)
  {
    LODWORD(t1.a) = 0;
    LODWORD(t2.a) = 0;
    v25 = *(double *)(a11 + 32);
    v26 = *(double *)(a11 + 40);
    if (MFGetMotionFilterIncrementalTranslation(a1, a3, *(_QWORD *)(a13 + 32), (float *)&t1, (float *)&t2))
    {
      v27 = v26;
      v28 = v25;
      updated = MFRegUpdateCorrector(a3, *(_QWORD *)(a13 + 32), v28, v27, *(float *)&t1.a, *(float *)&t2.a);
      if (!updated || (v30 = updated, MFResetCorrector(*(_QWORD *)(a13 + 32)), (v30 & 0x80000000) == 0))
      {
        v21 = 0;
        goto LABEL_12;
      }
      v32 = 913;
    }
    else
    {
      v32 = 902;
    }
    v21 = 4294967290;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -6, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", v32);
    return v21;
  }
  if (MFRegDampenCorrector(a3, *(float **)(a13 + 32)))
    v21 = 4294967290;
  else
    v21 = 0;
  if (!(_DWORD)v21)
  {
LABEL_12:
    if ((a8 & 1) == 0)
    {
      v22 = *(double *)(a11 + 32) - *(double *)(a10 + 32);
      v23 = *(double *)(a11 + 40) - *(double *)(a10 + 40);
      if ((float)((float)(v23 * v23) + (float)(v22 * v22)) <= 900.0)
        v24 = *(_DWORD *)(a13 + 88) + 1;
      else
        v24 = 0;
      *(_DWORD *)(a13 + 88) = v24;
    }
  }
  if (*(_BYTE *)(a13 + 95))
    ACTAttachRegistrationMetadata(a1, MEMORY[0x24BDBD8B8], *(_DWORD *)(a13 + 8), a8);
  ACTAttachRegistrationMetadata(a3, (const UInt8 *)a11, *(_DWORD *)(a13 + 8), a8);
  return v21;
}

uint64_t getACTRegistrationCSVLogLevel(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 94);
}

uint64_t ACTAddCSVMetadata(__CVBuffer *a1, int a2, int a3, int a4, int a5, int a6, int a7, uint64_t a8, float a9, float a10, float a11, float a12, float a13, float a14, float a15, float a16, float a17, int a18, float a19, float a20,float a21,float a22,int a23,float a24,float a25,unsigned __int8 *a26,unsigned __int8 *a27,uint64_t a28)
{
  const __CFNumber *Attachment;
  float *v42;
  uint64_t v43;
  size_t v44;
  char *v45;
  size_t v46;
  size_t v47;
  char *v48;
  char v52[32];
  char v53[32];
  char __s[512];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a28 + 96))
  {
    Attachment = (const __CFNumber *)CVBufferGetAttachment(a1, CFSTR("CaptureTimeInSeconds"), 0);
    v42 = (float *)(a28 + 112);
    if (Attachment)
      CFNumberGetValue(Attachment, kCFNumberFloatType, v42);
    else
      *v42 = *v42 + 1.0;
    __sprintf_chk(v53, 0, 0x20uLL, "%3d|%3d|%3d|%3d", *a26, a26[1], a26[2], a26[3]);
    __sprintf_chk(v52, 0, 0x20uLL, "%3d|%3d|%3d|%3d", *a27, a27[1], a27[2], a27[3]);
    __sprintf_chk(__s, 0, 0x200uLL, "%f, %d, %d, %.3f, %d, %d, %d, %.3f, %.3f, %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f, %.6f, %.6f, %d, %.6f, %.6f, %.6f, %.6f, %d, %.6f, %.6f, %s, %s\n", *(float *)(a28 + 112), a2, a3, a9, a4, a5, a6, a10, a11, a7, a12, a13, *(double *)(a8 + 32), *(double *)(a8 + 40),
      a14,
      a15,
      a16,
      a17,
      a18,
      a19,
      a20,
      a21,
      a22,
      a23,
      a24,
      a25,
      v53,
      v52);
    v44 = strlen(__s);
    v45 = *(char **)(a28 + 96);
    v46 = strlen(v45);
    v47 = *(_QWORD *)(a28 + 104);
    if (v46 + v44 >= v47)
    {
      v48 = (char *)malloc_type_realloc(v45, v47 + 512, 0x716D5DB7uLL);
      *(_QWORD *)(a28 + 96) = v48;
      if (!v48)
      {
        v43 = 4294967291;
        ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 508);
        return v43;
      }
      v45 = v48;
      *(_QWORD *)(a28 + 104) += 512;
    }
    strcat(v45, __s);
    return 0;
  }
  else
  {
    v43 = 4294967293;
    ACTLogMessageImp(4, "ACTRegistration Error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTRegistration.c", 452);
  }
  return v43;
}

uint64_t getACTRegistrationMethodUsed(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t getACTRegistrationUsePrediction(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 13);
}

uint64_t ACTAttachRegistrationMetadata(__CVBuffer *a1, const UInt8 *a2, int a3, int a4)
{
  const __CFAllocator *v6;
  CFDataRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  int v11;
  int valuePtr;

  valuePtr = a3;
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, 48);
  CVBufferSetAttachment(a1, CFSTR("ACTRegistrationTransformationKey"), v7, kCVAttachmentMode_ShouldPropagate);
  CFRelease(v7);
  v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
  CVBufferSetAttachment(a1, CFSTR("ACTRegistrationLastMethodKey"), v8, kCVAttachmentMode_ShouldPropagate);
  CFRelease(v8);
  v11 = a4;
  v9 = CFNumberCreate(v6, kCFNumberIntType, &v11);
  CVBufferSetAttachment(a1, CFSTR("ACTRegistrationWasFallbackInvokedKey"), v9, kCVAttachmentMode_ShouldPropagate);
  CFRelease(v9);
  return 0;
}

uint64_t getACTRegistrationSyslogLevel(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 92);
}

uint64_t getACTRegistrationLogLevel(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 93);
}

uint64_t ACTUpdatePredictorValidator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float v3;
  float v4;
  int v5;

  v3 = *(double *)(a2 + 32) - *(double *)(a1 + 32);
  v4 = *(double *)(a2 + 40) - *(double *)(a1 + 40);
  if ((float)((float)(v4 * v4) + (float)(v3 * v3)) <= 900.0)
    v5 = *(_DWORD *)(a3 + 88) + 1;
  else
    v5 = 0;
  *(_DWORD *)(a3 + 88) = v5;
  return 0;
}

uint64_t getACTRegistrationMethodDescription(unsigned int a1, char *a2)
{
  if (a1 > 3)
    return sprintf(a2, "Invalid");
  else
    return sprintf(a2, off_24EFC2930[a1]);
}

BOOL correctTxTyWithIspData(float *a1, float *a2, float *a3)
{
  float v5;
  float v6;
  float v7;

  v5 = a3[32] - a3[30];
  v6 = a3[33] - a3[31];
  ACTLogMessageImp(1, "{ACTRegistration|correctTxTyWithIspData %f %f, %f %f}\n", *a1, *a2, v5, v6);
  v7 = vabds_f32(*a2, v6);
  if (v7 > 50.0)
  {
    *a1 = v5;
    *a2 = v6;
  }
  return v7 <= 50.0;
}

float getACTRegistrationCurTxTy(uint64_t a1, _DWORD *a2, float *a3)
{
  float result;

  *a2 = *(_DWORD *)(a1 + 128);
  result = *(float *)(a1 + 132);
  *a3 = result;
  return result;
}

float getACTRegistrationPrevTxTy(uint64_t a1, _DWORD *a2, float *a3)
{
  float result;

  *a2 = *(_DWORD *)(a1 + 120);
  result = *(float *)(a1 + 124);
  *a3 = result;
  return result;
}

uint64_t getACTRegistrationMFDriftCorrectorFlag(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t getACTRegistrationDirection(uint64_t a1)
{
  return *(unsigned int *)(a1 + 20);
}

uint64_t setACTRegistrationUsePrediction(uint64_t result, char a2)
{
  *(_BYTE *)(result + 13) = a2;
  return result;
}

uint64_t setACTRegistrationCurTxTy(uint64_t result, float a2, float a3)
{
  *(float *)(result + 128) = a2;
  *(float *)(result + 132) = a3;
  return result;
}

uint64_t setACTRegistrationPrevTxTy(uint64_t result, float a2, float a3)
{
  *(float *)(result + 120) = a2;
  *(float *)(result + 124) = a3;
  return result;
}

uint64_t getACTRegistrationCSVLogBuffer(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

__n128 getACTRegistrationCumulativeTransform(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_OWORD *)a2 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 72);
  *(__n128 *)(a2 + 32) = result;
  return result;
}

uint64_t getACTRegistrationForceMaxComputation(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 116);
}

void getThreadgroupSizeForShader(void *a1@<X0>, unint64_t *a2@<X8>)
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = a1;
  v7 = objc_msgSend_threadExecutionWidth(v3, v4, v5, v6);
  v11 = objc_msgSend_maxTotalThreadsPerThreadgroup(v3, v8, v9, v10);

  *a2 = v7;
  a2[1] = v11 / v7;
  a2[2] = 1;
}

void getThreadgroupSizeForShaderDebug(void *a1@<X0>, const char *a2@<X1>, unint64_t *a3@<X8>)
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v5 = a1;
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  v12 = v5;
  getThreadgroupSizeForShader(v5, a3);
  if (a2)
  {
    v10 = *a3;
    v9 = a3[1];
    v11 = objc_msgSend_maxTotalThreadsPerThreadgroup(v12, v6, v7, v8);
    ACTLogMessageImp(1, "%s tg w h: %lu %lu, maxTotalThreadsPerThreadgroup: %lu\n", a2, v10, v9, v11);
  }

}

uint64_t printHomography(__n128 a1, __n128 a2, __n128 a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];

  v3 = 0;
  v8[0] = a1;
  v8[1] = a2;
  v8[2] = a3;
  do
  {
    v4 = 0;
    v6 = v8[v3];
    do
    {
      v7 = v6;
      printf("%f ", *(float *)((unint64_t)&v7 & 0xFFFFFFFFFFFFFFF3 | (4 * (v4++ & 3))));
    }
    while (v4 != 3);
    putchar(10);
    ++v3;
  }
  while (v3 != 3);
  return puts("\n");
}

double convertCoordMetalToLKT(float32x4_t a1, float32x4_t a2, float32x4_t a3, float a4, float a5)
{
  simd_float3 v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  simd_float3 v9;
  int32x4_t v10;
  simd_float3 v11;
  int32x4_t v15;
  int32x4_t v16;
  simd_float3 v17;
  int32x4_t v18;
  int32x4_t v19;
  simd_float3 v20;
  simd_float3x3 v21;
  simd_float3x3 v22;

  v21.columns[2] = *(simd_float3 *)(MEMORY[0x24BDAEDF8] + 32);
  v5.f32[0] = 1.0 / a4;
  v5.i32[1] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  v5.i32[2] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 8);
  v5.i32[3] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  v10 = (int32x4_t)v5;
  v11 = v21.columns[2];
  v21.columns[1].i32[0] = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v21.columns[1].f32[1] = 1.0 / a5;
  v21.columns[1].i64[1] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 24);
  v9 = v21.columns[1];
  v21.columns[0] = v5;
  v22 = __invert_f3(v21);
  v6 = 0;
  v15 = v10;
  v16 = (int32x4_t)v9;
  v17 = v11;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v6) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a1, COERCE_FLOAT(*(_OWORD *)((char *)&v15 + v6))), a2, *(float32x2_t *)&v15.i8[v6], 1), a3, *(float32x4_t *)((char *)&v15 + v6), 2);
    v6 += 16;
  }
  while (v6 != 48);
  v7 = 0;
  v15 = v18;
  v16 = v19;
  v17 = v20;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v18 + v7) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v22.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v15 + v7))), (float32x4_t)v22.columns[1], *(float32x2_t *)&v15.i8[v7], 1), (float32x4_t)v22.columns[2], *(float32x4_t *)((char *)&v15 + v7), 2);
    v7 += 16;
  }
  while (v7 != 48);
  *(_QWORD *)&result = vzip1q_s32(v18, v19).u64[0];
  return result;
}

double convertCoordLKTToMetal(int32x4_t a1, int32x4_t a2, int32x4_t a3, simd_float3 a4, float a5)
{
  uint64_t v5;
  float32x4_t v6;
  float32x4_t v7;
  float32x4_t v8;
  uint64_t v9;
  simd_float3 v11;
  simd_float3 v12;
  simd_float3 v13;
  simd_float3 v17;
  simd_float3 v18;
  simd_float3 v19;
  simd_float3 v20;
  simd_float3 v21;
  simd_float3 v22;
  simd_float3x3 v23;
  simd_float3x3 v24;

  a4.i32[1] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  v23.columns[2] = *(simd_float3 *)(MEMORY[0x24BDAEDF8] + 32);
  a4.i32[2] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 8);
  a4.i32[3] = HIDWORD(*MEMORY[0x24BDAEDF8]);
  v23.columns[0] = a4;
  v12 = a4;
  v13 = v23.columns[2];
  v23.columns[1].i32[0] = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
  v23.columns[1].f32[1] = a5;
  v23.columns[1].i64[1] = *(_QWORD *)(MEMORY[0x24BDAEDF8] + 24);
  v11 = v23.columns[1];
  v24 = __invert_f3(v23);
  v5 = 0;
  v6 = (float32x4_t)vzip1q_s32(a1, a2);
  v6.i32[2] = a3.i32[0];
  v7 = (float32x4_t)vzip2q_s32(a1, a2);
  v7.i32[2] = a3.i32[2];
  v8 = (float32x4_t)vzip2q_s32(vzip1q_s32(a1, a3), vdupq_lane_s32(*(int32x2_t *)a2.i8, 1));
  v17 = v12;
  v18 = v11;
  v19 = v13;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v20 + v5 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v6, COERCE_FLOAT(*(_OWORD *)((char *)&v17 + v5 * 4))), v8, *(float32x2_t *)&v17.f32[v5], 1), v7, *(float32x4_t *)((char *)&v17 + v5 * 4), 2);
    v5 += 4;
  }
  while (v5 != 12);
  v9 = 0;
  v17 = v20;
  v18 = v21;
  v19 = v22;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  do
  {
    *(float32x4_t *)((char *)&v20 + v9 * 4) = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v24.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v17 + v9 * 4))), (float32x4_t)v24.columns[1], *(float32x2_t *)&v17.f32[v9], 1), (float32x4_t)v24.columns[2], *(float32x4_t *)((char *)&v17 + v9 * 4), 2);
    v9 += 4;
  }
  while (v9 != 12);
  return *(double *)v20.i64;
}

double getHostTime()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&qword_2558F4790 == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_2558F4790 = (double)v0 / (double)v1 * 0.000000001;
  }
  return *(double *)&qword_2558F4790 * (double)mach_absolute_time();
}

void applyWiringAssertionToProperties(CFDictionaryRef *a1)
{
  __CFDictionary *MutableCopy;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x24BDAC8D0];
  if (getCFPreferenceNumber(CFSTR("IOSurfaceWiringAssert"), CFSTR("com.apple.act"), 1))
  {
    if (*a1)
    {
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, *a1);
      CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x24BDC5680], (const void *)*MEMORY[0x24BDBD270]);
      CFRelease(*a1);
      *a1 = MutableCopy;
    }
    else
    {
      keys[0] = *(void **)MEMORY[0x24BDC5680];
      values = (void *)*MEMORY[0x24BDBD270];
      *a1 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
  }
}

uint64_t getCFPreferenceNumber(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t IntValue;
  CFTypeID v8;
  CFTypeID v9;
  unsigned int valuePtr;

  v4 = (const __CFString *)CFPreferencesCopyValue(a1, a2, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      IntValue = CFStringGetIntValue(v5);
      if ((int)IntValue <= 0)
      {
        IntValue = 1;
        if (CFStringCompare(v5, CFSTR("true"), 1uLL))
        {
          IntValue = 1;
          if (CFStringCompare(v5, CFSTR("yes"), 1uLL))
          {
            if (CFStringCompare(v5, CFSTR("false"), 1uLL) == kCFCompareEqualTo
              || CFStringCompare(v5, CFSTR("no"), 1uLL) == kCFCompareEqualTo
              || (IntValue = a3, CFStringCompare(v5, CFSTR("0"), 1uLL) == kCFCompareEqualTo))
            {
              IntValue = 0;
            }
          }
        }
      }
    }
    else
    {
      v8 = CFGetTypeID(v5);
      if (v8 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr))
          IntValue = valuePtr;
        else
          IntValue = a3;
      }
      else
      {
        v9 = CFGetTypeID(v5);
        IntValue = a3;
        if (v9 == CFBooleanGetTypeID())
          IntValue = CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDBD270]);
      }
    }
    CFRelease(v5);
    return IntValue;
  }
  return a3;
}

float getCFPreferenceFloat(const __CFString *a1, const __CFString *a2, float DoubleValue)
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  CFTypeID v6;
  CFTypeID v7;
  int valuePtr;

  v4 = (const __CFNumber *)CFPreferencesCopyValue(a1, a2, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      if (CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr))
        DoubleValue = (float)valuePtr;
    }
    v7 = CFGetTypeID(v5);
    if (v7 == CFStringGetTypeID())
      DoubleValue = CFStringGetDoubleValue((CFStringRef)v5);
    CFRelease(v5);
  }
  return DoubleValue;
}

uint64_t copyDebugDescrioption(void *a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x2276B4A70]();
  objc_msgSend_description(a1, v3, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v2);
  return v6;
}

void getIspTxTy(opaqueCMSampleBuffer *a1, _DWORD *a2, _DWORD *a3)
{
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  int v17;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CMSampleBufferGetImageBuffer(a1);
  CMGetAttachment(a1, CFSTR("ClientSpecifiedMetadata"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("Translation"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)CFSTR("Translation"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v12, v13, v14, v15) == 8)
    {
      objc_msgSend_getBytes_length_(v12, v16, (uint64_t)v18, 8);
      v17 = v18[1];
      *a2 = v18[0];
      *a3 = v17;
    }

  }
  else
  {
    *a2 = -1082130432;
    *a3 = -1082130432;
  }

}

_QWORD *createBlendingContext(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void (*v6)(void **);
  const __CFNumber *(*v7)(const __CFNumber *, const __CFDictionary *);
  uint64_t (*v8)(uint64_t);
  void (*v9)(uint64_t *);
  uint64_t (*v10)(uint64_t *, CVPixelBufferRef);
  uint64_t (*v11)(uint64_t *, const __CFDictionary *);
  uint64_t (*v12)(uint64_t *);
  uint64_t (*v13)(uint64_t, _QWORD *, _QWORD *, _QWORD *, _QWORD *);
  uint64_t (*v14)(uint64_t, char);
  void (*v15)(uint64_t *, int);
  uint64_t (*v16)(uint64_t, char);
  uint64_t (*v17)(uint64_t);
  uint64_t (*v18)(uint64_t *, unsigned int);
  uint64_t (*v19)(uint64_t, float);
  _QWORD *v20;
  _QWORD v22[2];

  v2 = malloc_type_calloc(0x20uLL, 1uLL, 0x44124FD9uLL);
  if (v2)
  {
    v3 = malloc_type_calloc(0x78uLL, 1uLL, 0x3ADEF6BDuLL);
    v2[3] = v3;
    if (!v3)
      goto LABEL_31;
    v4 = *(_QWORD *)(a1 + 56);
    v22[0] = 0;
    v22[1] = v4;
    v2[1] = createACTNoiseReductionContext((uint64_t)v22);
    v5 = BlendingCtrl_createBlendingContext;
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      v5 = BlendingCtrl_createBlendingContext_v2;
      v6 = BlendingCtrl_deleteBlendingContext_v2;
    }
    else
    {
      v6 = BlendingCtrl_deleteBlendingContext;
    }
    v7 = BlendingCtrl_setOptions;
    if (*(_DWORD *)(a1 + 48) == 1)
      v7 = BlendingCtrl_setOptions_v2;
    v8 = BlendingCtrl_getTargetContext;
    if (*(_DWORD *)(a1 + 48) == 1)
      v8 = BlendingCtrl_getTargetContext_v2;
    v9 = BlendingCtrl_resetBlendingContext;
    if (*(_DWORD *)(a1 + 48) == 1)
      v9 = BlendingCtrl_resetBlendingContext_v2;
    v10 = BlendingCtrl_cropAndRotateBuffer_v2;
    if (*(_DWORD *)(a1 + 48) != 1)
      v10 = BlendingCtrl_cropAndRotateBuffer;
    v11 = BlendingCtrl_blendSliceIntoContext;
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      v11 = BlendingCtrl_blendSliceIntoContext_v2;
      v12 = BlendingCtrl_finishBlending_v2;
    }
    else
    {
      v12 = BlendingCtrl_finishBlending;
    }
    v13 = BlendingCtrl_getCroppingArea;
    if (*(_DWORD *)(a1 + 48) == 1)
      v13 = BlendingCtrl_getCroppingArea_v2;
    v14 = BlendingCtrl_setBlendingForceMaxComputation;
    if (*(_DWORD *)(a1 + 48) == 1)
      v14 = BlendingCtrl_setBlendingForceMaxComputation_v2;
    v15 = BlendingCtrl_setPanoramaDirection;
    if (*(_DWORD *)(a1 + 48) == 1)
      v15 = BlendingCtrl_setPanoramaDirection_v2;
    v16 = BlendingCtrl_setEdgeBlendingErrorMetricLogging_v2;
    if (*(_DWORD *)(a1 + 48) != 1)
      v16 = BlendingCtrl_setEdgeBlendingErrorMetricLogging;
    v17 = BlendingCtrl_Defaults_getBlendingDefaults;
    if (*(_DWORD *)(a1 + 48) == 1)
    {
      v17 = BlendingCtrl_Defaults_getBlendingDefaults_v2;
      v18 = BlendingCtrl_Defaults_setBlendingDefaults_v2;
    }
    else
    {
      v18 = BlendingCtrl_Defaults_setBlendingDefaults;
    }
    v19 = BlendingCtrl_setMaxOverlapPercent;
    v20 = (_QWORD *)v2[3];
    if (*(_DWORD *)(a1 + 48) == 1)
      v19 = BlendingCtrl_setMaxOverlapPercent_v2;
    *v20 = v5;
    v20[1] = v6;
    v20[2] = v7;
    v20[3] = v8;
    v20[4] = v9;
    v20[5] = v10;
    v20[6] = v11;
    v20[7] = v12;
    v20[10] = v15;
    v20[11] = v14;
    v20[8] = v13;
    v20[9] = v16;
    v20[13] = v18;
    v20[14] = v17;
    v20[12] = v19;
    ((void (*)(_QWORD *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v5)(v2, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(unsigned int *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 52));
    if (!*v2)
    {
LABEL_31:
      free(v2);
      return 0;
    }
  }
  return v2;
}

void deleteBlendingContext(_QWORD *a1)
{
  uint64_t v2;

  if (a1)
  {
    (*(void (**)(_QWORD))(a1[3] + 8))(*a1);
    v2 = a1[1];
    if (v2)
      deleteNoiseReductionContext(v2);
    free((void *)a1[3]);
    free(a1);
  }
}

uint64_t getTargetContext(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 24))(*a1);
}

uint64_t resetBlendingContext(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 32))(*a1);
}

uint64_t cropAndRotateBufferForBlending(_QWORD *a1, __CVBuffer *a2)
{
  double v4;
  const __CFDictionary *Attachment;
  double updated;
  uint64_t v7;
  __CVBuffer *v8;
  int v9;
  const __CFNumber *v10;
  double v11;
  int valuePtr;
  CVAttachmentMode attachmentMode;

  if (a1[1])
  {
    v4 = sub_22761B374();
    attachmentMode = kCVAttachmentMode_ShouldPropagate;
    Attachment = (const __CFDictionary *)CVBufferGetAttachment(a2, CFSTR("MetadataDictionary"), &attachmentMode);
    updated = updateACTNoiseReductionContext(a1[1], Attachment);
    v7 = a1[1];
    if (*(_BYTE *)(v7 + 156))
    {
      v8 = (__CVBuffer *)(*(uint64_t (**)(_QWORD, double))(a1[3] + 24))(*a1, updated);
      setACTNoiseReductionBuffer(v7, v8);
    }
    v9 = -1;
    valuePtr = -1;
    v10 = (const __CFNumber *)CVBufferGetAttachment(a2, CFSTR("ID"), 0);
    if (v10)
    {
      CFNumberGetValue(v10, kCFNumberIntType, &valuePtr);
      v9 = valuePtr;
    }
    v11 = sub_22761B374();
    ACTLogMessageImp(1, "{Blending%d|nrWorkBeginTook:%f\n}", v9, v11 - v4);
  }
  return (*(uint64_t (**)(_QWORD, __CVBuffer *))(a1[3] + 40))(*a1, a2);
}

double sub_22761B374()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&qword_253E99A18 == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_253E99A18 = (double)v0 / (double)v1 * 0.000000001;
  }
  return *(double *)&qword_253E99A18 * (double)mach_absolute_time();
}

uint64_t blendSliceIntoContext(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 48))(*a1);
}

uint64_t finishBlending(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 56))(*a1);
}

uint64_t getCroppingArea(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 64))(*a1);
}

uint64_t setEdgeBlendingErrorMetricLogging(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 72))(*a1);
}

uint64_t setPanoramaDirection(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 80))(*a1);
}

uint64_t setBlendingForceMaxComputation(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 88))(*a1);
}

uint64_t setMaxOverlapPercent(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 96))(*a1);
}

__CFDictionary *getDefaultPowerBlurTuning(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  __CFDictionary *result;
  const __CFDictionary *v6;
  const __CFNumber *Value;
  const __CFNumber *v8;
  int v9;
  uint64_t valuePtr;

  valuePtr = 0;
  result = ACT_CopyDefaultConfigurationForPanorama();
  if (result)
  {
    v6 = result;
    Value = (const __CFNumber *)CFDictionaryGetValue(result, CFSTR("ACTPanoramaPowerBlurSlope"));
    v8 = (const __CFNumber *)CFDictionaryGetValue(v6, CFSTR("ACTPanoramaPowerBlurBias"));
    if (Value && v8 && CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr))
    {
      v9 = CFNumberGetValue(Value, kCFNumberSInt32Type, (char *)&valuePtr + 4);
      CFRelease(v6);
      if (v9)
      {
        *a2 = valuePtr;
        *a3 = HIDWORD(valuePtr);
        return (__CFDictionary *)1;
      }
    }
    else
    {
      CFRelease(v6);
    }
    return 0;
  }
  return result;
}

uint64_t setPowerBlurTuning(uint64_t result, int a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 8);
  if (v3)
  {
    *(_DWORD *)(v3 + 140) = a3;
    *(_DWORD *)(v3 + 144) = a2;
    *(_BYTE *)(v3 + 136) = 1;
  }
  return result;
}

void resetNoiseReduction(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    resetNoiseReductionContext(v1);
}

uint64_t setBlendingContextOptions(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 16))(*a1);
}

uint64_t set_Defaults_ACTBlendingConfig(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = a1[1];
  if (v4)
    resetNoiseReductionContext(v4);
  return (*(uint64_t (**)(_QWORD, uint64_t))(a1[3] + 104))(*a1, a2);
}

uint64_t get_Defaults_ACTBlendingConfig(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD))(a1[3] + 112))(*a1);
}

uint64_t ACTLogAddListener(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  _DWORD *v7;
  uint64_t v8;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    v7 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A0040914F2AA0uLL);
    if (v7)
    {
      *(_QWORD *)v7 = a1;
      v7[2] = a2;
      v8 = gListenerList;
      *((_QWORD *)v7 + 2) = a3;
      *((_QWORD *)v7 + 3) = v8;
      gListenerList = (uint64_t)v7;
      return 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ACTLogRemoveListener(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v1 = 0xFFFFFFFFLL;
  if (a1)
  {
    v3 = (_QWORD *)gListenerList;
    if (gListenerList)
    {
      if (*(_QWORD *)gListenerList == a1)
      {
        v5 = 0;
LABEL_9:
        v6 = (uint64_t *)(v5 + 24);
        if (!v5)
          v6 = &gListenerList;
        *v6 = v3[3];
        free(v3);
        return 1;
      }
      else
      {
        v4 = gListenerList;
        while (1)
        {
          v3 = *(_QWORD **)(v4 + 24);
          if (!v3)
            return 0xFFFFFFFFLL;
          v5 = v4;
          v4 = *(_QWORD *)(v4 + 24);
          if (*v3 == a1)
            goto LABEL_9;
        }
      }
    }
  }
  return v1;
}

uint64_t ACTLogReset()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = (_QWORD *)gListenerList;
  if (gListenerList)
  {
    do
    {
      v1 = (_QWORD *)v0[3];
      free(v0);
      v0 = v1;
    }
    while (v1);
  }
  gListenerList = 0;
  return 1;
}

uint64_t ACTLogMessageImp(uint64_t a1, char *__format, ...)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  size_t v7;
  char *v8;
  char __str;
  va_list v10;
  va_list va;

  va_start(va, __format);
  result = 0xFFFFFFFFLL;
  if ((_DWORD)a1 && __format)
  {
    v5 = gListenerList;
    va_copy(v10, va);
    v6 = vsnprintf(&__str, 1uLL, __format, va);
    if (v6 > 0
      && (v7 = (v6 + 1),
          v8 = (char *)malloc_type_malloc(v7, 0xE56CAFDFuLL),
          vsnprintf(v8, v7, __format, va),
          v8))
    {
      if (v5)
      {
        do
        {
          if ((*(_DWORD *)(v5 + 8) & a1) != 0)
            (*(void (**)(uint64_t, _QWORD, char *))v5)(a1, *(_QWORD *)(v5 + 16), v8);
          v5 = *(_QWORD *)(v5 + 24);
        }
        while (v5);
      }
      else
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
      }
      free(v8);
      return 1;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t ABRegInitContext(int a1, int a2, char a3, char a4, char a5, char a6, int *a7)
{
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t inited;
  void *v14;
  char *v15;
  void *v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;
  char *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t MeanStdTable;
  uint64_t v29;
  signed int v30;
  signed int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v7 = 0xFFFFFFFFLL;
  if (a1 >= 1 && a2 >= 1)
  {
    *a7 = a1;
    a7[1] = a2;
    if (a2 <= a1)
      v9 = a1;
    else
      v9 = a2;
    *((_BYTE *)a7 + 181) = a4;
    *((_BYTE *)a7 + 180) = a3;
    *((_BYTE *)a7 + 182) = a5;
    *((_BYTE *)a7 + 183) = a6;
    a7[2] = v9;
    v10 = *((_QWORD *)a7 + 2);
    if (v10)
    {
      v11 = disposeProjectionContext(v10);
      if ((v11 & 0x80000000) != 0)
      {
        v7 = v11;
        goto LABEL_31;
      }
      v12 = (void *)*((_QWORD *)a7 + 2);
    }
    else
    {
      v12 = malloc_type_calloc(1uLL, 0xF0uLL, 0x10100407CF591C2uLL);
      *((_QWORD *)a7 + 2) = v12;
    }
    inited = initProjectionContext(*a7, a7[1], (uint64_t)v12);
    if ((inited & 0x80000000) == 0)
    {
      v14 = (void *)*((_QWORD *)a7 + 3);
      if (v14)
        free(v14);
      v15 = (char *)malloc_type_malloc(8 * a7[1], 0x100004052888210uLL);
      *((_QWORD *)a7 + 3) = v15;
      if (v15)
      {
        *((_QWORD *)a7 + 4) = &v15[4 * a7[1]];
        v16 = (void *)*((_QWORD *)a7 + 5);
        if (v16)
          free(v16);
        v17 = (char *)malloc_type_malloc(8 * *a7, 0x100004052888210uLL);
        *((_QWORD *)a7 + 5) = v17;
        if (v17)
        {
          *((_QWORD *)a7 + 6) = &v17[4 * *a7];
          v18 = (void *)*((_QWORD *)a7 + 7);
          if (v18)
            free(v18);
          v19 = (char *)malloc_type_malloc(8 * a7[1], 0x100004052888210uLL);
          *((_QWORD *)a7 + 7) = v19;
          if (v19)
          {
            *((_QWORD *)a7 + 8) = &v19[4 * a7[1]];
            v20 = (void *)*((_QWORD *)a7 + 9);
            if (v20)
              free(v20);
            v21 = (char *)malloc_type_malloc(8 * *a7, 0x100004052888210uLL);
            *((_QWORD *)a7 + 9) = v21;
            if (v21)
            {
              *((_QWORD *)a7 + 10) = &v21[4 * *a7];
              v22 = (void *)*((_QWORD *)a7 + 11);
              if (v22)
                free(v22);
              v23 = (char *)malloc_type_malloc(16 * a7[2], 0x100004052888210uLL);
              *((_QWORD *)a7 + 11) = v23;
              if (v23)
              {
                v24 = a7[2];
                v25 = &v23[4 * v24];
                v26 = &v25[4 * v24];
                *((_QWORD *)a7 + 12) = v25;
                *((_QWORD *)a7 + 13) = v26;
                *((_QWORD *)a7 + 14) = &v26[4 * v24];
                if (*a7 > 4095 || a7[1] >= 4096)
                {
                  v7 = 0xFFFFFFFFLL;
                  ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 115);
                  return v7;
                }
                destroyMeanStdTable((uint64_t)(a7 + 30));
                destroyMeanStdTable((uint64_t)(a7 + 34));
                MeanStdTable = createMeanStdTable((_QWORD *)a7 + 15, 4095);
                if ((MeanStdTable & 0x80000000) != 0)
                {
                  v7 = MeanStdTable;
                  goto LABEL_33;
                }
                v29 = createMeanStdTable((_QWORD *)a7 + 17, 4095);
                if ((v29 & 0x80000000) != 0)
                {
                  v7 = v29;
                  goto LABEL_33;
                }
                v30 = vcvtps_s32_f32((float)*a7 * 0.125);
                v31 = vcvtps_s32_f32((float)a7[1] * 0.125);
                if (v30 <= v31)
                  v30 = v31;
                a7[44] = v30;
                v32 = (void *)*((_QWORD *)a7 + 19);
                if (v32)
                {
                  free(v32);
                  v30 = a7[44];
                }
                v33 = malloc_type_malloc(4 * v30, 0x100004052888210uLL);
                *((_QWORD *)a7 + 19) = v33;
                if (v33)
                {
                  v34 = (void *)*((_QWORD *)a7 + 20);
                  if (v34)
                    free(v34);
                  v35 = malloc_type_malloc(4 * a7[44], 0x100004052888210uLL);
                  *((_QWORD *)a7 + 20) = v35;
                  if (v35)
                  {
                    v36 = (void *)*((_QWORD *)a7 + 21);
                    if (v36)
                      free(v36);
                    v37 = malloc_type_malloc(4 * a7[44], 0x100004052888210uLL);
                    *((_QWORD *)a7 + 21) = v37;
                    if (v37)
                      return 0;
                  }
                }
              }
            }
          }
        }
      }
      v7 = 4294967294;
LABEL_33:
      ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)");
      return v7;
    }
    v7 = inited;
LABEL_31:
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)");
  }
  return v7;
}

uint64_t ABRegUpdateIntegralImage(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a1)
  {
    v3 = computeIntegralImages(a1, *a3, a3[1], a2, *((_QWORD *)a3 + 2));
    if ((v3 & 0x80000000) != 0)
    {
      v4 = v3;
      ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 170);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v4 = 4294967291;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 168);
  }
  return v4;
}

uint64_t ABRegDisposeContext(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (!a1)
    return 4294967291;
  v2 = a1[2];
  if (v2)
  {
    v3 = disposeProjectionContext(v2);
    if ((v3 & 0x80000000) != 0)
    {
      v12 = v3;
      ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", v3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 183);
      return v12;
    }
    free((void *)a1[2]);
  }
  v4 = (void *)a1[3];
  if (v4)
  {
    free(v4);
    a1[3] = 0;
  }
  v5 = (void *)a1[5];
  if (v5)
  {
    free(v5);
    a1[5] = 0;
  }
  v6 = (void *)a1[7];
  if (v6)
  {
    free(v6);
    a1[7] = 0;
  }
  v7 = (void *)a1[9];
  if (v7)
  {
    free(v7);
    a1[9] = 0;
  }
  v8 = (void *)a1[11];
  if (v8)
  {
    free(v8);
    a1[11] = 0;
  }
  v9 = (void *)a1[19];
  if (v9)
  {
    free(v9);
    a1[19] = 0;
  }
  v10 = (void *)a1[20];
  if (v10)
  {
    free(v10);
    a1[20] = 0;
  }
  v11 = (void *)a1[21];
  if (v11)
  {
    free(v11);
    a1[21] = 0;
  }
  destroyMeanStdTable((uint64_t)(a1 + 15));
  destroyMeanStdTable((uint64_t)(a1 + 17));
  return 0;
}

uint64_t ABRegComputeShift()
{
  float *v0;
  float *v1;
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  float *v6;
  float *v7;
  float v8;
  float v9;
  float v10;
  signed int v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;
  int v16;
  float v17;
  float *v18;
  float *v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  int v34;
  unsigned int v35;
  int v36;
  int v37;
  unsigned int v38;
  vDSP_Length v39;
  double v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  float v44;
  float v45;
  float v46;
  int v47;
  float v48;
  float v49;
  char v50;
  float v51;
  float v52;
  float v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  float v59;
  float *v61;
  float *v62;
  float v63;
  uint64_t v64;
  float v65;
  float v66;
  int v67;
  int v68;
  int v69;
  int v70;
  _QWORD *v71;
  _QWORD *v72;
  uint64_t v73;
  signed int v74;
  int v75;
  int v76;
  unsigned int v77;
  uint64_t v78;
  float __C;
  float v80;
  uint64_t v81;
  uint64_t v82;
  float __A[4096];
  uint64_t v84;

  v0 = (float *)MEMORY[0x24BDAC7A8]();
  v84 = *MEMORY[0x24BDAC8D0];
  v81 = 0;
  v82 = 0;
  if (!v5)
    return 4294967293;
  v11 = vcvtps_s32_f32(v9);
  v74 = vcvtms_s32_f32(v8);
  if (v74 > v11)
  {
    v12 = 0xFFFFFFFFLL;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 528);
    return v12;
  }
  v13 = v7;
  v14 = v5;
  v15 = v3;
  v16 = v2;
  v17 = v10;
  v18 = v1;
  v67 = v4;
  if (v3 < 1)
  {
    v62 = v7;
    goto LABEL_10;
  }
  v19 = v6;
  v20 = smoothSignature((uint64_t)v0, v2, v3, *(_QWORD *)(v5 + 88));
  if ((v20 & 0x80000000) == 0)
  {
    v21 = smoothSignature((uint64_t)v18, v16, v15, *(_QWORD *)(v14 + 96));
    if ((v21 & 0x80000000) != 0)
    {
      v12 = v21;
      v58 = 533;
      goto LABEL_76;
    }
    v62 = v13;
    v0 = *(float **)(v14 + 88);
    v18 = *(float **)(v14 + 96);
    v6 = v19;
LABEL_10:
    v80 = 0.0;
    v61 = v6;
    v22 = *v6;
    v72 = (_QWORD *)(v14 + 120);
    v73 = (uint64_t)v0;
    initMeanStdTable(v0, v16, v14 + 120);
    v71 = (_QWORD *)(v14 + 136);
    initMeanStdTable(v18, v16, v14 + 136);
    v23 = 0;
    v68 = 0;
    v64 = 0;
    v24 = v16 - 1;
    v25 = v16 - 1 - v74;
    v26 = -v74;
    v27 = ~v11 + v74;
    v63 = 0.0;
    v28 = -3.4028e38;
    v29 = 3.4028e38;
    v30 = 3.4028e38;
    v65 = 0.0;
    v66 = 3.4028e38;
    v31 = 0.0;
    v32 = 3.4028e38;
    v33 = 3.4028e38;
    v69 = v27;
    v70 = v16 - 1;
    do
    {
      if (v25 >= v24)
        v34 = v24;
      else
        v34 = v25;
      v35 = v26 & ~(v26 >> 31);
      if (v24 >= v24 + v26)
        v36 = v24 + v26;
      else
        v36 = v24;
      if ((int)(v36 - v35) >= 19)
      {
        v75 = v26;
        v76 = v25;
        v77 = v23;
        v37 = v74 + v23;
        v38 = v74 + v23 + v35;
        v39 = v36 - v35 + 1;
        __C = 0.0;
        vDSP_dotpr((const float *)(v73 + 4 * v35), 1, &v18[v38], 1, &__C, v39);
        __C = __C / (float)(int)v39;
        *(float *)&v40 = __C;
        v41 = normalizeMeanStdUsingTable(v73, v35, v36, v72, 0, (float *)&v82 + 1, (float *)&v82, v40);
        if ((v41 & 0x80000000) != 0)
        {
          v56 = v41;
          ACTLogMessageImp(4, "FastVectorMath error %d @ %s (line %d)");
          return v56;
        }
        v43 = normalizeMeanStdUsingTable((uint64_t)v18, v37 + v35, v37 + v34, v71, 0, (float *)&v81 + 1, (float *)&v81, v42);
        if ((v43 & 0x80000000) != 0)
        {
          v57 = v43;
          ACTLogMessageImp(4, "FastVectorMath error %d @ %s (line %d)");
          return v57;
        }
        if ((float)(*(float *)&v82 * *(float *)&v81) <= 0.0)
        {
          v78 = 0;
          vDSP_vsub((const float *)(v73 + 4 * v35), 1, &v18[v38], 1, __A, 1, v39);
          vDSP_svesq(__A, 1, &v80, v39);
          vDSP_svesq((const float *)(v73 + 4 * v35), 1, (float *)&v78 + 1, v39);
          vDSP_svesq(&v18[v38], 1, (float *)&v78, v39);
          if ((float)(*((float *)&v78 + 1) + *(float *)&v78) <= 0.0)
            v44 = 3.4028e38;
          else
            v44 = v80 / (float)(*((float *)&v78 + 1) + *(float *)&v78);
          v27 = v69;
          v24 = v70;
          v25 = v76;
          v23 = v77;
          v26 = v75;
          v80 = v44;
        }
        else
        {
          v44 = (float)((float)((float)(*(float *)&v82 * *(float *)&v81) - __C)
                      + (float)(*((float *)&v82 + 1) * *((float *)&v81 + 1)))
              / (float)((float)(*(float *)&v82 * *(float *)&v81) + (float)(*(float *)&v82 * *(float *)&v81));
          v80 = v44;
          v27 = v69;
          v24 = v70;
          v25 = v76;
          v23 = v77;
          v26 = v75;
        }
        v45 = v44 + (float)((float)((float)((float)v37 - v22) * v17) * (float)((float)v37 - v22));
        if (v17 <= 0.0)
          v45 = v44;
        if (v45 <= v28)
        {
          if (v45 < v33)
            v33 = v45;
        }
        else
        {
          v28 = v45;
        }
        if (v23 >= 2 && (v29 >= v30 && v45 > v30 || v29 > v30 && v45 >= v30))
        {
          if (v30 >= v32)
          {
            if (v30 >= v66)
            {
              BYTE4(v64) = 1;
            }
            else
            {
              if ((v67 & 1) != 0)
                v31 = v30 - v32;
              v68 |= v67;
              BYTE4(v64) = 1;
              v66 = v30;
            }
          }
          else
          {
            v63 = (float)(int)(v74 - 1 + v23);
            v46 = v32 - v30;
            if ((v64 & 1) == 0)
              v46 = 1.0;
            v47 = v68;
            if ((v67 & 1) != 0)
            {
              v31 = v46;
              v47 = v64;
            }
            v68 = v47;
            v48 = 1.0 - v44;
            v49 = v65;
            if (v48 <= v65)
              v48 = v65;
            if ((v67 & 2) != 0)
              v49 = v48;
            v65 = v49;
            v66 = v32;
            BYTE4(v64) = 1;
            LODWORD(v64) = 1;
            v32 = v30;
          }
        }
        v29 = v30;
        v30 = v45;
      }
      ++v23;
      --v25;
      --v26;
    }
    while (v27 + v23);
    v50 = v67;
    if ((v67 & 1) != 0 && (v68 & 1) != 0)
      v31 = v31 / (float)(v28 - v33);
    v51 = v65;
    *v61 = v63;
    v52 = 0.0;
    if ((v64 & 0x100000000) == 0)
    {
      v12 = 1;
      v31 = 0.0;
      v51 = 0.0;
      v53 = 0.0;
LABEL_78:
      v59 = 0.0;
      if ((v67 & 1) != 0)
      {
        v52 = logf(v31 + 0.000001) + 0.0;
        v59 = 1.0;
      }
      if ((v67 & 2) != 0)
      {
        v52 = logf(v51 + 0.000001) + v52;
        v59 = v59 + 1.0;
      }
      if ((v67 & 4) != 0)
      {
        v52 = logf(v53 + 0.000001) + v52;
        v59 = v59 + 1.0;
      }
      *v62 = expf(v52 / v59);
      return v12;
    }
    v53 = 0.0;
    if ((v67 & 4) == 0)
    {
      if ((v50 & 2) == 0)
        goto LABEL_77;
LABEL_64:
      if (v65 < 0.0)
        v51 = 0.0;
      if (v51 > 1.0)
      {
        v12 = 0;
        v51 = 1.0;
      }
      else
      {
LABEL_77:
        v12 = 0;
      }
      goto LABEL_78;
    }
    HIDWORD(v78) = 0;
    __C = 0.0;
    v54 = signatureLineRegressionQuality();
    if ((v54 & 0x80000000) != 0)
    {
      v57 = v54;
      ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)");
      return v57;
    }
    v55 = signatureLineRegressionQuality();
    if ((v55 & 0x80000000) == 0)
    {
      if (__C >= *((float *)&v78 + 1))
        v53 = *((float *)&v78 + 1);
      else
        v53 = __C;
      v50 = v67;
      goto LABEL_64;
    }
    v12 = v55;
    v58 = 879;
LABEL_76:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v12, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v58);
    return v12;
  }
  v56 = v20;
  ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)");
  return v56;
}

uint64_t ABRegRegisterSlices(uint64_t a1, int a2, int a3, uint64_t a4, float *a5, float *a6, _DWORD *a7, _DWORD *a8)
{
  int v15;
  int v16;
  float v17;
  int v18;
  int v19;
  signed int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  int v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  int v52;
  signed int v53;
  int v54;
  unsigned int v55;
  int v56;
  signed int v57;

  if (!a4)
  {
    v37 = 4294967293;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1018);
    return v37;
  }
  v57 = 0;
  v15 = *(_DWORD *)a4;
  v16 = *(_DWORD *)(a4 + 4);
  v55 = 0;
  v56 = v15 - 1;
  v53 = 0;
  v54 = v16 - 1;
  v51 = 0;
  v52 = v15 - 1;
  v50 = v16 - 1;
  v49 = 0;
  v17 = *a6;
  if (fabsf(*a6) > (float)v16)
    v17 = 0.0;
  sub_22761C8A0((uint64_t)&v57, (uint64_t)&v56, (uint64_t)&v55, (uint64_t)&v54, (uint64_t)&v53, (uint64_t)&v52, (uint64_t)&v51, (uint64_t)&v50, *a5, v17, 1, (uint64_t)&v49 + 4, (uint64_t)&v49);
  v47 = 0;
  v48 = 0;
  v18 = sub_22761C978(a3, v15, v16, (_DWORD *)&v48 + 1, &v48, (_DWORD *)&v47 + 1, &v47);
  if (v18 < 0)
  {
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v18, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1101);
    return 0xFFFFFFFFLL;
  }
  if ((a2 & 0xFFFFFFFD) != 1)
    goto LABEL_12;
  *a7 = 0;
  v19 = v56;
  v20 = v57;
  v21 = projectionRowsFromIntegralImage(0, *(_QWORD *)(a4 + 16), v57, v56, v55, v54, *(void **)(a4 + 40));
  if ((v21 & 0x80000000) != 0)
  {
    v38 = v21;
    v39 = 1118;
LABEL_24:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v38, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v39);
    return v38;
  }
  v22 = projectionRowsFromIntegralImage(1, *(_QWORD *)(a4 + 16), v53, v52, v51, v50, *(void **)(a4 + 48));
  if ((v22 & 0x80000000) != 0)
  {
    v38 = v22;
    v39 = 1121;
    goto LABEL_24;
  }
  v23 = v19 - v20;
  v24 = v19 - v20 + 1;
  v25 = signatureDerivative(*(const float **)(a4 + 40), v23 + 1, *(float **)(a4 + 72));
  if ((v25 & 0x80000000) != 0)
  {
    v42 = v25;
    v43 = 1124;
LABEL_29:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v42, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v43);
    return v42;
  }
  v26 = signatureDerivative(*(const float **)(a4 + 48), v24, *(float **)(a4 + 80));
  if ((v26 & 0x80000000) != 0)
  {
    v42 = v26;
    v43 = 1125;
    goto LABEL_29;
  }
  v27 = ABRegComputeShift();
  if ((v27 & 0x80000000) != 0)
  {
    v40 = v27;
    v41 = 1131;
    goto LABEL_32;
  }
  *a5 = *((float *)&v49 + 1) + 0.0;
LABEL_12:
  if ((a2 & 0xFFFFFFFE) != 2)
    return 0;
  *a8 = 0;
  v28 = v54;
  v29 = v55;
  v30 = projectionColsFromIntegralImage(0, *(signed int **)(a4 + 16), v57, v56, v55, v54, *(_QWORD *)(a4 + 24));
  if ((v30 & 0x80000000) != 0)
  {
    v40 = v30;
    v41 = 1149;
LABEL_32:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v40, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v41);
    return v40;
  }
  v31 = projectionColsFromIntegralImage(1, *(signed int **)(a4 + 16), v53, v52, v51, v50, *(_QWORD *)(a4 + 32));
  if ((v31 & 0x80000000) != 0)
  {
    v40 = v31;
    v41 = 1152;
    goto LABEL_32;
  }
  v32 = v28 - v29;
  v33 = v28 - v29 + 1;
  v34 = signatureDerivative(*(const float **)(a4 + 24), v32 + 1, *(float **)(a4 + 56));
  if ((v34 & 0x80000000) != 0)
  {
    v44 = v34;
    v45 = 1155;
LABEL_34:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v44, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v45);
    return v44;
  }
  v35 = signatureDerivative(*(const float **)(a4 + 32), v33, *(float **)(a4 + 64));
  if ((v35 & 0x80000000) != 0)
  {
    v44 = v35;
    v45 = 1156;
    goto LABEL_34;
  }
  v36 = ABRegComputeShift();
  if ((v36 & 0x80000000) != 0)
  {
    v37 = v36;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v36, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1162);
  }
  else
  {
    v37 = 0;
    *a6 = *(float *)&v49 + 0.0;
  }
  return v37;
}

uint64_t sub_22761C8A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, float a10, int a11, uint64_t a12, uint64_t a13)
{
  uint64_t v13;
  int v14;
  int v15;
  float v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;

  if (a11 >= 1)
  {
    v13 = 0;
    v14 = (int)a9;
    v15 = (int)a10;
    v16 = (float)(int)a9;
    do
    {
      v17 = *(_DWORD *)(a5 + v13) - v14;
      v18 = *(_DWORD *)(a6 + v13) - v14;
      v19 = *(_DWORD *)(a7 + v13) - v15;
      v20 = *(_DWORD *)(a8 + v13) - v15;
      if (*(_DWORD *)(result + v13) > v17)
        v17 = *(_DWORD *)(result + v13);
      *(_DWORD *)(result + v13) = v17;
      v21 = *(_DWORD *)(a2 + v13);
      if (v21 >= v18)
        v21 = v18;
      *(_DWORD *)(a2 + v13) = v21;
      v22 = *(_DWORD *)(a3 + v13);
      if (v22 <= v19)
        v22 = v19;
      *(_DWORD *)(a3 + v13) = v22;
      v23 = *(_DWORD *)(a4 + v13);
      if (v23 >= v20)
        v23 = v20;
      *(_DWORD *)(a4 + v13) = v23;
      *(_DWORD *)(a5 + v13) = *(_DWORD *)(result + v13) + v14;
      *(_DWORD *)(a6 + v13) = *(_DWORD *)(a2 + v13) + v14;
      *(_DWORD *)(a7 + v13) = *(_DWORD *)(a3 + v13) + v15;
      *(_DWORD *)(a8 + v13) = *(_DWORD *)(a4 + v13) + v15;
      *(float *)(a12 + v13) = v16;
      *(float *)(a13 + v13) = (float)v15;
      v13 += 4;
    }
    while (4 * a11 != v13);
  }
  return result;
}

uint64_t sub_22761C978(int a1, int a2, int a3, _DWORD *a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  float v7;
  float v8;
  float v9;
  uint64_t result;

  v7 = (float)a2 * 0.016;
  *a4 = -vcvtms_s32_f32(v7);
  *a5 = vcvtps_s32_f32(v7);
  if (a1 == 2)
  {
    v8 = (float)a3;
    *a6 = -vcvtms_s32_f32((float)a3 * 0.75);
    v9 = 0.28;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v8 = (float)a3;
    *a6 = -vcvtms_s32_f32((float)a3 * 0.28);
    v9 = 0.75;
LABEL_5:
    result = 0;
    *a7 = vcvtps_s32_f32(v8 * v9);
    return result;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ABRegRegisterSlicesRobust(int a1, float a2, uint64_t a3, int a4, uint64_t a5, float *a6, float *a7, _DWORD *a8, float *a9)
{
  float *v10;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  float *v33;
  float *v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  float v45;
  float v46;
  float v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  float *v52;
  float *v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  float v57;
  signed int v58;
  float v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  float v63;
  float v64;
  float v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  float *v69;
  uint64_t v70;
  int v71;
  int v72;
  _BYTE v73[40];
  _BYTE v74[40];
  _BYTE v75[40];
  _BYTE v76[40];
  _BYTE v77[40];
  _BYTE v78[40];
  _BYTE v79[40];
  _BYTE v80[40];
  _DWORD v81[10];
  _DWORD v82[10];
  _DWORD v83[10];
  _DWORD v84[10];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  if (!a5)
  {
    v41 = 4294967293;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1181);
    return v41;
  }
  v10 = a7;
  *a8 = 0;
  *a9 = 0.0;
  v16 = ABRegRegisterSlices(2, 1, a4, a5, a6, a7, a8, a9);
  if ((v16 & 0x80000000) != 0)
  {
    v42 = v16;
    v43 = 1190;
LABEL_25:
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v42, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v43);
    return v42;
  }
  v17 = blockyfyGeometry(*(_DWORD *)a5, *(_DWORD *)(a5 + 4), a1, 2, 1, 0, v84, v83, a2, 0.0, v82, v81);
  if ((v17 & 0x80000000) != 0)
  {
    v42 = v17;
    v43 = 1217;
    goto LABEL_25;
  }
  __memcpy_chk();
  __memcpy_chk();
  __memcpy_chk();
  __memcpy_chk();
  v18 = *a6;
  v19 = *v10;
  v20 = *(_DWORD *)(a5 + 4);
  if (fabsf(*v10) > (float)v20)
    v19 = 0.0;
  sub_22761C8A0((uint64_t)v84, (uint64_t)v83, (uint64_t)v82, (uint64_t)v81, (uint64_t)v80, (uint64_t)v79, (uint64_t)v78, (uint64_t)v77, v18, v19, a1, (uint64_t)v76, (uint64_t)v75);
  v70 = 0;
  if ((sub_22761C978(a4, *(_DWORD *)a5, v20, &v72, &v71, (_DWORD *)&v70 + 1, &v70) & 0x80000000) != 0)
  {
    v41 = 0xFFFFFFFFLL;
    ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1261);
    return v41;
  }
  if (a1 < 1)
  {
    v37 = 0.0;
    v36 = 3.4028e38;
    v35 = -3.4028e38;
    v32 = 0.0;
    goto LABEL_29;
  }
  v69 = v10;
  v21 = 0;
  v22 = a1;
  do
  {
    v23 = v81[v21];
    v24 = v82[v21];
    v25 = projectionColsFromIntegralImage(0, *(signed int **)(a5 + 16), v84[v21], v83[v21], v24, v23, *(_QWORD *)(a5 + 24));
    if ((v25 & 0x80000000) != 0)
    {
      v42 = v25;
      v43 = 1275;
      goto LABEL_25;
    }
    v26 = projectionColsFromIntegralImage(1, *(signed int **)(a5 + 16), *(_DWORD *)&v80[v21 * 4], *(_DWORD *)&v79[v21 * 4], *(_DWORD *)&v78[v21 * 4], *(_DWORD *)&v77[v21 * 4], *(_QWORD *)(a5 + 32));
    if ((v26 & 0x80000000) != 0)
    {
      v42 = v26;
      v43 = 1278;
      goto LABEL_25;
    }
    v27 = v23 - v24;
    v28 = v23 - v24 + 1;
    v29 = signatureDerivative(*(const float **)(a5 + 24), v27 + 1, *(float **)(a5 + 56));
    if ((v29 & 0x80000000) != 0)
    {
      v66 = v29;
      v67 = 1281;
LABEL_51:
      ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v66, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", v67);
      return v66;
    }
    v30 = signatureDerivative(*(const float **)(a5 + 32), v28, *(float **)(a5 + 64));
    if ((v30 & 0x80000000) != 0)
    {
      v66 = v30;
      v67 = 1282;
      goto LABEL_51;
    }
    v31 = ABRegComputeShift();
    if ((v31 & 0x80000000) != 0)
    {
      v68 = v31;
      ACTLogMessageImp(4, "ABReg error %d @ %s (line %d)", v31, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ABReg.c", 1288);
      return v68;
    }
    *(float *)&v74[v21 * 4] = *(float *)&v75[v21 * 4] + 0.0;
    ++v21;
  }
  while (a1 != v21);
  v32 = 0.0;
  v33 = (float *)v73;
  v34 = (float *)v74;
  v35 = -3.4028e38;
  v36 = 3.4028e38;
  v37 = 0.0;
  v10 = v69;
  do
  {
    v38 = *v34++;
    v39 = v38;
    if (v36 > v38)
      v36 = v39;
    if (v35 < v39)
      v35 = v39;
    v40 = *v33++;
    v37 = v37 + v40;
    v32 = v32 + v39;
    --v22;
  }
  while (v22);
LABEL_29:
  if (isZero(v37))
    return 0;
  if ((float)(v35 - v36) >= 0.000001)
  {
    v48 = vcvtms_s32_f32((float)(v35 - v36) * 0.125);
    if (v48 <= 1)
      v49 = 1;
    else
      v49 = v48;
    bzero(*(void **)(a5 + 152), 4 * v49);
    bzero(*(void **)(a5 + 168), 4 * v49);
    bzero(*(void **)(a5 + 160), 4 * v49);
    if (a1 >= 1)
    {
      v50 = *(_QWORD *)(a5 + 152);
      v51 = *(_QWORD *)(a5 + 160);
      v52 = (float *)v73;
      v53 = (float *)v74;
      v54 = a1;
      v55 = *(_QWORD *)(a5 + 168);
      do
      {
        v56 = *v53++;
        v57 = v56;
        v58 = vcvtms_s32_f32((float)(v56 - v36) * 0.125);
        v59 = *v52++;
        v60 = v59;
        if (v49 == v58)
          v58 = v49 - 1;
        *(float *)(v50 + 4 * v58) = v60 + *(float *)(v50 + 4 * v58);
        *(float *)(v51 + 4 * v58) = *(float *)(v51 + 4 * v58) + 1.0;
        *(float *)(v55 + 4 * v58) = *(float *)(v55 + 4 * v58) + (float)(v57 * v60);
        --v54;
      }
      while (v54);
    }
    if (v49 < 1)
    {
      v65 = 0.0;
      v64 = 0.0;
      v63 = 0.0;
    }
    else
    {
      v61 = 0;
      v63 = 0.0;
      v64 = 0.0;
      v65 = 0.0;
      do
      {
        v62 = *(_QWORD *)(a5 + 152);
        if (*(float *)(v62 + v61) > v65)
        {
          v64 = *(float *)(*(_QWORD *)(a5 + 160) + v61);
          v63 = *(float *)(*(_QWORD *)(a5 + 168) + v61);
          v65 = *(float *)(v62 + v61);
        }
        v61 += 4;
      }
      while (4 * v49 != v61);
    }
    *v10 = v63 / v65;
    v47 = v65 / v64;
  }
  else
  {
    v45 = 1.0 / (float)a1;
    v46 = v45 * v32;
    v47 = v45 * v37;
    *v10 = v46;
  }
  v41 = 0;
  *a9 = v47;
  return v41;
}

uint64_t TUGetTiming(int *a1, uint64_t a2)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  int *v6;
  uint64_t result;

  if (*a1 < 16)
  {
    mach_absolute_time();
    result = FigHostTimeToNanoseconds();
    v5 = *a1;
    v6 = &a1[2 * v5];
    *((_QWORD *)v6 + 17) = result / 1000;
    *((_QWORD *)v6 + 1) = a2;
    *a1 = v5 + 1;
  }
  else
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

uint64_t TUPrintTiming(int *a1)
{
  NSObject *v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t result;

  if (*a1 <= 0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  else
  {
    v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    if (*a1 >= 2)
    {
      v4 = 0;
      do
      {
        v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v6 = v4 + 2;
        ++v4;
      }
      while (v6 < *a1);
    }
    v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    result = fig_log_call_emit_and_clean_up_after_send_and_compose();
    *((_QWORD *)a1 + 32) = 0;
    *((_OWORD *)a1 + 14) = 0u;
    *((_OWORD *)a1 + 15) = 0u;
    *((_OWORD *)a1 + 12) = 0u;
    *((_OWORD *)a1 + 13) = 0u;
    *((_OWORD *)a1 + 10) = 0u;
    *((_OWORD *)a1 + 11) = 0u;
    *((_OWORD *)a1 + 8) = 0u;
    *((_OWORD *)a1 + 9) = 0u;
    *((_OWORD *)a1 + 6) = 0u;
    *((_OWORD *)a1 + 7) = 0u;
    *((_OWORD *)a1 + 4) = 0u;
    *((_OWORD *)a1 + 5) = 0u;
    *((_OWORD *)a1 + 2) = 0u;
    *((_OWORD *)a1 + 3) = 0u;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
  }
  return result;
}

float32x2_t fastRecSqrtf(double a1)
{
  float32x2_t v1;
  int8x8_t v2;
  int8x8_t v3;
  float32x2_t v4;
  int8x8_t v5;

  v1 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0);
  v2 = (int8x8_t)vceqz_f32(v1);
  v3 = (int8x8_t)vcgt_s32((int32x2_t)v1, vdup_n_s32(0x7F7FFFFFu));
  v4 = vrsqrte_f32(v1);
  v5 = vorr_s8(v3, v2);
  __asm { FMOV            V3.2S, #1.0 }
  return vmul_f32(v4, (float32x2_t)vbsl_s8(v5, _D3, (int8x8_t)vrsqrts_f32(vmul_n_f32(v4, *(float *)&a1), v4)));
}

float32x2_t fastSqrtf(double a1)
{
  float32x2_t v1;
  int8x8_t v2;
  int8x8_t v3;
  float32x2_t v4;
  int8x8_t v5;

  *(float *)&a1 = *(float *)&a1 + 0.0;
  v1 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0);
  v2 = (int8x8_t)vceqz_f32(v1);
  v3 = (int8x8_t)vcgt_s32((int32x2_t)v1, vdup_n_s32(0x7F7FFFFFu));
  v4 = vrsqrte_f32(v1);
  v5 = vorr_s8(v3, v2);
  __asm { FMOV            V3.2S, #1.0 }
  return vmul_f32(*(float32x2_t *)&a1, (float32x2_t)vbsl_s8(v5, _D3, (int8x8_t)vmul_f32(v4, vrsqrts_f32(v4, vmul_n_f32(v4, *(float *)&a1)))));
}

BOOL isZero(float a1)
{
  return (LODWORD(a1) & 0x7FFFFFFF) == 0;
}

uint64_t FastRegistration_computeSignatures(uint64_t a1, int a2, NSObject *a3, uint64_t a4)
{
  int v8;
  int v9;
  uint64_t v10;
  _BOOL4 v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v16;
  char *StatusDescription;
  int v19;
  char *v20;
  char *v21;
  char *v22;
  _QWORD v23[7];
  _BOOL4 v24;
  char v25;
  _QWORD block[7];
  _BOOL4 v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;

  v8 = Projections_projectionRowsCols_planar8UtoF();
  v9 = v8;
  if (v8 < 0)
  {
    StatusDescription = Projections_getStatusDescription(v8);
    v19 = 46;
    goto LABEL_24;
  }
  v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a4 + 40) = v10;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(a4 + 24) && *(_QWORD *)(a4 + 16) && *(_QWORD *)(a4 + 56))
  {
    v11 = *(_QWORD *)(a4 + 48) != 0;
    if (!a3)
      goto LABEL_6;
LABEL_14:
    v41 = 0;
    v42 = &v41;
    v43 = 0x2000000000;
    v44 = 0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2000000000;
    v40 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2000000000;
    v36 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x2000000000;
    v32 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_22761D974;
    block[3] = &unk_24EFC2958;
    v28 = a2;
    block[5] = &v33;
    block[6] = a4;
    v27 = v11;
    block[4] = &v41;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 0x40000000;
    v23[2] = sub_22761DB18;
    v23[3] = &unk_24EFC2980;
    v25 = a2;
    v23[5] = &v29;
    v23[6] = a4;
    v24 = v11;
    v23[4] = &v37;
    dispatch_async(a3, block);
    dispatch_async(a3, v23);
    dispatch_barrier_sync(a3, &unk_24EFC29C0);
    v16 = *((_DWORD *)v42 + 6);
    if (!v16)
    {
      v16 = *((_DWORD *)v38 + 6);
      if (!v16)
      {
        if (*((_DWORD *)v30 + 6) | *((_DWORD *)v34 + 6))
          v16 = -7;
        else
          v16 = 0;
      }
    }
    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v41, 8);
    goto LABEL_20;
  }
  v11 = 0;
  if (a3)
    goto LABEL_14;
LABEL_6:
  if (!a2)
  {
LABEL_9:
    if (!v11)
    {
LABEL_12:
      v16 = 0;
      goto LABEL_20;
    }
    v14 = Projections_computeMeanStdTable(*(float **)(a4 + 32), *(_DWORD *)(a4 + 40), (_QWORD *)(a4 + 48));
    if ((v14 & 0x80000000) == 0)
    {
      v15 = Projections_computeMeanStdTable(*(float **)a4, *(_DWORD *)(a4 + 8), (_QWORD *)(a4 + 16));
      v9 = v15;
      if ((v15 & 0x80000000) == 0)
        goto LABEL_12;
      v22 = Projections_getStatusDescription(v15);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v9, v22, "FastRegistration_status FastRegistration_computeSignatures(const vImage_Buffer *, _Bool, dispatch_queue_t, FastRegistration_Signatures *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 111);
      return 4294967289;
    }
    v9 = v14;
    StatusDescription = Projections_getStatusDescription(v14);
    v19 = 110;
LABEL_24:
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v9, StatusDescription, "FastRegistration_status FastRegistration_computeSignatures(const vImage_Buffer *, _Bool, dispatch_queue_t, FastRegistration_Signatures *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", v19);
    return 4294967289;
  }
  v12 = sub_22761D9E8(*(_QWORD *)(a4 + 32), v10);
  if (v12 < 0)
  {
    v16 = v12;
    v20 = FastRegistration_getStatusDescription(v12);
    syslog(3, "FastRegistration error %d:%s in %s @ %s:%d\n", v16, v20, "FastRegistration_status FastRegistration_computeSignatures(const vImage_Buffer *, _Bool, dispatch_queue_t, FastRegistration_Signatures *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 106);
  }
  else
  {
    v13 = sub_22761D9E8(*(_QWORD *)a4, *(_QWORD *)(a4 + 8));
    if ((v13 & 0x80000000) == 0)
      goto LABEL_9;
    v16 = v13;
    v21 = FastRegistration_getStatusDescription(v13);
    syslog(3, "FastRegistration error %d:%s in %s @ %s:%d\n", v16, v21, "FastRegistration_status FastRegistration_computeSignatures(const vImage_Buffer *, _Bool, dispatch_queue_t, FastRegistration_Signatures *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 107);
  }
LABEL_20:
  if (v9)
    return 4294967289;
  else
    return v16;
}

uint64_t sub_22761D974(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 60))
  {
    result = sub_22761D9E8(*(_QWORD *)(*(_QWORD *)(result + 48) + 32), *(_QWORD *)(*(_QWORD *)(result + 48) + 40));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
  {
    if (*(_DWORD *)(v1 + 56))
    {
      result = Projections_computeMeanStdTable(*(float **)(*(_QWORD *)(v1 + 48) + 32), *(_DWORD *)(*(_QWORD *)(v1 + 48) + 40), (_QWORD *)(*(_QWORD *)(v1 + 48) + 48));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t sub_22761D9E8(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  float *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v11;
  char *StatusDescription;
  char *v13;
  va_list __B;

  va_start(__B, a2);
  v2 = MEMORY[0x24BDAC7A8]();
  v4 = v3;
  v5 = (float *)v2;
  STACK[0x3348] = *MEMORY[0x24BDAC8D0];
  if ((int)(float)((float)v3 * 0.03) <= 3)
    v6 = 3;
  else
    v6 = (int)(float)((float)v3 * 0.03);
  v7 = Projections_smoothProjection(v2, v3, v6, (uint64_t)__B);
  if (v7 < 0)
  {
    v11 = v7;
    StatusDescription = Projections_getStatusDescription(v7);
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v11, StatusDescription, "FastRegistration_status FastRegistration_processProjections(float *, vImagePixelCount)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 26);
    return 4294967289;
  }
  v8 = Projections_computeProjectionDerivative((const float *)__B, v4, v5);
  v9 = v8;
  if (v8 < 0)
  {
    v13 = Projections_getStatusDescription(v8);
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v9, v13, "FastRegistration_status FastRegistration_processProjections(float *, vImagePixelCount)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 27);
    return 4294967289;
  }
  if (v8)
    return 4294967289;
  else
    return 0;
}

uint64_t sub_22761DB18(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 60))
  {
    result = sub_22761D9E8(**(_QWORD **)(result + 48), *(_QWORD *)(*(_QWORD *)(result + 48) + 8));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24) = result;
  }
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 32) + 8) + 24))
  {
    if (*(_DWORD *)(v1 + 56))
    {
      result = Projections_computeMeanStdTable(**(float ***)(v1 + 48), *(_DWORD *)(*(_QWORD *)(v1 + 48) + 8), (_QWORD *)(*(_QWORD *)(v1 + 48) + 16));
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t FastRegistration_register(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15, double a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,int a22,uint64_t block,uint64_t a24,uint64_t (*a25)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9),void *a26,uint64_t *a27,_QWORD *a28,uint64_t a29,float *a30,float *a31,int a32,uint64_t a33,uint64_t *a34,uint64_t a35,int a36,uint64_t a37,uint64_t *a38,uint64_t a39,int a40,int a41,float a42)
{
  _QWORD *v42;
  NSObject *v43;
  float *v44;
  float *v45;
  float v46;
  float *v47;
  float *v48;
  float *v49;
  float *v50;
  float *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  int v58;
  unint64_t v59;
  int v60;
  NSObject *v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t v66;
  char *v68;
  char *StatusDescription;
  _QWORD var10[4];

  v42 = (_QWORD *)MEMORY[0x24BDAC7A8]();
  v48 = v47;
  v50 = v49;
  v51 = v44;
  v53 = v52;
  v54 = v42;
  STACK[0xCD38] = *MEMORY[0x24BDAC8D0];
  v55 = v42[5];
  v56 = *(_QWORD *)(v53 + 40);
  if (v55 >= v56)
    v57 = *(_QWORD *)(v53 + 40);
  else
    v57 = v42[5];
  v58 = (int)(float)((float)v57 * v46);
  v59 = v42[1];
  if (v59 >= *(_QWORD *)(v53 + 8))
    v59 = *(_QWORD *)(v53 + 8);
  v60 = (int)(float)((float)v59 * v46);
  a37 = 0;
  a38 = &a37;
  a39 = 0x2000000000;
  a40 = 0;
  a33 = 0;
  a34 = &a33;
  a35 = 0x2000000000;
  a36 = 0;
  if (v43)
  {
    v61 = v43;
    block = MEMORY[0x24BDAC760];
    a24 = 0x40000000;
    a25 = sub_22761DE6C;
    a26 = &unk_24EFC29E8;
    a27 = &a37;
    a28 = v42;
    a32 = v58;
    a29 = v53;
    a30 = v44;
    a31 = v45;
    var10[0] = MEMORY[0x24BDAC760];
    var10[1] = 0x40000000;
    var10[2] = sub_22761DF20;
    var10[3] = &unk_24EFC2A10;
    dispatch_async(v43, &block);
    dispatch_async(v61, var10);
    dispatch_barrier_sync(v61, &unk_24EFC2A50);
  }
  else
  {
    v62 = Projections_computeShiftBruteForce(v42[4], v55, v42 + 6, *(_QWORD *)(v53 + 32), v56, (_QWORD *)(v53 + 48), v58, (float *)&STACK[0x6720], 0.0, &a42, v44, v45);
    *((_DWORD *)a38 + 6) = v62;
    if (v62 < 0)
    {
      v65 = v62;
      StatusDescription = Projections_getStatusDescription(v62);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v65, StatusDescription, "FastRegistration_status FastRegistration_register(const FastRegistration_Signatures *, const FastRegistration_Signatures *, float, dispatch_queue_t, float *, float *, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 186);
      goto LABEL_13;
    }
    v63 = Projections_computeShiftBruteForce(*v54, *((_DWORD *)v54 + 2), v54 + 2, *(_QWORD *)v53, *(_DWORD *)(v53 + 8), (_QWORD *)(v53 + 16), v60, (float *)&STACK[0x6720], 0.0, &a42, v50, v48);
    *((_DWORD *)a34 + 6) = v63;
    if (v63 < 0)
    {
      v64 = v63;
      v68 = Projections_getStatusDescription(v63);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v64, v68, "FastRegistration_status FastRegistration_register(const FastRegistration_Signatures *, const FastRegistration_Signatures *, float, dispatch_queue_t, float *, float *, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/FastRegistration_Core.c", 196);
      goto LABEL_13;
    }
  }
  *v51 = -*v51;
  *v50 = -*v50;
LABEL_13:
  if (*((_DWORD *)a38 + 6) || *((_DWORD *)a34 + 6))
    v66 = 4294967289;
  else
    v66 = 0;
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  return v66;
}

uint64_t sub_22761DE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t result;

  STACK[0x19878] = *MEMORY[0x24BDAC8D0];
  result = Projections_computeShiftBruteForce(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 40), (_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 32), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 40), (_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_DWORD *)(a1 + 72), (float *)&STACK[0x13260], 0.0, (float *)&a9, *(float **)(a1 + 56), *(float **)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t sub_22761DF20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t result;

  STACK[0x19878] = *MEMORY[0x24BDAC8D0];
  result = Projections_computeShiftBruteForce(**(_QWORD **)(a1 + 40), *(_DWORD *)(*(_QWORD *)(a1 + 40) + 8), (_QWORD *)(*(_QWORD *)(a1 + 40) + 16), **(_QWORD **)(a1 + 48), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 8), (_QWORD *)(*(_QWORD *)(a1 + 48) + 16), *(_DWORD *)(a1 + 72), (float *)&STACK[0x13260], 0.0, (float *)&a9, *(float **)(a1 + 56), *(float **)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t FastRegistration_compareSignatures@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, float *a3@<X2>, vDSP_Length *a4@<X3>, float *a5@<X4>, vDSP_Length *a6@<X5>, uint64_t a7@<X8>, float a8@<S0>, float a9@<S1>)
{
  uint64_t v14;

  sub_22761E048(a1[4], a1[5], a2[4], a2[5], a3, a4, a7, a8);
  sub_22761E048(*a1, a1[1], *a2, a2[1], a5, a6, v14, a9);
  return 0;
}

void sub_22761E048(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X2>, int a4@<W3>, float *a5@<X4>, vDSP_Length *a6@<X5>, uint64_t a7@<X8>, float a8@<S0>)
{
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  BOOL v15;
  vDSP_Length v16;

  LODWORD(a7) = vcvtms_s32_f32(a8 + 0.5);
  v10 = -(int)a7;
  v11 = ~(_DWORD)a7 + a2;
  if (v11 >= a4)
    v11 = a4 - 1;
  v12 = v11 + a7;
  v13 = a7 + a4;
  if ((int)a7 + a4 >= a2)
    v13 = a2;
  v14 = v13 + ~(_DWORD)a7;
  v15 = (int)a7 >= 0;
  if ((int)a7 >= 0)
    v10 = 0;
  else
    a7 = 0;
  if (!v15)
    v14 = v12;
  v16 = v14 + 1;
  vDSP_vsub((const float *)(a1 + 4 * a7), 1, (const float *)(a3 + 4 * v10), 1, a5, 1, v16);
  vDSP_vabs(a5, 1, a5, 1, v16);
  *a6 = v16;
}

char *allocateSignatureBuffers(uint64_t a1, uint64_t a2, int a3)
{
  char *result;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;

  result = 0;
  if (a1 && a2)
  {
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    v7 = *(_QWORD *)(a2 + 8);
    v6 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 40) = v6;
    *(_QWORD *)(a1 + 8) = v7;
    LODWORD(v6) = 4 * v6;
    v8 = (v6 + 31) & 0xFFFFFFE0;
    LODWORD(v7) = 4 * v7;
    v9 = (v7 + 31) & 0xFFFFFFE0;
    v10 = (v6 + 35) & 0xFFFFFFE0;
    v11 = (v7 + 35) & 0xFFFFFFE0;
    v12 = 2 * (v11 + v10);
    if (!a3)
      v12 = 0;
    result = (char *)malloc_type_calloc(1uLL, v9 + v8 + v12, 0xA71E0F4DuLL);
    if (result)
    {
      *(_QWORD *)(a1 + 32) = result;
      v13 = &result[v8];
      *(_QWORD *)a1 = v13;
      if (a3)
      {
        v14 = &v13[v9];
        v15 = &v14[v11];
        *(_QWORD *)(a1 + 16) = v14;
        *(_QWORD *)(a1 + 24) = v15;
        v16 = &v15[v11];
        *(_QWORD *)(a1 + 48) = v16;
        *(_QWORD *)(a1 + 56) = &v16[v10];
      }
    }
  }
  return result;
}

uint64_t normalizeMinMax(uint64_t a1, int a2, int a3, uint64_t a4)
{
  const void *v6;
  int v7;
  int v9;
  float v10;
  float v11;
  float *v12;
  float v13;
  float *v14;
  int v15;
  float *v16;
  float v17;

  v6 = (const void *)(a1 + 4 * a2);
  v7 = a3 - a2;
  if (a3 < a2)
  {
    if (!isZero(-INFINITY))
      return 0;
    goto LABEL_11;
  }
  v9 = v7 + 1;
  v10 = 3.4028e38;
  v11 = -3.4028e38;
  v12 = (float *)(a1 + 4 * a2);
  do
  {
    if (*v12 >= v10)
    {
      if (*v12 > v11)
        v11 = *v12;
    }
    else
    {
      v10 = *v12;
    }
    ++v12;
    --v9;
  }
  while (v9);
  v13 = v11 - v10;
  if (isZero(v11 - v10))
  {
LABEL_11:
    memcpy((void *)(a4 + 4 * a2), v6, 4 * (v7 + 1));
    return 0;
  }
  v14 = (float *)(a1 + 4 * a2);
  v15 = v7 + 1;
  v16 = (float *)(a4 + 4 * a2);
  do
  {
    v17 = *v14++;
    *v16++ = (float)(v17 - v10) / v13;
    --v15;
  }
  while (v15);
  return 0;
}

uint64_t normalizeMeanStd(uint64_t a1, int a2, int a3, uint64_t a4, float *a5, float *a6)
{
  int v9;
  uint64_t v10;
  const float *v11;
  float v12;
  float v13;
  double v14;
  float v15;
  float v17;
  float __B;
  uint64_t __SumOfSquares;

  v9 = a3 - a2 + 1;
  __SumOfSquares = 0;
  v10 = a2;
  v11 = (const float *)(a1 + 4 * a2);
  vDSP_sve_svesq(v11, 1, (float *)&__SumOfSquares + 1, (float *)&__SumOfSquares, v9);
  v12 = *(float *)&__SumOfSquares;
  v13 = *((float *)&__SumOfSquares + 1) / (float)v9;
  *a5 = v13;
  *(float *)&v14 = (float)(v12 / (float)v9) - (float)(v13 * v13);
  LODWORD(v15) = fastSqrtf(v14).u32[0];
  *a6 = v15;
  if (isZero(v15))
  {
    memcpy((void *)(a4 + 4 * v10), v11, 4 * v9);
  }
  else
  {
    __B = 1.0 / *a6;
    v17 = -(float)(*a5 * __B);
    vDSP_vsmsa(v11, 1, &__B, &v17, (float *)(a4 + 4 * v10), 1, v9);
  }
  return 0;
}

uint64_t createMeanStdTable(_QWORD *a1, int a2)
{
  size_t v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t result;

  v3 = 4 * (a2 + 1);
  v4 = malloc_type_malloc(v3, 0x100004052888210uLL);
  v5 = malloc_type_malloc(v3, 0x100004052888210uLL);
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (v4)
      free(v4);
    if (v6)
      free(v6);
    *a1 = 0;
    a1[1] = 0;
    return 4294967293;
  }
  else
  {
    result = 0;
    *a1 = v4;
    a1[1] = v6;
  }
  return result;
}

uint64_t initMeanStdTable(float *a1, int a2, uint64_t a3)
{
  _DWORD *v3;
  _DWORD *v4;
  BOOL v5;
  float *v7;
  float *v8;
  uint64_t v9;
  float v10;

  v3 = *(_DWORD **)a3;
  v4 = *(_DWORD **)(a3 + 8);
  if (*(_QWORD *)a3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return 4294967293;
  *v3 = 0;
  *v4 = 0;
  if (a2 >= 1)
  {
    v7 = (float *)(v3 + 1);
    v8 = (float *)(v4 + 1);
    v9 = (a2 + 1) - 1;
    do
    {
      *v7 = *(v7 - 1) + *a1;
      ++v7;
      v10 = *a1++;
      *v8 = *(v8 - 1) + (float)(v10 * v10);
      ++v8;
      --v9;
    }
    while (v9);
  }
  return 0;
}

uint64_t normalizeMeanStdUsingTable(uint64_t a1, int a2, int a3, _QWORD *a4, uint64_t a5, float *a6, float *a7, double a8)
{
  float v13;
  float v14;
  float v15;
  float __C;
  float __B;

  v13 = (float)(a3 - a2 + 1);
  v14 = (float)(*(float *)(a4[1] + 4 * (a3 + 1)) - *(float *)(a4[1] + 4 * a2)) / v13;
  *(float *)&a8 = (float)(*(float *)(*a4 + 4 * (a3 + 1)) - *(float *)(*a4 + 4 * a2)) / v13;
  *a6 = *(float *)&a8;
  *(float *)&a8 = v14 - (float)(*(float *)&a8 * *(float *)&a8);
  LODWORD(v15) = fastSqrtf(a8).u32[0];
  *a7 = v15;
  if (a5)
  {
    if (isZero(v15))
    {
      memcpy((void *)(a5 + 4 * a2), (const void *)(a1 + 4 * a2), vcvts_n_u32_f32(v13, 2uLL));
    }
    else
    {
      __B = 1.0 / *a7;
      __C = -(float)(*a6 * __B);
      vDSP_vsmsa((const float *)(a1 + 4 * a2), 1, &__B, &__C, (float *)(a5 + 4 * a2), 1, (unint64_t)v13);
    }
  }
  return 0;
}

uint64_t destroyMeanStdTable(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
  }
  v3 = *(void **)(a1 + 8);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t smoothSignature(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  float v10;
  float v11;

  v4 = -a3;
  if (-a3 < a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = v4 - a3;
    do
    {
      v9 = v8 + v5;
      if (v8 + (_DWORD)v5 < 0 || v5 >= a2)
      {
        if (v5 < a2)
        {
          v7 = (int)(float)(*(float *)(a1 + 4 * v5) + (float)v7);
          ++v6;
        }
        v11 = (float)v7;
        if (((v4 + v5) & 0x8000000000000000) == 0)
          *(float *)(a4 + 4 * (v5 - a3)) = v11 / (float)v6;
        if ((v9 & 0x80000000) == 0)
        {
          v7 = (int)(float)(v11 - *(float *)(a1 + 4 * v9));
          --v6;
        }
      }
      else
      {
        v10 = (float)(int)(float)(*(float *)(a1 + 4 * v5) + (float)v7);
        *(float *)(a4 - 4 * a3 + 4 * v5) = v10 / (float)(v6 + 1);
        v7 = (int)(float)(v10 - *(float *)(a1 + 4 * v9));
      }
      ++v5;
    }
    while (a3 + a2 != v5);
  }
  return 0;
}

uint64_t signatureDerivative(const float *__B, int a2, float *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  vDSP_Length v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 < 2)
    return 0xFFFFFFFFLL;
  v10 = v3;
  v11 = v4;
  if (a2 == 3)
  {
    result = 0;
    *a3 = __B[1] - *__B;
    a3[1] = -(float)(*__B - (float)(__B[2] * 0.5));
    a3[2] = __B[2] - __B[1];
  }
  else
  {
    v7 = (a2 - 2);
    if (a2 == 2)
    {
      result = 0;
      v8 = __B[1] - *__B;
      *a3 = v8;
      a3[1] = v8;
    }
    else
    {
      *a3 = __B[1] - *__B;
      a3[a2 - 1] = __B[a2 - 1] - __B[v7];
      v9 = 0.5;
      vDSP_vsbsm(__B + 2, 1, __B, 1, &v9, a3 + 1, 1, v7);
      return 0;
    }
  }
  return result;
}

uint64_t signatureLineRegressionQuality()
{
  uint64_t v0;
  int v1;
  float *v2;
  float *v3;
  uint64_t v4;
  float v5;
  int v6;
  const float *v7;
  int v8;
  float v9;
  vDSP_Length v10;
  int v11;
  int v12;
  float v13;
  unint64_t v14;
  float v15;
  double v16;
  float __B;
  float __A;
  float v20;
  uint64_t __SumOfSquares;
  float __C[4096];
  uint64_t v23;

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  v23 = *MEMORY[0x24BDAC8D0];
  __SumOfSquares = 0;
  v20 = 0.0;
  v4 = 1;
  if (v1 >= 2)
  {
    v6 = v1;
    v7 = (const float *)v0;
    v8 = v1 - 1;
    v9 = 1.0 / (float)v1;
    __B = 1.0;
    __A = 0.0;
    v10 = v1;
    vDSP_vramp(&__A, &__B, __C, 1, v1);
    v11 = v8 * v6;
    if (v8 * v6 >= 0)
      v12 = v8 * v6;
    else
      v12 = v11 + 1;
    v13 = v9 * (float)(v12 >> 1);
    v14 = 715827883 * ((2 * v8) | 1) * v11;
    v15 = v9 * (float)(int)(HIDWORD(v14) + (v14 >> 63));
    vDSP_sve_svesq(v7, 1, (float *)&__SumOfSquares + 1, (float *)&__SumOfSquares, v10);
    *(float *)&__SumOfSquares = v9 * *(float *)&__SumOfSquares;
    *((float *)&__SumOfSquares + 1) = v9 * *((float *)&__SumOfSquares + 1);
    vDSP_dotpr(v7, 1, __C, 1, &v20, v10);
    v20 = v9 * v20;
    *(float *)&v16 = (float)(*(float *)&__SumOfSquares
                           - (float)(*((float *)&__SumOfSquares + 1) * *((float *)&__SumOfSquares + 1)))
                   + (float)((float)((float)-(float)(v20 + (float)((float)-v13 * *((float *)&__SumOfSquares + 1)))
                                   / (float)(v15 - (float)(v13 * v13)))
                           * (float)(v20 - (float)(v13 * *((float *)&__SumOfSquares + 1))));
    v4 = 0;
    v5 = fastSqrtf(v16).f32[0] / 300.0;
    if (v5 > 1.0)
      v5 = 1.0;
  }
  else
  {
    v5 = 0.0;
  }
  *v3 = v5;
  return v4;
}

char *createACTNoiseReductionContext(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  const void *v12;
  const __CFDictionary *Value;
  const __CFDictionary *v14;
  const void *v15;
  CFMutableDictionaryRef MutableCopy;
  const char *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  void *v25;
  __CFDictionary *Mutable;
  CFNumberRef v27;
  CFNumberRef v28;
  CFNumberRef v29;
  int v30;
  id v31;
  unsigned int v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  id v39;
  id v41;
  _QWORD v42[4];
  _QWORD valuePtr[5];

  valuePtr[4] = *MEMORY[0x24BDAC8D0];
  v2 = (char *)malloc_type_calloc(0xE0uLL, 1uLL, 0xC31D5988uLL);
  v2[156] = 1;
  updateACTNoiseReductionContext((uint64_t)v2, *(CFDictionaryRef *)a1);
  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(v2 + 148) = v3;
  *((_DWORD *)v2 + 26) = getCFPreferenceNumber(CFSTR("PanoNR_Mode"), CFSTR("com.apple.act"), v3);
  *((_DWORD *)v2 + 27) = getCFPreferenceNumber(CFSTR("PanoNR_Prefilter"), CFSTR("com.apple.act"), 0);
  *((_DWORD *)v2 + 28) = getCFPreferenceNumber(CFSTR("PanoNR_Yfilter"), CFSTR("com.apple.act"), 0);
  *((_DWORD *)v2 + 29) = getCFPreferenceNumber(CFSTR("PanoNR_Cfilter"), CFSTR("com.apple.act"), 0);
  *((_DWORD *)v2 + 30) = getCFPreferenceNumber(CFSTR("PanoNR_Flags"), CFSTR("com.apple.act"), 0);
  *((_DWORD *)v2 + 31) = getCFPreferenceNumber(CFSTR("PanoNR_C_YgainScale"), CFSTR("com.apple.act"), 300);
  *((_DWORD *)v2 + 32) = getCFPreferenceNumber(CFSTR("PanoNR_C_YmaxThreshold"), CFSTR("com.apple.act"), 20);
  *((_DWORD *)v2 + 33) = getCFPreferenceNumber(CFSTR("PanoNR_Y_invSlope"), CFSTR("com.apple.act"), 50);
  v2[136] = 0;
  *((_DWORD *)v2 + 35) = 0;
  *((_DWORD *)v2 + 36) = 0;
  *((_QWORD *)v2 + 21) = 0;
  if ((*((_DWORD *)v2 + 26) - 4) <= 4 && !*((_QWORD *)v2 + 22) && !*((_QWORD *)v2 + 23))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE103F0], v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cameraParameters(v7, v8, v9, v10);
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v12 = (const void *)*((_QWORD *)v2 + 26);
    if (v12)
      CFRelease(v12);
    *((_QWORD *)v2 + 26) = 0;
    if (v11)
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v11, CFSTR("TuningParameters"));
      v14 = Value;
      if (Value)
      {
        v15 = CFDictionaryGetValue(Value, CFSTR("DefaultSensorIDs"));
        *((_QWORD *)v2 + 26) = CFRetain(v15);
      }
      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v14);
      CFRelease(v11);
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    }
    v18 = *((_DWORD *)v2 + 26);
    if ((v18 - 5) < 2)
    {
      Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE10878], MutableCopy);
      LODWORD(valuePtr[0]) = 2;
      v27 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE11868], v27);
      if (v27)
        CFRelease(v27);
      LODWORD(v42[0]) = 1;
      v28 = CFNumberCreate(0, kCFNumberIntType, v42);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE11870], v28);
      if (v28)
        CFRelease(v28);
      CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BE11878], (const void *)*MEMORY[0x24BDBD270]);
      FigSampleBufferProcessorCreateForCustom();
      CFRelease(Mutable);
      goto LABEL_30;
    }
    if ((v18 - 7) >= 2)
    {
      if (v18 == 4)
      {
        LODWORD(valuePtr[0]) = 2;
        v29 = CFNumberCreate(0, kCFNumberIntType, valuePtr);
        CFDictionaryAddValue(MutableCopy, CFSTR("NoiseReductionMethod"), v29);
        CFRelease(v29);
        *((_QWORD *)v2 + 21) = noiseReductionContextCreateWithOptions();
      }
      goto LABEL_30;
    }
    v19 = *MEMORY[0x24BE11870];
    v42[0] = *MEMORY[0x24BE10878];
    v42[1] = v19;
    valuePtr[0] = MutableCopy;
    valuePtr[1] = &unk_24EFCA3B8;
    v20 = *MEMORY[0x24BE11878];
    v42[2] = *MEMORY[0x24BE11868];
    v42[3] = v20;
    valuePtr[2] = &unk_24EFCA3D0;
    valuePtr[3] = &unk_24EFCA3E8;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v17, (uint64_t)valuePtr, (uint64_t)v42, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *((_DWORD *)v2 + 26) - 7;
    if (v24 > 2)
    {
      v25 = 0;
    }
    else
    {
      objc_msgSend_bundleWithPath_(MEMORY[0x24BDD1488], v21, (uint64_t)off_24EFC2A70[v24], v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v41 = 0;
    v30 = objc_msgSend_loadAndReturnError_(v25, v21, (uint64_t)&v41, v22);
    v31 = v41;
    if (v30)
    {
      v32 = *((_DWORD *)v2 + 26) - 7;
      if (v32 <= 2)
        NSClassFromString(&off_24EFC2A88[v32]->isa);
      v33 = (void *)objc_opt_new();
      v36 = v33;
      if (v33 && !objc_msgSend_setupWithOptions_(v33, v34, (uint64_t)v23, v35))
      {
        objc_msgSend_setFusionMode_(v36, v37, 1, v38);
        v39 = v36;
        *((_QWORD *)v2 + 23) = v39;
LABEL_29:

LABEL_30:
        CFRelease(MutableCopy);
        goto LABEL_31;
      }
    }
    else
    {
      v36 = 0;
    }

    v39 = 0;
    goto LABEL_29;
  }
LABEL_31:
  *((_QWORD *)v2 + 24) = 0;
  *((_QWORD *)v2 + 25) = 0;
  return v2;
}

double updateACTNoiseReductionContext(uint64_t a1, CFDictionaryRef theDict)
{
  double result;
  const __CFNumber *Value;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  const void *v9;

  if ((*(_DWORD *)(a1 + 104) - 4) <= 4)
    updateMultiBandNoiseReductionMetadata(*(const __CFDictionary **)(a1 + 200), theDict);
  if (*(_BYTE *)(a1 + 156))
  {
    *(_DWORD *)a1 = 1065353216;
    if (theDict)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ExposureTime"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberFloat32Type, (void *)a1);
      *(_DWORD *)(a1 + 4) = 256;
      v6 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("AGC"));
      if (v6)
        CFNumberGetValue(v6, kCFNumberSInt32Type, (void *)(a1 + 4));
      *(_DWORD *)(a1 + 8) = 256;
      v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("sensorDGain"));
      if (v7)
        CFNumberGetValue(v7, kCFNumberSInt32Type, (void *)(a1 + 8));
      *(_DWORD *)(a1 + 12) = 256;
      v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ispDGain"));
      if (v8)
        CFNumberGetValue(v8, kCFNumberSInt32Type, (void *)(a1 + 12));
      *(_DWORD *)(a1 + 68) = "YUVF";
      v9 = *(const void **)(a1 + 192);
      if (v9)
        CFRelease(v9);
      *(_QWORD *)(a1 + 192) = CFRetain(theDict);
    }
    else
    {
      *(_QWORD *)&result = 0x10000000100;
      *(_QWORD *)(a1 + 4) = 0x10000000100;
      *(_DWORD *)(a1 + 12) = 256;
      *(_DWORD *)(a1 + 68) = "YUVF";
    }
  }
  return result;
}

void setACTNoiseReductionCropRect(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, int a6)
{
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v13 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v14 = *(_DWORD *)(a1 + 104);
  if (v14 == 3 || v14 == 0)
  {
    v16 = *a2;
    v17 = *a4;
    if (*a4 + *a2 > v13)
    {
      v17 = v13 - v16;
      *a4 = v13 - v16;
    }
    if (*a5 + *a3 > v12)
    {
      *a5 = v12 - *a3;
      v17 = *a4;
    }
    v18 = (*a2 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (*a2 != v18)
    {
      *a4 = *a2 - v18 + v17;
      *a2 = v18;
      v17 = *a4;
    }
    *a4 = v17 & 0xFFFFFFFFFFFFFFF0;
  }
  else if ((v14 - 4) <= 4)
  {
    updateMultiBandNoiseReductionCropRect(*(_QWORD *)(a1 + 200), *a2, *a3, *a4, *a5);
    v14 = *(_DWORD *)(a1 + 104);
  }
  if ((v14 | 2) == 3)
  {
    v19 = *a2;
    v20 = *a4;
    if ((unint64_t)*a2 <= 0x1F)
    {
      *a4 = v19 + v20 - 32;
      v19 = 32;
      *a2 = 32;
      v20 = *a4;
    }
    v21 = v20 + v19;
    v22 = v13 - 32;
    v23 = v13 - 32 - v19;
    if (v21 <= v13 - 32)
      v23 = v20;
    if (a6)
      v24 = (v23 + 63) & 0xFFFFFFFFFFFFFFC0;
    else
      v24 = v23 & 0xFFFFFFFFFFFFFFC0;
    if (v21 > v22 || (a6 & 1) == 0)
    {
      if (!a6)
        v23 &= 0xFFFFFFFFFFFFFFC0;
      *a4 = v23;
    }
    if (*a2 + v24 > v22)
    {
      v24 -= 64;
      *a4 = v24;
    }
    v25 = v12 - 20;
    v26 = v12 - 40;
    if (*a5 < v12 - 40)
      v26 = *a5;
    *a5 = v26;
    v27 = *a3;
    if ((unint64_t)*a3 <= 0x13)
    {
      v27 = 20;
      *a3 = 20;
      v26 = *a5;
    }
    v28 = v26 + v27;
    v29 = v25 - v26;
    if (v28 <= v25)
      v30 = v27;
    else
      v30 = v29;
    *a3 = v30 & 0xFFFFFFFFFFFFFFFELL;
    v31 = *a5 & 0xFFFFFFFFFFFFFFFELL;
    *a5 = v31;
    updateBandPassNoiseReductionCropRect(*(_QWORD *)(a1 + 200), *a2, *a3, v24, v31);
  }
  *(_QWORD *)(a1 + 72) = *a2;
  *(_QWORD *)(a1 + 80) = *a3;
  *(_QWORD *)(a1 + 88) = *a4;
  *(_QWORD *)(a1 + 96) = *a5;
  *(_BYTE *)(a1 + 216) = a6;
}

uint64_t ACTNoiseReduction(int *a1, CVPixelBufferRef pixelBuffer)
{
  int v4;
  const __CFAllocator *v5;
  OSStatus v6;
  CMSampleBufferRef v7;
  __CFDictionary *Mutable;
  CFNumberRef v9;
  __CFDictionary *v10;
  CFDictionaryRef DictionaryRepresentation;
  CFNumberRef v12;
  CFNumberRef v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  int valuePtr;
  CGRect v22;

  formatDescriptionOut = 0;
  memset(&sampleTiming, 0, sizeof(sampleTiming));
  sampleBufferOut = 0;
  *((_QWORD *)a1 + 2) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  *((_QWORD *)a1 + 3) = CVPixelBufferGetWidthOfPlane(pixelBuffer, 1uLL);
  *((_QWORD *)a1 + 4) = CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL);
  *((_QWORD *)a1 + 5) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  *((_QWORD *)a1 + 6) = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  *((_QWORD *)a1 + 7) = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  CVPixelBufferLockBaseAddress(pixelBuffer, 0);
  CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  v4 = a1[26];
  if (v4 != 3 && v4)
    goto LABEL_12;
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], pixelBuffer, &formatDescriptionOut);
  v6 = CMSampleBufferCreateForImageBuffer(v5, pixelBuffer, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  if (!v6)
  {
    v7 = sampleBufferOut;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    valuePtr = *a1;
    v9 = CFNumberCreate(0, kCFNumberFloatType, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("ExposureTime"), v9);
    if (v9)
      CFRelease(v9);
    sub_22761FAAC(Mutable, CFSTR("AGC"), a1[1]);
    sub_22761FAAC(Mutable, CFSTR("sensorDGain"), a1[2]);
    sub_22761FAAC(Mutable, CFSTR("ispDGain"), a1[3]);
    CMSetAttachment(v7, CFSTR("MetadataDictionary"), Mutable, 0);
    v10 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v22.origin.x = (double)*((unint64_t *)a1 + 9);
    v22.origin.y = (double)*((unint64_t *)a1 + 10);
    v22.size.width = (double)*((unint64_t *)a1 + 11);
    v22.size.height = (double)*((unint64_t *)a1 + 12);
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v22);
    CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BE10410], DictionaryRepresentation);
    if (*((_BYTE *)a1 + 136))
    {
      v12 = CFNumberCreate(v5, kCFNumberIntType, a1 + 36);
      v13 = CFNumberCreate(v5, kCFNumberIntType, a1 + 35);
      CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BE10418], v12);
      CFDictionarySetValue(v10, (const void *)*MEMORY[0x24BE10420], v13);
      CFRelease(v12);
      CFRelease(v13);
    }
    v14 = noiseReductionWithTuningOptions();
    sub_22761F4DC(sampleBufferOut);
    FigSampleBufferRelease();
    CFRelease(v10);
    CFRelease(DictionaryRepresentation);
    if (!v14)
    {
      v4 = a1[26];
LABEL_12:
      if ((v4 | 2) == 3)
      {
        v15 = *((_QWORD *)a1 + 25);
        if (v15)
        {
          DoBandPassNoiseReductionComplete(v15, *((unsigned __int8 *)a1 + 216));
          v4 = a1[26];
        }
      }
      if ((v4 - 4) <= 4)
      {
        v16 = *((_QWORD *)a1 + 25);
        if (v16)
          DoMultiBandNoiseReductionComplete(v16, *((unsigned __int8 *)a1 + 216));
      }
    }
  }
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
  return 1;
}

void sub_22761F4DC(const void *a1)
{
  __CFDictionary *v2;

  v2 = (__CFDictionary *)CMGetAttachment(a1, CFSTR("MetadataDictionary"), 0);
  CFDictionaryRemoveAllValues(v2);
  CMRemoveAttachment(a1, CFSTR("MetadataDictionary"));
  CFRelease(v2);
}

void setACTNoiseReductionBuffer(uint64_t a1, CVPixelBufferRef pixelBuffer)
{
  int v4;
  uint64_t v5;
  int v6;
  id *v7;
  id *v8;
  char *MultiBandNoiseReductionContext;
  const __CFDictionary *v10;
  __CVBuffer *BaseAddressOfPlane;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  int v16;
  float v17;
  int v18;
  uint64_t v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  float v24;
  unsigned int v25;
  float v26;
  unsigned int v27;
  float v28;
  unsigned int v29;
  float v30;
  float v31;
  unsigned int v32;
  CVPixelBufferRef v33;
  uint64_t v34;
  void *v35;
  id v36;
  __int128 v37;
  _OWORD v38[2];
  __int128 v39;

  *(_QWORD *)(a1 + 16) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  *(_QWORD *)(a1 + 24) = CVPixelBufferGetWidthOfPlane(pixelBuffer, 1uLL);
  *(_QWORD *)(a1 + 32) = CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL);
  *(_QWORD *)(a1 + 40) = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  *(_QWORD *)(a1 + 48) = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  *(_QWORD *)(a1 + 56) = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  v4 = *(_DWORD *)(a1 + 104);
  if ((v4 - 4) > 4 || *(_QWORD *)(a1 + 200))
    goto LABEL_12;
  v5 = *(_QWORD *)(a1 + 168);
  v33 = pixelBuffer;
  v34 = v5;
  *((_QWORD *)&v37 + 1) = *(_QWORD *)(a1 + 208);
  LODWORD(v37) = v4;
  v35 = 0;
  v36 = 0;
  v6 = *(_DWORD *)(a1 + 104);
  if ((v6 - 7) < 2)
  {
    v7 = &v36;
    v8 = (id *)(a1 + 184);
  }
  else
  {
    if ((v6 - 5) > 1)
      goto LABEL_8;
    v7 = &v35;
    v8 = (id *)(a1 + 176);
  }
  *v7 = *v8;
LABEL_8:
  MultiBandNoiseReductionContext = createMultiBandNoiseReductionContext((uint64_t)&v33);
  *(_QWORD *)(a1 + 200) = MultiBandNoiseReductionContext;
  if (MultiBandNoiseReductionContext)
  {
    v10 = *(const __CFDictionary **)(a1 + 192);
    if (v10)
      updateMultiBandNoiseReductionMetadata((const __CFDictionary *)MultiBandNoiseReductionContext, v10);
  }

  v4 = *(_DWORD *)(a1 + 104);
LABEL_12:
  if ((v4 | 2) == 3 && !*(_QWORD *)(a1 + 200))
  {
    v39 = 0u;
    memset(v38, 0, sizeof(v38));
    CVPixelBufferLockBaseAddress(pixelBuffer, 0);
    BaseAddressOfPlane = (__CVBuffer *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    v12 = CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    v13 = *(_DWORD *)(a1 + 8) * *(_DWORD *)(a1 + 4) * *(_DWORD *)(a1 + 12);
    v14 = *(_QWORD *)(a1 + 40);
    v33 = BaseAddressOfPlane;
    v34 = v14;
    v15 = *(void **)(a1 + 16);
    v35 = v12;
    v36 = v15;
    v37 = *(_OWORD *)(a1 + 48);
    v16 = *(_DWORD *)(a1 + 108);
    if (v16 != 5 && v16 != 7)
    {
      if (v13 < 10)
        v16 = 5;
      else
        v16 = 7;
    }
    LODWORD(v38[0]) = v16;
    v17 = (float)v13;
    v18 = *(_DWORD *)(a1 + 112);
    if (v18 == 1)
    {
      DWORD1(v38[0]) = 0;
    }
    else
    {
      if (v18 == 33)
        v19 = 0x400000021;
      else
        v19 = 0x100000009;
      *(_QWORD *)((char *)v38 + 4) = v19;
    }
    v20 = v17 * 0.000000059605;
    HIDWORD(v21) = *(_DWORD *)(a1 + 116) - 1;
    LODWORD(v21) = HIDWORD(v21);
    switch((v21 >> 3))
    {
      case 0u:
        HIDWORD(v38[0]) = 0;
        goto LABEL_32;
      case 1u:
        v22 = 0x100000009;
        goto LABEL_31;
      case 2u:
        goto LABEL_29;
      case 4u:
        goto LABEL_30;
      default:
        if (v20 >= 4.0)
LABEL_30:
          v22 = 0x200000021;
        else
LABEL_29:
          v22 = 0x200000011;
LABEL_31:
        *(_QWORD *)((char *)v38 + 12) = v22;
LABEL_32:
        if ((*(_DWORD *)(a1 + 120) & 1) != 0)
          v23 = 31;
        else
          v23 = 23;
        DWORD2(v39) = v23;
        v24 = sqrtf(v20);
        if (*(_BYTE *)(a1 + 152))
        {
          v38[0] = xmmword_22764B9C0;
          LODWORD(v38[1]) = 2;
        }
        v25 = *(_DWORD *)(a1 + 128);
        v26 = (float)*(unsigned int *)(a1 + 124) / 1000.0;
        v27 = (float)((float)(v24 * 128.0) / (float)*(unsigned int *)(a1 + 132));
        v28 = v24 + 3.0;
        if (v28 > 8.0)
          v28 = 8.0;
        v29 = v28;
        v30 = (float)v25;
        *(_QWORD *)((char *)&v38[1] + 4) = __PAIR64__(v27, v29);
        v31 = (float)(v26 * v20) + 5.0;
        if (v31 <= (float)v25)
          v30 = v31;
        v32 = (float)(v20 + 5.0);
        if (v32 >= 0x28)
          v32 = 40;
        HIDWORD(v38[1]) = v30;
        LODWORD(v39) = v32;
        DWORD1(v39) = v32;
        *(_QWORD *)(a1 + 200) = createBandPassNoiseReductionContext((uint64_t *)&v33);
        CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
        break;
    }
  }
  *(_BYTE *)(a1 + 156) = 0;
}

void sub_22761F86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{

  _Unwind_Resume(a1);
}

void resetNoiseReductionContext(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  __CVBuffer **v4;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 104);
    if (v2 == 1)
    {
      v3 = *(_QWORD **)(a1 + 200);
      if (!v3)
      {
LABEL_8:
        *(_BYTE *)(a1 + 156) = 1;
        *(_DWORD *)(a1 + 160) = 0;
        *(_BYTE *)(a1 + 216) = 0;
        return;
      }
      destroyBandPassNoiseReductionContext(v3);
      *(_QWORD *)(a1 + 200) = 0;
      v2 = *(_DWORD *)(a1 + 104);
    }
    if ((v2 - 4) <= 4)
    {
      v4 = *(__CVBuffer ***)(a1 + 200);
      if (v4)
      {
        destroyMultiBandNoiseReductionContext(v4);
        *(_QWORD *)(a1 + 200) = 0;
      }
    }
    goto LABEL_8;
  }
}

void deleteNoiseReductionContext(uint64_t a1)
{
  int v2;
  uint64_t FigBaseObject;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;
  const void *v7;
  const void *v8;

  if (a1)
  {
    resetNoiseReductionContext(a1);
    if (*(_QWORD *)(a1 + 168))
    {
      noiseReductionContextDestroy();
      *(_QWORD *)(a1 + 168) = 0;
    }
    v2 = *(_DWORD *)(a1 + 104);
    if ((v2 - 5) > 1)
    {
      if ((v2 - 7) <= 1)
      {
        v6 = *(void **)(a1 + 184);
        if (v6)
        {
          *(_QWORD *)(a1 + 184) = 0;

        }
      }
    }
    else if (*(_QWORD *)(a1 + 176))
    {
      FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
      if (FigBaseObject)
      {
        v4 = FigBaseObject;
        v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v5)
          v5(v4);
      }
      CFRelease(*(CFTypeRef *)(a1 + 176));
      *(_QWORD *)(a1 + 176) = 0;
    }
    v7 = *(const void **)(a1 + 192);
    if (v7)
      CFRelease(v7);
    v8 = *(const void **)(a1 + 208);
    if (v8)
      CFRelease(v8);
    free((void *)a1);
  }
}

_QWORD *ACTFinalThreadedNoiseReduction(_QWORD *result)
{
  if (result)
  {
    result = (_QWORD *)*result;
    if (result)
      ACTThreadMutexLock((uint64_t)result);
  }
  return result;
}

void sub_22761FAAC(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, a2, v5);
  if (v5)
    CFRelease(v5);
}

double sub_227621028(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  int v18;
  int v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  __int128 v45;
  __int128 v46;
  double result;
  __int128 v48;
  __int128 v49;
  double v50;
  double v51;
  double v52;
  _OWORD v53[3];
  __int128 v54;
  __int128 v55;
  __int128 v56;

  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), a2, (uint64_t)CFSTR("SliceType"), a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_intValue(v5, v6, v7, v8);

  objc_msgSend_toHomography(*(void **)(*(_QWORD *)(a1 + 40) + 48), v10, v11, v12);
  v51 = v14;
  v52 = v13;
  v50 = v15;
  v16 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_DWORD *)(a1 + 56);
  v19 = *(_DWORD *)(a1 + 60);
  objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 32), v20, (uint64_t)CFSTR("SliceNumber"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_intValue(v22, v23, v24, v25);
  LODWORD(v27) = v18;
  LODWORD(v28) = v19;
  objc_msgSend_update_sliceType_sliceWidth_sliceHeight_sliceID_(v16, v29, v17, v9, v26, v27, v28);

  v30 = *(_QWORD *)(a1 + 40);
  objc_msgSend_refineInitialHomography_((void *)v30, v31, v32, v33, v52, v51, v50);
  v34 = 0;
  *(_DWORD *)(v30 + 280) = v35;
  *(_QWORD *)(v30 + 272) = v36;
  *(_DWORD *)(v30 + 296) = v37;
  *(_QWORD *)(v30 + 288) = v38;
  *(_DWORD *)(v30 + 312) = v39;
  *(_QWORD *)(v30 + 304) = v40;
  v41 = *(_QWORD *)(a1 + 40);
  v42 = *(float32x4_t *)(v41 + 224);
  v43 = *(float32x4_t *)(v41 + 240);
  v44 = *(float32x4_t *)(v41 + 256);
  v45 = *(_OWORD *)(v41 + 288);
  v46 = *(_OWORD *)(v41 + 304);
  v53[0] = *(_OWORD *)(v41 + 272);
  v53[1] = v45;
  v53[2] = v46;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  do
  {
    *(__int128 *)((char *)&v54 + v34 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v42, COERCE_FLOAT(v53[v34])), v43, *(float32x2_t *)&v53[v34], 1), v44, (float32x4_t)v53[v34], 2);
    ++v34;
  }
  while (v34 != 3);
  result = *(double *)&v54;
  v48 = v55;
  v49 = v56;
  *(_DWORD *)(v41 + 232) = DWORD2(v54);
  *(_DWORD *)(v41 + 248) = DWORD2(v48);
  *(double *)(v41 + 224) = result;
  *(_QWORD *)(v41 + 240) = v48;
  *(_DWORD *)(v41 + 264) = DWORD2(v49);
  *(_QWORD *)(v41 + 256) = v49;
  return result;
}

void sub_2276211AC(uint64_t a1, const char *a2)
{
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  double HostTime;
  Float64 Seconds;
  const void *v18;
  CMTime v19;
  os_log_type_t type;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v3 + 96) < 4uLL)
  {
    objc_msgSend__setPreviousFrameDroppedFlag_dropped_((void *)v3, a2, *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(v3 + 104));
    objc_msgSend_addFrameForStitching_withInitialHomography_registrationCallback_(*(void **)(a1 + 32), v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(double *)(*(_QWORD *)(a1 + 32) + 224), *(double *)(*(_QWORD *)(a1 + 32) + 240), *(double *)(*(_QWORD *)(a1 + 32) + 256));
    v6 = *(_OWORD **)(a1 + 32);
    v7 = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 32);
    v8 = *MEMORY[0x24BDAEDF8];
    v6[15] = *(_OWORD *)(MEMORY[0x24BDAEDF8] + 16);
    v6[16] = v7;
    v6[14] = v8;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = 0;
  }
  else
  {
    *(_BYTE *)(v3 + 104) = 1;
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
    v21 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    objc_msgSend_objectForKeyedSubscript_(*(void **)(a1 + 40), v9, (uint64_t)CFSTR("SliceNumber"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_intValue(v11, v12, v13, v14);
    HostTime = getHostTime();
    CMSampleBufferGetPresentationTimeStamp(&v19, *(CMSampleBufferRef *)(a1 + 56));
    Seconds = CMTimeGetSeconds(&v19);
    panoLog(4, "FrameID:%04d time %.3f: frame dropped PTS:%.3f, total frames dropped %zu\n", v15, HostTime, Seconds, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520));

  }
  v18 = *(const void **)(a1 + 56);
  if (v18)
    CFRelease(v18);
  --*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96);
}

void sub_227621644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_227621660(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;

  if (!objc_msgSend_warpedFrame(*(void **)(*(_QWORD *)(a1 + 32) + 24), a2, a3, a4)
    || (result = objc_msgSend__addLastSlice(*(void **)(a1 + 32), v5, v6, v7),
        (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result) == 0))
  {
    result = objc_msgSend_finishProcessing(*(void **)(*(_QWORD *)(a1 + 32) + 24), v5, v6, v7);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      result = objc_msgSend_finishProcessing(*(void **)(*(_QWORD *)(a1 + 32) + 40), v9, v10, v11);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        result = objc_msgSend_finishProcessing(*(void **)(*(_QWORD *)(a1 + 32) + 48), v12, v13, v14);
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
      }
    }
  }
  return result;
}

uint64_t sub_22762189C(uint64_t result, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __CVBuffer *v18;
  size_t Width;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __CVBuffer *v23;
  size_t Height;
  const char *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;

  v4 = result;
  if (*(_DWORD *)(result + 48))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    v28 = 1;
    goto LABEL_11;
  }
  result = *(_QWORD *)(*(_QWORD *)(result + 32) + 408);
  if (!result)
  {
    result = objc_msgSend__createDummyOutput(*(void **)(v4 + 32), a2, a3, a4);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
    v5 = *(_QWORD *)(*(_QWORD *)(v4 + 40) + 8);
    if (*(_DWORD *)(v5 + 24) || (result = *(_QWORD *)(*(_QWORD *)(v4 + 32) + 408)) == 0)
    {
      v28 = 2;
LABEL_11:
      *(_DWORD *)(v5 + 24) = v28;
      return result;
    }
  }
  v6 = objc_msgSend_pixelBuffer((void *)result, a2, a3, a4);
  objc_msgSend_setOutput_(*(void **)(*(_QWORD *)(v4 + 32) + 40), v7, v6, v8);
  result = objc_msgSend_prepareToProcess_(*(void **)(*(_QWORD *)(v4 + 32) + 32), v9, *(unsigned int *)(v4 + 48), v10);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24))
  {
    result = objc_msgSend_prepareToProcess_(*(void **)(*(_QWORD *)(v4 + 32) + 40), v11, *(unsigned int *)(v4 + 48), v12);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24))
    {
      v16 = *(_QWORD *)(v4 + 32);
      v17 = *(void **)(v16 + 40);
      v18 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v16 + 408), v13, v14, v15);
      Width = CVPixelBufferGetWidth(v18);
      v23 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(*(_QWORD *)(v4 + 32) + 408), v20, v21, v22);
      Height = CVPixelBufferGetHeight(v23);
      result = objc_msgSend_prepareToProcessPanoWidth_panoHeight_(v17, v25, Width, Height);
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24) = result;
      if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 40) + 8) + 24))
      {
        objc_msgSend_setAssemblyMode_(*(void **)(*(_QWORD *)(v4 + 32) + 40), v26, 1, v27);
        return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(v4 + 32) + 32), sel_setStitchingMode_, 1, v29);
      }
    }
  }
  return result;
}

void sub_227621A9C(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(_QWORD *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 56);
  v21 = v3;
  objc_msgSend_getRegistrationWidth_height_(*(void **)(a1 + 32), a2, (uint64_t)&v21, (uint64_t)&v20);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  objc_msgSend_device(*(void **)(v4 + 8), v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_library(*(void **)(*(_QWORD *)(a1 + 32) + 8), v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_commandQueue(*(void **)(*(_QWORD *)(a1 + 32) + 8), v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_prepareRegistrationWithDevice_library_commandQueue_width_height_(v5, v18, (uint64_t)v9, (uint64_t)v13, v17, v21, v20);

  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend_prepareToProcessSliceWidth_sliceHeight_(*(void **)(*(_QWORD *)(a1 + 32) + 32), v19, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t sub_227621C40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_227621C50(uint64_t a1)
{

}

void sub_227621C58(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  double HostTime;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CVBuffer *v21;
  __CVBuffer *v22;
  size_t Height;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __CVBuffer *v27;
  size_t Width;
  const __CFString *v29;
  const char *v30;
  CGColorSpaceRef v31;
  const char *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v33 = *MEMORY[0x24BDC5668];
  v34[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v34, (uint64_t)&v33, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = objc_alloc(MEMORY[0x24BDBF660]);
  v9 = objc_msgSend_pixelBuffer(*(void **)(*(_QWORD *)(a1 + 32) + 408), v6, v7, v8);
  v12 = (void *)objc_msgSend_initWithCVImageBuffer_(v5, v10, v9, v11);
  objc_msgSend_imageByApplyingOrientation_(v12, v13, 6, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  HostTime = getHostTime();
  panoLog(32, "time %.3f: encodedResult\n", HostTime);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(__CVBuffer **)(v20 + 72);
  if (v21)
    goto LABEL_4;
  v22 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(v20 + 408), v17, v18, v19);
  Height = CVPixelBufferGetHeight(v22);
  v27 = (__CVBuffer *)objc_msgSend_pixelBuffer(*(void **)(*(_QWORD *)(a1 + 32) + 408), v24, v25, v26);
  Width = CVPixelBufferGetWidth(v27);
  if (!CVPixelBufferCreate(0, Height, Width, 0x34323066u, (CFDictionaryRef)v3, (CVPixelBufferRef *)(*(_QWORD *)(a1 + 32) + 72)))
  {
    v21 = *(__CVBuffer **)(*(_QWORD *)(a1 + 32) + 72);
LABEL_4:
    v29 = (const __CFString *)*MEMORY[0x24BDC5410];
    CVBufferRemoveAttachment(v21, (CFStringRef)*MEMORY[0x24BDC5410]);
    objc_msgSend_render_toCVPixelBuffer_(v4, v30, (uint64_t)v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
    v31 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF228]);
    CVBufferSetAttachment(*(CVBufferRef *)(*(_QWORD *)(a1 + 32) + 72), v29, v31, kCVAttachmentMode_ShouldPropagate);
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v32, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72), (uint64_t)CFSTR("Assembly"));
  }

}

void sub_227621FAC(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  FILE **v8;
  float v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int v19;
  int v20;
  unsigned __int8 *v21;
  float v23;
  uint64_t v25;
  uint64_t v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  char *v32;
  float v33;
  int v35;
  int v36;
  char *v37;
  float v38;
  int v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int v44;
  int v45;
  unsigned __int8 *v46;
  float v48;
  float v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  char *v55;
  float v56;
  uint64_t v58;
  int v59;
  int v60;
  char *v61;
  float v62;
  int v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  char *v69;
  float v70;
  float v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  int v76;
  int v77;
  unsigned __int8 *v78;
  float v80;
  char *v82;
  uint64_t v83;
  int v84;
  int v85;
  unsigned __int8 *v86;
  float v88;
  int v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v94;
  char *v95;
  float v96;
  float v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  int v102;
  int v103;
  unsigned __int8 *v104;
  float v106;
  char *v108;
  uint64_t v109;
  int v110;
  int v111;
  unsigned __int8 *v112;
  float v114;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  double *v127;
  int v128;
  void *v130;
  uint64_t v131;
  uint64_t v132;

  v131 = 0;
  v132 = 0;
  v130 = 0;
  objc_msgSend_getMaskAsBuffer_widthOut_heightOut_(*(void **)(*(_QWORD *)(a1 + 32) + 40), a2, (uint64_t)&v130, (uint64_t)&v132, &v131);
  v2 = 0;
  v3 = 0;
  v4 = v132;
  v5 = v131 - 1;
  v6 = (int)v132;
  v7 = -(uint64_t)(int)v132;
  v8 = (FILE **)MEMORY[0x24BDAC8E8];
  v9 = 0.0;
  v10 = 1.0;
  v11 = (v131 - 1);
  v128 = v132 - 1;
  v12 = (v132 - 1);
  do
  {
    v13 = v3;
    if (v9 == 0.0)
      fprintf(*v8, "Print out once crop ratio 0.0: %f \n", v9);
    v14 = v2;
    v15 = v11 - v2;
    if ((int)v11 >= (int)v2)
    {
      v16 = (int)v2;
      v17 = (char *)v130 + (int)v13 + (int)v6 * (uint64_t)(int)v2;
      do
      {
        v18 = v16;
        if ((int)v12 >= (int)v13)
        {
          v19 = 0;
          v20 = v12 - v13 + 1;
          v21 = (unsigned __int8 *)v17;
          do
          {
            if (*v21++)
              ++v19;
            --v20;
          }
          while (v20);
        }
        else
        {
          v19 = 0;
        }
        v23 = (float)v19 / (float)((float)(int)v12 - (float)(int)v13);
        v16 = v18 + 1;
        v17 += v6;
      }
      while (v23 <= v9 && v18 < (int)v11);
      v14 = v18;
    }
    if (v9 <= 0.0)
    {
      v25 = v12;
      v3 = v13;
    }
    else
    {
      v25 = v12;
      v3 = v13;
      if ((float)((float)v15 * 0.2) < (float)(v14 - v2))
      {
        LODWORD(v25) = v12;
        LODWORD(v26) = v13;
        if ((int)v12 >= (int)v13)
        {
          v27 = (float)(int)v11 - (float)(int)v2;
          v28 = (int)v12;
          v29 = (int)v13;
          do
          {
            v25 = v29;
            if ((int)v11 >= (int)v2)
            {
              v30 = 0;
              v31 = v15 + 1;
              v32 = (char *)v130 + (int)v6 * (uint64_t)(int)v2;
              do
              {
                if (v32[v25])
                  ++v30;
                v32 += v6;
                --v31;
              }
              while (v31);
            }
            else
            {
              v30 = 0;
            }
            v33 = (float)v30 / v27;
            v29 = v25 + 1;
          }
          while (v33 >= 0.8 && v25 < (int)v12);
          do
          {
            v26 = v28;
            if ((int)v11 >= (int)v2)
            {
              v35 = 0;
              v36 = v15 + 1;
              v37 = (char *)v130 + (int)v6 * (uint64_t)(int)v2;
              do
              {
                if (v37[v26])
                  ++v35;
                v37 += v6;
                --v36;
              }
              while (v36);
            }
            else
            {
              v35 = 0;
            }
            v38 = (float)v35 / v27;
            v28 = v26 - 1;
          }
          while (v38 >= 0.8 && v26 > (int)v13);
        }
        v40 = v12 - v25;
        if ((int)v26 - (int)v13 <= (int)v12 - (int)v25)
          v25 = v12;
        else
          v25 = v25;
        if ((int)v26 - (int)v13 <= v40)
          v3 = v26;
        else
          v3 = v13;
        v14 = v2;
      }
    }
    v41 = v11;
    if ((int)v11 >= (int)v14)
    {
      v42 = (int)v11;
      v43 = (char *)v130 + (int)v3 + (int)v6 * (uint64_t)(int)v11;
      do
      {
        v41 = v42;
        if ((int)v3 <= (int)v25)
        {
          v44 = 0;
          v45 = v25 - v3 + 1;
          v46 = (unsigned __int8 *)v43;
          do
          {
            if (*v46++)
              ++v44;
            --v45;
          }
          while (v45);
        }
        else
        {
          v44 = 0;
        }
        v48 = (float)v44 / (float)((float)(int)v25 - (float)(int)v3);
        v42 = v41 - 1;
        v43 += v7;
      }
      while (v48 <= v9 && v41 > (int)v14);
    }
    if (v9 > 0.0 && (float)((float)v15 * 0.2) < (float)(v11 - v41))
    {
      if ((int)v12 >= (int)v13)
      {
        v50 = (float)(int)v11 - (float)(int)v2;
        v51 = (int)v12;
        v52 = (int)v13;
        do
        {
          v25 = v52;
          if ((int)v11 >= (int)v14)
          {
            v53 = 0;
            v54 = v11 - v14 + 1;
            v55 = (char *)v130 + (int)v6 * (uint64_t)(int)v14;
            do
            {
              if (v55[v25])
                ++v53;
              v55 += v6;
              --v54;
            }
            while (v54);
          }
          else
          {
            v53 = 0;
          }
          v56 = (float)v53 / v50;
          v52 = v25 + 1;
        }
        while (v56 >= 0.8 && v25 < (int)v12);
        do
        {
          v58 = v51;
          if ((int)v11 >= (int)v14)
          {
            v59 = 0;
            v60 = v11 - v14 + 1;
            v61 = (char *)v130 + (int)v6 * (uint64_t)(int)v14;
            do
            {
              if (v61[v58])
                ++v59;
              v61 += v6;
              --v60;
            }
            while (v60);
          }
          else
          {
            v59 = 0;
          }
          v62 = (float)v59 / v50;
          v51 = v58 - 1;
        }
        while (v62 >= 0.8 && v58 > (int)v13);
        LODWORD(v3) = v58;
      }
      v64 = v12 - v25;
      if ((int)v3 - (int)v13 <= (int)v12 - (int)v25)
        v25 = v12;
      else
        v25 = v25;
      if ((int)v3 - (int)v13 <= v64)
        v3 = v3;
      else
        v3 = v13;
      v41 = v11;
    }
    if ((int)v3 <= (int)v25)
    {
      v65 = (int)v3;
      do
      {
        v66 = v65;
        if ((int)v14 <= (int)v41)
        {
          v67 = 0;
          v68 = v41 - v14 + 1;
          v69 = (char *)v130 + (int)v6 * (uint64_t)(int)v14;
          do
          {
            if (v69[v66])
              ++v67;
            v69 += v6;
            --v68;
          }
          while (v68);
        }
        else
        {
          v67 = 0;
        }
        v70 = (float)v67 / (float)((float)(int)v41 - (float)(int)v14);
        v65 = v66 + 1;
      }
      while (v70 <= v9 && v66 < (int)v25);
      v3 = v66;
    }
    if (v9 > 0.0 && (float)((float)(v12 - v13) * 0.2) < (float)(v3 - v13))
    {
      if ((int)v11 >= (int)v2)
      {
        v72 = (float)(int)v12 - (float)(int)v13;
        v73 = (int)v2;
        v74 = (char *)v130 + (int)v13 + (int)v6 * (uint64_t)(int)v11;
        v75 = (int)v11;
        do
        {
          v14 = v75;
          if ((int)v12 >= (int)v13)
          {
            v76 = 0;
            v77 = v12 - v13 + 1;
            v78 = (unsigned __int8 *)v74;
            do
            {
              if (*v78++)
                ++v76;
              --v77;
            }
            while (v77);
          }
          else
          {
            v76 = 0;
          }
          v80 = (float)v76 / v72;
          v75 = v14 - 1;
          v74 += v7;
        }
        while (v80 >= 0.8 && v14 > (int)v2);
        v82 = (char *)v130 + (int)v13 + (int)v6 * (uint64_t)(int)v2;
        do
        {
          v83 = v73;
          if ((int)v12 >= (int)v13)
          {
            v84 = 0;
            v85 = v12 - v13 + 1;
            v86 = (unsigned __int8 *)v82;
            do
            {
              if (*v86++)
                ++v84;
              --v85;
            }
            while (v85);
          }
          else
          {
            v84 = 0;
          }
          v88 = (float)v84 / v72;
          v73 = v83 + 1;
          v82 += v6;
        }
        while (v88 >= 0.8 && v83 < (int)v11);
        LODWORD(v41) = v83;
      }
      v90 = v11 - v41;
      if ((int)v14 - (int)v2 <= (int)v11 - (int)v41)
        v41 = v11;
      else
        v41 = v41;
      if ((int)v14 - (int)v2 <= v90)
        v14 = v14;
      else
        v14 = v2;
      v3 = v13;
    }
    if ((int)v25 >= (int)v3)
    {
      v91 = (int)v25;
      do
      {
        v92 = v91;
        if ((int)v14 <= (int)v41)
        {
          v93 = 0;
          v94 = v41 - v14 + 1;
          v95 = (char *)v130 + (int)v6 * (uint64_t)(int)v14;
          do
          {
            if (v95[v92])
              ++v93;
            v95 += v6;
            --v94;
          }
          while (v94);
        }
        else
        {
          v93 = 0;
        }
        v96 = (float)v93 / (float)((float)(int)v41 - (float)(int)v14);
        v91 = v92 - 1;
      }
      while (v96 <= v9 && v92 > (int)v3);
      v25 = v92;
    }
    if (v9 <= 0.0 || (float)((float)(v12 - v13) * 0.2) >= (float)(v12 - v25))
    {
      v12 = v25;
      v11 = v41;
      v2 = v14;
    }
    else
    {
      if ((int)v11 >= (int)v2)
      {
        v98 = (float)(int)v12 - (float)(int)v13;
        v99 = (int)v2;
        v100 = (char *)v130 + (int)v13 + (int)v6 * (uint64_t)(int)v11;
        v101 = (int)v11;
        do
        {
          v14 = v101;
          if ((int)v12 >= (int)v13)
          {
            v102 = 0;
            v103 = v12 - v13 + 1;
            v104 = (unsigned __int8 *)v100;
            do
            {
              if (*v104++)
                ++v102;
              --v103;
            }
            while (v103);
          }
          else
          {
            v102 = 0;
          }
          v106 = (float)v102 / v98;
          v101 = v14 - 1;
          v100 += v7;
        }
        while (v106 >= 0.8 && v14 > (int)v2);
        v108 = (char *)v130 + (int)v13 + (int)v6 * (uint64_t)(int)v2;
        do
        {
          v109 = v99;
          if ((int)v12 >= (int)v13)
          {
            v110 = 0;
            v111 = v12 - v13 + 1;
            v112 = (unsigned __int8 *)v108;
            do
            {
              if (*v112++)
                ++v110;
              --v111;
            }
            while (v111);
          }
          else
          {
            v110 = 0;
          }
          v114 = (float)v110 / v98;
          v99 = v109 + 1;
          v108 += v6;
        }
        while (v114 >= 0.8 && v109 < (int)v11);
        LODWORD(v41) = v109;
      }
      v116 = v11 - v41;
      if ((int)v14 - (int)v2 <= (int)v11 - (int)v41)
        v11 = v11;
      else
        v11 = v41;
      if ((int)v14 - (int)v2 <= v116)
        v2 = v14;
      else
        v2 = v2;
    }
    v10 = v10 * 0.9;
    v9 = 1.0 - v10;
  }
  while ((float)(1.0 - v10) < 0.999);
  v117 = (int)(float)((float)((float)((float)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 112)
                                    / (float)((float)v4 + (float)v4))
                            * 0.9)
                    * (float)v4);
  v118 = v117 / 2;
  if (v4 >= 0)
    v119 = v4;
  else
    v119 = v4 + 1;
  v120 = (v119 >> 1) - v117 / 2;
  if (v120 >= (int)v3)
    v121 = v3;
  else
    v121 = v120 & ~(v120 >> 31);
  v122 = v118 + (v119 >> 1);
  v123 = v128;
  if (v122 < v4)
    v123 = v118 + (v119 >> 1);
  if (v122 <= (int)v12)
    v124 = v12;
  else
    v124 = v123;
  v125 = v5 - v11;
  v126 = v5 - v2;
  printf("Final edge: top: %d, bottom: %d, left: %d, right: %d \n", v125, v126, v121, v124);
  free(v130);
  v127 = *(double **)(a1 + 32);
  v127[17] = (double)(2 * v121);
  v127[18] = (double)(2 * v125);
  v127[19] = (double)(2 * (v124 - v121));
  v127[20] = (double)(2 * (v126 - v125));
}

_QWORD *PixelShuffler_constructor(size_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;

  v4 = malloc_type_malloc(0x850uLL, 0x1010040B9D6ABF0uLL);
  v5 = v4;
  if (v4)
  {
    *v4 = a1;
    v6 = malloc_type_malloc(a1, 0x100004077774924uLL);
    v5[1] = v6;
    if (v6)
    {
      v5[2] = a1;
      v5[3] = a2;
      v5[4] = a2 * a1;
      v7 = malloc_type_malloc(a2 * a1, 0x100004077774924uLL);
      v5[5] = v7;
      if (v7)
      {
        memcpy(v5 + 8, &unk_22764BAA0, 0x400uLL);
        memcpy(v5 + 136, &unk_22764BEA0, 0x400uLL);
        *((_OWORD *)v5 + 132) = xmmword_22764BA40;
        return v5;
      }
      free((void *)v5[1]);
    }
    free(v5);
    return 0;
  }
  return v5;
}

uint64_t PixelShuffler_init(uint64_t a1, size_t size, unint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)a1 >= size)
    goto LABEL_15;
  v6 = *(void **)(a1 + 8);
  if (v6)
    free(v6);
  *(_QWORD *)a1 = size;
  *(_QWORD *)(a1 + 8) = 0;
  v7 = malloc_type_malloc(size, 0x100004077774924uLL);
  *(_QWORD *)(a1 + 8) = v7;
  if (v7)
  {
LABEL_15:
    if (*(_QWORD *)(a1 + 16) >= size && *(_QWORD *)(a1 + 24) >= a3)
      return 0;
    v8 = *(void **)(a1 + 40);
    if (v8)
      free(v8);
    *(_QWORD *)(a1 + 16) = size;
    *(_QWORD *)(a1 + 24) = a3;
    *(_QWORD *)(a1 + 32) = a3 * size;
    *(_QWORD *)(a1 + 40) = 0;
    v9 = malloc_type_malloc(a3 * size, 0x100004077774924uLL);
    *(_QWORD *)(a1 + 40) = v9;
    if (v9)
      return 0;
    free(*(void **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
  }
  return 0xFFFFFFFFLL;
}

void PixelShuffler_reset(uint64_t a1)
{
  bzero(*(void **)(a1 + 8), *(_QWORD *)a1);
  bzero(*(void **)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void PixelShuffler_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[5];
    if (v2)
      free(v2);
    v3 = (void *)a1[1];
    if (v3)
      free(v3);
    free(a1);
  }
}

const __CFNumber *PixelShuffler_setOptions(const __CFNumber *result, CFDictionaryRef theDict)
{
  char *v3;
  const __CFArray *Value;
  const __CFArray *v5;
  CFTypeID v6;
  CFIndex v7;
  char *v8;
  const __CFNumber *ValueAtIndex;
  const __CFArray *v10;
  const __CFArray *v11;
  CFTypeID v12;
  CFIndex v13;
  char *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  CFTypeID v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  CFTypeID v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  CFTypeID v24;
  const __CFNumber *v25;
  CFTypeID v26;

  if (theDict)
  {
    v3 = (char *)result;
    Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerHighlightMappingCurve"));
    if (Value)
    {
      v5 = Value;
      v6 = CFGetTypeID(Value);
      if (v6 == CFArrayGetTypeID())
      {
        v7 = 0;
        v8 = v3 + 64;
        do
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(v5, v7);
          if (ValueAtIndex)
            CFNumberGetValue(ValueAtIndex, kCFNumberFloat32Type, v8);
          ++v7;
          v8 += 4;
        }
        while (v7 != 256);
      }
    }
    v10 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerShadowMappingCurve"));
    if (v10)
    {
      v11 = v10;
      v12 = CFGetTypeID(v10);
      if (v12 == CFArrayGetTypeID())
      {
        v13 = 0;
        v14 = v3 + 1088;
        do
        {
          v15 = (const __CFNumber *)CFArrayGetValueAtIndex(v11, v13);
          if (v15)
            CFNumberGetValue(v15, kCFNumberFloat32Type, v14);
          ++v13;
          v14 += 4;
        }
        while (v13 != 256);
      }
    }
    v16 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerDesatMappingBasePoint"));
    if (v16)
    {
      v17 = v16;
      v18 = CFGetTypeID(v16);
      if (v18 == CFNumberGetTypeID())
        CFNumberGetValue(v17, kCFNumberFloat32Type, v3 + 2112);
    }
    v19 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerDesatScale"));
    if (v19)
    {
      v20 = v19;
      v21 = CFGetTypeID(v19);
      if (v21 == CFNumberGetTypeID())
        CFNumberGetValue(v20, kCFNumberFloat32Type, v3 + 2116);
    }
    v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerDesatMaxAWBDelta"));
    if (v22)
    {
      v23 = v22;
      v24 = CFGetTypeID(v22);
      if (v24 == CFNumberGetTypeID())
        CFNumberGetValue(v23, kCFNumberFloat32Type, v3 + 2120);
    }
    result = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("PixelShufflerDesatMaxDesatStrength"));
    if (result)
    {
      v25 = result;
      v26 = CFGetTypeID(result);
      result = (const __CFNumber *)CFNumberGetTypeID();
      if ((const __CFNumber *)v26 == result)
        return (const __CFNumber *)CFNumberGetValue(v25, kCFNumberFloat32Type, v3 + 2124);
    }
  }
  return result;
}

char *PixelShuffler_imageFlipHorizontally(char *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;

  if (a3)
  {
    v4 = 0;
    v5 = (unint64_t)(a2 + 1) >> 1;
    v6 = (uint64_t)&result[a2 - 1];
    do
    {
      if ((a2 & 1) != v5)
      {
        v7 = 0;
        v8 = result;
        do
        {
          v9 = *v8;
          *v8++ = *(_BYTE *)(v6 + v7);
          *(_BYTE *)(v6 + v7--) = v9;
        }
        while ((a2 & 1) - v5 != v7);
      }
      v6 += a4;
      result += a4;
      ++v4;
    }
    while (v4 != a3);
  }
  return result;
}

vImage_Error PixelShuffler_imageFlipHorizontally_uint16(void *a1, vImagePixelCount a2, vImagePixelCount a3, size_t a4)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a1;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a4;
  dest.data = a1;
  dest.height = a3;
  dest.width = a2;
  dest.rowBytes = a4;
  result = vImageHorizontalReflect_Planar16U(&src, &dest, 2u);
  if (result)
    return printf("ERROR: Y vImage rotate err=%d\n", result);
  return result;
}

_QWORD *PixelShuffler_cropRoi(_QWORD *result, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, size_t __n, uint64_t a9)
{
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = a9;
  if (a9)
  {
    v12 = 0;
    v13 = result[5];
    v14 = a2 + a7 * a5 + a6;
    do
    {
      result = memcpy((void *)(v13 + v12), (const void *)(v14 + v12), __n);
      v12 += a5;
      --v9;
    }
    while (v9);
  }
  return result;
}

_QWORD *PixelShuffler_cropRoi_uint16(_QWORD *result, uint64_t a2, int a3, int a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = a9;
  if (a9)
  {
    v10 = 0;
    v11 = 2 * a8;
    v12 = result[5];
    v13 = a2 + 2 * (a5 >> 1) * a7 + 2 * a6;
    v14 = 2 * (a5 >> 1);
    do
    {
      result = memcpy((void *)(v12 + v10), (const void *)(v13 + v10), v11);
      v10 += v14;
      --v9;
    }
    while (v9);
  }
  return result;
}

_QWORD *PixelShuffler_imageTransposeRoi(_QWORD *result, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, size_t a10, unint64_t a11)
{
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  unint64_t v21;
  uint64_t v22;
  size_t v23;
  unint64_t v24;
  size_t v25;
  uint64_t v26;
  char v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  size_t v47;

  v13 = result;
  v14 = a10;
  v15 = a11;
  if (a11)
  {
    v16 = 0;
    v17 = result[5];
    v18 = a3 + a9 * a6 + a8;
    v19 = a11;
    do
    {
      result = memcpy((void *)(v17 + v16), (const void *)(v18 + v16), a10);
      v16 += a6;
      --v19;
    }
    while (v19);
  }
  if (((a10 | a11) & 1) != 0)
  {
    v28 = a11;
    v20 = a10;
  }
  else
  {
    v20 = a10;
    v21 = a11;
    do
    {
      v46 = v20;
      v20 >>= 1;
      v42 = v21 >> 1;
      if (v15)
      {
        v22 = v21 >> 1;
        if (v42 <= 1)
          v22 = 1;
        v43 = 0;
        v44 = v22;
        v45 = v21;
        do
        {
          if (v14)
          {
            v47 = 0;
            v23 = v20 + v43 * a6;
            v24 = a6 * (v42 + v43);
            do
            {
              if (v21 >= 2)
              {
                v25 = v13[5] + v47;
                v26 = v44;
                do
                {
                  memcpy((void *)v13[1], (const void *)(v25 + v23), v20);
                  memcpy((void *)(v25 + v23), (const void *)(v25 + v24), v20);
                  result = memcpy((void *)(v25 + v24), (const void *)v13[1], v20);
                  v25 += a6;
                  --v26;
                }
                while (v26);
              }
              v14 = a10;
              v21 = v45;
              v47 = (int)v47 + v46;
            }
            while (v47 < a10);
          }
          v15 = a11;
          v43 = (int)v43 + (int)v21;
        }
        while (v43 < a11);
      }
      v27 = v46 | v21;
      v28 = v42;
      v21 = v42;
    }
    while ((v27 & 2) == 0);
  }
  v13[6] = v20;
  v13[7] = v28;
  if (v20 == 1 && v28 == 1)
    return memcpy(a2, (const void *)v13[5], v15 * a6);
  v29 = a2;
  if (v28 - 1 < v15 && v20)
  {
    v30 = 0;
    v31 = v14 / v20;
    v32 = v13[5];
    if (v14 / v20 <= 1)
      v31 = 1;
    v33 = v15 / v28;
    if (v15 / v28 <= 1)
      v33 = 1;
    do
    {
      if (v20 <= v14)
      {
        v34 = 0;
        v35 = v29;
        v36 = v32;
        do
        {
          v37 = 0;
          result = v35;
          v38 = v36;
          do
          {
            v39 = 0;
            v40 = result;
            do
            {
              *v40 = *(_BYTE *)(v38 + v39);
              v40 += a7;
              ++v39;
            }
            while (v20 != v39);
            v38 += a6;
            result = (_QWORD *)((char *)result + 1);
            ++v37;
          }
          while (v37 != v28);
          v36 += v20;
          v35 += v28;
          ++v34;
        }
        while (v34 != v31);
      }
      v32 += v28 * a6;
      v29 += v20 * a7;
      ++v30;
    }
    while (v30 != v33);
  }
  return result;
}

char *PixelShuffler_imageTransposeRoi_uint16(char *result, char *a2, uint64_t a3, int a4, int a5, unint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, unint64_t a11)
{
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  _WORD *v36;
  uint64_t v37;
  char *v38;
  _WORD *v39;
  uint64_t v40;
  _WORD *v41;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;

  v11 = (uint64_t)result;
  v12 = a10;
  v13 = a11;
  v46 = a6 >> 1;
  v14 = 2 * (a6 >> 1);
  if (a11)
  {
    v15 = 0;
    v16 = *((_QWORD *)result + 5);
    v17 = a3 + 2 * v46 * a9 + 2 * a8;
    v18 = a11;
    do
    {
      result = (char *)memcpy((void *)(v16 + v15), (const void *)(v17 + v15), 2 * a10);
      v15 += v14;
      --v18;
    }
    while (v18);
  }
  if (((a10 | a11) & 1) != 0)
  {
    v29 = a11;
    v27 = a10;
  }
  else
  {
    v50 = a10;
    v19 = a11;
    do
    {
      v45 = v19 >> 1;
      if (v13)
      {
        v20 = v50 & 0xFFFFFFFFFFFFFFFELL;
        if (v45 <= 1)
          v21 = 1;
        else
          v21 = v19 >> 1;
        v47 = 0;
        v48 = v21;
        v49 = v19;
        do
        {
          if (v12)
          {
            v22 = 0;
            v23 = v20 + v14 * v47;
            v24 = v46 * (2 * v45 + 2 * v47);
            do
            {
              if (v19 >= 2)
              {
                v25 = *(_QWORD *)(v11 + 40) + 2 * v22;
                v26 = v48;
                do
                {
                  memcpy(*(void **)(v11 + 8), (const void *)(v25 + v23), v20);
                  memcpy((void *)(v25 + v23), (const void *)(v25 + v24), v20);
                  result = (char *)memcpy((void *)(v25 + v24), *(const void **)(v11 + 8), v20);
                  v25 += v14;
                  --v26;
                }
                while (v26);
              }
              v19 = v49;
              v22 = (int)v22 + (int)v50;
              v12 = a10;
            }
            while (v22 < a10);
          }
          v13 = a11;
          v47 = (int)v47 + (int)v19;
        }
        while (v47 < a11);
      }
      v27 = v50 >> 1;
      v28 = v50 | v19;
      v50 >>= 1;
      v29 = v45;
      v19 = v45;
    }
    while ((v28 & 2) == 0);
  }
  *(_QWORD *)(v11 + 48) = v27;
  *(_QWORD *)(v11 + 56) = v29;
  if (v27 == 1 && v29 == 1)
    return (char *)memcpy(a2, *(const void **)(v11 + 40), (a6 & 0xFFFFFFFFFFFFFFFELL) * v13);
  v30 = a2;
  if (v29 - 1 < v13 && v27)
  {
    v31 = 0;
    v32 = v12 / v27;
    v33 = *(char **)(v11 + 40);
    if (v12 / v27 <= 1)
      v32 = 1;
    v34 = v13 / v29;
    if (v13 / v29 <= 1)
      v34 = 1;
    do
    {
      if (v27 <= v12)
      {
        v35 = 0;
        result = v33;
        v36 = v30;
        do
        {
          v37 = 0;
          v38 = result;
          v39 = v36;
          do
          {
            v40 = 0;
            v41 = v39;
            do
            {
              *v41 = *(_WORD *)&v38[2 * v40++];
              v41 += a7 >> 1;
            }
            while (v27 != v40);
            ++v39;
            ++v37;
            v38 += v14;
          }
          while (v37 != v29);
          v36 += v29;
          ++v35;
          result += 2 * v27;
        }
        while (v35 != v32);
      }
      v30 += 2 * v27 * (a7 >> 1);
      ++v31;
      v33 += 2 * v29 * v46;
    }
    while (v31 != v34);
  }
  return result;
}

char *PixelShuffler_imageTranspose(uint64_t a1, char *a2, void *__src, size_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  unint64_t v8;
  char *result;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  size_t v15;
  size_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  size_t __n;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  int v41;
  size_t v42;

  v8 = a5;
  __n = a6 * a5;
  result = (char *)memcpy(*(void **)(a1 + 40), __src, a6 * a5);
  v12 = v8;
  v42 = a4;
  if (((a4 | v8) & 1) == 0)
  {
    v13 = v8;
    v37 = v8;
    do
    {
      v41 = a4;
      a4 >>= 1;
      v36 = v13 >> 1;
      if (v8)
      {
        v14 = v13 >> 1;
        if (v36 <= 1)
          v14 = 1;
        v38 = 0;
        v39 = v14;
        v40 = v13;
        do
        {
          if (v42)
          {
            v15 = 0;
            v16 = a4 + v38 * a6;
            v17 = a6 * (v36 + v38);
            do
            {
              if (v13 >= 2)
              {
                v18 = *(_QWORD *)(a1 + 40) + v15;
                v19 = v39;
                do
                {
                  memcpy(*(void **)(a1 + 8), (const void *)(v18 + v16), a4);
                  memcpy((void *)(v18 + v16), (const void *)(v18 + v17), a4);
                  result = (char *)memcpy((void *)(v18 + v17), *(const void **)(a1 + 8), a4);
                  v18 += a6;
                  --v19;
                }
                while (v19);
              }
              v13 = v40;
              v15 = (int)v15 + v41;
            }
            while (v15 < v42);
          }
          v8 = v37;
          v38 = (int)v38 + (int)v13;
        }
        while (v38 < v37);
      }
      v20 = v41 | v13;
      v12 = v36;
      v13 = v36;
    }
    while ((v20 & 2) == 0);
  }
  *(_QWORD *)(a1 + 48) = a4;
  *(_QWORD *)(a1 + 56) = v12;
  if (a4 == 1 && v12 == 1)
    return (char *)memcpy(a2, *(const void **)(a1 + 40), __n);
  v21 = a2;
  if (v12 <= v8)
  {
    v22 = 0;
    v23 = v42 / a4;
    v24 = *(_QWORD *)(a1 + 40);
    if (v42 / a4 <= 1)
      v23 = 1;
    v25 = v8 / v12;
    if (v8 / v12 <= 1)
      v25 = 1;
    do
    {
      if (a4 <= v42)
      {
        v26 = 0;
        v27 = v21;
        v28 = v24;
        do
        {
          v29 = 0;
          result = v27;
          v30 = v28;
          do
          {
            v31 = 0;
            v32 = result;
            do
            {
              *v32 = *(_BYTE *)(v30 + v31);
              v32 += a7;
              ++v31;
            }
            while (a4 != v31);
            v30 += a6;
            ++result;
            ++v29;
          }
          while (v29 != v12);
          v28 += a4;
          v27 += v12;
          ++v26;
        }
        while (v26 != v23);
      }
      v24 += v12 * a6;
      v21 += a4 * a7;
      ++v22;
    }
    while (v22 != v25);
  }
  return result;
}

char *PixelShuffler_imageTranspose_uint16(uint64_t a1, char *a2, void *__src, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v7;
  char *result;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  uint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _WORD *v29;
  uint64_t v30;
  uint64_t v31;
  _WORD *v32;
  uint64_t v33;
  _WORD *v34;
  size_t v36;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;

  v7 = a5;
  v39 = a6 >> 1;
  v36 = 2 * a5 * (a6 >> 1);
  result = (char *)memcpy(*(void **)(a1 + 40), __src, v36);
  v11 = v7;
  v45 = a4;
  v12 = a4;
  if (((a4 | v7) & 1) == 0)
  {
    v13 = 2 * v39;
    v44 = a4;
    v14 = v7;
    v40 = v7;
    do
    {
      v38 = v14 >> 1;
      if (v7)
      {
        v15 = v44 & 0xFFFFFFFFFFFFFFFELL;
        if (v38 <= 1)
          v16 = 1;
        else
          v16 = v14 >> 1;
        v41 = 0;
        v42 = v16;
        v43 = v14;
        do
        {
          if (v45)
          {
            v17 = 0;
            v18 = v15 + v13 * v41;
            v19 = v39 * (2 * v38 + 2 * v41);
            do
            {
              if (v14 >= 2)
              {
                v20 = *(_QWORD *)(a1 + 40) + 2 * v17;
                v21 = v42;
                do
                {
                  memcpy(*(void **)(a1 + 8), (const void *)(v20 + v18), v15);
                  memcpy((void *)(v20 + v18), (const void *)(v20 + v19), v15);
                  result = (char *)memcpy((void *)(v20 + v19), *(const void **)(a1 + 8), v15);
                  v20 += v13;
                  --v21;
                }
                while (v21);
              }
              v14 = v43;
              v17 = (int)v17 + (int)v44;
            }
            while (v17 < v45);
          }
          v7 = v40;
          v41 = (int)v41 + (int)v14;
        }
        while (v41 < v40);
      }
      v12 = v44 >> 1;
      v22 = v44 | v14;
      v44 >>= 1;
      v11 = v38;
      v14 = v38;
    }
    while ((v22 & 2) == 0);
  }
  *(_QWORD *)(a1 + 48) = v12;
  *(_QWORD *)(a1 + 56) = v11;
  if (v12 == 1 && v11 == 1)
    return (char *)memcpy(a2, *(const void **)(a1 + 40), v36);
  v23 = a2;
  if (v11 <= v7)
  {
    v24 = 0;
    v25 = v45 / v12;
    v26 = *(_QWORD *)(a1 + 40);
    if (v45 / v12 <= 1)
      v25 = 1;
    v27 = v7 / v11;
    if (v7 / v11 <= 1)
      v27 = 1;
    do
    {
      result = (char *)v45;
      if (v12 <= v45)
      {
        result = 0;
        v28 = v26;
        v29 = v23;
        do
        {
          v30 = 0;
          v31 = v28;
          v32 = v29;
          do
          {
            v33 = 0;
            v34 = v32;
            do
            {
              *v34 = *(_WORD *)(v31 + 2 * v33++);
              v34 += a7 >> 1;
            }
            while (v12 != v33);
            ++v32;
            ++v30;
            v31 += 2 * v39;
          }
          while (v30 != v11);
          v29 += v11;
          ++result;
          v28 += 2 * v12;
        }
        while (result != (char *)v25);
      }
      v23 += 2 * v12 * (a7 >> 1);
      ++v24;
      v26 += 2 * v11 * v39;
    }
    while (v24 != v27);
  }
  return result;
}

vImage_Error PixelShuffler_yuv420TransposeAndFlipHorizontally(uint64_t a1, char *a2, char *a3, void *__src, void *a5, size_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, unint64_t a11)
{
  char *v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  unint64_t v23;
  unint64_t v24;

  v15 = a2;
  PixelShuffler_imageTranspose(a1, a2, __src, a6, a7, a8, a9);
  if (a6)
  {
    v17 = 0;
    v18 = (a7 + 1) >> 1;
    v19 = (uint64_t)&v15[a7 - 1];
    do
    {
      if ((a7 & 1) != v18)
      {
        v20 = 0;
        v21 = v15;
        do
        {
          v22 = *v21;
          *v21++ = *(_BYTE *)(v19 + v20);
          *(_BYTE *)(v19 + v20--) = v22;
        }
        while ((a7 & 1) - v18 != v20);
      }
      v19 += a9;
      v15 += a9;
      ++v17;
    }
    while (v17 != a6);
  }
  v23 = a7 >> 1;
  v24 = a6 >> 1;
  PixelShuffler_imageTranspose_uint16(a1, a3, a5, v24, v23, a10, a11);
  return PixelShuffler_imageFlipHorizontally_uint16(a3, v23, v24, a11);
}

vImage_Error PixelShuffler_dirRot90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, size_t a6, uint64_t a7, uint64_t a8, vImagePixelCount a9, vImagePixelCount a10)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = (void *)(a2 + a7 + a8 * a6);
  src.height = a10;
  src.width = a9;
  src.rowBytes = a6;
  dest.data = (void *)(a1 + a8 + a7 * a5);
  dest.height = a9;
  dest.width = a10;
  dest.rowBytes = a5;
  if (vImageRotate90_Planar8(&src, &dest, 3u, 0, 0))
  {
    printf("ERROR: Y vImage rotate err=%d\n");
  }
  else
  {
    result = vImageHorizontalReflect_Planar8(&dest, &dest, 2u);
    if (!result)
      return result;
    printf("ERROR: Y vImage horizontal reflection err=%d\n");
  }
  return 0xFFFFFFFFLL;
}

vImage_Error PixelShuffler_invRot90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, size_t a6, uint64_t a7, uint64_t a8, vImagePixelCount a9, vImagePixelCount a10)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = (void *)(a2 + a8 + a7 * a6);
  src.height = a9;
  src.width = a10;
  src.rowBytes = a6;
  dest.data = (void *)(a1 + a7 + a8 * a5);
  dest.height = a10;
  dest.width = a9;
  dest.rowBytes = a5;
  if (vImageRotate90_Planar8(&src, &dest, 3u, 0, 0))
  {
    printf("ERROR: Y vImage rotate err=%d\n");
  }
  else
  {
    result = vImageHorizontalReflect_Planar8(&dest, &dest, 2u);
    if (!result)
      return result;
    printf("ERROR: Y vImage horizontal reflection err=%d\n");
  }
  return 0xFFFFFFFFLL;
}

vImage_Error PixelShuffler_yuv420TransposeAndFlipHorizontallyRoi(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, size_t a8, size_t a9, size_t a10, size_t a11, unint64_t a12, unint64_t a13, vImagePixelCount a14, vImagePixelCount a15)
{
  vImage_Error v17;
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = (void *)(a4 + a12 + a13 * a8);
  src.height = a15;
  src.width = a14;
  src.rowBytes = a8;
  dest.data = a2;
  dest.height = a14;
  dest.width = a15;
  dest.rowBytes = a9;
  v17 = vImageRotate90_Planar8(&src, &dest, 3u, 0, 0);
  if (v17)
    printf("ERROR: Y vImage rotate err=%d\n", v17);
  src.data = (void *)(a5 + (a12 >> 1) + (a13 >> 1) * a10);
  src.height = a15 >> 1;
  src.width = a14 >> 1;
  src.rowBytes = a10;
  dest.data = a3;
  dest.height = a14 >> 1;
  dest.width = a15 >> 1;
  dest.rowBytes = a11;
  result = vImageRotate90_Planar16U(&src, &dest, 3u, 0, 0);
  if (result)
    return printf("ERROR: Y vImage rotate err=%d\n", result);
  return result;
}

vImage_Error PixelShuffler_yuv420TransposeRoi(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, size_t a8, size_t a9, size_t a10, size_t a11, unint64_t a12, unint64_t a13, vImagePixelCount a14, vImagePixelCount a15)
{
  vImage_Error v17;
  vImage_Error v18;
  vImage_Error v19;
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = (void *)(a4 + a12 + a13 * a8);
  src.height = a15;
  src.width = a14;
  src.rowBytes = a8;
  dest.data = a2;
  dest.height = a14;
  dest.width = a15;
  dest.rowBytes = a9;
  v17 = vImageRotate90_Planar8(&src, &dest, 3u, 0, 0);
  if (v17)
    printf("ERROR: Y vImage rotate err=%d\n", v17);
  v18 = vImageHorizontalReflect_Planar8(&dest, &dest, 2u);
  if (v18)
    printf("ERROR: Y vImage horizontal reflection err=%d\n", v18);
  src.data = (void *)(a5 + (a12 >> 1) + (a13 >> 1) * a10);
  src.height = a15 >> 1;
  src.width = a14 >> 1;
  src.rowBytes = a10;
  dest.data = a3;
  dest.height = a14 >> 1;
  dest.width = a15 >> 1;
  dest.rowBytes = a11;
  v19 = vImageRotate90_Planar16U(&src, &dest, 3u, 0, 0);
  if (v19)
    printf("ERROR: Y vImage rotate err=%d\n", v19);
  result = vImageHorizontalReflect_Planar16U(&dest, &dest, 2u);
  if (result)
    return printf("ERROR: Y vImage horizontal reflection err=%d\n", result);
  return result;
}

vImage_Error PixelShuffler_yuv420FlipHorizontally(__CVBuffer *a1, unint64_t *a2, _QWORD *a3, unint64_t *a4, unint64_t *a5)
{
  size_t BytesPerRowOfPlane;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  vImagePixelCount v16;
  vImagePixelCount v17;
  vImage_Error v18;
  char *BaseAddressOfPlane;
  char *v21;
  vImage_Buffer dest;

  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  v21 = (char *)CVPixelBufferGetBaseAddressOfPlane(a1, 1uLL);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  v11 = CVPixelBufferGetBytesPerRowOfPlane(a1, 1uLL);
  v12 = *a5;
  v13 = (*a2 + 1) & 0xFFFFFFFFFFFFFFFELL;
  v14 = *a4 + 1;
  v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
  if (*a3 <= v13)
    v16 = 0;
  else
    v16 = (*a3 - v13 + 1) & 0xFFFFFFFFFFFFFFFELL;
  if (v12 <= v15)
    v17 = 0;
  else
    v17 = (v12 - v15 + 1) & 0xFFFFFFFFFFFFFFFELL;
  *a2 = v13;
  *a3 = v13 + v16 - 1;
  *a4 = v15;
  *a5 = v15 + v17 - 1;
  dest.data = &BaseAddressOfPlane[v13 + v15 * BytesPerRowOfPlane];
  dest.height = v17;
  dest.width = v16;
  dest.rowBytes = BytesPerRowOfPlane;
  v18 = vImageHorizontalReflect_Planar8(&dest, &dest, 2u);
  if (v18)
    printf("ERROR: Y vImage panorama horizontal reflection err=%d\n", v18);
  return PixelShuffler_imageFlipHorizontally_uint16(&v21[v13 + (v14 >> 1) * v11], v16 >> 1, v17 >> 1, v11);
}

uint64_t PixelShuffler_yuv420ExposureMap()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  float v5;
  float v6;
  __CVBuffer *v7;
  __CVBuffer *v8;
  float *v9;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  int v12;
  float v13;
  char *BaseAddressOfPlane;
  char *v15;
  uint64_t v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  float v24;
  float v25;
  _BYTE *v26;
  float v27;
  float v28;
  float v29;
  int32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  uint64_t v33;
  float64x2_t v34;
  int32x4_t v35;
  int32x4_t v36;
  int32x4_t v37;
  float32x4_t v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  size_t i;
  size_t v43;
  char *v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  _BYTE *v70;
  int v71;
  _BYTE *v72;
  _BYTE *v73;
  _BYTE *v74;
  __CVBuffer *pixelBuffer;
  size_t v77;
  float64x2_t v78;
  _BYTE v79[65792];
  uint64_t v80;

  v0 = MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (float *)v0;
  v80 = *MEMORY[0x24BDAC8D0];
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(v7, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v8, 0);
  v77 = CVPixelBufferGetBytesPerRowOfPlane(v8, 1uLL);
  CVPixelBufferLockBaseAddress(v8, 0);
  v12 = v2 - v4;
  if (v2 - v4 < 0)
    v12 = v4 - v2;
  v13 = fminf(v9[529]* (float)((float)((float)((float)v12 * 0.00024414) / v9[530])* (float)((float)((float)v12 * 0.00024414) / v9[530])), 1.0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(v8, 0);
  pixelBuffer = v8;
  v15 = (char *)CVPixelBufferGetBaseAddressOfPlane(v8, 1uLL);
  v16 = 0;
  if (v6 >= 1.0)
  {
    do
    {
      v20 = powf((float)(int)v16, 2.2);
      v21 = powf(v6, v9[v16 + 16]);
      v22 = powf(v20 * v21, 0.45455);
      if (v22 > 255.0)
        v22 = 255.0;
      v79[v16++ + 0x10000] = (int)v22;
    }
    while (v16 != 256);
  }
  else
  {
    do
    {
      v17 = powf((float)(int)v16, 2.2);
      v18 = powf(v6, v9[v16 + 272]);
      v19 = powf(v17 * v18, 0.45455);
      if (v19 > 255.0)
        v19 = 255.0;
      v79[v16++ + 0x10000] = (int)v19;
    }
    while (v16 != 256);
    v6 = 1.0 / v6;
  }
  v23 = 0;
  v24 = fminf(powf(v6, v13), v9[531]);
  v25 = v9[528];
  v26 = v79;
  v78 = (float64x2_t)vdupq_n_s64(0xC060000000000000);
  do
  {
    v27 = (float)(int)v23 - v25;
    if (v27 < 0.0)
      v27 = 0.0;
    v28 = v27 / (255.0 - v25);
    v29 = powf(v24, v28);
    v30.i64[0] = 0x1000000010;
    v30.i64[1] = 0x1000000010;
    v31.i64[0] = 0x4300000043000000;
    v31.i64[1] = 0x4300000043000000;
    v32 = (int32x4_t)xmmword_22764BA80;
    v33 = 0;
    v34 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v29), 0);
    v35 = (int32x4_t)xmmword_22764BA70;
    v36 = (int32x4_t)xmmword_22764BA60;
    v37 = (int32x4_t)xmmword_22764BA50;
    do
    {
      v38 = vcvtq_f32_s32(v37);
      v39 = vcvtq_f32_s32(v36);
      v40 = vcvtq_f32_s32(v35);
      v41 = vcvtq_f32_s32(v32);
      *(int16x4_t *)v41.f32 = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vrndpq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v41.f32), v78), v34)), vdivq_f64(vaddq_f64(vcvt_hight_f64_f32(v41), v78), v34))), v31)));
      *(int16x4_t *)v39.f32 = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vrndpq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v39.f32), v78), v34)), vdivq_f64(vaddq_f64(vcvt_hight_f64_f32(v39), v78), v34))), v31)));
      *(int16x4_t *)&v41.u32[2] = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vrndpq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v40.f32), v78), v34)), vdivq_f64(vaddq_f64(vcvt_hight_f64_f32(v40), v78), v34))), v31)));
      *(int16x4_t *)&v39.u32[2] = vmovn_s32(vcvtq_s32_f32(vaddq_f32(vrndpq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(vaddq_f64(vcvtq_f64_f32(*(float32x2_t *)v38.f32), v78), v34)), vdivq_f64(vaddq_f64(vcvt_hight_f64_f32(v38), v78), v34))), v31)));
      *(int8x16_t *)&v26[v33] = vuzp1q_s8((int8x16_t)v41, (int8x16_t)v39);
      v33 += 16;
      v32 = vaddq_s32(v32, v30);
      v35 = vaddq_s32(v35, v30);
      v36 = vaddq_s32(v36, v30);
      v37 = vaddq_s32(v37, v30);
    }
    while (v33 != 256);
    ++v23;
    v26 += 256;
  }
  while (v23 != 256);
  if (HeightOfPlane)
  {
    for (i = 0; i < HeightOfPlane; i += 2)
    {
      if (BytesPerRowOfPlane)
      {
        v43 = 0;
        v44 = &v15[v77 * (i >> 1)];
        v45 = &BaseAddressOfPlane[BytesPerRowOfPlane];
        do
        {
          v46 = *(_QWORD *)&BaseAddressOfPlane[v43];
          v47 = v46;
          v48 = BYTE1(v46);
          v49 = BYTE2(v46);
          v50 = BYTE3(v46);
          v51 = BYTE4(v46);
          v52 = BYTE5(v46);
          v53 = BYTE6(v46);
          v54 = v79[BYTE1(v46) + 0x10000];
          v55 = v79[BYTE2(v46) + 0x10000];
          v56 = v79[BYTE3(v46) + 0x10000];
          v57 = v79[BYTE4(v46) + 0x10000];
          v58 = v79[BYTE5(v46) + 0x10000];
          v59 = v79[BYTE6(v46) + 0x10000];
          v46 >>= 56;
          *(_QWORD *)&BaseAddressOfPlane[v43] = v79[v47 + 0x10000] | (unint64_t)(v54 << 8) | (v55 << 16) | (v56 << 24) | (v57 << 32) | (v58 << 40) | (v59 << 48) | ((unint64_t)v79[v46 + 0x10000] << 56);
          v60 = *(_QWORD *)&v45[v43];
          v61 = HIBYTE(v60);
          v62 = v60;
          v63 = BYTE1(v60);
          v64 = BYTE2(v60);
          v65 = BYTE3(v60);
          v66 = BYTE4(v60);
          v67 = BYTE5(v60);
          v68 = BYTE6(v60);
          *(_QWORD *)&v45[v43] = v79[v62 + 0x10000] | ((unint64_t)v79[v63 + 0x10000] << 8) | ((unint64_t)v79[v64 + 0x10000] << 16) | ((unint64_t)v79[v65 + 0x10000] << 24) | ((unint64_t)v79[v66 + 0x10000] << 32) | ((unint64_t)v79[v67 + 0x10000] << 40) | ((unint64_t)v79[v68 + 0x10000] << 48) | ((unint64_t)v79[v61 + 0x10000] << 56);
          v69 = &v44[v43];
          v70 = &v79[((v48 + (_DWORD)v47 + (_DWORD)v62 + (_DWORD)v63) << 6) & 0x1FF00];
          *v69 = v70[v44[v43]];
          v71 = v51 + v52 + v67 + v66;
          v72 = &v79[((v49 + v50 + (_DWORD)v65 + (_DWORD)v64) << 6) & 0x1FF00];
          LOBYTE(v52) = v72[v44[v43 + 2]];
          v69[1] = v70[v44[v43 + 1]];
          v69[2] = v52;
          v69[3] = v72[v44[v43 + 3]];
          v73 = &v79[(v71 << 6) & 0x1FF00];
          v69[4] = v73[v44[v43 + 4]];
          v69[5] = v73[v44[v43 + 5]];
          v74 = &v79[((v53 + (_DWORD)v46 + (_DWORD)v61 + (_DWORD)v68) << 6) & 0x1FF00];
          v69[6] = v74[v44[v43 + 6]];
          v69[7] = v74[v44[v43 + 7]];
          v43 += 8;
        }
        while (v43 < BytesPerRowOfPlane);
      }
      BaseAddressOfPlane += 2 * BytesPerRowOfPlane;
    }
  }
  return CVPixelBufferUnlockBaseAddress(pixelBuffer, 0);
}

_QWORD *Blending_constructor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;

  v19 = malloc_type_calloc(0x130uLL, 1uLL, 0x289F9A6FuLL);
  if (!v19)
    goto LABEL_4;
  *v19 = a9;
  v19[1] = a10;
  v19[2] = a9;
  v19[3] = a10;
  v19[4] = a10 * a9;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4 * a3;
  v19[9] = a4;
  v19[15] = 0;
  v19[16] = a1;
  v19[10] = a6;
  v19[11] = a7;
  v19[12] = a8 * a7;
  v19[13] = a8;
  v19[17] = a5;
  *((_DWORD *)v19 + 74) = 1064514355;
  v20 = Stitcher_constructor(a9, a10, a11);
  v19[15] = v20;
  if (v20)
  {
    v21 = Stitcher_maxMinOverlapWidth(v20);
    v19[5] = malloc_type_malloc(4 * v21 + 4, 0x100004052888210uLL);
  }
  else
  {
LABEL_4:
    Blending_destructor(v19);
    return 0;
  }
  return v19;
}

void Blending_destructor(_QWORD *a1)
{
  void **v2;
  void *v3;

  if (a1)
  {
    v2 = (void **)a1[15];
    if (v2)
      Stitcher_destructor(v2);
    v3 = (void *)a1[5];
    if (v3)
      free(v3);
    free(a1);
  }
}

uint64_t Blending_setDefaults(uint64_t a1, int *a2)
{
  return Stitcher_setDefaults(*(uint64_t **)(a1 + 120), a2);
}

_QWORD *Blending_zero()
{
  _QWORD *result;

  result = malloc_type_calloc(0x130uLL, 1uLL, 0x289F9A6FuLL);
  if (result)
    result[15] = 0;
  return result;
}

int8x16_t Blending_start(uint64_t a1, uint64_t a2, __CVBuffer *a3, __CVBuffer *a4, float a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19, int a20,int a21,int a22,unint64_t a23)
{
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64x2_t v33;
  int8x16_t result;
  int v35;

  v27 = (unint64_t)(*(_QWORD *)(a1 + 56) + 1) >> 1;
  *(float *)(a1 + 148) = a7;
  *(float *)(a1 + 152) = (float)v27;
  Blending_overlap(a1, a23, a22, 0, a5, a6, a7, a8);
  sub_227624A3C(a15, a2, a16, a3, a4, *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 200), *(_DWORD *)(a1 + 224), *(_QWORD *)(a1 + 228), HIDWORD(*(_QWORD *)(a1 + 228)), *(_DWORD *)(a1 + 236), v35, a18, a19, a20);
  v28 = *(_QWORD *)(a1 + 272);
  v29 = *(int *)(a1 + 204);
  if (v28 >= v29)
    v28 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v28;
  v30 = *(_QWORD *)(a1 + 248);
  v31 = *(int *)(a1 + 192);
  if (v30 >= v31)
    v30 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v30;
  v32 = *(_QWORD *)(a1 + 196);
  v33.i64[0] = (int)v32;
  v33.i64[1] = SHIDWORD(v32);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v33), *(int8x16_t *)(a1 + 256), (int8x16_t)v33);
  *(_QWORD *)(a1 + 160) = v31;
  result = vextq_s8((int8x16_t)v33, (int8x16_t)v33, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v29;
  ++*(_DWORD *)(a1 + 112);
  return result;
}

uint64_t Blending_overlap(uint64_t a1, unint64_t a2, int a3, int a4, float a5, float a6, float a7, float a8)
{
  float v8;
  float v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;

  if (a4)
  {
    v9 = *(float *)(a1 + 148);
    v8 = *(float *)(a1 + 152);
  }
  else
  {
    if (a5 < 0.0 && !*(_DWORD *)(a1 + 280))
    {
      *(_DWORD *)(a1 + 280) = 1;
      *(_DWORD *)(a1 + 284) = *(_DWORD *)(a1 + 148);
    }
    v9 = *(float *)(a1 + 148) + a5;
    v8 = *(float *)(a1 + 152) + a6;
    *(float *)(a1 + 148) = v9;
    *(float *)(a1 + 152) = v8;
    if (v9 > *(float *)(a1 + 284))
    {
      *(float *)(a1 + 284) = v9;
      *(_DWORD *)(a1 + 280) = 0;
    }
  }
  v10 = (int)(float)((float)(v9 - a7) + 0.5);
  v11 = *(_DWORD *)(a1 + 48);
  if (v10 >= v11 || v10 + (int)a2 < 1)
    return 0;
  v13 = (int)(float)((float)(v8 - a8) + 0.5);
  v14 = *(_DWORD *)(a1 + 56);
  if (v13 >= v14 || v13 + a3 < 1)
    return 0;
  v16 = -v10 & ~(-v10 >> 31);
  v17 = v10 & ~(v10 >> 31);
  v18 = v11 - v17;
  if (v11 - v17 >= (int)a2 - v16)
    v18 = a2 - v16;
  v19 = -v13 & ~(-v13 >> 31);
  v20 = v13 & ~(v13 >> 31);
  v21 = v14 - v20;
  if (v14 - v20 >= a3 - v19)
    v21 = a3 - v19;
  v22 = *(_DWORD *)(a1 + 160);
  if (v17 > v22)
    v22 = v17;
  v23 = *(_DWORD *)(a1 + 168);
  if (v20 > v23)
    v23 = v20;
  v24 = *(_DWORD *)(a1 + 176);
  if (v18 + v17 <= v24)
    v24 = v18 + v17 - 1;
  v25 = v21 + v20 <= *(_DWORD *)(a1 + 184) ? v21 + v20 - 1 : *(_DWORD *)(a1 + 184);
  v26 = v24 - v22;
  if (v24 < v22)
    v26 = -1;
  v27 = v26 + 1;
  if (!a4 && *(int *)(a1 + 112) >= 1 && ((float)((float)v27 / (float)a2) > 0.9 || *(_DWORD *)(a1 + 280)))
    return 0;
  *(_DWORD *)(a1 + 192) = v17;
  *(_DWORD *)(a1 + 196) = v18 + v17 - 1;
  *(_DWORD *)(a1 + 200) = v20;
  *(_DWORD *)(a1 + 204) = v21 + v20 - 1;
  *(_DWORD *)(a1 + 208) = v22;
  *(_DWORD *)(a1 + 212) = v23;
  *(_DWORD *)(a1 + 216) = v24;
  *(_DWORD *)(a1 + 220) = v25;
  *(_DWORD *)(a1 + 224) = v16;
  *(_DWORD *)(a1 + 228) = v19;
  *(_DWORD *)(a1 + 232) = v18;
  *(_DWORD *)(a1 + 236) = v21;
  v28 = 1;
  *(_DWORD *)(a1 + 240) = v27;
  *(_DWORD *)(a1 + 244) = v25 - v23 + 1;
  return v28;
}

uint64_t sub_227624A3C(uint64_t result, uint64_t a2, int a3, CVBufferRef sourceBuffer, CVBufferRef destinationBuffer, int a6, int a7, int a8, int a9, int a10, int a11, int a12, int a13, int a14, int a15)
{
  signed int v15;
  signed int v16;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t v29;
  size_t v30;
  void *BaseAddressOfPlane;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  size_t WidthOfPlane;
  char *v36;
  char *v37;
  uint64_t v38;
  size_t v39;
  int v40;

  v15 = a11 & 0xFFFFFFFE;
  v16 = a10 & 0xFFFFFFFE;
  if ((a10 & 0xFFFFFFFE) != 0 && v15 != 0)
  {
    v24 = result;
    v25 = a13 + (uint64_t)a9;
    v40 = a15 + a8;
    CVBufferPropagateAttachments(sourceBuffer, destinationBuffer);
    if (a2)
    {
      if (a3 == 1)
      {
        v26 = (_QWORD *)MEMORY[0x24BDBD268];
        goto LABEL_16;
      }
      if (a3 == 2)
      {
        v26 = (_QWORD *)MEMORY[0x24BDBD270];
LABEL_16:
        MEMORY[0x2276B46D4](a2, *MEMORY[0x24BDF9610], *v26);
        CVPixelBufferUnlockBaseAddress(sourceBuffer, 1uLL);
        CVPixelBufferUnlockBaseAddress(destinationBuffer, 0);
        MEMORY[0x2276B46E0](a2, sourceBuffer, destinationBuffer, (double)(int)v25, (double)v40, (double)v15, (double)v16, (double)a6, (double)a7, (double)v16, (double)v15);
        CVPixelBufferLockBaseAddress(destinationBuffer, 0);
        return CVPixelBufferLockBaseAddress(sourceBuffer, 1uLL);
      }
      return puts("ERROR: panorama direction unknown");
    }
    v38 = v24;
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(destinationBuffer, 0);
    v39 = CVPixelBufferGetBytesPerRowOfPlane(destinationBuffer, 1uLL);
    v37 = (char *)CVPixelBufferGetBaseAddressOfPlane(destinationBuffer, 0) + a6 + BytesPerRowOfPlane * a7;
    v36 = (char *)CVPixelBufferGetBaseAddressOfPlane(destinationBuffer, 1uLL)
        + (a6 & 0xFFFFFFFFFFFFFFFELL)
        + v39 * ((uint64_t)a7 >> 1);
    CVPixelBufferLockBaseAddress(sourceBuffer, 1uLL);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(sourceBuffer, 0);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(sourceBuffer, 0);
    v29 = CVPixelBufferGetBytesPerRowOfPlane(sourceBuffer, 0);
    v30 = CVPixelBufferGetBytesPerRowOfPlane(sourceBuffer, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(sourceBuffer, 0);
    v32 = CVPixelBufferGetBaseAddressOfPlane(sourceBuffer, 1uLL);
    v33 = (uint64_t)BaseAddressOfPlane + (int)v25 + v29 * v40;
    v34 = (uint64_t)v32 + (v25 & 0xFFFFFFFFFFFFFFFELL) + v30 * ((uint64_t)v40 >> 1);
    if (a3 == 2)
    {
      PixelShuffler_yuv420TransposeRoi(v38, v37, v36, v33, v34, WidthOfPlane, HeightOfPlane, v29, BytesPerRowOfPlane, v30, v39, 0, 0, v15, v16);
    }
    else
    {
      if (a3 != 1)
        return puts("ERROR: panorama direction unknown");
      PixelShuffler_yuv420TransposeAndFlipHorizontallyRoi(v38, v37, v36, v33, v34, WidthOfPlane, HeightOfPlane, v29, BytesPerRowOfPlane, v30, v39, 0, 0, v15, v16);
    }
    return CVPixelBufferUnlockBaseAddress(sourceBuffer, 1uLL);
  }
  return result;
}

int8x16_t Blending_post(uint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64x2_t v6;
  int8x16_t result;

  v1 = *(_QWORD *)(a1 + 272);
  v2 = *(int *)(a1 + 204);
  if (v1 >= v2)
    v1 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v1;
  v3 = *(_QWORD *)(a1 + 248);
  v4 = *(int *)(a1 + 192);
  if (v3 >= v4)
    v3 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v3;
  v5 = *(_QWORD *)(a1 + 196);
  v6.i64[0] = (int)v5;
  v6.i64[1] = SHIDWORD(v5);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v6), *(int8x16_t *)(a1 + 256), (int8x16_t)v6);
  *(_QWORD *)(a1 + 160) = v4;
  result = vextq_s8((int8x16_t)v6, (int8x16_t)v6, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v2;
  return result;
}

int8x16_t Blending_end(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __CVBuffer *a5, __CVBuffer *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, int a15, int a16, int a17, int a18, signed int a19)
{
  uint64_t v25;
  unsigned int v26;
  signed int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64x2_t v37;
  int8x16_t result;
  int v39;

  v25 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 144))
    LODWORD(v25) = v25 + 32;
  v26 = (*(_DWORD *)(a1 + 176) + 1) & 0xFFFFFFFE;
  *(_DWORD *)(a1 + 224) = 0;
  v27 = v25 - v26;
  if ((int)(v25 - v26) >= a19)
    v27 = a19;
  v28 = *(_DWORD *)(a1 + 200);
  v29 = a17 - *(_DWORD *)(a1 + 228);
  if (*(_DWORD *)(a1 + 56) - v28 < v29)
    v29 = *(_DWORD *)(a1 + 56) - v28;
  *(_DWORD *)(a1 + 232) = v27;
  *(_DWORD *)(a1 + 236) = v29;
  *(_DWORD *)(a1 + 192) = v26;
  *(_DWORD *)(a1 + 196) = v26 + v27 - 1;
  *(_DWORD *)(a1 + 204) = v28 + v29 - 1;
  ACTLogMessageImp(1, "Blending_end: xStart=%d, xMax=%d, widthToCopy=%d, xStop=%d, aInRoiHeight=%d, xStartImage=%d\n", v26, v25, v27, v26 + v27 - 1, a19, 0);
  v30 = *(_DWORD *)(a1 + 232);
  v31 = a19 - v30;
  if (a4 != 1)
    v31 = a15;
  sub_227624A3C(a3, a2, a4, a5, a6, *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 200), *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 228), v30, *(_DWORD *)(a1 + 236), v39, a13, a14, v31);
  v32 = *(_QWORD *)(a1 + 272);
  v33 = *(int *)(a1 + 204);
  if (v32 >= v33)
    v32 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v32;
  v34 = *(_QWORD *)(a1 + 248);
  v35 = *(int *)(a1 + 192);
  if (v34 >= v35)
    v34 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v34;
  v36 = *(_QWORD *)(a1 + 196);
  v37.i64[0] = (int)v36;
  v37.i64[1] = SHIDWORD(v36);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v37), *(int8x16_t *)(a1 + 256), (int8x16_t)v37);
  *(_QWORD *)(a1 + 160) = v35;
  result = vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v33;
  return result;
}

uint64_t Blending_updateBlendingMode(uint64_t result, int a2)
{
  *(_DWORD *)(result + 288) = a2;
  return result;
}

int8x16_t Blending_addImage(uint64_t a1, double a2, double a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, int a13)
{
  uint64_t v17;
  uint64_t v18;
  vImagePixelCount v19;
  unsigned int v20;
  float v21;
  uint64x2_t v22;
  vImagePixelCount v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int32x2_t v42;
  BOOL v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  size_t v51;
  uint64_t v52;
  uint64_t i;
  float v54;
  uint64_t v55;
  _BYTE *v56;
  float v57;
  unsigned int v58;
  unsigned int v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  size_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  size_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64x2_t v89;
  int8x16_t result;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  unint64_t v109;
  unint64_t v110;

  *(_DWORD *)(a1 + 288) = a12;
  v101 = *(int *)(a1 + 196);
  v94 = *(int *)(a1 + 204);
  v17 = *(int *)(a1 + 208);
  v18 = *(int *)(a1 + 232);
  v19 = *(unsigned int *)(a1 + 244);
  v103 = *(int *)(a1 + 224);
  v20 = (v17 - *(_DWORD *)(a1 + 192) + v103) & ~(((int)v17 - *(_DWORD *)(a1 + 192) + (int)v103) >> 31);
  v98 = *(int *)(a1 + 212);
  v99 = *(int *)(a1 + 200);
  v100 = *(int *)(a1 + 228);
  v93 = ((_DWORD)v98 - (_DWORD)v99 + (_DWORD)v100) & ~(((int)v98 - (int)v99 + (int)v100) >> 31);
  v92 = v17 & 0xFFFFFFFFFFFFFFFELL;
  v104 = v20 & 0x7FFFFFFE;
  v109 = *(int *)(a1 + 240);
  v95 = *(int *)(a1 + 220);
  v96 = *(int *)(a1 + 192);
  if ((int)v109 <= (int)Stitcher_minOverlapWidth(*(uint64_t **)(a1 + 120), a5) || (int)v19 < 1)
  {
    if ((v109 & 0x80000000) != 0 || (v19 & 0x80000000) != 0 || (int)v18 <= 0)
    {
      v27 = a10;
      v28 = a8;
      v29 = v103;
      v24 = v98;
    }
    else
    {
      v30 = *(_QWORD *)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 128);
      v31 = *(_QWORD *)(a1 + 136);
      if ((int)v98 >= 0)
        v33 = v98;
      else
        v33 = v98 + 1;
      v34 = *(_QWORD *)(a1 + 104);
      v35 = *(_QWORD *)(a1 + 40);
      if ((int)v109 >= 16)
        v36 = 16;
      else
        v36 = v109;
      v106 = v36;
      v29 = v103;
      if ((_DWORD)v109)
      {
        v37 = 0;
        v21 = (float)(int)v106;
        if ((int)v106 <= 1)
          v38 = 1;
        else
          v38 = v106;
        v22 = (uint64x2_t)vdupq_n_s64(v38 - 1);
        v39 = ((_DWORD)v38 + 1) & 0xFFFFFFFE;
        v40 = (int64x2_t)xmmword_22764C2A0;
        v41 = vdupq_n_s64(2uLL);
        do
        {
          v42 = vmovn_s64((int64x2_t)vcgeq_u64(v22, (uint64x2_t)v40));
          if ((v42.i8[0] & 1) != 0)
            *(float *)(v35 + 4 * v37) = (float)(int)v37 / v21;
          if ((v42.i8[4] & 1) != 0)
            *(float *)(v35 + 4 * v37 + 4) = (float)(v37 + 1) / v21;
          v37 += 2;
          v40 = vaddq_s64(v40, v41);
        }
        while (v39 != v37);
      }
      v107 = v19;
      v43 = (int)v19 < 1;
      v27 = a10;
      v28 = a8;
      v24 = v98;
      if (!v43)
      {
        v44 = 0;
        v91 = v27;
        v45 = v27 + v20;
        v46 = v32 + v17 + v30 * v98;
        v47 = v45 + v93 * a8;
        v48 = v31 + (int)v92 + v34 * ((uint64_t)v33 >> 1);
        v49 = v18 - v106;
        v50 = a11 + v104 + (v93 >> 1) * a9;
        v51 = v49;
        if ((int)v106 <= 1)
          v52 = 1;
        else
          v52 = v106;
        v105 = v30;
        do
        {
          if ((_DWORD)v109)
          {
            for (i = 0; i != v52; ++i)
            {
              LOBYTE(v21) = *(_BYTE *)(v46 + i);
              v22.i8[0] = *(_BYTE *)(v47 + i);
              v54 = (float)LODWORD(v21);
              *(float *)v22.i32 = (float)v22.u32[0] - v54;
              v21 = v54 + (float)(*(float *)(v35 + 4 * i) * *(float *)v22.i32);
              *(_BYTE *)(v46 + i) = (int)v21;
            }
          }
          if ((int)v51 > 0)
          {
            memcpy((void *)(v46 + v106), (const void *)(v47 + v106), v51);
            v30 = v105;
          }
          if ((v44 & 1) != 0)
          {
            v61 = a8;
          }
          else
          {
            if ((_DWORD)v109)
            {
              v55 = 0;
              do
              {
                v56 = (_BYTE *)(v48 + v55);
                LOBYTE(v21) = *(_BYTE *)(v48 + v55);
                v57 = (float)LODWORD(v21);
                v22.i8[0] = *(_BYTE *)(v50 + v55);
                *(float *)&v58 = (float)v22.u32[0] - v57;
                *(float *)&v59 = v57 + (float)(*(float *)(v35 + 4 * v55) * *(float *)&v58);
                *v56 = (int)*(float *)&v59;
                LOBYTE(v59) = *(_BYTE *)(v48 + v55 + 1);
                v60 = (float)v59;
                LOBYTE(v58) = *(_BYTE *)(v50 + v55 + 1);
                *(float *)v22.i32 = (float)v58 - v60;
                v21 = v60 + (float)(*(float *)(v35 + 4 * v55) * *(float *)v22.i32);
                v56[1] = (int)v21;
                v55 += 2;
              }
              while (v55 < (int)v106);
            }
            if ((int)v51 > 0)
            {
              memcpy((void *)(v48 + v106), (const void *)(v50 + v106), v51);
              v30 = v105;
            }
            v48 += v30;
            v61 = a8;
            v50 += a8;
          }
          v46 += v30;
          v47 += v61;
          ++v44;
        }
        while (v44 != v107);
        v28 = a8;
        v29 = v103;
        v24 = v98;
        v27 = v91;
      }
    }
  }
  else
  {
    v23 = v19;
    v24 = v98;
    if ((int)v98 >= 0)
      v25 = v98;
    else
      v25 = v98 + 1;
    v26 = a10 + v20;
    v27 = a10;
    v28 = a8;
    Stitcher_pasteImageToReference(*(uint64_t **)(a1 + 120), *(_QWORD *)(a1 + 128) + v17 + *(_QWORD *)(a1 + 72) * v98, *(_QWORD *)(a1 + 136) + v92 + *(_QWORD *)(a1 + 104) * ((uint64_t)v25 >> 1), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v26 + v93 * a8, a11 + v104 + (v93 >> 1) * a9, a8, a4, a7, v18, v109, v23, *(_DWORD *)(a1 + 288), a13);
    v29 = v103;
  }
  v62 = *(_QWORD *)(a1 + 72);
  v63 = v99;
  v64 = *(_QWORD *)(a1 + 128) + v62 * v99;
  v65 = v27 + v100 * v28;
  v66 = v101 - v96 + 1;
  if (v99 >= v24)
  {
    v68 = v94;
  }
  else
  {
    v67 = v24;
    v68 = v94;
    do
    {
      if (v63 <= v94)
      {
        memcpy((void *)(v64 + v96), (const void *)(v65 + v29), v66);
        v67 = v24;
        v65 += v28;
        v62 = *(_QWORD *)(a1 + 72);
      }
      v64 += v62;
      ++v63;
    }
    while (v67 != v63);
  }
  if (v95 + 1 <= v68)
  {
    v69 = (char *)(v65 + v103);
    v70 = v95 + 1;
    do
    {
      memcpy((void *)(v64 + v96), v69, v66);
      v64 += *(_QWORD *)(a1 + 72);
      ++v70;
      v69 += v28;
    }
    while (v70 <= v68);
  }
  if (a11)
  {
    v71 = v68;
    v72 = (v99 + 1) >> 1;
    v73 = v24 + 1;
    v74 = (v71 + 1) >> 1;
    v75 = (v96 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v76 = (v103 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v77 = *(_QWORD *)(a1 + 104);
    v78 = *(_QWORD *)(a1 + 136) + v77 * v72;
    v79 = a11 + ((unint64_t)(v100 + 1) >> 1) * a9;
    v80 = (v101 - v75 + 1) | 1;
    v110 = (unint64_t)(v95 + 1) >> 1;
    if (v72 < v73 >> 1)
    {
      v81 = v73 >> 1;
      do
      {
        if (v72 <= v74)
        {
          memcpy((void *)(v78 + v75), (const void *)(v79 + v76), v80);
          v79 += a9;
          v77 = *(_QWORD *)(a1 + 104);
        }
        v78 += v77;
        ++v72;
      }
      while (v81 != v72);
    }
    v43 = v74 > v110;
    v82 = v74 - v110;
    if (v43)
    {
      v83 = (char *)(v79 + v76);
      do
      {
        memcpy((void *)(v78 + v75), v83, v80);
        v78 += *(_QWORD *)(a1 + 104);
        v83 += a9;
        --v82;
      }
      while (v82);
    }
  }
  v84 = *(_QWORD *)(a1 + 272);
  v85 = *(int *)(a1 + 204);
  if (v84 >= v85)
    v84 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v84;
  v86 = *(_QWORD *)(a1 + 248);
  v87 = *(int *)(a1 + 192);
  if (v86 >= v87)
    v86 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v86;
  v88 = *(_QWORD *)(a1 + 196);
  v89.i64[0] = (int)v88;
  v89.i64[1] = SHIDWORD(v88);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v89), *(int8x16_t *)(a1 + 256), (int8x16_t)v89);
  *(_QWORD *)(a1 + 160) = v87;
  result = vextq_s8((int8x16_t)v89, (int8x16_t)v89, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v85;
  ++*(_DWORD *)(a1 + 112);
  return result;
}

void Blending_reset(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 148) = 0;
  *(_DWORD *)(a1 + 152) = 0;
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = v2;
  *(_QWORD *)(a1 + 248) = v3;
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  if (*(_BYTE *)(a1 + 144))
  {
    ACTLogMessageImp(1, "Blending_reset - padding start to %d", 32);
    *(_QWORD *)(a1 + 160) = 32;
    *(_QWORD *)(a1 + 176) = 32;
  }
  bzero(*(void **)(a1 + 128), *(_QWORD *)(a1 + 64));
  memset(*(void **)(a1 + 136), 128, *(_QWORD *)(a1 + 96));
  *(_DWORD *)(a1 + 292) = 1;
  Stitcher_reset(*(uint64_t **)(a1 + 120));
}

uint64_t Blending_storeM2MTime(uint64_t a1, double a2)
{
  return Stitcher_storeM2MTime(*(_QWORD *)(a1 + 120), a2);
}

uint64_t *Blending_storeIOSurfaceIDs(uint64_t a1, int a2, int a3)
{
  return Stitcher_storeIOSurfaceIDs(*(uint64_t **)(a1 + 120), a2, a3);
}

_QWORD *GaussianScaler_uint16_constructor(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v4 = malloc_type_malloc(0x18uLL, 0x1010040A79CA2DEuLL);
  v5 = v4;
  if (v4)
  {
    *v4 = a1 + 4;
    v4[1] = a2;
    v6 = malloc_type_malloc(16 * (a1 + 4), 0x100004052888210uLL);
    v5[2] = v6;
    if (!v6)
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

void GaussianScaler_uint16_destructor(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
      free(v2);
    free(a1);
  }
}

unint64_t GaussianScaler_uint16_downsample(uint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, unsigned __int16 *a6, unint64_t a7, unint64_t a8, unint64_t a9)
{
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  size_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  char *v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  int v33;
  int v34;
  int v35;
  char v36;
  int v37;
  int v38;
  int v39;
  uint64_t v40;
  unsigned __int16 *v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  int v50;
  unint64_t v51;
  char *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  unsigned __int16 *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  int v69;
  char v70;
  unsigned __int16 *v71;
  unsigned __int16 *v72;
  char v73;
  int v74;
  int v75;
  int v76;
  char v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  unsigned __int16 *v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  unsigned int v90;
  int v91;
  uint64_t v92;
  char *v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  unint64_t v101;
  _BOOL4 v102;
  unint64_t result;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int v114;
  char v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  char v122;
  int v123;
  int v124;
  int v125;
  uint64_t v126;
  unsigned __int16 *v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  uint64_t v135;
  _BOOL4 v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  uint64_t v146;
  unint64_t v147;
  int v148;
  int v149;
  int v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  char v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  char v173;
  int v174;
  int v175;
  int v176;
  uint64_t v177;
  unsigned __int16 *v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  uint64_t v186;
  _BOOL4 v187;
  unsigned __int16 *v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  uint64_t v198;
  unint64_t v199;
  int v200;
  int v201;
  int v202;
  int v203;
  uint64_t v204;
  unint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  unint64_t v211;
  uint64_t v213;
  uint64_t v214;
  unint64_t v215;
  int v217;
  unint64_t v218;
  unint64_t v219;
  uint64_t v220;
  unint64_t v221;
  unint64_t v222;

  v219 = a9 >> 1;
  v11 = a7 >> 1;
  if (a7 >> 1 >= a3)
    v11 = a3;
  v222 = v11;
  v12 = (char *)a1[2];
  v13 = *a1;
  v14 = &v12[4 * *a1];
  v15 = &v14[4 * *a1];
  v16 = &v15[4 * *a1];
  v17 = a7 + 4;
  v18 = 4 * (a7 + 4);
  bzero(v12, v18);
  bzero(v14, v18);
  bzero(v15, v18);
  bzero(v16, v18);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = *a6;
  v24 = v12 + 8;
  v25 = (uint64_t)&v12[8 * v13 + 8];
  v26 = (uint64_t)&v12[4 * v13 + 8];
  v218 = a7 + 2;
  if (a7 != 0 && a7 < 0xFFFFFFFFFFFFFFFELL)
    v27 = a7 + 2;
  else
    v27 = 2;
  v28 = &v12[4 * v27];
  v29 = -2;
  v221 = v17;
  v30 = v17 - v27;
  do
  {
    v31 = 0;
    v32 = 1;
    do
    {
      v33 = v21;
      v34 = v20;
      v35 = v19;
      v36 = v32;
      v21 = v22 + v23;
      v20 = v22 + v23 + v33;
      v19 = v20 + v34;
      v37 = v20 + v34 + v35 + *(_DWORD *)&v12[4 * v31];
      *(_DWORD *)&v12[4 * v31] = v20 + v34 + v35;
      v38 = v37 + *(_DWORD *)&v14[4 * v31];
      *(_DWORD *)&v14[4 * v31] = v37;
      v39 = *(_DWORD *)&v15[4 * v31];
      *(_DWORD *)&v15[4 * v31] = v38;
      *(_DWORD *)&v16[4 * v31] = v38 + v39;
      v31 = 1;
      v22 = v23;
      v32 = 0;
    }
    while ((v36 & 1) != 0);
    if (v218 < 3)
    {
      v22 = v23;
      v41 = a6;
      v49 = 2;
    }
    else
    {
      v40 = 0;
      v41 = a6;
      v22 = v23;
      do
      {
        v42 = v22;
        v43 = v21;
        v44 = v20;
        v45 = v19;
        v22 = a6[v40];
        v21 = v42 + v22;
        v20 = v42 + v22 + v43;
        v19 = v20 + v44;
        v46 = v20 + v44 + v45 + *(_DWORD *)&v24[4 * v40];
        *(_DWORD *)&v24[4 * v40] = v20 + v44 + v45;
        v47 = v46 + *(_DWORD *)(v26 + 4 * v40);
        *(_DWORD *)(v26 + 4 * v40) = v46;
        v48 = *(_DWORD *)(v25 + 4 * v40);
        *(_DWORD *)(v25 + 4 * v40) = v47;
        *(_DWORD *)&v12[12 * v13 + 8 + 4 * v40] = v47 + v48;
        ++v41;
        ++v40;
      }
      while (a7 != v40);
      v49 = a7 + 2;
    }
    if (v221 > v49)
    {
      v50 = *(v41 - 1);
      v51 = v30;
      v52 = v28;
      do
      {
        v53 = v21;
        v54 = v20;
        v55 = v19;
        v21 = v22 + v50;
        v20 = v22 + v50 + v53;
        v19 = v20 + v54;
        v56 = v20 + v54 + v55 + *(_DWORD *)v52;
        *(_DWORD *)v52 = v20 + v54 + v55;
        v57 = v56 + *(_DWORD *)&v52[4 * v13];
        *(_DWORD *)&v52[4 * v13] = v56;
        v58 = *(_DWORD *)&v52[8 * v13];
        *(_DWORD *)&v52[8 * v13] = v57;
        *(_DWORD *)&v52[12 * v13] = v57 + v58;
        v52 += 4;
        v22 = v50;
        --v51;
      }
      while (v51);
      v22 = v50;
    }
  }
  while (!__CFADD__(v29++, 1));
  v214 = v219;
  v60 = &a6[v219];
  v61 = v12 + 8;
  v62 = (uint64_t)&v12[8 * v13 + 8];
  v63 = (uint64_t)&v12[4 * v13 + 8];
  v64 = 2;
  if (v218 > 2)
    v64 = a7 + 2;
  v65 = a7 - v64 + 4;
  v66 = 1;
  v67 = &v12[4 * v64];
  do
  {
    v68 = 0;
    v69 = v22;
    v70 = v66;
    v71 = v60;
    v72 = a6;
    v22 = *a6;
    v73 = 1;
    do
    {
      v74 = v21;
      v75 = v20;
      v76 = v19;
      v77 = v73;
      v21 = v69 + v22;
      v20 = v69 + v22 + v74;
      v19 = v20 + v75;
      v78 = v20 + v75 + v76 + *(_DWORD *)&v12[4 * v68];
      *(_DWORD *)&v12[4 * v68] = v20 + v75 + v76;
      v79 = v78 + *(_DWORD *)&v14[4 * v68];
      *(_DWORD *)&v14[4 * v68] = v78;
      v80 = *(_DWORD *)&v15[4 * v68];
      *(_DWORD *)&v15[4 * v68] = v79;
      *(_DWORD *)&v16[4 * v68] = v79 + v80;
      v68 = 1;
      v69 = v22;
      v73 = 0;
    }
    while ((v77 & 1) != 0);
    if (v218 < 3)
    {
      v82 = v72;
      v90 = 2;
    }
    else
    {
      v81 = 0;
      v82 = v72;
      do
      {
        v83 = v22;
        v84 = v21;
        v85 = v20;
        v86 = v19;
        v22 = v72[v81];
        v21 = v83 + v22;
        v20 = v83 + v22 + v84;
        v19 = v20 + v85;
        v87 = v20 + v85 + v86 + *(_DWORD *)&v61[4 * v81];
        *(_DWORD *)&v61[4 * v81] = v20 + v85 + v86;
        v88 = v87 + *(_DWORD *)(v63 + 4 * v81);
        *(_DWORD *)(v63 + 4 * v81) = v87;
        v89 = *(_DWORD *)(v62 + 4 * v81);
        *(_DWORD *)(v62 + 4 * v81) = v88;
        *(_DWORD *)&v12[12 * v13 + 8 + 4 * v81] = v88 + v89;
        ++v82;
        ++v81;
      }
      while (a7 != v81);
      v90 = a7 + 2;
    }
    if (v221 > v90)
    {
      v91 = *(v82 - 1);
      v92 = v65;
      v93 = v67;
      do
      {
        v94 = v21;
        v95 = v20;
        v96 = v19;
        v21 = v22 + v91;
        v20 = v22 + v91 + v94;
        v19 = v20 + v95;
        v97 = v20 + v95 + v96 + *(_DWORD *)v93;
        *(_DWORD *)v93 = v20 + v95 + v96;
        v98 = v97 + *(_DWORD *)&v93[4 * v13];
        *(_DWORD *)&v93[4 * v13] = v97;
        v99 = *(_DWORD *)&v93[8 * v13];
        *(_DWORD *)&v93[8 * v13] = v98;
        *(_DWORD *)&v93[12 * v13] = v98 + v99;
        v93 += 4;
        v22 = v91;
        --v92;
      }
      while (v92);
      v22 = v91;
    }
    v66 = 0;
    a6 = &v72[v214];
    v60 = &v71[v214];
  }
  while ((v70 & 1) != 0);
  v100 = 0;
  v220 = 0;
  v206 = a5 >> 1;
  if (a8 >> 1 >= a4)
    v101 = a4;
  else
    v101 = a8 >> 1;
  v102 = 1;
  result = 2;
  v211 = v101;
  if (a8 >= 3 && v101)
  {
    v104 = 0;
    v100 = 0;
    v220 = 0;
    v105 = v12 + 8;
    v106 = (uint64_t)&v12[8 * v13 + 8];
    v107 = (uint64_t)&v12[4 * v13 + 8];
    v108 = v12 + 16;
    v109 = (uint64_t)&v12[12 * v13 + 16];
    v110 = (uint64_t)&v12[8 * v13 + 16];
    v102 = 1;
    v111 = 2;
    v112 = (uint64_t)&v12[4 * v13 + 16];
    do
    {
      v207 = v111;
      v113 = 0;
      v72 = v71;
      v114 = *v71;
      v115 = 1;
      v116 = v19;
      v117 = v20;
      v118 = v21;
      do
      {
        v119 = v118;
        v120 = v117;
        v121 = v116;
        v122 = v115;
        v118 = v22 + v114;
        v117 = v22 + v114 + v119;
        v116 = v117 + v120;
        v123 = v117 + v120 + v121 + *(_DWORD *)&v12[4 * v113];
        *(_DWORD *)&v12[4 * v113] = v117 + v120 + v121;
        v124 = v123 + *(_DWORD *)&v14[4 * v113];
        *(_DWORD *)&v14[4 * v113] = v123;
        v125 = *(_DWORD *)&v15[4 * v113];
        *(_DWORD *)&v15[4 * v113] = v124;
        *(_DWORD *)&v16[4 * v113] = v124 + v125;
        v113 = 1;
        v22 = v114;
        v115 = 0;
      }
      while ((v122 & 1) != 0);
      v126 = 0;
      v127 = v72;
      do
      {
        v128 = v114;
        v129 = v118;
        v130 = v117;
        v131 = v116;
        v114 = v72[v126];
        v118 = v128 + v114;
        v117 = v128 + v114 + v129;
        v116 = v117 + v130;
        v132 = v117 + v130 + v131 + *(_DWORD *)&v105[4 * v126];
        *(_DWORD *)&v105[4 * v126] = v117 + v130 + v131;
        v133 = v132 + *(_DWORD *)(v107 + 4 * v126);
        *(_DWORD *)(v107 + 4 * v126) = v132;
        v134 = *(_DWORD *)(v106 + 4 * v126);
        *(_DWORD *)(v106 + 4 * v126) = v133;
        *(_DWORD *)&v12[12 * v13 + 8 + 4 * v126] = v133 + v134;
        ++v127;
        ++v126;
      }
      while (v126 != 2);
      if (v102)
      {
        v100 = 0;
        v104 = (v104 + 1);
        v220 = a2;
        v208 = a2 + 2 * v206;
      }
      else
      {
        v208 = a2;
      }
      v209 = v104;
      if (v218 < 5)
      {
        v136 = 1;
        LODWORD(v147) = 4;
      }
      else
      {
        v135 = 0;
        v136 = 1;
        while (1)
        {
          v137 = v114;
          v138 = v118;
          v139 = v117;
          v140 = v116;
          if (v222 <= v100)
            break;
          v114 = *v127;
          v118 = v137 + v114;
          v117 = v137 + v114 + v138;
          v116 = v117 + v139;
          v141 = v117 + v139 + v140;
          v142 = v141 + *(_DWORD *)&v108[4 * v135];
          *(_DWORD *)&v108[4 * v135] = v141;
          v143 = *(_DWORD *)(v112 + 4 * v135);
          *(_DWORD *)(v112 + 4 * v135) = v142;
          v144 = v142 + v143;
          v145 = v144 + *(_DWORD *)(v110 + 4 * v135);
          *(_DWORD *)(v110 + 4 * v135) = v144;
          if (v102 && v136)
          {
            v146 = v100++;
            *(_WORD *)(v220 + 2 * v146) = (v145 + *(_DWORD *)(v109 + 4 * v135) + 128) >> 8;
          }
          v136 = !v136;
          *(_DWORD *)(v109 + 4 * v135) = v145;
          ++v127;
          if (a7 - 2 == ++v135)
          {
            LODWORD(v147) = a7 + 2;
            goto LABEL_58;
          }
        }
        LODWORD(v147) = v135 + 4;
      }
LABEL_58:
      if (v221 <= v147)
      {
        v22 = v114;
        v21 = v118;
        v20 = v117;
        v19 = v116;
      }
      else
      {
        v147 = v147;
        while (v222 > v100)
        {
          v22 = *(v127 - 1);
          v21 = v114 + v22;
          v20 = v114 + v22 + v118;
          v19 = v20 + v117;
          v148 = v20 + v117 + v116 + *(_DWORD *)&v12[4 * v147];
          *(_DWORD *)&v12[4 * v147] = v20 + v117 + v116;
          v149 = *(_DWORD *)&v14[4 * v147];
          *(_DWORD *)&v14[4 * v147] = v148;
          v150 = v148 + v149;
          v151 = v150 + *(_DWORD *)&v15[4 * v147];
          *(_DWORD *)&v15[4 * v147] = v150;
          if (v102 && v136)
          {
            v152 = v100++;
            *(_WORD *)(v220 + 2 * v152) = (v151 + *(_DWORD *)&v16[4 * v147] + 128) >> 8;
          }
          v136 = !v136;
          *(_DWORD *)&v16[4 * v147++] = v151;
          v116 = v19;
          v117 = v21 + v118;
          v118 = v21;
          v114 = v22;
          if (v221 <= v147)
            goto LABEL_68;
        }
        v22 = v114;
        v21 = v118;
        v20 = v117;
        v19 = v116;
      }
LABEL_68:
      v102 = !v102;
      v153 = v208;
      v111 = v207 + 1;
      v104 = v209;
      v101 = v211;
      if (v207 + 1 >= a8)
        break;
      v71 = &v72[v214];
      a2 = v208;
    }
    while (v211 > (int)v209);
    result = (v207 + 1);
  }
  else
  {
    v153 = a2;
    LODWORD(v104) = 0;
  }
  if (a8 + 2 > result && v101 > (int)v104)
  {
    v154 = v12 + 8;
    v155 = (uint64_t)&v12[12 * v13 + 8];
    v156 = (uint64_t)&v12[8 * v13 + 8];
    v157 = (uint64_t)&v12[4 * v13 + 8];
    v158 = v12 + 16;
    v159 = (uint64_t)&v12[12 * v13 + 16];
    v160 = (uint64_t)&v12[8 * v13 + 16];
    v161 = a7 - 2;
    v217 = v104;
    v162 = v100;
    v163 = (uint64_t)&v12[4 * v13 + 16];
    do
    {
      v215 = result;
      v164 = 0;
      v165 = *v72;
      v166 = 1;
      v167 = v19;
      v168 = v20;
      v169 = v21;
      do
      {
        v170 = v169;
        v171 = v168;
        v172 = v167;
        v173 = v166;
        v169 = v22 + v165;
        v168 = v22 + v165 + v170;
        v167 = v168 + v171;
        v174 = v168 + v171 + v172 + *(_DWORD *)&v12[4 * v164];
        *(_DWORD *)&v12[4 * v164] = v168 + v171 + v172;
        v175 = v174 + *(_DWORD *)&v14[4 * v164];
        *(_DWORD *)&v14[4 * v164] = v174;
        v176 = *(_DWORD *)&v15[4 * v164];
        *(_DWORD *)&v15[4 * v164] = v175;
        *(_DWORD *)&v16[4 * v164] = v175 + v176;
        v164 = 1;
        v22 = v165;
        v166 = 0;
      }
      while ((v173 & 1) != 0);
      v177 = 0;
      v178 = v72;
      do
      {
        v179 = v165;
        v180 = v169;
        v181 = v168;
        v182 = v167;
        v165 = v72[v177];
        v169 = v179 + v165;
        v168 = v179 + v165 + v180;
        v167 = v168 + v181;
        v183 = v168 + v181 + v182 + *(_DWORD *)&v154[4 * v177];
        *(_DWORD *)&v154[4 * v177] = v168 + v181 + v182;
        v184 = v183 + *(_DWORD *)(v157 + 4 * v177);
        *(_DWORD *)(v157 + 4 * v177) = v183;
        v185 = *(_DWORD *)(v156 + 4 * v177);
        *(_DWORD *)(v156 + 4 * v177) = v184;
        *(_DWORD *)(v155 + 4 * v177) = v184 + v185;
        ++v178;
        ++v177;
      }
      while (v177 != 2);
      if (v102)
      {
        v162 = 0;
        ++v217;
        v220 = v153;
        v213 = v153 + 2 * v206;
      }
      else
      {
        v213 = v153;
      }
      if (v218 < 5)
      {
        v187 = 1;
        LODWORD(v199) = 4;
      }
      else
      {
        v186 = 0;
        v187 = 1;
        v188 = v178;
        while (1)
        {
          v189 = v165;
          v190 = v169;
          v191 = v168;
          v192 = v167;
          if (v222 <= v162)
            break;
          v165 = v178[v186];
          v169 = v189 + v165;
          v168 = v189 + v165 + v190;
          v167 = v168 + v191;
          v193 = v168 + v191 + v192;
          v194 = v193 + *(_DWORD *)&v158[4 * v186];
          *(_DWORD *)&v158[4 * v186] = v193;
          v195 = *(_DWORD *)(v163 + 4 * v186);
          *(_DWORD *)(v163 + 4 * v186) = v194;
          v196 = v194 + v195;
          v197 = v196 + *(_DWORD *)(v160 + 4 * v186);
          *(_DWORD *)(v160 + 4 * v186) = v196;
          if (v102 && v187)
          {
            v198 = v162++;
            *(_WORD *)(v220 + 2 * v198) = (v197 + *(_DWORD *)(v159 + 4 * v186) + 128) >> 8;
          }
          v187 = !v187;
          *(_DWORD *)(v159 + 4 * v186) = v197;
          ++v188;
          if (v161 == ++v186)
          {
            v178 = v188;
            LODWORD(v199) = v218;
            goto LABEL_92;
          }
        }
        LODWORD(v199) = v186 + 4;
        v178 = v188;
      }
LABEL_92:
      if (v221 <= v199)
      {
        v22 = v165;
        v21 = v169;
        v20 = v168;
        v19 = v167;
      }
      else
      {
        v199 = v199;
        while (v222 > v162)
        {
          v22 = *(v178 - 1);
          v21 = v165 + v22;
          v20 = v165 + v22 + v169;
          v19 = v20 + v168;
          v200 = v20 + v168 + v167 + *(_DWORD *)&v12[4 * v199];
          *(_DWORD *)&v12[4 * v199] = v20 + v168 + v167;
          v201 = *(_DWORD *)&v14[4 * v199];
          *(_DWORD *)&v14[4 * v199] = v200;
          v202 = v200 + v201;
          v203 = v202 + *(_DWORD *)&v15[4 * v199];
          *(_DWORD *)&v15[4 * v199] = v202;
          if (v102 && v187)
          {
            v204 = v162++;
            *(_WORD *)(v220 + 2 * v204) = (v203 + *(_DWORD *)&v16[4 * v199] + 128) >> 8;
          }
          v187 = !v187;
          *(_DWORD *)&v16[4 * v199++] = v203;
          v167 = v20 + v168;
          v168 = v20;
          v169 = v21;
          v165 = v22;
          if (v221 <= v199)
            goto LABEL_102;
        }
        v22 = v165;
        v21 = v169;
        v20 = v168;
        v19 = v167;
      }
LABEL_102:
      v102 = !v102;
      result = v215 + 1;
      if (a8 + 2 <= v215 + 1)
        break;
      v153 = v213;
    }
    while (v211 > v217);
  }
  return result;
}

_QWORD *GaussianScaler_constructor(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;

  v4 = malloc_type_malloc(0x18uLL, 0x1010040A79CA2DEuLL);
  v5 = v4;
  if (v4)
  {
    *v4 = a1 + 4;
    v4[1] = a2;
    v6 = malloc_type_malloc(8 * (a1 + 4), 0x1000040BDFB0063uLL);
    v5[2] = v6;
    if (!v6)
    {
      free(v5);
      return 0;
    }
  }
  return v5;
}

void GaussianScaler_destructor(_QWORD *a1)
{
  void *v2;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
      free(v2);
    free(a1);
  }
}

uint64_t GaussianScaler_downsample(uint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, unsigned __int8 *a6, unint64_t a7, unint64_t a8, uint64_t a9)
{
  unint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  size_t v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  uint64_t result;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  char *v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  __int16 v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  char v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;
  uint64_t i;
  __int16 v45;
  __int16 v46;
  __int16 v47;
  __int16 v48;
  __int16 v49;
  __int16 v50;
  __int16 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  unint64_t v54;
  char *v55;
  __int16 v56;
  __int16 v57;
  __int16 v58;
  __int16 v59;
  __int16 v60;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unsigned int v66;
  uint64_t v67;
  char v68;
  char *v69;
  uint64_t v70;
  unsigned __int8 *v71;
  char v72;
  char v73;
  __int16 v74;
  __int16 v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  __int16 v79;
  __int16 v80;
  __int16 v81;
  char v82;
  __int16 v83;
  __int16 v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;
  __int16 v90;
  __int16 v91;
  __int16 v92;
  __int16 v93;
  unsigned __int8 *v94;
  unsigned int v95;
  uint64_t v96;
  char *v97;
  __int16 v98;
  __int16 v99;
  __int16 v100;
  __int16 v101;
  __int16 v102;
  int v103;
  unint64_t v104;
  _BOOL4 v105;
  unint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  __int16 v117;
  __int16 v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  __int16 v122;
  __int16 v123;
  __int16 v124;
  char v125;
  __int16 v126;
  __int16 v127;
  __int16 v128;
  uint64_t j;
  __int16 v130;
  __int16 v131;
  __int16 v132;
  __int16 v133;
  __int16 v134;
  __int16 v135;
  __int16 v136;
  unsigned __int8 *v137;
  uint64_t v138;
  _BOOL4 v139;
  __int16 v140;
  __int16 v141;
  __int16 v142;
  __int16 v143;
  __int16 v144;
  __int16 v145;
  __int16 v146;
  __int16 v147;
  __int16 v148;
  uint64_t v149;
  unsigned int v150;
  unint64_t v151;
  __int16 v152;
  __int16 v153;
  __int16 v154;
  __int16 v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  unint64_t v160;
  int v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char v166;
  __int16 v167;
  __int16 v168;
  __int16 v169;
  uint64_t v170;
  __int16 v171;
  __int16 v172;
  __int16 v173;
  __int16 v174;
  char v175;
  __int16 v176;
  __int16 v177;
  __int16 v178;
  uint64_t k;
  __int16 v180;
  __int16 v181;
  __int16 v182;
  __int16 v183;
  __int16 v184;
  __int16 v185;
  __int16 v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _BOOL4 v190;
  uint64_t v191;
  __int16 v192;
  __int16 v193;
  __int16 v194;
  __int16 v195;
  __int16 v196;
  __int16 v197;
  __int16 v198;
  __int16 v199;
  __int16 v200;
  uint64_t v201;
  unint64_t v202;
  __int16 v203;
  __int16 v204;
  __int16 v205;
  __int16 v206;
  __int16 v207;
  uint64_t v208;
  uint64_t v211;
  uint64_t v212;
  unint64_t v213;
  int v215;
  unint64_t v217;
  unint64_t v218;
  uint64_t v219;
  unint64_t v220;

  v11 = a7 >> 1;
  if (a7 >> 1 >= a3)
    v11 = a3;
  v217 = v11;
  v12 = (char *)a1[2];
  v13 = *a1;
  v14 = &v12[2 * *a1];
  v15 = &v14[2 * *a1];
  v16 = &v15[2 * *a1];
  v17 = a7 + 4;
  v18 = 2 * (a7 + 4);
  bzero(v12, v18);
  bzero(v14, v18);
  bzero(v15, v18);
  bzero(v16, v18);
  v19 = 0;
  v20 = 0;
  v21 = 0;
  LOWORD(result) = 0;
  v23 = v12 + 4;
  v24 = (uint64_t)&v12[4 * v13 + 4];
  v25 = (uint64_t)&v12[2 * v13 + 4];
  v218 = a7 + 2;
  if (a7 != 0 && a7 < 0xFFFFFFFFFFFFFFFELL)
    v26 = a7 + 2;
  else
    v26 = 2;
  v27 = &v12[2 * v26];
  v28 = -2;
  v220 = v17;
  v29 = v17 - v26;
  do
  {
    v30 = 0;
    v31 = 1;
    v32 = v19;
    v33 = v20;
    v34 = v21;
    v35 = result;
    do
    {
      v36 = v35;
      v37 = v34;
      v38 = v33;
      v39 = v32;
      v40 = v31;
      v35 = *a6;
      v34 = v36 + v35;
      v33 = v36 + v35 + v37;
      v32 = v33 + v38;
      v41 = v33 + v38 + v39 + *(_WORD *)&v12[2 * v30];
      *(_WORD *)&v12[2 * v30] = v34 + v37 + v38 + v39;
      v42 = v41 + *(_WORD *)&v14[2 * v30];
      *(_WORD *)&v14[2 * v30] = v41;
      v43 = v42 + *(_WORD *)&v15[2 * v30];
      *(_WORD *)&v15[2 * v30] = v42;
      *(_WORD *)&v16[2 * v30] = v43;
      v30 = 1;
      v31 = 0;
    }
    while ((v40 & 1) != 0);
    if (v218 < 3)
    {
      v52 = a6;
      v53 = 2;
    }
    else
    {
      for (i = 0; i != a7; ++i)
      {
        v45 = v35;
        v46 = v34;
        v47 = v33;
        v35 = a6[i];
        v48 = v32;
        v34 = v45 + v35;
        v33 = v45 + v35 + v46;
        v32 = v33 + v47;
        v49 = v33 + v47 + v48 + *(_WORD *)&v23[2 * i];
        *(_WORD *)&v23[2 * i] = v34 + v46 + v47 + v48;
        v50 = v49 + *(_WORD *)(v25 + 2 * i);
        *(_WORD *)(v25 + 2 * i) = v49;
        v51 = v50 + *(_WORD *)(v24 + 2 * i);
        *(_WORD *)(v24 + 2 * i) = v50;
        *(_WORD *)&v12[6 * v13 + 4 + 2 * i] = v51;
      }
      v52 = &a6[i];
      v53 = a7 + 2;
    }
    if (v17 <= v53)
    {
      LOWORD(result) = v35;
      v21 = v34;
      v20 = v33;
      v19 = v32;
    }
    else
    {
      v54 = v29;
      v55 = v27;
      do
      {
        LOWORD(result) = *(v52 - 1);
        v21 = v35 + result;
        v20 = v35 + result + v34;
        v19 = v20 + v33;
        v56 = v20 + v33 + v32;
        v57 = v56 + *(_WORD *)v55;
        *(_WORD *)v55 = v56;
        v58 = *(_WORD *)&v55[2 * v13];
        *(_WORD *)&v55[2 * v13] = v57;
        v59 = v57 + v58;
        v60 = v59 + *(_WORD *)&v55[4 * v13];
        *(_WORD *)&v55[4 * v13] = v59;
        *(_WORD *)&v55[6 * v13] = v60;
        v55 += 2;
        v32 = v19;
        v33 = v20;
        v34 = v35 + result;
        v35 = result;
        --v54;
      }
      while (v54);
    }
  }
  while (!__CFADD__(v28++, 1));
  v62 = v12 + 4;
  v63 = (uint64_t)&v12[4 * v13 + 4];
  v64 = (uint64_t)&v12[2 * v13 + 4];
  v65 = v217;
  v66 = 2;
  if (v218 > 2)
    v66 = a7 + 2;
  v67 = a7 - v66 + 4;
  v68 = 1;
  v69 = &v12[2 * v66];
  do
  {
    v70 = 0;
    v71 = a6;
    v72 = v68;
    v73 = 1;
    v74 = v19;
    v75 = v20;
    v76 = v21;
    LOWORD(v77) = result;
    do
    {
      v78 = v77;
      v79 = v76;
      v80 = v75;
      v81 = v74;
      v82 = v73;
      v77 = *v71;
      v76 = v78 + v77;
      v75 = v78 + v77 + v79;
      v74 = v75 + v80;
      v83 = v75 + v80 + v81 + *(_WORD *)&v12[2 * v70];
      *(_WORD *)&v12[2 * v70] = v76 + v79 + v80 + v81;
      v84 = v83 + *(_WORD *)&v14[2 * v70];
      *(_WORD *)&v14[2 * v70] = v83;
      v85 = v84 + *(_WORD *)&v15[2 * v70];
      *(_WORD *)&v15[2 * v70] = v84;
      *(_WORD *)&v16[2 * v70] = v85;
      v70 = 1;
      v73 = 0;
    }
    while ((v82 & 1) != 0);
    if (v218 < 3)
    {
      v94 = v71;
      v95 = 2;
    }
    else
    {
      v86 = 0;
      do
      {
        v87 = v77;
        v88 = v76;
        v89 = v75;
        v77 = v71[v86];
        v90 = v74;
        v76 = v87 + v77;
        v75 = v87 + v77 + v88;
        v74 = v75 + v89;
        v91 = v75 + v89 + v90 + *(_WORD *)&v62[2 * v86];
        *(_WORD *)&v62[2 * v86] = v76 + v88 + v89 + v90;
        v92 = v91 + *(_WORD *)(v64 + 2 * v86);
        *(_WORD *)(v64 + 2 * v86) = v91;
        v93 = v92 + *(_WORD *)(v63 + 2 * v86);
        *(_WORD *)(v63 + 2 * v86) = v92;
        *(_WORD *)&v12[6 * v13 + 4 + 2 * v86++] = v93;
      }
      while (a7 != v86);
      v94 = &v71[v86];
      v95 = a7 + 2;
    }
    if (v220 <= v95)
    {
      result = v77;
      v21 = v76;
      v20 = v75;
      v19 = v74;
    }
    else
    {
      v96 = v67;
      v97 = v69;
      do
      {
        result = *(v94 - 1);
        v21 = v77 + result;
        v20 = v77 + result + v76;
        v19 = v20 + v75;
        v98 = v20 + v75 + v74;
        v99 = v98 + *(_WORD *)v97;
        *(_WORD *)v97 = v98;
        v100 = *(_WORD *)&v97[2 * v13];
        *(_WORD *)&v97[2 * v13] = v99;
        v101 = v99 + v100;
        v102 = v101 + *(_WORD *)&v97[4 * v13];
        *(_WORD *)&v97[4 * v13] = v101;
        *(_WORD *)&v97[6 * v13] = v102;
        v97 += 2;
        v74 = v19;
        v75 = v20;
        v76 = v77 + result;
        LOWORD(v77) = result;
        --v96;
      }
      while (v96);
    }
    v68 = 0;
    a6 = &v71[a9];
  }
  while ((v72 & 1) != 0);
  v103 = 0;
  v219 = 0;
  if (a8 >> 1 >= a4)
    v104 = a4;
  else
    v104 = a8 >> 1;
  v105 = 1;
  v106 = 2;
  v213 = v104;
  if (a8 >= 3 && v104)
  {
    v215 = 0;
    v103 = 0;
    v219 = 0;
    v107 = v12 + 4;
    v108 = (uint64_t)&v12[4 * v13 + 4];
    v109 = (uint64_t)&v12[2 * v13 + 4];
    v110 = v12 + 8;
    v111 = (uint64_t)&v12[6 * v13 + 8];
    v112 = (uint64_t)&v12[4 * v13 + 8];
    v105 = 1;
    v113 = 2;
    v114 = (uint64_t)&v12[2 * v13 + 8];
    do
    {
      v211 = v113;
      v115 = 0;
      v71 = a6;
      v116 = 1;
      v117 = v19;
      v118 = v20;
      v119 = v21;
      LOWORD(v120) = result;
      do
      {
        v121 = v120;
        v122 = v119;
        v123 = v118;
        v124 = v117;
        v125 = v116;
        LOWORD(v120) = *v71;
        v119 = v121 + v120;
        v118 = v121 + v120 + v122;
        v117 = v118 + v123;
        v126 = v118 + v123 + v124 + *(_WORD *)&v12[2 * v115];
        *(_WORD *)&v12[2 * v115] = v119 + v122 + v123 + v124;
        v127 = v126 + *(_WORD *)&v14[2 * v115];
        *(_WORD *)&v14[2 * v115] = v126;
        v128 = v127 + *(_WORD *)&v15[2 * v115];
        *(_WORD *)&v15[2 * v115] = v127;
        *(_WORD *)&v16[2 * v115] = v128;
        v115 = 1;
        v116 = 0;
      }
      while ((v125 & 1) != 0);
      for (j = 0; j != 2; ++j)
      {
        v130 = v120;
        v131 = v119;
        v132 = v118;
        v120 = v71[j];
        v133 = v117;
        v119 = v130 + v120;
        v118 = v130 + v120 + v131;
        v117 = v118 + v132;
        v134 = v118 + v132 + v133 + *(_WORD *)&v107[2 * j];
        *(_WORD *)&v107[2 * j] = v119 + v131 + v132 + v133;
        v135 = v134 + *(_WORD *)(v109 + 2 * j);
        *(_WORD *)(v109 + 2 * j) = v134;
        v136 = v135 + *(_WORD *)(v108 + 2 * j);
        *(_WORD *)(v108 + 2 * j) = v135;
        *(_WORD *)&v12[6 * v13 + 4 + 2 * j] = v136;
      }
      if (v105)
      {
        v103 = 0;
        v212 = a2 + a5;
        ++v215;
        v219 = a2;
      }
      else
      {
        v212 = a2;
      }
      v137 = v71 + 2;
      if (v218 < 5)
      {
        v139 = 1;
        v150 = 4;
      }
      else
      {
        v138 = 0;
        v139 = 1;
        while (1)
        {
          v140 = v120;
          v141 = v119;
          v142 = v118;
          v143 = v117;
          if (v65 <= v103)
            break;
          v120 = *v137;
          v119 = v140 + v120;
          v118 = v140 + v120 + v141;
          v117 = v118 + v142;
          v144 = v118 + v142 + v143;
          v145 = v144 + *(_WORD *)&v110[2 * v138];
          *(_WORD *)&v110[2 * v138] = v144;
          v146 = *(_WORD *)(v114 + 2 * v138);
          *(_WORD *)(v114 + 2 * v138) = v145;
          v147 = v145 + v146;
          v148 = v147 + *(_WORD *)(v112 + 2 * v138);
          *(_WORD *)(v112 + 2 * v138) = v147;
          if (v105 && v139)
          {
            v149 = v103++;
            *(_BYTE *)(v219 + v149) = (unsigned __int16)(v148 + *(_WORD *)(v111 + 2 * v138) + 128) >> 8;
          }
          v139 = !v139;
          *(_WORD *)(v111 + 2 * v138) = v148;
          ++v137;
          if (a7 - 2 == ++v138)
          {
            v150 = a7 + 2;
            goto LABEL_60;
          }
        }
        v150 = v138 + 4;
      }
LABEL_60:
      if (v220 <= v150)
      {
        result = v120;
        v21 = v119;
        v20 = v118;
        v19 = v117;
      }
      else
      {
        v151 = v150;
        while (v65 > v103)
        {
          result = *(v137 - 1);
          v21 = v120 + result;
          v20 = v120 + result + v119;
          v19 = v20 + v118;
          v152 = v20 + v118 + v117 + *(_WORD *)&v12[2 * v151];
          *(_WORD *)&v12[2 * v151] = v20 + v118 + v117;
          v153 = *(_WORD *)&v14[2 * v151];
          *(_WORD *)&v14[2 * v151] = v152;
          v154 = v152 + v153;
          v155 = v154 + *(_WORD *)&v15[2 * v151];
          *(_WORD *)&v15[2 * v151] = v154;
          if (v105 && v139)
          {
            v156 = v103++;
            *(_BYTE *)(v219 + v156) = (unsigned __int16)(v155 + *(_WORD *)&v16[2 * v151] + 128) >> 8;
          }
          v139 = !v139;
          *(_WORD *)&v16[2 * v151++] = v155;
          v117 = v20 + v118;
          v118 = v20;
          v119 = v21;
          v120 = result;
          v65 = v217;
          if (v220 <= v151)
            goto LABEL_70;
        }
        result = v120;
        v21 = v119;
        v20 = v118;
        v19 = v117;
      }
LABEL_70:
      v105 = !v105;
      v157 = v212;
      v113 = v211 + 1;
      v104 = v213;
      if (v211 + 1 >= a8)
        break;
      a6 = &v71[a9];
      a2 = v212;
    }
    while (v213 > v215);
    v106 = (v211 + 1);
  }
  else
  {
    v157 = a2;
    v215 = 0;
  }
  if (a8 + 2 > v106 && v104 > v215)
  {
    v158 = v12 + 4;
    v159 = (uint64_t)&v12[6 * v13 + 4];
    v160 = 2 - a7;
    v161 = v215;
    v162 = v103;
    v163 = (uint64_t)&v12[4 * v13 + 4];
    v164 = (uint64_t)&v12[2 * v13 + 4];
    do
    {
      v165 = 0;
      v166 = 1;
      v167 = v19;
      v168 = v20;
      v169 = v21;
      LOWORD(v170) = result;
      do
      {
        v171 = v170;
        v172 = v169;
        v173 = v168;
        v174 = v167;
        v175 = v166;
        LOWORD(v170) = *v71;
        v169 = v171 + v170;
        v168 = v171 + v170 + v172;
        v167 = v168 + v173;
        v176 = v168 + v173 + v174 + *(_WORD *)&v12[2 * v165];
        *(_WORD *)&v12[2 * v165] = v169 + v172 + v173 + v174;
        v177 = v176 + *(_WORD *)&v14[2 * v165];
        *(_WORD *)&v14[2 * v165] = v176;
        v178 = v177 + *(_WORD *)&v15[2 * v165];
        *(_WORD *)&v15[2 * v165] = v177;
        *(_WORD *)&v16[2 * v165] = v178;
        v165 = 1;
        v166 = 0;
      }
      while ((v175 & 1) != 0);
      for (k = 0; k != 2; ++k)
      {
        v180 = v170;
        v181 = v169;
        v182 = v168;
        v170 = v71[k];
        v183 = v167;
        v169 = v180 + v170;
        v168 = v180 + v170 + v181;
        v167 = v168 + v182;
        v184 = v168 + v182 + v183 + *(_WORD *)&v158[2 * k];
        *(_WORD *)&v158[2 * k] = v169 + v181 + v182 + v183;
        v185 = v184 + *(_WORD *)(v164 + 2 * k);
        *(_WORD *)(v164 + 2 * k) = v184;
        v186 = v185 + *(_WORD *)(v163 + 2 * k);
        *(_WORD *)(v163 + 2 * k) = v185;
        *(_WORD *)(v159 + 2 * k) = v186;
      }
      v187 = (uint64_t)(v71 + 2);
      if (v105)
        v188 = v157 + a5;
      else
        v188 = v157;
      v189 = v219;
      if (v105)
        v189 = v157;
      v219 = v189;
      if (v105)
      {
        v162 = 0;
        ++v161;
      }
      v190 = 1;
      v191 = 4;
      if (v218 >= 5)
      {
        while (1)
        {
          v192 = v170;
          v193 = v169;
          v194 = v168;
          v195 = v167;
          if (v65 <= v162)
            break;
          v170 = *(unsigned __int8 *)(v187 + v191 - 4);
          v169 = v192 + v170;
          v168 = v192 + v170 + v193;
          v167 = v168 + v194;
          v196 = v168 + v194 + v195;
          v197 = v196 + *(_WORD *)&v12[2 * v191];
          *(_WORD *)&v12[2 * v191] = v196;
          v198 = *(_WORD *)&v14[2 * v191];
          *(_WORD *)&v14[2 * v191] = v197;
          v199 = v197 + v198;
          v200 = v199 + *(_WORD *)&v15[2 * v191];
          *(_WORD *)&v15[2 * v191] = v199;
          if (v105 && v190)
          {
            v201 = v162++;
            *(_BYTE *)(v219 + v201) = (unsigned __int16)(v200 + *(_WORD *)&v16[2 * v191] + 128) >> 8;
          }
          v190 = !v190;
          *(_WORD *)&v16[2 * v191++] = v200;
          if (v160 + v191 == 4)
          {
            v187 = (uint64_t)&v71[v191 - 2];
            LODWORD(v191) = v218;
            goto LABEL_96;
          }
        }
        v187 = (uint64_t)&v71[v191 - 2];
      }
LABEL_96:
      if (v220 <= v191)
      {
        result = v170;
        v21 = v169;
        v20 = v168;
        v19 = v167;
      }
      else
      {
        v202 = v191;
        while (v65 > v162)
        {
          result = *(unsigned __int8 *)(v187 - 1);
          v21 = v170 + result;
          v20 = v170 + result + v169;
          v19 = v20 + v168;
          v203 = v20 + v168 + v167;
          v204 = v203 + *(_WORD *)&v12[2 * v202];
          *(_WORD *)&v12[2 * v202] = v203;
          v205 = *(_WORD *)&v14[2 * v202];
          *(_WORD *)&v14[2 * v202] = v204;
          v206 = v204 + v205;
          v207 = v206 + *(_WORD *)&v15[2 * v202];
          *(_WORD *)&v15[2 * v202] = v206;
          if (v105 && v190)
          {
            v208 = v162++;
            *(_BYTE *)(v219 + v208) = (unsigned __int16)(v207 + *(_WORD *)&v16[2 * v202] + 128) >> 8;
          }
          v190 = !v190;
          *(_WORD *)&v16[2 * v202++] = v207;
          v167 = v19;
          v168 = v21 + v169;
          v169 = v170 + result;
          v170 = result;
          if (v220 <= v202)
            goto LABEL_106;
        }
        result = v170;
        v21 = v169;
        v20 = v168;
        v19 = v167;
      }
LABEL_106:
      v105 = !v105;
      if (a8 + 2 <= ++v106)
        break;
      v157 = v188;
    }
    while (v213 > v161);
  }
  return result;
}

CFTypeRef sub_227627BD4(int a1, const char *a2, OSType a3)
{
  int v4;
  const __CFDictionary *v6;
  CVReturn v7;
  CFTypeRef v8;
  BOOL v9;
  CFTypeRef cf;
  uint64_t v12;
  _QWORD v13[2];

  v4 = (int)a2;
  v13[1] = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v12 = *MEMORY[0x24BDC5668];
  v13[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v13, (uint64_t)&v12, 1);
  v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v7 = CVPixelBufferCreate(0, a1, v4, a3, v6, (CVPixelBufferRef *)&cf);
  v8 = cf;
  if (v7)
    v9 = cf == 0;
  else
    v9 = 1;
  if (!v9)
  {
    CFRelease(cf);
    v8 = 0;
    cf = 0;
  }

  return v8;
}

_QWORD *BlendingCtrl_zero_v2()
{
  _QWORD *v0;
  void *v1;

  v0 = malloc_type_calloc(8uLL, 1uLL, 0x601736B3uLL);
  if (v0)
  {
    v1 = malloc_type_calloc(0x140uLL, 1uLL, 0xC6506CBAuLL);
    *v0 = v1;
    if (!v1)
    {
      free(v0);
      return 0;
    }
  }
  return v0;
}

void BlendingCtrl_createBlendingContext_v2(void ***a1, int a2, uint64_t a3, int a4, size_t a5, uint64_t a6, uint64_t a7, char a8)
{
  void **v15;
  void **v16;
  void *v17;
  void **v18;
  int v19;
  int v20;
  const __CFAllocator *v21;
  __CFArray *Value;
  CFNumberRef v23;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  __CVBuffer *v25;
  void *BaseAddressOfPlane;
  void *v27;
  size_t HeightOfPlane;
  unint64_t v29;
  size_t BytesPerRowOfPlane;
  size_t v31;
  uint64_t v32;
  _QWORD *v33;
  const __CFAllocator *v34;
  const CFDictionaryKeyCallBacks *v35;
  const CFDictionaryValueCallBacks *v36;
  const __CFDictionary *v37;
  const __CFDictionary *Mutable;
  __CFArray *v39;
  CFNumberRef v40;
  uint64_t v41;
  CFNumberRef v42;
  CFNumberRef v43;
  __CFDictionary *IOSurfacePropertiesDictionary;
  uint64_t v45;
  CVPixelBufferRef *v46;
  void *BaseAddress;
  size_t DataSize;
  __CVBuffer *v49;
  uint64_t i;
  _QWORD *v51;
  void **v52;
  _DWORD *v53;
  int v54;
  int v55;
  int v56;
  CFDictionaryRef pixelBufferAttributes;
  void *values;
  int v59;
  int valuePtr;
  CFDictionaryRef theDict;
  CFTypeRef cf;
  CVPixelBufferRef pixelBufferOut[3];

  pixelBufferOut[2] = *(CVPixelBufferRef *)MEMORY[0x24BDAC8D0];
  v15 = (void **)BlendingCtrl_zero_v2();
  v16 = v15;
  if (!v15)
    goto LABEL_20;
  v17 = *v15;
  *((_DWORD *)v17 + 8) = a4;
  *((_DWORD *)v17 + 70) = 0;
  *((_QWORD *)v17 + 14) = a5;
  *((_QWORD *)v17 + 15) = a6;
  *((_QWORD *)v17 + 16) = a7;
  v18 = a1[1];
  if (!v18 || (v19 = *((_DWORD *)v18 + 26), (v19 | 2) != 3))
  {
    v20 = 0;
    if ((a8 & 1) == 0)
      goto LABEL_5;
LABEL_8:
    v25 = 0;
    *(_QWORD *)v17 = 0;
    goto LABEL_9;
  }
  v20 = 1;
  ACTLogMessageImp(1, "mode = %d: padding buffer to %d", v19, ((a2 + 63) & 0xFFFFFFC0) + 64);
  if ((a8 & 1) != 0)
    goto LABEL_8;
LABEL_5:
  theDict = 0;
  FigCreatePixelBufferAttributesWithIOSurfaceSupport();
  v21 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
  CFRelease(0);
  Value = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x24BDC55F0]);
  valuePtr = 768;
  v23 = CFNumberCreate(v21, kCFNumberSInt32Type, &valuePtr);
  CFArraySetValueAtIndex(Value, 0, v23);
  CFRelease(v23);
  applyWiringAssertionToProperties((CFDictionaryRef *)&cf);
  IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
  CFRelease(cf);
  if (IOSurfaceBackedCVPixelBufferWithAttributes)
    goto LABEL_20;
  v25 = *(__CVBuffer **)v17;
LABEL_9:
  CVPixelBufferLockBaseAddress(v25, 0);
  *((_BYTE *)v17 + 8) = 1;
  *((_QWORD *)v17 + 5) = 0;
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v17, 0);
  v27 = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v17, 1uLL);
  *((_QWORD *)v17 + 2) = CVPixelBufferGetWidth(*(CVPixelBufferRef *)v17);
  *((_QWORD *)v17 + 3) = CVPixelBufferGetHeight(*(CVPixelBufferRef *)v17);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)v17, 1uLL);
  v29 = (*((_QWORD *)v17 + 2) + 1) & 0xFFFFFFFFFFFFFFFELL;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v17, 0);
  v31 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v17, 1uLL);
  v32 = *((_QWORD *)v17 + 2);
  if (v20)
  {
    v32 -= 64;
    *((_QWORD *)v17 + 2) = v32;
    v29 -= 64;
  }
  v33 = Blending_constructor_v2((uint64_t)BaseAddressOfPlane, v32, *((_QWORD *)v17 + 3), BytesPerRowOfPlane, (uint64_t)v27, v29, HeightOfPlane, v31, *((_QWORD *)v17 + 14), *((_QWORD *)v17 + 15), *((_QWORD *)v17 + 29));
  *((_QWORD *)v17 + 27) = v33;
  if (v33)
  {
    *((_BYTE *)v33 + 144) = v20;
    v59 = 2;
    v34 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &v59);
    v35 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
    v36 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
    v37 = CFDictionaryCreate(v34, MEMORY[0x24BDC56F0], (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    CFRelease(values);
    Mutable = CFDictionaryCreateMutable(0, 0, v35, v36);
    pixelBufferAttributes = Mutable;
    v39 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
    v56 = 875704422;
    v40 = CFNumberCreate(0, kCFNumberSInt32Type, &v56);
    CFArrayAppendValue(v39, v40);
    CFRelease(v40);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v39);
    CFRelease(v39);
    v41 = *((_QWORD *)v17 + 14);
    v54 = *((_QWORD *)v17 + 15);
    v55 = v41;
    v42 = CFNumberCreate(v34, kCFNumberSInt32Type, &v55);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v42);
    CFRelease(v42);
    v43 = CFNumberCreate(v34, kCFNumberSInt32Type, &v54);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v43);
    CFRelease(v43);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5788], (const void *)*MEMORY[0x24BDBD270]);
    IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(1);
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
    CFRelease(IOSurfacePropertiesDictionary);
    applyWiringAssertionToProperties(&pixelBufferAttributes);
    CVPixelBufferPoolCreate(v34, v37, pixelBufferAttributes, (CVPixelBufferPoolRef *)v17 + 6);
    CFRelease(v37);
    CFRelease(pixelBufferAttributes);
    pixelBufferOut[0] = 0;
    pixelBufferOut[1] = 0;
    if (v59 >= 1)
    {
      v45 = 0;
      v46 = pixelBufferOut;
      do
      {
        CVPixelBufferPoolCreatePixelBuffer(v34, *((CVPixelBufferPoolRef *)v17 + 6), v46);
        CVPixelBufferLockBaseAddress(*v46, 0);
        BaseAddress = CVPixelBufferGetBaseAddress(*v46);
        DataSize = CVPixelBufferGetDataSize(*v46);
        bzero(BaseAddress, DataSize);
        v49 = *v46++;
        CVPixelBufferUnlockBaseAddress(v49, 0);
        ++v45;
      }
      while (v45 < v59);
      if (v59 >= 1)
      {
        for (i = 0; i < v59; CVPixelBufferRelease(pixelBufferOut[i++]))
          ;
      }
    }
    v51 = PixelShuffler_constructor(a5, *((_QWORD *)v17 + 15));
    *((_QWORD *)v17 + 28) = v51;
    if (v51)
    {
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v17, 0);
      *((_BYTE *)v17 + 8) = 0;
      if (!VTImageRotationSessionCreate())
      {
        v52 = FlareDetector_constructor();
        *((_QWORD *)v17 + 37) = v52;
        if (v52)
        {
          v53 = BlendingDefaults_constructor();
          *((_QWORD *)v17 + 38) = v53;
          if (v53)
          {
            *a1 = v16;
            *((_QWORD *)v17 + 39) = a1;
            return;
          }
        }
      }
    }
  }
LABEL_20:
  BlendingCtrl_deleteBlendingContext_v2(v16);
  *a1 = 0;
}

void BlendingCtrl_deleteBlendingContext_v2(void **a1)
{
  _QWORD *v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  __CVPixelBufferPool *v5;
  _QWORD *v6;
  _QWORD *v7;
  void **v8;
  void *v9;

  if (a1)
  {
    v2 = *a1;
    v3 = *(__CVBuffer **)*a1;
    if (v3)
    {
      CVPixelBufferUnlockBaseAddress(v3, 0);
      *((_BYTE *)v2 + 8) = 0;
      CVPixelBufferRelease((CVPixelBufferRef)*v2);
    }
    v4 = (__CVBuffer *)v2[5];
    if (v4)
    {
      CVPixelBufferUnlockBaseAddress(v4, 1uLL);
      CVPixelBufferRelease((CVPixelBufferRef)v2[5]);
      v2[5] = 0;
    }
    v5 = (__CVPixelBufferPool *)v2[6];
    if (v5)
    {
      CVPixelBufferPoolRelease(v5);
      v2[6] = 0;
    }
    v6 = (_QWORD *)v2[27];
    if (v6)
      Blending_destructor_v2(v6);
    v7 = (_QWORD *)v2[28];
    if (v7)
      PixelShuffler_destructor(v7);
    if (v2[36])
    {
      MEMORY[0x2276B46BC]();
      VTImageRotationSessionRelease();
    }
    v8 = (void **)v2[37];
    if (v8)
      FlareDetector_destructor(v8);
    v9 = (void *)v2[38];
    if (v9)
      BlendingDefaults_destructor(v9);
    if (*a1)
      free(*a1);
    free(a1);
  }
}

const __CFNumber *BlendingCtrl_setOptions_v2(const __CFNumber *result, const __CFDictionary *a2)
{
  if (result)
  {
    if (a2)
      return PixelShuffler_setOptions(*(const __CFNumber **)(*(_QWORD *)result + 224), a2);
  }
  return result;
}

uint64_t BlendingCtrl_initSlice_v2(_QWORD *a1, size_t a2, size_t a3)
{
  uint64_t v5;
  CVPixelBufferRef *v6;
  uint64_t result;
  size_t BytesPerRowOfPlane;
  CFDictionaryRef pixelBufferAttributes;

  v5 = *a1;
  v6 = (CVPixelBufferRef *)(*a1 + 40);
  if (*v6)
  {
    CVPixelBufferUnlockBaseAddress(*v6, 1uLL);
    CVPixelBufferRelease(*v6);
    *v6 = 0;
  }
  if (*(_QWORD *)(v5 + 72) == a2 && *(_QWORD *)(v5 + 80) == a3)
  {
    CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CVPixelBufferPoolRef *)(v5 + 48), v6);
  }
  else
  {
    pixelBufferAttributes = 0;
    applyWiringAssertionToProperties(&pixelBufferAttributes);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, *(_DWORD *)(v5 + 32), pixelBufferAttributes, v6))
    {
      CVPixelBufferUnlockBaseAddress(*v6, 1uLL);
      CVPixelBufferRelease(*v6);
      *v6 = 0;
      return 0xFFFFFFFFLL;
    }
    if (pixelBufferAttributes)
      CFRelease(pixelBufferAttributes);
  }
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  *(_QWORD *)(v5 + 56) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 64) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  *(_QWORD *)(v5 + 72) = CVPixelBufferGetWidthOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 80) = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 88) = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  result = 0;
  *(_QWORD *)(v5 + 96) = BytesPerRowOfPlane;
  return result;
}

uint64_t BlendingCtrl_getTargetContext_v2(uint64_t a1)
{
  return **(_QWORD **)a1;
}

void BlendingCtrl_resetBlendingContext_v2(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  Blending_reset_v2(*(_QWORD *)(*a1 + 216));
  *(_QWORD *)(v1 + 248) = 0;
  v1 += 248;
  *(_DWORD *)(v1 + 32) = 0;
  *(_DWORD *)(v1 - 8) = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 21) = 0;
}

float BlendingCtrl_Roi_v2(uint64_t *a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v3;
  size_t Height;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int v10;
  int v11;
  size_t v12;

  v3 = *a1;
  *(_QWORD *)(v3 + 200) = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  *(_QWORD *)(v3 + 208) = Height;
  v5 = *(_QWORD *)(v3 + 200);
  v6 = *(_QWORD *)(v3 + 128);
  v9 = vandq_s8(*(int8x16_t *)(v3 + 112), (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFFELL));
  *(int8x16_t *)(v3 + 152) = vextq_s8(v9, v9, 8uLL);
  v7 = v9.i64[0];
  v8 = ((unint64_t)(v5 - v9.i64[1]) >> 1) & 0x7FFFFFFFFFFFFFFELL;
  *(_QWORD *)(v3 + 136) = v8;
  *(_QWORD *)(v3 + 144) = v6;
  *(float32x2_t *)v9.i8 = vmul_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)v9)), (float32x2_t)0x3F0000003F000000);
  *(_QWORD *)(v3 + 104) = v9.i64[0];
  if (*(int *)(v3 + 240) < 1)
  {
    v11 = *(_DWORD *)(v3 + 280);
    if (v11 == 2)
    {
      *(_QWORD *)(v3 + 160) = v6 + v7;
      *(float *)v9.i32 = (float)Height * 0.5;
      *(_DWORD *)(v3 + 104) = v9.i32[0];
      *(_QWORD *)(v3 + 144) = 0;
      return *(float *)v9.i32;
    }
    if (v11 != 1)
    {
LABEL_9:
      puts("ERROR: panorama direction unknown");
      return *(float *)v9.i32;
    }
    *(_QWORD *)(v3 + 160) = Height - v6;
    *(float *)v9.i32 = (float)Height * 0.5;
    *(_DWORD *)(v3 + 104) = v9.i32[0];
  }
  else if (*(_DWORD *)(v3 + 272))
  {
    *(_QWORD *)(v3 + 168) = v8;
    *(_QWORD *)(v3 + 184) = v9.i64[1];
    v10 = *(_DWORD *)(v3 + 280);
    if (v10 == 2)
    {
      v12 = v6 + v7;
      *(_QWORD *)(v3 + 176) = v12;
      v6 = Height - v12;
      goto LABEL_11;
    }
    if (v10 == 1)
    {
      *(_QWORD *)(v3 + 176) = 0;
LABEL_11:
      *(_QWORD *)(v3 + 192) = v6;
      return *(float *)v9.i32;
    }
    goto LABEL_9;
  }
  return *(float *)v9.i32;
}

uint64_t BlendingCtrl_blendSlice_v2(uint64_t *a1, CFDictionaryRef theDict)
{
  uint64_t v3;
  const __CFData *Value;
  const UInt8 *BytePtr;
  double v6;
  double v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  float v10;
  unint64_t v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  float v16;
  float v17;
  __CVBuffer *v18;
  const __CFNumber *Attachment;
  int v20;
  float SNR_v2;
  double v22;
  double v23;
  float v25;
  int valuePtr;
  int v27;

  v3 = *a1;
  valuePtr = 3;
  v27 = 0;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("ACTRegistrationTransformationKey"));
  if (Value)
  {
    BytePtr = CFDataGetBytePtr(Value);
    v7 = *((double *)BytePtr + 4);
    v6 = *((double *)BytePtr + 5);
  }
  else
  {
    v7 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v6 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  }
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ACTRegistrationWasFallbackInvokedKey"));
  if (v8)
    CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
  v9 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ID"));
  if (v9)
    CFNumberGetValue(v9, kCFNumberIntType, &v27);
  v10 = v6;
  v11 = *(_QWORD *)(v3 + 112);
  if (v10 > (float)v11)
    v10 = (float)v11;
  if (v10 < (float)-(float)v11)
    v10 = -(float)v11;
  if (*(_DWORD *)(v3 + 280) == 2)
    v12 = -v10;
  else
    v12 = v10;
  if (!*(_BYTE *)(v3 + 8))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v3, 0);
    *(_BYTE *)(v3 + 8) = 1;
  }
  v14 = *(_QWORD *)(v3 + 152);
  v13 = *(_QWORD *)(v3 + 160);
  v15 = (const __CFDictionary *)CFDictionaryGetValue(theDict, CFSTR("MetadataDictionary"));
  if (!v15 || !CFDictionaryGetValue(v15, (const void *)*MEMORY[0x24BE10B50]))
  {
    v16 = v7;
    v17 = -v16;
    if (*(int *)(v3 + 240) >= 1)
    {
      if (!Blending_overlap_v2(*(_QWORD *)(v3 + 216), v13, v14, *(_DWORD *)(v3 + 272), v12, v17, *(float *)(v3 + 104), *(float *)(v3 + 108)))goto LABEL_27;
      CVPixelBufferRelease(*(CVPixelBufferRef *)(v3 + 264));
      v18 = *(__CVBuffer **)(v3 + 256);
      *(_QWORD *)(v3 + 264) = v18;
      CVPixelBufferRetain(v18);
    }
    v25 = 0.0;
    Attachment = (const __CFNumber *)CVBufferGetAttachment(*(CVBufferRef *)(v3 + 40), (CFStringRef)*MEMORY[0x24BE10A38], 0);
    if (Attachment)
      CFNumberGetValue(Attachment, kCFNumberFloatType, &v25);
    v20 = *(_DWORD *)(v3 + 240);
    if (v20 >= 1)
    {
      SNR_v2 = getSNR_v2(*(const void **)(v3 + 264));
      *(float *)&v22 = v12;
      *(float *)&v23 = v17;
      Blending_addImage_v2(*(_QWORD *)(v3 + 216), v22, v23, SNR_v2, v25, v13, v14, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), 1, v27);
      v20 = *(_DWORD *)(v3 + 240);
    }
    *(_DWORD *)(v3 + 240) = v20 + 1;
  }
LABEL_27:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v3 + 256));
  *(_QWORD *)(v3 + 256) = 0;
  return 0;
}

float getSNR_v2(const void *a1)
{
  const __CFDictionary *v1;
  float v2;
  const __CFNumber *Value;
  int valuePtr;

  valuePtr = -1082130432;
  v1 = (const __CFDictionary *)CMGetAttachment(a1, CFSTR("MetadataDictionary"), 0);
  v2 = -1.0;
  if (v1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("SNR"));
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberFloat32Type, &valuePtr);
      return *(float *)&valuePtr;
    }
  }
  return v2;
}

uint64_t BlendingCtrl_cropAndRotateSlice_v2(uint64_t *a1, __CVBuffer *a2)
{
  uint64_t v4;
  double v5;
  const __CFNumber *Attachment;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFNumber *v9;
  const __CFBoolean *Value;
  _BOOL4 v11;
  char v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  size_t BytesPerRowOfPlane;
  size_t v17;
  double Current;
  int v19;
  _QWORD *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  double v24;
  float v25;
  double v26;
  double v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  const __CFNumber *v34;
  const __CFNumber *v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  const __CFNumber *v43;
  CFNumberRef v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  CFNumberRef v50;
  double v51;
  double v52;
  CFAbsoluteTime v53;
  __IOSurface *IOSurface;
  __IOSurface *v55;
  IOSurfaceID ID;
  int v58;
  int v59;
  void *BaseAddressOfPlane;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  float v67;
  int valuePtr;

  v4 = *a1;
  v5 = sub_22762D41C();
  valuePtr = -1;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(a2, CFSTR("ID"), 0);
  if (Attachment)
    CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  if (!*(_BYTE *)(v4 + 8))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v4, 0);
    *(_BYTE *)(v4 + 8) = 1;
  }
  v7 = (const __CFDictionary *)CVBufferGetAttachment(a2, CFSTR("MetadataDictionary"), 0);
  v8 = v7;
  v67 = 1.0;
  if (v7 && (v9 = (const __CFNumber *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x24BE10A38])) != 0)
  {
    v66 = 0;
    CFNumberGetValue(v9, kCFNumberIntType, &v66);
    v67 = 256.0 / (float)v66;
    Value = (const __CFBoolean *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10CC0]);
    if (Value)
      v11 = CFBooleanGetValue(Value) != 0;
    else
      v11 = 0;
    v12 = 0;
    v59 = !v11;
  }
  else
  {
    v59 = 0;
    v12 = 1;
  }
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  v13 = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
  v14 = *(_QWORD *)(v4 + 200);
  v15 = *(_QWORD *)(v4 + 208);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
  v17 = CVPixelBufferGetBytesPerRowOfPlane(a2, 1uLL);
  if (BlendingCtrl_initSlice_v2(a1, *(_QWORD *)(v4 + 160), *(_QWORD *)(v4 + 152)) == -1)
  {
    v21 = "ERROR: Cannot reallocate the slice for new dimensions";
LABEL_20:
    puts(v21);
    v22 = 0xFFFFFFFFLL;
    goto LABEL_71;
  }
  if (PixelShuffler_init(*(_QWORD *)(v4 + 224), BytesPerRowOfPlane, v15) == -1)
  {
    v21 = "ERROR: Cannot reallocate pixel shuffler";
    goto LABEL_20;
  }
  if (*(int *)(v4 + 240) >= 1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v4 + 40), 0);
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    CVBufferPropagateAttachments(a2, *(CVBufferRef *)(v4 + 40));
    v19 = *(_DWORD *)(v4 + 280);
    if (v19 == 1)
    {
      v20 = (_QWORD *)MEMORY[0x24BDBD268];
    }
    else
    {
      if (v19 != 2)
      {
        puts("ERROR: panorama direction unknown");
LABEL_70:
        v22 = 0;
        goto LABEL_71;
      }
      v20 = (_QWORD *)MEMORY[0x24BDBD270];
    }
    MEMORY[0x2276B46D4](*(_QWORD *)(v4 + 288), *MEMORY[0x24BDF9610], *v20);
    MEMORY[0x2276B46E0](*(_QWORD *)(v4 + 288), a2, *(_QWORD *)(v4 + 40), (double)*(unint64_t *)(v4 + 136), (double)*(unint64_t *)(v4 + 144), (double)*(unint64_t *)(v4 + 152), (double)*(unint64_t *)(v4 + 160), 0.0, 0.0, (double)*(unint64_t *)(v4 + 160), (double)*(unint64_t *)(v4 + 152));
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v4 + 40), 0);
    *(_QWORD *)(v4 + 56) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v4 + 40), 0);
    *(_QWORD *)(v4 + 64) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v4 + 40), 1uLL);
    v30 = valuePtr;
    v31 = sub_22762D41C();
    ACTLogMessageImp(1, "{Blending%d|blendingCtrl_cropAndRotateSliceBeforeExposureBlendingTook:%f}", v30, v31 - v5);
    v32 = sub_22762D41C();
    if ((v12 & 1) == 0)
    {
      v33 = v32;
      if (v67 != 1.0 || *(_BYTE *)(v4 + 284))
      {
        v65 = 1;
        v66 = 1;
        v63 = 1;
        v64 = 1;
        v61 = 1;
        v62 = 1;
        v34 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AD0]);
        if (v34)
          CFNumberGetValue(v34, kCFNumberIntType, &v66);
        v35 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA0]);
        if (v35)
          CFNumberGetValue(v35, kCFNumberIntType, &v65);
        else
          v65 = v66;
        v38 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA8]);
        if (v38)
          CFNumberGetValue(v38, kCFNumberIntType, &v64);
        v39 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A98]);
        if (v39)
          CFNumberGetValue(v39, kCFNumberIntType, &v63);
        else
          v63 = v64;
        v42 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A88]);
        if (v42)
          CFNumberGetValue(v42, kCFNumberIntType, &v62);
        v43 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A90]);
        if (v43)
          CFNumberGetValue(v43, kCFNumberIntType, &v61);
        else
          v61 = v62;
        if (!v59)
          PixelShuffler_yuv420ExposureMap();
        v50 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v67);
        CVBufferSetAttachment(*(CVBufferRef *)(v4 + 40), (CFStringRef)*MEMORY[0x24BE10A38], v50, kCVAttachmentMode_ShouldPropagate);
        CFRelease(v50);
        v51 = v67;
        LODWORD(v50) = valuePtr;
        v52 = sub_22762D41C();
        ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", (_DWORD)v50, v51, (_DWORD)v50, v52 - v33);
      }
    }
    v53 = CFAbsoluteTimeGetCurrent();
    Blending_storeM2MTime_v2(*(_QWORD *)(v4 + 216), v53 - Current);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    v55 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(v4 + 40));
    LODWORD(IOSurface) = IOSurfaceGetID(IOSurface);
    ID = IOSurfaceGetID(v55);
    Blending_storeIOSurfaceIDs_v2(*(_QWORD *)(v4 + 216), (int)IOSurface, ID);
    goto LABEL_70;
  }
  v23 = valuePtr;
  v24 = sub_22762D41C();
  ACTLogMessageImp(1, "{Blending%d|blendingCtrl_cropAndRotateSliceBeforeExposureBlendingTook:%f}", v23, v24 - v5);
  if (*(_BYTE *)(*(_QWORD *)(v4 + 216) + 144))
    v25 = 32.0;
  else
    v25 = 0.0;
  v26 = sub_22762D41C();
  if ((v12 & 1) == 0)
  {
    v27 = v26;
    if (v67 != 1.0 || *(_BYTE *)(v4 + 284))
    {
      v65 = 1;
      v66 = 1;
      v63 = 1;
      v64 = 1;
      v61 = 1;
      v62 = 1;
      v28 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AD0]);
      if (v28)
        CFNumberGetValue(v28, kCFNumberIntType, &v66);
      v29 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA0]);
      if (v29)
        CFNumberGetValue(v29, kCFNumberIntType, &v65);
      else
        v65 = v66;
      v36 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA8]);
      if (v36)
        CFNumberGetValue(v36, kCFNumberIntType, &v64);
      v37 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A98]);
      if (v37)
        CFNumberGetValue(v37, kCFNumberIntType, &v63);
      else
        v63 = v64;
      v40 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A88]);
      if (v40)
        CFNumberGetValue(v40, kCFNumberIntType, &v62);
      v41 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A90]);
      if (v41)
        CFNumberGetValue(v41, kCFNumberIntType, &v61);
      else
        v61 = v62;
      if (!v59)
        PixelShuffler_yuv420ExposureMap();
      v44 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v67);
      CVBufferSetAttachment(*(CVBufferRef *)(v4 + 40), (CFStringRef)*MEMORY[0x24BE10A38], v44, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v44);
      v45 = v67;
      LODWORD(v44) = valuePtr;
      v46 = sub_22762D41C();
      ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", (_DWORD)v44, v45, (_DWORD)v44, v46 - v27);
    }
  }
  v47 = sub_22762D41C();
  Blending_start_v2(*(_QWORD *)(v4 + 216), *(_QWORD *)(v4 + 288), a2, *(__CVBuffer **)v4, v25, 0.0, *(float *)(v4 + 104), *(float *)(v4 + 108), v14, v15, BytesPerRowOfPlane, v17, (uint64_t)BaseAddressOfPlane, (uint64_t)v13, *(_QWORD *)(v4 + 224), *(_DWORD *)(v4 + 280), v58, *(_OWORD *)(v4 + 136), HIDWORD(*(_QWORD *)(v4 + 136)),
    *(_QWORD *)(v4 + 144),
    HIDWORD(*(_OWORD *)(v4 + 136)),
    *(_QWORD *)(v4 + 152),
    *(_QWORD *)(v4 + 160));
  v48 = valuePtr;
  v49 = sub_22762D41C();
  ACTLogMessageImp(1, "{Blending%d|Blending_startTook:%f}", v48, v49 - v47);
  v22 = 0;
  ++*(_DWORD *)(v4 + 240);
LABEL_71:
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v22;
}

double sub_22762D41C()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&qword_253E99A20 == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_253E99A20 = (double)v0 / (double)v1 * 0.000000001;
  }
  return *(double *)&qword_253E99A20 * (double)mach_absolute_time();
}

uint64_t BlendingCtrl_cropAndRotateBuffer_v2(uint64_t *a1, CVPixelBufferRef texture)
{
  uint64_t v4;

  if (!texture)
    return 0;
  v4 = *a1;
  if (*(_DWORD *)(*a1 + 240))
    goto LABEL_5;
  if (*(_DWORD *)(v4 + 280))
  {
    *(_QWORD *)(v4 + 248) = 0;
LABEL_5:
    CVPixelBufferRelease(*(CVPixelBufferRef *)(v4 + 256));
    *(_QWORD *)(v4 + 256) = texture;
    CVPixelBufferRetain(texture);
    BlendingCtrl_Roi_v2(a1, texture);
    if (BlendingCtrl_cropAndRotateSlice_v2(a1, texture) != -1)
      return *(_QWORD *)(v4 + 40);
    return 0;
  }
  *(_QWORD *)(v4 + 248) = texture;
  CVPixelBufferRetain(texture);
  return 0;
}

uint64_t BlendingCtrl_blendSliceIntoContext_v2(uint64_t *a1, const __CFDictionary *a2)
{
  if (*(_DWORD *)(*a1 + 240))
    BlendingCtrl_blendSlice_v2(a1, a2);
  return 0;
}

uint64_t BlendingCtrl_finishBlending_v2(uint64_t *a1)
{
  uint64_t v1;
  __CVBuffer *v2;
  const __CFDictionary *Attachment;
  const __CFDictionary *v4;
  const __CFString *v5;
  const __CFNumber *v6;
  float v7;
  const __CFBoolean *Value;
  _BOOL4 v9;
  uint64_t v10;
  double v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  CFNumberRef v18;
  const __CFNumber *v19;
  double v20;
  int v21;
  double v22;
  void *BaseAddressOfPlane;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  size_t BytesPerRowOfPlane;
  size_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  unint64_t v41;
  unint64_t valuePtr;
  unint64_t v43;
  int v44;
  int v45;
  int v46;
  int v47;

  v1 = *a1;
  v2 = *(__CVBuffer **)(*a1 + 264);
  if (!v2)
    goto LABEL_33;
  if (*(_DWORD *)(v1 + 240))
  {
    *(_DWORD *)(v1 + 272) = 1;
    BlendingCtrl_Roi_v2(a1, v2);
    if (!*(_QWORD *)(v1 + 192))
    {
LABEL_33:
      v10 = 0;
      goto LABEL_34;
    }
    Attachment = (const __CFDictionary *)CVBufferGetAttachment(*(CVBufferRef *)(v1 + 264), CFSTR("MetadataDictionary"), 0);
    LODWORD(v43) = 1065353216;
    if (Attachment
      && (v4 = Attachment,
          v5 = (const __CFString *)*MEMORY[0x24BE10A38],
          (v6 = (const __CFNumber *)CFDictionaryGetValue(Attachment, (const void *)*MEMORY[0x24BE10A38])) != 0))
    {
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      v7 = 256.0 / (float)(int)valuePtr;
      *(float *)&v43 = v7;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10CC0]);
      if (Value)
        v9 = CFBooleanGetValue(Value) != 0;
      else
        v9 = 0;
      v11 = sub_22762D41C();
      if (v7 != 1.0 || *(_BYTE *)(v1 + 284))
      {
        LODWORD(valuePtr) = 1;
        LODWORD(v41) = 1;
        LODWORD(v40) = 1;
        v46 = 1;
        v47 = 1;
        v45 = 1;
        v12 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AD0]);
        if (v12)
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        v13 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AA0]);
        if (v13)
          CFNumberGetValue(v13, kCFNumberIntType, &v41);
        else
          LODWORD(v41) = valuePtr;
        v14 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AA8]);
        if (v14)
          CFNumberGetValue(v14, kCFNumberIntType, &v40);
        v15 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A98]);
        if (v15)
          CFNumberGetValue(v15, kCFNumberIntType, &v47);
        else
          v47 = v40;
        v16 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A88]);
        if (v16)
          CFNumberGetValue(v16, kCFNumberIntType, &v46);
        v17 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A90]);
        if (v17)
        {
          CFNumberGetValue(v17, kCFNumberIntType, &v45);
          if (!v9)
            goto LABEL_30;
        }
        else
        {
          v45 = v46;
          if (!v9)
          {
LABEL_30:
            v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v43);
            CVBufferSetAttachment(*(CVBufferRef *)(v1 + 264), v5, v18, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v18);
            v44 = 0;
            v19 = (const __CFNumber *)CVBufferGetAttachment(*(CVBufferRef *)(v1 + 264), CFSTR("ID"), 0);
            if (v19)
            {
              CFNumberGetValue(v19, kCFNumberIntType, &v44);
              v20 = *(float *)&v43;
              v21 = v44;
              v22 = sub_22762D41C();
              ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", v21, v20, v21, v22 - v11);
            }
            goto LABEL_32;
          }
        }
        PixelShuffler_yuv420ExposureMap();
        goto LABEL_30;
      }
    }
    else
    {
      sub_22762D41C();
    }
LABEL_32:
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v1 + 264), 0);
    v24 = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v1 + 264), 1uLL);
    v25 = *(_QWORD *)(v1 + 200);
    v26 = *(_QWORD *)(v1 + 208);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v1 + 264), 0);
    v28 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v1 + 264), 1uLL);
    Blending_end_v2(*(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 288), *(_QWORD *)(v1 + 224), *(_DWORD *)(v1 + 280), *(__CVBuffer **)(v1 + 264), *(__CVBuffer **)v1, v25, v26, BytesPerRowOfPlane, v28, (uint64_t)BaseAddressOfPlane, (uint64_t)v24, *(_OWORD *)(v1 + 168), HIDWORD(*(_QWORD *)(v1 + 168)), *(_QWORD *)(v1 + 176), HIDWORD(*(_OWORD *)(v1 + 168)), *(_QWORD *)(v1 + 184), HIDWORD(*(_QWORD *)(v1 + 184)), *(_QWORD *)(v1 + 192));
    goto LABEL_33;
  }
  if (!*(_DWORD *)(v1 + 280))
    BlendingCtrl_setPanoramaDirection_v2(a1, 1);
  v10 = 0xFFFFFFFFLL;
LABEL_34:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v1 + 264));
  *(_QWORD *)(v1 + 264) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v1 + 256));
  *(_QWORD *)(v1 + 256) = 0;
  if (*(_DWORD *)(v1 + 280) == 2)
  {
    v29 = *(unsigned __int8 *)(v1 + 8);
    if (!*(_BYTE *)(v1 + 8))
    {
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v1, 0);
      *(_BYTE *)(v1 + 8) = 1;
    }
    v30 = *(_QWORD *)(v1 + 312);
    v31 = *(_QWORD *)(v30 + 8);
    if (v31)
    {
      v32 = *(_DWORD *)(v31 + 104);
      if ((v32 - 3) < 6 || v32 == 1)
      {
        v34 = *(_QWORD **)(v1 + 216);
        v35 = v34[32];
        v43 = v34[31];
        v37 = v34[33];
        v36 = v34[34];
        v41 = v35 - v43 + 1;
        valuePtr = v37;
        v40 = v36 - v37;
        ACTFinalThreadedNoiseReduction(*(_QWORD **)(v30 + 16));
      }
    }
    v38 = *(_QWORD **)(v1 + 216);
    valuePtr = v38[7];
    v43 = 0;
    PixelShuffler_yuv420FlipHorizontally(*(__CVBuffer **)v1, v38 + 31, v38 + 32, &v43, &valuePtr);
    if (!v29)
    {
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v1, 0);
      *(_BYTE *)(v1 + 8) = 0;
    }
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v1, 0);
  *(_BYTE *)(v1 + 8) = 0;
  return v10;
}

void BlendingCtrl_setPanoramaDirection_v2(uint64_t *a1, int a2)
{
  uint64_t v2;
  __CVBuffer *v3;

  v2 = *a1;
  *(_DWORD *)(v2 + 280) = a2;
  v3 = *(__CVBuffer **)(v2 + 248);
  if (v3)
  {
    BlendingCtrl_Roi_v2(a1, v3);
    BlendingCtrl_cropAndRotateSlice_v2(a1, *(__CVBuffer **)(v2 + 248));
    CFRelease(*(CFTypeRef *)(v2 + 248));
    *(_QWORD *)(v2 + 248) = 0;
  }
}

uint64_t BlendingCtrl_getCroppingArea_v2(uint64_t result, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;

  v5 = *(_QWORD **)(*(_QWORD *)result + 216);
  *a4 = v5[31];
  *a5 = v5[32];
  *a2 = v5[33];
  *a3 = v5[34];
  return result;
}

uint64_t BlendingCtrl_setEdgeBlendingErrorMetricLogging_v2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)result + 276) = a2;
  return result;
}

uint64_t BlendingCtrl_setBlendingForceMaxComputation_v2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)result + 284) = a2;
  return result;
}

uint64_t BlendingCtrl_setMaxOverlapPercent_v2(uint64_t result, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)result + 216) + 296) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setBlendingDefaults_v2(uint64_t *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  int *v4;

  if (a2)
    v2 = a2;
  else
    v2 = 4;
  v3 = *a1;
  v4 = *(int **)(*a1 + 304);
  *v4 = (v2 >> 1) & 1;
  v4[1] = v2 & 1;
  v4[2] = (v2 >> 2) & 1;
  return Blending_setDefaults_v2(*(_QWORD *)(v3 + 216), v4);
}

uint64_t BlendingCtrl_Defaults_setBlendingFlareCorrection_v2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)result + 304) + 4) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setWideSceneCut_v2(uint64_t result, int a2)
{
  **(_DWORD **)(*(_QWORD *)result + 304) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setPoissonBlending_v2(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)result + 304) + 8) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_Propagate_v2(uint64_t a1)
{
  return Blending_setDefaults_v2(*(_QWORD *)(*(_QWORD *)a1 + 216), *(int **)(*(_QWORD *)a1 + 304));
}

uint64_t BlendingCtrl_Defaults_getBlendingDefaults_v2(uint64_t a1)
{
  _DWORD *v1;
  unsigned int v2;

  v1 = *(_DWORD **)(*(_QWORD *)a1 + 304);
  v2 = v1[1] != 0;
  if (*v1)
    v2 |= 2u;
  if (v1[2])
    return v2 | 4;
  else
    return v2;
}

uint64_t BlendingCtrl_Defaults_getBlendingFlareCorrection_v2(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 304) + 4);
}

uint64_t BlendingCtrl_Defaults_getWideSceneCutn_v2(uint64_t a1)
{
  return **(unsigned int **)(*(_QWORD *)a1 + 304);
}

uint64_t BlendingCtrl_Defaults_getPoissonBlending_v2(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 304) + 8);
}

_QWORD *Stitcher_constructor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  char *v7;

  v6 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  if (v6)
  {
    v7 = Stitcher_SceneCut_constructor(a1, a2, a3);
    *v6 = v7;
    if (!v7)
    {
      free(v6);
      return 0;
    }
  }
  return v6;
}

uint64_t Stitcher_setDefaults(uint64_t *a1, int *a2)
{
  return Stitcher_SceneCut_setDefaults(*a1, a2);
}

void Stitcher_destructor(void **a1)
{
  if (a1)
  {
    Stitcher_SceneCut_destructor(*a1);
    free(a1);
  }
}

void Stitcher_reset(uint64_t *a1)
{
  Stitcher_SceneCut_reset(*a1);
}

uint64_t Stitcher_pasteImageToReference(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11, unint64_t a12, vImagePixelCount a13, int a14, int a15)
{
  return Stitcher_SceneCut_pasteImageToReference(*a1, a2, a3, a4, a9, a5, a6, a7, a8, a10, a11, a12, a13, a14, a15);
}

uint64_t Stitcher_minOverlapWidth(uint64_t *a1, float a2)
{
  return Stitcher_SceneCut_minOverlapWidth(*a1, a2);
}

uint64_t Stitcher_maxMinOverlapWidth(uint64_t *a1)
{
  return Stitcher_SceneCut_maxMinOverlapWidth(*a1);
}

uint64_t Stitcher_storeM2MTime(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)result + 352) = a2;
  return result;
}

uint64_t *Stitcher_storeIOSurfaceIDs(uint64_t *result, int a2, int a3)
{
  uint64_t v3;

  v3 = *result;
  *(_DWORD *)(v3 + 360) = a2;
  *(_DWORD *)(v3 + 364) = a3;
  return result;
}

uint64_t Projections_normalizeMeanStdUsingTable(uint64_t a1, int a2, int a3, _QWORD *a4, uint64_t a5, float *a6, float *a7, double a8)
{
  float v13;
  float v14;
  float v15;
  float __C;
  float __B;

  v13 = (float)(a3 - a2 + 1);
  v14 = (float)(*(float *)(a4[1] + 4 * (a3 + 1)) - *(float *)(a4[1] + 4 * a2)) / v13;
  *(float *)&a8 = (float)(*(float *)(*a4 + 4 * (a3 + 1)) - *(float *)(*a4 + 4 * a2)) / v13;
  *a6 = *(float *)&a8;
  *(float *)&a8 = v14 - (float)(*(float *)&a8 * *(float *)&a8);
  LODWORD(v15) = Projections_fastSqrtf(a8).u32[0];
  *a7 = v15;
  if (a5)
  {
    if (Projections_isZero(v15))
    {
      memcpy((void *)(a5 + 4 * a2), (const void *)(a1 + 4 * a2), vcvts_n_u32_f32(v13, 2uLL));
    }
    else
    {
      __B = 1.0 / *a7;
      __C = -(float)(*a6 * __B);
      vDSP_vsmsa((const float *)(a1 + 4 * a2), 1, &__B, &__C, (float *)(a5 + 4 * a2), 1, (unint64_t)v13);
    }
  }
  return 0;
}

uint64_t Projections_computeMeanStdTable(float *a1, int a2, _QWORD *a3)
{
  _DWORD *v3;
  _DWORD *v4;
  float *v5;
  float *v6;
  uint64_t v7;
  float v8;

  v3 = (_DWORD *)*a3;
  v4 = (_DWORD *)a3[1];
  *(_DWORD *)*a3 = 0;
  *v4 = 0;
  if (a2 >= 1)
  {
    v5 = (float *)(v3 + 1);
    v6 = (float *)(v4 + 1);
    v7 = (a2 + 1) - 1;
    do
    {
      *v5 = *(v5 - 1) + *a1;
      ++v5;
      v8 = *a1++;
      *v6 = *(v6 - 1) + (float)(v8 * v8);
      ++v6;
      --v7;
    }
    while (v7);
  }
  return 0;
}

uint64_t Stitcher_SceneCut_postProcessCostImage(uint64_t a1, vImagePixelCount a2, vImagePixelCount a3)
{
  return FastFilter_execute(*(_QWORD *)(a1 + 104), *(_DWORD *)(a1 + 96), *(CVPixelBufferRef *)(a1 + 112), *(__CVBuffer **)(a1 + 112), 0, 0, a2, a3);
}

_QWORD *Stitcher_SceneCut_findVerticalSeam_orig(_QWORD *result, unint64_t a2, unint64_t a3)
{
  _QWORD *v5;
  unsigned __int8 *v6;
  _DWORD *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  BOOL *v12;
  unsigned __int8 *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  _DWORD *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  unsigned __int8 *v23;
  _DWORD *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  BOOL v32;
  char v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v5 = result;
  result[6] = a3;
  if (a2)
  {
    v6 = (unsigned __int8 *)result[11];
    v7 = (_DWORD *)result[2];
    v8 = a2;
    do
    {
      v9 = *v6++;
      *v7++ = v9;
      --v8;
    }
    while (v8);
  }
  v10 = a3 - 1;
  if (a3 <= 1)
  {
    v14 = a2 - 1;
  }
  else
  {
    v48 = a3 - 1;
    v11 = result[7];
    v12 = (BOOL *)(*result + v11);
    v13 = (unsigned __int8 *)(result[11] + v11);
    v14 = a2 - 1;
    v15 = a2 - 2;
    for (i = 1; i != a3; ++i)
    {
      v17 = (_DWORD *)v5[1];
      v18 = (unsigned int *)v5[2];
      v19 = *v18;
      v20 = v18[1];
      v21 = v20 < *v18;
      if (v20 >= *v18)
        v22 = *v18;
      else
        v22 = v18[1];
      v23 = v13 + 1;
      *v17 = v22 + *v13;
      v24 = v17 + 1;
      *v12 = v21;
      v25 = v12 + 1;
      if (v14 >= 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = v18 + 2;
        do
        {
          v29 = v19;
          v19 = v20;
          v30 = v27 + 1;
          v20 = v28[v27];
          v31 = v27;
          if (v29 >= v19)
          {
            v29 = v19;
            v31 = v27 + 1;
          }
          v32 = v20 >= v29;
          if (v20 < v29)
            v29 = v28[v27];
          v24[v27] = v29 + v23[v27];
          if (v32)
            v33 = v31;
          else
            v33 = v27 + 2;
          v25[v27] = v33;
          v26 -= 4;
          ++v27;
        }
        while (v15 != v30);
        if (v19 >= v20)
          v22 = v20;
        else
          v22 = v19;
        v23 += v30;
        v24 = (_DWORD *)((char *)v24 - v26);
        v25 += v30;
      }
      if (v19 >= v20)
        v34 = a2 - 1;
      else
        v34 = a2 - 2;
      *v24 = v22 + *v23;
      *v25 = v34;
      result = memcpy((void *)v5[2], (const void *)v5[1], 4 * a2);
      v35 = v5[7];
      v13 += v35;
      v12 += v35;
    }
    v10 = v48;
  }
  v36 = 0;
  v37 = v5[1];
  v38 = a2 >> 1;
  v39 = *(_DWORD *)(v37 + 4 * (a2 >> 1));
  v40 = v39;
  do
  {
    if (*(_DWORD *)(v37 + 4 * v36) < v40)
    {
      LOBYTE(v39) = *(_DWORD *)(v37 + 4 * v36);
      v40 = *(_DWORD *)(v37 + 4 * v36);
      v38 = v36;
    }
    ++v36;
  }
  while (v36 <= v14);
  v41 = v5[4];
  *(_QWORD *)(v5[3] + 8 * v10) = v38;
  *(_BYTE *)(v41 + v10) = v39;
  if ((int)a3 >= 2)
  {
    v42 = (a3 - 2);
    v43 = v5[7] * v10;
    v44 = v5[11] + v43;
    v45 = *v5 + v43;
    do
    {
      v38 = *(unsigned __int8 *)(v45 + v38);
      v46 = v5[4];
      *(_QWORD *)(v5[3] + 8 * v42) = v38;
      *(_BYTE *)(v46 + v42) = *(_BYTE *)(v44 + v38);
      v47 = v5[7];
      v45 -= v47;
      v44 -= v47;
      --v42;
    }
    while (v42 != -1);
  }
  return result;
}

unint64_t minInRange(unsigned int *a1, uint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  unsigned int v5;
  unsigned int v6;

  v5 = *(_DWORD *)(a2 + 4 * a5);
  *a1 = v5;
  while (a3 <= a4)
  {
    v6 = *(_DWORD *)(a2 + 4 * a3);
    if (v6 < v5)
    {
      *a1 = v6;
      v5 = v6;
      a5 = a3;
    }
    ++a3;
  }
  return a5;
}

uint64_t Stitcher_SceneCut_findVerticalSeam_NEON(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[11];

  v3 = a3;
  v26[10] = *MEMORY[0x24BDAC8D0];
  a1[6] = a3;
  v6 = a1[11];
  v7 = a1[1];
  if (a2)
  {
    v8 = a2;
    v9 = (unsigned __int8 *)a1[11];
    v10 = (_DWORD *)a1[1];
    do
    {
      v11 = *v9++;
      *v10++ = v11;
      --v8;
    }
    while (v8);
  }
  v25 = 0x706050403020100;
  v12 = a1[7];
  v26[0] = *a1 + v12;
  v26[1] = v6 + v12;
  v13 = a3 - 1;
  v26[2] = a2;
  v26[3] = a3 - 1;
  v26[4] = v7;
  v26[5] = &v25;
  v26[6] = v12;
  memset(&v26[7], 0, 24);
  result = sub_22763A400((uint64_t)v26);
  v15 = 0;
  v16 = a1[1];
  v17 = a2 >> 1;
  v18 = *(_DWORD *)(v16 + 4 * (a2 >> 1));
  v19 = v18;
  do
  {
    if (*(_DWORD *)(v16 + 4 * v15) < v19)
    {
      v18 = *(_DWORD *)(v16 + 4 * v15);
      v19 = v18;
      v17 = v15;
    }
    ++v15;
  }
  while (v15 <= a2 - 1);
  *(_QWORD *)(a1[3] + 8 * v13) = v17;
  *(_BYTE *)(a1[4] + v13) = v18;
  if (v3 >= 2)
  {
    v20 = (v3 - 2);
    v21 = a1[7] * v13;
    v22 = a1[11] + v21;
    v23 = *a1 + v21;
    do
    {
      v17 = *(unsigned __int8 *)(v23 + v17);
      *(_QWORD *)(a1[3] + 8 * v20) = v17;
      *(_BYTE *)(a1[4] + v20) = *(_BYTE *)(v22 + v17);
      v24 = a1[7];
      v23 -= v24;
      v22 -= v24;
      --v20;
    }
    while (v20 != -1);
  }
  return result;
}

void Stitcher_SceneCut_calculateCostImage_Yuv(_QWORD *a1, unsigned __int8 *a2, const char *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, const char *a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  char *v17;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v26;
  uint64_t v27;
  unint64_t v38;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v49;
  unint64_t v53;
  int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v69;
  uint8x8_t v74;
  unint64_t v75;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  unsigned __int8 *v84;
  int8x8x2_t v86;
  uint16x8_t v87;
  int8x8x2_t v88;
  int8x8x2_t v89;
  int8x8x2_t v90;

  v17 = (char *)a1[11];
  v19 = (_BYTE *)a1[16];
  v18 = (char *)a1[17];
  v84 = (unsigned __int8 *)a1[39];
  Stitcher_SceneCut_calculateSpatialBiasLut((uint64_t)a1, a10);
  if (a11)
  {
    v20 = 0;
    v21 = v84;
    if (!*(_DWORD *)(a1[42] + 4))
      v21 = 0;
    v22 = a10 >> 4;
    if (a10 >> 4 <= 1)
      v22 = 1;
    do
    {
      _X14 = v19;
      _X13 = a6;
      _X12 = a2;
      if (a10 >= 0x10)
      {
        v26 = 0;
        v27 = v22;
        do
        {
          _X13 = &a2[v26];
          _X15 = &a6[v26];
          _X16 = (uint8x16_t *)&v19[v26];
          __asm
          {
            PRFM            #1, [X13]
            PRFM            #1, [X15]
            PRFM            #0x11, [X16]
          }
          *_X16 = vshrq_n_u8(vabdq_u8(*(uint8x16_t *)&a6[v26], *(uint8x16_t *)&a2[v26]), 1uLL);
          v26 += 16;
          --v27;
        }
        while (v27);
        _X12 = &a2[v26];
        _X13 = &a6[v26];
        _X14 = &v19[v26];
      }
      v38 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X12]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v43 = *_X12++;
          v42 = v43;
          v44 = *_X13++;
          v45 = v44 - v42;
          if (v45 < 0)
            v45 = -v45;
          *_X14++ = v45 >> 1;
          --v38;
        }
        while (v38);
      }
      if (!v20 || (v20 & 1) != 0)
      {
        _X12 = v18;
        _X13 = a7;
        _X14 = a3;
        v49 = v22;
        if (a10 >= 0x10)
        {
          do
          {
            __asm
            {
              PRFM            #1, [X14]
              PRFM            #1, [X13]
              PRFM            #0x11, [X12]
            }
            v86 = vld2_s8(_X14);
            _X14 += 16;
            v88 = vld2_s8(_X13);
            _X13 += 16;
            v86.val[0] = (int8x8_t)vhadd_u8(vabd_u8((uint8x8_t)v88.val[1], (uint8x8_t)v86.val[1]), vabd_u8((uint8x8_t)v88.val[0], (uint8x8_t)v86.val[0]));
            v86.val[1] = v86.val[0];
            vst2_s8(_X12, v86);
            _X12 += 16;
            --v49;
          }
          while (v49);
        }
        a3 += a4;
        a7 += a8;
        if ((a10 & 0xF) != 0)
        {
          v53 = 0;
          do
          {
            _X16 = &_X14[v53];
            _X17 = &_X13[v53];
            _X0 = &_X12[v53];
            __asm
            {
              PRFM            #1, [X16]
              PRFM            #1, [X17]
              PRFM            #0x11, [X0]
            }
            v60 = _X13[v53] - _X14[v53];
            if (v60 < 0)
              v60 = _X14[v53] - _X13[v53];
            v61 = *((unsigned __int8 *)_X17 + 1) - *((unsigned __int8 *)_X16 + 1);
            if (v61 < 0)
              v61 = -v61;
            v62 = (v61 + v60) >> 1;
            *_X0 = v62;
            _X0[1] = v62;
            v53 += 2;
          }
          while ((a10 & 0xF) > v53);
        }
      }
      v63 = a1[7];
      _X13 = (const char *)a1[15];
      if (*(_DWORD *)(a1[42] + 4))
      {
        if (*v21++)
          _X13 = (const char *)a1[38];
      }
      _X14 = v17;
      _X15 = v19;
      _X16 = v18;
      v69 = v22;
      if (a10 >= 0x10)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X15]
            PRFM            #1, [X16]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v87 = (uint16x8_t)vld2_s8(_X15);
          _X15 += 16;
          v89 = vld2_s8(_X16);
          _X16 += 16;
          v90 = vld2_s8(_X13);
          _X13 += 16;
          v74 = vhadd_u8(*(uint8x8_t *)v87.i8, (uint8x8_t)v89.val[0]);
          v87 = vmull_u8((uint8x8_t)v90.val[1], vhadd_u8((uint8x8_t)v87.u64[1], (uint8x8_t)v89.val[1]));
          v87.u64[1] = (unint64_t)vqshrn_n_u16(vmull_u8((uint8x8_t)v90.val[0], v74), 8uLL);
          v89.val[0] = (int8x8_t)vqshrn_n_u16(v87, 8uLL);
          vst2_s8(_X14, *(int8x8x2_t *)((char *)&v87 + 8));
          _X14 += 16;
          --v69;
        }
        while (v69);
      }
      v75 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X15]
            PRFM            #1, [X16]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v81 = *(unsigned __int8 *)_X15++;
          v80 = v81;
          v82 = *(unsigned __int8 *)_X16++;
          v83 = v82 + v80;
          LOWORD(v82) = *(unsigned __int8 *)_X13++;
          *_X14++ = (unsigned __int16)((v83 >> 1) * v82) >> 8;
          --v75;
        }
        while (v75);
      }
      a2 += a4;
      a6 += a8;
      v17 += v63;
      ++v20;
    }
    while (v20 != a11);
  }
}

void Stitcher_SceneCut_calculateSpatialBiasLut(uint64_t a1, unint64_t a2)
{
  float v4;
  uint64_t v5;
  float v6;

  if (a2)
  {
    v4 = (float)a2 * 4.0;
    v5 = 0;
    v6 = (float)(1.0 / (float)(1.1 - expf(-(float)((float)((float)a2 / v4) * (float)((float)a2 / v4))))) * 255.0;
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 120) + v5) = (int)(float)(v6
                                                          * (float)(1.1
                                                                  - expf(-(float)((float)((float)(int)v5 / v4)
                                                                                * (float)((float)(int)v5 / v4)))));
      ++v5;
    }
    while (a2 != v5);
  }
}

uint64_t Stitcher_SceneCut_setStraightVerticalSeam(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;

  if (a11)
  {
    v12 = 0;
    v13 = 0;
    v14 = (unsigned __int8 *)(a7 + a12);
    v15 = (unsigned __int8 *)(a3 + a12);
    do
    {
      v16 = *(unsigned __int8 *)(a6 + a12) - *(unsigned __int8 *)(a2 + a12);
      if (v16 < 0)
        v16 = *(unsigned __int8 *)(a2 + a12) - *(unsigned __int8 *)(a6 + a12);
      if (!v13 || (v13 & 1) != 0)
      {
        v17 = *v15;
        v15 += a4;
        v18 = *v14;
        v14 += a8;
        v12 = v18 - v17;
        if (v12 < 0)
          v12 = -v12;
        v12 = v12;
      }
      a2 += a4;
      *(_BYTE *)(*(_QWORD *)(result + 32) + v13) = ((v16 >> 1) + v12) >> 1;
      a6 += a8;
      *(_QWORD *)(*(_QWORD *)(result + 24) + 8 * v13++) = a12;
    }
    while (a11 != v13);
  }
  return result;
}

void Stitcher_SceneCut_calculateCostImage_Y(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  const char *v31;
  const char *v32;
  char *v33;
  uint64_t v34;
  uint16x8_t v35;
  unint64_t v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  uint16x8_t v40;
  int8x8x2_t v41;

  Stitcher_SceneCut_calculateSpatialBiasLut((uint64_t)a1, a10);
  if (a11)
  {
    v16 = 0;
    v17 = (_BYTE *)a1[16];
    v18 = (char *)a1[11];
    v19 = a10 >> 4;
    if (a10 >> 4 <= 1)
      v19 = 1;
    do
    {
      v20 = a1[7];
      v21 = v17;
      v22 = a6;
      v23 = a2;
      if (a10 >= 0x10)
      {
        v24 = 0;
        v25 = v19;
        do
        {
          *(uint8x16_t *)&v17[v24] = vshrq_n_u8(vabdq_u8(*(uint8x16_t *)&a6[v24], *(uint8x16_t *)&a2[v24]), 1uLL);
          v24 += 16;
          --v25;
        }
        while (v25);
        v23 = &a2[v24];
        v22 = &a6[v24];
        v21 = &v17[v24];
      }
      v26 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          v28 = *v23++;
          v27 = v28;
          v29 = *v22++;
          v30 = v29 - v27;
          if (v30 < 0)
            v30 = -v30;
          *v21++ = v30 >> 1;
          --v26;
        }
        while (v26);
      }
      v31 = (const char *)a1[15];
      v32 = v17;
      v33 = v18;
      v34 = v19;
      if (a10 >= 0x10)
      {
        do
        {
          v40 = (uint16x8_t)vld2_s8(v32);
          v32 += 16;
          v41 = vld2_s8(v31);
          v31 += 16;
          v35 = vmull_u8((uint8x8_t)v41.val[0], *(uint8x8_t *)v40.i8);
          v40 = vmull_u8((uint8x8_t)v41.val[1], (uint8x8_t)v40.u64[1]);
          v40.u64[1] = (unint64_t)vqshrn_n_u16(v35, 8uLL);
          v41.val[0] = (int8x8_t)vqshrn_n_u16(v40, 8uLL);
          vst2_s8(v33, *(int8x8x2_t *)((char *)&v40 + 8));
          v33 += 16;
          --v34;
        }
        while (v34);
      }
      v36 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          v38 = *(unsigned __int8 *)v32++;
          v37 = v38;
          v39 = *(unsigned __int8 *)v31++;
          *v33++ = (unsigned __int16)(v39 * v37) >> 8;
          --v36;
        }
        while (v36);
      }
      a2 += a4;
      a6 += a8;
      v18 += v20;
      ++v16;
    }
    while (v16 != a11);
  }
}

void Stitcher_SceneCut_calculateFlarePerRow(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  int v24;
  char v25;

  _X22 = a3;
  _X23 = a2;
  v12 = *(_QWORD *)(a1 + 312);
  Stitcher_SceneCut_calculateSpatialBiasLutFlare(a1, a6);
  if (a7)
  {
    v13 = 0;
    v14 = _X22;
    do
    {
      if ((v13 == 0) | v13 & 1)
        v15 = a4;
      else
        v15 = 0;
      v16 = &v14[v15];
      v17 = *(unsigned __int8 *)(v12 + v13);
      if ((v13 == 0) | v13 & 1)
        _X22 = v14;
      __asm
      {
        PRFM            #1, [X23]
        PRFM            #1, [X22]
      }
      v24 = FlareDetector_avgFlareProbability(_X23, _X22, a6);
      v25 = v17 > 1;
      if (v24)
        v25 = 2;
      *(_BYTE *)(v12 + v13++) = v25;
      v14 = v16;
      _X23 += a4;
    }
    while (a7 != v13);
  }
}

void Stitcher_SceneCut_calculateSpatialBiasLutFlare(uint64_t a1, unint64_t a2)
{
  float v4;
  uint64_t v5;
  float v6;

  if (a2)
  {
    v4 = (float)a2 * 0.01;
    v5 = 0;
    v6 = (float)(1.0 / (float)(1.1 - expf(-(float)((float)((float)a2 / v4) * (float)((float)a2 / v4))))) * 255.0;
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 304) + v5) = (int)(float)(v6
                                                          * (float)(1.1
                                                                  - expf(-(float)((float)((float)(int)v5 / v4)
                                                                                * (float)((float)(int)v5 / v4)))));
      ++v5;
    }
    while (a2 != v5);
  }
}

uint64_t Stitcher_SceneCut_blendToReferencePoisson_NoExposureDifference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, float a9, float a10, float a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, vDSP_Length a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  unsigned __int128 v27;
  unsigned __int128 v28;
  float *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float *v33;
  float *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  unint64_t v41;
  float v42;
  float v43;
  float v44;
  _BYTE *v45;
  _BYTE *v46;
  float v47;
  float v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float *v57;
  float *v58;
  _QWORD *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  float v63;
  unsigned int v64;
  float v65;
  float v66;
  int v67;
  int16x8_t v68;
  unsigned int v69;
  int16x8_t v70;
  int16x8_t v71;
  char v72;
  unint64_t v73;
  int8x8_t *v74;
  char v75;
  unint64_t v76;
  _QWORD *v77;
  uint64_t v78;
  char *v79;
  const char *v80;
  char *v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  int v88;
  int v89;
  const char *v90;
  int16x8_t v91;
  uint8x8_t v92;
  float *v93;
  _QWORD *v94;
  uint64_t v95;
  int16x8_t v96;
  int16x8_t v97;
  float *v98;
  float *v99;
  uint64_t v102;
  float *v103;
  int16x8_t v104;
  size_t __n;
  _OWORD v107[10];
  _OWORD v108[10];
  uint64_t v109;
  int16x8_t v110;
  int8x8x2_t v111;
  int8x8x2_t v112;

  v20 = a13;
  v109 = *MEMORY[0x24BDAC8D0];
  v23 = *(_QWORD *)(a1 + 216);
  v24 = *(_QWORD *)(a1 + 224);
  v25 = *(_OWORD *)(v23 + 16);
  v108[0] = *(_OWORD *)v23;
  v108[1] = v25;
  v26 = *(_OWORD *)(v24 + 16);
  v27 = (unsigned __int128)vld2q_s16((const __int16 *)v23);
  v97 = (int16x8_t)v27;
  v107[0] = *(_OWORD *)v24;
  v107[1] = v26;
  v28 = (unsigned __int128)vld2q_s16((const __int16 *)v24);
  v96 = (int16x8_t)v28;
  v29 = *(float **)(a1 + 264);
  if (a19)
  {
    v30 = 0;
    v32 = *(_QWORD *)(a1 + 32);
    v31 = *(_QWORD *)(a1 + 40);
    v34 = *(float **)(a1 + 272);
    v33 = *(float **)(a1 + 280);
    v35 = a2;
    v36 = a13;
    v37 = a3;
    v38 = a14;
    v39 = *(_QWORD *)(a1 + 24);
    do
    {
      LOBYTE(a9) = *(_BYTE *)(v32 + v30);
      v40 = (float)LODWORD(a9);
      v41 = (*(_QWORD *)(v39 + 8 * v30) + a20) & 0xFFFFFFFFFFFFFFFELL;
      v42 = (float)(unint64_t)(float)(*(float *)(a1 + 320) * v40) + -5.0;
      if (v42 < 0.0)
        v42 = 0.0;
      *(float *)(v31 + 4 * v30) = v42;
      LOBYTE(v42) = *(_BYTE *)(v35 + v41);
      LOBYTE(v40) = *(_BYTE *)(v36 + v41);
      v43 = (float)((float)LODWORD(v42) - (float)LODWORD(v40)) * 0.5;
      a9 = *(float *)(a1 + 320);
      v44 = a9 * v43;
      v29[v30] = v44;
      if ((v30 & 1) == 0)
      {
        v45 = (_BYTE *)(v37 + v41);
        v37 += a4;
        v46 = (_BYTE *)(v38 + v41);
        v38 += a15;
        LOBYTE(v44) = *v45;
        LOBYTE(a9) = *v46;
        v47 = (float)((float)LODWORD(v44) - (float)LODWORD(a9)) * 0.5;
        v48 = *(float *)(a1 + 320);
        v49 = v48 * v47;
        LOBYTE(a10) = v45[1];
        LOBYTE(a11) = v46[1];
        a11 = (float)LODWORD(a11);
        a10 = (float)((float)LODWORD(a10) - a11) * 0.5;
        a9 = v48 * a10;
        *v34++ = v49;
        *v33++ = a9;
      }
      v35 += a4;
      v36 += a15;
      ++v30;
    }
    while (a19 != v30);
  }
  v102 = a14;
  v50 = a1;
  v51 = a3;
  FIR1DFilter_execute(*(_QWORD *)(a1 + 256), v29, a19);
  FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 272), a19 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 280), a19 >> 1);
  result = FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 40), a19);
  v54 = a4;
  v53 = a15;
  if (a19)
  {
    v55 = v51;
    v56 = 0;
    v57 = *(float **)(a1 + 40);
    v99 = *(float **)(a1 + 280);
    v58 = *(float **)(a1 + 264);
    v98 = *(float **)(a1 + 272);
    v59 = *(_QWORD **)(a1 + 24);
    do
    {
      v60 = 0;
      v61 = (*v59 + a20) & 0xFFFFFFFFFFFFFFFELL;
      v62 = v61 - 16;
      v63 = (float)(*v57 * 0.1) * *(float *)(a1 + 328);
      v64 = vcvtd_n_s64_f64(v63, 8uLL);
      if (v63 >= 1.0)
        v64 = 256;
      if (*v58 <= 0.0)
        v65 = -0.5;
      else
        v65 = 0.5;
      v66 = *v58 + v65;
      v67 = (int)(float)-v66;
      v68 = vdupq_n_s16(v64);
      v69 = 256 - v64;
      v70 = vdupq_n_s16((256 - v64) * (int)v66);
      __n = a17 - (int)v61 - 16;
      v71 = vdupq_n_s16((256 - v64) * v67);
      v72 = 1;
      v73 = (*v59 + a20) & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        v74 = (int8x8_t *)(a2 + v73);
        *v74 = vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)(v20 + v73)), vmulq_s16(vshrq_n_s16(vmlaq_s16(v70, vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)(a2 + v73), *(uint8x8_t *)(v20 + v73)), 1uLL), v68), 8uLL), (int16x8_t)v108[v60]), 4uLL));
        v75 = v72;
        v74[-2] = vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)(a2 + v73 - 16)), vmulq_s16(vshrq_n_s16(vmlaq_s16(v71, vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)(v20 + v73 - 16), *(uint8x8_t *)(a2 + v73 - 16)), 1uLL), v68), 8uLL), (int16x8_t)v107[v60]), 4uLL));
        v73 += 8;
        v60 = 1;
        v72 = 0;
      }
      while ((v75 & 1) != 0);
      v76 = v61 + 15;
      if ((int)__n > 0)
      {
        v103 = v58;
        v77 = v59;
        v78 = v55;
        v104 = v68;
        result = (uint64_t)memcpy((void *)(a2 + v76 + 1), (const void *)(v20 + v76 + 1), __n);
        v76 = v61 + 15;
        v62 = v61 - 16;
        v68 = v104;
        v59 = v77;
        v58 = v103;
        v55 = v78;
        v54 = a4;
        v53 = a15;
      }
      if ((v56 & 1) == 0)
      {
        v79 = (char *)(v55 + v61);
        v81 = (char *)(v55 + v62);
        v82 = *v98++;
        if (v82 <= 0.0)
          v83 = -0.5;
        else
          v83 = 0.5;
        v84 = v82 + v83;
        v85 = *v99++;
        if (v85 <= 0.0)
          v86 = -0.5;
        else
          v86 = 0.5;
        v87 = v85 + v86;
        v88 = (int)(float)-v84;
        v89 = (int)(float)-v87;
        v90 = (const char *)(v102 + v62);
        v80 = (const char *)(v102 + v61);
        v111 = vld2_s8(v80);
        v112 = vld2_s8(v79);
        v111.val[0] = vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)v111.val[0]), vmulq_s16(vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * (int)v84), vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v112.val[0], (uint8x8_t)v111.val[0]), 1uLL), v68), 8uLL), v97), 4uLL));
        v111.val[1] = vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)v111.val[1]), vmulq_s16(vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * (int)v87), vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v112.val[1], (uint8x8_t)v111.val[1]), 1uLL), v68), 8uLL), v97), 4uLL));
        vst2_s8(v79, v111);
        v110 = (int16x8_t)vld2_s8(v90);
        *(int8x8x2_t *)((char *)&v111 + 8) = vld2_s8(v81);
        v91 = vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * v88), vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v111.val[1], *(uint8x8_t *)v110.i8), 1uLL), v68), 8uLL);
        v110 = vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * v89), vshrq_n_s16((int16x8_t)vsubl_u8(v92, (uint8x8_t)v110.u64[1]), 1uLL), v68), 8uLL);
        v110.u64[1] = (unint64_t)vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8((uint8x8_t)v111.val[1]), vmulq_s16(v91, v96), 4uLL));
        *(int8x8_t *)v91.i8 = vqmovun_s16(vsraq_n_s16((int16x8_t)vmovl_u8(v92), vmulq_s16(v110, v96), 4uLL));
        vst2_s8(v81, *(int8x8x2_t *)((char *)&v110 + 8));
        if ((int)__n >= 1)
        {
          v93 = v58;
          v94 = v59;
          v95 = v55;
          result = (uint64_t)memcpy((void *)(v55 + v76 + 1), (const void *)(v102 + v76 + 1), __n);
          v59 = v94;
          v58 = v93;
          v55 = v95;
          v54 = a4;
          v53 = a15;
        }
        v55 += v54;
        v102 += v53;
      }
      ++v59;
      ++v57;
      ++v58;
      a2 += v54;
      v20 += v53;
      ++v56;
    }
    while (v56 != a19);
  }
  return result;
}

uint64_t Stitcher_SceneCut_blendToReferencePoisson(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, double a11, double a12, float a13, float a14, float a15, uint64_t a16, int a17, uint64_t a18, vDSP_Length a19, uint64_t a20)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  float *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  unint64_t v37;
  float v38;
  float v39;
  float v40;
  _BYTE *v41;
  _BYTE *v42;
  float v43;
  float v44;
  float v45;
  uint64_t v47;
  uint64_t result;
  vDSP_Length v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  float *v55;
  float *v56;
  _QWORD *v57;
  uint64_t v58;
  unint64_t v59;
  int v60;
  float v61;
  unsigned int v62;
  int v63;
  float v64;
  float v65;
  int v66;
  int v67;
  int v68;
  unint64_t v69;
  unint64_t v70;
  _BYTE *v71;
  int v72;
  int v73;
  char v74;
  int v75;
  char v76;
  size_t v77;
  unint64_t v78;
  uint64_t v79;
  float *v80;
  uint64_t v81;
  unint64_t v82;
  vDSP_Length v83;
  uint64_t v84;
  unint64_t v85;
  float v86;
  float v87;
  float v88;
  float v89;
  int v90;
  int v91;
  int v92;
  int v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unsigned __int8 *v97;
  int v98;
  int v99;
  unsigned __int8 v100;
  int v101;
  int v102;
  unsigned __int8 v103;
  int v104;
  int v105;
  unsigned __int8 v106;
  unsigned int v107;
  char v108;
  char v109;
  BOOL v110;
  uint64_t v111;
  float *v112;
  uint64_t v113;
  uint64_t v114;
  float *v115;
  int v116;
  unint64_t v117;
  unint64_t v118;
  float *v119;
  float *v120;
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v126;

  v126 = a6;
  v124 = a3;
  v21 = a1;
  if (!*(_BYTE *)(a1 + 332))
    return Stitcher_SceneCut_blendToReferencePoisson_NoExposureDifference(a1, a2, a3, a4, a9, a10, a11, a12, a13, a14, a15, a5, a6, a7, a8, a16, a17, a18, a19,
             a20);
  v22 = *(_QWORD *)(a1 + 232);
  v23 = *(_QWORD *)(a1 + 240);
  v24 = *(_QWORD *)(a1 + 248);
  v25 = *(float **)(a1 + 264);
  if (a19)
  {
    v26 = 0;
    v28 = *(_QWORD *)(a1 + 32);
    v27 = *(_QWORD *)(a1 + 40);
    v30 = *(float **)(a1 + 272);
    v29 = *(float **)(a1 + 280);
    v31 = a2;
    v32 = a6;
    v33 = a3;
    v34 = a7;
    v35 = *(_QWORD *)(a1 + 24);
    do
    {
      LOBYTE(a13) = *(_BYTE *)(v28 + v26);
      v36 = (float)LODWORD(a13);
      v37 = (*(_QWORD *)(v35 + 8 * v26) + a20) & 0xFFFFFFFFFFFFFFFELL;
      v38 = (float)(unint64_t)(float)(*(float *)(v21 + 320) * v36) + -5.0;
      if (v38 < 0.0)
        v38 = 0.0;
      *(float *)(v27 + 4 * v26) = v38;
      LOBYTE(v38) = *(_BYTE *)(v31 + v37);
      LOBYTE(v36) = *(_BYTE *)(v32 + v37);
      v39 = (float)((float)LODWORD(v38) - (float)LODWORD(v36)) * 0.5;
      a13 = *(float *)(v21 + 320);
      v40 = a13 * v39;
      v25[v26] = v40;
      if ((v26 & 1) == 0)
      {
        v41 = (_BYTE *)(v33 + v37);
        v33 += a4;
        v42 = (_BYTE *)(v34 + v37);
        v34 += a8;
        LOBYTE(v40) = *v41;
        LOBYTE(a13) = *v42;
        v43 = (float)((float)LODWORD(v40) - (float)LODWORD(a13)) * 0.5;
        v44 = *(float *)(v21 + 320);
        v45 = v44 * v43;
        LOBYTE(a14) = v41[1];
        LOBYTE(a15) = v42[1];
        a15 = (float)LODWORD(a15);
        a14 = (float)((float)LODWORD(a14) - a15) * 0.5;
        a13 = v44 * a14;
        *v30++ = v45;
        *v29++ = a13;
      }
      v31 += a4;
      v32 += a8;
      ++v26;
    }
    while (a19 != v26);
  }
  v47 = a2;
  FIR1DFilter_execute(*(_QWORD *)(v21 + 256), v25, a19);
  FIR1DFilter_execute(*(_QWORD *)(v21 + 256), *(void **)(v21 + 272), a19 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v21 + 256), *(void **)(v21 + 280), a19 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v21 + 256), *(void **)(v21 + 40), a19);
  result = a20;
  v49 = a19;
  v50 = a8;
  v51 = a17;
  if (a19)
  {
    v52 = v47;
    v53 = a7;
    v54 = 0;
    v55 = *(float **)(v21 + 40);
    v56 = *(float **)(v21 + 264);
    v119 = *(float **)(v21 + 272);
    v120 = *(float **)(v21 + 280);
    v57 = *(_QWORD **)(v21 + 24);
    v114 = v21;
    do
    {
      v58 = 0;
      v59 = (*v57 + result) & 0xFFFFFFFFFFFFFFFELL;
      v117 = v59 - 64;
      v60 = v51 - v59 - 64;
      v61 = (float)(*v55 * *(float *)(v21 + 328)) * 0.1;
      v62 = vcvtd_n_s64_f64(v61, 8uLL);
      if (v61 >= 1.0)
        v63 = 256;
      else
        v63 = v62;
      if (*v56 <= 0.0)
        v64 = -0.5;
      else
        v64 = 0.5;
      v65 = *v56 + v64;
      v66 = (__int16)(256 - v63);
      v67 = v66 * *(__int16 *)(v24 + 2 * (int)v65 + 256);
      v116 = v66;
      v68 = v66 * *(__int16 *)(v24 + 2 * (int)(float)-v65 + 256);
      v69 = v126 + v59;
      v70 = v52 + v59;
      do
      {
        v71 = (_BYTE *)(v70 + v58);
        v72 = *(__int16 *)(v22 + 2 * v58);
        v73 = (__int16)(*(unsigned __int8 *)(v69 + v58)
                      + (unsigned __int16)(((__int16)((v67
                                                                   + v63
                                                                   * *(__int16 *)(v24
                                                                                + 2
                                                                                * (((*(unsigned __int8 *)(v70 + v58)
                                                                                                 - *(unsigned __int8 *)(v69 + v58)) >> 1)
                                                                                               + 128))) >> 8)
                                                        * v72) >> 6));
        if (v73 >= 255)
          LOBYTE(v73) = -1;
        if (((*(unsigned __int8 *)(v69 + v58)
             + (((__int16)((v67
                                        + v63
                                        * *(__int16 *)(v24
                                                     + 2
                                                     * (((*(unsigned __int8 *)(v70 + v58)
                                                                      - *(unsigned __int8 *)(v69 + v58)) >> 1)
                                                                    + 128))) >> 8)
                             * v72) >> 6)) & 0x8000) != 0)
          v74 = 0;
        else
          v74 = v73;
        *v71 = v74;
        v75 = (__int16)(*(v71 - 64)
                      + (unsigned __int16)(((__int16)((v68
                                                                   + v63
                                                                   * *(__int16 *)(v24
                                                                                + 2
                                                                                * (((*(unsigned __int8 *)(v69 + v58 - 64)
                                                                                                 - *(v71 - 64)) >> 1)
                                                                                               + 128))) >> 8)
                                                        * *(__int16 *)(v23 + 2 * v58)) >> 6));
        if (v75 >= 255)
          LOBYTE(v75) = -1;
        if (((*(v71 - 64)
             + (((__int16)((v68
                                        + v63
                                        * *(__int16 *)(v24
                                                     + 2
                                                     * (((*(unsigned __int8 *)(v69 + v58 - 64)
                                                                      - *(v71 - 64)) >> 1)
                                                                    + 128))) >> 8)
                             * *(__int16 *)(v23 + 2 * v58)) >> 6)) & 0x8000) != 0)
          v76 = 0;
        else
          v76 = v75;
        *(v71 - 64) = v76;
        ++v58;
      }
      while (v58 != 64);
      v77 = v60;
      v118 = v59;
      v78 = v59 + 63;
      v122 = v57;
      v123 = v54;
      if (v60 > 0)
      {
        v115 = v56;
        v79 = v53;
        v80 = v55;
        v81 = v52;
        v82 = v78;
        memcpy((void *)(v52 + v78 + 1), (const void *)(v126 + v78 + 1), v60);
        v78 = v82;
        v77 = v60;
        v52 = v81;
        v55 = v80;
        v53 = v79;
        v49 = a19;
        v56 = v115;
        v57 = v122;
        v54 = v123;
        v51 = a17;
        result = a20;
        v50 = a8;
      }
      if ((v54 & 1) != 0)
      {
        v21 = v114;
      }
      else
      {
        v83 = v49;
        v84 = result;
        v85 = 0;
        if (*v119 <= 0.0)
          v86 = -0.5;
        else
          v86 = 0.5;
        v87 = *v119 + v86;
        if (*v120 <= 0.0)
          v88 = -0.5;
        else
          v88 = 0.5;
        v89 = *v120 + v88;
        v90 = v116 * *(__int16 *)(v24 + 2 * (int)v87 + 256);
        v91 = v116 * *(__int16 *)(v24 + 2 * (int)v89 + 256);
        v92 = v116 * *(__int16 *)(v24 + 2 * (int)(float)-v87 + 256);
        v93 = v116 * *(__int16 *)(v24 + 2 * (int)(float)-v89 + 256);
        v94 = v53 + v118;
        v95 = v124 + v117;
        do
        {
          v96 = v94 + v85;
          v97 = (unsigned __int8 *)(v95 + v85);
          v98 = *(__int16 *)(v22 + 2 * v85);
          v99 = (__int16)(*(unsigned __int8 *)(v94 + v85)
                        + (unsigned __int16)(((__int16)((v90
                                                                     + v63
                                                                     * *(__int16 *)(v24
                                                                                  + 2
                                                                                  * (((*(unsigned __int8 *)(v95 + v85 + 64) - *(unsigned __int8 *)(v94 + v85)) >> 1)
                                                                                                 + 128))) >> 8)
                                                          * v98) >> 6));
          if (v99 >= 255)
            LOBYTE(v99) = -1;
          if (((*(unsigned __int8 *)(v94 + v85)
               + (((__int16)((v90
                                          + v63
                                          * *(__int16 *)(v24
                                                       + 2
                                                       * (((*(unsigned __int8 *)(v95 + v85 + 64)
                                                                        - *(unsigned __int8 *)(v94 + v85)) >> 1)
                                                                      + 128))) >> 8)
                               * v98) >> 6)) & 0x8000) != 0)
            v100 = 0;
          else
            v100 = v99;
          v97[64] = v100;
          v101 = *(__int16 *)(v22 + 2 * v85);
          v102 = (__int16)(*(unsigned __int8 *)(v96 + 1)
                         + (unsigned __int16)(((__int16)((v91
                                                                      + v63
                                                                      * *(__int16 *)(v24
                                                                                   + 2
                                                                                   * (((v97[65] - *(unsigned __int8 *)(v96 + 1)) >> 1)
                                                                                                  + 128))) >> 8)
                                                           * v101) >> 6));
          if (v102 >= 255)
            LOBYTE(v102) = -1;
          if (((*(unsigned __int8 *)(v96 + 1)
               + (((__int16)((v91
                                          + v63
                                          * *(__int16 *)(v24
                                                       + 2
                                                       * (((v97[65] - *(unsigned __int8 *)(v96 + 1)) >> 1)
                                                                      + 128))) >> 8)
                               * v101) >> 6)) & 0x8000) != 0)
            v103 = 0;
          else
            v103 = v102;
          v97[65] = v103;
          v104 = *(__int16 *)(v23 + 2 * v85);
          v105 = (__int16)(*v97
                         + (unsigned __int16)(((__int16)((v92
                                                                      + v63
                                                                      * *(__int16 *)(v24
                                                                                   + 2
                                                                                   * (((*(unsigned __int8 *)(v96 - 64) - *v97) >> 1)
                                                                                                  + 128))) >> 8)
                                                           * v104) >> 6));
          if (v105 >= 255)
            LOBYTE(v105) = -1;
          if (((*v97
               + (((__int16)((v92
                                          + v63
                                          * *(__int16 *)(v24
                                                       + 2
                                                       * (((*(unsigned __int8 *)(v96 - 64) - *v97) >> 1)
                                                                      + 128))) >> 8)
                               * v104) >> 6)) & 0x8000) != 0)
            v106 = 0;
          else
            v106 = v105;
          *v97 = v106;
          v107 = v97[1]
               + (((__int16)((v93
                                          + v63
                                          * *(__int16 *)(v24
                                                       + 2
                                                       * (((*(unsigned __int8 *)(v96 - 63) - v97[1]) >> 1)
                                                                      + 128))) >> 8)
                               * *(__int16 *)(v23 + 2 * v85)) >> 6);
          v108 = v107;
          if ((__int16)v107 >= 255)
            v108 = -1;
          if ((v107 & 0x8000) != 0)
            v109 = 0;
          else
            v109 = v108;
          v97[1] = v109;
          v110 = v85 >= 0x3E;
          v85 += 2;
        }
        while (!v110);
        v21 = v114;
        result = v84;
        v49 = v83;
        v50 = a8;
        if (v60 > 0)
        {
          v111 = v53;
          v112 = v55;
          v113 = v52;
          memcpy((void *)(v124 + v78 + 1), (const void *)(v53 + v78 + 1), v77);
          result = a20;
          v49 = a19;
          v52 = v113;
          v55 = v112;
          v53 = v111;
          v57 = v122;
          v54 = v123;
          v51 = a17;
          v50 = a8;
        }
        ++v119;
        ++v120;
        v124 += a4;
        v53 += v50;
      }
      ++v57;
      ++v55;
      ++v56;
      v52 += a4;
      v126 += v50;
      ++v54;
    }
    while (v54 != v49);
  }
  return result;
}

void *Stitcher_SceneCut_blendToReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v16;
  char *v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  void *result;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint8x8_t *v28;
  uint8x8_t *v29;
  size_t v30;
  uint8x8_t v39;
  uint8x8_t v40;
  uint8x8_t v41;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint8x8_t *v57;
  uint8x8_t *v58;
  uint64_t v59;
  uint8x8_t v64;
  uint8x8_t v65;
  uint8x8_t v66;
  char *v71;
  _BYTE v75[160];
  _BYTE __dst[160];
  uint64_t v77;
  int8x8x2_t v78;
  int8x8x2_t v79;
  int8x8x2_t v80;
  int8x8x2_t v81;
  int8x8x2_t v82;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = 176;
  if (!**(_DWORD **)(a1 + 336))
    v16 = 192;
  v17 = *(char **)(a1 + v16);
  if (**(_DWORD **)(a1 + 336))
    v18 = 32;
  else
    v18 = 16;
  v19 = 184;
  if (!**(_DWORD **)(a1 + 336))
    v19 = 200;
  v71 = v17;
  v20 = *(char **)(a1 + v19);
  memcpy(__dst, v17, v18);
  result = memcpy(v75, v20, v18);
  v22 = a12;
  if (a12)
  {
    v23 = 0;
    v24 = *(_QWORD **)(a1 + 24);
    do
    {
      v25 = *v24 & 0xFFFFFFFFFFFFFFFELL;
      v26 = v25 + v18;
      v27 = v25 + v18 - 1;
      v28 = (uint8x8_t *)v75;
      v29 = (uint8x8_t *)__dst;
      v30 = v18 >> 3;
      do
      {
        _X14 = (int8x8_t *)(a2 + v25);
        _X15 = a6 + v25;
        __asm
        {
          PRFM            #0x11, [X14]
          PRFM            #1, [X15]
        }
        v39 = *v29++;
        v40 = v39;
        v41 = *v28++;
        *_X14 = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8(*(uint8x8_t *)(a2 + v25), v41), *(uint8x8_t *)(a6 + v25), v40), 5uLL);
        v25 += 8;
        --v30;
      }
      while (v30);
      if (a10 != v26)
      {
        _X0 = (void *)(a2 + v27 + 1);
        __asm { PRFUM           #0x11, [X9,#1] }
        _X1 = (const void *)(a6 + v27 + 1);
        __asm { PRFUM           #1, [X8,#1] }
        v46 = v22;
        result = memcpy(_X0, _X1, a10 - v26);
        v22 = v46;
      }
      ++v24;
      a2 += a4;
      a6 += a8;
      ++v23;
    }
    while (v23 != v22);
  }
  v47 = 0;
  if (v18 >> 4 <= 1)
    v48 = 1;
  else
    v48 = v18 >> 4;
  do
  {
    v49 = &v71[v47];
    v78 = vld2_s8(v49);
    v50 = &v20[v47];
    v80 = vld2_s8(v50);
    *(int8x8x2_t *)&__dst[v47] = v78;
    *(int8x8x2_t *)&v75[v47] = v80;
    v47 += 16;
  }
  while (16 * v48 != v47);
  if ((unint64_t)(v22 + 1) >= 2)
  {
    v51 = 0;
    v52 = *(_QWORD **)(a1 + 24);
    v53 = (unint64_t)(v22 + 1) >> 1;
    do
    {
      v54 = *v52 & 0xFFFFFFFFFFFFFFFELL;
      v55 = v54 + v18;
      v56 = v54 + v18 - 1;
      v57 = (uint8x8_t *)v75;
      v58 = (uint8x8_t *)__dst;
      v59 = v48;
      do
      {
        _X14 = (const char *)(a7 + v54);
        _X15 = (char *)(a3 + v54);
        __asm
        {
          PRFM            #0x11, [X15]
          PRFM            #1, [X14]
        }
        v64 = *v58;
        v58 += 2;
        v65 = v64;
        v79 = vld2_s8(_X14);
        v81 = vld2_s8(_X15);
        v66 = *v57;
        v57 += 2;
        v82.val[0] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v81.val[0], v66), (uint8x8_t)v79.val[0], v65), 5uLL);
        v82.val[1] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v81.val[1], v66), (uint8x8_t)v79.val[1], v65), 5uLL);
        vst2_s8(_X15, v82);
        v54 += 16;
        --v59;
      }
      while (v59);
      if (a10 != v55)
      {
        _X0 = (void *)(a3 + v56 + 1);
        __asm { PRFUM           #0x11, [X9,#1] }
        _X1 = (const void *)(a7 + v56 + 1);
        __asm { PRFUM           #1, [X8,#1] }
        result = memcpy(_X0, _X1, a10 - v55);
      }
      v52 += 2;
      a3 += a4;
      a7 += a8;
      ++v51;
    }
    while (v51 != v53);
  }
  return result;
}

_QWORD *Stitcher_SceneCut_alphaBlendToReference(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t i;
  uint64_t j;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v41;
  uint8x8_t v42;
  uint8x8_t v43;
  _OWORD v46[10];
  _OWORD v47[10];
  uint64_t v48;
  int8x8x2_t v49;
  int8x8x2_t v50;
  int8x8x2_t v51;
  int8x8x2_t v52;
  int8x8x2_t v53;

  v48 = *MEMORY[0x24BDAC8D0];
  v15 = result[22];
  v14 = result[23];
  v16 = *(_OWORD *)(v15 + 16);
  v47[0] = *(_OWORD *)v15;
  v47[1] = v16;
  v17 = *(_OWORD *)(v14 + 16);
  v46[0] = *(_OWORD *)v14;
  v46[1] = v17;
  if (a12)
  {
    for (i = 0; i != a12; ++i)
    {
      for (j = 0; j != 32; j += 8)
      {
        _X9 = (int8x8_t *)(a2 + j);
        _X10 = a6 + j;
        __asm
        {
          PRFM            #0x11, [X9]
          PRFM            #1, [X10]
        }
        *_X9 = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8(*(uint8x8_t *)(a2 + j), *(uint8x8_t *)((char *)v46 + j)), *(uint8x8_t *)(a6 + j), *(uint8x8_t *)((char *)v47 + j)), 5uLL);
      }
      if (a10 != 32)
        result = memcpy((void *)(a2 + 32), (const void *)(a6 + 32), a10 - 32);
      a2 += a4;
      a6 += a8;
    }
  }
  v30 = 0;
  v31 = 1;
  do
  {
    v49 = vld2_s8((const char *)v15);
    v15 += 16;
    v47[v30] = v49;
    v50 = vld2_s8((const char *)v14);
    v14 += 16;
    v32 = v31;
    v46[v30] = v50;
    v30 = 1;
    v31 = 0;
  }
  while ((v32 & 1) != 0);
  if ((unint64_t)(a12 + 1) >= 2)
  {
    v33 = 0;
    do
    {
      v34 = 0;
      v35 = 0;
      v36 = 1;
      do
      {
        _X11 = (const char *)(a7 + v34);
        _X12 = (char *)(a3 + v34);
        __asm
        {
          PRFM            #0x11, [X12]
          PRFM            #1, [X11]
        }
        v41 = v35;
        v42 = *(uint8x8_t *)&v47[v41];
        v43 = *(uint8x8_t *)&v46[v41];
        v51 = vld2_s8(_X11);
        v52 = vld2_s8(_X12);
        LOBYTE(_X11) = v36;
        v53.val[0] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v52.val[0], v43), (uint8x8_t)v51.val[0], v42), 5uLL);
        v53.val[1] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v52.val[1], v43), (uint8x8_t)v51.val[1], v42), 5uLL);
        vst2_s8(_X12, v53);
        v34 += 16;
        v35 = 1;
        v36 = 0;
      }
      while ((_X11 & 1) != 0);
      if (a10 != 32)
        result = memcpy((void *)(a3 + 32), (const void *)(a7 + 32), a10 - 32);
      a3 += a4;
      a7 += a8;
      ++v33;
    }
    while (v33 != (unint64_t)(a12 + 1) >> 1);
  }
  return result;
}

unint64_t getPrevMultipleOf16(unint64_t result)
{
  if (result > 0x10)
    result &= 0xFFFFFFFFFFFFFFF0;
  return result;
}

void *Stitcher_SceneCut_zero()
{
  return malloc_type_calloc(0x170uLL, 1uLL, 0xA6175993uLL);
}

char *Stitcher_SceneCut_constructor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  _DWORD *v7;
  void *v8;
  size_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _WORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  int32x4_t v47;
  uint64_t *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t i;
  void *v56;
  void *v57;
  uint64_t j;
  _QWORD *v59;
  size_t BytesPerRowOfPlane;
  void *v61;
  void *v62;
  void *v63;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t __x;
  long double v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  int32x4_t v80;
  int32x4_t v81;

  v6 = (char *)malloc_type_calloc(0x170uLL, 1uLL, 0xA6175993uLL);
  v7 = BlendingDefaults_constructor();
  *((_QWORD *)v6 + 42) = v7;
  if (!v7)
    goto LABEL_49;
  *(_QWORD *)(v6 + 324) = 0x3F8000003F800000;
  v6[332] = 0;
  *((_QWORD *)v6 + 7) = a1;
  *((_QWORD *)v6 + 8) = a2;
  *((_QWORD *)v6 + 10) = a2 * a1;
  *((_QWORD *)v6 + 6) = a2;
  *((_OWORD *)v6 + 18) = xmmword_22764C320;
  v8 = malloc_type_malloc(a2 * a1, 0x100004077774924uLL);
  *(_QWORD *)v6 = v8;
  if (!v8)
    goto LABEL_49;
  bzero(v8, a2 * a1);
  v9 = 4 * a1;
  v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  *((_QWORD *)v6 + 1) = v10;
  if (!v10)
    goto LABEL_49;
  bzero(v10, v9);
  v11 = malloc_type_malloc(v9, 0x100004052888210uLL);
  *((_QWORD *)v6 + 2) = v11;
  if (!v11)
    goto LABEL_49;
  bzero(v11, v9);
  v12 = malloc_type_malloc(8 * *((_QWORD *)v6 + 6), 0x100004000313F17uLL);
  *((_QWORD *)v6 + 3) = v12;
  if (!v12)
    goto LABEL_49;
  bzero(v12, 8 * *((_QWORD *)v6 + 6));
  v13 = malloc_type_malloc(*((_QWORD *)v6 + 6), 0x100004077774924uLL);
  *((_QWORD *)v6 + 4) = v13;
  if (!v13)
    goto LABEL_49;
  bzero(v13, *((_QWORD *)v6 + 6));
  v14 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 15) = v14;
  if (!v14)
    goto LABEL_49;
  v15 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 16) = v15;
  if (!v15)
    goto LABEL_49;
  v16 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 17) = v16;
  if (!v16)
    goto LABEL_49;
  v17 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 18) = v17;
  if (!v17)
    goto LABEL_49;
  v18 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 19) = v18;
  if (!v18)
    goto LABEL_49;
  v19 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 20) = v19;
  if (!v19)
    goto LABEL_49;
  v20 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 21) = v20;
  if (!v20)
    goto LABEL_49;
  if (*(_DWORD *)(*((_QWORD *)v6 + 42) + 8))
  {
    v21 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 27) = v21;
    if (!v21)
      goto LABEL_49;
    v22 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 28) = v22;
    if (!v22)
      goto LABEL_49;
    v23 = 0;
    v24 = *((_QWORD *)v6 + 27);
    do
    {
      v22[v23] = v23;
      *(_WORD *)(v24 + 2 * v23) = 16 - v23;
      ++v23;
    }
    while (v23 != 16);
    v25 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 29) = v25;
    if (!v25)
      goto LABEL_49;
    v26 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 30) = v26;
    if (!v26)
      goto LABEL_49;
    v27 = 0;
    v28 = *((_QWORD *)v6 + 29);
    do
    {
      v26[v27] = v27;
      *(_WORD *)(v28 + 2 * v27) = 64 - v27;
      ++v27;
    }
    while (v27 != 64);
    v29 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 31) = v29;
    if (!v29)
      goto LABEL_49;
    v30 = v29;
    v31 = 0;
    v32 = (int32x4_t)xmmword_22764BA70;
    v33 = (int32x4_t)xmmword_22764BA80;
    __asm { FMOV            V2.2D, #10.0 }
    v66 = _Q2;
    v67 = (float64x2_t)vdupq_n_s64(0xC070000000000000);
    __asm { FMOV            V2.2D, #1.0 }
    v65 = _Q2;
    do
    {
      v80 = v33;
      v81 = v32;
      v40.i64[0] = 0x7F0000007FLL;
      v40.i64[1] = 0x7F0000007FLL;
      v41 = vcvtq_f32_s32(vaddq_s32(v32, v40));
      v42 = vcvtq_f32_s32(vaddq_s32(v33, v40));
      v71 = vcvt_hight_f64_f32(v42);
      v72 = vcvtq_f64_f32(*(float32x2_t *)v42.f32);
      v73 = vcvt_hight_f64_f32(v41);
      v74 = vcvtq_f64_f32(*(float32x2_t *)v41.f32);
      v77 = vmulq_f64(vaddq_f64(vabsq_f64(v73), v67), v66);
      v79 = vmulq_f64(vaddq_f64(vabsq_f64(v74), v67), v66);
      v75 = vmulq_f64(vaddq_f64(vabsq_f64(v72), v67), v66);
      __x = vmulq_f64(vaddq_f64(vabsq_f64(v71), v67), v66);
      v69 = exp(__x.f64[1]);
      v43.f64[0] = exp(__x.f64[0]);
      v43.f64[1] = v69;
      v70 = v43;
      __x.f64[0] = exp(v75.f64[1]);
      v44.f64[0] = exp(v75.f64[0]);
      v44.f64[1] = __x.f64[0];
      v76 = v44;
      __x.f64[0] = exp(v77.f64[1]);
      v45.f64[0] = exp(v77.f64[0]);
      v45.f64[1] = __x.f64[0];
      v78 = v45;
      __x.f64[0] = exp(v79.f64[1]);
      v46.f64[0] = exp(v79.f64[0]);
      v46.f64[1] = __x.f64[0];
      *(int16x8_t *)&v30[v31] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v72, vaddq_f64(v76, v65))), vdivq_f64(v71, vaddq_f64(v70, v65)))), (int16x8_t)vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v74, vaddq_f64(v46, v65))), vdivq_f64(v73, vaddq_f64(v78, v65)))));
      v47.i64[0] = 0x800000008;
      v47.i64[1] = 0x800000008;
      v33 = vaddq_s32(v80, v47);
      v32 = vaddq_s32(v81, v47);
      v31 += 16;
    }
    while (v31 != 512);
    v48 = FIR1DFilter_Gaussian(*((_QWORD *)v6 + 6), 8.0);
    *((_QWORD *)v6 + 32) = v48;
    if (!v48)
      goto LABEL_49;
    v49 = malloc_type_malloc(4 * *((_QWORD *)v6 + 6), 0x100004052888210uLL);
    *((_QWORD *)v6 + 33) = v49;
    if (!v49)
      goto LABEL_49;
    v50 = malloc_type_malloc((2 * *((_QWORD *)v6 + 6)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
    *((_QWORD *)v6 + 34) = v50;
    if (!v50)
      goto LABEL_49;
    v51 = malloc_type_malloc((2 * *((_QWORD *)v6 + 6)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
    *((_QWORD *)v6 + 35) = v51;
    if (!v51)
      goto LABEL_49;
    v52 = malloc_type_malloc(4 * *((_QWORD *)v6 + 6), 0x100004052888210uLL);
    *((_QWORD *)v6 + 5) = v52;
    if (!v52)
      goto LABEL_49;
  }
  v53 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 22) = v53;
  if (!v53)
    goto LABEL_49;
  v54 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 23) = v54;
  if (!v54)
    goto LABEL_49;
  for (i = 0; i != 32; ++i)
  {
    *(_BYTE *)(*((_QWORD *)v6 + 22) + i) = i + 1;
    *(_BYTE *)(*((_QWORD *)v6 + 23) + i) = 32 - *(_BYTE *)(*((_QWORD *)v6 + 22) + i);
  }
  v56 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 24) = v56;
  if (!v56)
    goto LABEL_49;
  v57 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 25) = v57;
  if (!v57)
    goto LABEL_49;
  for (j = 0; j != 16; ++j)
  {
    *(_BYTE *)(*((_QWORD *)v6 + 24) + j) = (int)(float)((float)(j + 1) + (float)(j + 1));
    *(_BYTE *)(*((_QWORD *)v6 + 25) + j) = 32 - *(_BYTE *)(*((_QWORD *)v6 + 24) + j);
  }
  if (**((_DWORD **)v6 + 42))
  {
    *((_DWORD *)v6 + 24) = 2;
    v59 = FastFilter_constructor(*((_DWORD *)v6 + 14), *((_DWORD *)v6 + 14), *((_DWORD *)v6 + 16));
    *((_QWORD *)v6 + 13) = v59;
    if (!v59 || FastFilter_allocFilterSpecificData((uint64_t)v59, *((_DWORD *)v6 + 24)) == -1)
      goto LABEL_49;
    CVPixelBufferLockBaseAddress(*((CVPixelBufferRef *)v6 + 14), 0);
    *((_QWORD *)v6 + 11) = CVPixelBufferGetBaseAddressOfPlane(*((CVPixelBufferRef *)v6 + 14), 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*((CVPixelBufferRef *)v6 + 14), 0);
  }
  else
  {
    v61 = malloc_type_malloc(*((_QWORD *)v6 + 10), 0x100004077774924uLL);
    *((_QWORD *)v6 + 11) = v61;
    if (!v61)
    {
LABEL_49:
      Stitcher_SceneCut_destructor(v6);
      return 0;
    }
    bzero(v61, *((_QWORD *)v6 + 10));
    BytesPerRowOfPlane = *((_QWORD *)v6 + 7);
  }
  *((_QWORD *)v6 + 9) = BytesPerRowOfPlane;
  if (*(_DWORD *)(*((_QWORD *)v6 + 42) + 4))
  {
    v62 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
    *((_QWORD *)v6 + 38) = v62;
    if (!v62)
      goto LABEL_49;
    v63 = malloc_type_calloc(*((_QWORD *)v6 + 8), 1uLL, 0xBFAF249AuLL);
    *((_QWORD *)v6 + 39) = v63;
    if (!v63)
      goto LABEL_49;
  }
  *((_QWORD *)v6 + 43) = a3;
  return v6;
}

void Stitcher_SceneCut_destructor(void *a1)
{
  __CVBuffer *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (a1)
  {
    if (**((_DWORD **)a1 + 42))
    {
      v2 = (__CVBuffer *)*((_QWORD *)a1 + 14);
      if (v2)
      {
        CVPixelBufferUnlockBaseAddress(v2, 0);
        CVPixelBufferRelease(*((CVPixelBufferRef *)a1 + 14));
        *((_QWORD *)a1 + 14) = 0;
      }
      v3 = (_QWORD *)*((_QWORD *)a1 + 13);
      if (v3)
      {
        FastFilter_destructor(v3);
        *((_QWORD *)a1 + 13) = 0;
      }
    }
    else
    {
      v4 = (void *)*((_QWORD *)a1 + 11);
      if (v4)
        free(v4);
    }
    v5 = (void *)*((_QWORD *)a1 + 3);
    if (v5)
      free(v5);
    v6 = (void *)*((_QWORD *)a1 + 2);
    if (v6)
      free(v6);
    v7 = (void *)*((_QWORD *)a1 + 1);
    if (v7)
      free(v7);
    if (*(_QWORD *)a1)
      free(*(void **)a1);
    v8 = (void *)*((_QWORD *)a1 + 15);
    if (v8)
      free(v8);
    v9 = (void *)*((_QWORD *)a1 + 16);
    if (v9)
      free(v9);
    v10 = (void *)*((_QWORD *)a1 + 17);
    if (v10)
      free(v10);
    v11 = (void *)*((_QWORD *)a1 + 18);
    if (v11)
      free(v11);
    v12 = (void *)*((_QWORD *)a1 + 19);
    if (v12)
      free(v12);
    v13 = (void *)*((_QWORD *)a1 + 20);
    if (v13)
      free(v13);
    v14 = (void *)*((_QWORD *)a1 + 21);
    if (v14)
      free(v14);
    v15 = (void *)*((_QWORD *)a1 + 22);
    if (v15)
      free(v15);
    v16 = (void *)*((_QWORD *)a1 + 23);
    if (v16)
      free(v16);
    v17 = (void *)*((_QWORD *)a1 + 24);
    if (v17)
      free(v17);
    v18 = (void *)*((_QWORD *)a1 + 25);
    if (v18)
      free(v18);
    v19 = (void *)*((_QWORD *)a1 + 27);
    if (v19)
      free(v19);
    v20 = (void *)*((_QWORD *)a1 + 28);
    if (v20)
      free(v20);
    v21 = (void *)*((_QWORD *)a1 + 29);
    if (v21)
      free(v21);
    v22 = (void *)*((_QWORD *)a1 + 30);
    if (v22)
      free(v22);
    v23 = (void *)*((_QWORD *)a1 + 31);
    if (v23)
      free(v23);
    v24 = (_QWORD *)*((_QWORD *)a1 + 32);
    if (v24)
      FIR1DFilter_destructor(v24);
    v25 = (void *)*((_QWORD *)a1 + 33);
    if (v25)
      free(v25);
    v26 = (void *)*((_QWORD *)a1 + 34);
    if (v26)
      free(v26);
    v27 = (void *)*((_QWORD *)a1 + 35);
    if (v27)
      free(v27);
    v28 = (void *)*((_QWORD *)a1 + 5);
    if (v28)
      free(v28);
    v29 = (void *)*((_QWORD *)a1 + 4);
    if (v29)
      free(v29);
    v30 = (void *)*((_QWORD *)a1 + 38);
    if (v30)
      free(v30);
    v31 = (void *)*((_QWORD *)a1 + 39);
    if (v31)
      free(v31);
    v32 = (void *)*((_QWORD *)a1 + 42);
    if (v32)
      BlendingDefaults_destructor(v32);
    free(a1);
  }
}

uint64_t Stitcher_SceneCut_setDefaults(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CVBuffer *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  int v19;
  _QWORD *v20;
  size_t BytesPerRowOfPlane;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _WORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _WORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  int32x4_t v47;
  int32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float64x2_t v58;
  float64x2_t v59;
  int32x4_t v60;
  uint64_t *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  float64x2_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float64x2_t __x;
  long double v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  int32x4_t v76;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(int **)(a1 + 336);
  v7 = *(_QWORD *)(a1 + 344);
  v8 = v6[1];
  v9 = a2[1];
  if (v8 != v9)
  {
    if (v8)
    {
      v10 = *(void **)(a1 + 304);
      if (v10)
      {
        free(v10);
        *(_QWORD *)(a1 + 304) = 0;
      }
      v11 = *(void **)(a1 + 312);
      if (v11)
      {
        free(v11);
        *(_QWORD *)(a1 + 312) = 0;
      }
      v9 = a2[1];
      v6 = *(int **)(a1 + 336);
    }
    v6[1] = v9;
    if (v9)
    {
      v12 = malloc_type_malloc(*(_QWORD *)(a1 + 56), 0x100004077774924uLL);
      *(_QWORD *)(a1 + 304) = v12;
      if (!v12)
        goto LABEL_69;
      v13 = malloc_type_calloc(*(_QWORD *)(a1 + 64), 1uLL, 0x37D99BD9uLL);
      *(_QWORD *)(a1 + 312) = v13;
      if (!v13)
        goto LABEL_69;
      v6 = *(int **)(a1 + 336);
    }
  }
  v14 = *v6;
  if (v14 == *a2)
    goto LABEL_28;
  if (v14)
  {
    v15 = *(__CVBuffer **)(a1 + 112);
    if (v15)
    {
      CVPixelBufferUnlockBaseAddress(v15, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 112));
      *(_QWORD *)(a1 + 112) = 0;
    }
    v17 = (_QWORD *)(a1 + 104);
    v16 = *(_QWORD **)(a1 + 104);
    if (!v16)
      goto LABEL_21;
    FastFilter_destructor(v16);
    goto LABEL_20;
  }
  v17 = (_QWORD *)(a1 + 88);
  v18 = *(void **)(a1 + 88);
  if (v18)
  {
    free(v18);
LABEL_20:
    *v17 = 0;
  }
LABEL_21:
  v19 = *a2;
  **(_DWORD **)(a1 + 336) = *a2;
  if (v19)
  {
    *(_DWORD *)(a1 + 96) = 2;
    v20 = FastFilter_constructor(*(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 64));
    *(_QWORD *)(a1 + 104) = v20;
    if (!v20 || FastFilter_allocFilterSpecificData((uint64_t)v20, *(_DWORD *)(a1 + 96)) == -1)
      goto LABEL_69;
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 112), 0);
    *(_QWORD *)(a1 + 88) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 112), 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 112), 0);
  }
  else
  {
    v22 = malloc_type_malloc(*(_QWORD *)(a1 + 80), 0x100004077774924uLL);
    *(_QWORD *)(a1 + 88) = v22;
    if (!v22)
      goto LABEL_69;
    bzero(v22, *(_QWORD *)(a1 + 80));
    BytesPerRowOfPlane = *(_QWORD *)(a1 + 56);
  }
  *(_QWORD *)(a1 + 72) = BytesPerRowOfPlane;
LABEL_28:
  v23 = *(_QWORD *)(a1 + 336);
  v24 = *(_DWORD *)(v23 + 8);
  v25 = a2[2];
  if (v24 == v25)
    return 0;
  if (v24)
  {
    v26 = *(void **)(a1 + 216);
    if (v26)
    {
      free(v26);
      *(_QWORD *)(a1 + 216) = 0;
    }
    v27 = *(void **)(a1 + 224);
    if (v27)
    {
      free(v27);
      *(_QWORD *)(a1 + 224) = 0;
    }
    v28 = *(void **)(a1 + 232);
    if (v28)
    {
      free(v28);
      *(_QWORD *)(a1 + 232) = 0;
    }
    v29 = *(void **)(a1 + 240);
    if (v29)
    {
      free(v29);
      *(_QWORD *)(a1 + 240) = 0;
    }
    v30 = *(void **)(a1 + 248);
    if (v30)
    {
      free(v30);
      *(_QWORD *)(a1 + 248) = 0;
    }
    v31 = *(_QWORD **)(a1 + 256);
    if (v31)
    {
      FIR1DFilter_destructor(v31);
      *(_QWORD *)(a1 + 256) = 0;
    }
    v32 = *(void **)(a1 + 264);
    if (v32)
    {
      free(v32);
      *(_QWORD *)(a1 + 264) = 0;
    }
    v33 = *(void **)(a1 + 272);
    if (v33)
    {
      free(v33);
      *(_QWORD *)(a1 + 272) = 0;
    }
    v34 = *(void **)(a1 + 280);
    if (v34)
    {
      free(v34);
      *(_QWORD *)(a1 + 280) = 0;
    }
    v35 = *(void **)(a1 + 40);
    if (v35)
    {
      free(v35);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v25 = a2[2];
    v23 = *(_QWORD *)(a1 + 336);
  }
  *(_DWORD *)(v23 + 8) = v25;
  if (!v25)
    return 0;
  v36 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
  *(_QWORD *)(a1 + 216) = v36;
  if (v36)
  {
    v37 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *(_QWORD *)(a1 + 224) = v37;
    if (v37)
    {
      v38 = 0;
      v39 = *(_QWORD *)(a1 + 216);
      do
      {
        v37[v38] = v38;
        *(_WORD *)(v39 + 2 * v38) = 16 - v38;
        ++v38;
      }
      while (v38 != 16);
      v40 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
      *(_QWORD *)(a1 + 232) = v40;
      if (v40)
      {
        v41 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
        *(_QWORD *)(a1 + 240) = v41;
        if (v41)
        {
          v42 = 0;
          v43 = *(_QWORD *)(a1 + 232);
          do
          {
            v41[v42] = v42;
            *(_WORD *)(v43 + 2 * v42) = 64 - v42;
            ++v42;
          }
          while (v42 != 64);
          v44 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x1000040BDFB0063uLL);
          *(_QWORD *)(a1 + 248) = v44;
          if (v44)
          {
            v45 = v44;
            v46 = 0;
            v47 = (int32x4_t)xmmword_22764BA80;
            __asm
            {
              FMOV            V2.4S, #-10.0
              FMOV            V1.4S, #10.0
            }
            v68 = _Q1;
            v69 = _Q2;
            __asm { FMOV            V1.2D, #1.0 }
            v67 = _Q1;
            do
            {
              v76 = v47;
              v55.i64[0] = 0x7F0000007FLL;
              v55.i64[1] = 0x7F0000007FLL;
              v56 = vcvtq_f32_s32(vaddq_s32(v47, v55));
              v73 = vcvt_hight_f64_f32(v56);
              v74 = vcvtq_f64_f32(*(float32x2_t *)v56.f32);
              v57 = vmulq_f32(vaddq_f32(vabsq_f32(v56), v69), v68);
              v75 = vcvtq_f64_f32(*(float32x2_t *)v57.f32);
              __x = vcvt_hight_f64_f32(v57);
              v71 = exp(__x.f64[1]);
              v58.f64[0] = exp(__x.f64[0]);
              v58.f64[1] = v71;
              v72 = v58;
              __x.f64[0] = exp(v75.f64[1]);
              v59.f64[0] = exp(v75.f64[0]);
              v59.f64[1] = __x.f64[0];
              *(int16x4_t *)&v45[v46] = vmovn_s32(vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v74, vaddq_f64(v59, v67))), vdivq_f64(v73, vaddq_f64(v72, v67)))));
              v60.i64[0] = 0x400000004;
              v60.i64[1] = 0x400000004;
              v47 = vaddq_s32(v76, v60);
              v46 += 8;
            }
            while (v46 != 512);
            v61 = FIR1DFilter_Gaussian(*(_QWORD *)(a1 + 48), 8.0);
            *(_QWORD *)(a1 + 256) = v61;
            if (v61)
            {
              v62 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 48), 0x100004052888210uLL);
              *(_QWORD *)(a1 + 264) = v62;
              if (v62)
              {
                v63 = malloc_type_malloc((2 * *(_QWORD *)(a1 + 48)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
                *(_QWORD *)(a1 + 272) = v63;
                if (v63)
                {
                  v64 = malloc_type_malloc((2 * *(_QWORD *)(a1 + 48)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
                  *(_QWORD *)(a1 + 280) = v64;
                  if (v64)
                  {
                    v65 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 48), 0x100004052888210uLL);
                    *(_QWORD *)(a1 + 40) = v65;
                    if (v65)
                      return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_69:
  Stitcher_SceneCut_destructor((void *)a1);
  if (Stitcher_SceneCut_constructor(v4, v5, v7))
    return 0xFFFFFFFFLL;
  else
    return 4294967294;
}

void Stitcher_SceneCut_reset(uint64_t a1)
{
  if (*(_DWORD *)(*(_QWORD *)(a1 + 336) + 4))
    bzero(*(void **)(a1 + 312), *(_QWORD *)(a1 + 64));
}

uint64_t Stitcher_SceneCut_SNRFactorUpdate(uint64_t result, float a2)
{
  float v2;

  v2 = 1.0;
  if (a2 <= 30.0 && a2 > 0.0)
    v2 = (float)(a2 / 30.0) * (float)(a2 / 30.0);
  *(float *)(result + 320) = v2;
  return result;
}

void Stitcher_SceneCut_ExposureRatioFactorUpdate(uint64_t a1, float a2)
{
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;

  if (a2 == 0.0)
  {
    *(_BYTE *)(a1 + 332) = 0;
    *(_QWORD *)(a1 + 324) = 0x3F8000003F800000;
  }
  else
  {
    *(_BYTE *)(a1 + 332) = 1;
    v4 = *(float *)(a1 + 324);
    v5 = v4 > a2;
    v6 = v4 / a2;
    v7 = a2 / v4;
    if (v5)
      v7 = v6;
    v8 = pow(v7, 0.454545438);
    *(float *)(a1 + 328) = v8;
    *(float *)(a1 + 324) = a2;
  }
}

uint64_t Stitcher_SceneCut_minOverlapWidth(uint64_t a1, float a2)
{
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;

  if (a2 == 0.0)
  {
    *(_BYTE *)(a1 + 332) = 0;
    *(_QWORD *)(a1 + 324) = 0x3F8000003F800000;
  }
  else
  {
    *(_BYTE *)(a1 + 332) = 1;
    v4 = *(float *)(a1 + 324);
    v5 = v4 > a2;
    v6 = v4 / a2;
    v7 = a2 / v4;
    if (v5)
      v7 = v6;
    v8 = pow(v7, 0.454545438);
    *(float *)(a1 + 328) = v8;
    *(float *)(a1 + 324) = a2;
  }
  v9 = 296;
  if (a2 == 0.0)
    v9 = 288;
  return *(_QWORD *)(a1 + v9);
}

uint64_t Stitcher_SceneCut_maxMinOverlapWidth(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 288) <= *(_QWORD *)(a1 + 296))
    return *(_QWORD *)(a1 + 296);
  else
    return *(_QWORD *)(a1 + 288);
}

uint64_t Stitcher_SceneCut_pasteImageToReference(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, vImagePixelCount a13, int a14, int a15)
{
  uint64_t v21;
  int v22;
  unint64_t v23;
  float v24;
  _DWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  double Current;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  float v47;
  float v48;
  double v49;
  CFAbsoluteTime v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v55[64];
  uint64_t v56;

  v21 = result;
  v56 = *MEMORY[0x24BDAC8D0];
  v22 = *(unsigned __int8 *)(result + 332);
  if (*(_BYTE *)(result + 332))
    v23 = *(_QWORD *)(result + 296);
  else
    v23 = *(_QWORD *)(result + 288);
  if (v23 <= a12)
  {
    v24 = 1.0;
    if (a5 <= 30.0 && a5 > 0.0)
      v24 = (float)(a5 / 30.0) * (float)(a5 / 30.0);
    *(float *)(result + 320) = v24;
    v25 = *(_DWORD **)(result + 336);
    if (v25[2] || *v25)
    {
      if (v22)
        v26 = 64;
      else
        v26 = 16;
    }
    else
    {
      v26 = 8;
    }
    v27 = a12 - 2 * v26;
    if (v27 <= 0x10)
      v28 = a12 - 2 * v26;
    else
      v28 = v27 & 0xFFFFFFFFFFFFFFF0;
    Current = CFAbsoluteTimeGetCurrent();
    if (*(_DWORD *)(*(_QWORD *)(v21 + 336) + 4))
      Stitcher_SceneCut_calculateFlarePerRow(v21, a7 + v26, (unsigned __int8 *)(a8 + v26), a9, v29, v28, a13);
    v31 = CFAbsoluteTimeGetCurrent();
    v32 = CFAbsoluteTimeGetCurrent();
    Stitcher_SceneCut_calculateCostImage_Yuv((_QWORD *)v21, (unsigned __int8 *)(a2 + v26), (const char *)(a3 + v26), a4, v33, (unsigned __int8 *)(a7 + v26), (const char *)(a8 + v26), a9, v51, v28, a13);
    v34 = CFAbsoluteTimeGetCurrent();
    v35 = CFAbsoluteTimeGetCurrent();
    if (**(_DWORD **)(v21 + 336))
      FastFilter_execute(*(_QWORD *)(v21 + 104), *(_DWORD *)(v21 + 96), *(CVPixelBufferRef *)(v21 + 112), *(__CVBuffer **)(v21 + 112), 0, 0, v28, a13);
    v36 = v31 - Current;
    v37 = v34 - v32;
    v38 = CFAbsoluteTimeGetCurrent() - v35;
    v39 = CFAbsoluteTimeGetCurrent();
    Stitcher_SceneCut_findVerticalSeam_NEON((_QWORD *)v21, v28, a13);
    v40 = CFAbsoluteTimeGetCurrent() - v39;
    v42 = CFAbsoluteTimeGetCurrent();
    v49 = v42;
    if (*(_DWORD *)(*(_QWORD *)(v21 + 336) + 8))
      Stitcher_SceneCut_blendToReferencePoisson(v21, a2, a3, a4, v41, a7, a8, a9, v42, v43, v44, v45, v46, v47, v48, v52, a11, v53, a13,
        v26);
    else
      Stitcher_SceneCut_blendToReference(v21, a2, a3, a4, v41, a7, a8, a9, v52, a11, v53, a13);
    v50 = CFAbsoluteTimeGetCurrent() - v49;
    __sprintf_chk(v55, 0, 0x40uLL, "BlendingInfo%d", a15);
    return ACTLogMessageImp(1, "{%s|width:%d} {%s|height:%d} {%s|blendingMode:%d} {%s|blendingDefaults:%d} {%s|timeM2M:%.0f} {%s|SNR:%.2f} {%s|inSurfaceID:%d} {%s|outSurfaceID:%d} {%s|flare:%.0f} {%s|cost:%.0f} {%s|wideSceneCut:%.0f} {%s|seam:%.0f} {%s|blend:%.0f} \n", v55, a12, v55, a13, v55, a14, v55, *(_DWORD *)(*(_QWORD *)(v21 + 336) + 4)+ 2 * **(_DWORD **)(v21 + 336)+ 4 * *(_DWORD *)(*(_QWORD *)(v21 + 336) + 8), v55, *(double *)(v21 + 352) * 1000.0, v55, a5, v55,
             *(_DWORD *)(v21 + 360),
             v55,
             *(_DWORD *)(v21 + 364),
             v55,
             v36 * 1000.0,
             v55,
             v37 * 1000.0,
             v55,
             v38 * 1000.0,
             v55,
             v40 * 1000.0,
             v55,
             v50 * 1000.0);
  }
  return result;
}

float32x2_t Projections_fastRecSqrtf(double a1)
{
  float32x2_t v1;
  int8x8_t v2;
  int8x8_t v3;
  float32x2_t v4;
  int8x8_t v5;

  v1 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0);
  v2 = (int8x8_t)vceqz_f32(v1);
  v3 = (int8x8_t)vcgt_s32((int32x2_t)v1, vdup_n_s32(0x7F7FFFFFu));
  v4 = vrsqrte_f32(v1);
  v5 = vorr_s8(v3, v2);
  __asm { FMOV            V3.2S, #1.0 }
  return vmul_f32(v4, (float32x2_t)vbsl_s8(v5, _D3, (int8x8_t)vrsqrts_f32(vmul_n_f32(v4, *(float *)&a1), v4)));
}

float32x2_t Projections_fastSqrtf(double a1)
{
  float32x2_t v1;
  int8x8_t v2;
  int8x8_t v3;
  float32x2_t v4;
  int8x8_t v5;

  *(float *)&a1 = *(float *)&a1 + 0.0;
  v1 = (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a1, 0);
  v2 = (int8x8_t)vceqz_f32(v1);
  v3 = (int8x8_t)vcgt_s32((int32x2_t)v1, vdup_n_s32(0x7F7FFFFFu));
  v4 = vrsqrte_f32(v1);
  v5 = vorr_s8(v3, v2);
  __asm { FMOV            V3.2S, #1.0 }
  return vmul_f32(*(float32x2_t *)&a1, (float32x2_t)vbsl_s8(v5, _D3, (int8x8_t)vmul_f32(v4, vrsqrts_f32(v4, vmul_n_f32(v4, *(float *)&a1)))));
}

BOOL Projections_isZero(float a1)
{
  return (LODWORD(a1) & 0x7FFFFFFF) == 0;
}

unint64_t *Stitcher_Alpha_constructor()
{
  unint64_t *v0;
  unint64_t *v1;
  void *v2;
  void *v3;
  unint64_t v4;

  v0 = (unint64_t *)malloc_type_malloc(0x30uLL, 0x1010040CCA46FA7uLL);
  v1 = v0;
  if (!v0)
    return v1;
  v0[3] = 32;
  *v0 = 32;
  v2 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  v1[1] = (unint64_t)v2;
  if (!v2)
  {
LABEL_9:
    free(v1);
    return 0;
  }
  v3 = malloc_type_malloc(*v1, 0x100004077774924uLL);
  v1[2] = (unint64_t)v3;
  if (!v3)
  {
    free((void *)v1[1]);
    goto LABEL_9;
  }
  if (*v1)
  {
    v4 = 0;
    do
    {
      *(_BYTE *)(v1[1] + v4) = v4 + 1;
      *(_BYTE *)(v1[2] + v4) = *(_BYTE *)v1 - *(_BYTE *)(v1[1] + v4);
      ++v4;
    }
    while (*v1 > v4);
  }
  return v1;
}

uint64_t Stitcher_Alpha_setDefaults()
{
  return 0;
}

void Stitcher_Alpha_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      free(v2);
    v3 = (void *)a1[2];
    if (v3)
      free(v3);
    free(a1);
  }
}

void *Stitcher_Alpha_pasteImageToReference(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12)
{
  unint64_t v16;
  int v17;
  uint64_t v18;
  const void *v19;
  size_t v20;
  uint64_t v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  const char *v28;
  char *v29;
  uint8x8_t v30;
  uint8x8_t v31;
  unint64_t v33;
  uint8x8_t v36[10];
  uint8x8_t __dst[10];
  uint64_t v38;
  int8x8x2_t v39;
  int8x8x2_t v40;
  int8x8x2_t v41;

  v16 = a12;
  v38 = *MEMORY[0x24BDAC8D0];
  v17 = *(_DWORD *)result - 1;
  if (v17 >= (int)a10 - 1)
    v17 = a10 - 1;
  v18 = v17;
  if (v17 != 6)
  {
    v19 = (const void *)*((_QWORD *)result + 2);
    v20 = ((v17 - 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    memcpy(__dst, *((const void **)result + 1), v20);
    result = memcpy(v36, v19, v20);
    v16 = a12;
  }
  if (v16)
  {
    v21 = 0;
    v22 = ~v18 + a10;
    v33 = (unint64_t)(v18 - 7) >> 3;
    do
    {
      if ((_DWORD)v18 != 6)
      {
        v23 = 0;
        do
        {
          *(int8x8_t *)(a2 + 8 * v23) = vrshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8(*(uint8x8_t *)(a2 + 8 * v23), v36[v23]), *(uint8x8_t *)(a6 + 8 * v23), __dst[v23]), 5uLL);
          ++v23;
        }
        while (v33 + 1 != v23);
      }
      if (v22)
      {
        result = memcpy((void *)(a2 + v18 + 1), (const void *)(a6 + v18 + 1), v22);
        v16 = a12;
      }
      a2 += a4;
      a6 += a8;
      ++v21;
    }
    while (v21 != v16);
    if (v16 >= 2)
    {
      v24 = 0;
      v25 = v16 >> 1;
      do
      {
        if ((_DWORD)v18 != 6)
        {
          v26 = 0;
          v27 = ~v33;
          do
          {
            v28 = (const char *)(a7 + v26 * 8);
            v29 = (char *)(a3 + v26 * 8);
            v30 = __dst[v26];
            v39 = vld2_s8(v28);
            v40 = vld2_s8(v29);
            v31 = v36[v26];
            v41.val[0] = vrshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v40.val[0], v31), (uint8x8_t)v39.val[0], v30), 5uLL);
            v41.val[1] = vrshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v40.val[1], v31), (uint8x8_t)v39.val[1], v30), 5uLL);
            vst2_s8(v29, v41);
            ++v26;
          }
          while (!__CFADD__(v27++, 1));
        }
        if (v22)
          result = memcpy((void *)(a3 + v18 + 1), (const void *)(a7 + v18 + 1), v22);
        a3 += a4;
        a7 += a8;
        ++v24;
      }
      while (v24 != v25);
    }
  }
  return result;
}

_QWORD *BlendingCtrl_zero()
{
  _QWORD *v0;
  void *v1;

  v0 = malloc_type_calloc(8uLL, 1uLL, 0x8F692BAuLL);
  if (v0)
  {
    v1 = malloc_type_calloc(0x140uLL, 1uLL, 0x972E5C43uLL);
    *v0 = v1;
    if (!v1)
    {
      free(v0);
      return 0;
    }
  }
  return v0;
}

void BlendingCtrl_createBlendingContext(void ***a1, int a2, uint64_t a3, int a4, size_t a5, uint64_t a6, uint64_t a7)
{
  void **v13;
  void **v14;
  void *v15;
  void **v16;
  int v17;
  int v18;
  const __CFAllocator *v19;
  __CFArray *Value;
  CFNumberRef v21;
  int IOSurfaceBackedCVPixelBufferWithAttributes;
  void *BaseAddressOfPlane;
  void *v24;
  size_t HeightOfPlane;
  unint64_t v26;
  size_t BytesPerRowOfPlane;
  size_t v28;
  uint64_t v29;
  _QWORD *v30;
  const CFDictionaryKeyCallBacks *v31;
  const CFDictionaryValueCallBacks *v32;
  const __CFDictionary *v33;
  const __CFDictionary *Mutable;
  __CFArray *v35;
  CFNumberRef v36;
  uint64_t v37;
  CFNumberRef v38;
  CFNumberRef v39;
  __CFDictionary *IOSurfacePropertiesDictionary;
  uint64_t v41;
  CVPixelBufferRef *v42;
  void *BaseAddress;
  size_t DataSize;
  __CVBuffer *v45;
  uint64_t i;
  _QWORD *v47;
  void **v48;
  _DWORD *v49;
  size_t v50;
  int v51;
  int v52;
  int v53;
  CFDictionaryRef pixelBufferAttributes;
  void *values;
  int v56;
  int valuePtr;
  CFDictionaryRef theDict;
  CFTypeRef cf;
  CVPixelBufferRef pixelBufferOut[3];

  pixelBufferOut[2] = *(CVPixelBufferRef *)MEMORY[0x24BDAC8D0];
  v13 = (void **)BlendingCtrl_zero();
  v14 = v13;
  if (!v13)
    goto LABEL_7;
  v15 = *v13;
  *((_DWORD *)v15 + 8) = a4;
  *((_DWORD *)v15 + 70) = 0;
  *((_QWORD *)v15 + 14) = a5;
  *((_QWORD *)v15 + 15) = a6;
  *((_QWORD *)v15 + 16) = a7;
  v16 = a1[1];
  if (!v16)
    goto LABEL_5;
  v17 = *((_DWORD *)v16 + 26);
  if ((v17 | 2) == 3)
  {
    v18 = 1;
    ACTLogMessageImp(1, "mode = %d: padding buffer to %d", v17, ((a2 + 63) & 0xFFFFFFC0) + 64);
  }
  else
  {
LABEL_5:
    v18 = 0;
  }
  theDict = 0;
  FigCreatePixelBufferAttributesWithIOSurfaceSupport();
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  cf = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
  CFRelease(0);
  Value = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)cf, (const void *)*MEMORY[0x24BDC55F0]);
  valuePtr = 768;
  v21 = CFNumberCreate(v19, kCFNumberSInt32Type, &valuePtr);
  CFArraySetValueAtIndex(Value, 0, v21);
  CFRelease(v21);
  applyWiringAssertionToProperties((CFDictionaryRef *)&cf);
  IOSurfaceBackedCVPixelBufferWithAttributes = FigCreateIOSurfaceBackedCVPixelBufferWithAttributes();
  CFRelease(cf);
  if (IOSurfaceBackedCVPixelBufferWithAttributes)
    goto LABEL_7;
  v50 = a5;
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v15, 0);
  *((_BYTE *)v15 + 8) = 1;
  *((_QWORD *)v15 + 5) = 0;
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v15, 0);
  v24 = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v15, 1uLL);
  *((_QWORD *)v15 + 2) = CVPixelBufferGetWidth(*(CVPixelBufferRef *)v15);
  *((_QWORD *)v15 + 3) = CVPixelBufferGetHeight(*(CVPixelBufferRef *)v15);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)v15, 1uLL);
  v26 = (*((_QWORD *)v15 + 2) + 1) & 0xFFFFFFFFFFFFFFFELL;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v15, 0);
  v28 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v15, 1uLL);
  v29 = *((_QWORD *)v15 + 2);
  if (v18)
  {
    v29 -= 64;
    *((_QWORD *)v15 + 2) = v29;
    v26 -= 64;
  }
  v30 = Blending_constructor((uint64_t)BaseAddressOfPlane, v29, *((_QWORD *)v15 + 3), BytesPerRowOfPlane, (uint64_t)v24, v26, HeightOfPlane, v28, *((_QWORD *)v15 + 14), *((_QWORD *)v15 + 15), *((_QWORD *)v15 + 29));
  *((_QWORD *)v15 + 27) = v30;
  if (!v30)
    goto LABEL_7;
  *((_BYTE *)v30 + 144) = v18;
  v56 = 2;
  values = CFNumberCreate(v19, kCFNumberSInt32Type, &v56);
  v31 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v32 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v33 = CFDictionaryCreate(v19, MEMORY[0x24BDC56F0], (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(values);
  Mutable = CFDictionaryCreateMutable(0, 0, v31, v32);
  pixelBufferAttributes = Mutable;
  v35 = CFArrayCreateMutable(0, 0, MEMORY[0x24BDBD690]);
  v53 = 875704422;
  v36 = CFNumberCreate(0, kCFNumberSInt32Type, &v53);
  CFArrayAppendValue(v35, v36);
  CFRelease(v36);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC56B8], v35);
  CFRelease(v35);
  v37 = *((_QWORD *)v15 + 14);
  v51 = *((_QWORD *)v15 + 15);
  v52 = v37;
  v38 = CFNumberCreate(v19, kCFNumberSInt32Type, &v52);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5708], v38);
  CFRelease(v38);
  v39 = CFNumberCreate(v19, kCFNumberSInt32Type, &v51);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5650], v39);
  CFRelease(v39);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5788], (const void *)*MEMORY[0x24BDBD270]);
  IOSurfacePropertiesDictionary = createIOSurfacePropertiesDictionary(1);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5668], IOSurfacePropertiesDictionary);
  CFRelease(IOSurfacePropertiesDictionary);
  applyWiringAssertionToProperties(&pixelBufferAttributes);
  CVPixelBufferPoolCreate(v19, v33, pixelBufferAttributes, (CVPixelBufferPoolRef *)v15 + 6);
  CFRelease(v33);
  CFRelease(pixelBufferAttributes);
  pixelBufferOut[0] = 0;
  pixelBufferOut[1] = 0;
  if (v56 >= 1)
  {
    v41 = 0;
    v42 = pixelBufferOut;
    do
    {
      CVPixelBufferPoolCreatePixelBuffer(v19, *((CVPixelBufferPoolRef *)v15 + 6), v42);
      CVPixelBufferLockBaseAddress(*v42, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(*v42);
      DataSize = CVPixelBufferGetDataSize(*v42);
      bzero(BaseAddress, DataSize);
      v45 = *v42++;
      CVPixelBufferUnlockBaseAddress(v45, 0);
      ++v41;
    }
    while (v41 < v56);
    if (v56 >= 1)
    {
      for (i = 0; i < v56; CVPixelBufferRelease(pixelBufferOut[i++]))
        ;
    }
  }
  v47 = PixelShuffler_constructor(v50, *((_QWORD *)v15 + 15));
  *((_QWORD *)v15 + 28) = v47;
  if (!v47)
    goto LABEL_7;
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v15, 0);
  *((_BYTE *)v15 + 8) = 0;
  if (!VTImageRotationSessionCreate()
    && (v48 = FlareDetector_constructor(), (*((_QWORD *)v15 + 37) = v48) != 0)
    && (v49 = BlendingDefaults_constructor(), (*((_QWORD *)v15 + 38) = v49) != 0))
  {
    *a1 = v14;
    *((_QWORD *)v15 + 39) = a1;
  }
  else
  {
LABEL_7:
    BlendingCtrl_deleteBlendingContext(v14);
    *a1 = 0;
  }
}

void BlendingCtrl_deleteBlendingContext(void **a1)
{
  _QWORD *v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  __CVPixelBufferPool *v5;
  _QWORD *v6;
  _QWORD *v7;
  void **v8;
  void *v9;

  if (a1)
  {
    v2 = *a1;
    v3 = *(__CVBuffer **)*a1;
    if (v3)
    {
      CVPixelBufferUnlockBaseAddress(v3, 0);
      *((_BYTE *)v2 + 8) = 0;
      CVPixelBufferRelease((CVPixelBufferRef)*v2);
    }
    v4 = (__CVBuffer *)v2[5];
    if (v4)
    {
      CVPixelBufferUnlockBaseAddress(v4, 1uLL);
      CVPixelBufferRelease((CVPixelBufferRef)v2[5]);
      v2[5] = 0;
    }
    v5 = (__CVPixelBufferPool *)v2[6];
    if (v5)
    {
      CVPixelBufferPoolRelease(v5);
      v2[6] = 0;
    }
    v6 = (_QWORD *)v2[27];
    if (v6)
      Blending_destructor(v6);
    v7 = (_QWORD *)v2[28];
    if (v7)
      PixelShuffler_destructor(v7);
    if (v2[36])
    {
      MEMORY[0x2276B46BC]();
      VTImageRotationSessionRelease();
    }
    v8 = (void **)v2[37];
    if (v8)
      FlareDetector_destructor(v8);
    v9 = (void *)v2[38];
    if (v9)
      BlendingDefaults_destructor(v9);
    if (*a1)
      free(*a1);
    free(a1);
  }
}

const __CFNumber *BlendingCtrl_setOptions(const __CFNumber *result, const __CFDictionary *a2)
{
  if (result)
  {
    if (a2)
      return PixelShuffler_setOptions(*(const __CFNumber **)(*(_QWORD *)result + 224), a2);
  }
  return result;
}

uint64_t BlendingCtrl_initSlice(_QWORD *a1, size_t a2, size_t a3)
{
  uint64_t v5;
  CVPixelBufferRef *v6;
  uint64_t result;
  size_t BytesPerRowOfPlane;
  CFDictionaryRef pixelBufferAttributes;

  v5 = *a1;
  v6 = (CVPixelBufferRef *)(*a1 + 40);
  if (*v6)
  {
    CVPixelBufferUnlockBaseAddress(*v6, 1uLL);
    CVPixelBufferRelease(*v6);
    *v6 = 0;
  }
  if (*(_QWORD *)(v5 + 72) == a2 && *(_QWORD *)(v5 + 80) == a3)
  {
    CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], *(CVPixelBufferPoolRef *)(v5 + 48), v6);
  }
  else
  {
    pixelBufferAttributes = 0;
    applyWiringAssertionToProperties(&pixelBufferAttributes);
    if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, a3, *(_DWORD *)(v5 + 32), pixelBufferAttributes, v6))
    {
      CVPixelBufferUnlockBaseAddress(*v6, 1uLL);
      CVPixelBufferRelease(*v6);
      *v6 = 0;
      return 0xFFFFFFFFLL;
    }
    if (pixelBufferAttributes)
      CFRelease(pixelBufferAttributes);
  }
  CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  *(_QWORD *)(v5 + 56) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 64) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  *(_QWORD *)(v5 + 72) = CVPixelBufferGetWidthOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 80) = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  *(_QWORD *)(v5 + 88) = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v5 + 40), 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v5 + 40), 1uLL);
  result = 0;
  *(_QWORD *)(v5 + 96) = BytesPerRowOfPlane;
  return result;
}

uint64_t BlendingCtrl_getTargetContext(uint64_t a1)
{
  return **(_QWORD **)a1;
}

void BlendingCtrl_resetBlendingContext(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  Blending_reset(*(_QWORD *)(*a1 + 216));
  *(_QWORD *)(v1 + 248) = 0;
  v1 += 248;
  *(_DWORD *)(v1 + 32) = 0;
  *(_DWORD *)(v1 - 8) = 0;
  *(_QWORD *)(v1 + 8) = 0;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 21) = 0;
}

float BlendingCtrl_Roi(uint64_t *a1, CVPixelBufferRef pixelBuffer)
{
  uint64_t v3;
  size_t Height;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int v10;
  int v11;
  size_t v12;

  v3 = *a1;
  *(_QWORD *)(v3 + 200) = CVPixelBufferGetWidth(pixelBuffer);
  Height = CVPixelBufferGetHeight(pixelBuffer);
  *(_QWORD *)(v3 + 208) = Height;
  v5 = *(_QWORD *)(v3 + 200);
  v6 = *(_QWORD *)(v3 + 128);
  v9 = vandq_s8(*(int8x16_t *)(v3 + 112), (int8x16_t)vdupq_n_s64(0xFFFFFFFFFFFFFFFELL));
  *(int8x16_t *)(v3 + 152) = vextq_s8(v9, v9, 8uLL);
  v7 = v9.i64[0];
  v8 = ((unint64_t)(v5 - v9.i64[1]) >> 1) & 0x7FFFFFFFFFFFFFFELL;
  *(_QWORD *)(v3 + 136) = v8;
  *(_QWORD *)(v3 + 144) = v6;
  *(float32x2_t *)v9.i8 = vmul_f32(vcvt_f32_f64(vcvtq_f64_u64((uint64x2_t)v9)), (float32x2_t)0x3F0000003F000000);
  *(_QWORD *)(v3 + 104) = v9.i64[0];
  if (*(int *)(v3 + 240) < 1)
  {
    v11 = *(_DWORD *)(v3 + 280);
    if (v11 == 2)
    {
      *(_QWORD *)(v3 + 160) = v6 + v7;
      *(float *)v9.i32 = (float)Height * 0.5;
      *(_DWORD *)(v3 + 104) = v9.i32[0];
      *(_QWORD *)(v3 + 144) = 0;
      return *(float *)v9.i32;
    }
    if (v11 != 1)
    {
LABEL_9:
      puts("ERROR: panorama direction unknown");
      return *(float *)v9.i32;
    }
    *(_QWORD *)(v3 + 160) = Height - v6;
    *(float *)v9.i32 = (float)Height * 0.5;
    *(_DWORD *)(v3 + 104) = v9.i32[0];
  }
  else if (*(_DWORD *)(v3 + 272))
  {
    *(_QWORD *)(v3 + 168) = v8;
    *(_QWORD *)(v3 + 184) = v9.i64[1];
    v10 = *(_DWORD *)(v3 + 280);
    if (v10 == 2)
    {
      v12 = v6 + v7;
      *(_QWORD *)(v3 + 176) = v12;
      v6 = Height - v12;
      goto LABEL_11;
    }
    if (v10 == 1)
    {
      *(_QWORD *)(v3 + 176) = 0;
LABEL_11:
      *(_QWORD *)(v3 + 192) = v6;
      return *(float *)v9.i32;
    }
    goto LABEL_9;
  }
  return *(float *)v9.i32;
}

uint64_t BlendingCtrl_blendSlice(uint64_t *a1, CFDictionaryRef theDict)
{
  uint64_t v3;
  const __CFData *Value;
  const UInt8 *BytePtr;
  double v6;
  double v7;
  const __CFNumber *v8;
  _BOOL4 v9;
  const __CFNumber *v10;
  float v11;
  float v12;
  unint64_t v13;
  int v14;
  float v15;
  float v16;
  uint64_t v17;
  uint64_t v18;
  __CVBuffer *v19;
  const __CFNumber *Attachment;
  int v21;
  float SNR;
  double v23;
  double v24;
  float v26;
  int valuePtr;
  int v28;

  v3 = *a1;
  valuePtr = 3;
  v28 = 0;
  Value = (const __CFData *)CFDictionaryGetValue(theDict, CFSTR("ACTRegistrationTransformationKey"));
  if (Value)
  {
    BytePtr = CFDataGetBytePtr(Value);
    v6 = *((double *)BytePtr + 4);
    v7 = *((double *)BytePtr + 5);
  }
  else
  {
    v6 = *(double *)(MEMORY[0x24BDBD8B8] + 32);
    v7 = *(double *)(MEMORY[0x24BDBD8B8] + 40);
  }
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ACTRegistrationWasFallbackInvokedKey"));
  if (v8)
  {
    CFNumberGetValue(v8, kCFNumberIntType, &valuePtr);
    v9 = valuePtr == 0;
  }
  else
  {
    v9 = 1;
  }
  v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("ID"));
  if (v10)
    CFNumberGetValue(v10, kCFNumberIntType, &v28);
  v11 = v7;
  v12 = v6;
  v13 = *(_QWORD *)(v3 + 112);
  if (v11 > (float)v13)
    v11 = (float)v13;
  if (v11 < (float)-(float)v13)
    v11 = -(float)v13;
  if (*(_BYTE *)(v3 + 284))
    v14 = 1;
  else
    v14 = v9;
  if (*(_DWORD *)(v3 + 280) == 2)
    v15 = -v11;
  else
    v15 = v11;
  if (!*(_BYTE *)(v3 + 8))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v3, 0);
    *(_BYTE *)(v3 + 8) = 1;
  }
  v16 = -v12;
  v18 = *(_QWORD *)(v3 + 152);
  v17 = *(_QWORD *)(v3 + 160);
  if (*(int *)(v3 + 240) >= 1)
  {
    if (!Blending_overlap(*(_QWORD *)(v3 + 216), *(_QWORD *)(v3 + 160), *(_QWORD *)(v3 + 152), *(_DWORD *)(v3 + 272), v15, v16, *(float *)(v3 + 104), *(float *)(v3 + 108)))goto LABEL_29;
    CVPixelBufferRelease(*(CVPixelBufferRef *)(v3 + 264));
    v19 = *(__CVBuffer **)(v3 + 256);
    *(_QWORD *)(v3 + 264) = v19;
    CVPixelBufferRetain(v19);
  }
  v26 = 0.0;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(*(CVBufferRef *)(v3 + 40), (CFStringRef)*MEMORY[0x24BE10A38], 0);
  if (Attachment)
    CFNumberGetValue(Attachment, kCFNumberFloatType, &v26);
  v21 = *(_DWORD *)(v3 + 240);
  if (v21 >= 1)
  {
    SNR = getSNR(*(const void **)(v3 + 264));
    *(float *)&v23 = v15;
    *(float *)&v24 = v16;
    Blending_addImage(*(_QWORD *)(v3 + 216), v23, v24, SNR, v26, v17, v18, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 96), *(_QWORD *)(v3 + 56), *(_QWORD *)(v3 + 64), v14, v28);
    v21 = *(_DWORD *)(v3 + 240);
  }
  *(_DWORD *)(v3 + 240) = v21 + 1;
LABEL_29:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v3 + 256));
  *(_QWORD *)(v3 + 256) = 0;
  return 0;
}

float getSNR(const void *a1)
{
  const __CFDictionary *v1;
  float v2;
  const __CFNumber *Value;
  int valuePtr;

  valuePtr = -1082130432;
  v1 = (const __CFDictionary *)CMGetAttachment(a1, CFSTR("MetadataDictionary"), 0);
  v2 = -1.0;
  if (v1)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("SNR"));
    if (Value)
    {
      CFNumberGetValue(Value, kCFNumberFloat32Type, &valuePtr);
      return *(float *)&valuePtr;
    }
  }
  return v2;
}

uint64_t BlendingCtrl_cropAndRotateSlice(uint64_t *a1, __CVBuffer *a2)
{
  uint64_t v4;
  double v5;
  const __CFNumber *Attachment;
  const __CFDictionary *v7;
  const __CFDictionary *v8;
  const __CFNumber *v9;
  const __CFBoolean *Value;
  _BOOL4 v11;
  char v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  size_t BytesPerRowOfPlane;
  size_t v17;
  double Current;
  int v19;
  _QWORD *v20;
  const char *v21;
  uint64_t v22;
  int v23;
  double v24;
  float v25;
  double v26;
  double v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  int v30;
  double v31;
  double v32;
  double v33;
  const __CFNumber *v34;
  const __CFNumber *v35;
  const __CFNumber *v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  const __CFNumber *v39;
  const __CFNumber *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  const __CFNumber *v43;
  CFNumberRef v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  CFNumberRef v50;
  double v51;
  double v52;
  CFAbsoluteTime v53;
  __IOSurface *IOSurface;
  __IOSurface *v55;
  IOSurfaceID ID;
  int v58;
  int v59;
  void *BaseAddressOfPlane;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  int v66;
  float v67;
  int valuePtr;

  v4 = *a1;
  v5 = sub_2276323A4();
  valuePtr = -1;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(a2, CFSTR("ID"), 0);
  if (Attachment)
    CFNumberGetValue(Attachment, kCFNumberIntType, &valuePtr);
  CVPixelBufferLockBaseAddress(a2, 1uLL);
  if (!*(_BYTE *)(v4 + 8))
  {
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v4, 0);
    *(_BYTE *)(v4 + 8) = 1;
  }
  v7 = (const __CFDictionary *)CVBufferGetAttachment(a2, CFSTR("MetadataDictionary"), 0);
  v8 = v7;
  v67 = 1.0;
  if (v7 && (v9 = (const __CFNumber *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x24BE10A38])) != 0)
  {
    v66 = 0;
    CFNumberGetValue(v9, kCFNumberIntType, &v66);
    v67 = 256.0 / (float)v66;
    Value = (const __CFBoolean *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10CC0]);
    if (Value)
      v11 = CFBooleanGetValue(Value) != 0;
    else
      v11 = 0;
    v12 = 0;
    v59 = !v11;
  }
  else
  {
    v59 = 0;
    v12 = 1;
  }
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  v13 = CVPixelBufferGetBaseAddressOfPlane(a2, 1uLL);
  v14 = *(_QWORD *)(v4 + 200);
  v15 = *(_QWORD *)(v4 + 208);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a2, 0);
  v17 = CVPixelBufferGetBytesPerRowOfPlane(a2, 1uLL);
  if (BlendingCtrl_initSlice(a1, *(_QWORD *)(v4 + 160), *(_QWORD *)(v4 + 152)) == -1)
  {
    v21 = "ERROR: Cannot reallocate the slice for new dimensions";
LABEL_20:
    puts(v21);
    v22 = 0xFFFFFFFFLL;
    goto LABEL_71;
  }
  if (PixelShuffler_init(*(_QWORD *)(v4 + 224), BytesPerRowOfPlane, v15) == -1)
  {
    v21 = "ERROR: Cannot reallocate pixel shuffler";
    goto LABEL_20;
  }
  if (*(int *)(v4 + 240) >= 1)
  {
    Current = CFAbsoluteTimeGetCurrent();
    CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v4 + 40), 0);
    CVPixelBufferUnlockBaseAddress(a2, 1uLL);
    CVBufferPropagateAttachments(a2, *(CVBufferRef *)(v4 + 40));
    v19 = *(_DWORD *)(v4 + 280);
    if (v19 == 1)
    {
      v20 = (_QWORD *)MEMORY[0x24BDBD268];
    }
    else
    {
      if (v19 != 2)
      {
        puts("ERROR: panorama direction unknown");
LABEL_70:
        v22 = 0;
        goto LABEL_71;
      }
      v20 = (_QWORD *)MEMORY[0x24BDBD270];
    }
    MEMORY[0x2276B46D4](*(_QWORD *)(v4 + 288), *MEMORY[0x24BDF9610], *v20);
    MEMORY[0x2276B46E0](*(_QWORD *)(v4 + 288), a2, *(_QWORD *)(v4 + 40), (double)*(unint64_t *)(v4 + 136), (double)*(unint64_t *)(v4 + 144), (double)*(unint64_t *)(v4 + 152), (double)*(unint64_t *)(v4 + 160), 0.0, 0.0, (double)*(unint64_t *)(v4 + 160), (double)*(unint64_t *)(v4 + 152));
    CVPixelBufferLockBaseAddress(a2, 1uLL);
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v4 + 40), 0);
    *(_QWORD *)(v4 + 56) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v4 + 40), 0);
    *(_QWORD *)(v4 + 64) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v4 + 40), 1uLL);
    v30 = valuePtr;
    v31 = sub_2276323A4();
    ACTLogMessageImp(1, "{Blending%d|blendingCtrl_cropAndRotateSliceBeforeExposureBlendingTook:%f}", v30, v31 - v5);
    v32 = sub_2276323A4();
    if ((v12 & 1) == 0)
    {
      v33 = v32;
      if (v67 != 1.0 || *(_BYTE *)(v4 + 284))
      {
        v65 = 1;
        v66 = 1;
        v63 = 1;
        v64 = 1;
        v61 = 1;
        v62 = 1;
        v34 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AD0]);
        if (v34)
          CFNumberGetValue(v34, kCFNumberIntType, &v66);
        v35 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA0]);
        if (v35)
          CFNumberGetValue(v35, kCFNumberIntType, &v65);
        else
          v65 = v66;
        v38 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA8]);
        if (v38)
          CFNumberGetValue(v38, kCFNumberIntType, &v64);
        v39 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A98]);
        if (v39)
          CFNumberGetValue(v39, kCFNumberIntType, &v63);
        else
          v63 = v64;
        v42 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A88]);
        if (v42)
          CFNumberGetValue(v42, kCFNumberIntType, &v62);
        v43 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A90]);
        if (v43)
          CFNumberGetValue(v43, kCFNumberIntType, &v61);
        else
          v61 = v62;
        if (!v59)
          PixelShuffler_yuv420ExposureMap();
        v50 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v67);
        CVBufferSetAttachment(*(CVBufferRef *)(v4 + 40), (CFStringRef)*MEMORY[0x24BE10A38], v50, kCVAttachmentMode_ShouldPropagate);
        CFRelease(v50);
        v51 = v67;
        LODWORD(v50) = valuePtr;
        v52 = sub_2276323A4();
        ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", (_DWORD)v50, v51, (_DWORD)v50, v52 - v33);
      }
    }
    v53 = CFAbsoluteTimeGetCurrent();
    Blending_storeM2MTime(*(_QWORD *)(v4 + 216), v53 - Current);
    IOSurface = CVPixelBufferGetIOSurface(a2);
    v55 = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(v4 + 40));
    LODWORD(IOSurface) = IOSurfaceGetID(IOSurface);
    ID = IOSurfaceGetID(v55);
    Blending_storeIOSurfaceIDs(*(_QWORD *)(v4 + 216), (int)IOSurface, ID);
    goto LABEL_70;
  }
  v23 = valuePtr;
  v24 = sub_2276323A4();
  ACTLogMessageImp(1, "{Blending%d|blendingCtrl_cropAndRotateSliceBeforeExposureBlendingTook:%f}", v23, v24 - v5);
  if (*(_BYTE *)(*(_QWORD *)(v4 + 216) + 144))
    v25 = 32.0;
  else
    v25 = 0.0;
  v26 = sub_2276323A4();
  if ((v12 & 1) == 0)
  {
    v27 = v26;
    if (v67 != 1.0 || *(_BYTE *)(v4 + 284))
    {
      v65 = 1;
      v66 = 1;
      v63 = 1;
      v64 = 1;
      v61 = 1;
      v62 = 1;
      v28 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AD0]);
      if (v28)
        CFNumberGetValue(v28, kCFNumberIntType, &v66);
      v29 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA0]);
      if (v29)
        CFNumberGetValue(v29, kCFNumberIntType, &v65);
      else
        v65 = v66;
      v36 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10AA8]);
      if (v36)
        CFNumberGetValue(v36, kCFNumberIntType, &v64);
      v37 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A98]);
      if (v37)
        CFNumberGetValue(v37, kCFNumberIntType, &v63);
      else
        v63 = v64;
      v40 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A88]);
      if (v40)
        CFNumberGetValue(v40, kCFNumberIntType, &v62);
      v41 = (const __CFNumber *)CFDictionaryGetValue(v8, (const void *)*MEMORY[0x24BE10A90]);
      if (v41)
        CFNumberGetValue(v41, kCFNumberIntType, &v61);
      else
        v61 = v62;
      if (!v59)
        PixelShuffler_yuv420ExposureMap();
      v44 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v67);
      CVBufferSetAttachment(*(CVBufferRef *)(v4 + 40), (CFStringRef)*MEMORY[0x24BE10A38], v44, kCVAttachmentMode_ShouldPropagate);
      CFRelease(v44);
      v45 = v67;
      LODWORD(v44) = valuePtr;
      v46 = sub_2276323A4();
      ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", (_DWORD)v44, v45, (_DWORD)v44, v46 - v27);
    }
  }
  v47 = sub_2276323A4();
  Blending_start(*(_QWORD *)(v4 + 216), *(_QWORD *)(v4 + 288), a2, *(__CVBuffer **)v4, v25, 0.0, *(float *)(v4 + 104), *(float *)(v4 + 108), v14, v15, BytesPerRowOfPlane, v17, (uint64_t)BaseAddressOfPlane, (uint64_t)v13, *(_QWORD *)(v4 + 224), *(_DWORD *)(v4 + 280), v58, *(_OWORD *)(v4 + 136), HIDWORD(*(_QWORD *)(v4 + 136)),
    *(_QWORD *)(v4 + 144),
    HIDWORD(*(_OWORD *)(v4 + 136)),
    *(_QWORD *)(v4 + 152),
    *(_QWORD *)(v4 + 160));
  v48 = valuePtr;
  v49 = sub_2276323A4();
  ACTLogMessageImp(1, "{Blending%d|Blending_startTook:%f}", v48, v49 - v47);
  v22 = 0;
  ++*(_DWORD *)(v4 + 240);
LABEL_71:
  CVPixelBufferUnlockBaseAddress(a2, 1uLL);
  return v22;
}

double sub_2276323A4()
{
  unint64_t v0;
  unint64_t v1;
  mach_timebase_info info;

  info = 0;
  if (*(double *)&qword_253E99A28 == 0.0 && !mach_timebase_info(&info))
  {
    LODWORD(v0) = info.numer;
    LODWORD(v1) = info.denom;
    *(double *)&qword_253E99A28 = (double)v0 / (double)v1 * 0.000000001;
  }
  return *(double *)&qword_253E99A28 * (double)mach_absolute_time();
}

uint64_t BlendingCtrl_cropAndRotateBuffer(uint64_t *a1, CVPixelBufferRef texture)
{
  uint64_t v4;

  if (!texture)
    return 0;
  v4 = *a1;
  if (*(_DWORD *)(*a1 + 240))
    goto LABEL_5;
  if (*(_DWORD *)(v4 + 280))
  {
    *(_QWORD *)(v4 + 248) = 0;
LABEL_5:
    CVPixelBufferRelease(*(CVPixelBufferRef *)(v4 + 256));
    *(_QWORD *)(v4 + 256) = texture;
    CVPixelBufferRetain(texture);
    BlendingCtrl_Roi(a1, texture);
    if (BlendingCtrl_cropAndRotateSlice(a1, texture) != -1)
      return *(_QWORD *)(v4 + 40);
    return 0;
  }
  *(_QWORD *)(v4 + 248) = texture;
  CVPixelBufferRetain(texture);
  return 0;
}

uint64_t BlendingCtrl_blendSliceIntoContext(uint64_t *a1, const __CFDictionary *a2)
{
  if (*(_DWORD *)(*a1 + 240))
    BlendingCtrl_blendSlice(a1, a2);
  return 0;
}

uint64_t BlendingCtrl_finishBlending(uint64_t *a1)
{
  uint64_t v1;
  __CVBuffer *v2;
  const __CFDictionary *Attachment;
  const __CFDictionary *v4;
  const __CFString *v5;
  const __CFNumber *v6;
  float v7;
  const __CFBoolean *Value;
  _BOOL4 v9;
  uint64_t v10;
  double v11;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  const __CFNumber *v17;
  CFNumberRef v18;
  const __CFNumber *v19;
  double v20;
  int v21;
  double v22;
  void *BaseAddressOfPlane;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  size_t BytesPerRowOfPlane;
  size_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  unint64_t v41;
  unint64_t valuePtr;
  unint64_t v43;
  int v44;
  int v45;
  int v46;
  int v47;

  v1 = *a1;
  v2 = *(__CVBuffer **)(*a1 + 264);
  if (!v2)
    goto LABEL_33;
  if (*(_DWORD *)(v1 + 240))
  {
    *(_DWORD *)(v1 + 272) = 1;
    BlendingCtrl_Roi(a1, v2);
    if (!*(_QWORD *)(v1 + 192))
    {
LABEL_33:
      v10 = 0;
      goto LABEL_34;
    }
    Attachment = (const __CFDictionary *)CVBufferGetAttachment(*(CVBufferRef *)(v1 + 264), CFSTR("MetadataDictionary"), 0);
    LODWORD(v43) = 1065353216;
    if (Attachment
      && (v4 = Attachment,
          v5 = (const __CFString *)*MEMORY[0x24BE10A38],
          (v6 = (const __CFNumber *)CFDictionaryGetValue(Attachment, (const void *)*MEMORY[0x24BE10A38])) != 0))
    {
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(v6, kCFNumberIntType, &valuePtr);
      v7 = 256.0 / (float)(int)valuePtr;
      *(float *)&v43 = v7;
      Value = (const __CFBoolean *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10CC0]);
      if (Value)
        v9 = CFBooleanGetValue(Value) != 0;
      else
        v9 = 0;
      v11 = sub_2276323A4();
      if (v7 != 1.0 || *(_BYTE *)(v1 + 284))
      {
        LODWORD(valuePtr) = 1;
        LODWORD(v41) = 1;
        LODWORD(v40) = 1;
        v46 = 1;
        v47 = 1;
        v45 = 1;
        v12 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AD0]);
        if (v12)
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        v13 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AA0]);
        if (v13)
          CFNumberGetValue(v13, kCFNumberIntType, &v41);
        else
          LODWORD(v41) = valuePtr;
        v14 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10AA8]);
        if (v14)
          CFNumberGetValue(v14, kCFNumberIntType, &v40);
        v15 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A98]);
        if (v15)
          CFNumberGetValue(v15, kCFNumberIntType, &v47);
        else
          v47 = v40;
        v16 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A88]);
        if (v16)
          CFNumberGetValue(v16, kCFNumberIntType, &v46);
        v17 = (const __CFNumber *)CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE10A90]);
        if (v17)
        {
          CFNumberGetValue(v17, kCFNumberIntType, &v45);
          if (!v9)
            goto LABEL_30;
        }
        else
        {
          v45 = v46;
          if (!v9)
          {
LABEL_30:
            v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberFloatType, &v43);
            CVBufferSetAttachment(*(CVBufferRef *)(v1 + 264), v5, v18, kCVAttachmentMode_ShouldPropagate);
            CFRelease(v18);
            v44 = 0;
            v19 = (const __CFNumber *)CVBufferGetAttachment(*(CVBufferRef *)(v1 + 264), CFSTR("ID"), 0);
            if (v19)
            {
              CFNumberGetValue(v19, kCFNumberIntType, &v44);
              v20 = *(float *)&v43;
              v21 = v44;
              v22 = sub_2276323A4();
              ACTLogMessageImp(1, "{Blending%d|exposureRatio:%f}{Blending%d|exposureBlendingTook:%f}", v21, v20, v21, v22 - v11);
            }
            goto LABEL_32;
          }
        }
        PixelShuffler_yuv420ExposureMap();
        goto LABEL_30;
      }
    }
    else
    {
      sub_2276323A4();
    }
LABEL_32:
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v1 + 264), 0);
    v24 = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v1 + 264), 1uLL);
    v25 = *(_QWORD *)(v1 + 200);
    v26 = *(_QWORD *)(v1 + 208);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v1 + 264), 0);
    v28 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v1 + 264), 1uLL);
    Blending_end(*(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 288), *(_QWORD *)(v1 + 224), *(_DWORD *)(v1 + 280), *(__CVBuffer **)(v1 + 264), *(__CVBuffer **)v1, v25, v26, BytesPerRowOfPlane, v28, (uint64_t)BaseAddressOfPlane, (uint64_t)v24, *(_OWORD *)(v1 + 168), HIDWORD(*(_QWORD *)(v1 + 168)), *(_QWORD *)(v1 + 176), HIDWORD(*(_OWORD *)(v1 + 168)), *(_QWORD *)(v1 + 184), HIDWORD(*(_QWORD *)(v1 + 184)), *(_QWORD *)(v1 + 192));
    goto LABEL_33;
  }
  if (!*(_DWORD *)(v1 + 280))
    BlendingCtrl_setPanoramaDirection(a1, 1);
  v10 = 0xFFFFFFFFLL;
LABEL_34:
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v1 + 264));
  *(_QWORD *)(v1 + 264) = 0;
  CVPixelBufferRelease(*(CVPixelBufferRef *)(v1 + 256));
  *(_QWORD *)(v1 + 256) = 0;
  if (*(_DWORD *)(v1 + 280) == 2)
  {
    v29 = *(unsigned __int8 *)(v1 + 8);
    if (!*(_BYTE *)(v1 + 8))
    {
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v1, 0);
      *(_BYTE *)(v1 + 8) = 1;
    }
    v30 = *(_QWORD *)(v1 + 312);
    v31 = *(_QWORD *)(v30 + 8);
    if (v31)
    {
      v32 = *(_DWORD *)(v31 + 104);
      if ((v32 - 3) < 6 || v32 == 1)
      {
        v34 = *(_QWORD **)(v1 + 216);
        v35 = v34[32];
        v43 = v34[31];
        v37 = v34[33];
        v36 = v34[34];
        v41 = v35 - v43 + 1;
        valuePtr = v37;
        v40 = v36 - v37;
        ACTFinalThreadedNoiseReduction(*(_QWORD **)(v30 + 16));
      }
    }
    v38 = *(_QWORD **)(v1 + 216);
    valuePtr = v38[7];
    v43 = 0;
    PixelShuffler_yuv420FlipHorizontally(*(__CVBuffer **)v1, v38 + 31, v38 + 32, &v43, &valuePtr);
    if (!v29)
    {
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v1, 0);
      *(_BYTE *)(v1 + 8) = 0;
    }
  }
  CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v1, 0);
  *(_BYTE *)(v1 + 8) = 0;
  return v10;
}

void BlendingCtrl_setPanoramaDirection(uint64_t *a1, int a2)
{
  uint64_t v2;
  __CVBuffer *v3;

  v2 = *a1;
  *(_DWORD *)(v2 + 280) = a2;
  v3 = *(__CVBuffer **)(v2 + 248);
  if (v3)
  {
    BlendingCtrl_Roi(a1, v3);
    BlendingCtrl_cropAndRotateSlice(a1, *(__CVBuffer **)(v2 + 248));
    CFRelease(*(CFTypeRef *)(v2 + 248));
    *(_QWORD *)(v2 + 248) = 0;
  }
}

uint64_t BlendingCtrl_getCroppingArea(uint64_t result, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  _QWORD *v5;

  v5 = *(_QWORD **)(*(_QWORD *)result + 216);
  *a4 = v5[31];
  *a5 = v5[32];
  *a2 = v5[33];
  *a3 = v5[34];
  return result;
}

uint64_t BlendingCtrl_setEdgeBlendingErrorMetricLogging(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)result + 276) = a2;
  return result;
}

uint64_t BlendingCtrl_setBlendingForceMaxComputation(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)result + 284) = a2;
  return result;
}

uint64_t BlendingCtrl_setMaxOverlapPercent(uint64_t result, float a2)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)result + 216) + 296) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setBlendingDefaults(uint64_t *a1, unsigned int a2)
{
  unsigned int v2;
  uint64_t v3;
  int *v4;

  if (a2)
    v2 = a2;
  else
    v2 = 4;
  v3 = *a1;
  v4 = *(int **)(*a1 + 304);
  *v4 = (v2 >> 1) & 1;
  v4[1] = v2 & 1;
  v4[2] = (v2 >> 2) & 1;
  return Blending_setDefaults(*(_QWORD *)(v3 + 216), v4);
}

uint64_t BlendingCtrl_Defaults_setBlendingFlareCorrection(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)result + 304) + 4) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setWideSceneCut(uint64_t result, int a2)
{
  **(_DWORD **)(*(_QWORD *)result + 304) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_setPoissonBlending(uint64_t result, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)result + 304) + 8) = a2;
  return result;
}

uint64_t BlendingCtrl_Defaults_Propagate(uint64_t a1)
{
  return Blending_setDefaults(*(_QWORD *)(*(_QWORD *)a1 + 216), *(int **)(*(_QWORD *)a1 + 304));
}

uint64_t BlendingCtrl_Defaults_getBlendingDefaults(uint64_t a1)
{
  _DWORD *v1;
  unsigned int v2;

  v1 = *(_DWORD **)(*(_QWORD *)a1 + 304);
  v2 = v1[1] != 0;
  if (*v1)
    v2 |= 2u;
  if (v1[2])
    return v2 | 4;
  else
    return v2;
}

uint64_t BlendingCtrl_Defaults_getBlendingFlareCorrection(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 304) + 4);
}

uint64_t BlendingCtrl_Defaults_getWideSceneCutn(uint64_t a1)
{
  return **(unsigned int **)(*(_QWORD *)a1 + 304);
}

uint64_t BlendingCtrl_Defaults_getPoissonBlending(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(*(_QWORD *)a1 + 304) + 8);
}

id loadPanoIBPFromBundle(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  FILE *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  id v24;

  v4 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, (uint64_t)"/System/Library/VideoProcessors/Panorama.bundle", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleWithPath_(v4, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_6;
  v24 = 0;
  objc_msgSend_loadAndReturnError_(v8, v9, (uint64_t)&v24, v10);
  v11 = v24;
  if (v11)
  {
    v16 = v11;
    v18 = (FILE *)*MEMORY[0x24BDAC8D8];
    objc_msgSend_description(v11, v12, v13, v14);
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const char *)objc_msgSend_UTF8String(v19, v20, v21, v22);
    fprintf(v18, "%s\n", v23);

    goto LABEL_8;
  }
  if (!objc_msgSend_classNamed_(v8, v12, (uint64_t)CFSTR("PanoramaProcessor"), v14))
  {
LABEL_6:
    v16 = 0;
LABEL_8:
    v15 = 0;
    goto LABEL_5;
  }
  v15 = (void *)objc_opt_new();
  v16 = 0;
LABEL_5:

  return v15;
}

unint64_t FastRegistration_computePaddedRowByteSize(uint64_t a1, uint64_t a2)
{
  return (a2 * a1 + 15) & 0xFFFFFFFFFFFFFFF0;
}

uint64_t FastRegistration_initRoi(_QWORD *a1, int8x16_t *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a1[3];
  *(_QWORD *)a3 = *a1 + v3 * a2->i64[1] + a2->i64[0];
  *(int8x16_t *)(a3 + 8) = vextq_s8(a2[1], a2[1], 8uLL);
  *(_QWORD *)(a3 + 24) = v3;
  return 0;
}

BOOL FastRegistration_isRoiInImage(uint64_t a1, _QWORD *a2)
{
  return (unint64_t)(*a2 + a2[2] - 1) < *(_QWORD *)(a1 + 16)
      && (unint64_t)(a2[1] + a2[3] - 1) < *(_QWORD *)(a1 + 8);
}

uint64_t FastRegistration_vImageBufferMalloc(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v5;
  void *v6;

  v5 = (a3 * a1 + 15) & 0xFFFFFFFFFFFFFFF0;
  a4[2] = a1;
  a4[3] = v5;
  a4[1] = a2;
  v6 = malloc_type_malloc(v5 * a2, 0x6259578EuLL);
  *a4 = v6;
  if (v6)
    return 0;
  else
    return 4294967292;
}

void FastRegistration_vImageBufferFree(uint64_t a1)
{
  void *v2;

  v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(_QWORD *)a1 = 0;
  }
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
}

uint64_t MFRegInitContext(int a1, char a2, char a3, char a4, uint64_t a5)
{
  _BYTE *v9;

  v9 = (_BYTE *)(a5 + 4224);
  *(_DWORD *)(a5 + 4220) = a1;
  *(_QWORD *)(a5 + 2076) = 0x3F80000000000000;
  *(_QWORD *)(a5 + 4176) = 0x3F80000000000000;
  MFResetCorrector(a5);
  *(_QWORD *)a5 = 0;
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 1;
  *v9 = a2;
  v9[1] = a3;
  v9[2] = a4;
  return 0;
}

uint64_t MFResetCorrector(uint64_t a1)
{
  *(_QWORD *)(a1 + 20) = 0;
  *(_OWORD *)(a1 + 2084) = xmmword_22764C350;
  *(_DWORD *)(a1 + 2100) = 2139095039;
  *(_OWORD *)(a1 + 4184) = xmmword_22764C350;
  *(_QWORD *)(a1 + 2120) = 0;
  *(_QWORD *)(a1 + 2104) = 0;
  *(_DWORD *)(a1 + 2112) = 0;
  *(_BYTE *)(a1 + 2116) = 1;
  *(_QWORD *)(a1 + 4200) = 2139095039;
  *(_QWORD *)(a1 + 4208) = 0;
  *(_BYTE *)(a1 + 4216) = 1;
  return 0;
}

uint64_t MFRegDisposeContext(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t MFRegUpdateCorrector(__CVBuffer *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  uint64_t v11;
  const __CFNumber *Attachment;
  int v13;
  float v14;
  float v15;
  int v16;
  float *v17;
  float v18;
  float v19;
  float v20;
  float valuePtr;
  char v23;

  v11 = a2 + 2084;
  v23 = 0;
  valuePtr = 0.0;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(a1, CFSTR("CaptureTimeInSeconds"), 0);
  if (Attachment)
    CFNumberGetValue(Attachment, kCFNumberFloatType, &valuePtr);
  if ((*(_BYTE *)(a2 + 4220) & 1) != 0)
  {
    v13 = sub_227632FFC(a2 + 20, a2 + 2104, &v23, a3, a5);
    if (v13)
    {
      *(_DWORD *)(a2 + 20) = 0;
      *(_DWORD *)(a2 + 24) = 0;
      *(_OWORD *)v11 = xmmword_22764C350;
      *(_QWORD *)(v11 + 16) = 2139095039;
      *(_QWORD *)(a2 + 2108) = 0;
      *(_BYTE *)(a2 + 2116) = 1;
    }
    else
    {
      v14 = valuePtr;
      *(float *)(a2 + 2108) = valuePtr;
      if (*(_BYTE *)(a2 + 2116))
      {
        *(float *)(a2 + 2104) = v14;
        *(_BYTE *)(a2 + 2116) = 0;
        v15 = v14;
      }
      else
      {
        v15 = *(float *)(a2 + 2104);
      }
      if ((float)(v14 - v15) <= 0.66)
        ++*(_DWORD *)(a2 + 2112);
    }
    if (v23)
    {
      *(float *)(a2 + 2100) = valuePtr;
      *(_DWORD *)(a2 + 2092) = *(_DWORD *)(a2 + 2084);
      *(_DWORD *)(a2 + 2096) = *(_DWORD *)(a2 + 2088);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((*(_BYTE *)(a2 + 4220) & 2) != 0)
  {
    v17 = (float *)(a2 + 4204);
    v16 = sub_227632FFC(a2 + 2120, a2 + 4204, &v23, a4, a6);
    if (v16)
    {
      *(_QWORD *)(a2 + 2120) = 0;
      *(_OWORD *)(v11 + 2100) = xmmword_22764C350;
      *(_QWORD *)(a2 + 4200) = 2139095039;
      *(_QWORD *)(a2 + 4208) = 0;
      *(_BYTE *)(v11 + 2132) = 1;
      v18 = 0.0;
    }
    else
    {
      v19 = valuePtr;
      *(float *)(a2 + 4208) = valuePtr;
      if (*(_BYTE *)(v11 + 2132))
      {
        *v17 = v19;
        *(_BYTE *)(v11 + 2132) = 0;
        v18 = v19;
      }
      else
      {
        v18 = *v17;
      }
      if ((float)(v19 - v18) <= 0.66)
        ++*(_DWORD *)(a2 + 4212);
    }
    if (v23)
    {
      v20 = valuePtr;
      *(float *)(a2 + 4200) = valuePtr;
      *(_QWORD *)(a2 + 4192) = *(_QWORD *)(a2 + 4184);
      *(float *)(a2 + 4208) = v20;
      if (v16)
      {
        *(float *)(a2 + 4204) = v20;
        *(_BYTE *)(v11 + 2132) = 0;
        v18 = v20;
      }
      if ((float)(v20 - v18) <= 0.66)
        ++*(_DWORD *)(a2 + 4212);
    }
  }
  else
  {
    v16 = 0;
  }
  return 2 * ((v16 | v13) != 0);
}

uint64_t sub_227632FFC(uint64_t a1, uint64_t a2, _BYTE *a3, float a4, float a5)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t result;
  int v12;
  float v13;
  int v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  BOOL v21;
  float v22;
  float v23;
  float v24;
  float v25;

  *a3 = 0;
  if (*(_DWORD *)a1 == 255)
    v7 = 0;
  else
    v7 = *(_DWORD *)a1 + 1;
  *(_DWORD *)a1 = v7;
  if (*(float *)(a1 + 2064) > a5)
    *(float *)(a1 + 2064) = a5;
  if (*(float *)(a1 + 2068) < a5)
    *(float *)(a1 + 2068) = a5;
  v8 = a1 + 8;
  *(float *)(a1 + 8 + 4 * v7) = a4;
  v9 = a1 + 1032;
  *(float *)(a1 + 1032 + 4 * v7) = a5;
  v10 = *(_DWORD *)(a1 + 4);
  if (v10 <= 255)
    *(_DWORD *)(a1 + 4) = v10 + 1;
  if ((float)(*(float *)(a2 + 4) - *(float *)a2) < 0.66 || (float)(*(float *)(a1 + 2068) - *(float *)(a1 + 2064)) < 2.0)
    return 0;
  v12 = *(_DWORD *)(a2 + 8);
  if (v12 < 1)
  {
    v18 = 0.0;
    v17 = 0.0;
    v16 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v13 = 0.0;
    v14 = *(_DWORD *)(a2 + 8);
    v15 = v7;
    v16 = 0.0;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      v19 = *(float *)(v8 + 4 * v15);
      v20 = *(float *)(v9 + 4 * v15);
      v18 = v18 + (float)(v19 * v20);
      v17 = v17 + (float)(v20 * v20);
      v16 = v16 + v19;
      v13 = v13 + v20;
      v21 = __OFSUB__(v15--, 1);
      if (v15 < 0 != v21)
        v15 = 255;
      --v14;
    }
    while (v14);
  }
  v22 = (float)v12;
  v23 = (float)((float)v12 * v17) - (float)(v13 * v13);
  if (isZero(v23))
    return 2;
  v24 = (float)((float)(v22 * v18) - (float)(v16 * v13)) / v23;
  v25 = (float)(v16 - (float)(v24 * v13)) / v22;
  if (v12 >= 1)
  {
    while (vabds_f32(*(float *)(v8 + 4 * v7), v25 + (float)(v24 * *(float *)(v9 + 4 * v7))) <= 5.0)
    {
      if (v7 >= 1)
        --v7;
      else
        v7 = 255;
      if (!--v12)
        goto LABEL_28;
    }
    return 2;
  }
LABEL_28:
  result = 0;
  *(float *)(a1 + 2056) = v25;
  *(float *)(a1 + 2060) = v24;
  *a3 = 1;
  return result;
}

uint64_t MFRegDampenCorrector(__CVBuffer *a1, float *a2)
{
  const __CFNumber *Attachment;
  float v4;
  float v5;
  float v6;
  float valuePtr;

  valuePtr = 0.0;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(a1, CFSTR("CaptureTimeInSeconds"), 0);
  if (Attachment)
  {
    CFNumberGetValue(Attachment, kCFNumberFloatType, &valuePtr);
    v4 = valuePtr;
  }
  else
  {
    v4 = 0.0;
  }
  v5 = (float)(v4 - a2[527]) * 0.25;
  if (v5 <= 1.0)
  {
    a2[519] = (float)((float)(1.0 - v5) * a2[519]) + (float)(v5 * 0.0);
    a2[520] = v5 + (float)((float)(1.0 - v5) * a2[520]);
  }
  else
  {
    *(_QWORD *)(a2 + 519) = 0x3F80000000000000;
  }
  v6 = (float)(v4 - a2[1052]) * 0.25;
  if (v6 <= 1.0)
  {
    a2[1044] = (float)((float)(1.0 - v6) * a2[1044]) + (float)(v6 * 0.0);
    a2[1045] = v6 + (float)((float)(1.0 - v6) * a2[1045]);
  }
  else
  {
    *((_QWORD *)a2 + 522) = 0x3F80000000000000;
  }
  return 0;
}

uint64_t MFAreMotionFilterValuesReliable()
{
  return 1;
}

const __CFDictionary *MFHasMotionFilterTranslation(__CVBuffer *a1, const void **a2, _DWORD *a3)
{
  const __CFNumber *Attachment;
  const __CFDictionary *result;
  const __CFDictionary *v8;
  int valuePtr;
  void *value;
  CVAttachmentMode attachmentMode;

  *a2 = 0;
  attachmentMode = kCVAttachmentMode_ShouldNotPropagate;
  Attachment = (const __CFNumber *)CVBufferGetAttachment(a1, CFSTR("CaptureTimeInSeconds"), &attachmentMode);
  if (Attachment)
    CFNumberGetValue(Attachment, kCFNumberFloatType, a3);
  else
    *a3 = 0;
  result = (const __CFDictionary *)CVBufferGetAttachment(a1, CFSTR("MetadataDictionary"), 0);
  if (result)
  {
    v8 = result;
    value = 0;
    result = (const __CFDictionary *)CFDictionaryGetValueIfPresent(result, CFSTR("MotionDataError"), (const void **)&value);
    if ((_DWORD)result)
    {
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
      result = 0;
      if (!valuePtr)
        return (const __CFDictionary *)(CFDictionaryGetValueIfPresent(v8, CFSTR("Translation"), a2) != 0);
    }
  }
  return result;
}

const __CFDictionary *MFGetMotionFilterAbsoluteTranslation(__CVBuffer *a1, uint64_t a2, float *a3, float *a4)
{
  const __CFDictionary *v7;
  const __CFData *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  int v16;
  CFDataRef theData;
  UInt8 buffer[4];
  float v19;
  uint64_t v20;
  CFRange v21;

  v20 = *MEMORY[0x24BDAC8D0];
  *a3 = 0.0;
  *a4 = 0.0;
  theData = 0;
  v16 = 0;
  v7 = MFHasMotionFilterTranslation(a1, (const void **)&theData, &v16);
  if ((_DWORD)v7)
  {
    v8 = theData;
    v21.length = CFDataGetLength(theData);
    v21.location = 0;
    CFDataGetBytes(v8, v21, buffer);
    if (*(_BYTE *)(a2 + 16))
    {
      v9 = *(float *)buffer;
      v10 = v19;
      *(double *)a2 = *(float *)buffer;
      *(double *)(a2 + 8) = v10;
      *(_BYTE *)(a2 + 16) = 0;
      v11 = v10;
      v12 = v9;
    }
    else
    {
      v12 = *(double *)a2;
      v11 = *(double *)(a2 + 8);
      v9 = *(float *)buffer;
      v10 = v19;
    }
    v13 = v9 - v12;
    *a3 = v13;
    v14 = v10 - v11;
    *a4 = v14;
  }
  return v7;
}

const __CFDictionary *MFGetMotionFilterIncrementalTranslation(__CVBuffer *a1, __CVBuffer *a2, uint64_t a3, float *a4, float *a5)
{
  unsigned int v9;
  const __CFDictionary *result;
  uint64_t v11;
  uint64_t v12;

  *a4 = 0.0;
  *a5 = 0.0;
  v11 = 0;
  v12 = 0;
  v9 = MFGetMotionFilterAbsoluteTranslation(a1, a3, (float *)&v12 + 1, (float *)&v12);
  result = 0;
  if (v9)
  {
    result = MFGetMotionFilterAbsoluteTranslation(a2, a3, (float *)&v11 + 1, (float *)&v11);
    if ((_DWORD)result)
    {
      *a4 = *((float *)&v11 + 1) - *((float *)&v12 + 1);
      *a5 = *(float *)&v11 - *(float *)&v12;
      return (const __CFDictionary *)1;
    }
  }
  return result;
}

uint64_t MFRegRegisterSlices(__CVBuffer *a1, __CVBuffer *a2, uint64_t a3, float *a4, float *a5, _DWORD *a6)
{
  float v11;
  const __CFNumber *Attachment;
  int v13;
  float v14;
  uint64_t result;
  float valuePtr;
  uint64_t v17;

  v17 = 0;
  if (MFGetMotionFilterIncrementalTranslation(a1, a2, a3, (float *)&v17 + 1, (float *)&v17))
  {
    v11 = *((float *)&v17 + 1);
    *a4 = *((float *)&v17 + 1);
    valuePtr = 0.0;
    Attachment = (const __CFNumber *)CVBufferGetAttachment(a2, CFSTR("CaptureTimeInSeconds"), 0);
    if (Attachment)
      CFNumberGetValue(Attachment, kCFNumberFloatType, &valuePtr);
    v13 = *(_DWORD *)(a3 + 4220);
    if ((v13 & 1) != 0
      && (float)(valuePtr - *(float *)(a3 + 2100)) < 3.4028e38
      && v11 >= *(float *)(a3 + 2092)
      && v11 <= *(float *)(a3 + 2096))
    {
      *a4 = *(float *)(a3 + 2076) + (float)(*(float *)(a3 + 2080) * v11);
    }
    v14 = *(float *)&v17;
    *(_DWORD *)a5 = v17;
    if ((v13 & 2) != 0
      && (float)(valuePtr - *(float *)(a3 + 4200)) < 3.4028e38
      && v14 >= *(float *)(a3 + 4192)
      && v14 <= *(float *)(a3 + 4196))
    {
      *a5 = *(float *)(a3 + 4176) + (float)(*(float *)(a3 + 4180) * v14);
    }
    result = 0;
    *a6 = 1065353216;
  }
  else
  {
    *a6 = 0;
    return 4294967294;
  }
  return result;
}

_QWORD *FastFilter_constructor(unsigned int a1, unsigned int a2, unsigned int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  void *v9;

  v6 = malloc_type_calloc(0x68uLL, 1uLL, 0xCA80EBBCuLL);
  v7 = v6;
  if (!v6)
    goto LABEL_10;
  v6[7] = a2;
  v6[8] = a3;
  v6[9] = a1;
  v6[1] = -1;
  v6[2] = -1;
  *((_DWORD *)v6 + 6) = -1;
  v8 = (boxFilter_uint8_init(a1, a2, a3) & 0x80000000) != 0 ? 0 : boxFilter_uint8_init(a1, a2, a3);
  if (*((_DWORD *)v7 + 3) == -1 && v8 <= (int)horTentFilter_uint8_init(a1, a2, a3))
    v8 = horTentFilter_uint8_init(a1, a2, a3);
  if (v8)
  {
    v9 = malloc_type_malloc(v8, 0x100004077774924uLL);
    v7[6] = v9;
    if (!v9)
    {
LABEL_10:
      FastFilter_destructor(v7);
      return 0;
    }
  }
  return v7;
}

vImage_Error boxFilter_uint8_init(unsigned int a1, unsigned int a2, unsigned int a3)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;
  char v6;

  v6 = 0;
  src.data = &v6;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a1;
  dest.data = &v6;
  dest.height = a3;
  dest.width = a2;
  dest.rowBytes = a1;
  result = vImageBoxConvolve_Planar8(&src, &dest, 0, 0, 0, 3u, 3u, 0, 0x82u);
  if (result < 0)
  {
    printf("ERROR: box filter failed when request minimum size err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

vImage_Error horTentFilter_uint8_init(unsigned int a1, unsigned int a2, unsigned int a3)
{
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;
  char v6;
  uint8_t backgroundColor[4];

  *(_DWORD *)backgroundColor = 0;
  v6 = 0;
  src.data = &v6;
  src.height = a3;
  src.width = a2;
  src.rowBytes = a1;
  dest.data = &v6;
  dest.height = a3;
  dest.width = a2;
  dest.rowBytes = a1;
  result = vImageConvolve_ARGB8888(&src, &dest, 0, 0, 0, word_22764C3E0, 0x1Fu, 1u, 256, backgroundColor, 0xC0u);
  if (result < 0)
  {
    printf("ERROR: tent filter failed when request minimum size err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

void FastFilter_destructor(_QWORD *a1)
{
  uint64_t v2;
  char v3;
  char v4;
  char *v5;
  __CVBuffer *v6;
  CVPixelBufferRef *v7;
  __CVBuffer *v8;
  void *v9;

  if (a1)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v4 = v3;
      v5 = (char *)&a1[v2];
      v8 = (__CVBuffer *)*((_QWORD *)v5 + 11);
      v7 = (CVPixelBufferRef *)(v5 + 88);
      v6 = v8;
      if (v8)
      {
        CVPixelBufferUnlockBaseAddress(v6, 0);
        CVPixelBufferRelease(*v7);
      }
      v3 = 0;
      v2 = 1;
    }
    while ((v4 & 1) != 0);
    v9 = (void *)a1[6];
    if (v9)
      free(v9);
    free(a1);
  }
}

uint64_t FastFilter_allocFilterSpecificData(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 80) = a2;
  if ((a2 - 1) >= 2)
  {
    if (a2)
    {
      puts("ERROR: FastFilter unknown filter type");
    }
    else
    {
      *(_QWORD *)(a1 + 88) = 0;
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
  return 0;
}

uint64_t FastFilter_execute(uint64_t a1, int a2, CVPixelBufferRef pixelBuffer, __CVBuffer *a4, uint64_t a5, uint64_t a6, vImagePixelCount a7, vImagePixelCount a8)
{
  if (a2 == 2)
    return FastFilter_HorTentFilterByResampling(a1, pixelBuffer, a4, a5, a6, a7, a8);
  if (a2 == 1)
    return FastFilter_HorTentFilter(a1, pixelBuffer, a4, a5, a6, a7, a8);
  if (a2)
    return 0xFFFFFFFFLL;
  return FastFilter_BoxFilter(a1, pixelBuffer, a4, a5, a6, a7, a8);
}

vImage_Error FastFilter_BoxFilter(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3, uint64_t a4, uint64_t a5, vImagePixelCount a6, vImagePixelCount a7)
{
  vImage_Error result;
  size_t BytesPerRowOfPlane;
  size_t v16;
  vImage_Buffer dest;
  vImage_Buffer src;

  if (*(_DWORD *)(a1 + 8) != -1)
    return 0;
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v16 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  src.data = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0) + BytesPerRowOfPlane * a5 + a4;
  src.height = a7;
  src.width = a6;
  src.rowBytes = v16;
  dest.data = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0) + v16 * a5 + a4;
  dest.height = a7;
  dest.width = a6;
  dest.rowBytes = BytesPerRowOfPlane;
  result = vImageBoxConvolve_Planar8(&src, &dest, *(void **)(a1 + 48), 0, 0, 3u, 3u, 0, 0);
  if ((_DWORD)result)
  {
    printf("ERROR: box filter failed err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t FastFilter_HorTentFilter(uint64_t a1, __CVBuffer *a2, __CVBuffer *a3, uint64_t a4, uint64_t a5, vImagePixelCount a6, vImagePixelCount a7)
{
  CVPixelBufferRef *v12;
  void *BaseAddressOfPlane;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRow;
  size_t BytesPerRowOfPlane;
  vImage_Error v18;
  uint64_t v19;
  void *v20;
  size_t v21;
  size_t v22;
  size_t v23;
  size_t v24;
  void *BaseAddress;
  CVPixelBufferRef pixelBuffera;
  int v30;

  if (*(_DWORD *)(a1 + 80) != 1)
    return 0xFFFFFFFFLL;
  v30 = 1;
  v12 = (CVPixelBufferRef *)(a1 + 88);
  BaseAddress = CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a1 + 88));
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, 0);
  BytesPerRow = CVPixelBufferGetBytesPerRow(*v12);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  PixelShuffler_dirRot90((uint64_t)BaseAddress, (uint64_t)BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, BytesPerRow, BytesPerRowOfPlane, a4, a5, a6, a7);
  v18 = FastFilter_horTentFilter(a1, (uint64_t)v12, 0, &v30, a4, a5, a7 >> 2, a6);
  pixelBuffera = (CVPixelBufferRef)CVPixelBufferGetBaseAddressOfPlane(a2, 0);
  v19 = v30;
  v20 = CVPixelBufferGetBaseAddress(v12[v30]);
  v21 = CVPixelBufferGetWidthOfPlane(a3, 0);
  v22 = CVPixelBufferGetHeightOfPlane(a3, 0);
  v23 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v24 = CVPixelBufferGetBytesPerRow(v12[v19]);
  PixelShuffler_invRot90((uint64_t)pixelBuffera, (uint64_t)v20, v21, v22, v23, v24, a4, a5, a6, a7);
  return v18;
}

vImage_Error FastFilter_HorTentFilterByResampling(uint64_t a1, CVPixelBufferRef pixelBuffer, __CVBuffer *a3, uint64_t a4, uint64_t a5, vImagePixelCount a6, vImagePixelCount a7)
{
  size_t BytesPerRowOfPlane;
  size_t v15;
  char *v16;
  vImage_Error result;
  vImage_Buffer dest;
  vImage_Buffer src;

  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v15 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
  v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0) + BytesPerRowOfPlane * a5 + a4;
  src.data = (char *)CVPixelBufferGetBaseAddressOfPlane(a3, 0) + v15 * a5 + a4;
  src.height = a7;
  src.width = a6;
  src.rowBytes = v15;
  dest.data = v16;
  dest.height = a7;
  dest.width = a6;
  dest.rowBytes = BytesPerRowOfPlane;
  result = vImageConvolve_Planar8(&src, &dest, *(void **)(a1 + 48), 0, 0, word_22764C364, 1u, 0x1Fu, 256, 0, 0x40u);
  if ((_DWORD)result)
  {
    printf("ERROR: tent filter failed err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

void *FastFilter_HorBoxFilterAndSubsampling(uint64_t a1, CVPixelBufferRef pixelBuffer, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  size_t BytesPerRowOfPlane;
  size_t v13;
  char *BaseAddressOfPlane;
  void *result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int16x8_t v28;

  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  v13 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 88), 0);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  result = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 88), 0);
  if (a6)
  {
    v16 = 0;
    v17 = a5 >> 3;
    v18 = (uint64_t)result + v13 * a4 + (a3 >> 3);
    v19 = &BaseAddressOfPlane[BytesPerRowOfPlane * a4 + a3];
    if (a5 >> 3 <= 1)
      v17 = 1;
    do
    {
      if (a5 >= 8)
      {
        v20 = 0;
        v21 = 0;
        do
        {
          _X14 = &v19[v20];
          __asm { PRFM            #0x11, [X14] }
          v28 = (int16x8_t)vmovl_u8(*(uint8x8_t *)&v19[v20]);
          v28.i16[0] = vaddvq_s16(v28);
          *(_BYTE *)(v18 + v21++) = (unsigned __int32)v28.i32[0] >> 3;
          v20 += 8;
        }
        while (v17 != v21);
      }
      v19 += BytesPerRowOfPlane;
      v18 += v13;
      ++v16;
    }
    while (v16 != a6);
  }
  return result;
}

vImage_Error FastFilter_horTentFilter(uint64_t a1, uint64_t a2, int a3, int *a4, uint64_t a5, uint64_t a6, vImagePixelCount a7, vImagePixelCount a8)
{
  vImage_Error result;
  size_t BytesPerRow;
  size_t v18;
  char *v19;
  uint8_t backgroundColor[4];
  vImage_Buffer dest;
  vImage_Buffer src;

  *a4 = a3 == 0;
  if (*(_DWORD *)(a1 + 12) != -1)
    return 0;
  BytesPerRow = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a2 + 8 * (a3 == 0)));
  v18 = CVPixelBufferGetBytesPerRow(*(CVPixelBufferRef *)(a2 + 8 * a3));
  v19 = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 8 * *a4)) + 4 * a5 + BytesPerRow * a6;
  src.data = (char *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 8 * a3)) + 4 * a5 + v18 * a6;
  src.height = a8;
  src.width = a7;
  src.rowBytes = v18;
  dest.data = v19;
  dest.height = a8;
  dest.width = a7;
  dest.rowBytes = BytesPerRow;
  *(_DWORD *)backgroundColor = 0;
  result = vImageConvolve_ARGB8888(&src, &dest, *(void **)(a1 + 48), 0, 0, word_22764C3A2, 0x1Fu, 1u, 256, backgroundColor, 0x40u);
  if ((_DWORD)result)
  {
    printf("ERROR: tent filter failed err=%d\n", result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t *FIR1DFilter_constructor(int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v8;
  uint64_t *v9;
  _DWORD *v10;
  uint64_t i;
  int v12;
  void *v13;

  v8 = (uint64_t *)malloc_type_calloc(0x30uLL, 1uLL, 0xF7A0A3D3uLL);
  v9 = v8;
  if (!v8)
    goto LABEL_6;
  *v8 = a2;
  v8[1] = a3;
  v8[3] = a4;
  v8[5] = a4 + a2;
  v10 = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  v9[2] = (uint64_t)v10;
  if (!v10)
    goto LABEL_6;
  for (i = *v9; i; --i)
  {
    v12 = *a1++;
    *v10++ = v12;
  }
  v13 = malloc_type_malloc(4 * v9[5], 0x100004052888210uLL);
  v9[4] = (uint64_t)v13;
  if (!v13)
  {
LABEL_6:
    FIR1DFilter_destructor(v9);
    return 0;
  }
  return v9;
}

void FIR1DFilter_destructor(_QWORD *a1)
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = (void *)a1[2];
    if (v2)
    {
      free(v2);
      a1[2] = 0;
    }
    v3 = (void *)a1[4];
    if (v3)
      free(v3);
    free(a1);
  }
}

uint64_t *FIR1DFilter_Gaussian(uint64_t a1, float a2)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v6;
  float *v7;
  uint64_t v8;
  float *v9;
  uint64_t v10;
  float v11;
  float v12;
  float v13;
  void *v14;

  v4 = (uint64_t *)malloc_type_calloc(0x30uLL, 1uLL, 0x6C6376C0uLL);
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  v6 = (unint64_t)(a2 * 6.0 + -1.0) | 1;
  if (v6 <= 3)
    v6 = 3;
  *v4 = v6;
  v4[1] = v6 >> 1;
  v4[3] = a1;
  v4[5] = v6 + a1;
  v7 = (float *)malloc_type_malloc(4 * v6, 0x100004052888210uLL);
  v5[2] = (uint64_t)v7;
  if (!v7)
    goto LABEL_10;
  v8 = *v5;
  if (*v5)
  {
    v9 = v7;
    v10 = 0;
    v11 = (float)(unint64_t)v5[1];
    v12 = 0.0;
    do
    {
      v13 = expf((float)((float)((float)(int)v10 - v11) / a2)* (float)((float)((float)((float)(int)v10 - v11) / a2) * -0.5));
      v9[v10] = v13;
      v12 = v12 + v13;
      ++v10;
    }
    while (v8 != v10);
    do
    {
      *v9 = *v9 / v12;
      ++v9;
      --v8;
    }
    while (v8);
  }
  v14 = malloc_type_malloc(4 * v5[5], 0x100004052888210uLL);
  v5[4] = (uint64_t)v14;
  if (!v14)
  {
LABEL_10:
    FIR1DFilter_destructor(v5);
    return 0;
  }
  return v5;
}

uint64_t FIR1DFilter_execute(uint64_t a1, void *a2, vDSP_Length a3)
{
  if (*(_QWORD *)(a1 + 24) >= a3)
  {
    memcpy((void *)(*(_QWORD *)(a1 + 32) + 4 * *(_QWORD *)(a1 + 8)), a2, 4 * a3);
    bzero(*(void **)(a1 + 32), 4 * *(_QWORD *)(a1 + 8));
    bzero((void *)(*(_QWORD *)(a1 + 32) + 4 * *(_QWORD *)(a1 + 8) + 4 * a3), 4 * (*(_QWORD *)a1 - *(_QWORD *)(a1 + 8)));
    vDSP_conv(*(const float **)(a1 + 32), 1, *(const float **)(a1 + 16), 1, (float *)a2, 1, a3, *(_QWORD *)a1);
    return 0;
  }
  else
  {
    puts("ERROR: too long input data for filtering");
    return 0xFFFFFFFFLL;
  }
}

uint64_t histogramCalculation(void *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  bzero(a1, 0x800uLL);
  if (a6 != a2)
  {
    v16 = 0;
    do
    {
      if (a7 != a2)
      {
        v17 = 0;
        v18 = a3;
        do
        {
          ++*((_QWORD *)a1 + *(unsigned __int8 *)(a4 + v18));
          v17 += a2;
          v18 += a8 * (unint64_t)a2;
        }
        while (v17 < a7 - (unint64_t)a2);
      }
      a4 += a2 * a5;
      v16 += a2;
    }
    while (v16 < a6 - (unint64_t)a2);
  }
  return 0;
}

uint64_t getBlackPointOfChannel(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  uint64_t v9;
  uint64_t i;
  int v11;
  unsigned __int8 v12;
  unint64_t v13;

  histogramCalculation(a1, a2, a3, a4, a5, a6, a7, a8);
  v9 = *a1;
  for (i = 1; i != 256; ++i)
  {
    v9 += a1[i];
    a1[i] = v9;
  }
  v11 = 0;
  do
  {
    v12 = v11;
    v13 = a1[v11++];
  }
  while (v13 <= a1[255] / 0x64uLL);
  return v12;
}

void **FlareDetector_constructor()
{
  void **v0;
  void *v1;

  v0 = (void **)malloc_type_calloc(8uLL, 1uLL, 0x6E03F59EuLL);
  if (!v0 || (v1 = malloc_type_malloc(0x800uLL, 0x100004000313F17uLL), (*v0 = v1) == 0))
  {
    FlareDetector_destructor(v0);
    return 0;
  }
  return v0;
}

void FlareDetector_destructor(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      free(v2);
    free(a1);
  }
}

BOOL FlareDetector_isFlareInBlock(uint64_t **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int BlackPointOfChannel;
  _BOOL8 result;

  BlackPointOfChannel = getBlackPointOfChannel(*a1, 8u, 0, a2, a3, a5, a4, 1u);
  result = 0;
  if (BlackPointOfChannel >= 0xA)
    return (int)(float)((float)((float)getBlackPointOfChannel(*a1, 4u, 0, a6, a7, a9, a8, 2u)
                              + (float)((float)BlackPointOfChannel * 0.45))
                      + -120.0) > 0;
  return result;
}

uint64_t FlareDetector_isFlare(uint64_t **a1, CVPixelBufferRef pixelBuffer)
{
  char *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  char *v6;
  size_t v7;
  size_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  int v16;
  uint64_t v17;
  __CVBuffer *pixelBuffera;
  size_t v20;
  size_t WidthOfPlane;

  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(pixelBuffer, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(pixelBuffer, 0);
  v6 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
  v7 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  v8 = CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL);
  pixelBuffera = pixelBuffer;
  v20 = CVPixelBufferGetWidthOfPlane(pixelBuffer, 1uLL);
  v9 = 0;
  v10 = HeightOfPlane >> 2;
  v11 = v8 >> 2;
  v12 = BytesPerRowOfPlane;
  v13 = v10 * BytesPerRowOfPlane;
  v14 = v7;
  v15 = (v8 >> 2) * v7;
  v16 = 4;
  while (1)
  {
    v9 += FlareDetector_isFlareInBlock(a1, (uint64_t)BaseAddressOfPlane, v12, WidthOfPlane, v10, (uint64_t)v6, v14, v20, v11);
    if (v9 > 2)
      break;
    BaseAddressOfPlane += v13;
    v6 += v15;
    if (!--v16)
    {
      v17 = 0;
      goto LABEL_6;
    }
  }
  v17 = 1;
LABEL_6:
  CVPixelBufferUnlockBaseAddress(pixelBuffera, 1uLL);
  return v17;
}

uint64_t FlareDetector_flareProbability(char a1, unsigned int a2, unsigned int a3)
{
  uint64_t result;

  result = 0;
  if ((a1 + 55) >= 0x69u && (int)(a2 - a3) <= 50 && (int)(a2 - a3) >= -50)
    return KFlareLut[a3 + (unint64_t)a2];
  return result;
}

uint64_t FlareDetector_avgFlareProbability(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unint64_t v6;
  unsigned __int8 *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  if (a3)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    LODWORD(v6) = 0;
    v7 = a2 + 1;
    do
    {
      if ((v3 & 1) == 0)
      {
        v8 = *a2++;
        v5 = v8;
        v9 = *v7++;
        v4 = v9;
      }
      v10 = 0;
      if ((*(_BYTE *)(a1 + v3) + 55) >= 0x69u && (int)(v5 - v4) <= 50 && (int)(v5 - v4) >= -50)
        v10 = KFlareLut[v4 + (unint64_t)v5];
      v6 = (v6 + v10);
      ++v3;
    }
    while (a3 != v3);
  }
  else
  {
    v6 = 0;
  }
  if ((v6 / a3) <= 0xF0uLL)
    return 0;
  else
    return 255;
}

uint64_t Contrast_globalEnhance(__CVBuffer *a1)
{
  double Current;
  _BYTE *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t HeightOfPlane;
  size_t WidthOfPlane;
  int32x2_t v7;
  int32x2_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  _BYTE *v12;
  uint64_t i;
  unsigned int v14;
  float v15;
  uint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  int32x4_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int32x4_t v23;
  int32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  int8x16_t v29;
  uint64_t j;
  uint64_t k;
  CFAbsoluteTime v32;
  _BYTE v34[256];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  Current = CFAbsoluteTimeGetCurrent();
  CVPixelBufferLockBaseAddress(a1, 0);
  BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a1, 0);
  BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a1, 0);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a1, 0);
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a1, 0);
  if (HeightOfPlane)
  {
    v9 = 0;
    v10 = 0;
    v11 = -1;
    v12 = BaseAddressOfPlane;
    do
    {
      if (WidthOfPlane)
      {
        for (i = 0; i != WidthOfPlane; ++i)
        {
          v14 = v12[i];
          if (v14 > v10)
            v10 = v12[i];
          if (v14 < v11)
            v11 = v12[i];
        }
      }
      v12 += BytesPerRowOfPlane;
      ++v9;
    }
    while (v9 != HeightOfPlane);
  }
  else
  {
    v10 = 0;
    v11 = -1;
  }
  v15 = (float)v11;
  *(float *)v7.i32 = (float)v10 - v15;
  if (*(float *)v7.i32 >= 2.0)
  {
    v16 = 0;
    v17 = (float32x4_t)vdupq_n_s32(0x437F0000u);
    *(float *)v7.i32 = 255.0 / *(float *)v7.i32;
    *(float *)v8.i32 = -(float)(v15 * *(float *)v7.i32);
    v18 = (float32x4_t)vdupq_lane_s32(v7, 0);
    v19 = (float32x4_t)vdupq_lane_s32(v8, 0);
    v20 = (int32x4_t)xmmword_22764BA50;
    v21 = (int32x4_t)xmmword_22764BA60;
    v22 = (int32x4_t)xmmword_22764BA70;
    v23 = (int32x4_t)xmmword_22764BA80;
    v24.i64[0] = 0x1000000010;
    v24.i64[1] = 0x1000000010;
    do
    {
      v25 = vmlaq_f32(v19, v18, vcvtq_f32_s32(v20));
      v26 = vmlaq_f32(v19, v18, vcvtq_f32_s32(v21));
      v27 = vmlaq_f32(v19, v18, vcvtq_f32_s32(v22));
      v28 = vmlaq_f32(v19, v18, vcvtq_f32_s32(v23));
      *(int16x4_t *)v29.i8 = vmovn_s32(vcvtq_s32_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v28, v17), (int8x16_t)v17, (int8x16_t)v28)));
      v29.u64[1] = (unint64_t)vmovn_s32(vcvtq_s32_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v27, v17), (int8x16_t)v17, (int8x16_t)v27)));
      *(int16x4_t *)v28.f32 = vmovn_s32(vcvtq_s32_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v26, v17), (int8x16_t)v17, (int8x16_t)v26)));
      *(int16x4_t *)&v28.u32[2] = vmovn_s32(vcvtq_s32_f32((float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v25, v17), (int8x16_t)v17, (int8x16_t)v25)));
      *(int8x16_t *)&v34[v16] = vuzp1q_s8(v29, (int8x16_t)v28);
      v16 += 16;
      v23 = vaddq_s32(v23, v24);
      v22 = vaddq_s32(v22, v24);
      v21 = vaddq_s32(v21, v24);
      v20 = vaddq_s32(v20, v24);
    }
    while (v16 != 256);
    if (HeightOfPlane)
    {
      for (j = 0; j != HeightOfPlane; ++j)
      {
        if (WidthOfPlane)
        {
          for (k = 0; k != WidthOfPlane; ++k)
            BaseAddressOfPlane[k] = v34[BaseAddressOfPlane[k]];
        }
        BaseAddressOfPlane += BytesPerRowOfPlane;
      }
    }
    CVPixelBufferUnlockBaseAddress(a1, 0);
    v32 = CFAbsoluteTimeGetCurrent();
    printf("time=%f\n", v32 - Current);
  }
  return 0;
}

uint64_t openPanoArchive(uint64_t a1, uint64_t *a2)
{
  *a2 = archive_write_new();
  archive_write_set_compression_none();
  archive_write_set_format_ar_bsd();
  archive_write_open_filename();
  return 0;
}

uint64_t addDataFileToPanoArchive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v8 = 0;
  v5 = sub_227637BC4(a1, a2, a4, &v8);
  if ((v5 & 0x80000000) != 0)
  {
    v6 = v5;
    syslog(3, "ACTDataDump error %d @ %s (line %d)", v5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", 58);
  }
  else if (archive_write_data() == a4)
  {
    v6 = 0;
  }
  else
  {
    v6 = 4294967293;
    syslog(3, "ACTDataDump error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", 62);
  }
  if (v8)
    archive_entry_free();
  return v6;
}

uint64_t sub_227637BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  int v4;
  uint64_t v5;

  if (a1)
  {
    *a4 = archive_entry_new();
    archive_entry_set_pathname();
    archive_entry_set_size();
    archive_entry_set_filetype();
    archive_entry_set_perm();
    time(0);
    archive_entry_set_mtime();
    if (!archive_write_header())
      return 0;
    v4 = 46;
  }
  else
  {
    v4 = 34;
  }
  v5 = 4294967293;
  syslog(3, "ACTDataDump error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", v4);
  return v5;
}

uint64_t addCVPixelBufferToPanoArchive(uint64_t a1, uint64_t a2, CVPixelBufferRef pixelBuffer, int a4)
{
  unsigned int v8;
  size_t PlaneCount;
  signed int PixelFormatType;
  unsigned int v11;
  size_t i;
  int BytesPerRowOfPlane;
  uint64_t v14;
  char *BaseAddress;
  int v16;
  uint64_t v17;
  int v18;
  char *BaseAddressOfPlane;
  uint64_t v21;
  int v22;
  char *v23;
  uint64_t v24;
  int v25;
  size_t v26;
  int v27;
  uint64_t v28;
  int BytesPerRow;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int Width;

  v8 = CVPixelBufferGetDataSize(pixelBuffer) + 16;
  PlaneCount = CVPixelBufferGetPlaneCount(pixelBuffer);
  PixelFormatType = CVPixelBufferGetPixelFormatType(pixelBuffer);
  if (a4)
    v11 = v8;
  else
    v11 = 16;
  if (PlaneCount)
  {
    for (i = 0; i != PlaneCount; ++i)
    {
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, i);
      v11 += CVPixelBufferGetHeightOfPlane(pixelBuffer, i) * BytesPerRowOfPlane;
    }
  }
  Width = 0;
  v33 = 0;
  v14 = sub_227637BC4(a1, a2, v11, &v33);
  if ((v14 & 0x80000000) != 0)
  {
    v17 = v14;
    syslog(3, "ACTDataDump error %d @ %s (line %d)", v14, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", 93);
    goto LABEL_24;
  }
  Width = CVPixelBufferGetWidth(pixelBuffer);
  if (archive_write_data() != 4)
  {
    v18 = 99;
    goto LABEL_23;
  }
  Width = CVPixelBufferGetHeight(pixelBuffer);
  if (archive_write_data() != 4)
  {
    v18 = 103;
    goto LABEL_23;
  }
  Width = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
  if (archive_write_data() != 4)
  {
    v18 = 107;
    goto LABEL_23;
  }
  Width = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 1uLL);
  if (archive_write_data() != 4)
  {
    v18 = 111;
    goto LABEL_23;
  }
  CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
  if (PlaneCount > 1)
  {
    if (!a4 || (PixelFormatType & 0xFFFFFFEF) != 0x34323066)
    {
      v26 = 0;
      while (1)
      {
        v27 = CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, v26);
        v28 = CVPixelBufferGetHeightOfPlane(pixelBuffer, v26) * v27;
        CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, v26);
        if (archive_write_data() != v28)
          break;
        if (PlaneCount == ++v26)
          goto LABEL_51;
      }
      v18 = 166;
      goto LABEL_23;
    }
    BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 0);
    if (CVPixelBufferGetHeightOfPlane(pixelBuffer, 0))
    {
      v21 = 0;
      while (1)
      {
        v22 = CVPixelBufferGetWidth(pixelBuffer);
        if (archive_write_data() != v22)
          break;
        BaseAddressOfPlane += CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
        if (CVPixelBufferGetHeightOfPlane(pixelBuffer, 0) <= ++v21)
          goto LABEL_33;
      }
      v18 = 148;
      goto LABEL_23;
    }
LABEL_33:
    v23 = (char *)CVPixelBufferGetBaseAddressOfPlane(pixelBuffer, 1uLL);
    if (CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL))
    {
      v24 = 0;
      while (1)
      {
        v25 = CVPixelBufferGetWidth(pixelBuffer);
        if (archive_write_data() != v25)
          break;
        v23 += CVPixelBufferGetBytesPerRowOfPlane(pixelBuffer, 0);
        if (CVPixelBufferGetHeightOfPlane(pixelBuffer, 1uLL) <= ++v24)
          goto LABEL_51;
      }
      v18 = 157;
      goto LABEL_23;
    }
    goto LABEL_51;
  }
  BaseAddress = (char *)CVPixelBufferGetBaseAddress(pixelBuffer);
  if (!a4)
  {
    BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBuffer);
    v30 = CVPixelBufferGetHeight(pixelBuffer) * BytesPerRow;
    if (archive_write_data() == v30)
      goto LABEL_51;
    v18 = 137;
LABEL_23:
    v17 = 4294967293;
    syslog(3, "ACTDataDump error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", v18);
    goto LABEL_24;
  }
  if (PixelFormatType <= 2037741157)
  {
    if (PixelFormatType == 32 || PixelFormatType == 1111970369)
    {
      v16 = 4;
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  v16 = 2;
  if (PixelFormatType != 2037741158 && PixelFormatType != 2037741171)
LABEL_46:
    v16 = 1;
LABEL_47:
  if (CVPixelBufferGetHeight(pixelBuffer))
  {
    v31 = 0;
    while (1)
    {
      v32 = CVPixelBufferGetWidth(pixelBuffer) * v16;
      if (archive_write_data() != v32)
        break;
      BaseAddress += CVPixelBufferGetBytesPerRow(pixelBuffer);
      if (CVPixelBufferGetHeight(pixelBuffer) <= ++v31)
        goto LABEL_51;
    }
    v18 = 129;
    goto LABEL_23;
  }
LABEL_51:
  CVPixelBufferUnlockBaseAddress(pixelBuffer, 1uLL);
  v17 = 0;
LABEL_24:
  if (v33)
    archive_entry_free();
  return v17;
}

uint64_t closePanoArchive(uint64_t a1)
{
  uint64_t v1;

  if (a1)
  {
    archive_write_close();
    archive_write_finish();
    return 0;
  }
  else
  {
    v1 = 4294967293;
    syslog(3, "ACTDataDump error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/ACTDataDump.c", 187);
  }
  return v1;
}

uint64_t panoCloseLogFile()
{
  if (qword_2558F4798)
  {
    fclose((FILE *)qword_2558F4798);
    qword_2558F4798 = 0;
  }
  return 0;
}

uint64_t panoOpenLogFile(const char *a1)
{
  FILE *v2;
  uint64_t v3;
  char __filename[256];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (qword_2558F4798)
  {
    fclose((FILE *)qword_2558F4798);
    qword_2558F4798 = 0;
  }
  if (a1)
  {
    __sprintf_chk(__filename, 0, 0x100uLL, "%s/panov2_log.txt", a1);
    v2 = fopen(__filename, "w+");
    qword_2558F4798 = (uint64_t)v2;
    if (!v2)
      return 2;
    v3 = panoLog((uint64_t)v2, "{panoLog|Version:200}\n");
    panoLog(v3, "%s\n", a1);
  }
  return 0;
}

uint64_t panoLog(uint64_t a1, char *__format, ...)
{
  int v3;
  size_t v4;
  char *v5;
  char __str;
  va_list v8;
  va_list va;

  va_start(va, __format);
  va_copy(v8, va);
  v3 = vsnprintf(&__str, 1uLL, __format, va);
  if (v3 < 1)
  {
    v5 = 0;
  }
  else
  {
    v4 = (v3 + 1);
    v5 = (char *)malloc_type_malloc(v4, 0xD5C4045BuLL);
    vsnprintf(v5, v4, __format, va);
  }
  if (qword_2558F4798)
    fputs(v5, (FILE *)qword_2558F4798);
  if (v5)
    free(v5);
  return 0;
}

_DWORD *BlendingDefaults_constructor()
{
  _DWORD *result;

  result = malloc_type_calloc(0xCuLL, 1uLL, 0xDE242D37uLL);
  if (result)
  {
    *(_QWORD *)result = 0;
    result[2] = 1;
  }
  return result;
}

uint64_t BlendingDefaults_reset(uint64_t result)
{
  *(_QWORD *)result = 0;
  *(_DWORD *)(result + 8) = 1;
  return result;
}

void BlendingDefaults_destructor(void *a1)
{
  if (a1)
    free(a1);
}

double BlendingDefaults_copy(uint64_t a1, uint64_t a2)
{
  double result;

  result = *(double *)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
  return result;
}

uint64_t Projections_computeShiftBruteForce(uint64_t a1, int a2, _QWORD *a3, uint64_t a4, int a5, _QWORD *a6, int a7, float *a8, float a9, float *a10, float *a11, float *a12)
{
  float *v12;
  float *v17;
  int v18;
  int v19;
  float *v20;
  float *v21;
  int v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float v32;
  uint64_t v33;
  char v34;
  int v35;
  int v36;
  uint64_t v37;
  char *v38;
  float v39;
  float v40;
  float *v41;
  char *StatusDescription;
  float *v45;
  float *v50;
  float v51[3];

  v12 = a8;
  v17 = a10;
  if (a2 <= a5)
    v18 = a5;
  else
    v18 = a2;
  v19 = 2 * v18;
  v50 = a8;
  if (!a8)
    v50 = (float *)malloc_type_malloc(4 * v19, 0x100004052888210uLL);
  v20 = a10;
  if (!a10)
    v20 = (float *)malloc_type_malloc(4 * v19, 0x100004052888210uLL);
  v21 = a12;
  *v20 = 3.4028e38;
  v22 = 1 - a2;
  v23 = *a11;
  v24 = 0.0;
  if (*a11 >= (float)(1 - a2))
  {
    v25 = (float)(a5 - 1);
    if (v23 <= v25)
    {
      v26 = v23 - (float)v22;
      v27 = v25 - v23;
      if (v26 > v27)
        v27 = v26;
      v24 = a9 / v27;
    }
  }
  if (v22 >= a5)
  {
    v36 = 0;
    v31 = 0;
    v32 = 3.4028e38;
  }
  else
  {
    v45 = v12;
    v28 = 0;
    v29 = (a5 + a2 - 1);
    do
    {
      v51[0] = 3.4028e38;
      v30 = sub_227639DA4(v22 + (int)v28, a1, a2, a3, a4, a5, a6, a7, *a11, v24, v51);
      v31 = v30;
      if ((v30 & 0x80000000) != 0)
      {
        StatusDescription = Projections_getStatusDescription(v30);
        syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v31, StatusDescription, "Projections_status Projections_computeShiftBruteForce(const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float, float *, float *, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", 122);
        v12 = v45;
        v17 = a10;
        goto LABEL_36;
      }
      v50[v28] = (float)(v22 + v28);
      v20[v28++] = v51[0];
    }
    while (v29 != v28);
    v32 = *v20;
    if (v29 < 2)
    {
      v36 = 0;
      v12 = v45;
      v17 = a10;
    }
    else
    {
      v33 = 0;
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = v29 - 1;
      v38 = (char *)(v50 + 1);
      v39 = 3.4028e38;
      v12 = v45;
      v17 = a10;
      do
      {
        v40 = v20[v33 + 1];
        if (v32 > v40)
        {
          v36 = (int)*(float *)&v38[4 * v33];
          v32 = v20[v33 + 1];
        }
        if (v33 + 1 < a5 + a2 - 2 && v39 > v40)
        {
          v41 = &v20[v33];
          if (*v41 > v40 && v41[2] > v40)
          {
            v35 = (int)*(float *)&v38[4 * v33];
            v34 = 1;
            v39 = v20[v33 + 1];
          }
        }
        ++v33;
      }
      while (v37 != v33);
      if ((v34 & 1) != 0)
      {
        *a11 = (float)v35;
        *a12 = v39;
        goto LABEL_36;
      }
    }
    v21 = a12;
  }
  *a11 = (float)v36;
  *v21 = v32;
LABEL_36:
  if (!v12 && v50)
    free(v50);
  if (!v17)
    free(v20);
  return v31;
}

uint64_t sub_227639DA4(int a1, uint64_t a2, int a3, _QWORD *a4, uint64_t a5, int a6, _QWORD *a7, int a8, float a9, float a10, float *a11)
{
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  unsigned int v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  char *StatusDescription;
  char *v29;
  float v31;
  uint64_t v32;
  float v33;
  float __C;

  v11 = 0;
  v12 = -a1 & (a1 >> 31);
  if (a3 - 1 >= a6 - 1 - a1)
    v13 = a6 - 1 - a1;
  else
    v13 = a3 - 1;
  if (a6 - 1 >= a3 - 1 + a1)
    v14 = a3 - 1 + a1;
  else
    v14 = a6 - 1;
  v15 = v13 - v12 + 1;
  if (v15 >= a8)
  {
    v22 = a1 & ~(a1 >> 31);
    __C = 0.0;
    vDSP_dotpr((const float *)(a2 + 4 * v12), 1, (const float *)(a5 + 4 * v22), 1, &__C, v15);
    __C = __C / (float)v15;
    *(float *)&v23 = __C;
    v33 = 0.0;
    v32 = 0;
    v31 = 0.0;
    v24 = Projections_normalizeMeanStdUsingTable(a2, v12, v13, a4, 0, &v33, (float *)&v32 + 1, v23);
    if ((v24 & 0x80000000) != 0)
    {
      v11 = v24;
      StatusDescription = Projections_getStatusDescription(v24);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v11, StatusDescription, "Projections_status Projections_computeCost(int, float, float, const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", 58);
    }
    else
    {
      v26 = Projections_normalizeMeanStdUsingTable(a5, v22, v14, a7, 0, (float *)&v32, &v31, v25);
      v11 = v26;
      if ((v26 & 0x80000000) != 0)
      {
        v29 = Projections_getStatusDescription(v26);
        syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v11, v29, "Projections_status Projections_computeCost(int, float, float, const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", 59);
      }
      else
      {
        *a11 = (float)((float)((float)((float)(*((float *)&v32 + 1) * v31) - __C) + (float)(v33 * *(float *)&v32))
                     / (float)((float)(*((float *)&v32 + 1) * v31) + (float)(*((float *)&v32 + 1) * v31)))
             + (float)(a10 * vabds_f32(a9, (float)a1));
      }
    }
  }
  return v11;
}

uint64_t Projections_computeShiftDescent(uint64_t a1, int a2, _QWORD *a3, uint64_t a4, int a5, _QWORD *a6, int a7, float *a8, int *a9)
{
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  uint64_t v21;
  float v22;
  float v23;
  uint64_t v24;
  uint64_t v25;
  float v26;
  int v27;
  uint64_t v28;
  float v29;
  char *v30;
  char *v31;
  int v32;
  int v34;
  uint64_t v35;
  float v36;
  char *StatusDescription;
  int v39;
  float v40;
  int v41;
  float v42;

  v17 = *a8;
  v42 = 3.4028e38;
  v18 = sub_227639DA4((int)v17, a1, a2, a3, a4, a5, a6, a7, v17, 0.0, &v42);
  if ((v18 & 0x80000000) != 0)
  {
    v25 = v18;
    StatusDescription = Projections_getStatusDescription(v18);
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v25, StatusDescription, "Projections_status Projections_computeShiftDescent(const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", 203);
  }
  else
  {
    v19 = *a8;
    v20 = *a8 + -1.0;
    v41 = 2139095039;
    v21 = sub_227639DA4((int)v20, a1, a2, a3, a4, a5, a6, a7, v19, 0.0, (float *)&v41);
    if ((v21 & 0x80000000) != 0)
    {
      v25 = v21;
      v30 = Projections_getStatusDescription(v21);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v25, v30, "Projections_status Projections_computeShiftDescent(const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", 211);
    }
    else
    {
      v22 = *a8;
      v23 = *a8 + 1.0;
      v40 = 3.4028e38;
      v24 = sub_227639DA4((int)v23, a1, a2, a3, a4, a5, a6, a7, v22, 0.0, &v40);
      v25 = v24;
      if ((v24 & 0x80000000) != 0)
      {
        v31 = Projections_getStatusDescription(v24);
        v32 = 219;
LABEL_13:
        syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v25, v31, "Projections_status Projections_computeShiftDescent(const float *, int, const Projections_meanStdTable *, const float *, int, const Projections_meanStdTable *, int, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Optimizer.c", v32);
        return v25;
      }
      v39 = a7;
      v26 = v40;
      if (v42 <= v40)
      {
        *a8 = v20;
        *a9 = v41;
        v34 = (int)(float)(v20 + -1.0);
        if (1 - a2 > v34)
          return v25;
        while (1)
        {
          v42 = 3.4028e38;
          v35 = sub_227639DA4(v34, a1, a2, a3, a4, a5, a6, v39, *a8, 0.0, &v42);
          v25 = v35;
          if ((v35 & 0x80000000) != 0)
            break;
          v36 = v42;
          if (v42 < *(float *)a9)
          {
            *a8 = (float)v34;
            *(float *)a9 = v36;
            if (v34-- > 1 - a2)
              continue;
          }
          return v25;
        }
        v31 = Projections_getStatusDescription(v35);
        v32 = 253;
        goto LABEL_13;
      }
      *a8 = v23;
      *(float *)a9 = v26;
      v27 = (int)(float)(v23 + 1.0);
      if (v27 < a5)
      {
        while (1)
        {
          v42 = 3.4028e38;
          v28 = sub_227639DA4(v27, a1, a2, a3, a4, a5, a6, v39, *a8, 0.0, &v42);
          v25 = v28;
          if ((v28 & 0x80000000) != 0)
            break;
          v29 = v42;
          if (v42 < *(float *)a9)
          {
            *a8 = (float)v27;
            *(float *)a9 = v29;
            if (a5 != ++v27)
              continue;
          }
          return v25;
        }
        v31 = Projections_getStatusDescription(v28);
        v32 = 233;
        goto LABEL_13;
      }
    }
  }
  return v25;
}

uint64_t sub_22763A400(uint64_t result)
{
  int8x8_t *v1;
  uint64_t *v2;
  unint64_t v3;
  int8x16_t *v4;
  uint64_t v5;
  int8x8_t v6;
  unint64_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t *v10;
  int8x16_t v11;
  int8x16_t *v12;
  int8x8_t v13;
  int8x8_t v14;
  int8x8_t v15;
  int8x16_t i;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int32x4_t v21;
  int32x4_t v22;
  int8x8_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int32x4_t v26;
  int32x4_t v27;
  int8x8_t v28;
  uint32x4_t v29;
  uint16x8_t v30;
  uint32x4_t *v31;
  uint64_t v32;

  v1 = *(int8x8_t **)result;
  v2 = *(uint64_t **)(result + 8);
  v3 = *(_QWORD *)(result + 16);
  v4 = *(int8x16_t **)(result + 32);
  v5 = *(_QWORD *)(result + 24);
  v6 = **(int8x8_t **)(result + 40);
  do
  {
    v7 = v3 >> 3;
    v8.i64[0] = -1;
    v8.i64[1] = -1;
    v9 = *v4;
    v10 = v4 + 1;
    v11 = *v10;
    v12 = v10 + 1;
    v13 = v6;
    v14 = vsub_s8(v6, (int8x8_t)0x101010101010101);
    v15 = vadd_s8(v6, (int8x8_t)0x101010101010101);
LABEL_3:
    for (i = *v12; ; i.i64[1] = -1)
    {
      v17 = vextq_s8(v8, v9, 0xCuLL);
      v18 = vextq_s8(v9, v11, 0xCuLL);
      v19 = vextq_s8(v9, v11, 4uLL);
      v20 = vextq_s8(v11, i, 4uLL);
      v21 = (int32x4_t)vcgtq_u32((uint32x4_t)v9, (uint32x4_t)v17);
      v22 = (int32x4_t)vcgtq_u32((uint32x4_t)v11, (uint32x4_t)v18);
      v23 = vbsl_s8(vmovn_s16(vmovn_hight_s32(vmovn_s32(v21), v22)), v14, v13);
      v24 = vbslq_s8((int8x16_t)v21, v17, v9);
      v25 = vbslq_s8((int8x16_t)v22, v18, v11);
      v26 = (int32x4_t)vcgtq_u32((uint32x4_t)v24, (uint32x4_t)v19);
      v27 = (int32x4_t)vcgtq_u32((uint32x4_t)v25, (uint32x4_t)v20);
      v28 = vbsl_s8(vmovn_s16(vmovn_hight_s32(vmovn_s32(v26), v27)), v15, v23);
      v29 = (uint32x4_t)vbslq_s8((int8x16_t)v26, v19, v24);
      v26.i64[0] = *v2++;
      v30 = vmovl_u8(*(uint8x8_t *)v26.i8);
      v31 = (uint32x4_t *)&v12[-2];
      *v31++ = vaddw_u16(v29, *(uint16x4_t *)v30.i8);
      *v31 = vaddw_high_u16((uint32x4_t)vbslq_s8((int8x16_t)v27, v20, v25), v30);
      v31 += 2;
      *v1++ = v28;
      v8 = v11;
      v9 = i;
      v11 = *(int8x16_t *)v31;
      v12 = (int8x16_t *)&v31[1];
      v13 = vadd_s8(v13, (int8x8_t)0x808080808080808);
      v14 = vadd_s8(v14, (int8x8_t)0x808080808080808);
      v15 = vadd_s8(v15, (int8x8_t)0x808080808080808);
      if ((uint64_t)--v7 > 1)
        goto LABEL_3;
      if (!v7)
        break;
      i.i64[0] = -1;
    }
    v4 = *(int8x16_t **)(result + 32);
    v32 = *(_QWORD *)(result + 48);
    v1 = (int8x8_t *)((char *)v1 + v32 - v3);
    v2 = (uint64_t *)((char *)v2 + v32 - v3);
    --v5;
  }
  while (v5);
  return result;
}

uint64_t ACTPano_GPUDownscaler()
{
  return objc_opt_new();
}

uint64_t ACTPano_GPUDownscaler_downscale(void *a1, const char *a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  float v13;
  float v14;
  double v15;

  v13 = a6;
  v14 = a10;
  v15 = (float)(v13 / v14);
  if (v15 < 3.8 || v15 > 4.2)
    ACTLogMessageImp(2, "GPUDownscaler called with downscale of %f; only 4x supported", v15);
  return objc_msgSend_downsample_to_(a1, a2, (uint64_t)a2, a3);
}

_QWORD *createBandPassNoiseReductionContext(uint64_t *a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  char v17;
  char v18;
  _QWORD *v19;
  void *v20;
  int v21;
  void *v22;
  void (*v23)(uint64_t *, uint64_t, uint64_t, uint64_t);
  void (*v24)(uint64_t *);
  int v25;
  void *v26;

  v2 = malloc_type_malloc(0x1C8uLL, 0x10B00409047C607uLL);
  v3 = v2;
  if (!v2)
    return v3;
  if ((a1[11] & 8) != 0)
  {
    v6 = malloc_type_malloc(((unint64_t)(3 * a1[5]) >> 1) * a1[1], 0xFFE475B4uLL);
    v3[56] = v6;
    bzero(v6, a1[1] * a1[5]);
    v4 = v3[56];
    v5 = v4 + a1[5] * a1[1];
  }
  else
  {
    v2[56] = 0;
    v4 = *a1;
    v5 = a1[2];
  }
  v3[2] = v4;
  v3[3] = v5;
  v8 = a1[1];
  v7 = a1[2];
  *v3 = *a1;
  v3[1] = v7;
  v10 = a1[4];
  v9 = a1[5];
  v3[8] = v8;
  v3[9] = v10;
  v3[10] = v9;
  LODWORD(v8) = *((_DWORD *)a1 + 12);
  v11 = *((_DWORD *)a1 + 13) >> 1;
  v12 = *((_DWORD *)a1 + 14);
  v13 = *((_DWORD *)a1 + 15) >> 1;
  *((_DWORD *)v3 + 22) = v11;
  *((_DWORD *)v3 + 23) = v13;
  *((_DWORD *)v3 + 24) = v8 >> 1;
  *((_DWORD *)v3 + 25) = v12;
  v3[13] = a1[8];
  LODWORD(v8) = *((_DWORD *)a1 + 20) | (*((_DWORD *)a1 + 21) << 8);
  v14 = *((_DWORD *)a1 + 19);
  *((_DWORD *)v3 + 28) = *((_DWORD *)a1 + 18);
  *((_DWORD *)v3 + 29) = v8;
  LODWORD(v8) = *((_DWORD *)a1 + 22);
  *((_DWORD *)v3 + 30) = v14;
  *((_DWORD *)v3 + 31) = v8;
  v15 = 80;
  if (v11 == 4 || v11 == 8)
    goto LABEL_9;
  if (v11 == 16)
  {
    v15 = 96;
LABEL_9:
    *((_DWORD *)v3 + 32) = v15;
  }
  v16 = 0;
  *((_DWORD *)v3 + 33) = (v9 + 63) >> 6;
  *((_DWORD *)v3 + 34) = v9 - ((v9 + 63) & 0xFFFFFFC0) + 64;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 18) = 0u;
  *((_OWORD *)v3 + 19) = 0u;
  v3[40] = 0;
  v17 = 1;
  do
  {
    v18 = v17;
    v19 = &v3[9 * v16];
    v19[18] = v3;
    *((_DWORD *)v19 + 38) = v16;
    v19[20] = malloc_type_malloc(0x2640uLL, 0x3D0AF7C5uLL);
    v19[21] = malloc_type_malloc(0x2000uLL, 0x1000040BDFB0063uLL);
    v19[22] = malloc_type_malloc(0x1330uLL, 0xE1971527uLL);
    v20 = malloc_type_malloc(0x2000uLL, 0x1000040BDFB0063uLL);
    v17 = 0;
    v19[23] = 0;
    v19[24] = v20;
    v19[25] = 0;
    v19[26] = 0;
    v16 = 1;
  }
  while ((v18 & 1) != 0);
  *((_OWORD *)v3 + 26) = 0u;
  *((_OWORD *)v3 + 27) = 0u;
  *((_OWORD *)v3 + 24) = 0u;
  *((_OWORD *)v3 + 25) = 0u;
  *((_OWORD *)v3 + 22) = 0u;
  *((_OWORD *)v3 + 23) = 0u;
  *((_OWORD *)v3 + 21) = 0u;
  v21 = *((_DWORD *)a1 + 13);
  if (v21 == 33)
  {
    v22 = sub_227642830;
    v3[42] = sub_2276419A8;
    v3[55] = sub_22763D100;
    v23 = sub_227641CF0;
  }
  else
  {
    if (v21 != 9)
    {
      if (v21)
        return v3;
      v3[52] = 0;
      v3[53] = 0;
      goto LABEL_22;
    }
    if (*((_DWORD *)a1 + 12) == 7)
      v24 = sub_22763C7DC;
    else
      v24 = sub_22763C518;
    v22 = sub_22763D018;
    v3[42] = v24;
    v3[55] = sub_22763D100;
    v23 = sub_22763CB10;
  }
  v3[52] = v22;
  v3[53] = v23;
LABEL_22:
  v25 = *((_DWORD *)a1 + 15);
  if (v25 > 16)
  {
    if (v25 == 17)
    {
      v26 = sub_227641670;
      goto LABEL_35;
    }
    if (v25 == 33)
    {
      if ((a1[11] & 0x10) != 0)
      {
        v3[51] = sub_227642918;
        if (*((_DWORD *)a1 + 16) == 4)
          v26 = sub_22764243C;
        else
          v26 = sub_2276427A8;
      }
      else
      {
        v26 = sub_227642068;
      }
      goto LABEL_35;
    }
  }
  else if (v25)
  {
    if (v25 == 9)
    {
      v26 = sub_22763CE8C;
LABEL_35:
      v3[54] = v26;
    }
  }
  else
  {
    v3[54] = 0;
  }
  return v3;
}

void destroyBandPassNoiseReductionContext(_QWORD *a1)
{
  uint64_t v2;
  char v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = 0;
    v3 = 1;
    do
    {
      v4 = v3;
      v5 = (void *)a1[9 * v2 + 20];
      if (v5)
        free(v5);
      v6 = (void *)a1[9 * v2 + 21];
      if (v6)
        free(v6);
      v7 = (void *)a1[9 * v2 + 22];
      if (v7)
        free(v7);
      v8 = (void *)a1[9 * v2 + 23];
      if (v8)
        free(v8);
      v9 = (void *)a1[9 * v2 + 24];
      if (v9)
        free(v9);
      v3 = 0;
      v2 = 1;
    }
    while ((v4 & 1) != 0);
    v10 = (void *)a1[56];
    if (v10)
      free(v10);
    free(a1);
  }
}

uint64_t updateBandPassNoiseReductionCropRect(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result)
  {
    *(_QWORD *)(result + 288) = a2;
    *(_QWORD *)(result + 296) = a3;
    *(_QWORD *)(result + 304) = a4;
    *(_QWORD *)(result + 312) = a5;
    *(_BYTE *)(result + 328) = 1;
    if (!*(_DWORD *)(result + 204))
      return sub_22763AF10(result);
  }
  return result;
}

uint64_t sub_22763AF10(uint64_t result)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (*(_BYTE *)(result + 328))
  {
    v1 = *(_QWORD *)(result + 56);
    v2 = *(_QWORD *)(result + 296);
    v3 = *(_QWORD *)(result + 312);
    v4 = *(_QWORD *)(result + 320);
    if (v3 > v4)
    {
      *(_QWORD *)(result + 320) = v3;
      v4 = v3;
    }
    v5 = v3 + v2;
    if (v1)
    {
      v6 = *(_QWORD *)(result + 40);
      v7 = v1 + v6;
      v8 = v4 + v2;
      if (v4 + v2 >= *(_QWORD *)(result + 80) - 20)
        v8 = *(_QWORD *)(result + 80) - 20;
      v9 = v5 - (int)v4;
      if (v9 <= 0x14)
        v9 = 20;
      if (v7 > v5)
        v5 = v7;
      if (v8 > v5)
        v5 = v8;
      if (v6 < v2)
        v2 = *(_QWORD *)(result + 40);
      if (v9 < v2)
        v2 = v9;
    }
    v10 = v5 - v2;
    *(_QWORD *)(result + 32) = *(_QWORD *)(result + 288);
    *(_QWORD *)(result + 40) = v2;
    v11 = *(_QWORD *)(result + 304);
    *(_QWORD *)(result + 48) = v11;
    *(_QWORD *)(result + 56) = v10;
    *(_DWORD *)(result + 132) = (v10 + 63) >> 6;
    *(_DWORD *)(result + 136) = v10 - ((v10 + 63) & 0xFFFFFFC0) + 64;
    *(_DWORD *)(result + 208) = v11 >> 6;
    *(_BYTE *)(result + 328) = 0;
  }
  return result;
}

uint64_t DoBandPassNoiseReductionComplete(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  unsigned int v7;
  size_t v8;
  int v9;
  uint64_t v10;

  if (result)
  {
    v2 = result;
    if (!a2)
    {
      *(_DWORD *)(result + 212) = 0;
      return sub_22763B144(result + 144);
    }
    if (*(_BYTE *)(result + 328))
    {
      v3 = *(_DWORD *)(result + 204);
      if (v3)
      {
        *(_DWORD *)(result + 212) = *(_DWORD *)(result + 132) - v3;
        sub_22763B144(result + 144);
      }
    }
    *(_DWORD *)(v2 + 212) = 0;
    v10 = 0;
    v9 = 1;
    v8 = 4;
    sysctlbyname("hw.ncpu", &v9, &v8, 0, 0);
    v4 = *(_DWORD *)(v2 + 208);
    v5 = *(_DWORD *)(v2 + 200);
    if ((v4 - v5) >= 4 && v9 >= 2)
    {
      v7 = v5 + ((v4 - v5) >> 1);
      *(_QWORD *)(v2 + 272) = v7;
      *(_DWORD *)(v2 + 280) = v4;
      *(_DWORD *)(v2 + 208) = v7;
      if (!FigThreadCreate())
      {
        sub_22763B144(v2 + 144);
        FigMemoryBarrier();
        result = FigThreadJoin();
        *(_QWORD *)(v2 + 200) = *(unsigned int *)(v2 + 272);
        return result;
      }
      FigSignalErrorAt3();
      *(_DWORD *)(v2 + 208) = *(_DWORD *)(v2 + 280);
    }
    return sub_22763B144(v2 + 144);
  }
  return result;
}

uint64_t sub_22763B144(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void (*v11)(__int128 *);
  uint64_t v12;
  uint64_t v13;
  void (*v14)(__int128 *);
  unint64_t v15;
  void (*v16)(__int128 *);
  void (*v17)(__int128 *);
  void (*v18)(__int128 *);
  void (*v19)(__int128 *);
  int v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v2 = *(_QWORD *)a1;
  v3 = *(unsigned int *)(a1 + 56);
  if (v3 < *(unsigned int *)(a1 + 64))
  {
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 24);
    v27 = *(_DWORD *)(v2 + 124);
    v32 = *(_QWORD *)(a1 + 16);
    v33 = *(_QWORD *)(v2 + 64);
    v26 = *(unsigned int *)(v2 + 120);
    v25 = *(unsigned int *)(v2 + 116);
    v30 = *(unsigned int *)(v2 + 112);
    v4 = *(_DWORD *)(a1 + 68);
    v23 = v32 + *(int *)(v2 + 88) * (uint64_t)*(int *)(v2 + 128) + *(int *)(v2 + 88);
    v24 = *(unsigned int *)(v2 + 108);
    do
    {
      v5 = *(unsigned int *)(a1 + 60);
      if ((_DWORD)v5 == *(_DWORD *)(v2 + 132) - 1)
      {
        if (*(_DWORD *)(v2 + 136))
          v6 = *(unsigned int *)(v2 + 136);
        else
          v6 = 64;
      }
      else
      {
        v6 = 64;
      }
      v7 = *(_QWORD *)(v2 + 40);
      v8 = *(_QWORD *)(v2 + 64);
      v9 = *(_QWORD *)(v2 + 32) + (v3 << 6);
      v10 = *(_QWORD *)v2 + v9 + (v7 + (v5 << 6)) * v8;
      v31 = *(_QWORD *)(v2 + 16);
      v11 = *(void (**)(__int128 *))(v2 + 432);
      if (v11)
      {
        v12 = *(_QWORD *)(v2 + 8);
        v13 = *(_QWORD *)(v2 + 24);
        if ((v27 & 0x10) == 0)
          goto LABEL_12;
        v14 = *(void (**)(__int128 *))(v2 + 408);
        if (!v14)
          goto LABEL_12;
        *(_QWORD *)&v34 = *(_QWORD *)v2 + v9 + (v7 + (v5 << 6)) * v8;
        *((_QWORD *)&v34 + 1) = v28;
        *(_QWORD *)&v35 = v33;
        *((_QWORD *)&v35 + 1) = v6;
        v22 = v13;
        v14(&v34);
        v13 = v22;
        v11 = *(void (**)(__int128 *))(v2 + 432);
        if (v11)
        {
LABEL_12:
          v15 = v9 + ((v7 >> 1) + 32 * v5) * v8;
          *(_QWORD *)&v34 = v12 + v15;
          *((_QWORD *)&v34 + 1) = v13 + v15;
          *(_QWORD *)&v35 = v33;
          *((_QWORD *)&v35 + 1) = v6 >> 1;
          *(_QWORD *)&v36 = v25;
          *((_QWORD *)&v36 + 1) = v28;
          *(_QWORD *)&v37 = v26;
          *((_QWORD *)&v37 + 1) = v30;
          v11(&v34);
        }
      }
      v16 = *(void (**)(__int128 *))(v2 + 336);
      if (v16)
      {
        *(_QWORD *)&v34 = v10;
        *((_QWORD *)&v34 + 1) = v32;
        *(_QWORD *)&v35 = v33;
        *((_QWORD *)&v35 + 1) = v6;
        v16(&v34);
        v17 = *(void (**)(__int128 *))(v2 + 416);
        if (v17)
        {
          *(_QWORD *)&v34 = v10;
          *((_QWORD *)&v34 + 1) = v23;
          *(_QWORD *)&v35 = v29;
          *((_QWORD *)&v35 + 1) = v33;
          *(_QWORD *)&v36 = v6;
          v17(&v34);
        }
        v18 = *(void (**)(__int128 *))(v2 + 424);
        if (v18)
        {
          *(_QWORD *)&v34 = v32;
          *((_QWORD *)&v34 + 1) = v24;
          *(_QWORD *)&v35 = v6;
          *((_QWORD *)&v35 + 1) = v30;
          v18(&v34);
        }
        v19 = *(void (**)(__int128 *))(v2 + 440);
        if (v19)
        {
          *(_QWORD *)&v34 = v32;
          *((_QWORD *)&v34 + 1) = v29;
          *(_QWORD *)&v35 = v31 + v9 + (v7 + (v5 << 6)) * v8;
          *((_QWORD *)&v35 + 1) = v33;
          *(_QWORD *)&v36 = v6;
          v19(&v34);
        }
      }
      v20 = *(_DWORD *)(a1 + 60) + 1;
      *(_DWORD *)(a1 + 60) = v20;
      if (v20 == *(_DWORD *)(v2 + 132))
      {
        *(_QWORD *)(a1 + 56) = (*(_DWORD *)(a1 + 56) + 1);
        sub_22763AF10(v2);
      }
      if (v4)
      {
        if (!--v4)
          break;
      }
      v3 = *(unsigned int *)(a1 + 56);
    }
    while (v3 < *(unsigned int *)(a1 + 64));
  }
  if (!*(_DWORD *)(a1 + 60))
    sub_22763AF10(v2);
  return 0;
}

double diffMachTime(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  LODWORD(a4) = dword_2558F47A0;
  LODWORD(a5) = *(_DWORD *)algn_2558F47A4;
  return (double)(unint64_t)(a2 - a1)
       * (double)*(unint64_t *)&a4
       / (double)*(unint64_t *)&a5
       / 1000000000.0;
}

uint64_t perfInit()
{
  uint64_t result;

  mach_timebase_info((mach_timebase_info_t)&dword_2558F47A0);
  result = mach_absolute_time();
  qword_2558F47A8 = result;
  return result;
}

double timeElapsedSinceInit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v0 = qword_2558F47A8;
  if (!qword_2558F47A8)
  {
    mach_timebase_info((mach_timebase_info_t)&dword_2558F47A0);
    v0 = mach_absolute_time();
    qword_2558F47A8 = v0;
  }
  v1 = mach_absolute_time();
  LODWORD(v2) = dword_2558F47A0;
  LODWORD(v3) = *(_DWORD *)algn_2558F47A4;
  return (double)(v1 - v0) * (double)v2 / (double)v3 / 1000000000.0;
}

double timestampToSeconds(unint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a3) = dword_2558F47A0;
  LODWORD(a4) = *(_DWORD *)algn_2558F47A4;
  return (double)a1 * (double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 / 1000000000.0;
}

char *Projections_getStatusDescription(int a1)
{
  return Projections_statusDescription[a1 + 4];
}

char *FastRegistration_getStatusDescription(int a1)
{
  return FastRegistration_statusDescription[a1 + 8];
}

_QWORD *Blending_constructor_v2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;

  v19 = malloc_type_calloc(0x130uLL, 1uLL, 0xB6BAE5FEuLL);
  if (!v19)
    goto LABEL_4;
  *v19 = a9;
  v19[1] = a10;
  v19[2] = a9;
  v19[3] = a10;
  v19[4] = a10 * a9;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4 * a3;
  v19[9] = a4;
  v19[15] = 0;
  v19[16] = a1;
  v19[10] = a6;
  v19[11] = a7;
  v19[12] = a8 * a7;
  v19[13] = a8;
  v19[17] = a5;
  *((_DWORD *)v19 + 74) = 1064514355;
  v20 = Stitcher_constructor_v2(a9, a10, a11);
  v19[15] = v20;
  if (v20)
  {
    v21 = Stitcher_maxMinOverlapWidth_v2(v20);
    v19[5] = malloc_type_malloc(4 * v21 + 4, 0x100004052888210uLL);
  }
  else
  {
LABEL_4:
    Blending_destructor_v2(v19);
    return 0;
  }
  return v19;
}

void Blending_destructor_v2(_QWORD *a1)
{
  void **v2;
  void *v3;

  if (a1)
  {
    v2 = (void **)a1[15];
    if (v2)
      Stitcher_destructor_v2(v2);
    v3 = (void *)a1[5];
    if (v3)
      free(v3);
    free(a1);
  }
}

uint64_t Blending_setDefaults_v2(uint64_t a1, int *a2)
{
  return Stitcher_setDefaults_v2(*(uint64_t **)(a1 + 120), a2);
}

_QWORD *Blending_zero_v2()
{
  _QWORD *result;

  result = malloc_type_calloc(0x130uLL, 1uLL, 0xB6BAE5FEuLL);
  if (result)
    result[15] = 0;
  return result;
}

int8x16_t Blending_start_v2(uint64_t a1, uint64_t a2, __CVBuffer *a3, __CVBuffer *a4, float a5, float a6, float a7, float a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, int a17, int a18, int a19, int a20,int a21,int a22,unint64_t a23)
{
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64x2_t v33;
  int8x16_t result;
  int v35;

  v27 = (unint64_t)(*(_QWORD *)(a1 + 56) + 1) >> 1;
  *(float *)(a1 + 148) = a7;
  *(float *)(a1 + 152) = (float)v27;
  Blending_overlap_v2(a1, a23, a22, 0, a5, a6, a7, a8);
  sub_227624A3C(a15, a2, a16, a3, a4, *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 200), *(_DWORD *)(a1 + 224), *(_QWORD *)(a1 + 228), HIDWORD(*(_QWORD *)(a1 + 228)), *(_DWORD *)(a1 + 236), v35, a18, a19, a20);
  v28 = *(_QWORD *)(a1 + 272);
  v29 = *(int *)(a1 + 204);
  if (v28 >= v29)
    v28 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v28;
  v30 = *(_QWORD *)(a1 + 248);
  v31 = *(int *)(a1 + 192);
  if (v30 >= v31)
    v30 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v30;
  v32 = *(_QWORD *)(a1 + 196);
  v33.i64[0] = (int)v32;
  v33.i64[1] = SHIDWORD(v32);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v33), *(int8x16_t *)(a1 + 256), (int8x16_t)v33);
  *(_QWORD *)(a1 + 160) = v31;
  result = vextq_s8((int8x16_t)v33, (int8x16_t)v33, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v29;
  ++*(_DWORD *)(a1 + 112);
  return result;
}

uint64_t Blending_overlap_v2(uint64_t a1, unint64_t a2, int a3, int a4, float a5, float a6, float a7, float a8)
{
  float v8;
  float v9;
  int v10;
  int v11;
  int v13;
  int v14;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;

  if (a4)
  {
    v9 = *(float *)(a1 + 148);
    v8 = *(float *)(a1 + 152);
  }
  else
  {
    if (a5 < 0.0 && !*(_DWORD *)(a1 + 280))
    {
      *(_DWORD *)(a1 + 280) = 1;
      *(_DWORD *)(a1 + 284) = *(_DWORD *)(a1 + 148);
    }
    v9 = *(float *)(a1 + 148) + a5;
    v8 = *(float *)(a1 + 152) + a6;
    *(float *)(a1 + 148) = v9;
    *(float *)(a1 + 152) = v8;
    if (v9 > *(float *)(a1 + 284))
    {
      *(float *)(a1 + 284) = v9;
      *(_DWORD *)(a1 + 280) = 0;
    }
  }
  v10 = (int)(float)((float)(v9 - a7) + 0.5);
  v11 = *(_DWORD *)(a1 + 48);
  if (v10 >= v11 || v10 + (int)a2 < 1)
    return 0;
  v13 = (int)(float)((float)(v8 - a8) + 0.5);
  v14 = *(_DWORD *)(a1 + 56);
  if (v13 >= v14 || v13 + a3 < 1)
    return 0;
  v16 = -v10 & ~(-v10 >> 31);
  v17 = v10 & ~(v10 >> 31);
  v18 = v11 - v17;
  if (v11 - v17 >= (int)a2 - v16)
    v18 = a2 - v16;
  v19 = -v13 & ~(-v13 >> 31);
  v20 = v13 & ~(v13 >> 31);
  v21 = v14 - v20;
  if (v14 - v20 >= a3 - v19)
    v21 = a3 - v19;
  v22 = *(_DWORD *)(a1 + 160);
  if (v17 > v22)
    v22 = v17;
  v23 = *(_DWORD *)(a1 + 168);
  if (v20 > v23)
    v23 = v20;
  v24 = *(_DWORD *)(a1 + 176);
  if (v18 + v17 <= v24)
    v24 = v18 + v17 - 1;
  v25 = v21 + v20 <= *(_DWORD *)(a1 + 184) ? v21 + v20 - 1 : *(_DWORD *)(a1 + 184);
  v26 = v24 - v22;
  if (v24 < v22)
    v26 = -1;
  v27 = v26 + 1;
  if (!a4
    && *(int *)(a1 + 112) >= 1
    && ((float)((float)v27 / (float)a2) > *(float *)(a1 + 296) || *(_DWORD *)(a1 + 280)))
  {
    return 0;
  }
  *(_DWORD *)(a1 + 192) = v17;
  *(_DWORD *)(a1 + 196) = v18 + v17 - 1;
  *(_DWORD *)(a1 + 200) = v20;
  *(_DWORD *)(a1 + 204) = v21 + v20 - 1;
  *(_DWORD *)(a1 + 208) = v22;
  *(_DWORD *)(a1 + 212) = v23;
  *(_DWORD *)(a1 + 216) = v24;
  *(_DWORD *)(a1 + 220) = v25;
  *(_DWORD *)(a1 + 224) = v16;
  *(_DWORD *)(a1 + 228) = v19;
  *(_DWORD *)(a1 + 232) = v18;
  *(_DWORD *)(a1 + 236) = v21;
  v28 = 1;
  *(_DWORD *)(a1 + 240) = v27;
  *(_DWORD *)(a1 + 244) = v25 - v23 + 1;
  return v28;
}

int8x16_t Blending_end_v2(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __CVBuffer *a5, __CVBuffer *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, int a15, int a16, int a17, int a18, signed int a19)
{
  uint64_t v25;
  unsigned int v26;
  signed int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64x2_t v37;
  int8x16_t result;
  int v39;

  v25 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 144))
    LODWORD(v25) = v25 + 32;
  v26 = (*(_DWORD *)(a1 + 176) + 1) & 0xFFFFFFFE;
  *(_DWORD *)(a1 + 224) = 0;
  v27 = v25 - v26;
  if ((int)(v25 - v26) >= a19)
    v27 = a19;
  v28 = *(_DWORD *)(a1 + 200);
  v29 = a17 - *(_DWORD *)(a1 + 228);
  if (*(_DWORD *)(a1 + 56) - v28 < v29)
    v29 = *(_DWORD *)(a1 + 56) - v28;
  *(_DWORD *)(a1 + 232) = v27;
  *(_DWORD *)(a1 + 236) = v29;
  *(_DWORD *)(a1 + 192) = v26;
  *(_DWORD *)(a1 + 196) = v26 + v27 - 1;
  *(_DWORD *)(a1 + 204) = v28 + v29 - 1;
  ACTLogMessageImp(1, "Blending_end: xStart=%d, xMax=%d, widthToCopy=%d, xStop=%d, aInRoiHeight=%d, xStartImage=%d\n", v26, v25, v27, v26 + v27 - 1, a19, 0);
  v30 = *(_DWORD *)(a1 + 232);
  v31 = a19 - v30;
  if (a4 != 1)
    v31 = a15;
  sub_227624A3C(a3, a2, a4, a5, a6, *(_DWORD *)(a1 + 192), *(_DWORD *)(a1 + 200), *(_DWORD *)(a1 + 224), *(_DWORD *)(a1 + 228), v30, *(_DWORD *)(a1 + 236), v39, a13, a14, v31);
  v32 = *(_QWORD *)(a1 + 272);
  v33 = *(int *)(a1 + 204);
  if (v32 >= v33)
    v32 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v32;
  v34 = *(_QWORD *)(a1 + 248);
  v35 = *(int *)(a1 + 192);
  if (v34 >= v35)
    v34 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v34;
  v36 = *(_QWORD *)(a1 + 196);
  v37.i64[0] = (int)v36;
  v37.i64[1] = SHIDWORD(v36);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v37), *(int8x16_t *)(a1 + 256), (int8x16_t)v37);
  *(_QWORD *)(a1 + 160) = v35;
  result = vextq_s8((int8x16_t)v37, (int8x16_t)v37, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v33;
  return result;
}

int8x16_t Blending_addImage_v2(uint64_t a1, double a2, double a3, float a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13)
{
  uint64_t v17;
  uint64_t v18;
  vImagePixelCount v19;
  unsigned int v20;
  float v21;
  uint64x2_t v22;
  vImagePixelCount v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64x2_t v40;
  int64x2_t v41;
  int32x2_t v42;
  BOOL v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  size_t v51;
  uint64_t v52;
  uint64_t i;
  float v54;
  uint64_t v55;
  _BYTE *v56;
  float v57;
  unsigned int v58;
  unsigned int v59;
  float v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  size_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  size_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64x2_t v89;
  int8x16_t result;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v103;
  unsigned int v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  unint64_t v109;
  unint64_t v110;

  v101 = *(int *)(a1 + 196);
  v94 = *(int *)(a1 + 204);
  v17 = *(int *)(a1 + 208);
  v18 = *(int *)(a1 + 232);
  v19 = *(unsigned int *)(a1 + 244);
  v103 = *(int *)(a1 + 224);
  v20 = (v17 - *(_DWORD *)(a1 + 192) + v103) & ~(((int)v17 - *(_DWORD *)(a1 + 192) + (int)v103) >> 31);
  v98 = *(int *)(a1 + 212);
  v99 = *(int *)(a1 + 200);
  v100 = *(int *)(a1 + 228);
  v93 = ((_DWORD)v98 - (_DWORD)v99 + (_DWORD)v100) & ~(((int)v98 - (int)v99 + (int)v100) >> 31);
  v92 = v17 & 0xFFFFFFFFFFFFFFFELL;
  v104 = v20 & 0x7FFFFFFE;
  v109 = *(int *)(a1 + 240);
  v95 = *(int *)(a1 + 220);
  v96 = *(int *)(a1 + 192);
  if ((int)v109 <= (int)Stitcher_minOverlapWidth_v2(*(uint64_t **)(a1 + 120), a5) || (int)v19 < 1)
  {
    if ((v109 & 0x80000000) != 0 || (v19 & 0x80000000) != 0 || (int)v18 <= 0)
    {
      v27 = a10;
      v28 = a8;
      v29 = v103;
      v24 = v98;
    }
    else
    {
      v30 = *(_QWORD *)(a1 + 72);
      v32 = *(_QWORD *)(a1 + 128);
      v31 = *(_QWORD *)(a1 + 136);
      if ((int)v98 >= 0)
        v33 = v98;
      else
        v33 = v98 + 1;
      v34 = *(_QWORD *)(a1 + 104);
      v35 = *(_QWORD *)(a1 + 40);
      if ((int)v109 >= 16)
        v36 = 16;
      else
        v36 = v109;
      v106 = v36;
      v29 = v103;
      if ((_DWORD)v109)
      {
        v37 = 0;
        v21 = (float)(int)v106;
        if ((int)v106 <= 1)
          v38 = 1;
        else
          v38 = v106;
        v22 = (uint64x2_t)vdupq_n_s64(v38 - 1);
        v39 = ((_DWORD)v38 + 1) & 0xFFFFFFFE;
        v40 = (int64x2_t)xmmword_22764C2A0;
        v41 = vdupq_n_s64(2uLL);
        do
        {
          v42 = vmovn_s64((int64x2_t)vcgeq_u64(v22, (uint64x2_t)v40));
          if ((v42.i8[0] & 1) != 0)
            *(float *)(v35 + 4 * v37) = (float)(int)v37 / v21;
          if ((v42.i8[4] & 1) != 0)
            *(float *)(v35 + 4 * v37 + 4) = (float)(v37 + 1) / v21;
          v37 += 2;
          v40 = vaddq_s64(v40, v41);
        }
        while (v39 != v37);
      }
      v107 = v19;
      v43 = (int)v19 < 1;
      v27 = a10;
      v28 = a8;
      v24 = v98;
      if (!v43)
      {
        v44 = 0;
        v91 = v27;
        v45 = v27 + v20;
        v46 = v32 + v17 + v30 * v98;
        v47 = v45 + v93 * a8;
        v48 = v31 + (int)v92 + v34 * ((uint64_t)v33 >> 1);
        v49 = v18 - v106;
        v50 = a11 + v104 + (v93 >> 1) * a9;
        v51 = v49;
        if ((int)v106 <= 1)
          v52 = 1;
        else
          v52 = v106;
        v105 = v30;
        do
        {
          if ((_DWORD)v109)
          {
            for (i = 0; i != v52; ++i)
            {
              LOBYTE(v21) = *(_BYTE *)(v46 + i);
              v22.i8[0] = *(_BYTE *)(v47 + i);
              v54 = (float)LODWORD(v21);
              *(float *)v22.i32 = (float)v22.u32[0] - v54;
              v21 = v54 + (float)(*(float *)(v35 + 4 * i) * *(float *)v22.i32);
              *(_BYTE *)(v46 + i) = (int)v21;
            }
          }
          if ((int)v51 > 0)
          {
            memcpy((void *)(v46 + v106), (const void *)(v47 + v106), v51);
            v30 = v105;
          }
          if ((v44 & 1) != 0)
          {
            v61 = a8;
          }
          else
          {
            if ((_DWORD)v109)
            {
              v55 = 0;
              do
              {
                v56 = (_BYTE *)(v48 + v55);
                LOBYTE(v21) = *(_BYTE *)(v48 + v55);
                v57 = (float)LODWORD(v21);
                v22.i8[0] = *(_BYTE *)(v50 + v55);
                *(float *)&v58 = (float)v22.u32[0] - v57;
                *(float *)&v59 = v57 + (float)(*(float *)(v35 + 4 * v55) * *(float *)&v58);
                *v56 = (int)*(float *)&v59;
                LOBYTE(v59) = *(_BYTE *)(v48 + v55 + 1);
                v60 = (float)v59;
                LOBYTE(v58) = *(_BYTE *)(v50 + v55 + 1);
                *(float *)v22.i32 = (float)v58 - v60;
                v21 = v60 + (float)(*(float *)(v35 + 4 * v55) * *(float *)v22.i32);
                v56[1] = (int)v21;
                v55 += 2;
              }
              while (v55 < (int)v106);
            }
            if ((int)v51 > 0)
            {
              memcpy((void *)(v48 + v106), (const void *)(v50 + v106), v51);
              v30 = v105;
            }
            v48 += v30;
            v61 = a8;
            v50 += a8;
          }
          v46 += v30;
          v47 += v61;
          ++v44;
        }
        while (v44 != v107);
        v28 = a8;
        v29 = v103;
        v24 = v98;
        v27 = v91;
      }
    }
  }
  else
  {
    v23 = v19;
    v24 = v98;
    if ((int)v98 >= 0)
      v25 = v98;
    else
      v25 = v98 + 1;
    v26 = a10 + v20;
    v27 = a10;
    v28 = a8;
    Stitcher_pasteImageToReference_v2(*(uint64_t **)(a1 + 120), *(_QWORD *)(a1 + 128) + v17 + *(_QWORD *)(a1 + 72) * v98, *(_QWORD *)(a1 + 136) + v92 + *(_QWORD *)(a1 + 104) * ((uint64_t)v25 >> 1), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56), v26 + v93 * a8, a11 + v104 + (v93 >> 1) * a9, a8, a4, a7, v18, v109, v23, a13);
    v29 = v103;
  }
  v62 = *(_QWORD *)(a1 + 72);
  v63 = v99;
  v64 = *(_QWORD *)(a1 + 128) + v62 * v99;
  v65 = v27 + v100 * v28;
  v66 = v101 - v96 + 1;
  if (v99 >= v24)
  {
    v68 = v94;
  }
  else
  {
    v67 = v24;
    v68 = v94;
    do
    {
      if (v63 <= v94)
      {
        memcpy((void *)(v64 + v96), (const void *)(v65 + v29), v66);
        v67 = v24;
        v65 += v28;
        v62 = *(_QWORD *)(a1 + 72);
      }
      v64 += v62;
      ++v63;
    }
    while (v67 != v63);
  }
  if (v95 + 1 <= v68)
  {
    v69 = (char *)(v65 + v103);
    v70 = v95 + 1;
    do
    {
      memcpy((void *)(v64 + v96), v69, v66);
      v64 += *(_QWORD *)(a1 + 72);
      ++v70;
      v69 += v28;
    }
    while (v70 <= v68);
  }
  if (a11)
  {
    v71 = v68;
    v72 = (v99 + 1) >> 1;
    v73 = v24 + 1;
    v74 = (v71 + 1) >> 1;
    v75 = (v96 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v76 = (v103 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v77 = *(_QWORD *)(a1 + 104);
    v78 = *(_QWORD *)(a1 + 136) + v77 * v72;
    v79 = a11 + ((unint64_t)(v100 + 1) >> 1) * a9;
    v80 = (v101 - v75 + 1) | 1;
    v110 = (unint64_t)(v95 + 1) >> 1;
    if (v72 < v73 >> 1)
    {
      v81 = v73 >> 1;
      do
      {
        if (v72 <= v74)
        {
          memcpy((void *)(v78 + v75), (const void *)(v79 + v76), v80);
          v79 += a9;
          v77 = *(_QWORD *)(a1 + 104);
        }
        v78 += v77;
        ++v72;
      }
      while (v81 != v72);
    }
    v43 = v74 > v110;
    v82 = v74 - v110;
    if (v43)
    {
      v83 = (char *)(v79 + v76);
      do
      {
        memcpy((void *)(v78 + v75), v83, v80);
        v78 += *(_QWORD *)(a1 + 104);
        v83 += a9;
        --v82;
      }
      while (v82);
    }
  }
  v84 = *(_QWORD *)(a1 + 272);
  v85 = *(int *)(a1 + 204);
  if (v84 >= v85)
    v84 = *(int *)(a1 + 204);
  *(_QWORD *)(a1 + 272) = v84;
  v86 = *(_QWORD *)(a1 + 248);
  v87 = *(int *)(a1 + 192);
  if (v86 >= v87)
    v86 = *(int *)(a1 + 192);
  *(_QWORD *)(a1 + 248) = v86;
  v88 = *(_QWORD *)(a1 + 196);
  v89.i64[0] = (int)v88;
  v89.i64[1] = SHIDWORD(v88);
  *(int8x16_t *)(a1 + 256) = vbslq_s8((int8x16_t)vcgtq_u64(*(uint64x2_t *)(a1 + 256), v89), *(int8x16_t *)(a1 + 256), (int8x16_t)v89);
  *(_QWORD *)(a1 + 160) = v87;
  result = vextq_s8((int8x16_t)v89, (int8x16_t)v89, 8uLL);
  *(int8x16_t *)(a1 + 168) = result;
  *(_QWORD *)(a1 + 184) = v85;
  ++*(_DWORD *)(a1 + 112);
  return result;
}

void Blending_reset_v2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 148) = 0;
  *(_DWORD *)(a1 + 152) = 0;
  v3 = *(_QWORD *)(a1 + 48);
  v2 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 264) = 0;
  *(_QWORD *)(a1 + 272) = v2;
  *(_QWORD *)(a1 + 248) = v3;
  *(_QWORD *)(a1 + 256) = 0;
  *(_QWORD *)(a1 + 280) = 0;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  if (*(_BYTE *)(a1 + 144))
  {
    ACTLogMessageImp(1, "Blending_reset - padding start to %d", 32);
    *(_QWORD *)(a1 + 160) = 32;
    *(_QWORD *)(a1 + 176) = 32;
  }
  bzero(*(void **)(a1 + 128), *(_QWORD *)(a1 + 64));
  memset(*(void **)(a1 + 136), 128, *(_QWORD *)(a1 + 96));
  Stitcher_reset_v2(*(uint64_t **)(a1 + 120));
}

uint64_t Blending_storeM2MTime_v2(uint64_t a1, double a2)
{
  return Stitcher_storeM2MTime_v2(*(_QWORD *)(a1 + 120), a2);
}

uint64_t *Blending_storeIOSurfaceIDs_v2(uint64_t a1, int a2, int a3)
{
  return Stitcher_storeIOSurfaceIDs_v2(*(uint64_t **)(a1 + 120), a2, a3);
}

uint64_t getPointersFromGeometry(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4, int *a5, _DWORD *a6, int a7, _QWORD *a8, _DWORD *a9, _DWORD *a10)
{
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;

  if (a7 >= 1)
  {
    v12 = a7;
    do
    {
      v14 = *a3++;
      v13 = v14;
      *a8++ = a1 + *a5 * a2 + v14;
      LODWORD(v14) = *a4++;
      *a9++ = v14 - v13 + 1;
      LODWORD(v14) = *a6++;
      v15 = v14;
      LODWORD(v14) = *a5++;
      *a10++ = v15 - v14 + 1;
      --v12;
    }
    while (v12);
  }
  return 0;
}

uint64_t blockyfyGeometry(int a1, int a2, int a3, char a4, int a5, char a6, _DWORD *a7, _DWORD *a8, float a9, float a10, _DWORD *a11, _DWORD *a12)
{
  _DWORD *v12;
  _DWORD *v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  float v18;
  int v19;
  float v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;

  v13 = a11;
  v12 = a12;
  v14 = -1 << a4;
  if (a5 < 1)
  {
    LODWORD(v17) = 0;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    LODWORD(v17) = 0;
    v18 = 1.0 - a9;
    v19 = v14 & (int)(float)((float)a1 / (float)((float)((float)(a3 - 1) * v18) + 1.0));
    v20 = 1.0 - a10;
    v21 = (-1 << a6) & (int)(float)((float)a2 / (float)((float)((float)(a5 - 1) * v20) + 1.0));
    do
    {
      if (a3 >= 1)
      {
        v22 = 0;
        v23 = 0;
        do
        {
          a7[(int)v17 + v22] = v23;
          a8[(int)v17 + v22] = v19 - 1 + v23;
          a11[(int)v17 + v22] = v16;
          a12[(int)v17 + v22] = v21 - 1 + v16;
          v23 += (int)(float)(v18 * (float)v19);
          ++v22;
        }
        while (a3 != (_DWORD)v22);
        LODWORD(v17) = v17 + v22;
      }
      v16 += (int)(float)(v20 * (float)v21);
      ++v15;
    }
    while (v15 != a5);
  }
  v24 = v17 - 1;
  if ((int)v17 >= 1)
  {
    v25 = a2 - a12[v24];
    v26 = v14 & ((a1 - a8[v24]) >> 1);
    v27 = v14 & (v25 >> 1);
    v17 = v17;
    do
    {
      *a7++ += v26;
      *a8++ += v26;
      *v13++ += v27;
      *v12++ += v27;
      --v17;
    }
    while (v17);
  }
  return 0;
}

void sub_22763C400(double a1, double a2, double a3, double a4, double a5, double a6, uint8x16_t a7, uint8x16_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8x16_t *a16)
{
  uint8x16_t v16;
  uint8x16_t v17;
  uint8x16_t v18;
  int16x8_t v19;

  *a16 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)a7.i8, *(uint8x8_t *)a8.i8), (int16x8_t)vaddl_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v17.i8)), (int16x8_t)vmovl_u8(*(uint8x8_t *)v18.i8)), v19), 1uLL), (uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_high_u8(a7, a8), (int16x8_t)vaddl_high_u8(v16, v17)), (int16x8_t)vmovl_high_u8(v18)), v19), 1uLL);
}

void sub_22763C440(double a1, double a2, double a3, double a4, double a5, double a6, uint8x8_t a7, uint8x8_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8x8_t *a16)
{
  uint8x8_t v16;
  uint8x8_t v17;
  uint8x8_t v18;
  int16x8_t v19;

  *a16 = vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(a7, a8), (int16x8_t)vaddl_u8(v16, v17)), (int16x8_t)vmovl_u8(v18)), v19), 1uLL);
}

__n128 sub_22763C464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint8x8_t *a8)
{
  int16x8_t v8;
  __n128 result;

  result = *(__n128 *)a8->i8;
  *(uint8x16_t *)a8->i8 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*a8, a8[10]), (int16x8_t)vaddl_u8(a8[20], a8[30])), (int16x8_t)vmovl_u8(a8[40])), v8), 1uLL), (uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_high_u8(*(uint8x16_t *)a8->i8, *(uint8x16_t *)a8[10].i8), (int16x8_t)vaddl_high_u8(*(uint8x16_t *)a8[20].i8, *(uint8x16_t *)a8[30].i8)), (int16x8_t)vmovl_high_u8(*(uint8x16_t *)a8[40].i8)), v8), 1uLL);
  return result;
}

uint8x8_t sub_22763C4CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint8x8_t *a8)
{
  int16x8_t v8;
  uint8x8_t result;

  result = *a8;
  *a8 = vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*a8, a8[10]), (int16x8_t)vaddl_u8(a8[20], a8[30])), (int16x8_t)vmovl_u8(a8[40])), v8), 1uLL);
  return result;
}

void sub_22763C518(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8x16_t *v5;
  uint64_t v6;
  int8x16_t v7;
  uint8x16_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  double v19;
  double v20;
  double v21;
  uint8x16_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  int8x16_t v32;
  int8x16_t v33;
  double v34;
  double v35;
  uint8x16_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  int8x16_t v47;
  int8x16_t v48;
  double v49;
  uint8x8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int8x16_t v62;
  int8x16_t v63;
  uint64_t v64;
  uint8x16_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint8x8_t *v68;
  uint64_t v69;
  uint8x8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint8x8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint8x8_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint8x8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint8x8_t *v102;
  uint64_t v103;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = *a1 - 6 * v3 - 8;
  v5 = (uint8x16_t *)v2;
  v6 = a1[3] + 12;
  do
  {
    v7 = (int8x16_t)vdupq_lane_s64(*(_QWORD *)v4, 0);
    sub_22763C400(*(double *)v7.i64, *(double *)(v4 + 8), *(double *)(v4 + 24), *(double *)(v4 + 40), *(double *)(v4 + 56), *(double *)(v4 + 72), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 0xAuLL), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 0xBuLL), (uint64_t)a1, v1, v2, v3, v6, v4 + v3, v4, v5);
    sub_22763C400(v16, *(double *)v17.i64, *(double *)v18.i64, v19, v20, v21, (uint8x16_t)vextq_s8(v17, v18, 0xAuLL), (uint8x16_t)vextq_s8(v17, v18, 0xBuLL), v9, v10, v11, v12, v13, v14, v15, v8 + 1);
    sub_22763C400(v30, v31, *(double *)v32.i64, *(double *)v33.i64, v34, v35, (uint8x16_t)vextq_s8(v32, v33, 0xAuLL), (uint8x16_t)vextq_s8(v32, v33, 0xBuLL), v23, v24, v25, v26, v27, v28, v29, v22 + 1);
    sub_22763C400(v44, v45, v46, *(double *)v47.i64, *(double *)v48.i64, v49, (uint8x16_t)vextq_s8(v47, v48, 0xAuLL), (uint8x16_t)vextq_s8(v47, v48, 0xBuLL), v37, v38, v39, v40, v41, v42, v43, v36 + 1);
    sub_22763C440(v58, v59, v60, v61, *(double *)v62.i64, *(double *)v63.i64, (uint8x8_t)*(_OWORD *)&vextq_s8(v62, v63, 0xAuLL), (uint8x8_t)*(_OWORD *)&vextq_s8(v62, v63, 0xBuLL), v51, v52, v53, v54, v55, v56, v57, v50 + 2);
    v5 = v65 + 1;
    v4 = v66 + v3;
    v6 = v67 - 1;
  }
  while (v6);
  v68 = (uint8x8_t *)v2;
  v69 = 72;
  do
  {
    sub_22763C464((uint64_t)a1, v1, v2, v3, v69, v64, v4, v68);
    sub_22763C464(v71, v72, v73, v74, v75, v76, v77, v70 + 2);
    sub_22763C464(v79, v80, v81, v82, v83, v84, v85, v78 + 2);
    sub_22763C464(v87, v88, v89, v90, v91, v92, v93, v86 + 2);
    sub_22763C4CC(v95, v96, v97, v98, v99, v100, v101, v94 + 2);
    v68 = v102 + 2;
    v69 = v103 - 1;
  }
  while (v69);
}

void sub_22763C674(double a1, double a2, double a3, double a4, double a5, double a6, uint8x16_t a7, uint8x16_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8x16_t *a16)
{
  uint8x16_t v16;
  uint8x16_t v17;
  uint8x16_t v18;
  uint8x16_t v19;
  uint8x16_t v20;
  int16x8_t v21;

  *a16 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16((int16x8_t)vqaddq_u16(vqaddq_u16(vqaddq_u16(vaddl_u8(*(uint8x8_t *)a7.i8, *(uint8x8_t *)a8.i8), vaddl_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v17.i8)), vaddl_u8(*(uint8x8_t *)v18.i8, *(uint8x8_t *)v19.i8)), vmovl_u8(*(uint8x8_t *)v20.i8)), v21), 1uLL), (uint16x8_t)vqdmulhq_s16((int16x8_t)vqaddq_u16(vqaddq_u16(vqaddq_u16(vaddl_high_u8(a7, a8), vaddl_high_u8(v16, v17)), vaddl_high_u8(v18, v19)), vmovl_high_u8(v20)), v21), 1uLL);
}

void sub_22763C6C4(double a1, double a2, double a3, double a4, double a5, double a6, uint8x8_t a7, uint8x8_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8x8_t *a16)
{
  uint8x8_t v16;
  uint8x8_t v17;
  uint8x8_t v18;
  uint8x8_t v19;
  uint8x8_t v20;
  int16x8_t v21;

  *a16 = vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16((int16x8_t)vqaddq_u16(vqaddq_u16(vaddl_u8(a7, a8), vaddl_u8(v16, v17)), vqaddq_u16(vaddl_u8(v18, v19), vmovl_u8(v20))), v21), 1uLL);
}

__n128 sub_22763C6F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint8x8_t *a8)
{
  int16x8_t v8;
  __n128 result;

  result = *(__n128 *)a8->i8;
  *(uint8x16_t *)a8->i8 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16((int16x8_t)vqaddq_u16(vqaddq_u16(vaddl_u8(*a8, a8[10]), vaddl_u8(a8[20], a8[30])), vqaddq_u16(vaddl_u8(a8[40], a8[50]), vmovl_u8(a8[60]))), v8), 1uLL), (uint16x8_t)vqdmulhq_s16((int16x8_t)vqaddq_u16(vqaddq_u16(vaddl_high_u8(*(uint8x16_t *)a8->i8, *(uint8x16_t *)a8[10].i8), vaddl_high_u8(*(uint8x16_t *)a8[20].i8, *(uint8x16_t *)a8[30].i8)), vqaddq_u16(vaddl_high_u8(*(uint8x16_t *)a8[40].i8, *(uint8x16_t *)a8[50].i8), vmovl_high_u8(*(uint8x16_t *)a8[60].i8))),
                                          v8),
                            1uLL);
  return result;
}

uint8x8_t sub_22763C778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint8x8_t *a8)
{
  int16x8_t v8;
  uint8x8_t result;

  result = vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*a8, a8[10]), (int16x8_t)vaddl_u8(a8[20], a8[30])), vaddq_s16((int16x8_t)vaddl_u8(a8[40], a8[50]), (int16x8_t)vmovl_u8(a8[60]))), v8), 1uLL);
  *a8 = result;
  return result;
}

void sub_22763C7DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8x16_t *v5;
  uint64_t v6;
  int8x16_t v7;
  uint8x16_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  double v19;
  double v20;
  double v21;
  uint8x16_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  int8x16_t v32;
  int8x16_t v33;
  double v34;
  double v35;
  uint8x16_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  int8x16_t v47;
  int8x16_t v48;
  double v49;
  uint8x8_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  int8x16_t v62;
  int8x16_t v63;
  uint64_t v64;
  uint8x16_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint8x8_t *v68;
  uint64_t v69;
  uint8x8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint8x8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint8x8_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint8x8_t *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint8x8_t *v102;
  uint64_t v103;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = *a1 - 7 * v3 - 8;
  v5 = (uint8x16_t *)v2;
  v6 = a1[3] + 14;
  do
  {
    v7 = (int8x16_t)vdupq_lane_s64(*(_QWORD *)v4, 0);
    sub_22763C674(*(double *)v7.i64, *(double *)(v4 + 8), *(double *)(v4 + 24), *(double *)(v4 + 40), *(double *)(v4 + 56), *(double *)(v4 + 72), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 9uLL), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 0xAuLL), (uint64_t)a1, v1, v2, v3, v6, v4 + v3, v4, v5);
    sub_22763C674(v16, *(double *)v17.i64, *(double *)v18.i64, v19, v20, v21, (uint8x16_t)vextq_s8(v17, v18, 9uLL), (uint8x16_t)vextq_s8(v17, v18, 0xAuLL), v9, v10, v11, v12, v13, v14, v15, v8 + 1);
    sub_22763C674(v30, v31, *(double *)v32.i64, *(double *)v33.i64, v34, v35, (uint8x16_t)vextq_s8(v32, v33, 9uLL), (uint8x16_t)vextq_s8(v32, v33, 0xAuLL), v23, v24, v25, v26, v27, v28, v29, v22 + 1);
    sub_22763C674(v44, v45, v46, *(double *)v47.i64, *(double *)v48.i64, v49, (uint8x16_t)vextq_s8(v47, v48, 9uLL), (uint8x16_t)vextq_s8(v47, v48, 0xAuLL), v37, v38, v39, v40, v41, v42, v43, v36 + 1);
    sub_22763C6C4(v58, v59, v60, v61, *(double *)v62.i64, *(double *)v63.i64, (uint8x8_t)*(_OWORD *)&vextq_s8(v62, v63, 9uLL), (uint8x8_t)*(_OWORD *)&vextq_s8(v62, v63, 0xAuLL), v51, v52, v53, v54, v55, v56, v57, v50 + 2);
    v5 = v65 + 1;
    v4 = v66 + v3;
    v6 = v67 - 1;
  }
  while (v6);
  v68 = (uint8x8_t *)v2;
  v69 = 72;
  do
  {
    sub_22763C6F0((uint64_t)a1, v1, v2, v3, v69, v64, v4, v68);
    sub_22763C6F0(v71, v72, v73, v74, v75, v76, v77, v70 + 2);
    sub_22763C6F0(v79, v80, v81, v82, v83, v84, v85, v78 + 2);
    sub_22763C6F0(v87, v88, v89, v90, v91, v92, v93, v86 + 2);
    sub_22763C778(v95, v96, v97, v98, v99, v100, v101, v94 + 2);
    v68 = v102 + 2;
    v69 = v103 - 1;
  }
  while (v69);
}

double sub_22763C960(double a1, int8x16_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int8x16_t *a8)
{
  uint8x16_t v8;
  uint8x16_t v9;
  int8x16_t v10;
  double result;

  a2.i64[0] = a8[1].i64[0];
  v10 = vextq_s8(*a8, a2, 8uLL);
  *(_QWORD *)&result = vandq_s8(v10, (int8x16_t)vcgeq_u8(v8, vabdq_u8((uint8x16_t)v10, v9))).u64[0];
  return result;
}

double sub_22763CA9C()
{
  int8x16_t v0;
  int8x16_t v1;
  int16x8_t v2;
  int16x8_t v3;
  double result;

  v2 = (int16x8_t)veorq_s8(v0, v0);
  v3 = (int16x8_t)vzip1q_s8((int8x16_t)v2, (int8x16_t)vshlq_u8((uint8x16_t)v1, (uint8x16_t)vclzq_s8(v1)));
  *(_QWORD *)&result = vrshrq_n_u16(vqshrn_high_n_u32(vqshrn_n_u32(vrecpeq_u32((uint32x4_t)vzip1q_s16(v2, v3)), 0x10uLL), vrecpeq_u32((uint32x4_t)vzip2q_s16(v2, v3)), 0x10uLL), 1uLL).u64[0];
  return result;
}

void sub_22763CB10(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  int16x8_t v10;
  double v11;
  int8x16_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int8x16_t v18;
  double v19;
  int8x16_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int8x16_t v26;
  double v27;
  int8x16_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int8x16_t v34;
  double v35;
  int8x16_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int8x16_t v42;
  double v43;
  int8x16_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int8x16_t v50;
  double v51;
  int8x16_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int8x16_t v58;
  double v59;
  int8x16_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int8x16_t v66;
  double v67;
  int8x16_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int8x16_t v74;
  _OWORD *v75;
  __int128 v76;
  uint64_t v77;
  uint8x16_t v78;
  unsigned int v79;
  uint8x16_t v80;
  int16x8_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  double v87;
  int8x16_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int8x16_t v94;
  double v95;
  int8x16_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int8x16_t v102;
  double v103;
  int8x16_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  int8x16_t v110;
  double v111;
  int8x16_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int8x16_t v118;
  double v119;
  int8x16_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int8x16_t v126;
  double v127;
  int8x16_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  int8x16_t v134;
  double v135;
  int8x16_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  int8x16_t v142;
  double v143;
  int8x16_t *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  int8x16_t v150;
  _OWORD *v151;
  __int128 v152;
  uint64_t v153;
  uint8x16_t v154;
  unsigned int v155;
  uint8x16_t v156;
  int16x8_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  double v163;
  int8x16_t *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int8x16_t v170;
  double v171;
  int8x16_t *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  int8x16_t v178;
  double v179;
  int8x16_t *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  int8x16_t v186;
  double v187;
  int8x16_t *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  int8x16_t v194;
  double v195;
  int8x16_t *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  int8x16_t v202;
  double v203;
  int8x16_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  int8x16_t v210;
  double v211;
  int8x16_t *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int8x16_t v218;
  double v219;
  int8x16_t *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  int8x16_t v226;
  _OWORD *v227;
  __int128 v228;
  uint64_t v229;
  uint8x16_t v230;
  unsigned int v231;
  uint8x16_t v232;
  int16x8_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  double v239;
  int8x16_t *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  int8x16_t v246;
  double v247;
  int8x16_t *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  int8x16_t v254;
  double v255;
  int8x16_t *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  int8x16_t v262;
  double v263;
  int8x16_t *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  int8x16_t v270;
  double v271;
  int8x16_t *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  int8x16_t v278;
  double v279;
  int8x16_t *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  int8x16_t v286;
  double v287;
  int8x16_t *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  int8x16_t v294;
  double v295;
  int8x16_t *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  int8x16_t v302;
  _OWORD *v303;
  __int128 v304;
  uint64_t v305;
  uint64_t v306;

  v4 = *a1;
  v5 = a1[2];
  v6 = a1[3];
  v7 = *a1;
  do
  {
    v8 = *(uint8x16_t *)(v7 + 324);
    v9 = (uint8x16_t)vdupq_n_s8(v6);
    v10 = (int16x8_t)vmull_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v8.i8);
    v11 = sub_22763C960(*(double *)vrshrn_high_n_s16(vrshrn_n_s16(v10, 7uLL), (int16x8_t)vmull_high_u8(v9, v8), 7uLL).i64, (int8x16_t)v10, (uint64_t)a1, v4, a3, a4, v5, (int8x16_t *)v7);
    v19 = sub_22763C960(v11, v18, v13, v14, v15, v16, v17, v12 + 4);
    v27 = sub_22763C960(v19, v26, v21, v22, v23, v24, v25, v20 + 4);
    v35 = sub_22763C960(v27, v34, v29, v30, v31, v32, v33, v28 + 4);
    v43 = sub_22763C960(v35, v42, v37, v38, v39, v40, v41, v36 + 4);
    v51 = sub_22763C960(v43, v50, v45, v46, v47, v48, v49, v44 + 4);
    v59 = sub_22763C960(v51, v58, v53, v54, v55, v56, v57, v52 + 4);
    v67 = sub_22763C960(v59, v66, v61, v62, v63, v64, v65, v60 + 4);
    sub_22763C960(v67, v74, v69, v70, v71, v72, v73, v68 + 4);
    sub_22763CA9C();
    *v75 = v76;
    v77 += 16;
    v78 = *(uint8x16_t *)(v77 + 324);
    v80 = (uint8x16_t)vdupq_n_s8(v79);
    v81 = (int16x8_t)vmull_u8(*(uint8x8_t *)v80.i8, *(uint8x8_t *)v78.i8);
    v87 = sub_22763C960(*(double *)vrshrn_high_n_s16(vrshrn_n_s16(v81, 7uLL), (int16x8_t)vmull_high_u8(v80, v78), 7uLL).i64, (int8x16_t)v81, v82, v83, v84, v85, v86, (int8x16_t *)v77);
    v95 = sub_22763C960(v87, v94, v89, v90, v91, v92, v93, v88 + 4);
    v103 = sub_22763C960(v95, v102, v97, v98, v99, v100, v101, v96 + 4);
    v111 = sub_22763C960(v103, v110, v105, v106, v107, v108, v109, v104 + 4);
    v119 = sub_22763C960(v111, v118, v113, v114, v115, v116, v117, v112 + 4);
    v127 = sub_22763C960(v119, v126, v121, v122, v123, v124, v125, v120 + 4);
    v135 = sub_22763C960(v127, v134, v129, v130, v131, v132, v133, v128 + 4);
    v143 = sub_22763C960(v135, v142, v137, v138, v139, v140, v141, v136 + 4);
    sub_22763C960(v143, v150, v145, v146, v147, v148, v149, v144 + 4);
    sub_22763CA9C();
    *v151 = v152;
    v153 += 16;
    v154 = *(uint8x16_t *)(v153 + 324);
    v156 = (uint8x16_t)vdupq_n_s8(v155);
    v157 = (int16x8_t)vmull_u8(*(uint8x8_t *)v156.i8, *(uint8x8_t *)v154.i8);
    v163 = sub_22763C960(*(double *)vrshrn_high_n_s16(vrshrn_n_s16(v157, 7uLL), (int16x8_t)vmull_high_u8(v156, v154), 7uLL).i64, (int8x16_t)v157, v158, v159, v160, v161, v162, (int8x16_t *)v153);
    v171 = sub_22763C960(v163, v170, v165, v166, v167, v168, v169, v164 + 4);
    v179 = sub_22763C960(v171, v178, v173, v174, v175, v176, v177, v172 + 4);
    v187 = sub_22763C960(v179, v186, v181, v182, v183, v184, v185, v180 + 4);
    v195 = sub_22763C960(v187, v194, v189, v190, v191, v192, v193, v188 + 4);
    v203 = sub_22763C960(v195, v202, v197, v198, v199, v200, v201, v196 + 4);
    v211 = sub_22763C960(v203, v210, v205, v206, v207, v208, v209, v204 + 4);
    v219 = sub_22763C960(v211, v218, v213, v214, v215, v216, v217, v212 + 4);
    sub_22763C960(v219, v226, v221, v222, v223, v224, v225, v220 + 4);
    sub_22763CA9C();
    *v227 = v228;
    v229 += 16;
    v230 = *(uint8x16_t *)(v229 + 324);
    v232 = (uint8x16_t)vdupq_n_s8(v231);
    v233 = (int16x8_t)vmull_u8(*(uint8x8_t *)v232.i8, *(uint8x8_t *)v230.i8);
    v239 = sub_22763C960(*(double *)vrshrn_high_n_s16(vrshrn_n_s16(v233, 7uLL), (int16x8_t)vmull_high_u8(v232, v230), 7uLL).i64, (int8x16_t)v233, v234, v235, v236, v237, v238, (int8x16_t *)v229);
    v247 = sub_22763C960(v239, v246, v241, v242, v243, v244, v245, v240 + 4);
    v255 = sub_22763C960(v247, v254, v249, v250, v251, v252, v253, v248 + 4);
    v263 = sub_22763C960(v255, v262, v257, v258, v259, v260, v261, v256 + 4);
    v271 = sub_22763C960(v263, v270, v265, v266, v267, v268, v269, v264 + 4);
    v279 = sub_22763C960(v271, v278, v273, v274, v275, v276, v277, v272 + 4);
    v287 = sub_22763C960(v279, v286, v281, v282, v283, v284, v285, v280 + 4);
    v295 = sub_22763C960(v287, v294, v289, v290, v291, v292, v293, v288 + 4);
    sub_22763C960(v295, v302, v297, v298, v299, v300, v301, v296 + 4);
    sub_22763CA9C();
    *v303 = v304;
    v7 = v305 + 32;
    v5 = v306 - 1;
  }
  while (v5);
}

double sub_22763CD88()
{
  return 7.74860419e-304;
}

void sub_22763CE8C()
{
  _OWORD *v0;
  __int128 v1;
  _OWORD *v2;
  __int128 v3;
  _OWORD *v4;
  __int128 v5;
  _OWORD *v6;
  __int128 v7;
  uint64_t v8;

  do
  {
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CA9C();
    *v0 = v1;
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CA9C();
    *v2 = v3;
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CA9C();
    *v4 = v5;
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CD88();
    sub_22763CA9C();
    *v6 = v7;
  }
  while (v8 != 1);
}

__n128 sub_22763D018(uint8x16_t **a1)
{
  uint16x8_t *v1;
  uint8x16_t *v2;
  uint8x16_t *v3;
  uint8x16_t *v4;
  uint8x16_t *v5;
  __n128 result;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint8x16_t v12;
  uint16x8_t v13;
  uint16x8_t *v14;

  v1 = (uint16x8_t *)a1[2];
  v2 = a1[3];
  v3 = a1[4];
  v4 = *a1;
  v5 = a1[1];
  do
  {
    result = *(__n128 *)v4;
    v7 = v4[1];
    v8 = v4[2];
    v9 = v4[3];
    v10 = v5[1];
    v11 = v5[2];
    v12 = v5[3];
    v13 = vsubl_high_u8(*v4, *v5);
    *v1 = vsubl_u8(*(uint8x8_t *)v4->i8, *(uint8x8_t *)v5->i8);
    v14 = v1 + 1;
    *v14++ = v13;
    *v14++ = vsubl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v10.i8);
    *v14++ = vsubl_high_u8(v7, v10);
    *v14++ = vsubl_u8(*(uint8x8_t *)v8.i8, *(uint8x8_t *)v11.i8);
    *v14++ = vsubl_high_u8(v8, v11);
    *v14++ = vsubl_u8(*(uint8x8_t *)v9.i8, *(uint8x8_t *)v12.i8);
    *v14 = vsubl_high_u8(v9, v12);
    v1 = v14 + 1;
    v4 = (uint8x16_t *)((char *)v2 + (_QWORD)v4);
    v5 += 5;
    v3 = (uint8x16_t *)((char *)v3 - 1);
  }
  while (v3);
  return result;
}

int8x16_t sub_22763D100(uint8x16_t **a1)
{
  uint8x16_t *v1;
  int16x8_t *v2;
  int8x16_t *v3;
  uint8x16_t *v4;
  uint8x16_t *v5;
  uint8x16_t v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int8x16_t result;

  v1 = *a1;
  v2 = (int16x8_t *)a1[1];
  v3 = (int8x16_t *)a1[2];
  v4 = a1[3];
  v5 = a1[4];
  do
  {
    v6 = *v1;
    v7 = v1[1];
    v8 = v1[2];
    v9 = v1[3];
    v1 += 4;
    v10 = *v2;
    v11 = v2[1];
    v12 = v2[2];
    v13 = v2[3];
    v14 = v2[4];
    v15 = v2[5];
    v16 = v2[6];
    v17 = v2[7];
    v2 += 8;
    result = vqmovun_high_s16(vqmovun_s16(vaddq_s16(v10, (int16x8_t)vmovl_u8(*(uint8x8_t *)v6.i8))), vaddq_s16(v11, (int16x8_t)vmovl_high_u8(v6)));
    *v3 = result;
    v3[1] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(v12, (int16x8_t)vmovl_u8(*(uint8x8_t *)v7.i8))), vaddq_s16(v13, (int16x8_t)vmovl_high_u8(v7)));
    v3[2] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(v14, (int16x8_t)vmovl_u8(*(uint8x8_t *)v8.i8))), vaddq_s16(v15, (int16x8_t)vmovl_high_u8(v8)));
    v3[3] = vqmovun_high_s16(vqmovun_s16(vaddq_s16(v16, (int16x8_t)vmovl_u8(*(uint8x8_t *)v9.i8))), vaddq_s16(v17, (int16x8_t)vmovl_high_u8(v9)));
    v3 = (int8x16_t *)&v4->i8[(_QWORD)v3];
    v5 = (uint8x16_t *)((char *)v5 - 1);
  }
  while (v5);
  return result;
}

_QWORD *Stitcher_constructor_v2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  char *v7;

  v6 = malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  if (v6)
  {
    v7 = Stitcher_SceneCut_constructor_v2(a1, a2, a3);
    *v6 = v7;
    if (!v7)
    {
      free(v6);
      return 0;
    }
  }
  return v6;
}

uint64_t Stitcher_setDefaults_v2(uint64_t *a1, int *a2)
{
  return Stitcher_SceneCut_setDefaults_v2(*a1, a2);
}

void Stitcher_destructor_v2(void **a1)
{
  if (a1)
  {
    Stitcher_SceneCut_destructor_v2(*a1);
    free(a1);
  }
}

void Stitcher_reset_v2(uint64_t *a1)
{
  Stitcher_SceneCut_reset_v2(*a1);
}

uint64_t Stitcher_pasteImageToReference_v2(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, float a9, uint64_t a10, uint64_t a11, unint64_t a12, vImagePixelCount a13, int a14)
{
  return Stitcher_SceneCut_pasteImageToReference_v2(*a1, a2, a3, a4, a9, a5, a6, a7, a8, a10, a11, a12, a13, a14);
}

uint64_t Stitcher_minOverlapWidth_v2(uint64_t *a1, float a2)
{
  return Stitcher_SceneCut_minOverlapWidth_v2(*a1, a2);
}

uint64_t Stitcher_maxMinOverlapWidth_v2(uint64_t *a1)
{
  return Stitcher_SceneCut_maxMinOverlapWidth_v2(*a1);
}

uint64_t Stitcher_storeM2MTime_v2(uint64_t result, double a2)
{
  *(double *)(*(_QWORD *)result + 352) = a2;
  return result;
}

uint64_t *Stitcher_storeIOSurfaceIDs_v2(uint64_t *result, int a2, int a3)
{
  uint64_t v3;

  v3 = *result;
  *(_DWORD *)(v3 + 360) = a2;
  *(_DWORD *)(v3 + 364) = a3;
  return result;
}

void *RobustPano_new(uint64_t a1)
{
  PanoramaProcessor *v2;
  __int128 v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  _OWORD v13[3];

  v2 = [PanoramaProcessor alloc];
  v3 = *(_OWORD *)(a1 + 16);
  v13[0] = *(_OWORD *)a1;
  v13[1] = v3;
  v13[2] = *(_OWORD *)(a1 + 32);
  v6 = (void *)objc_msgSend_init_(v2, v4, (uint64_t)v13, v5);
  objc_msgSend_setDoParallaxCorrection_(v6, v7, 1, v8);
  objc_msgSend_prepareToProcess_(v6, v9, 0, v10);
  objc_msgSend_prepareToProcess_PanoSpecific_frameWidth_frameHeight_(v6, v11, 0, *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  fig_note_initialize_category_with_default_work();
  return v6;
}

uint64_t RobustPano_reset(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  dword_2558F47B0 = 0;
  return objc_msgSend_resetState(a1, a2, a3, a4);
}

uint64_t RobustPano_setDirection(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((_DWORD)a2 == 2)
    objc_msgSend_setDirection_(a1, a2, 2, a4);
  else
    objc_msgSend_setDirection_(a1, a2, 1, a4);
  return 0;
}

uint64_t RobustPano_copyProperty(void *a1, CFTypeRef cf1, uint64_t a3, uint64_t *a4)
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  if (CFEqual(cf1, CFSTR("HighResPanorama")))
  {
    objc_msgSend_finishProcessing(a1, v7, v8, v9);
    objc_msgSend_encodedResult(a1, v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    result = 0;
    *a4 = v13;
  }
  else if (CFEqual(cf1, CFSTR("writeSlicesToDisc"))
         || CFEqual(cf1, CFSTR("ACTPanoramaPreviewScale"))
         || CFEqual(cf1, CFSTR("ACTPanoramaMaxWidth"))
         || CFEqual(cf1, CFSTR("ACTPanoramaPreviewWidth"))
         || CFEqual(cf1, CFSTR("ACTPanoramaPreviewHeight"))
         || CFEqual(cf1, CFSTR("ACTPanoramaDefaultDirection"))
         || CFEqual(cf1, CFSTR("ACTPanoramaDefaultRegistrationMethod")))
  {
    return 0;
  }
  else if (CFEqual(cf1, CFSTR("ACTPanoramaDefaultFallback")))
  {
    return 0;
  }
  else
  {
    return 4294954512;
  }
  return result;
}

uint64_t RobustPano_setProperty()
{
  return 0;
}

uint64_t RobustPano_startCapture(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v3;

  v3 = panoOpenLogFile(a3);
  qword_2558F47B8 = GetHostTime();
  panoLog(32, "Capture started at %.2f\n", *(double *)&qword_2558F47B8);
  return v3;
}

uint64_t RobustPano_stopCapture(void *a1)
{
  double v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  float v14;
  double HostTime;
  int v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = GetHostTime() - *(double *)&qword_2558F47B8;
  v6 = objc_msgSend_nbFramesReceived(a1, v3, v4, v5);
  v10 = objc_msgSend_nbFramesSkipped(a1, v7, v8, v9);
  v14 = v2 / (float)(unint64_t)(v6 - (v10 + objc_msgSend_nbFramesDropped(a1, v11, v12, v13)));
  HostTime = GetHostTime();
  v16 = dword_2558F47B0;
  v20 = objc_msgSend_nbFramesReceived(a1, v17, v18, v19);
  v24 = objc_msgSend_nbFramesSkipped(a1, v21, v22, v23);
  v28 = objc_msgSend_nbFramesDropped(a1, v25, v26, v27);
  panoLog(32, "Capture stopped at %.2f\nCapture stats: %d frames received by RobustPano, %zu frames received by PanoIBP, %zu frames skipped, %zu frames dropped, total time spent %.4f sec, processing time per frames %.3f ms\n", HostTime, v16, v20, v24, v28, v2, v14 * 1000.0);
  return panoCloseLogFile();
}

uint64_t RobustPano_processSampleBuffer(void *a1, opaqueCMSampleBuffer *a2)
{
  NSObject *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  char v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  CMTime time;
  CMTime v32;
  os_log_type_t type;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  FigSampleBufferRetain();
  if (CMSampleBufferGetImageBuffer(a2))
  {
    getHostTime();
    CMSampleBufferGetPresentationTimeStamp(&time, a2);
    CMTimeGetSeconds(&time);
    panoLog(32, "FrameID:%04d time %.3f: frame received PTS:%.3f\n");
  }
  else
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v4 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    getHostTime();
    CMSampleBufferGetPresentationTimeStamp(&v32, a2);
    CMTimeGetSeconds(&v32);
    panoLog(4, "time %.3f: NULL frame received ID:%d PTS:%.3f\n");
  }
  CMGetAttachment(a2, CFSTR("MetadataDictionary"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = v5;
    v10 = (void *)objc_msgSend_mutableCopy(v5, v6, v7, v8);

  }
  else
  {
    v10 = (void *)objc_opt_new();
  }
  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v11, dword_2558F47B0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v14, (uint64_t)v13, (uint64_t)CFSTR("SliceNumber"));

  if (dword_2558F47B0)
    objc_msgSend_setObject_forKeyedSubscript_(v10, v15, (uint64_t)&unk_24EFCA4F0, (uint64_t)CFSTR("SliceType"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v10, v15, (uint64_t)&unk_24EFCA4D8, (uint64_t)CFSTR("SliceType"));
  v17 = dword_2558F47B0++;
  if ((v17 & 1) != 0)
    objc_msgSend_setObject_forKeyedSubscript_(v10, v16, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("SkipFrame"));
  else
    objc_msgSend_setObject_forKeyedSubscript_(v10, v16, MEMORY[0x24BDBD1C0], (uint64_t)CFSTR("SkipFrame"));
  CMGetAttachment(a2, (CFStringRef)*MEMORY[0x24BE104E8], 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v18;
  if (v18)
  {
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("DebugMotionDataFromISP"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v23, (uint64_t)v22, (uint64_t)CFSTR("DebugMotionDataFromISP"));

    objc_msgSend_objectForKeyedSubscript_(v21, v24, (uint64_t)CFSTR("FocalLenIn35mmFilm"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v26, (uint64_t)CFSTR("FocalLenIn35mmFilm"));

  }
  CMSetAttachment(a2, CFSTR("MetadataDictionary"), v10, 1u);
  v29 = objc_msgSend_addFrame_registrationCallback_(a1, v28, (uint64_t)a2, 0);

  return v29;
}

double RobustPano_cropRect(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  double v4;

  objc_msgSend_autocropMask(a1, a2, a3, a4);
  return v4;
}

uint64_t RobustPano_finishProcessing()
{
  return 0;
}

uint64_t Projections_projectionRows_planar8UtoF(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)();
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v18 = a1;
  v19 = a2 >> 1;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v25 = a1 + (a2 >> 1);
  v26 = a2 >> 1;
  v27 = a3;
  v28 = a4;
  v29 = a5;
  v30 = a6 + 4 * (a2 >> 1);
  v6 = dispatch_queue_create("projectionRows_planar8UtoF", MEMORY[0x24BDAC9C0]);
  v7 = MEMORY[0x24BDAC760];
  v13 = MEMORY[0x24BDAC760];
  v14 = 0x40000000;
  v15 = sub_22763DBA8;
  v16 = &unk_24EFC2CB0;
  v17 = &v18;
  dispatch_async(v6, &v13);
  v13 = v7;
  v14 = 0x40000000;
  v15 = sub_22763DBA8;
  v16 = &unk_24EFC2CB0;
  v17 = &v25;
  dispatch_async(v6, &v13);
  dispatch_barrier_sync(v6, &unk_24EFC2CF0);
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = *((unsigned int *)&v24 + 12 * v8);
    if ((_DWORD)v10)
      break;
    v11 = v9;
    v9 = 0;
    v8 = 1;
  }
  while ((v11 & 1) != 0);
  dispatch_release(v6);
  return v10;
}

void sub_22763DBA8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  vDSP_Length v11;
  int64_t v12;
  unint64_t v13;
  uint32x4_t *v14;
  uint8x16_t v15;
  uint16x8_t v16;
  uint16x8_t v17;
  unint64_t v18;
  _DWORD *v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int64_t v27;
  uint32x4_t *v28;
  uint8x16_t v29;
  uint16x8_t v30;
  uint32x4_t v31;
  uint32x4_t v32;
  uint16x8_t v33;
  uint32x4_t v34;
  uint32x4_t v35;
  uint64_t v36;
  uint64_t v37;
  _DWORD *v38;
  unsigned __int8 *v39;
  int v40;
  uint64_t v41;

  v0 = MEMORY[0x24BDAC7A8]();
  STACK[0xFF38] = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t **)(v0 + 32);
  v2 = *((int *)v1 + 6);
  v3 = v1[2];
  _X20 = *v1;
  __asm
  {
    PRFM            #0, [X20]
    PRFM            #0x10, [SP,#0x50+var_30]
  }
  v11 = *((int *)v1 + 2);
  __memcpy_chk();
  v12 = v11 - 16;
  if ((int)v11 < 17)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    v13 = 0;
    v14 = (uint32x4_t *)&STACK[0x3320];
    do
    {
      v15 = *(uint8x16_t *)((char *)&v41 + v13);
      v16 = vmovl_u8(*(uint8x8_t *)v15.i8);
      v17 = vmovl_high_u8(v15);
      *v14 = vmovl_u16(*(uint16x4_t *)v16.i8);
      v14[1] = vmovl_high_u16(v16);
      v14[2] = vmovl_u16(*(uint16x4_t *)v17.i8);
      v14[3] = vmovl_high_u16(v17);
      v13 += 16;
      v14 += 4;
    }
    while (v13 < v12);
  }
  if ((int)v13 < (int)v11)
  {
    v18 = v11 - (unint64_t)v13;
    v19 = (_DWORD *)&STACK[0x3320] + v13;
    v20 = (unsigned __int8 *)&v41 + v13;
    do
    {
      v21 = *v20++;
      *v19++ = v21;
      --v18;
    }
    while (v18);
  }
  v22 = *((_DWORD *)v1 + 3);
  if ((int)v2 < v22)
  {
    v23 = v3 * v2;
    v24 = v2;
    do
    {
      _X20 += v23;
      __asm
      {
        PRFM            #0, [X20]
        PRFM            #0x10, [SP,#0x50+var_30]
      }
      __memcpy_chk();
      if ((int)v11 < 17)
      {
        v36 = 0;
      }
      else
      {
        v27 = 0;
        v28 = (uint32x4_t *)&STACK[0x3320];
        do
        {
          v29 = *(uint8x16_t *)((char *)&v41 + v27);
          v30 = vmovl_u8(*(uint8x8_t *)v29.i8);
          v31 = vaddw_u16(*v28, *(uint16x4_t *)v30.i8);
          v32 = vaddw_high_u16(v28[1], v30);
          v33 = vmovl_high_u8(v29);
          *v28 = v31;
          v28[1] = v32;
          v34 = vaddw_u16(v28[2], *(uint16x4_t *)v33.i8);
          v35 = vaddw_high_u16(v28[3], v33);
          v28[2] = v34;
          v28[3] = v35;
          v27 += 16;
          v28 += 4;
        }
        while (v27 < v12);
        v36 = v27;
      }
      if ((int)v36 < (int)v11)
      {
        v37 = v11 - v36;
        v38 = (_DWORD *)&STACK[0x3320] + v36;
        v39 = (unsigned __int8 *)&v41 + v36;
        do
        {
          v40 = *v39++;
          *v38++ += v40;
          --v37;
        }
        while (v37);
      }
      v24 += v2;
    }
    while (v24 < v22);
  }
  vDSP_vflt32((const int *)&STACK[0x3320], 1, (float *)v1[4], 1, v11);
  *((_DWORD *)v1 + 10) = 0;
}

uint64_t Projections_projectionCols_planar8UtoF(uint64_t a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)();
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v18 = a1;
  v19 = a2;
  v20 = a3 >> 1;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  v25 = a1 + ((uint64_t)a3 >> 1) * a4;
  v26 = a2;
  v27 = a3 >> 1;
  v28 = a4;
  v29 = a5;
  v30 = a6 + 4 * (a3 >> 1);
  v6 = dispatch_queue_create("projectionCols_planar8UtoF", MEMORY[0x24BDAC9C0]);
  v7 = MEMORY[0x24BDAC760];
  v13 = MEMORY[0x24BDAC760];
  v14 = 0x40000000;
  v15 = sub_22763DF54;
  v16 = &unk_24EFC2D10;
  v17 = &v18;
  dispatch_async(v6, &v13);
  v13 = v7;
  v14 = 0x40000000;
  v15 = sub_22763DF54;
  v16 = &unk_24EFC2D10;
  v17 = &v25;
  dispatch_async(v6, &v13);
  dispatch_barrier_sync(v6, &unk_24EFC2D50);
  v8 = 0;
  v9 = 1;
  do
  {
    v10 = *((unsigned int *)&v24 + 12 * v8);
    if ((_DWORD)v10)
      break;
    v11 = v9;
    v9 = 0;
    v8 = 1;
  }
  while ((v11 & 1) != 0);
  dispatch_release(v6);
  return v10;
}

uint64_t sub_22763DF54()
{
  uint64_t result;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v13;
  uint64_t v14;
  int32x2_t v15;
  uint64_t v16;
  uint64_t v17;
  int32x4_t v18;
  uint64_t v19;
  const char *v20;
  uint8x8_t v21;
  int v22;
  uint64_t v23;

  result = MEMORY[0x24BDAC7A8]();
  STACK[0x3308] = *MEMORY[0x24BDAC8D0];
  v1 = *(uint64_t **)(result + 32);
  v2 = *((unsigned int *)v1 + 3);
  if ((int)v2 >= 1)
  {
    v3 = 0;
    _X19 = *v1;
    v5 = *((int *)v1 + 2);
    v6 = v5 - 16;
    do
    {
      __asm
      {
        PRFM            #0, [X19]
        PRFM            #0x10, [SP,#0x60+var_60]
      }
      result = __memcpy_chk();
      v13 = *((_DWORD *)v1 + 6);
      switch(v13)
      {
        case 1:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            v18 = 0uLL;
          }
          else
          {
            v17 = 0;
            v18 = 0uLL;
            do
            {
              v18 = vpadalq_s16(v18, (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v23 + v17)));
              v17 += 16;
            }
            while (v17 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          v15 = (int32x2_t)vpaddq_s32(v18, v18).u64[0];
          break;
        case 2:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            v15 = 0;
          }
          else
          {
            v19 = 0;
            v15 = 0;
            do
            {
              v20 = (char *)&v23 + v19;
              v21 = (uint8x8_t)*(_OWORD *)vld2_s8(v20).val;
              v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8(v21));
              v19 += 16;
            }
            while (v19 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          break;
        case 4:
          if ((int)v5 < 17)
          {
            LODWORD(v16) = 0;
            v15.i32[0] = 0;
          }
          else
          {
            v14 = 0;
            v15 = 0;
            do
            {
              v15 = vpadal_s16(v15, (int16x4_t)vpaddl_u8((uint8x8_t)vqtbl1_s8(*(int8x16_t *)((char *)&v23 + v14), (int8x8_t)0xC0804000C080400)));
              v14 += 16;
            }
            while (v14 < v6);
            LODWORD(v16) = ((v5 - 17) & 0xFFFFFFF0) + 16;
          }
          goto LABEL_23;
        default:
          goto LABEL_27;
      }
      v15.i32[0] = vpadd_s32(v15, v15).u32[0];
LABEL_23:
      v22 = v15.i32[0];
      if ((int)v16 < (int)v5)
      {
        v16 = (int)v16;
        do
        {
          v22 += *((unsigned __int8 *)&v23 + v16);
          v16 += v13;
        }
        while (v16 < v5);
      }
      *(float *)(v1[4] + 4 * v3) = (float)v22;
      _X19 += v1[2];
      ++v3;
    }
    while (v3 != v2);
  }
LABEL_27:
  *((_DWORD *)v1 + 10) = 0;
  return result;
}

uint64_t Projections_projectionRowsCols_planar8UtoF()
{
  uint64_t v0;
  int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float *v7;
  float *v8;
  float *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *StatusDescription;
  uint64_t v20;
  char *v21;
  char *v22;
  uint32x4_t __A;

  v0 = MEMORY[0x24BDAC7A8]();
  v8 = v7;
  v9 = (float *)v4;
  v10 = v3;
  v11 = v2;
  v12 = v1;
  v13 = v0;
  STACK[0x6648] = *MEMORY[0x24BDAC8D0];
  if (v2 & 1 | v1 & 0x1F || v3 & 0x1F | v0 & 0xF)
  {
    v15 = Projections_projectionCols_planar8UtoF(v0, v1, v2, v3, 1, v4);
    if ((v15 & 0x80000000) != 0)
    {
      v17 = v15;
      StatusDescription = Projections_getStatusDescription(v15);
      syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v17, StatusDescription, "Projections_status Projections_projectionRowsCols_planar8UtoF(const uint8_t *, int, int, size_t, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Core.c", 469);
      return v17;
    }
    else
    {
      v16 = Projections_projectionRows_planar8UtoF(v13, v12, v11, v10, 1, (uint64_t)v8);
      v14 = v16;
      if ((v16 & 0x80000000) != 0)
      {
        v22 = Projections_getStatusDescription(v16);
        syslog(3, "Projections error %d:%s in %s @ %s:%d\n", v14, v22, "Projections_status Projections_projectionRowsCols_planar8UtoF(const uint8_t *, int, int, size_t, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Core.c", 470);
      }
    }
  }
  else if (sub_227644580((uint8x16_t *)v0, v1, v2, v3, &STACK[0x3340], &__A, v5, v6, v20))
  {
    v14 = 0xFFFFFFFFLL;
    v21 = Projections_getStatusDescription(-1);
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", -1, v21, "Projections_status Projections_projectionRowsCols_planar8UtoF(const uint8_t *, int, int, size_t, float *, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Core.c", 461);
  }
  else
  {
    vDSP_vflt32((const int *)&STACK[0x3340], 1, v9, 1, v11);
    vDSP_vflt32(__A.i32, 1, v8, 1, v12);
    return 0;
  }
  return v14;
}

uint64_t Projections_smoothProjection(uint64_t a1, int a2, int a3, uint64_t a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  unsigned int v9;
  float v10;
  float v11;

  v4 = -a3;
  if (-a3 < a2)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = v4 - a3;
    do
    {
      v9 = v8 + v5;
      if (v8 + (_DWORD)v5 < 0 || v5 >= a2)
      {
        if (v5 < a2)
        {
          v7 = (int)(float)(*(float *)(a1 + 4 * v5) + (float)v7);
          ++v6;
        }
        v11 = (float)v7;
        if (((v4 + v5) & 0x8000000000000000) == 0)
          *(float *)(a4 + 4 * (v5 - a3)) = v11 / (float)v6;
        if ((v9 & 0x80000000) == 0)
        {
          v7 = (int)(float)(v11 - *(float *)(a1 + 4 * v9));
          --v6;
        }
      }
      else
      {
        v10 = (float)(int)(float)(*(float *)(a1 + 4 * v5) + (float)v7);
        *(float *)(a4 - 4 * a3 + 4 * v5) = v10 / (float)(v6 + 1);
        v7 = (int)(float)(v10 - *(float *)(a1 + 4 * v9));
      }
      ++v5;
    }
    while (a3 + a2 != v5);
  }
  return 0;
}

uint64_t Projections_computeProjectionDerivative(const float *__B, int a2, float *a3)
{
  uint64_t v3;
  char *StatusDescription;
  vDSP_Length v5;
  float v6;
  float __C;

  if (a2 > 1)
  {
    if (a2 == 3)
    {
      v3 = 0;
      *a3 = __B[1] - *__B;
      a3[1] = -(float)(*__B - (float)(__B[2] * 0.5));
      a3[2] = __B[2] - __B[1];
    }
    else
    {
      v5 = (a2 - 2);
      if (a2 == 2)
      {
        v3 = 0;
        v6 = __B[1] - *__B;
        *a3 = v6;
        a3[1] = v6;
      }
      else
      {
        *a3 = __B[1] - *__B;
        a3[a2 - 1] = __B[a2 - 1] - __B[v5];
        __C = 0.5;
        vDSP_vsbsm(__B + 2, 1, __B, 1, &__C, a3 + 1, 1, v5);
        return 0;
      }
    }
  }
  else
  {
    v3 = 0xFFFFFFFFLL;
    StatusDescription = Projections_getStatusDescription(-1);
    syslog(3, "Projections error %d:%s in %s @ %s:%d\n", -1, StatusDescription, "Projections_status Projections_computeProjectionDerivative(const float *, int, float *)", "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Video/Projections/Projections_Core.c", 527);
  }
  return v3;
}

uint64_t Projections_computeProjectionLineRegressionQuality()
{
  uint64_t v0;
  int v1;
  float *v2;
  float *v3;
  uint64_t result;
  float v5;
  int v6;
  const float *v7;
  int v8;
  float v9;
  float v10;
  vDSP_Length v11;
  int v12;
  int v13;
  float v14;
  unint64_t v15;
  float v16;
  double v17;
  float v18;
  float __B[2];
  float __A[2];
  uint64_t __SumOfSquares;
  float __C[2];

  v0 = MEMORY[0x24BDAC7A8]();
  v3 = v2;
  STACK[0x3338] = *MEMORY[0x24BDAC8D0];
  __SumOfSquares = 0;
  __A[1] = 0.0;
  if (v1 >= 2)
  {
    v6 = v1;
    v7 = (const float *)v0;
    v8 = v1 - 1;
    v9 = (float)v1;
    v10 = 1.0 / (float)v1;
    __B[1] = 1.0;
    __A[0] = 0.0;
    v11 = v1;
    vDSP_vramp(__A, &__B[1], __C, 1, v1);
    v12 = v8 * v6;
    if (v8 * v6 >= 0)
      v13 = v8 * v6;
    else
      v13 = v12 + 1;
    v14 = v10 * (float)(v13 >> 1);
    v15 = 715827883 * ((2 * v8) | 1) * v12;
    v16 = v10 * (float)(int)(HIDWORD(v15) + (v15 >> 63));
    vDSP_sve_svesq(v7, 1, (float *)&__SumOfSquares + 1, (float *)&__SumOfSquares, v11);
    *(float *)&__SumOfSquares = v10 * *(float *)&__SumOfSquares;
    *((float *)&__SumOfSquares + 1) = v10 * *((float *)&__SumOfSquares + 1);
    vDSP_dotpr(v7, 1, __C, 1, &__A[1], v11);
    __A[1] = v10 * __A[1];
    *(float *)&v17 = (float)(*(float *)&__SumOfSquares
                           - (float)(*((float *)&__SumOfSquares + 1) * *((float *)&__SumOfSquares + 1)))
                   + (float)((float)((float)-(float)(__A[1] + (float)((float)-v14 * *((float *)&__SumOfSquares + 1)))
                                   / (float)(v16 - (float)(v14 * v14)))
                           * (float)(__A[1] - (float)(v14 * *((float *)&__SumOfSquares + 1))));
    v18 = Projections_fastSqrtf(v17).f32[0];
    result = 0;
    v5 = v18 / v9;
  }
  else
  {
    result = 4294967294;
    v5 = 0.0;
  }
  *v3 = v5;
  return result;
}

__n128 sub_227641500()
{
  __n128 result;

  result.n128_u64[0] = 0x101010101010101;
  result.n128_u64[1] = 0x101010101010101;
  return result;
}

uint16x8_t sub_2276415FC()
{
  int8x16_t v0;
  int8x16_t v1;
  int16x8_t v2;
  int16x8_t v3;

  v2 = (int16x8_t)veorq_s8(v1, v1);
  v3 = (int16x8_t)vzip1q_s8((int8x16_t)v2, (int8x16_t)vshlq_u8((uint8x16_t)v0, (uint8x16_t)vclzq_s8(v0)));
  return vrshrq_n_u16(vqshrn_high_n_u32(vqshrn_n_u32(vrecpeq_u32((uint32x4_t)vzip1q_s16(v2, v3)), 0x10uLL), vrecpeq_u32((uint32x4_t)vzip2q_s16(v2, v3)), 0x10uLL), 1uLL);
}

void sub_227641670()
{
  int8x16_t v0;
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t *v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t *v14;
  int8x16_t *v15;
  uint64_t v16;

  do
  {
    v3 = veorq_s8(v2, v2);
    v4 = veorq_s8(v0, v0);
    v5 = veorq_s8(v1, v1);
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_2276415FC();
    *v6 = v4;
    v7 = veorq_s8(v3, v3);
    v8 = veorq_s8(v4, v4);
    v9 = veorq_s8(v5, v5);
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_2276415FC();
    *v10 = v8;
    v11 = veorq_s8(v7, v7);
    v12 = veorq_s8(v8, v8);
    v13 = veorq_s8(v9, v9);
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_2276415FC();
    *v14 = v12;
    v2 = veorq_s8(v11, v11);
    v0 = veorq_s8(v12, v12);
    v1 = veorq_s8(v13, v13);
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_227641500();
    sub_2276415FC();
    *v15 = v0;
  }
  while (v16 != 1);
}

void sub_227641900(double a1, double a2, double a3, double a4, double a5, double a6, uint8x16_t a7, uint8x16_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint8x16_t *a16)
{
  uint8x16_t v16;
  uint8x16_t v17;
  uint8x16_t v18;
  int16x8_t v19;

  *a16 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)a7.i8, *(uint8x8_t *)a8.i8), (int16x8_t)vaddl_u8(*(uint8x8_t *)v16.i8, *(uint8x8_t *)v17.i8)), (int16x8_t)vmovl_u8(*(uint8x8_t *)v18.i8)), v19), 1uLL), (uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_high_u8(a7, a8), (int16x8_t)vaddl_high_u8(v16, v17)), (int16x8_t)vmovl_high_u8(v18)), v19), 1uLL);
}

__n128 sub_227641940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint8x8_t *a8)
{
  int16x8_t v8;
  __n128 result;

  result = *(__n128 *)a8->i8;
  *(uint8x16_t *)a8->i8 = vqrshrn_high_n_u16(vqrshrn_n_u16((uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8(*a8, a8[12]), (int16x8_t)vaddl_u8(a8[24], a8[36])), (int16x8_t)vmovl_u8(a8[48])), v8), 1uLL), (uint16x8_t)vqdmulhq_s16(vaddq_s16(vaddq_s16((int16x8_t)vaddl_high_u8(*(uint8x16_t *)a8->i8, *(uint8x16_t *)a8[12].i8), (int16x8_t)vaddl_high_u8(*(uint8x16_t *)a8[24].i8, *(uint8x16_t *)a8[36].i8)), (int16x8_t)vmovl_high_u8(*(uint8x16_t *)a8[48].i8)), v8), 1uLL);
  return result;
}

void sub_2276419A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8x16_t *v5;
  uint64_t v6;
  int8x16_t v7;
  uint8x16_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  int8x16_t v17;
  int8x16_t v18;
  double v19;
  double v20;
  double v21;
  uint8x16_t *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int8x16_t v30;
  int8x16_t v31;
  double v32;
  double v33;
  uint8x16_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  int8x16_t v45;
  int8x16_t v46;
  double v47;
  uint8x16_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  int8x16_t v60;
  int8x16_t v61;
  uint8x16_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int8x16_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  int8x16_t v75;
  uint64_t v76;
  uint8x16_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint8x8_t *v80;
  uint64_t v81;
  uint8x8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint8x8_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint8x8_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint8x8_t *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint8x8_t *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint8x8_t *v122;
  uint64_t v123;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = *a1 - 18 * v3 - 24;
  v5 = (uint8x16_t *)v2;
  v6 = a1[3] + 36;
  do
  {
    v7 = (int8x16_t)vdupq_lane_s64(*(_QWORD *)v4, 0);
    sub_227641900(*(double *)v7.i64, *(double *)(v4 + 8), *(double *)(v4 + 24), *(double *)(v4 + 40), *(double *)(v4 + 56), *(double *)(v4 + 72), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 0xEuLL), (uint8x16_t)vextq_s8(v7, *(int8x16_t *)(v4 + 8), 0xFuLL), (uint64_t)a1, v1, v2, v3, v6, v4 + 88, v4, v5);
    sub_227641900(v16, *(double *)v17.i64, *(double *)v18.i64, v19, v20, v21, (uint8x16_t)vextq_s8(v17, v18, 0xEuLL), (uint8x16_t)vextq_s8(v17, v18, 0xFuLL), v9, v10, v11, v12, v13, v14, v15, v8 + 1);
    sub_227641900(*v23, v23[2], *(double *)v30.i64, *(double *)v31.i64, v32, v33, (uint8x16_t)vextq_s8(v30, v31, 0xEuLL), (uint8x16_t)vextq_s8(v30, v31, 0xFuLL), v25, v26, v27, v28, v29, v24 + v28, v24, v22 + 1);
    sub_227641900(v42, v43, v44, *(double *)v45.i64, *(double *)v46.i64, v47, (uint8x16_t)vextq_s8(v45, v46, 0xEuLL), (uint8x16_t)vextq_s8(v45, v46, 0xFuLL), v35, v36, v37, v38, v39, v40, v41, v34 + 1);
    sub_227641900(v56, v57, v58, v59, *(double *)v60.i64, *(double *)v61.i64, (uint8x16_t)vextq_s8(v60, v61, 0xEuLL), (uint8x16_t)vextq_s8(v60, v61, 0xFuLL), v49, v50, v51, v52, v53, v54, v55, v48 + 1);
    sub_227641900(*(double *)v70.i64, v71, v72, v73, v74, *(double *)v75.i64, (uint8x16_t)vextq_s8(v75, v70, 0xEuLL), (uint8x16_t)vextq_s8(v75, v70, 0xFuLL), v63, v64, v65, v66, v67, v68, v69, v62 + 1);
    v5 = v77 + 1;
    v4 = v78 + v3;
    v6 = v79 - 1;
  }
  while (v6);
  v80 = (uint8x8_t *)v2;
  v81 = 96;
  do
  {
    sub_227641940((uint64_t)a1, v1, v2, v3, v81, v76, v4, v80);
    sub_227641940(v83, v84, v85, v86, v87, v88, v89, v82 + 2);
    sub_227641940(v91, v92, v93, v94, v95, v96, v97, v90 + 2);
    sub_227641940(v99, v100, v101, v102, v103, v104, v105, v98 + 2);
    sub_227641940(v107, v108, v109, v110, v111, v112, v113, v106 + 2);
    sub_227641940(v115, v116, v117, v118, v119, v120, v121, v114 + 2);
    v80 = v122 + 2;
    v81 = v123 - 1;
  }
  while (v81);
}

int8x16_t sub_227641B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int8x16_t *a6)
{
  uint8x16_t v6;
  uint8x16_t v7;
  int8x16_t v8;

  v8 = vshlq_n_s8(a6[2], 0);
  return vandq_s8(v8, (int8x16_t)vcgeq_u8(v6, vabdq_u8((uint8x16_t)v8, v7)));
}

uint16x8_t sub_227641C7C()
{
  int8x16_t v0;
  int8x16_t v1;
  int16x8_t v2;
  int16x8_t v3;

  v2 = (int16x8_t)veorq_s8(v1, v1);
  v3 = (int16x8_t)vzip1q_s8((int8x16_t)v2, (int8x16_t)vshlq_u8((uint8x16_t)v0, (uint8x16_t)vclzq_s8(v0)));
  return vrshrq_n_u16(vqshrn_high_n_u32(vqshrn_n_u32(vrecpeq_u32((uint32x4_t)vzip1q_s16(v2, v3)), 0x10uLL), vrecpeq_u32((uint32x4_t)vzip2q_s16(v2, v3)), 0x10uLL), 1uLL);
}

void sub_227641CF0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x16_t *v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int8x16_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int8x16_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int8x16_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int8x16_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int8x16_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int8x16_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int8x16_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int8x16_t *v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int8x16_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int8x16_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  int8x16_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int8x16_t *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int8x16_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int8x16_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int8x16_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  int8x16_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int8x16_t *v119;
  int8x16_t v120;
  int8x16_t v121;
  int8x16_t v122;
  int8x16_t *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int8x16_t *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int8x16_t *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  int8x16_t *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int8x16_t *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int8x16_t *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  int8x16_t *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  int8x16_t *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  int8x16_t *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int8x16_t *v177;
  int8x16_t v178;
  int8x16_t v179;
  int8x16_t v180;
  int8x16_t *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int8x16_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int8x16_t *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  int8x16_t *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  int8x16_t *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  int8x16_t *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  int8x16_t *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  int8x16_t *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  int8x16_t *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  int8x16_t *v235;
  int8x16_t *v236;
  uint64_t v237;

  v7 = *a1;
  v8 = a1[2];
  v9 = (int8x16_t *)*a1;
  do
  {
    v10 = veorq_s8(v6, v6);
    v11 = veorq_s8(v4, v4);
    v12 = veorq_s8(v5, v5);
    sub_227641B38((uint64_t)a1, v7, a3, a4, v8, v9);
    sub_227641B38(v14, v15, v16, v17, v18, v13 + 22);
    sub_227641B38(v20, v21, v22, v23, v24, v19 + 22);
    sub_227641B38(v26, v27, v28, v29, v30, v25 + 22);
    sub_227641B38(v32, v33, v34, v35, v36, v31 + 22);
    sub_227641B38(v38, v39, v40, v41, v42, v37 + 22);
    sub_227641B38(v44, v45, v46, v47, v48, v43 + 22);
    sub_227641B38(v50, v51, v52, v53, v54, v49 + 22);
    sub_227641B38(v56, v57, v58, v59, v60, v55 + 22);
    sub_227641C7C();
    *v61 = v11;
    v62 = veorq_s8(v10, v10);
    v63 = veorq_s8(v11, v11);
    v64 = veorq_s8(v12, v12);
    sub_227641B38(v66, v67, v68, v69, v70, v65 + 1);
    sub_227641B38(v72, v73, v74, v75, v76, v71 + 22);
    sub_227641B38(v78, v79, v80, v81, v82, v77 + 22);
    sub_227641B38(v84, v85, v86, v87, v88, v83 + 22);
    sub_227641B38(v90, v91, v92, v93, v94, v89 + 22);
    sub_227641B38(v96, v97, v98, v99, v100, v95 + 22);
    sub_227641B38(v102, v103, v104, v105, v106, v101 + 22);
    sub_227641B38(v108, v109, v110, v111, v112, v107 + 22);
    sub_227641B38(v114, v115, v116, v117, v118, v113 + 22);
    sub_227641C7C();
    *v119 = v63;
    v120 = veorq_s8(v62, v62);
    v121 = veorq_s8(v63, v63);
    v122 = veorq_s8(v64, v64);
    sub_227641B38(v124, v125, v126, v127, v128, v123 + 1);
    sub_227641B38(v130, v131, v132, v133, v134, v129 + 22);
    sub_227641B38(v136, v137, v138, v139, v140, v135 + 22);
    sub_227641B38(v142, v143, v144, v145, v146, v141 + 22);
    sub_227641B38(v148, v149, v150, v151, v152, v147 + 22);
    sub_227641B38(v154, v155, v156, v157, v158, v153 + 22);
    sub_227641B38(v160, v161, v162, v163, v164, v159 + 22);
    sub_227641B38(v166, v167, v168, v169, v170, v165 + 22);
    sub_227641B38(v172, v173, v174, v175, v176, v171 + 22);
    sub_227641C7C();
    *v177 = v121;
    v178 = veorq_s8(v120, v120);
    v179 = veorq_s8(v121, v121);
    v180 = veorq_s8(v122, v122);
    sub_227641B38(v182, v183, v184, v185, v186, v181 + 1);
    sub_227641B38(v188, v189, v190, v191, v192, v187 + 22);
    sub_227641B38(v194, v195, v196, v197, v198, v193 + 22);
    sub_227641B38(v200, v201, v202, v203, v204, v199 + 22);
    sub_227641B38(v206, v207, v208, v209, v210, v205 + 22);
    sub_227641B38(v212, v213, v214, v215, v216, v211 + 22);
    sub_227641B38(v218, v219, v220, v221, v222, v217 + 22);
    sub_227641B38(v224, v225, v226, v227, v228, v223 + 22);
    sub_227641B38(v230, v231, v232, v233, v234, v229 + 22);
    sub_227641C7C();
    *v235 = v179;
    v6 = veorq_s8(v178, v178);
    v4 = veorq_s8(v179, v179);
    v5 = veorq_s8(v180, v180);
    v9 = v236 + 3;
    v8 = v237 - 1;
  }
  while (v8);
}

__n128 sub_227641F68()
{
  __n128 result;

  result.n128_u64[0] = 0x101010101010101;
  result.n128_u64[1] = 0x101010101010101;
  return result;
}

void sub_227642068()
{
  int8x16_t v0;
  int8x16_t v1;
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t *v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t *v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t *v14;
  int8x16_t *v15;
  uint64_t v16;

  do
  {
    v3 = veorq_s8(v2, v2);
    v4 = veorq_s8(v0, v0);
    v5 = veorq_s8(v1, v1);
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641C7C();
    *v6 = v4;
    v7 = veorq_s8(v3, v3);
    v8 = veorq_s8(v4, v4);
    v9 = veorq_s8(v5, v5);
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641C7C();
    *v10 = v8;
    v11 = veorq_s8(v7, v7);
    v12 = veorq_s8(v8, v8);
    v13 = veorq_s8(v9, v9);
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641C7C();
    *v14 = v12;
    v2 = veorq_s8(v11, v11);
    v0 = veorq_s8(v12, v12);
    v1 = veorq_s8(v13, v13);
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641F68();
    sub_227641C7C();
    *v15 = v0;
  }
  while (v16 != 1);
}

__n128 sub_227642200()
{
  __n128 result;

  result.n128_u64[0] = 0x101010101010101;
  result.n128_u64[1] = 0x101010101010101;
  return result;
}

uint16x8_t sub_22764234C()
{
  int8x16_t v0;
  int8x16_t v1;
  int16x8_t v2;
  int8x16_t v3;
  int16x8_t v4;

  v2 = (int16x8_t)veorq_s8(v1, v1);
  v3 = vuzp1q_s8(v0, v0);
  *(uint8x8_t *)v3.i8 = vshl_u8(*(uint8x8_t *)v3.i8, (uint8x8_t)vclz_s8(*(int8x8_t *)v3.i8));
  v4 = (int16x8_t)vzip1q_s8((int8x16_t)v2, v3);
  return vrshrq_n_u16(vqshrn_high_n_u32(vqshrn_n_u32(vrecpeq_u32((uint32x4_t)vzip1q_s16(v2, v4)), 0x10uLL), vrecpeq_u32((uint32x4_t)vzip2q_s16(v2, v4)), 0x10uLL), 1uLL);
}

void sub_2276423B4()
{
  int8x16_t v0;
  int8x16_t *v1;

  sub_227642200();
  sub_227642200();
  sub_227642200();
  sub_227642200();
  sub_227642200();
  sub_22764234C();
  *v1 = veorq_s8(v0, v0);
}

void sub_22764243C()
{
  uint64_t v0;

  do
  {
    sub_2276423B4();
    sub_2276423B4();
    sub_2276423B4();
    sub_2276423B4();
  }
  while (v0 != 1);
}

int16x8_t sub_2276424C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int8x16_t *a6)
{
  int8x8_t *v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  int8x16_t *v11;
  int8x16_t v12;
  int8x8_t *v13;
  uint8x16_t v14;
  int8x8_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  uint8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;

  v11 = a6 + 1;
  v12 = v11[1];
  v13 = v6 + 1;
  *(int8x8_t *)v14.i8 = *v13;
  v15 = v13[1];
  v16 = vextq_s8(*v11, v12, 4uLL);
  v17 = vextq_s8(*v11, v12, 8uLL);
  v18 = vextq_s8(*v11, v12, 0xCuLL);
  v19 = (int8x16_t)vcgeq_u8(v7, vabdq_u8((uint8x16_t)v16, v8));
  v20 = (int8x16_t)vcgeq_u8(v7, vabdq_u8((uint8x16_t)v18, v8));
  v21 = (int8x16_t)vcgeq_u8(v7, vabdq_u8((uint8x16_t)v12, v8));
  *(int8x8_t *)v22.i8 = vext_s8(*v13, v15, 4uLL);
  v14.u64[1] = (unint64_t)vext_s8(*v13, v15, 2uLL);
  v22.u64[1] = (unint64_t)vext_s8(*v13, v15, 6uLL);
  v23 = vshlq_n_s8((int8x16_t)vcgeq_u8(v7, vabdq_u8(*(uint8x16_t *)v11, v8)), 0);
  v24 = vuzp1q_s8(v23, v19);
  v25 = vuzp2q_s8(v23, v19);
  v26 = vshlq_n_s8((int8x16_t)vcgeq_u8(v7, vabdq_u8((uint8x16_t)v17, v8)), 0);
  v27 = vuzp1q_s8(v26, v20);
  v28 = vuzp2q_s8(v26, v20);
  v29 = vshlq_n_s8(v21, 0);
  v30 = vuzp2q_s8(v21, v21);
  v31 = vandq_s8(vandq_s8(v24, v25), (int8x16_t)vcgeq_u8(v10, vabdq_u8(v14, v9)));
  v32 = vandq_s8(vandq_s8(v27, v28), (int8x16_t)vcgeq_u8(v10, vabdq_u8(v22, v9)));
  *(int8x8_t *)v30.i8 = vand_s8(vand_s8(*(int8x8_t *)v30.i8, (int8x8_t)*(_OWORD *)&vuzp1q_s8(v29, v29)), (int8x8_t)vcge_u8(*(uint8x8_t *)v10.i8, vabd_u8((uint8x8_t)v15, *(uint8x8_t *)v9.i8)));
  return vaddq_s16(vaddq_s16((int16x8_t)vaddl_u8((uint8x8_t)*(_OWORD *)&vandq_s8(*v11, vzip1q_s8(v31, v31)), (uint8x8_t)*(_OWORD *)&vandq_s8(v16, vzip2q_s8(v31, v31))), (int16x8_t)vaddl_u8((uint8x8_t)*(_OWORD *)&vandq_s8(v17, vzip1q_s8(v32, v32)), (uint8x8_t)*(_OWORD *)&vandq_s8(v18, vzip2q_s8(v32, v32)))), (int16x8_t)vmovl_u8((uint8x8_t)*(_OWORD *)&vandq_s8(v12, vzip1q_s8(v30, v30))));
}

void sub_2276426F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int8x16_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int8x16_t *v57;

  sub_2276424C4(a1, a2, a3, a4, a5, (int8x16_t *)(a7 - v7));
  sub_2276424C4(v10, v11, v12, v13, v14, (int8x16_t *)(v9 + v13));
  sub_2276424C4(v16, v17, v18, v19, v20, (int8x16_t *)(v15 + v19));
  sub_2276424C4(v22, v23, v24, v25, v26, (int8x16_t *)(v21 + v25));
  sub_2276424C4(v28, v29, v30, v31, v32, (int8x16_t *)(v27 + v31));
  sub_2276424C4(v34, v35, v36, v37, v38, (int8x16_t *)(v33 + v37));
  sub_2276424C4(v40, v41, v42, v43, v44, (int8x16_t *)(v39 + v43));
  sub_2276424C4(v46, v47, v48, v49, v50, (int8x16_t *)(v45 + v49));
  sub_2276424C4(v52, v53, v54, v55, v56, (int8x16_t *)(v51 + v55));
  sub_22764234C();
  *v57 = veorq_s8(v8, v8);
}

void sub_2276427A8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[6];
  v5 = 2 * a1[2];
  v6 = *a1;
  do
  {
    sub_2276426F0((uint64_t)a1, v1, v2, v5, v3, v4, v6);
    sub_2276426F0(v7, v8, v9, v10, v11, v12, v13);
    sub_2276426F0(v14, v15, v16, v17, v18, v19, v20);
    sub_2276426F0(v21, v22, v23, v24, v25, v26, v27);
    v28 >>= 1;
    v6 = v29 + v28 - 64;
    v5 = 2 * v28;
    v3 = v30 - 1;
  }
  while (v3);
}

uint16x8_t sub_227642830(uint8x16_t **a1)
{
  uint16x8_t *v1;
  uint8x16_t *v2;
  uint8x16_t *v3;
  uint8x16_t *v4;
  uint8x16_t *v5;
  uint8x16_t v6;
  uint8x16_t v7;
  uint8x16_t v8;
  uint8x16_t v9;
  uint8x16_t v10;
  uint8x16_t v11;
  uint16x8_t v12;
  uint16x8_t result;
  uint16x8_t *v14;

  v1 = (uint16x8_t *)a1[2];
  v2 = a1[3];
  v3 = a1[4];
  v4 = *a1;
  v5 = a1[1];
  do
  {
    v6 = v4[1];
    v7 = v4[2];
    v8 = v4[3];
    v9 = v5[1];
    v10 = v5[2];
    v11 = v5[3];
    v12 = vsubl_high_u8(*v4, *v5);
    result = vsubl_u8(*(uint8x8_t *)v6.i8, *(uint8x8_t *)v9.i8);
    *v1 = vsubl_u8(*(uint8x8_t *)v4->i8, *(uint8x8_t *)v5->i8);
    v14 = v1 + 1;
    *v14++ = v12;
    *v14++ = result;
    *v14++ = vsubl_high_u8(v6, v9);
    *v14++ = vsubl_u8(*(uint8x8_t *)v7.i8, *(uint8x8_t *)v10.i8);
    *v14++ = vsubl_high_u8(v7, v10);
    *v14++ = vsubl_u8(*(uint8x8_t *)v8.i8, *(uint8x8_t *)v11.i8);
    *v14 = vsubl_high_u8(v8, v11);
    v1 = v14 + 1;
    v4 = (uint8x16_t *)((char *)v2 + (_QWORD)v4);
    v5 += 6;
    v3 = (uint8x16_t *)((char *)v3 - 1);
  }
  while (v3);
  return result;
}

int8x16_t sub_227642918(_QWORD *a1)
{
  int8x16_t *v1;
  uint64_t v2;
  uint8x16_t *v3;
  unint64_t v4;
  int8x16_t result;
  int8x16_t v6;
  int8x16_t v7;
  int8x16_t *v8;

  v1 = (int8x16_t *)a1[1];
  v2 = a1[2];
  v3 = (uint8x16_t *)(*a1 - (16 * v2 + 16));
  v4 = (unint64_t)(a1[3] + 32) >> 1;
  do
  {
    result = vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vpaddlq_u8(*v3), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)v3 + v2))), 2uLL), vaddq_s16((int16x8_t)vpaddlq_u8(v3[1]), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v3[1] + v2))), 2uLL);
    v6 = vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vpaddlq_u8(v3[2]), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v3[2] + v2))), 2uLL), vaddq_s16((int16x8_t)vpaddlq_u8(v3[3]), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v3[3] + v2))), 2uLL);
    v7 = vrshrn_high_n_s16(vrshrn_n_s16(vaddq_s16((int16x8_t)vpaddlq_u8(v3[4]), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v3[4] + v2))), 2uLL), vaddq_s16((int16x8_t)vpaddlq_u8(v3[5]), (int16x8_t)vpaddlq_u8(*(uint8x16_t *)((char *)&v3[5] + v2))), 2uLL);
    *v1 = result;
    v8 = v1 + 1;
    *v8++ = v6;
    *v8 = v7;
    v1 = v8 + 1;
    v3 = (uint8x16_t *)((char *)v3 + v2 + v2);
    --v4;
  }
  while (v4);
  return result;
}

uint64_t sub_227642B00(uint64_t result)
{
  uint8x8_t *v1;
  __int8 *v2;
  int16x8_t *v3;
  unint64_t v4;
  uint64_t v5;
  __int8 *v6;
  unint64_t v7;
  int16x8_t *v8;
  int16x8_t v9;
  int16x8_t v10;
  uint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t *v14;
  int8x16_t v15;
  int8x16_t *v16;
  int8x16_t v17;
  int8x16_t *v18;
  int16x8_t v19;
  int16x8_t v20;
  uint64_t v21;
  int16x8_t *v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t *v27;
  int16x8_t *v28;
  int16x8_t *v29;
  uint64_t v30;
  int8x16_t v31;
  int8x16_t *v32;
  int8x16_t v33;
  uint8x8_t *v34;
  int8x16_t v35;
  int8x16_t v36;
  int16x8_t v37;
  int16x8_t v38;
  uint64_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t *v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t *v45;
  int16x8_t *v46;
  uint64_t v47;
  uint32x4_t *v48;
  uint32x4_t v49;
  uint32x4_t v50;
  uint32x4_t *v51;
  int8x16_t v52;
  int8x16_t v53;
  int8x16_t v54;
  int8x16_t v55;
  int16x8_t v56;
  int16x8_t v57;
  int16x8_t v58;
  int16x8_t v59;
  int16x8_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int32x4_t v68;
  int32x4_t v69;
  int32x4_t v70;
  int32x4_t v71;
  int32x4_t v72;
  int32x4_t v73;
  int32x4_t v74;
  int32x4_t v75;
  int32x4_t v76;
  int32x4_t v77;
  int32x4_t v78;
  int32x4_t v79;
  int32x4_t v80;
  int32x4_t v81;
  int32x4_t v82;
  int32x4_t v83;
  int32x4_t v84;
  int32x4_t v85;
  int32x4_t v86;
  int32x4_t v87;
  uint16x8_t v88;
  uint16x8_t v89;
  uint16x8_t v90;
  uint16x8_t v91;
  uint16x8_t v92;
  uint32x4_t v93;
  uint32x4_t v94;
  uint32x4_t v95;
  uint32x4_t v96;
  uint32x4_t *v97;
  uint32x4_t *v98;
  uint32x4_t v99;
  uint32x4_t v100;
  uint32x4_t v101;
  uint32x4_t v102;
  uint32x4_t *v103;
  uint32x4_t *v104;
  uint16x8_t v105;
  uint16x8_t v106;
  uint32x4_t v107;
  uint32x4_t v108;
  uint32x4_t v109;
  uint32x4_t v110;
  uint32x4_t *v111;
  uint32x4_t *v112;
  uint16x8_t v113;
  uint16x8_t v114;
  uint32x4_t v115;
  uint32x4_t v116;
  uint32x4_t v117;
  uint32x4_t v118;
  uint32x4_t *v119;
  uint32x4_t *v120;
  uint16x8_t v121;
  uint32x4_t v122;
  uint32x4_t v123;
  uint32x4_t v124;
  uint32x4_t v125;
  uint32x4_t *v126;
  uint32x4_t *v127;
  uint16x8_t v128;
  uint16x8_t v129;
  uint16x8_t v130;
  uint16x8_t v131;
  uint32x4_t v132;
  uint32x4_t v133;
  uint32x4_t v134;
  uint32x4_t v135;
  uint32x4_t *v136;
  uint32x4_t *v137;
  uint32x4_t v138;
  uint32x4_t v139;
  uint32x4_t v140;
  uint32x4_t v141;
  uint32x4_t *v142;
  uint32x4_t *v143;
  uint16x8_t v144;
  uint16x8_t v145;
  uint32x4_t *v146;

  v1 = *(uint8x8_t **)result;
  v2 = *(__int8 **)(result + 8);
  v3 = *(int16x8_t **)(result + 16);
  v4 = *(_QWORD *)(result + 24);
  v5 = *(_QWORD *)(result + 32) >> 3;
  do
  {
    v6 = v2;
    v7 = v4 >> 4;
    do
    {
      v8 = (int16x8_t *)((char *)v3 - *(_QWORD *)(result + 56));
      v9 = *v8;
      v10 = v8[1];
      v11 = *(_QWORD *)(result + 40);
      v12 = *(int8x16_t *)v1->i8;
      v13 = *(int8x16_t *)&v1->i8[v11];
      v14 = (int8x16_t *)((char *)v1 + v11 + v11);
      v15 = *v14;
      v16 = (int8x16_t *)((char *)v14 + v11);
      v17 = *v16;
      v18 = (int8x16_t *)((char *)v16 + v11);
      v19 = vaddq_s16((int16x8_t)vmovl_u8(*v1), v9);
      v20 = vaddq_s16((int16x8_t)vmovl_high_u8(*(uint8x16_t *)v1->i8), v10);
      v21 = *(_QWORD *)(result + 56) - 16;
      *v3 = v19;
      v3[1] = v20;
      v22 = (int16x8_t *)((char *)v3 + v21 + 16);
      v23 = vaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)v13.i8), v19);
      v24 = vaddq_s16((int16x8_t)vmovl_high_u8((uint8x16_t)v13), v20);
      v25 = vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v15.i8, *(uint8x8_t *)v17.i8), v23);
      v26 = vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v15, (uint8x16_t)v17), v24);
      *v22++ = v23;
      *v22 = v24;
      v27 = (int16x8_t *)((char *)v22 + v21);
      *v27++ = vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v13.i8, *(uint8x8_t *)v15.i8), v19);
      *v27 = vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v13, (uint8x16_t)v15), v20);
      v28 = (int16x8_t *)((char *)v27 + v21);
      *v28++ = v25;
      *v28 = v26;
      v29 = (int16x8_t *)((char *)v28 + v21);
      v30 = *(_QWORD *)(result + 40);
      v31 = *v18;
      v32 = (int8x16_t *)((char *)v18 + v30);
      v33 = *v32;
      v34 = (uint8x8_t *)&v32->i8[v30];
      v35 = *(int8x16_t *)v34->i8;
      v36 = *(int8x16_t *)&v34->i8[v30];
      v37 = vaddq_s16((int16x8_t)vmovl_u8(*(uint8x8_t *)v31.i8), v25);
      v38 = vaddq_s16((int16x8_t)vmovl_high_u8((uint8x16_t)v31), v26);
      v39 = *(_QWORD *)(result + 56) - 16;
      v40 = (int16x8_t)vaddl_u8(*(uint8x8_t *)v33.i8, *v34);
      v41 = (int16x8_t)vaddl_high_u8((uint8x16_t)v33, *(uint8x16_t *)v34->i8);
      *v29++ = v37;
      *v29 = v38;
      v42 = (int16x8_t *)((char *)v29 + v39);
      v43 = vaddq_s16((int16x8_t)vaddl_u8(*(uint8x8_t *)v31.i8, *(uint8x8_t *)v33.i8), v25);
      v44 = vaddq_s16((int16x8_t)vaddl_high_u8((uint8x16_t)v31, (uint8x16_t)v33), v26);
      *v42++ = v43;
      *v42 = v44;
      v45 = (int16x8_t *)((char *)v42 + v39);
      *v45++ = vaddq_s16(v40, v37);
      *v45 = vaddq_s16(v41, v38);
      v46 = (int16x8_t *)((char *)v45 + v39);
      *v46 = vaddq_s16(v43, (int16x8_t)vaddl_u8(*(uint8x8_t *)v35.i8, *(uint8x8_t *)v36.i8));
      v46[1] = vaddq_s16(v44, (int16x8_t)vaddl_high_u8((uint8x16_t)v35, (uint8x16_t)v36));
      v47 = *(_QWORD *)(result + 48);
      v48 = (uint32x4_t *)&v6[-v47];
      v47 -= 16;
      v49 = *v48++;
      v50 = *v48;
      v51 = (uint32x4_t *)((char *)v48 + v47);
      v52 = vshlq_n_s8(v12, 0);
      v53 = vshlq_n_s8(v15, 0);
      v54 = vshlq_n_s8(v31, 0);
      v55 = vshlq_n_s8(v35, 0);
      v56 = (int16x8_t)vzip1q_s8(v52, v13);
      v57 = (int16x8_t)vzip2q_s8(v52, v13);
      v58 = (int16x8_t)vzip1q_s8(v53, v17);
      v59 = (int16x8_t)vzip2q_s8(v53, v17);
      v60 = (int16x8_t)vzip1q_s8(v54, v33);
      v61 = (int16x8_t)vzip2q_s8(v54, v33);
      v62 = (int16x8_t)vzip1q_s8(v55, v36);
      v63 = (int16x8_t)vzip2q_s8(v55, v36);
      v64 = vshlq_n_s16(v56, 0);
      v65 = vshlq_n_s16(v57, 0);
      v66 = vshlq_n_s16(v60, 0);
      v67 = vshlq_n_s16(v61, 0);
      v68 = (int32x4_t)vzip1q_s16(v64, v58);
      v69 = (int32x4_t)vzip2q_s16(v64, v58);
      v70 = (int32x4_t)vzip1q_s16(v65, v59);
      v71 = (int32x4_t)vzip2q_s16(v65, v59);
      v72 = (int32x4_t)vzip1q_s16(v66, v62);
      v73 = (int32x4_t)vzip2q_s16(v66, v62);
      v74 = (int32x4_t)vzip1q_s16(v67, v63);
      v75 = (int32x4_t)vzip2q_s16(v67, v63);
      v76 = vshlq_n_s32(v68, 0);
      v77 = vshlq_n_s32(v69, 0);
      v78 = vshlq_n_s32(v70, 0);
      v79 = vshlq_n_s32(v71, 0);
      v80 = vzip1q_s32(v76, v72);
      v81 = vzip2q_s32(v76, v72);
      v82 = vzip1q_s32(v77, v73);
      v83 = vzip2q_s32(v77, v73);
      v84 = vzip1q_s32(v78, v74);
      v85 = vzip2q_s32(v78, v74);
      v86 = vzip1q_s32(v79, v75);
      v87 = vzip2q_s32(v79, v75);
      v88 = vmovl_u8(*(uint8x8_t *)v80.i8);
      v89 = vaddl_u8(*(uint8x8_t *)v80.i8, (uint8x8_t)v80.u64[1]);
      v90 = vaddl_u8(*(uint8x8_t *)v81.i8, (uint8x8_t)v80.u64[1]);
      v91 = vaddl_u8(*(uint8x8_t *)v81.i8, (uint8x8_t)v81.u64[1]);
      v92 = vaddl_u8(*(uint8x8_t *)v82.i8, (uint8x8_t)v81.u64[1]);
      v93 = vaddw_u16(v49, *(uint16x4_t *)v88.i8);
      v94 = vaddw_high_u16(v50, v88);
      v95 = vaddw_u16(v49, *(uint16x4_t *)v89.i8);
      v96 = vaddw_high_u16(v50, v89);
      *v51++ = v93;
      *v51 = v94;
      v97 = (uint32x4_t *)((char *)v51 + v47);
      *v97++ = v95;
      *v97 = v96;
      v98 = (uint32x4_t *)((char *)v97 + v47);
      v99 = vaddw_u16(v93, *(uint16x4_t *)v90.i8);
      v100 = vaddw_high_u16(v94, v90);
      v101 = vaddw_u16(v95, *(uint16x4_t *)v91.i8);
      v102 = vaddw_high_u16(v96, v91);
      *v98++ = v99;
      *v98 = v100;
      v103 = (uint32x4_t *)((char *)v98 + v47);
      *v103++ = v101;
      *v103 = v102;
      v104 = (uint32x4_t *)((char *)v103 + v47);
      v105 = vaddl_u8(*(uint8x8_t *)v83.i8, (uint8x8_t)v82.u64[1]);
      v106 = vaddl_u8(*(uint8x8_t *)v82.i8, (uint8x8_t)v82.u64[1]);
      v107 = vaddw_u16(v99, *(uint16x4_t *)v92.i8);
      v108 = vaddw_high_u16(v100, v92);
      v109 = vaddw_u16(v101, *(uint16x4_t *)v106.i8);
      v110 = vaddw_high_u16(v102, v106);
      *v104++ = v107;
      *v104 = v108;
      v111 = (uint32x4_t *)((char *)v104 + v47);
      *v111++ = v109;
      *v111 = v110;
      v112 = (uint32x4_t *)((char *)v111 + v47);
      v113 = vaddl_u8(*(uint8x8_t *)v84.i8, (uint8x8_t)v83.u64[1]);
      v114 = vaddl_u8(*(uint8x8_t *)v83.i8, (uint8x8_t)v83.u64[1]);
      v115 = vaddw_u16(v107, *(uint16x4_t *)v105.i8);
      v116 = vaddw_high_u16(v108, v105);
      v117 = vaddw_u16(v109, *(uint16x4_t *)v114.i8);
      v118 = vaddw_high_u16(v110, v114);
      *v112++ = v115;
      *v112 = v116;
      v119 = (uint32x4_t *)((char *)v112 + v47);
      *v119++ = v117;
      *v119 = v118;
      v120 = (uint32x4_t *)((char *)v119 + v47);
      v121 = vaddl_u8((uint8x8_t)v84.u64[1], *(uint8x8_t *)v84.i8);
      v122 = vaddw_u16(v115, *(uint16x4_t *)v113.i8);
      v123 = vaddw_high_u16(v116, v113);
      v124 = vaddw_u16(v117, *(uint16x4_t *)v121.i8);
      v125 = vaddw_high_u16(v118, v121);
      *v120++ = v122;
      *v120 = v123;
      v126 = (uint32x4_t *)((char *)v120 + v47);
      *v126++ = v124;
      *v126 = v125;
      v127 = (uint32x4_t *)((char *)v126 + v47);
      v128 = vaddl_u8((uint8x8_t)v84.u64[1], *(uint8x8_t *)v85.i8);
      v129 = vaddl_u8((uint8x8_t)v85.u64[1], *(uint8x8_t *)v86.i8);
      v130 = vaddl_u8(*(uint8x8_t *)v85.i8, (uint8x8_t)v85.u64[1]);
      v131 = vaddl_u8((uint8x8_t)v86.u64[1], *(uint8x8_t *)v86.i8);
      v132 = vaddw_u16(v122, *(uint16x4_t *)v128.i8);
      v133 = vaddw_high_u16(v123, v128);
      v134 = vaddw_u16(v124, *(uint16x4_t *)v130.i8);
      v135 = vaddw_high_u16(v125, v130);
      *v127++ = v132;
      *v127 = v133;
      v136 = (uint32x4_t *)((char *)v127 + v47);
      *v136++ = v134;
      *v136 = v135;
      v137 = (uint32x4_t *)((char *)v136 + v47);
      v138 = vaddw_u16(v132, *(uint16x4_t *)v129.i8);
      v139 = vaddw_high_u16(v133, v129);
      v140 = vaddw_u16(v134, *(uint16x4_t *)v131.i8);
      v141 = vaddw_high_u16(v135, v131);
      *v137++ = v138;
      *v137 = v139;
      v142 = (uint32x4_t *)((char *)v137 + v47);
      *v142++ = v140;
      *v142 = v141;
      v143 = (uint32x4_t *)((char *)v142 + v47);
      v144 = vaddl_u8((uint8x8_t)v86.u64[1], *(uint8x8_t *)v87.i8);
      v145 = vaddl_u8((uint8x8_t)v87.u64[1], *(uint8x8_t *)v87.i8);
      *v143++ = vaddw_u16(v138, *(uint16x4_t *)v144.i8);
      *v143 = vaddw_high_u16(v139, v144);
      v146 = (uint32x4_t *)((char *)v143 + v47);
      *v146++ = vaddw_u16(v140, *(uint16x4_t *)v145.i8);
      *v146 = vaddw_high_u16(v141, v145);
      v6 = &v146->i8[v47];
      v3 += 2;
      v1 += 2;
      --v7;
    }
    while (v7);
    v2 += 32;
    v1 = (uint8x8_t *)((char *)&v1[*(_QWORD *)(result + 40)] - v4);
    v3 = (int16x8_t *)((char *)v3 + 8 * *(_QWORD *)(result + 56) + -2 * v4);
    --v5;
  }
  while (v5);
  return result;
}

char *createMultiBandNoiseReductionContext(uint64_t a1)
{
  char *v2;
  char *v3;
  CVPixelBufferRef *v4;
  CFTypeRef v5;
  void *v6;
  id *v7;
  uint64_t v8;
  int v9;
  size_t v10;
  const __CFAllocator *v11;
  const CFDictionaryKeyCallBacks *v12;
  const CFDictionaryValueCallBacks *v13;
  const __CFDictionary *Mutable;
  CFNumberRef v15;
  CFMutableDictionaryRef v16;
  unsigned int v17;
  id v18;
  int v19;
  __CFString *v20;
  void *v21;
  size_t Width;
  const char *v23;
  uint64_t v24;
  size_t Height;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  int valuePtr;
  CFDictionaryRef pixelBufferAttributes;

  v2 = (char *)malloc_type_calloc(1uLL, 0xB0uLL, 0x10E004035FB00AEuLL);
  v3 = v2;
  if (!v2)
    return v3;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_QWORD *)v2 + 2) = *(_QWORD *)a1;
  *((_QWORD *)v2 + 1) = 0;
  v4 = (CVPixelBufferRef *)(v2 + 8);
  *(_QWORD *)v2 = 0;
  v5 = *(CFTypeRef *)(a1 + 40);
  if (v5)
    v5 = CFRetain(v5);
  v7 = (id *)(v3 + 112);
  v6 = (void *)*((_QWORD *)v3 + 14);
  *((_QWORD *)v3 + 21) = v5;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_DWORD *)(a1 + 32);
  *((_DWORD *)v3 + 30) = v9;
  *((_QWORD *)v3 + 12) = v8;
  *((_QWORD *)v3 + 13) = 0;
  if (v6)
  {
    *((_QWORD *)v3 + 14) = 0;

    v9 = *((_DWORD *)v3 + 30);
  }
  if ((v9 - 7) < 2)
  {
    objc_storeStrong((id *)v3 + 14, *(id *)(a1 + 24));
  }
  else if ((v9 - 5) <= 1)
  {
    *((_QWORD *)v3 + 13) = *(_QWORD *)(a1 + 16);
  }
  v10 = (CVPixelBufferGetHeight(*(CVPixelBufferRef *)a1) + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = (const CFDictionaryKeyCallBacks *)MEMORY[0x24BDBD6A0];
  v13 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  pixelBufferAttributes = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC5788], (const void *)*MEMORY[0x24BDBD270]);
  valuePtr = 64;
  v15 = CFNumberCreate(v11, kCFNumberSInt32Type, &valuePtr);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDC55D0], v15);
  CFRelease(v15);
  v16 = CFDictionaryCreateMutable(v11, 0, v12, v13);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDC5668], v16);
  CFRelease(v16);
  applyWiringAssertionToProperties(&pixelBufferAttributes);
  CVPixelBufferCreate(v11, 0x200uLL, v10, 0x34323066u, pixelBufferAttributes, (CVPixelBufferRef *)v3);
  v17 = *((_DWORD *)v3 + 30);
  if (v17 <= 8 && ((1 << v17) & 0x190) != 0)
  {
    CVPixelBufferCreate(v11, 0x200uLL, v10, 0x34323066u, pixelBufferAttributes, (CVPixelBufferRef *)v3 + 1);
    v17 = *((_DWORD *)v3 + 30);
  }
  if (v17 - 7 > 1 || !*v7)
    goto LABEL_25;
  v18 = *v7;
  v19 = *((_DWORD *)v3 + 30);
  if (v19 == 8)
  {
    v20 = CFSTR("NRFPrepareDescriptor");
LABEL_19:
    NSClassFromString(&v20->isa);
    v21 = (void *)objc_opt_new();
    if (!v21)
      goto LABEL_24;
    goto LABEL_22;
  }
  if (v19 == 7)
  {
    v20 = CFSTR("UBPrepareDescriptor");
    goto LABEL_19;
  }
  v21 = 0;
LABEL_22:
  Width = CVPixelBufferGetWidth(*v4);
  objc_msgSend_setWidth_(v21, v23, Width, v24);
  Height = CVPixelBufferGetHeight(*v4);
  objc_msgSend_setHeight_(v21, v26, Height, v27);
  objc_msgSend_setPixelFormat_(v21, v28, 875704422, v29);
  objc_msgSend_setAllowModifyingInputBuffers_(v21, v30, 0, v31);
  if (!objc_msgSend_prepareToProcess_prepareDescriptor_(v18, v32, 0, (uint64_t)v21))
  {
LABEL_24:

LABEL_25:
    CFRelease(pixelBufferAttributes);
    *((_QWORD *)v3 + 20) = CFArrayCreateMutable(v11, 0, MEMORY[0x24BDBD690]);
    return v3;
  }
  destroyMultiBandNoiseReductionContext((__CVBuffer **)v3);
  CFRelease(pixelBufferAttributes);

  return 0;
}

void destroyMultiBandNoiseReductionContext(__CVBuffer **a1)
{
  __CVBuffer *v2;
  __CVBuffer *v3;
  __CVBuffer *v4;
  __CVBuffer *v5;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      CVPixelBufferRelease(v2);
    v3 = a1[1];
    if (v3)
      CVPixelBufferRelease(v3);
    v4 = a1[20];
    if (v4)
      CFRelease(v4);
    v5 = a1[21];
    if (v5)
      CFRelease(v5);
    free(a1);
  }
}

void updateMultiBandNoiseReductionCropRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10;
  uint64_t v11;
  const __CFAllocator *v12;
  __CFDictionary *Mutable;
  CFNumberRef v14;
  CFNumberRef v15;
  int valuePtr;

  if (a1)
  {
    v10 = *(_QWORD *)(a1 + 72) + *(_QWORD *)(a1 + 56);
    v11 = a4 + a2 - v10;
    if (a4 + a2 > v10)
    {
      v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      sub_2276443DC(Mutable, CFSTR("RangeStart"), v10);
      sub_2276443DC(Mutable, CFSTR("RangeWidth"), v11);
      sub_227644448(Mutable, CFSTR("agcGain"), *(_DWORD *)(a1 + 132));
      sub_227644448(Mutable, CFSTR("sensorDGain"), *(_DWORD *)(a1 + 136));
      sub_227644448(Mutable, CFSTR("ispDGain"), *(_DWORD *)(a1 + 140));
      sub_227644448(Mutable, CFSTR("awbRGain"), *(_DWORD *)(a1 + 144));
      sub_227644448(Mutable, CFSTR("awbGGain"), *(_DWORD *)(a1 + 148));
      sub_227644448(Mutable, CFSTR("awbBGain"), *(_DWORD *)(a1 + 152));
      valuePtr = *(_DWORD *)(a1 + 128);
      v14 = CFNumberCreate(v12, kCFNumberFloat32Type, &valuePtr);
      if (v14)
      {
        v15 = v14;
        CFDictionaryAddValue(Mutable, CFSTR("exposureTime"), v14);
        CFRelease(v15);
      }
      CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 160), Mutable);
      CFRelease(Mutable);
    }
    *(_QWORD *)(a1 + 56) = a2;
    *(_QWORD *)(a1 + 64) = a3;
    *(_QWORD *)(a1 + 72) = a4;
    *(_QWORD *)(a1 + 80) = a5;
    *(_BYTE *)(a1 + 88) = 1;
  }
}

const __CFDictionary *updateMultiBandNoiseReductionMetadata(const __CFDictionary *result, CFDictionaryRef theDict)
{
  const __CFDictionary *v3;
  const __CFNumber *Value;
  const __CFNumber *v5;
  const __CFNumber *v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  const void *v11;
  const void *v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unsigned int v17;
  int v19;
  int v20;
  char buffer[2];
  _BYTE v22[22];

  *(_QWORD *)&v22[14] = *MEMORY[0x24BDAC8D0];
  if (result && theDict)
  {
    v3 = result;
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10BC8]);
    if (Value)
      CFNumberGetValue(Value, kCFNumberFloat32Type, (char *)v3 + 128);
    v5 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10A80]);
    if (v5)
      CFNumberGetValue(v5, kCFNumberIntType, (char *)v3 + 132);
    v6 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10E80]);
    if (v6)
      CFNumberGetValue(v6, kCFNumberIntType, (char *)v3 + 136);
    v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10E70]);
    if (v7)
      CFNumberGetValue(v7, kCFNumberIntType, (char *)v3 + 140);
    v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10AD0]);
    if (v8)
      CFNumberGetValue(v8, kCFNumberIntType, (char *)v3 + 144);
    v9 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10AA8]);
    if (v9)
      CFNumberGetValue(v9, kCFNumberIntType, (char *)v3 + 148);
    v10 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE10A88]);
    if (v10)
      CFNumberGetValue(v10, kCFNumberIntType, (char *)v3 + 152);
    v11 = CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x24BE11488]);
    result = (const __CFDictionary *)*((_QWORD *)v3 + 21);
    if (result)
    {
      v12 = v11 ? v11 : (const void *)*MEMORY[0x24BE10588];
      result = (const __CFDictionary *)CFDictionaryGetValue(result, v12);
      if (result)
      {
        CFStringGetCString((CFStringRef)result, buffer, 16, 0);
        if (buffer[0] == 48 && buffer[1] == 120)
        {
          v13 = 0;
          v14 = v22;
          v15 = &buffer[strlen(buffer)];
          v16 = MEMORY[0x24BDAC740];
          while (1)
          {
            v17 = *v14;
            result = (v17 & 0x80000000) != 0
                   ? (const __CFDictionary *)__maskrune(v17, 0x10000uLL)
                   : (const __CFDictionary *)(*(_DWORD *)(v16 + 4 * v17 + 60) & 0x10000);
            if (!(_DWORD)result && v14 < v15)
              break;
            v19 = *v14;
            if ((v19 - 97) >= 6)
            {
              if ((v19 - 65) >= 6)
              {
                if ((v19 - 48) > 9)
                  break;
                v20 = -48;
              }
              else
              {
                v20 = -55;
              }
            }
            else
            {
              v20 = -87;
            }
            v13 = v19 + 16 * v13 + v20;
            ++v14;
          }
        }
        else
        {
          result = (const __CFDictionary *)atoi(buffer);
          v13 = (int)result;
        }
        *((_DWORD *)v3 + 31) = v13;
      }
    }
  }
  return result;
}

void DoMultiBandNoiseReductionComplete(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v10;
  char *v11;
  size_t BytesPerRowOfPlane;
  size_t v13;
  size_t HeightOfPlane;
  char *v15;
  char *v16;
  size_t v17;
  size_t v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  size_t v24;
  uint64_t v25;
  int v26;
  CFIndex v27;
  int v28;
  float v29;
  int v30;
  const __CFDictionary *ValueAtIndex;
  int v32;
  int v33;
  int v34;
  int v35;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  const __CFNumber *Value;
  float v43;
  const __CFNumber *v44;
  CFTypeID v45;
  int v46;
  int v47;
  __CFDictionary *Mutable;
  CFNumberRef v49;
  CFNumberRef v50;
  CFNumberRef v51;
  CFNumberRef v52;
  CFNumberRef v53;
  CFNumberRef v54;
  CFNumberRef v55;
  CFNumberRef v56;
  int v57;
  uint64_t v58;
  CMSampleBufferRef v59;
  void (*v60)(uint64_t, CFTypeRef (*)(uint64_t, int, CMSampleBufferRef), uint64_t);
  int v61;
  CFNumberRef v62;
  uint64_t FigBaseObject;
  uint64_t (*v64)(uint64_t, uint64_t, CFNumberRef);
  int v65;
  uint64_t v66;
  unsigned int (*v67)(uint64_t, CMSampleBufferRef);
  uint64_t v68;
  unsigned int (*v69)(uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  CMSampleBufferRef v73;
  const char *v74;
  uint64_t v75;
  id v76;
  __CFString *v77;
  CFNumberRef v78;
  CFMutableDictionaryRef v79;
  CFNumberRef v80;
  char *v81;
  char *v82;
  size_t v83;
  size_t v84;
  size_t v85;
  char *v86;
  char *v87;
  size_t v88;
  size_t v89;
  size_t v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  unint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *key;
  int v121;
  uint64_t v123;
  const __CFAllocator *allocator;
  uint64_t v125;
  uint64_t v126;
  int v127;
  unsigned int v128;
  unsigned int v129;
  int v130;
  int32x2_t v131;
  int v132;
  uint64_t v133;
  int v134;
  char *BaseAddressOfPlane;
  int v136;
  unint64_t v137;
  int v138;
  int v139;
  CMSampleBufferRef v140;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  int v144;
  __int128 v145;
  _DWORD v146[3];
  float valuePtr[3];

  v2 = a1;
  v3 = *(int *)(a1 + 120);
  if (v3 > 8)
    v4 = "Unknown";
  else
    v4 = off_24EFC2D70[v3];
  ACTLogMessageImp(1, "DoMultiBandNoiseReductionComplete (%s)\n", v4);
  v5 = *(_DWORD *)(v2 + 72);
  v6 = *(_QWORD *)(v2 + 40);
  if (v5 != (_DWORD)v6)
  {
    allocator = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (a2)
      v7 = 0;
    else
      v7 = -32;
    v121 = v7;
    key = (void *)*MEMORY[0x24BE10DB0];
    v119 = (void *)*MEMORY[0x24BE10BC8];
    v118 = (void *)*MEMORY[0x24BE10A80];
    v117 = (void *)*MEMORY[0x24BE10E80];
    v116 = (void *)*MEMORY[0x24BE10E70];
    v115 = (void *)*MEMORY[0x24BE10AD0];
    v114 = (void *)*MEMORY[0x24BE10AA8];
    v113 = (void *)*MEMORY[0x24BE10A88];
    v111 = *MEMORY[0x24BE11888];
    v110 = *MEMORY[0x24BE11880];
    v109 = *MEMORY[0x24BDBD270];
    v112 = (const __CFString *)*MEMORY[0x24BE118A0];
    v125 = v2;
    do
    {
      if (v6)
        v8 = -32;
      else
        v8 = 0;
      if (v6)
        v5 = v5 - v6 + 32;
      if (!a2)
        v5 -= 288;
      if (v5 <= 511 && a2 == 0)
        break;
      v123 = 32 * (v6 != 0);
      v126 = *(int *)(v2 + 24) + (uint64_t)(int)v6;
      if (v5 >= 512)
        v10 = 512;
      else
        v10 = v5;
      v138 = v10;
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v2 + 16), 0);
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)v2, 0);
      BaseAddressOfPlane = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v2 + 16), 0);
      v11 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v2 + 16), 1uLL);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v2 + 16), 0);
      v13 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v2 + 16), 1uLL);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(v2 + 16), 0);
      v15 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v2, 0);
      v16 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)v2, 1uLL);
      v17 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v2, 0);
      v18 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)v2, 1uLL);
      if (HeightOfPlane)
      {
        v19 = v18;
        v20 = HeightOfPlane;
        v134 = v8;
        v21 = (int)v126 - (unint64_t)v123;
        v22 = &v11[(int)v21 & 0xFFFFFFFFFFFFFFFELL];
        v23 = &BaseAddressOfPlane[v21];
        do
        {
          memcpy(v15, v23, v138);
          v23 += BytesPerRowOfPlane;
          v15 += v17;
          --v20;
        }
        while (v20);
        v8 = v134;
        if (HeightOfPlane >= 2)
        {
          v24 = HeightOfPlane >> 1;
          do
          {
            memcpy(v16, v22, v138);
            v22 += v13;
            v16 += v19;
            --v24;
          }
          while (v24);
        }
      }
      v25 = v125;
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v125 + 16), 0);
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)v125, 0);
      formatDescriptionOut = 0;
      memset(&sampleTiming, 0, sizeof(sampleTiming));
      v140 = 0;
      sampleBufferOut = 0;
      CMVideoFormatDescriptionCreateForImageBuffer(allocator, *(CVImageBufferRef *)v125, &formatDescriptionOut);
      CMSampleBufferCreateForImageBuffer(allocator, *(CVImageBufferRef *)v125, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
      v139 = v8 + v121 + v138;
      v145 = 0uLL;
      memset(v146, 0, sizeof(v146));
      v26 = v126;
      if (CFArrayGetCount(*(CFArrayRef *)(v125 + 160)) >= 1)
      {
        v133 = 0;
        v132 = 0;
        v130 = 0;
        v27 = 0;
        v136 = 0;
        v28 = 0;
        v131 = 0;
        v29 = 0.0;
        v30 = v126 + v139;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(v25 + 160), v27);
          v32 = sub_2276444B4(ValueAtIndex, CFSTR("RangeStart"), 0);
          v33 = sub_2276444B4(ValueAtIndex, CFSTR("RangeWidth"), 0);
          v34 = v33 + v32;
          v35 = v30 - v32;
          if (v30 <= v32 || v34 <= v26)
          {
            if (v30 <= v32)
              goto LABEL_60;
          }
          else
          {
            v37 = v34 - v26;
            if (v34 > v30)
              v37 = v139;
            else
              v35 = v33;
            if (v32 >= v26)
              v38 = v35;
            else
              v38 = v37;
            if (v38 > 0)
            {
              v129 = sub_2276444B4(ValueAtIndex, CFSTR("agcGain"), 256);
              v128 = sub_2276444B4(ValueAtIndex, CFSTR("sensorDGain"), 256);
              v39 = sub_2276444B4(ValueAtIndex, CFSTR("ispDGain"), 256);
              v127 = sub_2276444B4(ValueAtIndex, CFSTR("awbRGain"), 256);
              v40 = sub_2276444B4(ValueAtIndex, CFSTR("awbGGain"), 256);
              v41 = sub_2276444B4(ValueAtIndex, CFSTR("awbBGain"), 256);
              Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("exposureTime"));
              v43 = 1.0;
              if (Value)
              {
                v44 = Value;
                v45 = CFGetTypeID(Value);
                if (v45 == CFNumberGetTypeID())
                {
                  valuePtr[0] = 0.0;
                  CFNumberGetValue(v44, kCFNumberFloat32Type, valuePtr);
                  v43 = valuePtr[0];
                }
              }
              v46 = v130;
              if (v39 > v130)
                v46 = v39;
              v131 = (int32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v136 == 0), 0x1FuLL)), (int8x8_t)__PAIR64__(v128, v129), (int8x8_t)vmax_s32((int32x2_t)__PAIR64__(v128, v129), v131));
              *(int32x2_t *)((char *)&v145 + 4) = v131;
              if (v136)
                v47 = v46;
              else
                v47 = v39;
              v130 = v47;
              HIDWORD(v145) = v47;
              v146[0] = v132 + v127 * v38;
              v132 = v146[0];
              LODWORD(v133) = v133 + v40 * v38;
              HIDWORD(v133) += v41 * v38;
              *(_QWORD *)&v146[1] = v133;
              v29 = v29 + (float)(v43 * (float)v38);
              *(float *)&v145 = v29;
              v136 += v38;
              if (v34 <= v30)
              {
                v25 = v125;
                CFArrayRemoveValueAtIndex(*(CFMutableArrayRef *)(v125 + 160), v27);
              }
              else
              {
                ++v28;
                v25 = v125;
              }
              v26 = v126;
              goto LABEL_59;
            }
          }
          ++v28;
LABEL_59:
          v27 = v28;
          if (CFArrayGetCount(*(CFArrayRef *)(v25 + 160)) <= v28)
          {
LABEL_60:
            if (v136)
            {
              v146[0] = (v132 + (v136 >> 1)) / v136;
              v146[1] = ((int)v133 + (v136 >> 1)) / v136;
              v146[2] = (HIDWORD(v133) + (v136 >> 1)) / v136;
              *(float *)&v145 = v29 / (float)v136;
            }
            break;
          }
        }
      }
      v144 = *(_DWORD *)(v25 + 124);
      Mutable = CFDictionaryCreateMutable(allocator, 7, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      v49 = CFNumberCreate(allocator, kCFNumberIntType, &v144);
      CFDictionaryAddValue(Mutable, key, v49);
      CFRelease(v49);
      v50 = CFNumberCreate(allocator, kCFNumberFloatType, &v145);
      CFDictionaryAddValue(Mutable, v119, v50);
      CFRelease(v50);
      v51 = CFNumberCreate(allocator, kCFNumberIntType, (char *)&v145 + 4);
      CFDictionaryAddValue(Mutable, v118, v51);
      CFRelease(v51);
      v52 = CFNumberCreate(allocator, kCFNumberIntType, (char *)&v145 + 8);
      CFDictionaryAddValue(Mutable, v117, v52);
      CFRelease(v52);
      v53 = CFNumberCreate(allocator, kCFNumberIntType, (char *)&v145 + 12);
      CFDictionaryAddValue(Mutable, v116, v53);
      CFRelease(v53);
      v54 = CFNumberCreate(allocator, kCFNumberIntType, v146);
      CFDictionaryAddValue(Mutable, v115, v54);
      CFRelease(v54);
      v55 = CFNumberCreate(allocator, kCFNumberIntType, &v146[1]);
      CFDictionaryAddValue(Mutable, v114, v55);
      CFRelease(v55);
      v56 = CFNumberCreate(allocator, kCFNumberIntType, &v146[2]);
      CFDictionaryAddValue(Mutable, v113, v56);
      CFRelease(v56);
      CMSetAttachment(sampleBufferOut, CFSTR("MetadataDictionary"), Mutable, 0);
      v57 = *(_DWORD *)(v25 + 120);
      if ((v57 - 5) >= 2)
      {
        if ((v57 - 7) <= 1)
        {
          v72 = *(void **)(v25 + 112);
          if (v72)
          {
            v73 = sampleBufferOut;
            v76 = v72;
            if (v57 == 7)
            {
              v77 = CFSTR("UBFusionOutput");
LABEL_105:
              NSClassFromString(&v77->isa);
              v97 = (void *)objc_opt_new();
              v98 = v97;
              if (v97)
              {
                objc_msgSend_setPixelBuffer_(v97, v74, *(_QWORD *)(v25 + 8), v75);
                v99 = (void *)objc_opt_new();
                objc_msgSend_setMetadata_(v98, v100, (uint64_t)v99, v101);

                objc_msgSend_setOutput_(v76, v102, (uint64_t)v98, v103);
                if (!objc_msgSend_addFrame_(v76, v104, (uint64_t)v73, v105)
                  && !objc_msgSend_process(v76, v74, v106, v75)
                  && !objc_msgSend_finishProcessing(v76, v74, v107, v75))
                {
                  objc_msgSend_resetState(v76, v74, v108, v75);
                }
              }
            }
            else
            {
              if (v57 == 8)
              {
                v77 = CFSTR("NRFUBFusionOutput");
                goto LABEL_105;
              }
              v98 = 0;
            }
            objc_msgSend_setOutput_(v76, v74, 0, v75);

            goto LABEL_84;
          }
        }
      }
      else
      {
        v58 = *(_QWORD *)(v25 + 104);
        if (v58)
        {
          v59 = sampleBufferOut;
          v60 = *(void (**)(uint64_t, CFTypeRef (*)(uint64_t, int, CMSampleBufferRef), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
          if (v60)
            v60(v58, sub_22764451C, v25);
          if (*(_DWORD *)(v25 + 120) == 6)
            v61 = 10;
          else
            v61 = 0;
          v144 = v61;
          v62 = CFNumberCreate(allocator, kCFNumberSInt32Type, &v144);
          FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
          v64 = *(uint64_t (**)(uint64_t, uint64_t, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
          if (v64)
          {
            v65 = v64(FigBaseObject, v111, v62);
            CFRelease(v62);
            if (!v65)
            {
              v66 = *(_QWORD *)(v25 + 104);
              v67 = *(unsigned int (**)(uint64_t, CMSampleBufferRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 16);
              if (v67)
              {
                if (!v67(v66, v59))
                {
                  v68 = FigSampleBufferProcessorGetFigBaseObject();
                  v69 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 8)
                                                                                 + 56);
                  if (v69)
                  {
                    if (!v69(v68, v110, v109))
                    {
                      v70 = *(_QWORD *)(v25 + 104);
                      v71 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
                      if (v71)
                        v71(v70);
                    }
                  }
                }
              }
            }
            goto LABEL_84;
          }
          v80 = v62;
          goto LABEL_83;
        }
      }
      CMSampleBufferCreateForImageBuffer(allocator, *(CVImageBufferRef *)(v25 + 8), 1u, 0, 0, formatDescriptionOut, &sampleTiming, &v140);
      v144 = 3;
      v78 = CFNumberCreate(allocator, kCFNumberIntType, &v144);
      CMSetAttachment(sampleBufferOut, v112, v78, 0);
      CFRelease(v78);
      CMSetAttachment(v140, CFSTR("MetadataDictionary"), Mutable, 0);
      v79 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      noiseReductionInOutWithTuningOptions();
      v80 = v79;
LABEL_83:
      CFRelease(v80);
LABEL_84:
      if (formatDescriptionOut)
        CFRelease(formatDescriptionOut);
      if (sampleBufferOut)
        FigSampleBufferRelease();
      if (v140)
        FigSampleBufferRelease();
      if (Mutable)
        CFRelease(Mutable);
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v25 + 16), 0);
      CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(v25 + 8), 0);
      v81 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v25 + 16), 0);
      v82 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v25 + 16), 1uLL);
      v83 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v25 + 16), 0);
      v84 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v25 + 16), 1uLL);
      v85 = CVPixelBufferGetHeightOfPlane(*(CVPixelBufferRef *)(v25 + 16), 0);
      v86 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v25 + 8), 0);
      v87 = (char *)CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(v25 + 8), 1uLL);
      v88 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v25 + 8), 0);
      v89 = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(v25 + 8), 1uLL);
      v137 = v85;
      if (v85)
      {
        v90 = v89;
        v91 = v81;
        v92 = &v82[(int)v126 & 0xFFFFFFFFFFFFFFFELL];
        v93 = &v87[v123];
        v94 = &v86[v123];
        v95 = &v91[v126];
        do
        {
          memcpy(v95, v94, v139);
          v95 += v83;
          v94 += v88;
          --v85;
        }
        while (v85);
        if (v137 >= 2)
        {
          v96 = v137 >> 1;
          do
          {
            memcpy(v92, v93, v139);
            v92 += v84;
            v93 += v90;
            --v96;
          }
          while (v96);
        }
      }
      v2 = v125;
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v125 + 16), 0);
      CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v125 + 8), 0);
      if (*(_QWORD *)(v125 + 104) && (*(_DWORD *)(v125 + 120) - 5) <= 1)
      {
        CFRelease(*(CFTypeRef *)(v125 + 8));
        *(_QWORD *)(v125 + 8) = 0;
      }
      v6 = *(_QWORD *)(v125 + 40) + v139;
      *(_QWORD *)(v125 + 32) = 0;
      *(_QWORD *)(v125 + 40) = v6;
      *(_QWORD *)(v125 + 48) = (int)v137;
      v5 = *(_DWORD *)(v125 + 72);
    }
    while (v5 != (_DWORD)v6);
  }
  *(_BYTE *)(v2 + 88) = 0;
}

void sub_2276443DC(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void sub_227644448(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t sub_2276444B4(const __CFDictionary *a1, const void *a2, uint64_t a3)
{
  const __CFNumber *Value;
  const __CFNumber *v5;
  CFTypeID v6;
  unsigned int valuePtr;

  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v5 = Value;
    v6 = CFGetTypeID(Value);
    if (v6 == CFNumberGetTypeID())
    {
      valuePtr = 0;
      CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
  }
  return a3;
}

CFTypeRef sub_22764451C(uint64_t a1, int a2, CMSampleBufferRef sbuf)
{
  CVImageBufferRef ImageBuffer;

  if (a2)
  {
    *(_QWORD *)(a1 + 8) = 0;
    return (CFTypeRef)ACTLogMessageImp(4, "GNR failed to process image (err=%d)", a2);
  }
  else
  {
    ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
    *(_QWORD *)(a1 + 8) = ImageBuffer;
    return CFRetain(ImageBuffer);
  }
}

uint64_t sub_227644580(uint8x16_t *a1, int a2, int a3, unsigned int a4, _DWORD *a5, uint32x4_t *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint16x8_t *v9;
  uint8x16_t *v10;
  _DWORD *v11;
  unsigned int v12;
  int v13;
  int v14;
  int v15;
  uint16x8_t v16;
  uint16x8_t v17;
  uint8x16_t v18;
  uint8x16_t v19;
  uint8x16_t v20;
  uint8x16_t v21;
  uint16x8_t *v22;
  uint8x16_t v23;
  uint8x16_t v24;
  uint8x16_t v25;
  uint8x16_t v26;
  uint16x8_t *v27;
  uint16x8_t v28;
  uint16x8_t v29;
  uint16x8_t v30;
  uint16x8_t v31;
  int v32;
  int64x2_t v33;
  int64x2_t v34;
  int v35;
  uint16x8_t v36;
  uint16x8_t v37;
  uint32x4_t *v38;
  uint16x8_t v39;
  uint16x8_t v40;
  uint32x4_t *v41;
  uint32x4_t v42;
  uint32x4_t v43;
  uint32x4_t v44;
  uint32x4_t v45;

  if ((a2 & 0x1F) != 0 || (a3 & 1) != 0 || (a1 & 0xF) != 0 || (a4 & 0xF) != 0)
    return -1;
  v9 = (uint16x8_t *)&a9;
  v10 = (uint8x16_t *)((char *)a1 + a4 * (unint64_t)(a3 >> 1));
  v11 = (_DWORD *)((char *)a5 + 2 * a3);
  v12 = a4 - a2;
  v13 = 1;
  v14 = a2 >> 5;
  v15 = 128;
  v16 = 0uLL;
  v17 = 0uLL;
  do
  {
    v18 = *a1;
    v19 = a1[1];
    v20 = *v10;
    v21 = v10[1];
    a1 += 2;
    v10 += 2;
    v16 = vaddw_high_u8(vaddw_u8(vaddw_high_u8(vaddw_u8(v16, *(uint8x8_t *)v18.i8), v18), *(uint8x8_t *)v19.i8), v19);
    v17 = vaddw_high_u8(vaddw_u8(vaddw_high_u8(vaddw_u8(v17, *(uint8x8_t *)v20.i8), v20), *(uint8x8_t *)v21.i8), v21);
    *v9 = vaddw_u8(vmovl_u8(*(uint8x8_t *)v18.i8), *(uint8x8_t *)v20.i8);
    v9[1] = vaddw_high_u8(vmovl_high_u8(v18), v20);
    v22 = v9 + 2;
    *v22 = vaddw_u8(vmovl_u8(*(uint8x8_t *)v19.i8), *(uint8x8_t *)v21.i8);
    v22[1] = vaddw_high_u8(vmovl_high_u8(v19), v21);
    v9 = v22 + 2;
    --v14;
  }
  while (v14);
  while (1)
  {
    a1 = (uint8x16_t *)((char *)a1 + v12);
    v10 = (uint8x16_t *)((char *)v10 + v12);
    v33 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(v16));
    v34 = (int64x2_t)vpaddlq_u32(vpaddlq_u16(v17));
    *a5++ = vpaddq_s64(v33, v33).u32[0];
    *v11++ = vpaddq_s64(v34, v34).u32[0];
    v16 = 0uLL;
    v17 = 0uLL;
    v9 = (uint16x8_t *)((char *)v9 - 2 * a2);
    v32 = a2 >> 5;
    a3 -= 2;
    if (!a3 || (--v15, !v15))
    {
      v35 = a2 >> 4;
      if (--v13)
      {
        do
        {
          v39 = *v9;
          v40 = v9[1];
          *v9 = 0uLL;
          v9[1] = 0uLL;
          v9 += 2;
          v42 = *a6;
          v43 = a6[1];
          v41 = a6 + 2;
          v44 = *v41;
          v45 = v41[1];
          v41 -= 2;
          *v41 = vaddw_u16(v42, *(uint16x4_t *)v39.i8);
          v41[1] = vaddw_high_u16(v43, v39);
          v41 += 2;
          *v41 = vaddw_u16(v44, *(uint16x4_t *)v40.i8);
          v41[1] = vaddw_high_u16(v45, v40);
          a6 = v41 + 2;
          --v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v36 = *v9;
          v37 = v9[1];
          *v9 = 0uLL;
          v9[1] = 0uLL;
          v9 += 2;
          *a6 = vmovl_u16(*(uint16x4_t *)v36.i8);
          a6[1] = vmovl_high_u16(v36);
          v38 = a6 + 2;
          *v38 = vmovl_u16(*(uint16x4_t *)v37.i8);
          v38[1] = vmovl_high_u16(v37);
          a6 = v38 + 2;
          --v35;
        }
        while (v35);
      }
      v9 = (uint16x8_t *)((char *)v9 - 2 * a2);
      a6 = (uint32x4_t *)((char *)a6 - 4 * a2);
      v32 = a2 >> 5;
      v15 = 128;
      if (!a3)
        break;
    }
    do
    {
      v23 = *a1;
      v24 = a1[1];
      v25 = *v10;
      v26 = v10[1];
      a1 += 2;
      v10 += 2;
      v28 = *v9;
      v29 = v9[1];
      v27 = v9 + 2;
      v16 = vaddw_high_u8(vaddw_u8(vaddw_high_u8(vaddw_u8(v16, *(uint8x8_t *)v23.i8), v23), *(uint8x8_t *)v24.i8), v24);
      v17 = vaddw_high_u8(vaddw_u8(vaddw_high_u8(vaddw_u8(v17, *(uint8x8_t *)v25.i8), v25), *(uint8x8_t *)v26.i8), v26);
      v30 = vaddw_u8(vaddw_u8(*v27, *(uint8x8_t *)v24.i8), *(uint8x8_t *)v26.i8);
      v31 = vaddw_high_u8(vaddw_high_u8(v27[1], v24), v26);
      v27 -= 2;
      *v27 = vaddw_u8(vaddw_u8(v28, *(uint8x8_t *)v23.i8), *(uint8x8_t *)v25.i8);
      v27[1] = vaddw_high_u8(vaddw_high_u8(v29, v23), v25);
      v27 += 2;
      *v27 = v30;
      v27[1] = v31;
      v9 = v27 + 2;
      --v32;
    }
    while (v32);
  }
  return 0;
}

float sub_2276447B4(int32x4_t *a1, int32x4_t *a2, int a3)
{
  int32x4_t v3;
  int32x4_t v4;
  int v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int64x2_t v10;
  float result;

  v3 = 0uLL;
  v4 = 0uLL;
  v5 = a3 >> 3;
  do
  {
    v6 = *a1;
    v7 = a1[1];
    v8 = *a2;
    v9 = a2[1];
    a1 += 2;
    a2 += 2;
    v3 = vabaq_s32(v3, v6, v8);
    v4 = vabaq_s32(v4, v7, v9);
    --v5;
  }
  while (v5);
  v10 = (int64x2_t)vpaddlq_u32((uint32x4_t)vaddq_s32(v3, v4));
  LODWORD(result) = vpaddq_s64(v10, v10).u32[0];
  return result;
}

float sub_2276447F4(int32x4_t *a1, unsigned int a2, int32x4_t *a3, unsigned int a4, int a5)
{
  int32x4_t v5;
  int32x4_t v6;
  int32x4_t v7;
  int32x4_t v8;
  int v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int64x2_t v14;
  float result;

  v5 = 0uLL;
  v6 = 0uLL;
  v7 = vdupq_n_s32(a2);
  v8 = vdupq_n_s32(a4);
  v9 = a5 >> 3;
  do
  {
    v10 = *a1;
    v11 = a1[1];
    v12 = *a3;
    v13 = a3[1];
    a1 += 2;
    a3 += 2;
    v5 = vabaq_s32(v5, vsubq_s32(v10, v7), vsubq_s32(v12, v8));
    v6 = vabaq_s32(v6, vsubq_s32(v11, v7), vsubq_s32(v13, v8));
    --v9;
  }
  while (v9);
  v14 = (int64x2_t)vpaddlq_u32((uint32x4_t)vaddq_s32(v5, v6));
  LODWORD(result) = vpaddq_s64(v14, v14).u32[0];
  return result;
}

float sub_22764484C(int32x4_t *a1, int a2)
{
  int32x4_t v2;
  int32x4_t v3;
  int v4;
  int32x4_t v5;
  int32x4_t v6;
  int64x2_t v7;
  float result;

  v2 = 0uLL;
  v3 = 0uLL;
  v4 = a2 >> 3;
  do
  {
    v5 = *a1;
    v6 = a1[1];
    a1 += 2;
    v2 = vaddq_s32(v2, v5);
    v3 = vaddq_s32(v3, v6);
    --v4;
  }
  while (v4);
  v7 = (int64x2_t)vpaddlq_u32((uint32x4_t)vaddq_s32(v2, v3));
  LODWORD(result) = vpaddq_s64(v7, v7).u32[0];
  return result;
}

uint64_t initProjectionContext(int a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unsigned int v6;
  _DWORD *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  size_t v17;
  void *v18;
  void *v19;
  void *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;

  *(_DWORD *)a3 = a1;
  *(_DWORD *)(a3 + 4) = a2;
  if ((a2 & 7) != 0)
  {
    v3 = 4294967291;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", 36);
    return v3;
  }
  if ((a1 & 0xF) != 0)
  {
    v3 = 4294967291;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", 41);
    return v3;
  }
  LODWORD(v5) = a2 / 240;
  if (240 * (a2 / 240) == a2)
    v5 = v5;
  else
    v5 = (v5 + 1);
  *(_DWORD *)(a3 + 24) = v5;
  if ((int)v5 >= 5)
  {
    v3 = 4294967292;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -4, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", 52);
    return v3;
  }
  v6 = 0;
  *(_DWORD *)(a3 + 28) = a1;
  *(_DWORD *)(a3 + 48) = 0;
  if ((int)v5 > 1)
  {
    v7 = (_DWORD *)(a3 + 32);
    v8 = (v5 - 1);
    v9 = 240;
    do
    {
      *v7 = 240;
      v7[5] = v9;
      v9 += 240;
      ++v7;
      --v8;
    }
    while (v8);
    v6 = v5 - 1;
  }
  *(_DWORD *)(a3 + 4 * v6 + 32) = a2 - 240 * v6;
  *(_QWORD *)(a3 + 96) = (2 * a1 + 127) & 0xFFFFFF80;
  if ((int)v5 < 1)
  {
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = a3 + 64;
    do
    {
      v14 = *(int *)(v13 + 4 * v10 - 32);
      v15 = (4 * (_DWORD)v14 + 127) & 0xFFFFFF80;
      v12 += v15 * (a1 + 1);
      *(_QWORD *)(v13 + 8 * v10) = v15;
      v11 += *(_QWORD *)(a3 + 96) + *(_QWORD *)(a3 + 96) * v14;
      ++v10;
    }
    while (v5 != v10);
    v16 = 2 * v12;
    v17 = 2 * v11;
  }
  v18 = *(void **)(a3 + 8);
  if (v18)
    free(v18);
  v19 = malloc_type_malloc(v16, 0xA6E9D12DuLL);
  *(_QWORD *)(a3 + 8) = v19;
  if (!v19)
  {
    v32 = 90;
LABEL_31:
    v3 = 4294967293;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -3, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", v32);
    return v3;
  }
  v20 = *(void **)(a3 + 16);
  if (v20)
    free(v20);
  v21 = (char *)malloc_type_malloc(v17, 0xE1AF0D46uLL);
  *(_QWORD *)(a3 + 16) = v21;
  if (!v21)
  {
    v32 = 96;
    goto LABEL_31;
  }
  v22 = *(unsigned int *)(a3 + 24);
  if ((int)v22 >= 1)
  {
    v23 = *(_QWORD *)(a3 + 8);
    v24 = *(int *)(a3 + 28) + 1;
    v25 = *(_QWORD *)(a3 + 96);
    v26 = (_QWORD *)(a3 + 200);
    v27 = (int *)(a3 + 32);
    do
    {
      v28 = *(v26 - 17) * v24;
      *(v26 - 12) = v23;
      v29 = v28 + v23;
      *(v26 - 8) = v29;
      v23 = v29 + v28;
      v30 = *v27++;
      v31 = v25 + v25 * v30;
      *(v26 - 4) = v21;
      *v26++ = &v21[v31];
      v21 += v31 + v31;
      --v22;
    }
    while (v22);
  }
  v3 = 0;
  *(_DWORD *)(a3 + 232) = 1;
  return v3;
}

uint64_t disposeProjectionContext(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  if (!a1)
    return 4294967294;
  v2 = *(void **)(a1 + 8);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v3 = *(void **)(a1 + 16);
  if (v3)
    free(v3);
  result = 0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t computeIntegralImages(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  _QWORD v21[10];

  v21[9] = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)(a5 + 232) = *(_DWORD *)(a5 + 232) == 0;
  if (*(int *)(a5 + 24) < 1)
    return 0;
  v7 = 0;
  while (1)
  {
    v8 = *(int *)(a5 + 28);
    if ((v8 & 7) != 0)
    {
      v18 = 173;
      goto LABEL_9;
    }
    v9 = a5 + 4 * v7;
    v10 = *(int *)(v9 + 32);
    if ((v10 & 0xF) != 0)
      break;
    v11 = a5 + 8 * v7;
    v12 = v11 + 32 * *(int *)(a5 + 232);
    v13 = *(char **)(v12 + 104);
    v14 = *(_QWORD *)(v11 + 64);
    v15 = *(char **)(v12 + 168);
    v16 = *(_QWORD *)(a5 + 96);
    v21[8] = 0;
    bzero(v13, 4 * v10);
    bzero(v15, 2 * v8);
    v21[0] = a1;
    v21[1] = &v13[v14];
    v21[2] = &v15[v16];
    v21[3] = v8;
    v21[4] = v10;
    v21[5] = a4;
    v21[6] = v14;
    v21[7] = v16;
    sub_227642B00((uint64_t)v21);
    a1 += *(int *)(v9 + 32) * a4;
    if (++v7 >= *(int *)(a5 + 24))
      return 0;
  }
  v18 = 178;
LABEL_9:
  v17 = 4294967291;
  ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", v18);
  ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -5, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", 369);
  return v17;
}

uint64_t projectionColsFromIntegralImage(int a1, signed int *a2, signed int a3, int a4, int a5, int a6, uint64_t a7)
{
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  signed int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  float *v22;
  uint64_t v24;

  v7 = 386;
  if (a3 < 0
    || a4 < a3
    || *a2 <= a4
    || a4 < 0
    || *a2 <= a3
    || (v7 = 390, a5 < 0)
    || a6 < a5
    || (v8 = a2[1], v8 <= a6)
    || a6 < 0
    || v8 <= a5)
  {
    v24 = 0xFFFFFFFFLL;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", v7);
  }
  else
  {
    LODWORD(v9) = a5 / 0xF0u;
    if (a5 / 0xF0u <= a6 / 0xF0u)
    {
      v10 = 0;
      v11 = 0;
      v12 = a2[58];
      if (!a1)
        v12 = v12 != 1;
      v13 = a3;
      v14 = (a4 + 1);
      v9 = v9;
      do
      {
        v15 = (a5 - v11) & ~((a5 - v11) >> 31);
        if (a6 - v11 >= 239)
          v16 = 239;
        else
          v16 = a6 - v11;
        if ((int)v15 <= v16)
        {
          v17 = &a2[2 * v9];
          v18 = *(_QWORD *)&v17[8 * v12 + 26];
          v19 = *((_QWORD *)v17 + 8);
          v20 = v18 + v19 * v13;
          v21 = v18 + v19 * v14;
          v22 = (float *)(a7 + 4 * v10);
          do
          {
            *v22++ = (float)(*(_DWORD *)(v21 + 4 * v15) - *(_DWORD *)(v20 + 4 * v15));
            ++v10;
          }
          while (v15++ < v16);
        }
        v11 += a2[v9++ + 8];
      }
      while (v9 != a6 / 0xF0u + 1);
    }
    return 0;
  }
  return v24;
}

uint64_t projectionRowsFromIntegralImage(int a1, uint64_t a2, signed int a3, int a4, unsigned int a5, signed int a6, void *a7)
{
  int v8;
  signed int v12;
  uint64_t v13;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  _BOOL4 v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unsigned __int16 *v34;
  unsigned __int16 *v35;
  uint64_t v36;
  float *v37;
  int v38;
  int v39;
  int v40;

  if (a3 < 0)
  {
    v8 = 436;
    goto LABEL_15;
  }
  v8 = 436;
  if (a4 < a3 || *(_DWORD *)a2 <= a4 || a4 < 0 || *(_DWORD *)a2 <= a3)
    goto LABEL_15;
  if ((a5 & 0x80000000) != 0)
  {
    v8 = 440;
    goto LABEL_15;
  }
  v8 = 440;
  if (a6 < (int)a5)
    goto LABEL_15;
  v12 = *(_DWORD *)(a2 + 4);
  if (v12 <= a6 || a6 < 0 || v12 <= (int)a5)
    goto LABEL_15;
  if (a5 > 0xF0)
  {
    v8 = 444;
LABEL_15:
    v13 = 0xFFFFFFFFLL;
    ACTLogMessageImp(4, "Projections error %d @ %s (line %d)", -1, "/Library/Caches/com.apple.xbs/Sources/ACTFramework/Projections.c", v8);
    return v13;
  }
  v17 = *(_DWORD *)(a2 + 232);
  v18 = a5 == 240;
  v19 = a6 / 0xF0u;
  v20 = (a4 - a3 + 1);
  bzero(a7, 4 * (int)v20);
  if (v19 < v18)
    return 0;
  v21 = 0;
  v22 = v17 != 1;
  if (a1)
    v22 = v17;
  v23 = v22;
  v24 = *(_QWORD *)(a2 + 96);
  v25 = a5 > 0xEF;
  if (a5 <= 0xEF)
    v26 = v19;
  else
    v26 = v19 + 1;
  v27 = v26 - v18 + 1;
  v28 = 2 * a3;
  v29 = a2 + 32 * v23;
  do
  {
    v30 = a5 - v21;
    if ((int)(a5 - v21) >= 240)
      v30 = 240;
    v31 = v30 & ~(v30 >> 31);
    v32 = a6 - v21;
    if (a6 - v21 >= 239)
      v32 = 239;
    v33 = *(_QWORD *)(v29 + 8 * v25 + 168) + v28;
    v34 = (unsigned __int16 *)(v33 + v24 * (v32 + 1));
    v35 = (unsigned __int16 *)(v33 + v24 * v31);
    v36 = v20;
    v37 = (float *)a7;
    do
    {
      v39 = *v34++;
      v38 = v39;
      v40 = *v35++;
      *v37 = *v37 + (float)(v38 - v40);
      ++v37;
      --v36;
    }
    while (v36);
    v13 = 0;
    v21 += *(_DWORD *)(a2 + 4 * v25++ + 32);
  }
  while (v25 != v27);
  return v13;
}

uint64_t Stitcher_SceneCut_postProcessCostImage_v2(uint64_t a1, vImagePixelCount a2, vImagePixelCount a3)
{
  return FastFilter_execute(*(_QWORD *)(a1 + 104), *(_DWORD *)(a1 + 96), *(CVPixelBufferRef *)(a1 + 112), *(__CVBuffer **)(a1 + 112), 0, 0, a2, a3);
}

_QWORD *Stitcher_SceneCut_findVerticalSeam_orig_v2(_QWORD *result, unint64_t a2, unint64_t a3)
{
  _QWORD *v5;
  unsigned __int8 *v6;
  _DWORD *v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  BOOL *v12;
  unsigned __int8 *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t i;
  _DWORD *v17;
  unsigned int *v18;
  unsigned int v19;
  unsigned int v20;
  BOOL v21;
  unsigned int v22;
  unsigned __int8 *v23;
  _DWORD *v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  _DWORD *v28;
  unsigned int v29;
  uint64_t v30;
  char v31;
  BOOL v32;
  char v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;

  v5 = result;
  result[6] = a3;
  if (a2)
  {
    v6 = (unsigned __int8 *)result[11];
    v7 = (_DWORD *)result[2];
    v8 = a2;
    do
    {
      v9 = *v6++;
      *v7++ = v9;
      --v8;
    }
    while (v8);
  }
  v10 = a3 - 1;
  if (a3 <= 1)
  {
    v14 = a2 - 1;
  }
  else
  {
    v48 = a3 - 1;
    v11 = result[7];
    v12 = (BOOL *)(*result + v11);
    v13 = (unsigned __int8 *)(result[11] + v11);
    v14 = a2 - 1;
    v15 = a2 - 2;
    for (i = 1; i != a3; ++i)
    {
      v17 = (_DWORD *)v5[1];
      v18 = (unsigned int *)v5[2];
      v19 = *v18;
      v20 = v18[1];
      v21 = v20 < *v18;
      if (v20 >= *v18)
        v22 = *v18;
      else
        v22 = v18[1];
      v23 = v13 + 1;
      *v17 = v22 + *v13;
      v24 = v17 + 1;
      *v12 = v21;
      v25 = v12 + 1;
      if (v14 >= 2)
      {
        v26 = 0;
        v27 = 0;
        v28 = v18 + 2;
        do
        {
          v29 = v19;
          v19 = v20;
          v30 = v27 + 1;
          v20 = v28[v27];
          v31 = v27;
          if (v29 >= v19)
          {
            v29 = v19;
            v31 = v27 + 1;
          }
          v32 = v20 >= v29;
          if (v20 < v29)
            v29 = v28[v27];
          v24[v27] = v29 + v23[v27];
          if (v32)
            v33 = v31;
          else
            v33 = v27 + 2;
          v25[v27] = v33;
          v26 -= 4;
          ++v27;
        }
        while (v15 != v30);
        if (v19 >= v20)
          v22 = v20;
        else
          v22 = v19;
        v23 += v30;
        v24 = (_DWORD *)((char *)v24 - v26);
        v25 += v30;
      }
      if (v19 >= v20)
        v34 = a2 - 1;
      else
        v34 = a2 - 2;
      *v24 = v22 + *v23;
      *v25 = v34;
      result = memcpy((void *)v5[2], (const void *)v5[1], 4 * a2);
      v35 = v5[7];
      v13 += v35;
      v12 += v35;
    }
    v10 = v48;
  }
  v36 = 0;
  v37 = v5[1];
  v38 = a2 >> 1;
  v39 = *(_DWORD *)(v37 + 4 * (a2 >> 1));
  v40 = v39;
  do
  {
    if (*(_DWORD *)(v37 + 4 * v36) < v40)
    {
      LOBYTE(v39) = *(_DWORD *)(v37 + 4 * v36);
      v40 = *(_DWORD *)(v37 + 4 * v36);
      v38 = v36;
    }
    ++v36;
  }
  while (v36 <= v14);
  v41 = v5[4];
  *(_QWORD *)(v5[3] + 8 * v10) = v38;
  *(_BYTE *)(v41 + v10) = v39;
  if ((int)a3 >= 2)
  {
    v42 = (a3 - 2);
    v43 = v5[7] * v10;
    v44 = v5[11] + v43;
    v45 = *v5 + v43;
    do
    {
      v38 = *(unsigned __int8 *)(v45 + v38);
      v46 = v5[4];
      *(_QWORD *)(v5[3] + 8 * v42) = v38;
      *(_BYTE *)(v46 + v42) = *(_BYTE *)(v44 + v38);
      v47 = v5[7];
      v45 -= v47;
      v44 -= v47;
      --v42;
    }
    while (v42 != -1);
  }
  return result;
}

uint64_t Stitcher_SceneCut_findVerticalSeam_v2_NEON(_QWORD *a1, unint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  _DWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[11];

  v3 = a3;
  v26[10] = *MEMORY[0x24BDAC8D0];
  a1[6] = a3;
  v6 = a1[11];
  v7 = a1[1];
  if (a2)
  {
    v8 = a2;
    v9 = (unsigned __int8 *)a1[11];
    v10 = (_DWORD *)a1[1];
    do
    {
      v11 = *v9++;
      *v10++ = v11;
      --v8;
    }
    while (v8);
  }
  v25 = 0x706050403020100;
  v12 = a1[7];
  v26[0] = *a1 + v12;
  v26[1] = v6 + v12;
  v13 = a3 - 1;
  v26[2] = a2;
  v26[3] = a3 - 1;
  v26[4] = v7;
  v26[5] = &v25;
  v26[6] = v12;
  memset(&v26[7], 0, 24);
  result = sub_22763A400((uint64_t)v26);
  v15 = 0;
  v16 = a1[1];
  v17 = a2 >> 1;
  v18 = *(_DWORD *)(v16 + 4 * (a2 >> 1));
  v19 = v18;
  do
  {
    if (*(_DWORD *)(v16 + 4 * v15) < v19)
    {
      v18 = *(_DWORD *)(v16 + 4 * v15);
      v19 = v18;
      v17 = v15;
    }
    ++v15;
  }
  while (v15 <= a2 - 1);
  *(_QWORD *)(a1[3] + 8 * v13) = v17;
  *(_BYTE *)(a1[4] + v13) = v18;
  if (v3 >= 2)
  {
    v20 = (v3 - 2);
    v21 = a1[7] * v13;
    v22 = a1[11] + v21;
    v23 = *a1 + v21;
    do
    {
      v17 = *(unsigned __int8 *)(v23 + v17);
      *(_QWORD *)(a1[3] + 8 * v20) = v17;
      *(_BYTE *)(a1[4] + v20) = *(_BYTE *)(v22 + v17);
      v24 = a1[7];
      v23 -= v24;
      v22 -= v24;
      --v20;
    }
    while (v20 != -1);
  }
  return result;
}

void Stitcher_SceneCut_calculateCostImage_Yuv_v2(_QWORD *a1, unsigned __int8 *a2, const char *a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, const char *a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  char *v17;
  char *v18;
  _BYTE *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v26;
  uint64_t v27;
  unint64_t v38;
  int v42;
  int v43;
  int v44;
  int v45;
  uint64_t v49;
  unint64_t v53;
  int v60;
  int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v69;
  uint8x8_t v74;
  unint64_t v75;
  int v80;
  int v81;
  int v82;
  unsigned int v83;
  unsigned __int8 *v84;
  int8x8x2_t v86;
  uint16x8_t v87;
  int8x8x2_t v88;
  int8x8x2_t v89;
  int8x8x2_t v90;

  v17 = (char *)a1[11];
  v19 = (_BYTE *)a1[16];
  v18 = (char *)a1[17];
  v84 = (unsigned __int8 *)a1[39];
  Stitcher_SceneCut_calculateSpatialBiasLut_v2((uint64_t)a1, a10);
  if (a11)
  {
    v20 = 0;
    v21 = v84;
    if (!*(_DWORD *)(a1[42] + 4))
      v21 = 0;
    v22 = a10 >> 4;
    if (a10 >> 4 <= 1)
      v22 = 1;
    do
    {
      _X14 = v19;
      _X13 = a6;
      _X12 = a2;
      if (a10 >= 0x10)
      {
        v26 = 0;
        v27 = v22;
        do
        {
          _X13 = &a2[v26];
          _X15 = &a6[v26];
          _X16 = (uint8x16_t *)&v19[v26];
          __asm
          {
            PRFM            #1, [X13]
            PRFM            #1, [X15]
            PRFM            #0x11, [X16]
          }
          *_X16 = vshrq_n_u8(vabdq_u8(*(uint8x16_t *)&a6[v26], *(uint8x16_t *)&a2[v26]), 1uLL);
          v26 += 16;
          --v27;
        }
        while (v27);
        _X12 = &a2[v26];
        _X13 = &a6[v26];
        _X14 = &v19[v26];
      }
      v38 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X12]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v43 = *_X12++;
          v42 = v43;
          v44 = *_X13++;
          v45 = v44 - v42;
          if (v45 < 0)
            v45 = -v45;
          *_X14++ = v45 >> 1;
          --v38;
        }
        while (v38);
      }
      if (!v20 || (v20 & 1) != 0)
      {
        _X12 = v18;
        _X13 = a7;
        _X14 = a3;
        v49 = v22;
        if (a10 >= 0x10)
        {
          do
          {
            __asm
            {
              PRFM            #1, [X14]
              PRFM            #1, [X13]
              PRFM            #0x11, [X12]
            }
            v86 = vld2_s8(_X14);
            _X14 += 16;
            v88 = vld2_s8(_X13);
            _X13 += 16;
            v86.val[0] = (int8x8_t)vhadd_u8(vabd_u8((uint8x8_t)v88.val[1], (uint8x8_t)v86.val[1]), vabd_u8((uint8x8_t)v88.val[0], (uint8x8_t)v86.val[0]));
            v86.val[1] = v86.val[0];
            vst2_s8(_X12, v86);
            _X12 += 16;
            --v49;
          }
          while (v49);
        }
        a3 += a4;
        a7 += a8;
        if ((a10 & 0xF) != 0)
        {
          v53 = 0;
          do
          {
            _X16 = &_X14[v53];
            _X17 = &_X13[v53];
            _X0 = &_X12[v53];
            __asm
            {
              PRFM            #1, [X16]
              PRFM            #1, [X17]
              PRFM            #0x11, [X0]
            }
            v60 = _X13[v53] - _X14[v53];
            if (v60 < 0)
              v60 = _X14[v53] - _X13[v53];
            v61 = *((unsigned __int8 *)_X17 + 1) - *((unsigned __int8 *)_X16 + 1);
            if (v61 < 0)
              v61 = -v61;
            v62 = (v61 + v60) >> 1;
            *_X0 = v62;
            _X0[1] = v62;
            v53 += 2;
          }
          while ((a10 & 0xF) > v53);
        }
      }
      v63 = a1[7];
      _X13 = (const char *)a1[15];
      if (*(_DWORD *)(a1[42] + 4))
      {
        if (*v21++)
          _X13 = (const char *)a1[38];
      }
      _X14 = v17;
      _X15 = v19;
      _X16 = v18;
      v69 = v22;
      if (a10 >= 0x10)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X15]
            PRFM            #1, [X16]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v87 = (uint16x8_t)vld2_s8(_X15);
          _X15 += 16;
          v89 = vld2_s8(_X16);
          _X16 += 16;
          v90 = vld2_s8(_X13);
          _X13 += 16;
          v74 = vhadd_u8(*(uint8x8_t *)v87.i8, (uint8x8_t)v89.val[0]);
          v87 = vmull_u8((uint8x8_t)v90.val[1], vhadd_u8((uint8x8_t)v87.u64[1], (uint8x8_t)v89.val[1]));
          v87.u64[1] = (unint64_t)vqshrn_n_u16(vmull_u8((uint8x8_t)v90.val[0], v74), 8uLL);
          v89.val[0] = (int8x8_t)vqshrn_n_u16(v87, 8uLL);
          vst2_s8(_X14, *(int8x8x2_t *)((char *)&v87 + 8));
          _X14 += 16;
          --v69;
        }
        while (v69);
      }
      v75 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          __asm
          {
            PRFM            #1, [X15]
            PRFM            #1, [X16]
            PRFM            #1, [X13]
            PRFM            #0x11, [X14]
          }
          v81 = *(unsigned __int8 *)_X15++;
          v80 = v81;
          v82 = *(unsigned __int8 *)_X16++;
          v83 = v82 + v80;
          LOWORD(v82) = *(unsigned __int8 *)_X13++;
          *_X14++ = (unsigned __int16)((v83 >> 1) * v82) >> 8;
          --v75;
        }
        while (v75);
      }
      a2 += a4;
      a6 += a8;
      v17 += v63;
      ++v20;
    }
    while (v20 != a11);
  }
}

void Stitcher_SceneCut_calculateSpatialBiasLut_v2(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  float v5;
  float v6;

  if (a2)
  {
    v4 = 0;
    v6 = (float)(1.0
               / (float)(1.2
                       - expf(-(float)((float)((float)a2 / (float)((float)a2 + (float)a2))
                                     * (float)((float)a2 / (float)((float)a2 + (float)a2))))))
       * 255.0;
    do
    {
      v5 = (float)(a2 >> 1);
      *(_BYTE *)(*(_QWORD *)(a1 + 120) + v4) = (int)(float)(v6
                                                          * (float)(1.2
                                                                  - expf(-(float)((float)((float)((float)(int)v4 - v5)
                                                                                        / (float)(v5 + v5))
                                                                                * (float)((float)((float)(int)v4 - v5)
                                                                                        / (float)(v5 + v5))))));
      ++v4;
    }
    while (a2 != v4);
  }
}

uint64_t Stitcher_SceneCut_setStraightVerticalSeam_v2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  int v16;
  int v17;
  int v18;

  if (a11)
  {
    v12 = 0;
    v13 = 0;
    v14 = (unsigned __int8 *)(a7 + a12);
    v15 = (unsigned __int8 *)(a3 + a12);
    do
    {
      v16 = *(unsigned __int8 *)(a6 + a12) - *(unsigned __int8 *)(a2 + a12);
      if (v16 < 0)
        v16 = *(unsigned __int8 *)(a2 + a12) - *(unsigned __int8 *)(a6 + a12);
      if (!v13 || (v13 & 1) != 0)
      {
        v17 = *v15;
        v15 += a4;
        v18 = *v14;
        v14 += a8;
        v12 = v18 - v17;
        if (v12 < 0)
          v12 = -v12;
        v12 = v12;
      }
      a2 += a4;
      *(_BYTE *)(*(_QWORD *)(result + 32) + v13) = ((v16 >> 1) + v12) >> 1;
      a6 += a8;
      *(_QWORD *)(*(_QWORD *)(result + 24) + 8 * v13++) = a12;
    }
    while (a11 != v13);
  }
  return result;
}

void Stitcher_SceneCut_calculateCostImage_Y_v2(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11)
{
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  const char *v31;
  const char *v32;
  char *v33;
  uint64_t v34;
  uint16x8_t v35;
  unint64_t v36;
  __int16 v37;
  __int16 v38;
  __int16 v39;
  uint16x8_t v40;
  int8x8x2_t v41;

  Stitcher_SceneCut_calculateSpatialBiasLut_v2((uint64_t)a1, a10);
  if (a11)
  {
    v16 = 0;
    v17 = (_BYTE *)a1[16];
    v18 = (char *)a1[11];
    v19 = a10 >> 4;
    if (a10 >> 4 <= 1)
      v19 = 1;
    do
    {
      v20 = a1[7];
      v21 = v17;
      v22 = a6;
      v23 = a2;
      if (a10 >= 0x10)
      {
        v24 = 0;
        v25 = v19;
        do
        {
          *(uint8x16_t *)&v17[v24] = vshrq_n_u8(vabdq_u8(*(uint8x16_t *)&a6[v24], *(uint8x16_t *)&a2[v24]), 1uLL);
          v24 += 16;
          --v25;
        }
        while (v25);
        v23 = &a2[v24];
        v22 = &a6[v24];
        v21 = &v17[v24];
      }
      v26 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          v28 = *v23++;
          v27 = v28;
          v29 = *v22++;
          v30 = v29 - v27;
          if (v30 < 0)
            v30 = -v30;
          *v21++ = v30 >> 1;
          --v26;
        }
        while (v26);
      }
      v31 = (const char *)a1[15];
      v32 = v17;
      v33 = v18;
      v34 = v19;
      if (a10 >= 0x10)
      {
        do
        {
          v40 = (uint16x8_t)vld2_s8(v32);
          v32 += 16;
          v41 = vld2_s8(v31);
          v31 += 16;
          v35 = vmull_u8((uint8x8_t)v41.val[0], *(uint8x8_t *)v40.i8);
          v40 = vmull_u8((uint8x8_t)v41.val[1], (uint8x8_t)v40.u64[1]);
          v40.u64[1] = (unint64_t)vqshrn_n_u16(v35, 8uLL);
          v41.val[0] = (int8x8_t)vqshrn_n_u16(v40, 8uLL);
          vst2_s8(v33, *(int8x8x2_t *)((char *)&v40 + 8));
          v33 += 16;
          --v34;
        }
        while (v34);
      }
      v36 = a10 & 0xF;
      if ((a10 & 0xF) != 0)
      {
        do
        {
          v38 = *(unsigned __int8 *)v32++;
          v37 = v38;
          v39 = *(unsigned __int8 *)v31++;
          *v33++ = (unsigned __int16)(v39 * v37) >> 8;
          --v36;
        }
        while (v36);
      }
      a2 += a4;
      a6 += a8;
      v18 += v20;
      ++v16;
    }
    while (v16 != a11);
  }
}

void Stitcher_SceneCut_calculateFlarePerRow_v2(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  int v24;
  char v25;

  _X22 = a3;
  _X23 = a2;
  v12 = *(_QWORD *)(a1 + 312);
  Stitcher_SceneCut_calculateSpatialBiasLutFlare_v2(a1, a6);
  if (a7)
  {
    v13 = 0;
    v14 = _X22;
    do
    {
      if ((v13 == 0) | v13 & 1)
        v15 = a4;
      else
        v15 = 0;
      v16 = &v14[v15];
      v17 = *(unsigned __int8 *)(v12 + v13);
      if ((v13 == 0) | v13 & 1)
        _X22 = v14;
      __asm
      {
        PRFM            #1, [X23]
        PRFM            #1, [X22]
      }
      v24 = FlareDetector_avgFlareProbability(_X23, _X22, a6);
      v25 = v17 > 1;
      if (v24)
        v25 = 2;
      *(_BYTE *)(v12 + v13++) = v25;
      v14 = v16;
      _X23 += a4;
    }
    while (a7 != v13);
  }
}

void Stitcher_SceneCut_calculateSpatialBiasLutFlare_v2(uint64_t a1, unint64_t a2)
{
  float v4;
  uint64_t v5;
  float v6;

  if (a2)
  {
    v4 = (float)a2 * 0.01;
    v5 = 0;
    v6 = (float)(1.0 / (float)(1.1 - expf(-(float)((float)((float)a2 / v4) * (float)((float)a2 / v4))))) * 255.0;
    do
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 304) + v5) = (int)(float)(v6
                                                          * (float)(1.1
                                                                  - expf(-(float)((float)((float)(int)v5 / v4)
                                                                                * (float)((float)(int)v5 / v4)))));
      ++v5;
    }
    while (a2 != v5);
  }
}

uint64_t print_uint8(const char *a1, __n128 a2)
{
  uint64_t i;

  xmmword_2558F47C0 = (__int128)a2;
  printf("%s = ", a1);
  for (i = 0; i != 16; ++i)
    printf("%02d ", *((unsigned __int8 *)&xmmword_2558F47C0 + i));
  return putchar(10);
}

uint64_t print_uint8_2(double a1, double a2)
{
  uint64_t v2;
  char *v3;
  uint64_t result;

  v2 = 0;
  v3 = byte_2558F47D0;
  vst2_s8(v3, *(int8x8x2_t *)&a1);
  do
    result = printf("%02d ", byte_2558F47D0[v2++]);
  while (v2 != 16);
  return result;
}

uint64_t print_int16(const char *a1, __n128 a2)
{
  uint64_t i;

  xmmword_2558F47E0 = (__int128)a2;
  printf("%s = ", a1);
  for (i = 0; i != 16; i += 2)
    printf("%02d ", *(__int16 *)((char *)&xmmword_2558F47E0 + i));
  return putchar(10);
}

uint64_t print_int16_2(const char *a1, __n128 a2, __n128 a3)
{
  __int16 *v3;
  uint64_t i;

  v3 = word_2558F47F0;
  vst2q_s16(v3, *(int16x8x2_t *)a2.n128_u64);
  printf("%s = ", a1);
  for (i = 0; i != 16; ++i)
    printf("%02d ", (unsigned __int16)word_2558F47F0[i]);
  return putchar(10);
}

uint64_t Stitcher_SceneCut_blendToReferencePoisson_NoExposureDifference_v2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, float a10, float a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, uint64_t a18, vDSP_Length a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  unsigned __int128 v27;
  _DWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float *v32;
  _DWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  float v41;
  float v42;
  float v43;
  float v44;
  char *v45;
  _BYTE *v46;
  char v47;
  float v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float *v57;
  float *v58;
  _QWORD *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  float v63;
  unsigned int v64;
  float v65;
  float v66;
  int v67;
  int16x8_t v68;
  unsigned int v69;
  int16x8_t v70;
  int16x8_t v71;
  char v72;
  unint64_t v73;
  int8x8_t *v74;
  uint8x8_t v75;
  int16x8_t v76;
  uint8x8_t v77;
  int16x8_t v78;
  uint8x8_t v79;
  int16x8_t v80;
  char v81;
  unint64_t v82;
  _QWORD *v83;
  uint64_t v84;
  unsigned int v85;
  char *v86;
  const char *v87;
  char *v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  int v95;
  int v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  const char *v101;
  int16x8_t v102;
  void *v103;
  uint64_t v104;
  float *v105;
  _QWORD *v106;
  uint64_t v107;
  int16x8_t v108;
  int16x8_t v109;
  float *v110;
  float *v111;
  uint64_t v114;
  uint64_t v115;
  float *v116;
  int16x8_t v117;
  size_t __n;
  _OWORD v120[2];
  _OWORD v121[2];
  uint64_t v122;
  int16x8_t v123;
  int8x8x2_t v124;
  int16x8_t v125;
  int16x8x2_t v126;

  v20 = a13;
  v122 = *MEMORY[0x24BDAC8D0];
  v23 = *(_QWORD *)(a1 + 216);
  v24 = *(_QWORD *)(a1 + 224);
  v25 = *(_OWORD *)(v23 + 16);
  v121[0] = *(_OWORD *)v23;
  v121[1] = v25;
  v26 = *(_OWORD *)(v24 + 16);
  v126 = vld2q_s16((const __int16 *)v23);
  v109 = v126.val[0];
  v120[0] = *(_OWORD *)v24;
  v120[1] = v26;
  v27 = (unsigned __int128)vld2q_s16((const __int16 *)v24);
  v108 = (int16x8_t)v27;
  v28 = *(_DWORD **)(a1 + 264);
  if (a19)
  {
    v29 = 0;
    v31 = *(_QWORD *)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v33 = *(_DWORD **)(a1 + 272);
    v32 = *(float **)(a1 + 280);
    v34 = a2;
    v35 = a13;
    v36 = a3;
    v37 = a14;
    v38 = *(_QWORD *)(a1 + 24);
    do
    {
      v39 = (*(_QWORD *)(v38 + 8 * v29) + a20) & 0xFFFFFFFFFFFFFFFELL;
      v40 = *(_BYTE *)(v31 + v29);
      v41 = *(float *)(a1 + 320);
      v42 = (float)((float)v126.val[1].u32[0] * v41) + -5.0;
      if (v42 < 0.0)
        v42 = 0.0;
      *(float *)(v30 + 4 * v29) = v42;
      LOBYTE(v42) = *(_BYTE *)(v34 + v39);
      LOBYTE(v41) = *(_BYTE *)(v35 + v39);
      v43 = (float)((float)LODWORD(v42) - (float)LODWORD(v41)) * 0.5;
      v44 = *(float *)(a1 + 320);
      *(float *)v126.val[1].i32 = v44 * v43;
      v28[v29] = v126.val[1].i32[0];
      if ((v29 & 1) == 0)
      {
        v45 = (char *)(v36 + v39);
        v36 += a4;
        v46 = (_BYTE *)(v37 + v39);
        v37 += a15;
        v47 = *v45;
        LOBYTE(v44) = *v46;
        v48 = (float)((float)v126.val[1].u32[0] - (float)LODWORD(v44)) * 0.5;
        v49 = *(float *)(a1 + 320);
        *(float *)v126.val[1].i32 = v49 * v48;
        LOBYTE(a10) = v45[1];
        LOBYTE(a11) = v46[1];
        a11 = (float)LODWORD(a11);
        a10 = (float)((float)LODWORD(a10) - a11) * 0.5;
        *v33++ = v126.val[1].i32[0];
        *v32++ = v49 * a10;
      }
      v34 += a4;
      v35 += a15;
      ++v29;
    }
    while (a19 != v29);
  }
  v114 = a14;
  v50 = a1;
  v51 = a3;
  FIR1DFilter_execute(*(_QWORD *)(a1 + 256), v28, a19);
  FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 272), a19 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 280), a19 >> 1);
  result = FIR1DFilter_execute(*(_QWORD *)(v50 + 256), *(void **)(v50 + 40), a19);
  v54 = a4;
  v53 = a15;
  if (a19)
  {
    v55 = v51;
    v56 = 0;
    v57 = *(float **)(a1 + 40);
    v111 = *(float **)(a1 + 280);
    v58 = *(float **)(a1 + 264);
    v110 = *(float **)(a1 + 272);
    v59 = *(_QWORD **)(a1 + 24);
    do
    {
      v60 = 0;
      v61 = (*v59 + a20) & 0xFFFFFFFFFFFFFFFELL;
      v62 = v61 - 16;
      v63 = (float)(*v57 * 0.1) * *(float *)(a1 + 328);
      v64 = vcvtd_n_s64_f64(v63, 8uLL);
      if (v63 >= 1.0)
        v64 = 256;
      if (*v58 <= 0.0)
        v65 = -0.5;
      else
        v65 = 0.5;
      v66 = *v58 + v65;
      v67 = (int)(float)-v66;
      v68 = vdupq_n_s16(v64);
      v69 = 256 - v64;
      v70 = vdupq_n_s16((256 - v64) * (int)v66);
      __n = a17 - (int)v61 - 16;
      v71 = vdupq_n_s16((256 - v64) * v67);
      v72 = 1;
      v73 = (*v59 + a20) & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        v74 = (int8x8_t *)(a2 + v73);
        v75 = *(uint8x8_t *)(v20 + v73);
        v76 = (int16x8_t)vmovl_u8(v75);
        v77 = *(uint8x8_t *)(a2 + v73);
        v78 = (int16x8_t)vmovl_u8(v77);
        v79 = *(uint8x8_t *)(a2 + v73 - 16);
        v80 = (int16x8_t)vmovl_u8(v79);
        *v74 = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v76, vmulq_s16(vshrq_n_s16(vmlaq_s16(v70, vshrq_n_s16((int16x8_t)vsubl_u8(v77, v75), 1uLL), v68), 8uLL), (int16x8_t)v121[v60]), 4uLL), vmaxq_s16(v76, v78)), vminq_s16(v76, v78)));
        v81 = v72;
        v74[-2] = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v80, vmulq_s16(vshrq_n_s16(vmlaq_s16(v71, vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)(v20 + v73 - 16), v79), 1uLL), v68), 8uLL), (int16x8_t)v120[v60]), 4uLL), vmaxq_s16(v76, v80)), vminq_s16(v76, v80)));
        v73 += 8;
        v60 = 1;
        v72 = 0;
      }
      while ((v81 & 1) != 0);
      v82 = v61 + 15;
      if ((int)__n > 0)
      {
        v115 = v56;
        v116 = v58;
        v83 = v59;
        v84 = v55;
        v117 = v68;
        v85 = v69;
        result = (uint64_t)memcpy((void *)(a2 + v82 + 1), (const void *)(v20 + v82 + 1), __n);
        v69 = v85;
        v68 = v117;
        v62 = v61 - 16;
        v59 = v83;
        v56 = v115;
        v58 = v116;
        v55 = v84;
        v54 = a4;
        v53 = a15;
      }
      if ((v56 & 1) == 0)
      {
        v86 = (char *)(v55 + v61);
        v88 = (char *)(v55 + v62);
        v89 = *v110++;
        if (v89 <= 0.0)
          v90 = -0.5;
        else
          v90 = 0.5;
        v91 = v89 + v90;
        v92 = *v111++;
        if (v92 <= 0.0)
          v93 = -0.5;
        else
          v93 = 0.5;
        v94 = v92 + v93;
        v95 = (int)(float)-v91;
        v96 = (int)(float)-v94;
        v87 = (const char *)(v114 + v61);
        v124 = vld2_s8(v87);
        v97 = (int16x8_t)vmovl_u8((uint8x8_t)v124.val[0]);
        v98 = (int16x8_t)vmovl_u8((uint8x8_t)v124.val[1]);
        v125 = (int16x8_t)vld2_s8(v86);
        v99 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v125.i8);
        v100 = (int16x8_t)vmovl_u8((uint8x8_t)v125.u64[1]);
        v124.val[0] = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v97, vmulq_s16(vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * (int)v91), vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)v125.i8, (uint8x8_t)v124.val[0]), 1uLL), v68), 8uLL), v109), 4uLL), vmaxq_s16(v97, v99)), vminq_s16(v97, v99)));
        v124.val[1] = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v98, vmulq_s16(vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * (int)v94), vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v125.u64[1], (uint8x8_t)v124.val[1]), 1uLL), v68), 8uLL), v109), 4uLL), vmaxq_s16(v98, v100)), vminq_s16(v98, v100)));
        vst2_s8(v86, v124);
        v101 = (const char *)(v114 + v62);
        v123 = (int16x8_t)vld2_s8(v101);
        v124 = (int8x8x2_t)vmovl_u8(*(uint8x8_t *)v123.i8);
        *(int8x8x2_t *)((char *)&v124 + 8) = (int8x8x2_t)vmovl_u8((uint8x8_t)v123.u64[1]);
        v97 = (int16x8_t)vld2_s8(v88);
        v125 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v97.i8);
        *(uint16x8_t *)((char *)&v125 + 8) = vmovl_u8(*(uint8x8_t *)v98.i8);
        v102 = vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * v95), vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)v123.i8, *(uint8x8_t *)v97.i8), 1uLL), v68), 8uLL);
        v123 = vshrq_n_s16(vmlaq_s16(vdupq_n_s16(v69 * v96), vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v123.u64[1], *(uint8x8_t *)v98.i8), 1uLL), v68), 8uLL);
        v123.u64[1] = (unint64_t)vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v125, vmulq_s16(v102, v108), 4uLL), vmaxq_s16((int16x8_t)v124, v125)), vminq_s16((int16x8_t)v124, v125)));
        *(int8x8_t *)v102.i8 = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(*(int16x8_t *)((char *)&v125 + 8), vmulq_s16(v123, v108), 4uLL), vmaxq_s16(*(int16x8_t *)((char *)&v124 + 8), *(int16x8_t *)((char *)&v125 + 8))), vminq_s16(*(int16x8_t *)((char *)&v124 + 8), *(int16x8_t *)((char *)&v125 + 8))));
        vst2_s8(v88, *(int8x8x2_t *)((char *)&v123 + 8));
        if ((int)__n >= 1)
        {
          v103 = (void *)(v55 + v82 + 1);
          v104 = v114 + v82;
          v105 = v58;
          v106 = v59;
          v107 = v55;
          result = (uint64_t)memcpy(v103, (const void *)(v104 + 1), __n);
          v59 = v106;
          v58 = v105;
          v55 = v107;
          v54 = a4;
          v53 = a15;
        }
        v55 += v54;
        v114 += v53;
      }
      ++v59;
      ++v57;
      ++v58;
      a2 += v54;
      v20 += v53;
      ++v56;
    }
    while (v56 != a19);
  }
  return result;
}

uint64_t Stitcher_SceneCut_blendToReferencePoisson_v2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8, double a9, float a10, float a11, float a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, vDSP_Length a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 *v27;
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
  const __int16 *v38;
  const __int16 *v39;
  _DWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _DWORD *v44;
  float *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  float v54;
  float v55;
  float v56;
  _BYTE *v57;
  _BYTE *v58;
  float v59;
  float v60;
  float v61;
  uint64_t v62;
  uint64_t v64;
  uint64_t result;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  float *v69;
  float *v70;
  float *v71;
  _QWORD *v72;
  uint64_t v73;
  unint64_t v74;
  int v75;
  float v76;
  unsigned int v77;
  float v78;
  float v79;
  int v80;
  unsigned int v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  unint64_t v85;
  int8x8_t *v86;
  uint8x8_t v87;
  int16x8_t v88;
  uint8x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  uint8x8_t v92;
  int16x8_t v93;
  size_t v94;
  unint64_t v95;
  uint64_t v96;
  float *v97;
  _QWORD *v98;
  int v99;
  unint64_t v100;
  unsigned int v101;
  uint64_t v102;
  float v103;
  float v104;
  float v105;
  float v106;
  int v107;
  int v108;
  unint64_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int16x8_t v112;
  unint64_t v113;
  int16x8_t v114;
  int16x8_t *v115;
  int16x8_t *v116;
  const char *v117;
  char *v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t v122;
  int16x8_t v123;
  int16x8_t v124;
  const char *v125;
  char *v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t v129;
  int16x8_t v130;
  int16x8_t v131;
  int16x8_t v132;
  void *v133;
  size_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v140;
  float *v141;
  int16x8_t v142;
  float *v143;
  float *v144;
  uint64_t v145;
  vDSP_Length v146;
  uint64_t v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _OWORD v150[8];
  _OWORD v151[8];
  uint64_t v152;
  int16x8_t v153;
  int16x8_t v154;
  int8x8x2_t v155;
  int8x8x2_t v156;
  int16x8x2_t v157;
  int16x8x2_t v158;

  v21 = a14;
  v22 = a4;
  v23 = a3;
  v24 = a2;
  v146 = a20;
  v152 = *MEMORY[0x24BDAC8D0];
  v147 = a1;
  if (!*(_BYTE *)(a1 + 332))
    return Stitcher_SceneCut_blendToReferencePoisson_NoExposureDifference_v2(v147, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a21, a14, a15, a16, a17, a18, a19, v146,
             a21);
  v25 = 0;
  v26 = *(_OWORD **)(v147 + 232);
  v27 = *(__int128 **)(v147 + 240);
  v28 = v26[5];
  v151[4] = v26[4];
  v151[5] = v28;
  v29 = v26[7];
  v151[6] = v26[6];
  v151[7] = v29;
  v30 = v26[1];
  v151[0] = *v26;
  v151[1] = v30;
  v31 = v26[3];
  v151[2] = v26[2];
  v151[3] = v31;
  v32 = *v27;
  v33 = v27[1];
  v34 = v27[3];
  v150[2] = v27[2];
  v150[3] = v34;
  v150[0] = v32;
  v150[1] = v33;
  v35 = v27[4];
  v36 = v27[5];
  v37 = v27[7];
  v150[6] = v27[6];
  v150[7] = v37;
  v150[4] = v35;
  v150[5] = v36;
  do
  {
    v38 = (const __int16 *)&v26[v25];
    v39 = (const __int16 *)&v27[v25];
    v157 = vld2q_s16(v38);
    v158 = vld2q_s16(v39);
    *(int16x8x2_t *)&v149[v25 * 16] = v157;
    *(int16x8x2_t *)&v148[v25 * 16] = v158;
    v25 += 2;
  }
  while (v25 != 8);
  v40 = *(_DWORD **)(v147 + 264);
  if (v146)
  {
    v41 = 0;
    v43 = *(_QWORD *)(v147 + 32);
    v42 = *(_QWORD *)(v147 + 40);
    v45 = *(float **)(v147 + 272);
    v44 = *(_DWORD **)(v147 + 280);
    v46 = v24;
    v47 = a14;
    v48 = a3;
    v49 = a15;
    v50 = *(_QWORD *)(v147 + 24);
    v51 = v147;
    do
    {
      v52 = (*(_QWORD *)(v50 + 8 * v41) + a21) & 0xFFFFFFFFFFFFFFFELL;
      LOBYTE(a9) = *(_BYTE *)(v43 + v41);
      v53 = v147;
      v54 = *(float *)(v147 + 320);
      *(float *)&a9 = (float)((float)LODWORD(a9) * v54) + -5.0;
      if (*(float *)&a9 < 0.0)
        *(float *)&a9 = 0.0;
      *(_DWORD *)(v42 + 4 * v41) = LODWORD(a9);
      LOBYTE(a9) = *(_BYTE *)(v46 + v52);
      LOBYTE(v54) = *(_BYTE *)(v47 + v52);
      v55 = (float)((float)LODWORD(a9) - (float)LODWORD(v54)) * 0.5;
      v56 = *(float *)(v53 + 320);
      *(float *)&a9 = (float)(v56 * v55) * 1.2;
      v40[v41] = LODWORD(a9);
      if ((v41 & 1) == 0)
      {
        v57 = (_BYTE *)(v48 + v52);
        v48 += a4;
        v58 = (_BYTE *)(v49 + v52);
        v49 += a16;
        LOBYTE(a9) = *v57;
        LOBYTE(v56) = *v58;
        v59 = (float)((float)LODWORD(a9) - (float)LODWORD(v56)) * 0.5;
        v60 = *(float *)(v51 + 320);
        LOBYTE(a11) = v57[1];
        LOBYTE(a12) = v58[1];
        a12 = (float)LODWORD(a12);
        a11 = (float)((float)LODWORD(a11) - a12) * 0.5;
        v61 = (float)(v60 * v59) * 1.2;
        *v45++ = v61;
        *(float *)&a9 = (float)(v60 * a11) * 1.2;
        *v44++ = LODWORD(a9);
      }
      v46 += a4;
      v47 += a16;
      ++v41;
    }
    while (v146 != v41);
  }
  v62 = v147;
  FIR1DFilter_execute(*(_QWORD *)(v147 + 256), v40, v146);
  FIR1DFilter_execute(*(_QWORD *)(v62 + 256), *(void **)(v62 + 272), v146 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v62 + 256), *(void **)(v62 + 280), v146 >> 1);
  FIR1DFilter_execute(*(_QWORD *)(v62 + 256), *(void **)(v62 + 40), v146);
  v64 = a21;
  result = a18;
  v66 = a16;
  if (v146)
  {
    v67 = a15;
    v68 = 0;
    v69 = *(float **)(v147 + 40);
    v70 = *(float **)(v147 + 280);
    v71 = *(float **)(v147 + 264);
    v143 = *(float **)(v147 + 272);
    v144 = v70;
    v72 = *(_QWORD **)(v147 + 24);
    v138 = v22;
    do
    {
      v73 = 0;
      v74 = (*v72 + v64) & 0xFFFFFFFFFFFFFFFELL;
      v75 = result - v74 - 64;
      v76 = (float)(*v69 * *(float *)(v147 + 328)) * 0.1;
      v77 = vcvtd_n_s64_f64(v76, 8uLL);
      if (v76 >= 1.0)
        v77 = 256;
      if (*v71 <= 0.0)
        v78 = -0.5;
      else
        v78 = 0.5;
      v79 = *v71 + v78;
      v80 = (int)(float)-v79;
      v81 = 256 - v77;
      v82 = vdupq_n_s16(v77);
      v83 = vdupq_n_s16((256 - v77) * (int)v79);
      v84 = vdupq_n_s16((256 - v77) * v80);
      v85 = (*v72 + v64) & 0xFFFFFFFFFFFFFFFELL;
      do
      {
        v86 = (int8x8_t *)(v24 + v85);
        v87 = *(uint8x8_t *)(v21 + v85);
        v88 = (int16x8_t)vmovl_u8(v87);
        v89 = *(uint8x8_t *)(v24 + v85);
        v90 = (int16x8_t)vmovl_u8(v89);
        v91 = vmulq_s16(vshrq_n_s16(vmlaq_s16(v83, vshrq_n_s16((int16x8_t)vsubl_u8(v89, v87), 1uLL), v82), 8uLL), (int16x8_t)v151[v73]);
        v92 = *(uint8x8_t *)(v24 + v85 - 64);
        v93 = (int16x8_t)vmovl_u8(v92);
        *v86 = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v88, v91, 6uLL), vmaxq_s16(v88, v90)), vminq_s16(v88, v90)));
        v86[-8] = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v93, vmulq_s16(vshrq_n_s16(vmlaq_s16(v84, vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)(v21 + v85 - 64), v92), 1uLL), v82), 8uLL), (int16x8_t)v150[v73++]), 6uLL), vmaxq_s16(v88, v93)), vminq_s16(v88, v93)));
        v85 += 8;
      }
      while (v73 != 8);
      v94 = v75;
      v95 = v74 + 63;
      v145 = v68;
      if (v75 > 0)
      {
        v140 = v74 + 63;
        v141 = v69;
        v96 = v67;
        v97 = v71;
        v98 = v72;
        v99 = result - v74 - 64;
        v142 = v82;
        v100 = v74;
        v101 = v81;
        memcpy((void *)(v24 + v95 + 1), (const void *)(v21 + v95 + 1), v75);
        v81 = v101;
        v74 = v100;
        v82 = v142;
        v75 = v99;
        v72 = v98;
        v71 = v97;
        v95 = v140;
        v69 = v141;
        v68 = v145;
        v64 = a21;
        v67 = v96;
        v22 = v138;
        result = a18;
        v66 = a16;
      }
      if ((v68 & 1) == 0)
      {
        v102 = 0;
        if (*v143 <= 0.0)
          v103 = -0.5;
        else
          v103 = 0.5;
        v104 = *v143 + v103;
        if (*v144 <= 0.0)
          v105 = -0.5;
        else
          v105 = 0.5;
        v106 = *v144 + v105;
        v107 = (int)(float)-v104;
        v108 = (int)(float)-v106;
        v109 = v23 + v74;
        v110 = vdupq_n_s16(v81 * (int)v104);
        v111 = vdupq_n_s16(v81 * (int)v106);
        v112 = vdupq_n_s16(v81 * v107);
        v113 = v67 + v74;
        v114 = vdupq_n_s16(v81 * v108);
        v115 = (int16x8_t *)v148;
        v116 = (int16x8_t *)v149;
        do
        {
          v117 = (const char *)(v113 + v102);
          v153 = (int16x8_t)vld2_s8(v117);
          v118 = (char *)(v109 + v102);
          v119 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v153.i8);
          v155 = vld2_s8(v118);
          v120 = (int16x8_t)vmovl_u8((uint8x8_t)v153.u64[1]);
          v121 = (int16x8_t)vmovl_u8((uint8x8_t)v155.val[0]);
          v122 = (int16x8_t)vmovl_u8((uint8x8_t)v155.val[1]);
          v123 = vmlaq_s16(v110, vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v155.val[0], *(uint8x8_t *)v153.i8), 1uLL), v82);
          v153 = vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v155.val[1], (uint8x8_t)v153.u64[1]), 1uLL);
          v124 = *v116;
          v116 += 2;
          v153.u64[1] = (unint64_t)vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v119, vmulq_s16(vshrq_n_s16(v123, 8uLL), v124), 6uLL), vmaxq_s16(v119, v121)), vminq_s16(v119, v121)));
          *(int8x8_t *)v119.i8 = vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v120, vmulq_s16(vshrq_n_s16(vmlaq_s16(v111, v153, v82), 8uLL), v124), 6uLL), vmaxq_s16(v120, v122)), vminq_s16(v120, v122)));
          vst2_s8(v118, *(int8x8x2_t *)((char *)&v153 + 8));
          v125 = (const char *)(v113 + v102 - 64);
          v154 = (int16x8_t)vld2_s8(v125);
          v126 = (char *)(v109 + v102 - 64);
          v127 = (int16x8_t)vmovl_u8(*(uint8x8_t *)v154.i8);
          v156 = vld2_s8(v126);
          v128 = (int16x8_t)vmovl_u8((uint8x8_t)v156.val[0]);
          v129 = (int16x8_t)vmovl_u8((uint8x8_t)v156.val[1]);
          v130 = (int16x8_t)vmovl_u8((uint8x8_t)v154.u64[1]);
          v131 = vmlaq_s16(v112, vshrq_n_s16((int16x8_t)vsubl_u8(*(uint8x8_t *)v154.i8, (uint8x8_t)v156.val[0]), 1uLL), v82);
          v132 = *v115;
          v115 += 2;
          v154 = vminq_s16(vsraq_n_s16(v129, vmulq_s16(vshrq_n_s16(vmlaq_s16(v114, vshrq_n_s16((int16x8_t)vsubl_u8((uint8x8_t)v154.u64[1], (uint8x8_t)v156.val[1]), 1uLL), v82), 8uLL), v132), 6uLL), vmaxq_s16(v130, v129));
          v154.u64[1] = (unint64_t)vqmovun_s16(vmaxq_s16(vminq_s16(vsraq_n_s16(v128, vmulq_s16(vshrq_n_s16(v131, 8uLL), v132), 6uLL), vmaxq_s16(v127, v128)), vminq_s16(v127, v128)));
          *(int8x8_t *)v127.i8 = vqmovun_s16(vmaxq_s16(v154, vminq_s16(v130, v129)));
          vst2_s8(v126, *(int8x8x2_t *)((char *)&v154 + 8));
          v102 += 16;
        }
        while (v102 != 64);
        if (v75 > 0)
        {
          v133 = (void *)(v23 + v95 + 1);
          v134 = v94;
          v135 = v67;
          v136 = v23;
          v137 = v64;
          memcpy(v133, (const void *)(v67 + v95 + 1), v134);
          v64 = v137;
          v68 = v145;
          v23 = v136;
          v67 = v135;
          v22 = v138;
          result = a18;
          v66 = a16;
        }
        ++v143;
        ++v144;
        v23 += v22;
        v67 += v66;
      }
      ++v72;
      ++v69;
      ++v71;
      v24 += v22;
      v21 += v66;
      ++v68;
    }
    while (v68 != v146);
  }
  return result;
}

void *Stitcher_SceneCut_blendToReference_v2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v16;
  char *v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  void *result;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint8x8_t *v28;
  uint8x8_t *v29;
  size_t v30;
  uint8x8_t v39;
  uint8x8_t v40;
  uint8x8_t v41;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint8x8_t *v57;
  uint8x8_t *v58;
  uint64_t v59;
  uint8x8_t v64;
  uint8x8_t v65;
  uint8x8_t v66;
  char *v71;
  _BYTE v75[160];
  _BYTE __dst[160];
  uint64_t v77;
  int8x8x2_t v78;
  int8x8x2_t v79;
  int8x8x2_t v80;
  int8x8x2_t v81;
  int8x8x2_t v82;

  v77 = *MEMORY[0x24BDAC8D0];
  v16 = 176;
  if (!**(_DWORD **)(a1 + 336))
    v16 = 192;
  v17 = *(char **)(a1 + v16);
  if (**(_DWORD **)(a1 + 336))
    v18 = 32;
  else
    v18 = 16;
  v19 = 184;
  if (!**(_DWORD **)(a1 + 336))
    v19 = 200;
  v71 = v17;
  v20 = *(char **)(a1 + v19);
  memcpy(__dst, v17, v18);
  result = memcpy(v75, v20, v18);
  v22 = a12;
  if (a12)
  {
    v23 = 0;
    v24 = *(_QWORD **)(a1 + 24);
    do
    {
      v25 = *v24 & 0xFFFFFFFFFFFFFFFELL;
      v26 = v25 + v18;
      v27 = v25 + v18 - 1;
      v28 = (uint8x8_t *)v75;
      v29 = (uint8x8_t *)__dst;
      v30 = v18 >> 3;
      do
      {
        _X14 = (int8x8_t *)(a2 + v25);
        _X15 = a6 + v25;
        __asm
        {
          PRFM            #0x11, [X14]
          PRFM            #1, [X15]
        }
        v39 = *v29++;
        v40 = v39;
        v41 = *v28++;
        *_X14 = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8(*(uint8x8_t *)(a2 + v25), v41), *(uint8x8_t *)(a6 + v25), v40), 5uLL);
        v25 += 8;
        --v30;
      }
      while (v30);
      if (a10 != v26)
      {
        _X0 = (void *)(a2 + v27 + 1);
        __asm { PRFUM           #0x11, [X9,#1] }
        _X1 = (const void *)(a6 + v27 + 1);
        __asm { PRFUM           #1, [X8,#1] }
        v46 = v22;
        result = memcpy(_X0, _X1, a10 - v26);
        v22 = v46;
      }
      ++v24;
      a2 += a4;
      a6 += a8;
      ++v23;
    }
    while (v23 != v22);
  }
  v47 = 0;
  if (v18 >> 4 <= 1)
    v48 = 1;
  else
    v48 = v18 >> 4;
  do
  {
    v49 = &v71[v47];
    v78 = vld2_s8(v49);
    v50 = &v20[v47];
    v80 = vld2_s8(v50);
    *(int8x8x2_t *)&__dst[v47] = v78;
    *(int8x8x2_t *)&v75[v47] = v80;
    v47 += 16;
  }
  while (16 * v48 != v47);
  if ((unint64_t)(v22 + 1) >= 2)
  {
    v51 = 0;
    v52 = *(_QWORD **)(a1 + 24);
    v53 = (unint64_t)(v22 + 1) >> 1;
    do
    {
      v54 = *v52 & 0xFFFFFFFFFFFFFFFELL;
      v55 = v54 + v18;
      v56 = v54 + v18 - 1;
      v57 = (uint8x8_t *)v75;
      v58 = (uint8x8_t *)__dst;
      v59 = v48;
      do
      {
        _X14 = (const char *)(a7 + v54);
        _X15 = (char *)(a3 + v54);
        __asm
        {
          PRFM            #0x11, [X15]
          PRFM            #1, [X14]
        }
        v64 = *v58;
        v58 += 2;
        v65 = v64;
        v79 = vld2_s8(_X14);
        v81 = vld2_s8(_X15);
        v66 = *v57;
        v57 += 2;
        v82.val[0] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v81.val[0], v66), (uint8x8_t)v79.val[0], v65), 5uLL);
        v82.val[1] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v81.val[1], v66), (uint8x8_t)v79.val[1], v65), 5uLL);
        vst2_s8(_X15, v82);
        v54 += 16;
        --v59;
      }
      while (v59);
      if (a10 != v55)
      {
        _X0 = (void *)(a3 + v56 + 1);
        __asm { PRFUM           #0x11, [X9,#1] }
        _X1 = (const void *)(a7 + v56 + 1);
        __asm { PRFUM           #1, [X8,#1] }
        result = memcpy(_X0, _X1, a10 - v55);
      }
      v52 += 2;
      a3 += a4;
      a7 += a8;
      ++v51;
    }
    while (v51 != v53);
  }
  return result;
}

_QWORD *Stitcher_SceneCut_alphaBlendToReference_v2(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t i;
  uint64_t j;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v41;
  uint8x8_t v42;
  uint8x8_t v43;
  _OWORD v46[10];
  _OWORD v47[10];
  uint64_t v48;
  int8x8x2_t v49;
  int8x8x2_t v50;
  int8x8x2_t v51;
  int8x8x2_t v52;
  int8x8x2_t v53;

  v48 = *MEMORY[0x24BDAC8D0];
  v15 = result[22];
  v14 = result[23];
  v16 = *(_OWORD *)(v15 + 16);
  v47[0] = *(_OWORD *)v15;
  v47[1] = v16;
  v17 = *(_OWORD *)(v14 + 16);
  v46[0] = *(_OWORD *)v14;
  v46[1] = v17;
  if (a12)
  {
    for (i = 0; i != a12; ++i)
    {
      for (j = 0; j != 32; j += 8)
      {
        _X9 = (int8x8_t *)(a2 + j);
        _X10 = a6 + j;
        __asm
        {
          PRFM            #0x11, [X9]
          PRFM            #1, [X10]
        }
        *_X9 = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8(*(uint8x8_t *)(a2 + j), *(uint8x8_t *)((char *)v46 + j)), *(uint8x8_t *)(a6 + j), *(uint8x8_t *)((char *)v47 + j)), 5uLL);
      }
      if (a10 != 32)
        result = memcpy((void *)(a2 + 32), (const void *)(a6 + 32), a10 - 32);
      a2 += a4;
      a6 += a8;
    }
  }
  v30 = 0;
  v31 = 1;
  do
  {
    v49 = vld2_s8((const char *)v15);
    v15 += 16;
    v47[v30] = v49;
    v50 = vld2_s8((const char *)v14);
    v14 += 16;
    v32 = v31;
    v46[v30] = v50;
    v30 = 1;
    v31 = 0;
  }
  while ((v32 & 1) != 0);
  if ((unint64_t)(a12 + 1) >= 2)
  {
    v33 = 0;
    do
    {
      v34 = 0;
      v35 = 0;
      v36 = 1;
      do
      {
        _X11 = (const char *)(a7 + v34);
        _X12 = (char *)(a3 + v34);
        __asm
        {
          PRFM            #0x11, [X12]
          PRFM            #1, [X11]
        }
        v41 = v35;
        v42 = *(uint8x8_t *)&v47[v41];
        v43 = *(uint8x8_t *)&v46[v41];
        v51 = vld2_s8(_X11);
        v52 = vld2_s8(_X12);
        LOBYTE(_X11) = v36;
        v53.val[0] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v52.val[0], v43), (uint8x8_t)v51.val[0], v42), 5uLL);
        v53.val[1] = vshrn_n_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v52.val[1], v43), (uint8x8_t)v51.val[1], v42), 5uLL);
        vst2_s8(_X12, v53);
        v34 += 16;
        v35 = 1;
        v36 = 0;
      }
      while ((_X11 & 1) != 0);
      if (a10 != 32)
        result = memcpy((void *)(a3 + 32), (const void *)(a7 + 32), a10 - 32);
      a3 += a4;
      a7 += a8;
      ++v33;
    }
    while (v33 != (unint64_t)(a12 + 1) >> 1);
  }
  return result;
}

void *Stitcher_SceneCut_zero_v2()
{
  return malloc_type_calloc(0x170uLL, 1uLL, 0x9138F178uLL);
}

char *Stitcher_SceneCut_constructor_v2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  _DWORD *v7;
  void *v8;
  size_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _WORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  int32x4_t v32;
  int32x4_t v33;
  int32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  float64x2_t v43;
  float64x2_t v44;
  float64x2_t v45;
  float64x2_t v46;
  int32x4_t v47;
  uint64_t *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t i;
  void *v56;
  void *v57;
  uint64_t j;
  _QWORD *v59;
  size_t BytesPerRowOfPlane;
  void *v61;
  void *v62;
  void *v63;
  float64x2_t v65;
  float64x2_t v66;
  float64x2_t v67;
  float64x2_t __x;
  long double v69;
  float64x2_t v70;
  float64x2_t v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  float64x2_t v76;
  float64x2_t v77;
  float64x2_t v78;
  float64x2_t v79;
  int32x4_t v80;
  int32x4_t v81;

  v6 = (char *)malloc_type_calloc(0x170uLL, 1uLL, 0x9138F178uLL);
  v7 = BlendingDefaults_constructor();
  *((_QWORD *)v6 + 42) = v7;
  if (!v7)
    goto LABEL_49;
  *(_QWORD *)(v6 + 324) = 0x3F8000003F800000;
  v6[332] = 0;
  *((_QWORD *)v6 + 7) = a1;
  *((_QWORD *)v6 + 8) = a2;
  *((_QWORD *)v6 + 10) = a2 * a1;
  *((_QWORD *)v6 + 6) = a2;
  *((_OWORD *)v6 + 18) = xmmword_22764C320;
  v8 = malloc_type_malloc(a2 * a1, 0x100004077774924uLL);
  *(_QWORD *)v6 = v8;
  if (!v8)
    goto LABEL_49;
  bzero(v8, a2 * a1);
  v9 = 4 * a1;
  v10 = malloc_type_malloc(v9, 0x100004052888210uLL);
  *((_QWORD *)v6 + 1) = v10;
  if (!v10)
    goto LABEL_49;
  bzero(v10, v9);
  v11 = malloc_type_malloc(v9, 0x100004052888210uLL);
  *((_QWORD *)v6 + 2) = v11;
  if (!v11)
    goto LABEL_49;
  bzero(v11, v9);
  v12 = malloc_type_malloc(8 * *((_QWORD *)v6 + 6), 0x100004000313F17uLL);
  *((_QWORD *)v6 + 3) = v12;
  if (!v12)
    goto LABEL_49;
  bzero(v12, 8 * *((_QWORD *)v6 + 6));
  v13 = malloc_type_malloc(*((_QWORD *)v6 + 6), 0x100004077774924uLL);
  *((_QWORD *)v6 + 4) = v13;
  if (!v13)
    goto LABEL_49;
  bzero(v13, *((_QWORD *)v6 + 6));
  v14 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 15) = v14;
  if (!v14)
    goto LABEL_49;
  v15 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 16) = v15;
  if (!v15)
    goto LABEL_49;
  v16 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 17) = v16;
  if (!v16)
    goto LABEL_49;
  v17 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 18) = v17;
  if (!v17)
    goto LABEL_49;
  v18 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 19) = v18;
  if (!v18)
    goto LABEL_49;
  v19 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 20) = v19;
  if (!v19)
    goto LABEL_49;
  v20 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
  *((_QWORD *)v6 + 21) = v20;
  if (!v20)
    goto LABEL_49;
  if (*(_DWORD *)(*((_QWORD *)v6 + 42) + 8))
  {
    v21 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 27) = v21;
    if (!v21)
      goto LABEL_49;
    v22 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 28) = v22;
    if (!v22)
      goto LABEL_49;
    v23 = 0;
    v24 = *((_QWORD *)v6 + 27);
    do
    {
      v22[v23] = v23;
      *(_WORD *)(v24 + 2 * v23) = 16 - v23;
      ++v23;
    }
    while (v23 != 16);
    v25 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 29) = v25;
    if (!v25)
      goto LABEL_49;
    v26 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 30) = v26;
    if (!v26)
      goto LABEL_49;
    v27 = 0;
    v28 = *((_QWORD *)v6 + 29);
    do
    {
      v26[v27] = v27;
      *(_WORD *)(v28 + 2 * v27) = 64 - v27;
      ++v27;
    }
    while (v27 != 64);
    v29 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x1000040BDFB0063uLL);
    *((_QWORD *)v6 + 31) = v29;
    if (!v29)
      goto LABEL_49;
    v30 = v29;
    v31 = 0;
    v32 = (int32x4_t)xmmword_22764BA70;
    v33 = (int32x4_t)xmmword_22764BA80;
    __asm { FMOV            V2.2D, #10.0 }
    v66 = _Q2;
    v67 = (float64x2_t)vdupq_n_s64(0xC070000000000000);
    __asm { FMOV            V2.2D, #1.0 }
    v65 = _Q2;
    do
    {
      v80 = v33;
      v81 = v32;
      v40.i64[0] = 0x7F0000007FLL;
      v40.i64[1] = 0x7F0000007FLL;
      v41 = vcvtq_f32_s32(vaddq_s32(v32, v40));
      v42 = vcvtq_f32_s32(vaddq_s32(v33, v40));
      v71 = vcvt_hight_f64_f32(v42);
      v72 = vcvtq_f64_f32(*(float32x2_t *)v42.f32);
      v73 = vcvt_hight_f64_f32(v41);
      v74 = vcvtq_f64_f32(*(float32x2_t *)v41.f32);
      v77 = vmulq_f64(vaddq_f64(vabsq_f64(v73), v67), v66);
      v79 = vmulq_f64(vaddq_f64(vabsq_f64(v74), v67), v66);
      v75 = vmulq_f64(vaddq_f64(vabsq_f64(v72), v67), v66);
      __x = vmulq_f64(vaddq_f64(vabsq_f64(v71), v67), v66);
      v69 = exp(__x.f64[1]);
      v43.f64[0] = exp(__x.f64[0]);
      v43.f64[1] = v69;
      v70 = v43;
      __x.f64[0] = exp(v75.f64[1]);
      v44.f64[0] = exp(v75.f64[0]);
      v44.f64[1] = __x.f64[0];
      v76 = v44;
      __x.f64[0] = exp(v77.f64[1]);
      v45.f64[0] = exp(v77.f64[0]);
      v45.f64[1] = __x.f64[0];
      v78 = v45;
      __x.f64[0] = exp(v79.f64[1]);
      v46.f64[0] = exp(v79.f64[0]);
      v46.f64[1] = __x.f64[0];
      *(int16x8_t *)&v30[v31] = vuzp1q_s16((int16x8_t)vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v72, vaddq_f64(v76, v65))), vdivq_f64(v71, vaddq_f64(v70, v65)))), (int16x8_t)vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v74, vaddq_f64(v46, v65))), vdivq_f64(v73, vaddq_f64(v78, v65)))));
      v47.i64[0] = 0x800000008;
      v47.i64[1] = 0x800000008;
      v33 = vaddq_s32(v80, v47);
      v32 = vaddq_s32(v81, v47);
      v31 += 16;
    }
    while (v31 != 512);
    v48 = FIR1DFilter_Gaussian(*((_QWORD *)v6 + 6), 8.0);
    *((_QWORD *)v6 + 32) = v48;
    if (!v48)
      goto LABEL_49;
    v49 = malloc_type_malloc(4 * *((_QWORD *)v6 + 6), 0x100004052888210uLL);
    *((_QWORD *)v6 + 33) = v49;
    if (!v49)
      goto LABEL_49;
    v50 = malloc_type_malloc((2 * *((_QWORD *)v6 + 6)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
    *((_QWORD *)v6 + 34) = v50;
    if (!v50)
      goto LABEL_49;
    v51 = malloc_type_malloc((2 * *((_QWORD *)v6 + 6)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
    *((_QWORD *)v6 + 35) = v51;
    if (!v51)
      goto LABEL_49;
    v52 = malloc_type_malloc(4 * *((_QWORD *)v6 + 6), 0x100004052888210uLL);
    *((_QWORD *)v6 + 5) = v52;
    if (!v52)
      goto LABEL_49;
  }
  v53 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 22) = v53;
  if (!v53)
    goto LABEL_49;
  v54 = malloc_type_malloc(0x20uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 23) = v54;
  if (!v54)
    goto LABEL_49;
  for (i = 0; i != 32; ++i)
  {
    *(_BYTE *)(*((_QWORD *)v6 + 22) + i) = i + 1;
    *(_BYTE *)(*((_QWORD *)v6 + 23) + i) = 32 - *(_BYTE *)(*((_QWORD *)v6 + 22) + i);
  }
  v56 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 24) = v56;
  if (!v56)
    goto LABEL_49;
  v57 = malloc_type_malloc(0x10uLL, 0x100004077774924uLL);
  *((_QWORD *)v6 + 25) = v57;
  if (!v57)
    goto LABEL_49;
  for (j = 0; j != 16; ++j)
  {
    *(_BYTE *)(*((_QWORD *)v6 + 24) + j) = (int)(float)((float)(j + 1) + (float)(j + 1));
    *(_BYTE *)(*((_QWORD *)v6 + 25) + j) = 32 - *(_BYTE *)(*((_QWORD *)v6 + 24) + j);
  }
  if (**((_DWORD **)v6 + 42))
  {
    *((_DWORD *)v6 + 24) = 2;
    v59 = FastFilter_constructor(*((_DWORD *)v6 + 14), *((_DWORD *)v6 + 14), *((_DWORD *)v6 + 16));
    *((_QWORD *)v6 + 13) = v59;
    if (!v59 || FastFilter_allocFilterSpecificData((uint64_t)v59, *((_DWORD *)v6 + 24)) == -1)
      goto LABEL_49;
    CVPixelBufferLockBaseAddress(*((CVPixelBufferRef *)v6 + 14), 0);
    *((_QWORD *)v6 + 11) = CVPixelBufferGetBaseAddressOfPlane(*((CVPixelBufferRef *)v6 + 14), 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*((CVPixelBufferRef *)v6 + 14), 0);
  }
  else
  {
    v61 = malloc_type_malloc(*((_QWORD *)v6 + 10), 0x100004077774924uLL);
    *((_QWORD *)v6 + 11) = v61;
    if (!v61)
    {
LABEL_49:
      Stitcher_SceneCut_destructor_v2(v6);
      return 0;
    }
    bzero(v61, *((_QWORD *)v6 + 10));
    BytesPerRowOfPlane = *((_QWORD *)v6 + 7);
  }
  *((_QWORD *)v6 + 9) = BytesPerRowOfPlane;
  if (*(_DWORD *)(*((_QWORD *)v6 + 42) + 4))
  {
    v62 = malloc_type_malloc(*((_QWORD *)v6 + 7), 0x100004077774924uLL);
    *((_QWORD *)v6 + 38) = v62;
    if (!v62)
      goto LABEL_49;
    v63 = malloc_type_calloc(*((_QWORD *)v6 + 8), 1uLL, 0x330408FBuLL);
    *((_QWORD *)v6 + 39) = v63;
    if (!v63)
      goto LABEL_49;
  }
  *((_QWORD *)v6 + 43) = a3;
  return v6;
}

void Stitcher_SceneCut_destructor_v2(void *a1)
{
  __CVBuffer *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (a1)
  {
    if (**((_DWORD **)a1 + 42))
    {
      v2 = (__CVBuffer *)*((_QWORD *)a1 + 14);
      if (v2)
      {
        CVPixelBufferUnlockBaseAddress(v2, 0);
        CVPixelBufferRelease(*((CVPixelBufferRef *)a1 + 14));
        *((_QWORD *)a1 + 14) = 0;
      }
      v3 = (_QWORD *)*((_QWORD *)a1 + 13);
      if (v3)
      {
        FastFilter_destructor(v3);
        *((_QWORD *)a1 + 13) = 0;
      }
    }
    else
    {
      v4 = (void *)*((_QWORD *)a1 + 11);
      if (v4)
        free(v4);
    }
    v5 = (void *)*((_QWORD *)a1 + 3);
    if (v5)
      free(v5);
    v6 = (void *)*((_QWORD *)a1 + 2);
    if (v6)
      free(v6);
    v7 = (void *)*((_QWORD *)a1 + 1);
    if (v7)
      free(v7);
    if (*(_QWORD *)a1)
      free(*(void **)a1);
    v8 = (void *)*((_QWORD *)a1 + 15);
    if (v8)
      free(v8);
    v9 = (void *)*((_QWORD *)a1 + 16);
    if (v9)
      free(v9);
    v10 = (void *)*((_QWORD *)a1 + 17);
    if (v10)
      free(v10);
    v11 = (void *)*((_QWORD *)a1 + 18);
    if (v11)
      free(v11);
    v12 = (void *)*((_QWORD *)a1 + 19);
    if (v12)
      free(v12);
    v13 = (void *)*((_QWORD *)a1 + 20);
    if (v13)
      free(v13);
    v14 = (void *)*((_QWORD *)a1 + 21);
    if (v14)
      free(v14);
    v15 = (void *)*((_QWORD *)a1 + 22);
    if (v15)
      free(v15);
    v16 = (void *)*((_QWORD *)a1 + 23);
    if (v16)
      free(v16);
    v17 = (void *)*((_QWORD *)a1 + 24);
    if (v17)
      free(v17);
    v18 = (void *)*((_QWORD *)a1 + 25);
    if (v18)
      free(v18);
    v19 = (void *)*((_QWORD *)a1 + 27);
    if (v19)
      free(v19);
    v20 = (void *)*((_QWORD *)a1 + 28);
    if (v20)
      free(v20);
    v21 = (void *)*((_QWORD *)a1 + 29);
    if (v21)
      free(v21);
    v22 = (void *)*((_QWORD *)a1 + 30);
    if (v22)
      free(v22);
    v23 = (void *)*((_QWORD *)a1 + 31);
    if (v23)
      free(v23);
    v24 = (_QWORD *)*((_QWORD *)a1 + 32);
    if (v24)
      FIR1DFilter_destructor(v24);
    v25 = (void *)*((_QWORD *)a1 + 33);
    if (v25)
      free(v25);
    v26 = (void *)*((_QWORD *)a1 + 34);
    if (v26)
      free(v26);
    v27 = (void *)*((_QWORD *)a1 + 35);
    if (v27)
      free(v27);
    v28 = (void *)*((_QWORD *)a1 + 5);
    if (v28)
      free(v28);
    v29 = (void *)*((_QWORD *)a1 + 4);
    if (v29)
      free(v29);
    v30 = (void *)*((_QWORD *)a1 + 38);
    if (v30)
      free(v30);
    v31 = (void *)*((_QWORD *)a1 + 39);
    if (v31)
      free(v31);
    v32 = (void *)*((_QWORD *)a1 + 42);
    if (v32)
      BlendingDefaults_destructor(v32);
    free(a1);
  }
}

uint64_t Stitcher_SceneCut_setDefaults_v2(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  __CVBuffer *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  int v19;
  _QWORD *v20;
  size_t BytesPerRowOfPlane;
  void *v22;
  uint64_t v23;
  int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _WORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _WORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  int32x4_t v47;
  int32x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float64x2_t v58;
  float64x2_t v59;
  int32x4_t v60;
  uint64_t *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  float64x2_t v67;
  float32x4_t v68;
  float32x4_t v69;
  float64x2_t __x;
  long double v71;
  float64x2_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t v75;
  int32x4_t v76;

  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(int **)(a1 + 336);
  v7 = *(_QWORD *)(a1 + 344);
  v8 = v6[1];
  v9 = a2[1];
  if (v8 != v9)
  {
    if (v8)
    {
      v10 = *(void **)(a1 + 304);
      if (v10)
      {
        free(v10);
        *(_QWORD *)(a1 + 304) = 0;
      }
      v11 = *(void **)(a1 + 312);
      if (v11)
      {
        free(v11);
        *(_QWORD *)(a1 + 312) = 0;
      }
      v9 = a2[1];
      v6 = *(int **)(a1 + 336);
    }
    v6[1] = v9;
    if (v9)
    {
      v12 = malloc_type_malloc(*(_QWORD *)(a1 + 56), 0x100004077774924uLL);
      *(_QWORD *)(a1 + 304) = v12;
      if (!v12)
        goto LABEL_69;
      v13 = malloc_type_calloc(*(_QWORD *)(a1 + 64), 1uLL, 0x5ED0A31DuLL);
      *(_QWORD *)(a1 + 312) = v13;
      if (!v13)
        goto LABEL_69;
      v6 = *(int **)(a1 + 336);
    }
  }
  v14 = *v6;
  if (v14 == *a2)
    goto LABEL_28;
  if (v14)
  {
    v15 = *(__CVBuffer **)(a1 + 112);
    if (v15)
    {
      CVPixelBufferUnlockBaseAddress(v15, 0);
      CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 112));
      *(_QWORD *)(a1 + 112) = 0;
    }
    v17 = (_QWORD *)(a1 + 104);
    v16 = *(_QWORD **)(a1 + 104);
    if (!v16)
      goto LABEL_21;
    FastFilter_destructor(v16);
    goto LABEL_20;
  }
  v17 = (_QWORD *)(a1 + 88);
  v18 = *(void **)(a1 + 88);
  if (v18)
  {
    free(v18);
LABEL_20:
    *v17 = 0;
  }
LABEL_21:
  v19 = *a2;
  **(_DWORD **)(a1 + 336) = *a2;
  if (v19)
  {
    *(_DWORD *)(a1 + 96) = 2;
    v20 = FastFilter_constructor(*(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 64));
    *(_QWORD *)(a1 + 104) = v20;
    if (!v20 || FastFilter_allocFilterSpecificData((uint64_t)v20, *(_DWORD *)(a1 + 96)) == -1)
      goto LABEL_69;
    CVPixelBufferLockBaseAddress(*(CVPixelBufferRef *)(a1 + 112), 0);
    *(_QWORD *)(a1 + 88) = CVPixelBufferGetBaseAddressOfPlane(*(CVPixelBufferRef *)(a1 + 112), 0);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)(a1 + 112), 0);
  }
  else
  {
    v22 = malloc_type_malloc(*(_QWORD *)(a1 + 80), 0x100004077774924uLL);
    *(_QWORD *)(a1 + 88) = v22;
    if (!v22)
      goto LABEL_69;
    bzero(v22, *(_QWORD *)(a1 + 80));
    BytesPerRowOfPlane = *(_QWORD *)(a1 + 56);
  }
  *(_QWORD *)(a1 + 72) = BytesPerRowOfPlane;
LABEL_28:
  v23 = *(_QWORD *)(a1 + 336);
  v24 = *(_DWORD *)(v23 + 8);
  v25 = a2[2];
  if (v24 == v25)
    return 0;
  if (v24)
  {
    v26 = *(void **)(a1 + 216);
    if (v26)
    {
      free(v26);
      *(_QWORD *)(a1 + 216) = 0;
    }
    v27 = *(void **)(a1 + 224);
    if (v27)
    {
      free(v27);
      *(_QWORD *)(a1 + 224) = 0;
    }
    v28 = *(void **)(a1 + 232);
    if (v28)
    {
      free(v28);
      *(_QWORD *)(a1 + 232) = 0;
    }
    v29 = *(void **)(a1 + 240);
    if (v29)
    {
      free(v29);
      *(_QWORD *)(a1 + 240) = 0;
    }
    v30 = *(void **)(a1 + 248);
    if (v30)
    {
      free(v30);
      *(_QWORD *)(a1 + 248) = 0;
    }
    v31 = *(_QWORD **)(a1 + 256);
    if (v31)
    {
      FIR1DFilter_destructor(v31);
      *(_QWORD *)(a1 + 256) = 0;
    }
    v32 = *(void **)(a1 + 264);
    if (v32)
    {
      free(v32);
      *(_QWORD *)(a1 + 264) = 0;
    }
    v33 = *(void **)(a1 + 272);
    if (v33)
    {
      free(v33);
      *(_QWORD *)(a1 + 272) = 0;
    }
    v34 = *(void **)(a1 + 280);
    if (v34)
    {
      free(v34);
      *(_QWORD *)(a1 + 280) = 0;
    }
    v35 = *(void **)(a1 + 40);
    if (v35)
    {
      free(v35);
      *(_QWORD *)(a1 + 40) = 0;
    }
    v25 = a2[2];
    v23 = *(_QWORD *)(a1 + 336);
  }
  *(_DWORD *)(v23 + 8) = v25;
  if (!v25)
    return 0;
  v36 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
  *(_QWORD *)(a1 + 216) = v36;
  if (v36)
  {
    v37 = malloc_type_malloc(0x20uLL, 0x1000040BDFB0063uLL);
    *(_QWORD *)(a1 + 224) = v37;
    if (v37)
    {
      v38 = 0;
      v39 = *(_QWORD *)(a1 + 216);
      do
      {
        v37[v38] = v38;
        *(_WORD *)(v39 + 2 * v38) = 16 - v38;
        ++v38;
      }
      while (v38 != 16);
      v40 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
      *(_QWORD *)(a1 + 232) = v40;
      if (v40)
      {
        v41 = malloc_type_malloc(0x80uLL, 0x1000040BDFB0063uLL);
        *(_QWORD *)(a1 + 240) = v41;
        if (v41)
        {
          v42 = 0;
          v43 = *(_QWORD *)(a1 + 232);
          do
          {
            v41[v42] = v42;
            *(_WORD *)(v43 + 2 * v42) = 64 - v42;
            ++v42;
          }
          while (v42 != 64);
          v44 = (char *)malloc_type_calloc(1uLL, 0x200uLL, 0x1000040BDFB0063uLL);
          *(_QWORD *)(a1 + 248) = v44;
          if (v44)
          {
            v45 = v44;
            v46 = 0;
            v47 = (int32x4_t)xmmword_22764BA80;
            __asm
            {
              FMOV            V2.4S, #-10.0
              FMOV            V1.4S, #10.0
            }
            v68 = _Q1;
            v69 = _Q2;
            __asm { FMOV            V1.2D, #1.0 }
            v67 = _Q1;
            do
            {
              v76 = v47;
              v55.i64[0] = 0x7F0000007FLL;
              v55.i64[1] = 0x7F0000007FLL;
              v56 = vcvtq_f32_s32(vaddq_s32(v47, v55));
              v73 = vcvt_hight_f64_f32(v56);
              v74 = vcvtq_f64_f32(*(float32x2_t *)v56.f32);
              v57 = vmulq_f32(vaddq_f32(vabsq_f32(v56), v69), v68);
              v75 = vcvtq_f64_f32(*(float32x2_t *)v57.f32);
              __x = vcvt_hight_f64_f32(v57);
              v71 = exp(__x.f64[1]);
              v58.f64[0] = exp(__x.f64[0]);
              v58.f64[1] = v71;
              v72 = v58;
              __x.f64[0] = exp(v75.f64[1]);
              v59.f64[0] = exp(v75.f64[0]);
              v59.f64[1] = __x.f64[0];
              *(int16x4_t *)&v45[v46] = vmovn_s32(vcvtq_s32_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vdivq_f64(v74, vaddq_f64(v59, v67))), vdivq_f64(v73, vaddq_f64(v72, v67)))));
              v60.i64[0] = 0x400000004;
              v60.i64[1] = 0x400000004;
              v47 = vaddq_s32(v76, v60);
              v46 += 8;
            }
            while (v46 != 512);
            v61 = FIR1DFilter_Gaussian(*(_QWORD *)(a1 + 48), 8.0);
            *(_QWORD *)(a1 + 256) = v61;
            if (v61)
            {
              v62 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 48), 0x100004052888210uLL);
              *(_QWORD *)(a1 + 264) = v62;
              if (v62)
              {
                v63 = malloc_type_malloc((2 * *(_QWORD *)(a1 + 48)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
                *(_QWORD *)(a1 + 272) = v63;
                if (v63)
                {
                  v64 = malloc_type_malloc((2 * *(_QWORD *)(a1 + 48)) & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
                  *(_QWORD *)(a1 + 280) = v64;
                  if (v64)
                  {
                    v65 = malloc_type_malloc(4 * *(_QWORD *)(a1 + 48), 0x100004052888210uLL);
                    *(_QWORD *)(a1 + 40) = v65;
                    if (v65)
                      return 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_69:
  Stitcher_SceneCut_destructor_v2((void *)a1);
  if (Stitcher_SceneCut_constructor_v2(v4, v5, v7))
    return 0xFFFFFFFFLL;
  else
    return 4294967294;
}

void Stitcher_SceneCut_reset_v2(uint64_t a1)
{
  if (*(_DWORD *)(*(_QWORD *)(a1 + 336) + 4))
    bzero(*(void **)(a1 + 312), *(_QWORD *)(a1 + 64));
}

uint64_t Stitcher_SceneCut_SNRFactorUpdate_v2(uint64_t result, float a2)
{
  float v2;

  v2 = 1.0;
  if (a2 <= 20.0 && a2 > 0.0)
    v2 = (float)(a2 / 20.0) * (float)((float)(a2 / 20.0) * (float)(a2 / 20.0));
  *(float *)(result + 320) = v2;
  return result;
}

void Stitcher_SceneCut_ExposureRatioFactorUpdate_v2(uint64_t a1, float a2)
{
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;

  if (a2 == 0.0)
  {
    *(_BYTE *)(a1 + 332) = 0;
    *(_QWORD *)(a1 + 324) = 0x3F8000003F800000;
  }
  else
  {
    *(_BYTE *)(a1 + 332) = 1;
    v4 = *(float *)(a1 + 324);
    v5 = v4 > a2;
    v6 = v4 / a2;
    v7 = a2 / v4;
    if (v5)
      v7 = v6;
    v8 = pow(v7, 0.454545438);
    *(float *)(a1 + 328) = v8;
    *(float *)(a1 + 324) = a2;
  }
}

uint64_t Stitcher_SceneCut_minOverlapWidth_v2(uint64_t a1, float a2)
{
  float v4;
  BOOL v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;

  if (a2 == 0.0)
  {
    *(_BYTE *)(a1 + 332) = 0;
    *(_QWORD *)(a1 + 324) = 0x3F8000003F800000;
  }
  else
  {
    *(_BYTE *)(a1 + 332) = 1;
    v4 = *(float *)(a1 + 324);
    v5 = v4 > a2;
    v6 = v4 / a2;
    v7 = a2 / v4;
    if (v5)
      v7 = v6;
    v8 = pow(v7, 0.454545438);
    *(float *)(a1 + 328) = v8;
    *(float *)(a1 + 324) = a2;
  }
  v9 = 296;
  if (a2 == 0.0)
    v9 = 288;
  return *(_QWORD *)(a1 + v9);
}

uint64_t Stitcher_SceneCut_maxMinOverlapWidth_v2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 288) <= *(_QWORD *)(a1 + 296))
    return *(_QWORD *)(a1 + 296);
  else
    return *(_QWORD *)(a1 + 288);
}

uint64_t Stitcher_SceneCut_pasteImageToReference_v2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, float a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, vImagePixelCount a13, int a14)
{
  uint64_t v20;
  int v21;
  unint64_t v22;
  float v23;
  _DWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  double Current;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  float v46;
  float v47;
  float v48;
  double v49;
  CFAbsoluteTime v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v55[64];
  uint64_t v56;

  v20 = result;
  v56 = *MEMORY[0x24BDAC8D0];
  v21 = *(unsigned __int8 *)(result + 332);
  if (*(_BYTE *)(result + 332))
    v22 = *(_QWORD *)(result + 296);
  else
    v22 = *(_QWORD *)(result + 288);
  if (v22 <= a12)
  {
    v23 = 1.0;
    if (a5 <= 20.0 && a5 > 0.0)
      v23 = (float)(a5 / 20.0) * (float)((float)(a5 / 20.0) * (float)(a5 / 20.0));
    *(float *)(result + 320) = v23;
    v24 = *(_DWORD **)(result + 336);
    if (v24[2] || *v24)
    {
      if (v21)
        v25 = 64;
      else
        v25 = 16;
    }
    else
    {
      v25 = 8;
    }
    v26 = a12 - 2 * v25;
    if (v26 <= 0x10)
      v27 = a12 - 2 * v25;
    else
      v27 = v26 & 0xFFFFFFFFFFFFFFF0;
    Current = CFAbsoluteTimeGetCurrent();
    if (*(_DWORD *)(*(_QWORD *)(v20 + 336) + 4))
      Stitcher_SceneCut_calculateFlarePerRow_v2(v20, a7 + v25, (unsigned __int8 *)(a8 + v25), a9, v28, v27, a13);
    v30 = CFAbsoluteTimeGetCurrent();
    v31 = CFAbsoluteTimeGetCurrent();
    Stitcher_SceneCut_calculateCostImage_Yuv_v2((_QWORD *)v20, (unsigned __int8 *)(a2 + v25), (const char *)(a3 + v25), a4, v32, (unsigned __int8 *)(a7 + v25), (const char *)(a8 + v25), a9, v51, v27, a13);
    v33 = CFAbsoluteTimeGetCurrent();
    v34 = CFAbsoluteTimeGetCurrent();
    if (**(_DWORD **)(v20 + 336))
      FastFilter_execute(*(_QWORD *)(v20 + 104), *(_DWORD *)(v20 + 96), *(CVPixelBufferRef *)(v20 + 112), *(__CVBuffer **)(v20 + 112), 0, 0, v27, a13);
    v35 = v30 - Current;
    v36 = v33 - v31;
    v37 = CFAbsoluteTimeGetCurrent() - v34;
    v38 = CFAbsoluteTimeGetCurrent();
    Stitcher_SceneCut_findVerticalSeam_v2_NEON((_QWORD *)v20, v27, a13);
    v39 = CFAbsoluteTimeGetCurrent() - v38;
    v41 = CFAbsoluteTimeGetCurrent();
    v49 = v41;
    if (*(_DWORD *)(*(_QWORD *)(v20 + 336) + 8))
      Stitcher_SceneCut_blendToReferencePoisson_v2(v20, a2, a3, a4, v41, v42, v43, v44, v45, v46, v47, v48, v40, a7, a8, a9, v52, a11, v53,
        a13,
        v25);
    else
      Stitcher_SceneCut_blendToReference_v2(v20, a2, a3, a4, v40, a7, a8, a9, v52, a11, v53, a13);
    v50 = CFAbsoluteTimeGetCurrent() - v49;
    __sprintf_chk(v55, 0, 0x40uLL, "BlendingInfo%d", a14);
    return ACTLogMessageImp(1, "{%s|width:%d} {%s|height:%d} {%s|blendingMode:%d} {%s|blendingDefaults:%d} {%s|timeM2M:%.0f} {%s|SNR:%.2f} {%s|inSurfaceID:%d} {%s|outSurfaceID:%d} {%s|flare:%.0f} {%s|cost:%.0f} {%s|wideSceneCut:%.0f} {%s|seam:%.0f} {%s|blend:%.0f} \n", v55, a12, v55, a13, v55, 1, v55, *(_DWORD *)(*(_QWORD *)(v20 + 336) + 4)+ 2 * **(_DWORD **)(v20 + 336)+ 4 * *(_DWORD *)(*(_QWORD *)(v20 + 336) + 8), v55, *(double *)(v20 + 352) * 1000.0, v55, a5, v55,
             *(_DWORD *)(v20 + 360),
             v55,
             *(_DWORD *)(v20 + 364),
             v55,
             v35 * 1000.0,
             v55,
             v36 * 1000.0,
             v55,
             v37 * 1000.0,
             v55,
             v39 * 1000.0,
             v55,
             v50 * 1000.0);
  }
  return result;
}

_QWORD *ACTThreadCreate(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4)
{
  _WORD *v7;
  _QWORD *v8;
  const __CFNumber *Value;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CFDictionaryRef v15;
  int v16;
  int valuePtr;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x24BDAC8D0];
  v7 = malloc_type_malloc(0x30uLL, 0x10A00405C994BCAuLL);
  v8 = v7;
  if (v7)
  {
    v7[12] = 0;
    *(_QWORD *)v7 = 0;
    *((_QWORD *)v7 + 1) = 0;
    *((_QWORD *)v7 + 4) = a1;
    *((_QWORD *)v7 + 5) = a2;
    valuePtr = 64;
    if (a4)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a4, CFSTR("ACTThreadBufferRingSize"));
      if (Value)
        CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      v10 = (const __CFString *)CFDictionaryGetValue(a4, CFSTR("ACTThreadIdentifier"));
    }
    else
    {
      v10 = 0;
    }
    if (v10)
      v11 = v10;
    else
      v11 = CFSTR("com.act.thread");
    v12 = FigSimpleMutexCreate();
    v8[2] = v12;
    if (!v12)
      goto LABEL_14;
    v13 = FigSemaphoreCreate();
    v8[1] = v13;
    if (!v13)
      goto LABEL_14;
    v14 = (void *)*MEMORY[0x24BDC12F8];
    keys[0] = *(void **)MEMORY[0x24BDC1300];
    keys[1] = v14;
    values[0] = *(void **)MEMORY[0x24BDBD268];
    values[1] = (void *)v11;
    v15 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)values, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    *((_BYTE *)v8 + 24) = 1;
    v16 = FigThreadCreate();
    CFRelease(v15);
    if (!*v8 || v16)
    {
LABEL_14:
      FigSignalErrorAt3();
      ACTThreadRelease(v8);
      return 0;
    }
  }
  return v8;
}

uint64_t sub_227649590(uint64_t a1)
{
  while (*(_BYTE *)(a1 + 24))
  {
    *(_BYTE *)(a1 + 25) = 1;
    MEMORY[0x2276B4590](*(_QWORD *)(a1 + 16));
    (*(void (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
    MEMORY[0x2276B459C](*(_QWORD *)(a1 + 16));
    *(_BYTE *)(a1 + 25) = 0;
    FigSemaphoreWaitRelative();
  }
  return 0;
}

void ACTThreadRelease(_BYTE *a1)
{
  if (a1)
  {
    if (*(_QWORD *)a1)
    {
      a1[24] = 0;
      FigMemoryBarrier();
      FigSemaphoreSignal();
      FigThreadJoin();
    }
    if (*((_QWORD *)a1 + 2))
      FigSimpleMutexDestroy();
    if (*((_QWORD *)a1 + 1))
      FigSemaphoreDestroy();
    free(a1);
  }
}

uint64_t ACTThreadIsAlive(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

void ACTThreadMutexLock(uint64_t a1)
{
  *(_BYTE *)(a1 + 25) = 1;
  JUMPOUT(0x2276B4590);
}

uint64_t ACTThreadMutexUnlock(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x2276B459C](*(_QWORD *)(a1 + 16));
  *(_BYTE *)(a1 + 25) = 0;
  return result;
}

uint64_t ACTThreadIsLocked(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 25);
}

uint64_t ACTThreadWakeup()
{
  return FigSemaphoreSignal();
}

uint64_t ACTThreadWaitForSemaphore()
{
  return FigSemaphoreWaitRelative();
}

void sub_2276496AC()
{
  __assert_rtn("+[LKTFlowGPU _computeScalingFactor:dst_tex:scale_xy_inv:coeff:]", "LKTFlowGPU.m", 1247, "(dst_tex.width == src_tex.width) && (dst_tex.height == src_tex.height)");
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
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

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x24BDBBB98](allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, componentDesc);
  v3 = va_arg(va, _QWORD);
  return MEMORY[0x24BDBBBA0](calendar, v3, at);
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

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
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

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1F0](allocator, stream, streamLength, options, format, error);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

double CFStringGetDoubleValue(CFStringRef str)
{
  double result;

  MEMORY[0x24BDBC630](str);
  return result;
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x24BDBC690]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

OSStatus CMBufferQueueCreate(CFAllocatorRef allocator, CMItemCount capacity, const CMBufferCallbacks *callbacks, CMBufferQueueRef *queueOut)
{
  return MEMORY[0x24BDC0100](allocator, capacity, callbacks, queueOut);
}

CMBufferRef CMBufferQueueDequeueAndRetain(CMBufferQueueRef queue)
{
  return (CMBufferRef)MEMORY[0x24BDC0108](queue);
}

OSStatus CMBufferQueueEnqueue(CMBufferQueueRef queue, CMBufferRef buf)
{
  return MEMORY[0x24BDC0110](queue, buf);
}

CMItemCount CMBufferQueueGetBufferCount(CMBufferQueueRef queue)
{
  return MEMORY[0x24BDC0118](queue);
}

const CMBufferCallbacks *CMBufferQueueGetCallbacksForUnsortedSampleBuffers(void)
{
  return (const CMBufferCallbacks *)MEMORY[0x24BDC0128]();
}

OSStatus CMBufferQueueReset(CMBufferQueueRef queue)
{
  return MEMORY[0x24BDC0138](queue);
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return (CFTypeRef)MEMORY[0x24BDC01E0](target, key, attachmentModeOut);
}

uint64_t CMPhotoCompressionSessionAddDebugMetadata()
{
  return MEMORY[0x24BE11E78]();
}

uint64_t CMPhotoCompressionSessionAddImage()
{
  return MEMORY[0x24BE11E80]();
}

uint64_t CMPhotoCompressionSessionAddMetadataFromImageProperties()
{
  return MEMORY[0x24BE11E90]();
}

uint64_t CMPhotoCompressionSessionAddThumbnail()
{
  return MEMORY[0x24BE11E98]();
}

uint64_t CMPhotoCompressionSessionCloseContainerAndCopyBacking()
{
  return MEMORY[0x24BE11EB0]();
}

uint64_t CMPhotoCompressionSessionCreate()
{
  return MEMORY[0x24BE11EB8]();
}

uint64_t CMPhotoCompressionSessionOpenEmptyContainer()
{
  return MEMORY[0x24BE11EE0]();
}

void CMPropagateAttachments(CMAttachmentBearerRef source, CMAttachmentBearerRef destination)
{
  MEMORY[0x24BDC0258](source, destination);
}

void CMRemoveAttachment(CMAttachmentBearerRef target, CFStringRef key)
{
  MEMORY[0x24BDC0260](target, key);
}

OSStatus CMSampleBufferCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, Boolean dataReady, CMSampleBufferMakeDataReadyCallback makeDataReadyCallback, void *makeDataReadyRefcon, CMVideoFormatDescriptionRef formatDescription, const CMSampleTimingInfo *sampleTiming, CMSampleBufferRef *sampleBufferOut)
{
  return MEMORY[0x24BDC0290](allocator, imageBuffer, dataReady, makeDataReadyCallback, makeDataReadyRefcon, formatDescription, sampleTiming, sampleBufferOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x24BDC02E8](sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return (CMTime *)MEMORY[0x24BDC0320](retstr, sbuf);
}

CFTypeID CMSampleBufferGetTypeID(void)
{
  return MEMORY[0x24BDC0360]();
}

void CMSetAttachment(CMAttachmentBearerRef target, CFStringRef key, CFTypeRef value, CMAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC0380](target, key, value, *(_QWORD *)&attachmentMode);
}

OSStatus CMSimpleQueueCreate(CFAllocatorRef allocator, int32_t capacity, CMSimpleQueueRef *queueOut)
{
  return MEMORY[0x24BDC03A0](allocator, *(_QWORD *)&capacity, queueOut);
}

const void *__cdecl CMSimpleQueueDequeue(CMSimpleQueueRef queue)
{
  return (const void *)MEMORY[0x24BDC03B0](queue);
}

OSStatus CMSimpleQueueEnqueue(CMSimpleQueueRef queue, const void *element)
{
  return MEMORY[0x24BDC03B8](queue, element);
}

int32_t CMSimpleQueueGetCount(CMSimpleQueueRef queue)
{
  return MEMORY[0x24BDC03C8](queue);
}

OSStatus CMSimpleQueueReset(CMSimpleQueueRef queue)
{
  return MEMORY[0x24BDC03E0](queue);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

OSStatus CMVideoFormatDescriptionCreateForImageBuffer(CFAllocatorRef allocator, CVImageBufferRef imageBuffer, CMVideoFormatDescriptionRef *formatDescriptionOut)
{
  return MEMORY[0x24BDC0648](allocator, imageBuffer, formatDescriptionOut);
}

CFTypeRef CVBufferGetAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x24BDC5148](buffer, key, attachmentMode);
}

CFDictionaryRef CVBufferGetAttachments(CVBufferRef buffer, CVAttachmentMode attachmentMode)
{
  return (CFDictionaryRef)MEMORY[0x24BDC5150](buffer, *(_QWORD *)&attachmentMode);
}

void CVBufferPropagateAttachments(CVBufferRef sourceBuffer, CVBufferRef destinationBuffer)
{
  MEMORY[0x24BDC5160](sourceBuffer, destinationBuffer);
}

void CVBufferRemoveAttachment(CVBufferRef buffer, CFStringRef key)
{
  MEMORY[0x24BDC5170](buffer, key);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x24BDC5180](buffer, key, value, *(_QWORD *)&attachmentMode);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5248](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5278](pixelBuffer);
}

void *__cdecl CVPixelBufferGetBaseAddressOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDC5288](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC5290](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRowOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC5298](pixelBuffer, planeIndex);
}

size_t CVPixelBufferGetDataSize(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52A0](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52B0](pixelBuffer);
}

size_t CVPixelBufferGetHeightOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52B8](pixelBuffer, planeIndex);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C0](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D0](pixelBuffer);
}

size_t CVPixelBufferGetPlaneCount(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52D8](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x24BDC52E8](pixelBuffer);
}

size_t CVPixelBufferGetWidthOfPlane(CVPixelBufferRef pixelBuffer, size_t planeIndex)
{
  return MEMORY[0x24BDC52F0](pixelBuffer, planeIndex);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5308](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5318](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5320](allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5358](pixelBufferPool);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5398](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B0](pixelBuffer, unlockFlags);
}

uint64_t CreateSampleBuffer()
{
  return MEMORY[0x24BE119D8]();
}

uint64_t FigAspenCreateJPEGFromCVPixelBuffer()
{
  return MEMORY[0x24BE15868]();
}

uint64_t FigAspenCreateJPEGFromIOSurface()
{
  return MEMORY[0x24BE15870]();
}

uint64_t FigCFDictionaryCreateMutableCopy()
{
  return MEMORY[0x24BDC06B8]();
}

uint64_t FigCaptureGetModelSpecificName()
{
  return MEMORY[0x24BE10380]();
}

uint64_t FigCreateIOSurfaceBackedCVPixelBufferWithAttributes()
{
  return MEMORY[0x24BDF8FA8]();
}

uint64_t FigCreateIOSurfacePropertiesDictionary()
{
  return MEMORY[0x24BDF8FB0]();
}

uint64_t FigCreatePixelBufferAttributesWithIOSurfaceSupport()
{
  return MEMORY[0x24BDF8FB8]();
}

uint64_t FigGetUpTime()
{
  return MEMORY[0x24BDC08C8]();
}

uint64_t FigHostTimeToNanoseconds()
{
  return MEMORY[0x24BDC0940]();
}

uint64_t FigMemoryBarrier()
{
  return MEMORY[0x24BDC0958]();
}

uint64_t FigRegisterIOSurfacePixelTransferCapability()
{
  return MEMORY[0x24BDF8FC8]();
}

uint64_t FigSampleBufferProcessorCreateForCustom()
{
  return MEMORY[0x24BDDCE00]();
}

uint64_t FigSampleBufferProcessorGetClassID()
{
  return MEMORY[0x24BDDCE08]();
}

uint64_t FigSampleBufferProcessorGetFigBaseObject()
{
  return MEMORY[0x24BDDCE10]();
}

uint64_t FigSampleBufferRelease()
{
  return MEMORY[0x24BDC09B0]();
}

uint64_t FigSampleBufferRetain()
{
  return MEMORY[0x24BDC09B8]();
}

uint64_t FigSemaphoreCreate()
{
  return MEMORY[0x24BDC09C0]();
}

uint64_t FigSemaphoreDestroy()
{
  return MEMORY[0x24BDC09C8]();
}

uint64_t FigSemaphoreSignal()
{
  return MEMORY[0x24BDC09D0]();
}

uint64_t FigSemaphoreWaitRelative()
{
  return MEMORY[0x24BDC09D8]();
}

uint64_t FigSignalErrorAt3()
{
  return MEMORY[0x24BDC09E8]();
}

uint64_t FigSimpleMutexCreate()
{
  return MEMORY[0x24BDC09F8]();
}

uint64_t FigSimpleMutexDestroy()
{
  return MEMORY[0x24BDC0A00]();
}

uint64_t FigSimpleMutexLock()
{
  return MEMORY[0x24BDC0A08]();
}

uint64_t FigSimpleMutexUnlock()
{
  return MEMORY[0x24BDC0A10]();
}

uint64_t FigThreadCreate()
{
  return MEMORY[0x24BDC0A68]();
}

uint64_t FigThreadJoin()
{
  return MEMORY[0x24BDC0A78]();
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x24BDD8BA8](buffer, planeIndex);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8BE0](buffer, planeIndex);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8C58](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C80](buffer);
}

size_t IOSurfaceGetPlaneCount(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C88](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

size_t IOSurfaceGetWidthOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x24BDD8CE0](buffer, planeIndex);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  MEMORY[0x24BDD8DB8](buffer, key, value);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x24BDDD1E0]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x24BDDD388]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t VTImageRotationSessionCreate()
{
  return MEMORY[0x24BDF90E0]();
}

uint64_t VTImageRotationSessionInvalidate()
{
  return MEMORY[0x24BDF90E8]();
}

uint64_t VTImageRotationSessionRelease()
{
  return MEMORY[0x24BDF90F0]();
}

uint64_t VTImageRotationSessionSetProperty()
{
  return MEMORY[0x24BDF90F8]();
}

uint64_t VTImageRotationSessionTransferSubImage()
{
  return MEMORY[0x24BDF9108]();
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x24BDF9168](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x24BDF9170](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x24BDF9178](session, sourceBuffer, destinationBuffer);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x24BDAC820]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x24BDAC898](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_set_filetype()
{
  return MEMORY[0x24BEDA398]();
}

uint64_t archive_entry_set_mtime()
{
  return MEMORY[0x24BEDA3B8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x24BEDA3D8]();
}

uint64_t archive_entry_set_size()
{
  return MEMORY[0x24BEDA3E0]();
}

uint64_t archive_errno()
{
  return MEMORY[0x24BEDA428]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_position_compressed()
{
  return MEMORY[0x24BEDA440]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x24BEDA580]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_finish()
{
  return MEMORY[0x24BEDA5B0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_compression_none()
{
  return MEMORY[0x24BEDA610]();
}

uint64_t archive_write_set_format_ar_bsd()
{
  return MEMORY[0x24BEDA630]();
}

int atoi(const char *a1)
{
  return MEMORY[0x24BDAD258](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x24BDAE350](a1);
}

int fgetpos(FILE *a1, fpos_t *a2)
{
  return MEMORY[0x24BDAE378](a1, a2);
}

uint64_t fig_log_call_emit_and_clean_up_after_send_and_compose()
{
  return MEMORY[0x24BDC0B20]();
}

uint64_t fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type()
{
  return MEMORY[0x24BDC0B28]();
}

uint64_t fig_log_get_emitter()
{
  return MEMORY[0x24BDC0B30]();
}

uint64_t fig_note_initialize_category_with_default_work()
{
  return MEMORY[0x24BDC0B38]();
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x24BDAE440](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

float logf(float a1)
{
  float result;

  MEMORY[0x24BDAEAF8](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint64_t noiseReductionContextCreateWithOptions()
{
  return MEMORY[0x24BE11938]();
}

uint64_t noiseReductionContextDestroy()
{
  return MEMORY[0x24BE11940]();
}

uint64_t noiseReductionInOutWithTuningOptions()
{
  return MEMORY[0x24BE11948]();
}

uint64_t noiseReductionWithTuningOptions()
{
  return MEMORY[0x24BE11950]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x24BDAF698](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

void rewind(FILE *a1)
{
  MEMORY[0x24BDAFB98](a1);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFE60](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFEE0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x24BDAFFC8](__s1, __s2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
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

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
  MEMORY[0x24BDB3198](__A, __IA, __F, __IF, __C, __IC, __N, __P);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB31D0](__A, __IA, __B, __IB, __C, __N);
}

void vDSP_sve_svesq(const float *__A, vDSP_Stride __IA, float *__Sum, float *__SumOfSquares, vDSP_Length __N)
{
  MEMORY[0x24BDB32E0](__A, __IA, __Sum, __SumOfSquares, __N);
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32F0](__A, __IA, __C, __N);
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB32F8](__A, __IA, __C, __IC, __N);
}

void vDSP_vflt32(const int *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB33A8](__A, __IA, __C, __IC, __N);
}

void vDSP_vramp(const float *__A, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3458](__A, __B, __C, __IC, __N);
}

void vDSP_vsbsm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34B8](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vsmsa(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB34E0](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3530](__B, __IB, __A, __IA, __C, __IC, __N);
}

vImage_Error vImageBoxConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, uint32_t kernel_height, uint32_t kernel_width, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3618](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width, backgroundColor);
}

vImage_Error vImageConvolve_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, const Pixel_8888 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3890](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width);
}

vImage_Error vImageConvolve_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, void *tempBuffer, vImagePixelCount srcOffsetToROI_X, vImagePixelCount srcOffsetToROI_Y, const int16_t *kernel, uint32_t kernel_height, uint32_t kernel_width, int32_t divisor, Pixel_8 backgroundColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB3898](src, dest, tempBuffer, srcOffsetToROI_X, srcOffsetToROI_Y, kernel, *(_QWORD *)&kernel_height, *(_QWORD *)&kernel_width);
}

vImage_Error vImageHorizontalReflect_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB38F0](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageHorizontalReflect_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x24BDB38F8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar16U(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_16U backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39B8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

vImage_Error vImageRotate90_Planar8(const vImage_Buffer *src, const vImage_Buffer *dest, uint8_t rotationConstant, Pixel_8 backColor, vImage_Flags flags)
{
  return MEMORY[0x24BDB39C8](src, dest, rotationConstant, backColor, *(_QWORD *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

