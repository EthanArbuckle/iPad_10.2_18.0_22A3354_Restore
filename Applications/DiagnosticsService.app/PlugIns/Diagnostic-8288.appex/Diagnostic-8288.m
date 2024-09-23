float CalcRotationMatrix(double a1, double a2, double a3, simd_float4x3 *a4)
{
  __double2 v7;
  __double2 v8;
  float64x2_t v9;
  float sinval;
  __double2 v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  float v16;
  float result;

  v7 = __sincos_stret(a2);
  v8 = __sincos_stret(a3);
  v9.f64[0] = v8.__cosval;
  v9.f64[1] = v8.__sinval;
  sinval = v7.__sinval;
  a4->columns[0].f32[2] = -sinval;
  *(float32x2_t *)a4->columns[0].f32 = vcvt_f32_f64(vmulq_n_f64(v9, v7.__cosval));
  v11 = __sincos_stret(a1);
  *(float *)&v12 = v11.__sinval * v8.__cosval * v7.__sinval - v11.__cosval * v8.__sinval;
  v13 = v11.__sinval * v7.__sinval * v8.__sinval + v11.__cosval * v8.__cosval;
  v14 = v11.__sinval * v7.__cosval;
  *((float *)&v12 + 1) = v13;
  a4->columns[1].f32[2] = v14;
  a4->columns[1].i64[0] = v12;
  *(float *)&v15 = v11.__cosval * v7.__sinval * v8.__cosval + v11.__sinval * v8.__sinval;
  v16 = v11.__cosval * v7.__sinval * v8.__sinval - v11.__sinval * v8.__cosval;
  *((float *)&v15 + 1) = v16;
  result = v11.__cosval * v7.__cosval;
  a4->columns[2].f32[2] = result;
  a4->columns[2].i64[0] = v15;
  return result;
}

float CalcRotationAngleFromMatrix(uint64_t a1, __int128 *a2)
{
  float v4;
  float v5;
  uint64_t v6;
  float result;
  __int128 v8;
  float v9;
  uint64_t v10;

  v4 = atan2f(*(float *)(a1 + 24), *(float *)(a1 + 40));
  v8 = *a2;
  v9 = v4 * 1000.0;
  *(float *)a2 = v4 * 1000.0;
  v5 = atan2f(-*(float *)(a1 + 8), sqrtf((float)(*(float *)(a1 + 40) * *(float *)(a1 + 40)) + (float)(*(float *)(a1 + 24) * *(float *)(a1 + 24))));
  *(float *)&v6 = v9;
  *((float *)&v6 + 1) = v5 * 1000.0;
  v10 = v6;
  *((_DWORD *)a2 + 2) = DWORD2(v8);
  *(_QWORD *)a2 = v6;
  result = atan2f(COERCE_FLOAT(HIDWORD(*(_QWORD *)a1)), COERCE_FLOAT(*(_OWORD *)a1)) * 1000.0;
  *(_QWORD *)a2 = v10;
  *((float *)a2 + 2) = result;
  return result;
}

float Simd4x3ToMatrix(simd_float4x3 *a1, float (*a2)[3], float *a3)
{
  uint64_t i;
  uint64_t v4;
  float (*v5)[3];
  float result;

  for (i = 0; i != 3; ++i)
  {
    v4 = 0;
    v5 = a2;
    do
      *(_DWORD *)v5++ = a1->columns[i].i32[v4++ & 3];
    while (v4 != 3);
    a2 = (float (*)[3])((char *)a2 + 4);
  }
  *(_QWORD *)a3 = a1->columns[3].i64[0];
  result = a1->columns[3].f32[2];
  a3[2] = result;
  return result;
}

__CFString *ConvertDataToHexString(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  const __CFAllocator *Default;
  __CFString *i;
  unsigned int v6;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  Default = CFAllocatorGetDefault();
  for (i = CFStringCreateMutable(Default, 0); Length; --Length)
  {
    v6 = *BytePtr++;
    CFStringAppendFormat(i, 0, CFSTR("%02X"), v6);
  }
  return i;
}

uint64_t HxISPCaptureDeviceController::FindGroup(HxISPCaptureDeviceController *this, unsigned int a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  char *v7;
  uint64_t FigBaseObject;
  unsigned int (*v9)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v10;
  CFArrayRef theArray;
  CFRange v13;

  if (!*((_DWORD *)this + 536))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
  v6 = (const void **)((char *)this + 8 * a2 + 16);
  v7 = (char *)this + 2080;
  do
  {
    theArray = 0;
    FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v7[8 * v3]);
    v9 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                             + 48);
    if (!v9 || v9(FigBaseObject, v5, kCFAllocatorDefault, &theArray))
      break;
    v10 = theArray;
    v13.length = CFArrayGetCount(theArray);
    v13.location = 0;
    if (CFArrayContainsValue(v10, v13, *v6))
      v4 = *(_QWORD *)&v7[8 * v3];
    CFRelease(theArray);
    ++v3;
  }
  while (v3 < *((unsigned int *)this + 536));
  return v4;
}

void HxISPCaptureDeviceController::HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  for (i = 296; i != 2280; i += 248)
    *((_BYTE *)this + i) = 0;
  v3 = 0;
  v4 = 0;
  *((_DWORD *)this + 538) = -1;
  *((_QWORD *)this + 259) = 0;
  *((_DWORD *)this + 536) = 0;
  *((_BYTE *)this + 2148) = 0;
  *((_DWORD *)this + 516) = 0;
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  do
  {
    v5 = (char *)this + 8 * v4;
    *((_QWORD *)v5 + 2) = 0;
    *((_QWORD *)v5 + 260) = 0;
    v6 = (char *)this + v3;
    pthread_mutex_init((pthread_mutex_t *)((char *)this + v3 + 96), 0);
    pthread_cond_init((pthread_cond_t *)((char *)this + v3 + 160), 0);
    *((_WORD *)v6 + 136) = 0;
    *((_QWORD *)v6 + 33) = 0;
    *((_DWORD *)v6 + 52) = 0;
    *(_OWORD *)(v6 + 216) = 0u;
    *(_OWORD *)(v6 + 232) = 0u;
    *(_OWORD *)(v6 + 241) = 0u;
    *((_QWORD *)v6 + 10) = this;
    *((_DWORD *)v6 + 22) = v4;
    *(_QWORD *)(v6 + 276) = 0xFFFFLL;
    *((_QWORD *)v6 + 36) = 0;
    ++v4;
    v3 += 248;
    *((_WORD *)v6 + 142) = 0;
  }
  while (v3 != 1984);
}

void HxISPCaptureDeviceController::~HxISPCaptureDeviceController(HxISPCaptureDeviceController *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 0;
  v3 = 256;
  do
  {
    if (*((_BYTE *)this + v3))
      HxISPCaptureDeviceController::stopReceive(this, v2);
    ++v2;
    v3 += 248;
  }
  while (v2 != 8);
  if (*((_BYTE *)this + 2148))
    HxISPCaptureDeviceController::deactivate(this);
  v4 = -1984;
  do
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)this + v4 + 2144));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + v4 + 2080));
    v4 += 248;
  }
  while (v4);
}

uint64_t HxISPCaptureDeviceController::stopReceive(HxISPCaptureDeviceController *this, unsigned int a2)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  char *v7;
  opaqueCMBufferQueue *v8;
  CMBufferQueueRef *v9;
  opaqueCMBufferQueue *v10;
  CMBufferRef v11;
  char *v12;
  opaqueCMBufferQueue *i;
  opaqueCMBufferQueue **v14;
  opaqueCMBufferQueue *v15;
  CMBufferRef v16;
  char *v17;
  pthread_t *v18;
  char *v19;
  pthread_mutex_t *v20;
  int j;
  int *v22;
  int v23;
  char *v24;
  void *v26;

  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    if (*((_DWORD *)this + 516) <= a2)
    {
      v6 = 3758097084;
      printf("Error: HxISPCaptureDeviceController::stopReceive - Invalid streamIndex %d\n", a2);
    }
    else
    {
      *((_BYTE *)this + 248 * a2 + 272) = 1;
      v4 = *((_QWORD *)this + a2 + 2);
      v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(v4) + 16) + 16);
      if (v5)
        v6 = v5(v4);
      else
        v6 = 4294954514;
      v7 = (char *)this + 248 * a2;
      v10 = (opaqueCMBufferQueue *)*((_QWORD *)v7 + 27);
      v9 = (CMBufferQueueRef *)(v7 + 216);
      v8 = v10;
      if (v10)
      {
        CMBufferQueueRemoveTrigger(v8, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
        while (1)
        {
          v11 = CMBufferQueueDequeueAndRetain(*v9);
          if (!v11)
            break;
          CFRelease(v11);
        }
        v12 = (char *)this + 248 * a2;
        v15 = (opaqueCMBufferQueue *)*((_QWORD *)v12 + 29);
        v14 = (opaqueCMBufferQueue **)(v12 + 232);
        for (i = v15; ; i = *v14)
        {
          v16 = CMBufferQueueDequeueAndRetain(i);
          if (!v16)
            break;
          CFRelease(v16);
        }
      }
      v17 = (char *)this + 248 * a2;
      if (*((_QWORD *)v17 + 33))
      {
        v18 = (pthread_t *)(v17 + 264);
        v19 = (char *)this + 248 * a2;
        v20 = (pthread_mutex_t *)(v19 + 96);
        pthread_mutex_lock((pthread_mutex_t *)(v19 + 96));
        v23 = *((_DWORD *)v19 + 52);
        v22 = (int *)(v19 + 208);
        for (j = v23; j == 1; j = *v22)
        {
          pthread_mutex_unlock(v20);
          usleep(0x2710u);
          pthread_mutex_lock(v20);
        }
        v26 = 0;
        *v22 = 2;
        pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
        pthread_mutex_unlock(v20);
        pthread_join(*v18, &v26);
        *v18 = 0;
      }
      v24 = (char *)this + 248 * a2;
      *((_QWORD *)v24 + 30) = 0;
      *((_QWORD *)v24 + 31) = 0;
      v24[256] = 0;
    }
  }
  else
  {
    v6 = 3758097084;
    puts("Error: HxISPCaptureDeviceController::startReceive - not already streaming");
  }
  return v6;
}

void sub_10000229C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t HxISPCaptureDeviceController::deactivate(HxISPCaptureDeviceController *this)
{
  uint64_t i;
  uint64_t DefaultLocalCenter;
  uint64_t j;
  const void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  const void *v11;
  const void *v12;
  uint64_t FigBaseObject;
  uint64_t v14;
  void (*v15)(uint64_t);

  if (*((_BYTE *)this + 2148))
  {
    for (i = 16; i != 80; i += 8)
    {
      if (*(_QWORD *)((char *)this + i))
      {
        DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterRemoveListener(DefaultLocalCenter, this, 0, 0, *(_QWORD *)((char *)this + i));
      }
    }
    for (j = 0; j != 1984; j += 248)
    {
      v5 = *(const void **)((char *)this + j + 216);
      if (v5)
        CFRelease(v5);
      v6 = *(const void **)((char *)this + j + 232);
      if (v6)
        CFRelease(v6);
    }
    v7 = 0;
    v8 = -1984;
    do
    {
      v9 = (char *)this + v7;
      *((_QWORD *)v9 + 2) = 0;
      *((_QWORD *)v9 + 260) = 0;
      v10 = (char *)this + v8;
      pthread_mutex_init((pthread_mutex_t *)((char *)this + v8 + 2080), 0);
      pthread_cond_init((pthread_cond_t *)((char *)this + v8 + 2144), 0);
      *((_WORD *)v10 + 1128) = 0;
      *((_QWORD *)v10 + 281) = 0;
      *((_DWORD *)v10 + 548) = 0;
      *(_OWORD *)(v10 + 2200) = 0u;
      *(_OWORD *)(v10 + 2216) = 0u;
      *(_OWORD *)(v10 + 2225) = 0u;
      *((_QWORD *)v10 + 258) = this;
      v7 += 8;
      *((_DWORD *)v10 + 518) = 0;
      v8 += 248;
    }
    while (v8);
    v11 = (const void *)*((_QWORD *)this + 259);
    if (v11)
      CFRelease(v11);
    v12 = (const void *)*((_QWORD *)this + 1);
    if (v12)
      CFRelease(v12);
    if (*(_QWORD *)this)
    {
      FigBaseObject = FigCaptureDeviceGetFigBaseObject();
      if (FigBaseObject)
      {
        v14 = FigBaseObject;
        v15 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 24);
        if (v15)
          v15(v14);
      }
      CFRelease(*(CFTypeRef *)this);
    }
    *((_BYTE *)this + 2148) = 0;
    *((_DWORD *)this + 516) = 0;
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  return 0xFFFFFFFFLL;
}

uint64_t HxISPCaptureDeviceController::activate(HxISPCaptureDeviceController *this)
{
  uint64_t v1;
  const void *v3;
  int *v4;
  unint64_t v5;
  const __CFDictionary *v6;
  const char *v7;
  uint64_t FigBaseObject;
  uint64_t (*v10)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int Count;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t DefaultLocalCenter;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  unsigned int v20;
  int v21;
  unint64_t v22;
  const void *v23;

  v1 = 0xFFFFFFFFLL;
  if (*((_BYTE *)this + 2148))
    return v1;
  *((_DWORD *)this + 538) = -1;
  v23 = 0;
  v1 = sub_100003F88("/System/Library/MediaCapture/VirtualCameraDevice.mediacapture", "FigVirtualCameraDeviceCreate", (uint64_t)&v23);
  if (v23)
  {
    fprintf(__stderrp, "+++ Found and loaded %s\n", "/System/Library/MediaCapture/VirtualCameraDevice.mediacapture");
    v3 = v23;
    if (v23)
    {
LABEL_13:
      *(_QWORD *)this = v3;
      goto LABEL_14;
    }
  }
  v4 = &dword_100014A68;
  v5 = 1;
  do
  {
    v6 = IOServiceMatching(*((const char **)v4 - 3));
    if (IOServiceGetMatchingService(kIOMainPortDefault, v6))
    {
      v7 = (const char *)*((_QWORD *)v4 - 2);
      v1 = sub_100003F88(v7, *((const char **)v4 - 1), (uint64_t)&v23);
      if (!v23)
      {
        v3 = 0;
        goto LABEL_10;
      }
      fprintf(__stderrp, "+++ Found and loaded  %s\n", v7);
      *((_DWORD *)this + 538) = *v4;
    }
    v3 = v23;
LABEL_10:
    if (v5 > 4)
      break;
    ++v5;
    v4 += 8;
  }
  while (!v3);
  if (this)
    goto LABEL_13;
  if (v3)
    CFRelease(v3);
LABEL_14:
  if ((_DWORD)v1 || !*(_QWORD *)this)
  {
    puts("HxISPCaptureDeviceController::activate - Error: Could not create CaptureDevice");
  }
  else
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v10 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 48);
    if (!v10)
      return 4294954514;
    v1 = v10(FigBaseObject, kFigCaptureDeviceProperty_StreamArray, kCFAllocatorDefault, (char *)this + 8);
    if ((_DWORD)v1)
      return v1;
    Count = CFArrayGetCount(*((CFArrayRef *)this + 1));
    if (Count >= 8)
      v12 = 8;
    else
      v12 = Count;
    *((_DWORD *)this + 516) = v12;
    if (v12)
    {
      v13 = 0;
      do
      {
        *((_QWORD *)this + v13 + 2) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 1), v13);
        ++v13;
        v14 = *((unsigned int *)this + 516);
      }
      while (v13 < v14);
      if ((_DWORD)v14)
      {
        v15 = 0;
        do
        {
          v16 = (char *)this + 8 * v15;
          if (*((_QWORD *)v16 + 2))
          {
            DefaultLocalCenter = CMNotificationCenterGetDefaultLocalCenter();
            CMNotificationCenterAddListener(DefaultLocalCenter, this, sub_1000026D4, 0, *((_QWORD *)v16 + 2), 0);
          }
          else
          {
            printf("HxISPCaptureDeviceController::activate - CaptureStream %d not found\n", v15);
          }
          ++v15;
        }
        while (v15 < *((unsigned int *)this + 516));
      }
    }
    v18 = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v19 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v18)
                                                                                              + 8)
                                                                                  + 48);
    if (!v19)
      return 4294954514;
    v1 = v19(v18, kFigCaptureDeviceProperty_SupportedSynchronizedStreamsGroups, kCFAllocatorDefault, (char *)this + 2072);
    if (!(_DWORD)v1)
    {
      v20 = CFArrayGetCount(*((CFArrayRef *)this + 259));
      if (v20 >= 8)
        v21 = 8;
      else
        v21 = v20;
      *((_DWORD *)this + 536) = v21;
      if (v21)
      {
        v22 = 0;
        do
        {
          *((_QWORD *)this + v22 + 260) = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 259), v22);
          ++v22;
        }
        while (v22 < *((unsigned int *)this + 536));
      }
      v1 = 0;
      *((_BYTE *)this + 2148) = 1;
    }
  }
  return v1;
}

size_t sub_1000026D4(int a1, uint64_t a2, const __CFString *a3, CFTypeRef cf1)
{
  unint64_t v7;
  unsigned int v8;
  size_t result;
  FILE *v10;
  const char *CStringPtr;

  if (!a2 || !cf1)
    return fwrite("Diagnostic_FW Device controller recievd null notification info objects\n", 0x47uLL, 1uLL, __stdoutp);
  if (*(_DWORD *)(a2 + 2064))
  {
    v7 = 0;
    do
    {
      if (CFEqual(cf1, *(CFTypeRef *)(a2 + 16 + 8 * v7)))
        break;
      ++v7;
    }
    while (v7 < *(unsigned int *)(a2 + 2064));
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v10 = __stdoutp;
  CStringPtr = CFStringGetCStringPtr(a3, 0);
  fprintf(v10, "HxISPCaptureDeviceController::handleStreamNotification: %s (streamIndex %d)\n", CStringPtr, v8);
  fflush(__stdoutp);
  result = CFEqual(a3, kFigCaptureStreamNotification_StreamControlTakenByAnotherClient);
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a2 + 248 * v8 + 256))
      return HxISPCaptureDeviceController::stopReceive((HxISPCaptureDeviceController *)a2, v8);
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::RequestStreams(HxISPCaptureDeviceController *this, const __CFArray *a2, const __CFDictionary *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v7)(uint64_t, const __CFArray *, const __CFDictionary *);

  if (!a2)
    return 4294954516;
  v5 = *(_QWORD *)this;
  v6 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v6 >= 2uLL && (v7 = (uint64_t (*)(uint64_t, const __CFArray *, const __CFDictionary *))v6[2]) != 0)
    return v7(v5, a2, a3);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::RelinquishStreams(HxISPCaptureDeviceController *this, const __CFArray *a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, const __CFArray *, _QWORD);

  if (!a2)
    return 4294954516;
  v3 = *(_QWORD *)this;
  v4 = *(_QWORD **)(CMBaseObjectGetVTable(*(_QWORD *)this) + 16);
  if (*v4 >= 2uLL && (v5 = (uint64_t (*)(uint64_t, const __CFArray *, _QWORD))v4[3]) != 0)
    return v5(v3, a2, 0);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::startReceive(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(opaqueCMSampleBuffer *, unsigned int, void *), void *a4)
{
  char *v5;
  uint64_t v6;
  char *v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t FigBaseObject;
  unsigned int (*v14)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  char *v15;
  CMBufferQueueRef *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  opaqueCMBufferQueue *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *);
  uint64_t v25;
  uint64_t (*v26)(uint64_t, _QWORD, const CFAllocatorRef, char *);
  _BYTE *v27;
  char *v28;
  pthread_mutex_t *v29;
  char *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  CMTime time;
  CFTypeRef obj;
  pthread_attr_t v35;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v5 = (char *)this + 248 * a2;
  if (v5[256])
  {
    printf("Error: HxISPCaptureDeviceController::startReceive - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v9 = (char *)this + 248 * a2;
  *((_QWORD *)v9 + 30) = a3;
  *((_QWORD *)v9 + 31) = a4;
  obj = 0;
  v10 = (char *)this + 8 * a2;
  v12 = *((_QWORD *)v10 + 2);
  v11 = v10 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v12);
  v14 = *(unsigned int (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                          + 48);
  if (v14 && !v14(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj))
  {
    CFShow(obj);
    CFRelease(obj);
    obj = 0;
  }
  v15 = (char *)this + 248 * a2;
  v17 = *((_QWORD *)v15 + 27);
  v16 = (CMBufferQueueRef *)(v15 + 216);
  if (!v17)
  {
    v23 = FigCaptureStreamGetFigBaseObject(*v11);
    v24 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CMBufferQueueRef *))(*(_QWORD *)(CMBaseObjectGetVTable(v23) + 8)
                                                                                              + 48);
    if (!v24)
      return 4294954514;
    v6 = v24(v23, kFigCaptureStreamProperty_BufferQueue, kCFAllocatorDefault, v16);
    if ((_DWORD)v6)
      return v6;
  }
  v18 = (char *)this + 248 * a2;
  v20 = *((_QWORD *)v18 + 29);
  v19 = v18 + 232;
  if (!v20)
  {
    v25 = FigCaptureStreamGetFigBaseObject(*v11);
    v26 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, char *))(*(_QWORD *)(CMBaseObjectGetVTable(v25)
                                                                                              + 8)
                                                                                  + 48);
    if (v26)
    {
      v6 = v26(v25, kFigCaptureStreamProperty_StillImageBufferQueue, kCFAllocatorDefault, v19);
      if ((_DWORD)v6)
        return v6;
      goto LABEL_14;
    }
    return 4294954514;
  }
LABEL_14:
  v21 = v5 + 80;
  v22 = *v16;
  time = kCMTimeZero;
  if (CMBufferQueueInstallTrigger(v22, (CMBufferQueueTriggerCallback)sub_100002C38, v5 + 80, 7, &time, (CMBufferQueueTriggerToken *)this + 31 * a2 + 28))
  {
    return 3758097084;
  }
  v27 = v5 + 256;
  v28 = (char *)this + 248 * a2;
  v29 = (pthread_mutex_t *)(v28 + 96);
  pthread_mutex_lock((pthread_mutex_t *)(v28 + 96));
  *((_DWORD *)v28 + 52) = 0;
  v30 = v28 + 208;
  v30[64] = 0;
  pthread_attr_init(&v35);
  pthread_attr_setdetachstate(&v35, 1);
  pthread_create((pthread_t *)v30 + 7, &v35, (void *(__cdecl *)(void *))sub_100002C94, v21);
  pthread_attr_destroy(&v35);
  pthread_mutex_unlock(v29);
  v31 = *v11;
  v32 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v11) + 16) + 8);
  if (v32)
  {
    v6 = v32(v31);
    if (!(_DWORD)v6)
    {
      v6 = 0;
      *v27 = 1;
      return v6;
    }
  }
  else
  {
    v6 = 4294954514;
  }
  CMBufferQueueRemoveTrigger(*v16, *((CMBufferQueueTriggerToken *)this + 31 * a2 + 28));
  while (1)
  {
    usleep(0x2710u);
    v35.__sig = 0;
    pthread_mutex_lock(v29);
    if (*(_DWORD *)v30 != 1)
      break;
    pthread_mutex_unlock(v29);
  }
  *(_DWORD *)v30 = 2;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 248 * a2 + 160));
  pthread_mutex_unlock(v29);
  pthread_join(*((pthread_t *)v30 + 7), (void **)&v35);
  *v27 = 0;
  return v6;
}

uint64_t sub_100002C38(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 192))
  {
    v1 = result;
    if (*(_DWORD *)(result + 128) != 1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(result + 16));
      *(_DWORD *)(v1 + 128) = 1;
      pthread_cond_signal((pthread_cond_t *)(v1 + 80));
      return pthread_mutex_unlock((pthread_mutex_t *)(v1 + 16));
    }
  }
  return result;
}

uint64_t sub_100002C94(uint64_t a1)
{
  const char *v2;
  CMBufferRef v3;
  CMBufferRef v4;
  void (*v5)(CMBufferRef, _QWORD, _QWORD);

  if (*(_DWORD *)(a1 + 8))
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread1";
  else
    v2 = "HxISPCaptureDeviceStreamFrameReceiveThread0";
  pthread_setname_np(v2);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  while (1)
  {
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    if (*(_DWORD *)(a1 + 128) == 2)
      break;
    v3 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
    if (v3)
    {
      v4 = v3;
      do
      {
        v5 = *(void (**)(CMBufferRef, _QWORD, _QWORD))(a1 + 160);
        if (v5)
          v5(v4, *(unsigned int *)(a1 + 8), *(_QWORD *)(a1 + 168));
        CFRelease(v4);
        v4 = CMBufferQueueDequeueAndRetain(*(CMBufferQueueRef *)(a1 + 136));
      }
      while (v4);
    }
    *(_DWORD *)(a1 + 128) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(HxISPCaptureDeviceController *this, unsigned int a2, void (*a3)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a4, void (*a5)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a6, void (*a7)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a8, void (*a9)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a10, void (*a11)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a12, void (*a13)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a14, void (*a15)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a16, void (*a17)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a18, void (*a19)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *), void *a20,void (*a21)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *),void *a22)
{
  uint64_t result;
  uint64_t v31;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v33;
  __CFDictionary *v34;
  __CFDictionary *v35;
  __CFDictionary *v36;
  __CFDictionary *v37;
  __CFDictionary *v38;
  __CFDictionary *v39;
  __CFDictionary *v40;
  __CFDictionary *v41;
  __CFDictionary *v42;
  __CFDictionary *v43;
  __CFDictionary *v44;
  __CFDictionary *v45;
  __CFDictionary *v46;
  __CFDictionary *v47;
  __CFDictionary *v48;
  __CFDictionary *v49;
  __CFDictionary *v50;
  __CFDictionary *v51;
  __CFDictionary *v52;
  __CFDictionary *v53;
  int v54;
  char *v55;
  char *v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t FigBaseObject;
  uint64_t (*v60)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *);
  uint64_t v61;
  uint64_t (*v62)(uint64_t);
  char *v63;
  CFTypeRef obj;
  _QWORD v65[6];
  unsigned int v66;
  _QWORD v67[6];
  unsigned int v68;
  _QWORD v69[6];
  unsigned int v70;
  _QWORD v71[6];
  unsigned int v72;
  _QWORD v73[6];
  unsigned int v74;
  _QWORD v75[6];
  unsigned int v76;
  _QWORD v77[6];
  unsigned int v78;
  _QWORD v79[6];
  unsigned int v80;
  _QWORD v81[6];
  unsigned int v82;
  _QWORD value[6];
  unsigned int v84;

  if (!*((_BYTE *)this + 2148))
  {
    puts("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - Invalid streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  if (*((_BYTE *)this + 248 * a2 + 256))
  {
    printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - already streaming on streamIndex %d\n");
    return 0xFFFFFFFFLL;
  }
  v63 = (char *)this + 248 * a2;
  v31 = a2;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v33 = Mutable;
    v34 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v34)
    {
      v35 = v34;
      value[0] = _NSConcreteStackBlock;
      value[1] = 0x40000000;
      value[2] = sub_100003598;
      value[3] = &unk_100014670;
      v84 = a2;
      value[4] = a3;
      value[5] = a4;
      CFDictionarySetValue(v34, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, value);
      CFDictionarySetValue(v35, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000146B0);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PrimaryScaler, v35);
      CFRelease(v35);
    }
    v36 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v36)
    {
      v37 = v36;
      v81[0] = _NSConcreteStackBlock;
      v81[1] = 0x40000000;
      v81[2] = sub_100003608;
      v81[3] = &unk_1000146D0;
      v82 = a2;
      v81[4] = a5;
      v81[5] = a6;
      CFDictionarySetValue(v36, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v81);
      CFDictionarySetValue(v37, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014710);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_SecondaryScaler, v37);
      CFRelease(v37);
    }
    v38 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (v38)
    {
      v39 = v38;
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 0x40000000;
      v79[2] = sub_100003678;
      v79[3] = &unk_100014730;
      v80 = a2;
      v79[4] = a7;
      v79[5] = a8;
      CFDictionarySetValue(v38, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v79);
      CFDictionarySetValue(v39, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014770);
      CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_IntermediateTap, v39);
      CFRelease(v39);
    }
    if (a9)
    {
      v40 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v40)
      {
        v41 = v40;
        v77[0] = _NSConcreteStackBlock;
        v77[1] = 0x40000000;
        v77[2] = sub_1000036E8;
        v77[3] = &unk_100014790;
        v78 = a2;
        v77[4] = a9;
        v77[5] = a10;
        CFDictionarySetValue(v40, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v77);
        CFDictionarySetValue(v41, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000147D0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImage, v41);
        CFRelease(v41);
      }
    }
    if (a11)
    {
      v42 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v42)
      {
        v43 = v42;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 0x40000000;
        v75[2] = sub_100003758;
        v75[3] = &unk_1000147F0;
        v76 = a2;
        v75[4] = a11;
        v75[5] = a12;
        CFDictionarySetValue(v42, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v75);
        CFDictionarySetValue(v43, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014830);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageIntermediateTap, v43);
        CFRelease(v43);
      }
    }
    if (a13)
    {
      v44 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v44)
      {
        v45 = v44;
        v73[0] = _NSConcreteStackBlock;
        v73[1] = 0x40000000;
        v73[2] = sub_1000037C8;
        v73[3] = &unk_100014850;
        v74 = a2;
        v73[4] = a13;
        v73[5] = a14;
        CFDictionarySetValue(v44, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v73);
        CFDictionarySetValue(v45, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014890);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Depth, v45);
        CFRelease(v45);
      }
    }
    if (a15)
    {
      v46 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v46)
      {
        v47 = v46;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 0x40000000;
        v71[2] = sub_100003838;
        v71[3] = &unk_1000148B0;
        v72 = a2;
        v71[4] = a15;
        v71[5] = a16;
        CFDictionarySetValue(v46, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v71);
        CFDictionarySetValue(v47, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000148F0);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_Raw, v47);
        CFRelease(v47);
      }
    }
    if (a17)
    {
      v48 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v48)
      {
        v49 = v48;
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 0x40000000;
        v69[2] = sub_1000038A8;
        v69[3] = &unk_100014910;
        v70 = a2;
        v69[4] = a17;
        v69[5] = a18;
        CFDictionarySetValue(v48, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v69);
        CFDictionarySetValue(v49, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014950);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_StillImageRaw, v49);
        CFRelease(v49);
      }
    }
    if (a19)
    {
      v50 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v50)
      {
        v51 = v50;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 0x40000000;
        v67[2] = sub_100003918;
        v67[3] = &unk_100014970;
        v68 = a2;
        v67[4] = a19;
        v67[5] = a20;
        CFDictionarySetValue(v50, kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler, v67);
        CFDictionarySetValue(v51, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_1000149B0);
        CFDictionarySetValue(v33, CFSTR("VisPipe"), v51);
        CFRelease(v51);
      }
    }
    if (a21)
    {
      v52 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v52)
      {
        v53 = v52;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 0x40000000;
        v65[2] = sub_100003988;
        v65[3] = &unk_1000149D0;
        v66 = a2;
        v65[4] = a21;
        v65[5] = a22;
        CFDictionarySetValue(v52, kFigCaptureStreamVideoOutputHandlerKey_DataBufferHandler, v65);
        CFDictionarySetValue(v53, kFigCaptureStreamVideoOutputHandlerKey_EventHandler, &stru_100014A10);
        CFDictionarySetValue(v33, kFigCaptureStreamVideoOutputID_PointCloud, v53);
        CFRelease(v53);
      }
    }
    v54 = HxISPCaptureDeviceController::SetStreamProperty(this, a2, kFigCaptureStreamProperty_VideoOutputHandlers, v33);
    if (v54)
      printf("Error: HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks - error setting VideoOutputHandlers: %d\n", v54);
    CFRelease(v33);
    v31 = a2;
  }
  v55 = (char *)this + 248 * v31;
  *((_QWORD *)v55 + 30) = 0;
  *((_QWORD *)v55 + 31) = 0;
  obj = 0;
  v56 = (char *)this + 8 * v31;
  v58 = *((_QWORD *)v56 + 2);
  v57 = v56 + 16;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(v58);
  v60 = *(uint64_t (**)(uint64_t, _QWORD, const CFAllocatorRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                                 + 8)
                                                                                     + 48);
  if (!v60)
    return 4294954514;
  result = v60(FigBaseObject, kFigCaptureStreamProperty_FormatDescription, kCFAllocatorDefault, &obj);
  if ((_DWORD)result)
    return result;
  CFShow(obj);
  CFRelease(obj);
  obj = 0;
  v61 = *v57;
  v62 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable(*v57) + 16) + 8);
  if (!v62)
    return 4294954514;
  result = v62(v61);
  if (!(_DWORD)result)
    v63[256] = 1;
  return result;
}

uint64_t sub_100003598(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000035E0(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (primaryScaler), event=%d\n", a2);
}

uint64_t sub_100003608(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100003650(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (secondaryScaler), event=%d\n", a2);
}

uint64_t sub_100003678(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000036C0(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (intermediateTap), event=%d\n", a2);
}

uint64_t sub_1000036E8(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100003730(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImage), event=%d\n", a2);
}

uint64_t sub_100003758(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000037A0(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageIntermediateTap), event=%d\n", a2);
}

uint64_t sub_1000037C8(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100003810(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (depth), event=%d\n", a2);
}

uint64_t sub_100003838(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100003880(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (raw), event=%d\n", a2);
}

uint64_t sub_1000038A8(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000038F0(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (stillImageRaw), event=%d\n", a2);
}

uint64_t sub_100003918(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_100003960(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (visPipe), event=%d\n", a2);
}

uint64_t sub_100003988(uint64_t result, uint64_t a2, __int128 *a3)
{
  uint64_t (*v3)(uint64_t, __int128 *, _QWORD, _QWORD);
  __int128 v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, __int128 *, _QWORD, _QWORD))(result + 32);
  if (v3)
  {
    v4 = *a3;
    v5 = *((_QWORD *)a3 + 2);
    return v3(a2, &v4, *(unsigned int *)(result + 48), *(_QWORD *)(result + 40));
  }
  return result;
}

void sub_1000039D0(id a1, int a2, $3CC8671D27C23BF42ADDB32F2B5E48AE *a3, int64_t a4)
{
  printf("kFigCaptureStreamVideoOutputHandlerKey_EventHandler (data), event=%d\n", a2);
}

uint64_t HxISPCaptureDeviceController::SetStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const __CFBoolean *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, const __CFString *, const __CFBoolean *);
  uint64_t result;
  _BYTE *v11;
  const char *v12;

  if (!*((_BYTE *)this + 2148))
  {
    v12 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_10:
    puts(v12);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v12 = "Error: HxISPCaptureDeviceController::SetStreamProperty - Invalid stream index";
    goto LABEL_10;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v9 = *(uint64_t (**)(uint64_t, const __CFString *, const __CFBoolean *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                              + 8)
                                                                                  + 56);
  if (!v9)
    return 4294954514;
  result = v9(FigBaseObject, a3, a4);
  if (!(_DWORD)result)
  {
    result = CFEqual(a3, kFigCaptureStreamProperty_MultipleOutputSupportEnabled);
    if ((_DWORD)result)
    {
      result = CFBooleanGetValue(a4);
      v11 = (char *)this + 248 * a2 + 273;
      if ((_DWORD)result)
      {
        result = 0;
        *v11 = 1;
      }
      else
      {
        *v11 = 0;
      }
    }
  }
  return result;
}

uint64_t HxISPCaptureDeviceController::SetDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, const void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject)
                                                                                         + 8)
                                                                             + 56);
    if (v6)
      return v6(FigBaseObject, a2, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyDeviceProperty(HxISPCaptureDeviceController *this, const __CFString *a2, void *a3)
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, const __CFString *, const CFAllocatorRef, void *);

  if (*((_BYTE *)this + 2148))
  {
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)this);
    v6 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                             + 48);
    if (v6)
      return v6(FigBaseObject, a2, kCFAllocatorDefault, a3);
    else
      return 4294954514;
  }
  else
  {
    puts("Error: HxISPCaptureDeviceController::startReceive - No CM plug-in");
    return 0xFFFFFFFFLL;
  }
}

uint64_t HxISPCaptureDeviceController::CopyStreamProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t FigBaseObject;
  uint64_t (*v7)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  const char *v9;

  if (!*((_BYTE *)this + 2148))
  {
    v9 = "Error: HxISPCaptureDeviceController::startReceive - No CM plug-in";
LABEL_7:
    puts(v9);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v9 = "Error: HxISPCaptureDeviceController::CopyStreamProperty - Invalid stream index";
    goto LABEL_7;
  }
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*((_QWORD *)this + a2 + 2));
  v7 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                           + 48);
  if (v7)
    return v7(FigBaseObject, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::SetGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::SetGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                            + 56);
  if (v18)
    return v18(v17, a3, a4);
  else
    return 4294954514;
}

uint64_t HxISPCaptureDeviceController::CopyGroupProperty(HxISPCaptureDeviceController *this, unsigned int a2, const __CFString *a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const void **v10;
  char *v11;
  uint64_t FigBaseObject;
  unsigned int (*v13)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v14;
  const char *v15;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, const __CFString *, const CFAllocatorRef, void *);
  CFArrayRef theArray;
  CFRange v20;

  if (!*((_BYTE *)this + 2148))
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - No CM plug-in";
LABEL_14:
    puts(v15);
    return 0xFFFFFFFFLL;
  }
  if (*((_DWORD *)this + 516) <= a2)
  {
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Invalid stream index";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 536))
  {
    v7 = 0;
    v8 = 0;
    v9 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
    v10 = (const void **)((char *)this + 8 * a2 + 16);
    v11 = (char *)this + 2080;
    while (1)
    {
      theArray = 0;
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*(_QWORD *)&v11[8 * v7]);
      v13 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8)
                                                                                                + 48);
      if (!v13 || v13(FigBaseObject, v9, kCFAllocatorDefault, &theArray))
        break;
      v14 = theArray;
      v20.length = CFArrayGetCount(theArray);
      v20.location = 0;
      if (CFArrayContainsValue(v14, v20, *v10))
        v8 = *(_QWORD *)&v11[8 * v7];
      CFRelease(theArray);
      if (++v7 >= (unint64_t)*((unsigned int *)this + 536))
        goto LABEL_17;
    }
    v15 = "Error: HxISPCaptureDeviceController::CopyGroupProperty - Unable to locate synchronized stream group for stream";
    goto LABEL_14;
  }
  v8 = 0;
LABEL_17:
  v17 = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(v8);
  v18 = *(uint64_t (**)(uint64_t, const __CFString *, const CFAllocatorRef, void *))(*(_QWORD *)(CMBaseObjectGetVTable(v17) + 8)
                                                                                            + 48);
  if (v18)
    return v18(v17, a3, kCFAllocatorDefault, a4);
  else
    return 4294954514;
}

uint64_t sub_100003F88(const char *a1, const char *a2, uint64_t a3)
{
  void *v5;
  uint64_t (*v6)(const CFAllocatorRef, _QWORD, uint64_t);

  v5 = dlopen(a1, 4);
  if (v5 && (v6 = (uint64_t (*)(const CFAllocatorRef, _QWORD, uint64_t))dlsym(v5, a2)) != 0)
    return v6(kCFAllocatorDefault, 0, a3);
  else
    return 0;
}

void DeviceCMInterface::DeviceCMInterface(DeviceCMInterface *this)
{
  this->var4.var5 = 0;
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(_QWORD *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->var3.var0 = -1;
  *(_QWORD *)&this->var3.var2 = -1;
  *(_QWORD *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
}

{
  this->var4.var5 = 0;
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(_QWORD *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->var3.var0 = -1;
  *(_QWORD *)&this->var3.var2 = -1;
  *(_QWORD *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
}

DeviceCMInterface *DeviceCMInterface::resetMembers(DeviceCMInterface *this)
{
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(_QWORD *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->var3.var0 = -1;
  *(_QWORD *)&this->var3.var2 = -1;
  *(_QWORD *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
  return this;
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseInterface(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *result;

  result = this->var2;
  if (result)
  {
    HxISPCaptureDeviceController::deactivate(result);
    result = this->var2;
    if (result)
    {
      HxISPCaptureDeviceController::~HxISPCaptureDeviceController(result);
      operator delete();
    }
  }
  this->var0 = -1;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  *(_QWORD *)&this->var5.var4 = 0xFFFFFFFF00000000;
  *(_QWORD *)&this->var3.var0 = -1;
  *(_QWORD *)&this->var3.var2 = -1;
  *(_QWORD *)&this->var3.var4 = -1;
  *(_WORD *)&this->var7 = 0;
  this->var1 = 0;
  this->var2 = 0;
  return result;
}

void DeviceCMInterface::~DeviceCMInterface(DeviceCMInterface *this)
{
  DeviceCMInterface::releaseInterface(this);

}

void DeviceCMInterface::initAndActivateCaptureDeviceController(DeviceCMInterface *this)
{
  operator new();
}

void sub_10000428C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setSWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 40), a2);
}

uint64_t DeviceCMInterface::setRgbConfiguration(uint64_t a1, uint64_t a2, uint64_t a3)
{
  HxISPCaptureDeviceController *v3;
  uint64_t v5;
  NSNumber *v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFDictionaryRef DictionaryRepresentation;
  const __CFBoolean *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  unsigned int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  float v48;
  float v49;
  void *v50;
  float v51;
  float v52;
  void *v53;
  float v54;
  float v55;
  void *v56;
  float v57;
  float v58;
  BOOL v61;
  char v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  const __CFString *v69;
  HxISPCaptureDeviceController *v70;
  NSNumber *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v76;
  int v77;
  int v78;
  id obja;
  id obj;
  uint64_t v82;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint64_t v89;
  id v90;
  _BYTE v91[128];

  if ((a2 & 0x80000000) != 0 || (v3 = *(HxISPCaptureDeviceController **)(a1 + 16)) == 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error bad streamID of %d "), a2));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 164, v15);

    return 3758097084;
  }
  v5 = *(unsigned int *)(a3 + 44);
  if ((_DWORD)v5 == -1)
  {
    v88 = 0;
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, a2, kFigCaptureStreamProperty_SupportedFormatsArray, &v88);
    if ((_DWORD)v7)
    {
      obja = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obja, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to get sw stream supported formats %@"), v7, v18));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 175, v19);

      return (uint64_t)v7;
    }
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    obj = v88;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
    if (v34)
    {
      v35 = -1;
      v82 = *(_QWORD *)v85;
      while (2)
      {
        v36 = 0;
        v77 = v35 + (_DWORD)v34;
        v78 = v35;
        do
        {
          if (*(_QWORD *)v85 != v82)
            objc_enumerationMutation(obj);
          v37 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v36);
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("VideoIsBinned")));
          v39 = objc_msgSend(v38, "BOOLValue");

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorWidth")));
          v41 = objc_msgSend(v40, "integerValue");

          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SensorHeight")));
          v43 = objc_msgSend(v42, "integerValue");

          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "valueForKey:", CFSTR("SupportedOutputs")));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForKey:", CFSTR("PrimaryScaler")));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "valueForKey:", CFSTR("DefaultCropRect")));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("X")));
          objc_msgSend(v47, "floatValue");
          v49 = v48;

          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Y")));
          objc_msgSend(v50, "floatValue");
          v52 = v51;

          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Width")));
          objc_msgSend(v53, "floatValue");
          v55 = v54;

          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("Height")));
          objc_msgSend(v56, "floatValue");
          v58 = v57;

          v61 = *(unsigned __int8 *)(a3 + 40) != v39 || *(_DWORD *)a3 != v41 || *(_DWORD *)(a3 + 4) != v43;
          if (*(double *)(a3 + 8) != v49)
            v61 = 1;
          if (*(double *)(a3 + 16) != v52)
            v61 = 1;
          if (*(double *)(a3 + 24) != v55)
            v61 = 1;
          v62 = *(double *)(a3 + 32) != v58 || v61;

          if ((v62 & 1) == 0)
          {
            v5 = (v78 + (_DWORD)v36 + 1);
            goto LABEL_47;
          }
          v36 = (char *)v36 + 1;
        }
        while (v34 != v36);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v91, 16);
        v35 = v77;
        if (v34)
          continue;
        break;
      }
      v5 = 0xFFFFFFFFLL;
LABEL_47:

      if ((_DWORD)v5 != -1)
      {
        v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
        goto LABEL_4;
      }
    }
    else
    {

    }
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
    v66 = DeviceCMInterface::getErrorInformationString(0);
    v67 = (void *)objc_claimAutoreleasedReturnValue(v66);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to find cam required format, %@"), 0, v67));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 216, v68);

    return 0;
  }
LABEL_4:
  v6 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v5);
  v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v3, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)v6);
  if (!(_DWORD)v7)
  {
    v20 = objc_alloc_init((Class)NSMutableDictionary);
    if (*(_DWORD *)(a3 + 52))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v21, kFigCaptureStreamVideoOutputConfigurationKey_Height);

    }
    if (*(_DWORD *)(a3 + 48))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
      objc_msgSend(v20, "setValue:forKey:", v22, kFigCaptureStreamVideoOutputConfigurationKey_Width);

    }
    v23 = *(double *)(a3 + 80);
    if (v23 != 0.0)
    {
      v24 = *(_QWORD *)(a3 + 56);
      v25 = *(_QWORD *)(a3 + 64);
      v26 = *(_QWORD *)(a3 + 72);
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)(&v23 - 3));
      objc_msgSend(v20, "setValue:forKey:", DictionaryRepresentation, kFigCaptureStreamVideoOutputConfigurationKey_CropRect);

    }
    if (objc_msgSend(v20, "count"))
    {
      v89 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
      v90 = v20;
      v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1));
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_VideoOutputConfigurations, v28);
      if ((_DWORD)v7)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
        v31 = DeviceCMInterface::getErrorInformationString(v7);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to video configuration, %@"), v7, v32));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 243, v33);
        goto LABEL_18;
      }

    }
    if (*(_DWORD *)(a3 + 100))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_ContinuousAutoFocusNow, 0);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v63 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v63);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 251, v32);
        goto LABEL_66;
      }
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_AutoFocusPositionSensorMode, (const __CFBoolean *)&off_100016BC0);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v69 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v69);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus pos, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 257, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 92))
    {
      v70 = *(HxISPCaptureDeviceController **)(a1 + 16);
      v71 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:");
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(v70, a2, kFigCaptureStreamProperty_MaxIntegrationTime, (const __CFBoolean *)v71);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v72 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v72);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set max integrtion time, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 265, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 104))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_UnlockAENow, (const __CFBoolean *)&__kCFBooleanTrue);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v73 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v73);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set unlock auto expsosure now, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 274, v32);
        goto LABEL_66;
      }
    }
    if (*(_DWORD *)(a3 + 96))
    {
      v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_SphereMode, kFigCaptureStreamSphereMode_Lock);
      if ((_DWORD)v7)
      {
        v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v28, "lastPathComponent"));
        v74 = DeviceCMInterface::getErrorInformationString(v7);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v74);
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set SphereMode, %@"), v7, v30));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v29, 283, v32);
        goto LABEL_66;
      }
    }
    if (!*(_DWORD *)(a3 + 88))
    {
      v7 = 0;
      goto LABEL_68;
    }
    v28 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
    v7 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), a2, kFigCaptureStreamProperty_MaximumFrameRate, v28);
    if (!(_DWORD)v7)
    {
LABEL_67:

LABEL_68:
      return (uint64_t)v7;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
    v76 = DeviceCMInterface::getErrorInformationString(v7);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v76);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set auto focus, %@"), v7, v32));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 292, v33);
LABEL_18:

LABEL_66:
    goto LABEL_67;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
  v10 = DeviceCMInterface::getErrorInformationString(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("error %d failed to set sw format index, %@"), v7, v11));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 222, v12);

  return (uint64_t)v7;
}

void sub_100004E88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setWConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 28), a2);
}

uint64_t DeviceCMInterface::setFrontConfiguration(uint64_t a1, uint64_t a2)
{
  return DeviceCMInterface::setRgbConfiguration(a1, *(unsigned int *)(a1 + 32), a2);
}

const __CFString *DeviceCMInterface::getErrorInformationString(DeviceCMInterface *this)
{
  const __CFString *result;

  if ((int)this > -12789)
  {
    switch(this)
    {
      case 0xFFFFCE0C:
        result = CFSTR("base object error unsupported protocol");
        break;
      case 0xFFFFCE0D:
        result = CFSTR("base object error property not supported");
        break;
      case 0xFFFFCE0E:
        result = CFSTR("base object error allocation failed");
        break;
      case 0xFFFFCE0F:
        result = CFSTR("base object error invalidated");
        break;
      case 0xFFFFCE10:
        result = CFSTR("base object error property not found");
        break;
      case 0xFFFFCE11:
        result = CFSTR("base object error value not available");
        break;
      case 0xFFFFCE12:
        result = CFSTR("base object error unsupported operation");
        break;
      case 0xFFFFCE13:
        result = CFSTR("base object error unsupported version");
        break;
      case 0xFFFFCE14:
        result = CFSTR("base object error parameter error");
        break;
      default:
        if ((_DWORD)this)
LABEL_10:
          result = CFSTR("Unknown error information");
        else
          result = CFSTR("OK");
        break;
    }
  }
  else
  {
    switch(this)
    {
      case 0xE00002BC:
        result = CFSTR("general error");
        break;
      case 0xE00002BD:
        result = CFSTR("can't allocate memory");
        break;
      case 0xE00002BE:
        result = CFSTR("resource shortage");
        break;
      case 0xE00002BF:
        result = CFSTR("error during IPC");
        break;
      case 0xE00002C0:
        result = CFSTR("no such device");
        break;
      case 0xE00002C1:
        result = CFSTR("privilege violation");
        break;
      case 0xE00002C2:
        result = CFSTR("invalid argument");
        break;
      case 0xE00002C3:
        result = CFSTR("device read locked");
        break;
      case 0xE00002C4:
        result = CFSTR("device write locked");
        break;
      case 0xE00002C5:
        result = CFSTR("exclusive access and");
        break;
      case 0xE00002C6:
        result = CFSTR("sent/received messages");
        break;
      case 0xE00002C7:
        result = CFSTR("unsupported function");
        break;
      case 0xE00002C8:
        result = CFSTR("misc. VM failure");
        break;
      case 0xE00002C9:
        result = CFSTR("internal error");
        break;
      case 0xE00002CA:
        result = CFSTR("General I/O error");
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_10;
      case 0xE00002CC:
        result = CFSTR("can't acquire lock");
        break;
      case 0xE00002CD:
        result = CFSTR("device not open");
        break;
      case 0xE00002CE:
        result = CFSTR("read not supported");
        break;
      case 0xE00002CF:
        result = CFSTR("write not supported");
        break;
      case 0xE00002D0:
        result = CFSTR("alignment error");
        break;
      case 0xE00002D1:
        result = CFSTR("Media Error");
        break;
      case 0xE00002D2:
        result = CFSTR("device(s) still open");
        break;
      case 0xE00002D3:
        result = CFSTR("rld failure");
        break;
      case 0xE00002D4:
        result = CFSTR("DMA failure");
        break;
      case 0xE00002D5:
        result = CFSTR("Device Busy");
        break;
      case 0xE00002D6:
        result = CFSTR("I/O Timeout");
        break;
      case 0xE00002D7:
        result = CFSTR("device offline");
        break;
      case 0xE00002D8:
        result = CFSTR("not ready");
        break;
      case 0xE00002D9:
        result = CFSTR("device not attached");
        break;
      case 0xE00002DA:
        result = CFSTR("no DMA channels left");
        break;
      case 0xE00002DB:
        result = CFSTR("no space for data");
        break;
      case 0xE00002DD:
        result = CFSTR("port already exists");
        break;
      case 0xE00002DE:
        result = CFSTR("can't wire down");
        break;
      case 0xE00002DF:
        result = CFSTR("no interrupt attached");
        break;
      case 0xE00002E0:
        result = CFSTR("no DMA frames enqueued");
        break;
      case 0xE00002E1:
        result = CFSTR("oversized msg received");
        break;
      case 0xE00002E2:
        result = CFSTR("not permitted");
        break;
      case 0xE00002E3:
        result = CFSTR("no power to device");
        break;
      case 0xE00002E4:
        result = CFSTR("media not present");
        break;
      case 0xE00002E5:
        result = CFSTR("media not formatted");
        break;
      case 0xE00002E6:
        result = CFSTR("no such mode");
        break;
      case 0xE00002E7:
        result = CFSTR("data underrun");
        break;
      case 0xE00002E8:
        result = CFSTR("data overrun");
        break;
      case 0xE00002E9:
        result = CFSTR("the device is not working properly!");
        break;
      case 0xE00002EA:
        result = CFSTR("a completion routine is required");
        break;
      case 0xE00002EB:
        result = CFSTR("operation aborted");
        break;
      case 0xE00002EC:
        result = CFSTR("bus bandwidth would be exceeded");
        break;
      case 0xE00002ED:
        result = CFSTR("device not responding");
        break;
      case 0xE00002EE:
        result = CFSTR("isochronous I/O request for distant past!");
        break;
      case 0xE00002EF:
        result = CFSTR("isochronous I/O request for distant future");
        break;
      case 0xE00002F0:
        result = CFSTR("data was not found");
        break;
      default:
        if ((_DWORD)this != -536870911)
          goto LABEL_10;
        result = CFSTR("should never be seen");
        break;
    }
  }
  return result;
}

DeviceCMInterface *DeviceCMInterface::enableJasperRgbVideo(DeviceCMInterface *this)
{
  uint64_t v2;
  DeviceCMInterface *v3;
  void *v4;
  void *v5;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;

  if (this->var5.var2)
  {
    v2 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var1);
    if ((_DWORD)v2)
    {
      v3 = (DeviceCMInterface *)v2;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 306, v8);
LABEL_7:

LABEL_10:
      return v3;
    }
  }
  if (this->var5.var1)
  {
    v9 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var4);
    if ((_DWORD)v9)
    {
      v3 = (DeviceCMInterface *)v9;
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v10 = DeviceCMInterface::getErrorInformationString(v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enable wide stream failed with %d, %@"), v3, v7));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 315, v8);
      goto LABEL_7;
    }
  }
  v3 = (DeviceCMInterface *)DeviceCMInterface::enableJasperPointCloudOutput(this);
  if ((_DWORD)v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 323, v7);
    goto LABEL_10;
  }
  return v3;
}

void sub_1000056B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableRGBOutputForStreamId(DeviceCMInterface *this, unsigned int a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if ((a2 & 0x80000000) != 0 || !this->var2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutputForStreamId failed, stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 885, v9);
    v6 = 3758097129;

    return v6;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PrimaryScaler, kCFBooleanTrue);
  if (!HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_VideoOutputsEnabled, v5))
  {
    CFRelease(v5);
    return 0;
  }
  return 3758097129;
}

void sub_100005830(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableJasperPointCloudOutput(DeviceCMInterface *this)
{
  __CFDictionary *Mutable;
  const __CFBoolean *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, kFigCaptureStreamVideoOutputID_PointCloud, kCFBooleanTrue);
    v4 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_VideoOutputsEnabled, v3);
    if ((_DWORD)v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableJasperOutput failed with OSStatus 0x%x, %@"), v4, v8));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 945, v9);

      return 3758097129;
    }
    else
    {
      CFRelease(v3);
    }
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail to create output enable dictionary for pointcloud output")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 954, v12);
    v4 = 3758097084;

  }
  return v4;
}

void sub_100005A14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::configJasperRgbMultiStream(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  uint64_t v2;
  int var4;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 var2;
  void *v21;
  void *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _UNKNOWN **v38;

  v2 = 3758097126;
  if (!a2->var3 && a2->var0)
  {
    if (this->var3.var5 == -1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 339, v18);

      return 3758097088;
    }
    var4 = a2->var4;
    if (var4 == 16 || var4 == 8)
    {
      v37 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v38 = &off_100016BD8;
      v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
      v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v8);
      if ((_DWORD)v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        var5 = this->var3.var5;
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v9, var5, v14));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 356, v15);

LABEL_13:
        v2 = (uint64_t)v9;
LABEL_14:

        return v2;
      }
      this->var10 = 1;
      this->var5.var0 = 1;
      var2 = a2->var2;
      if (!a2->var1 && !a2->var2)
        goto LABEL_14;
      if (a2->var1)
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var4, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb sw failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 369, v21);

          goto LABEL_13;
        }
        var2 = a2->var2;
      }
      if (var2
        && (v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var1, 1), (_DWORD)v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb w failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 378, v22);

      }
      else
      {
        v9 = (DeviceCMInterface *)DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var5, 1);
        if ((_DWORD)v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 387, v23);

        }
        else
        {
          v24 = (char *)this->var2 + 16;
          v25 = *(_QWORD *)&v24[8 * this->var3.var4];
          v26 = *(_QWORD *)&v24[8 * this->var3.var1];
          v27 = *(_QWORD *)&v24[8 * this->var3.var5];
          v28 = objc_alloc_init((Class)NSMutableArray);
          v11 = v28;
          if (a2->var2)
            objc_msgSend(v28, "addObject:", v26);
          if (a2->var1)
            objc_msgSend(v11, "addObject:", v25);
          if (a2->var0)
            objc_msgSend(v11, "addObject:", v27);
          v35 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
          v36 = v11;
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
          v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v10);
          if ((_DWORD)v9)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
            v31 = this->var3.var5;
            v32 = DeviceCMInterface::getErrorInformationString(v9);
            v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v9, v31, v33));
            NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 408, v34);

          }
          else
          {
            this->var5 = *a2;
          }
        }
      }
      goto LABEL_13;
    }
  }
  return v2;
}

void sub_100005F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setJasperRGBSuperWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var4, 1);
}

uint64_t DeviceCMInterface::setJasperRGBWideMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var1, 1);
}

uint64_t DeviceCMInterface::setJasperMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *var2;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  var2 = this->var2;
  if (!var2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 774, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->var3.var5 != (_DWORD)a2 && this->var3.var4 != (_DWORD)a2 && this->var3.var1 != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d or %d or %d for jasper)"), a2, this->var3.var5, this->var3.var4, this->var3.var1));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 780, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(var2, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 790, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_1000062E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentJasperConfiguration(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  this->var5 = *a2;
  return this;
}

uint64_t DeviceCMInterface::configJasperDevice(DeviceCMInterface *this, const JasperConfiguration *a2)
{
  unsigned int var5;
  uint64_t v5;
  CFArrayRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  const __CFBoolean *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFBoolean *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  const __CFBoolean *v29;
  uint64_t var4;
  void *v31;
  void *v32;
  void *v33;
  HxISPCaptureDeviceController *var2;
  uint64_t v35;
  uint64_t v36;
  uint64_t FigBaseObject;
  unsigned int (*v38)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *);
  const __CFArray *v39;
  const __CFArray *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  void *v50;
  DeviceCMInterface *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  CFArrayRef theArray;
  _QWORD v69[2];
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  _UNKNOWN **v76;
  uint64_t v77;
  _UNKNOWN **v78;
  CFRange v79;
  CFRange v80;

  *(_WORD *)&this->var9 = 0;
  this->var5.var0 = 1;
  *(_DWORD *)&this->var5.var1 = 0;
  this->var5.var4 = 0;
  var5 = this->var3.var5;
  if (var5 == -1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no jasper id detected")));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 424, v15);

    return 3758097088;
  }
  if (a2->var0)
  {
    theArray = 0;
    v5 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, var5, kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes, &theArray);
    v6 = theArray;
    theArray = 0;
    if ((_DWORD)v5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      v9 = this->var3.var5;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_SupportedTimeOfFlightProjectorModes failed with OSStatus 0x%x for stream id %d (%@)"), v5, v9, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 441, v12);

      return v5;
    }
    v16 = -[__CFArray containsObject:](v6, "containsObject:", &off_100016BF0);
    v17 = -[__CFArray containsObject:](v6, "containsObject:", &off_100016BD8);
    if (v16)
    {
      v77 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v78 = &off_100016BF0;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalShortHybridMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 456, v21);
    }
    else
    {
      if (!v17)
      {
        v29 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFBoolean lastPathComponent](v29, "lastPathComponent"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot resolve projector mode")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 467, v24);
        v5 = 3758097084;
        goto LABEL_34;
      }
      v75 = kFigCaptureTimeOfFlightConfigurationKey_ProjectorMode;
      v76 = &off_100016BD8;
      v18 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NormalMode detected")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 463, v21);
    }
    v22 = v18;

    v5 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_TimeOfFlightConfiguration, v18);
    if ((_DWORD)v5)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
      v25 = this->var3.var5;
      v26 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v5);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting property kFigCaptureStreamProperty_TimeOfFlightConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v5, v25, v27));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 474, v28);

      v29 = v22;
LABEL_34:

      return v5;
    }
    this->var10 = 1;
    this->var5.var0 = 1;

  }
  if (a2->var1)
  {
    var4 = this->var3.var4;
    if ((_DWORD)var4 == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      var4 = this->var3.var4;
      if ((_DWORD)var4 == -1)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastPathComponent"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB super wide stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v46, 485, v47);

        return 3758097136;
      }
    }
    v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, var4, 1);
    if ((_DWORD)v5)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "lastPathComponent"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v32, 493, v33);

      return v5;
    }
    this->var9 = 1;
    if (a2->var0 && a2->var1)
    {
      var2 = this->var2;
      if (a2->var3)
      {
        if (*((_DWORD *)var2 + 536))
        {
          v35 = kFigCaptureSynchronizedStreamsGroupProperty_SupportedStreams;
          v36 = 260;
          do
          {
            theArray = 0;
            FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(*((_QWORD *)var2 + v36));
            v38 = *(unsigned int (**)(uint64_t, uint64_t, const CFAllocatorRef, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable(FigBaseObject) + 8) + 48);
            if (!v38 || v38(FigBaseObject, v35, kCFAllocatorDefault, &theArray))
              break;
            v39 = theArray;
            v79.length = CFArrayGetCount(theArray);
            v79.location = 0;
            if (CFArrayContainsValue(v39, v79, *((const void **)this->var2 + this->var3.var5 + 2))
              && (v40 = theArray,
                  v80.length = CFArrayGetCount(theArray),
                  v80.location = 0,
                  CFArrayContainsValue(v40, v80, *((const void **)this->var2 + this->var3.var4 + 2))))
            {
              v41 = *((_QWORD *)this->var2 + v36);
            }
            else
            {
              v41 = 0;
            }
            CFRelease(theArray);
            if (v41)
              goto LABEL_32;
            var2 = this->var2;
            v42 = v36 - 259;
            ++v36;
          }
          while (v42 < *((unsigned int *)var2 + 536));
        }
        v41 = 0;
LABEL_32:
        v72 = v41;
        v73 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v72, 1));
        v74 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
      }
      else
      {
        v48 = (char *)var2 + 16;
        v49 = *(_QWORD *)&v48[8 * this->var3.var5];
        v69[1] = *(_QWORD *)&v48[8 * this->var3.var4];
        v70 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveUnsynchronizedStreams;
        v69[0] = v49;
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 2));
        v71 = v43;
        v44 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
      }
      v50 = (void *)v44;

      v51 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v50);
      if ((_DWORD)v51)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "lastPathComponent"));
        v54 = this->var3.var5;
        v55 = DeviceCMInterface::getErrorInformationString(v51);
        v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v51, v54, v56));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v53, 542, v57);

      }
      v5 = DeviceCMInterface::enableSWRGBOutput(this);
      if ((_DWORD)v5)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "lastPathComponent"));
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v59, 549, v60);

        return v5;
      }

    }
  }
  v5 = DeviceCMInterface::setJasperMultiOutModeByStreamId(this, this->var3.var5, 1);
  if ((_DWORD)v5)
  {
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "lastPathComponent"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("faile to enable jasper multi output mode")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v62, 560, v63);

  }
  else
  {
    v5 = DeviceCMInterface::enableJasperPointCloudOutput(this);
    if ((_DWORD)v5)
    {
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "lastPathComponent"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to enable outputs")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v65, 568, v66);

    }
    else
    {
      this->var5 = *a2;
    }
  }
  return v5;
}

void sub_100006D20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isJasperSuperWideExist(DeviceCMInterface *this)
{
  int var4;

  var4 = this->var3.var4;
  if (var4 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    var4 = this->var3.var4;
  }
  return var4 != -1;
}

uint64_t DeviceCMInterface::enableSWRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var4);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 926, v4);

  }
  return v1;
}

void sub_100007028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::requestControlOfStreams(DeviceCMInterface *this, int a2, useconds_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  DeviceCMInterface *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *ErrorInformationString;
  void *v26;
  __CFDictionary *v30;
  uint64_t v31;
  _UNKNOWN **v32;

  if (this->var2)
  {
    if (a2)
    {
      v31 = kFigCaptureDeviceRequestControlOfStreamsOptionsKey_ClientPriority;
      v32 = &off_100016BF0;
      v4 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("request control on high priority")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 592, v7);

      v30 = (__CFDictionary *)v4;
    }
    else
    {
      v30 = 0;
    }
    v12 = 1;
    while (1)
    {
      v13 = HxISPCaptureDeviceController::RequestStreams(this->var2, *((const __CFArray **)this->var2 + 1), v30);
      v14 = (DeviceCMInterface *)v13;
      if ((_DWORD)v13 != -12681)
        break;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol - controlled by another client. %d/%d"), v12, 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 600, v17);

      usleep(0x7A120u);
      v12 = (v12 + 1);
      if ((_DWORD)v12 == 11)
        goto LABEL_17;
    }
    if ((_DWORD)v13 != -12782 && (_DWORD)v13 != 0)
    {
LABEL_17:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("requestControlOfStreamscontrol failed, OSStatus error 0x%x, %@"), v14, v24));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 614, v26);

      v11 = 3758097129;
      goto LABEL_18;
    }
    if (a2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastPathComponent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waiting for preempted client to terminate for %.2f sec..."), (double)a3 / 1000000.0));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v20, 621, v21);

      usleep(a3);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lastPathComponent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("done waiting")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v23, 623, v24);
      v11 = 0;
LABEL_18:

      goto LABEL_20;
    }
    v11 = 0;
LABEL_20:

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 584, v10);
    v11 = 3758097084;

  }
  return v11;
}

void sub_10000748C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::releaseControlOfStreams(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *var2;
  uint64_t v2;
  void *v3;
  void *v4;
  const __CFString *ErrorInformationString;
  void *v6;
  void *v7;

  var2 = this->var2;
  if (!var2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 635, v6);
    v2 = 3758097084;
    goto LABEL_5;
  }
  v2 = HxISPCaptureDeviceController::RelinquishStreams(var2, *((const __CFArray **)var2 + 1));
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fail during releaseControlOfStreams, OSStatus error 0x%x (%@)"), v2, v6));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 642, v7);

LABEL_5:
  }
  return v2;
}

void sub_1000076CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enumerateStreamsIndices(DeviceCMInterface *this)
{
  unsigned int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  StreamIdsInfo *p_var3;
  CFStringRef theString1;

  v2 = 0;
  *(_QWORD *)&this->var3.var0 = -1;
  *(_QWORD *)&this->var3.var2 = -1;
  *(_QWORD *)&this->var3.var4 = -1;
  p_var3 = &this->var3;
  v3 = (const __CFString *)kFigCaptureStreamProperty_PortType;
  v4 = (const __CFString *)kFigCapturePortType_FrontFacingInfraredCamera;
  v5 = (const __CFString *)kFigCapturePortType_FrontFacingCamera;
  v6 = (const __CFString *)kFigCapturePortType_FrontFacingSuperWideCamera;
  v7 = (const __CFString *)kFigCapturePortType_BackFacingSuperWideCamera;
  v8 = (const __CFString *)kFigCapturePortType_BackFacingCamera;
  v9 = (const __CFString *)kFigCapturePortType_BackFacingTelephotoCamera;
  v10 = (const __CFString *)kFigCapturePortType_BackFacingSparseTimeOfFlightCamera;
  do
  {
    theString1 = 0;
    if (HxISPCaptureDeviceController::CopyStreamProperty(this->var2, v2, v3, &theString1))
      v11 = 1;
    else
      v11 = theString1 == 0;
    if (!v11)
    {
      if (CFStringCompare(theString1, v4, 0) == kCFCompareEqualTo)
        this->var3.var3 = v2;
      if (CFStringCompare(theString1, v5, 0) == kCFCompareEqualTo
        || CFStringCompare(theString1, v6, 0) == kCFCompareEqualTo)
      {
        this->var3.var2 = v2;
      }
      if (CFStringCompare(theString1, v7, 0) == kCFCompareEqualTo)
        this->var3.var4 = v2;
      if (CFStringCompare(theString1, v8, 0) == kCFCompareEqualTo)
        this->var3.var1 = v2;
      if (CFStringCompare(theString1, v9, 0) == kCFCompareEqualTo)
        p_var3->var0 = v2;
      if (CFStringCompare(theString1, v10, 0) == kCFCompareEqualTo)
        this->var3.var5 = v2;
      CFRelease(theString1);
    }
    ++v2;
  }
  while (v2 != 8);
  if (!this->var2 || this->var3.var3 < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("IR Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 703, v15);
    v12 = 3758097084;
LABEL_26:

    return v12;
  }
  if (this->var3.var2 < 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("RGB Stream id not found")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 709, v15);
    v12 = 0;
    goto LABEL_26;
  }
  return 0;
}

void sub_1000079A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isActivated(DeviceCMInterface *this)
{
  return this->var2 != 0;
}

uint64_t DeviceCMInterface::setPearlIRMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->var3.var3, 1);
}

uint64_t DeviceCMInterface::setPearlMultiOutModeByStreamId(DeviceCMInterface *this, uint64_t a2, int a3)
{
  HxISPCaptureDeviceController *var2;
  const __CFBoolean **v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  var2 = this->var2;
  if (!var2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 802, v11);
    v7 = 3758097084;
    goto LABEL_10;
  }
  if (this->var3.var2 != (_DWORD)a2 && this->var3.var3 != (_DWORD)a2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id %d is invalid (should be %d for rgb or %d for ir)"), a2, this->var3.var2, this->var3.var3));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 808, v11);
    v7 = 3758097090;
    goto LABEL_10;
  }
  v6 = (const __CFBoolean **)&kCFBooleanTrue;
  if (!a3)
    v6 = (const __CFBoolean **)&kCFBooleanFalse;
  v7 = HxISPCaptureDeviceController::SetStreamProperty(var2, a2, kFigCaptureStreamProperty_MultipleOutputSupportEnabled, *v6);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed, OSStatus error 0x%x (%@)"), v7, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 819, v12);

    v7 = 3758097129;
LABEL_10:

  }
  return v7;
}

void sub_100007C0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

BOOL DeviceCMInterface::isPearlIrExist(DeviceCMInterface *this)
{
  int var3;

  var3 = this->var3.var3;
  if (var3 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    var3 = this->var3.var3;
  }
  return var3 != -1;
}

BOOL DeviceCMInterface::isPearlRgbExist(DeviceCMInterface *this)
{
  int var2;

  var2 = this->var3.var2;
  if (var2 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    var2 = this->var3.var2;
  }
  return var2 != -1;
}

BOOL DeviceCMInterface::isJasperExist(DeviceCMInterface *this)
{
  int var5;

  var5 = this->var3.var5;
  if (var5 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    var5 = this->var3.var5;
  }
  return var5 != -1;
}

uint64_t DeviceCMInterface::setPearlRGBMultiOutMode(DeviceCMInterface *this)
{
  return DeviceCMInterface::setPearlMultiOutModeByStreamId(this, this->var3.var2, 1);
}

uint64_t DeviceCMInterface::setStreamProperty(DeviceCMInterface *this, uint64_t a2, const __CFString *a3, NSDictionary *a4)
{
  NSDictionary *v7;
  HxISPCaptureDeviceController *var2;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  void *v14;
  uint64_t v15;

  v7 = a4;
  var2 = this->var2;
  if (var2)
  {
    v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(var2, a2, a3, (const __CFBoolean *)v7);
    if (!(_DWORD)v9)
    {
      v15 = 0;
      goto LABEL_7;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SetStreamProperty %@ for stream id %d failed with OSStatus 0x%x (%@)"), a3, a2, v9, v13));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 839, v14);

    v15 = 3758097129;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 831, v13);
    v15 = 3758097084;
  }

LABEL_7:
  return v15;
}

void sub_100007E8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlIROutput(DeviceCMInterface *this)
{
  const void *v2;
  void *v3;
  NSDictionary *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  __CFDictionary *Mutable;
  const __CFBoolean *v10;
  DeviceCMInterface *v11;
  const __CFString *ErrorInformationString;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v2 = (const void *)kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v17 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v15 = kFigCaptureStreamVideoOutputConfigurationKey_AttachRaw;
  v16 = &__kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v18 = v3;
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));

  v5 = DeviceCMInterface::setStreamProperty(this, this->var3.var3, kFigCaptureStreamProperty_VideoOutputConfigurations, v4);
  if (!(_DWORD)v5)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v10 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
      v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_VideoOutputsEnabled, v10);
      if ((_DWORD)v11)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableIROutput failed with OSStatus 0x%x (%@)"), v11, v8));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 870, v13);

        v5 = 3758097129;
        goto LABEL_3;
      }
      CFRelease(v10);
    }
    v5 = 0;
    goto LABEL_9;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output failed")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 855, v8);
LABEL_3:

LABEL_9:
  return v5;
}

void sub_10000813C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enablePearlRGBOutput(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::enableRGBOutputForStreamId(this, this->var3.var2);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableRGBOutput failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 914, v4);

  }
  return v1;
}

void sub_100008264(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIrCofiguration(DeviceCMInterface *this, int a2)
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  const __CFString *v24;
  void *v25;

  switch(a2)
  {
    case 0:
      v24 = CFSTR("EnableIRProjector");
      v25 = &__kCFBooleanFalse;
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("None")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 972, v6);
      goto LABEL_10;
    case 1:
      v22[0] = CFSTR("EnableIRProjector");
      v22[1] = CFSTR("ProjectorType");
      v23[0] = &__kCFBooleanTrue;
      v23[1] = CFSTR("Flood");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Flood")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 981, v6);
      goto LABEL_10;
    case 2:
      v20[0] = CFSTR("EnableIRProjector");
      v20[1] = CFSTR("ProjectorType");
      v21[0] = &__kCFBooleanTrue;
      v21[1] = CFSTR("SparseLowPower");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseLowPower")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 989, v6);
      goto LABEL_10;
    case 3:
      v18[0] = CFSTR("EnableIRProjector");
      v18[1] = CFSTR("ProjectorType");
      v19[0] = &__kCFBooleanTrue;
      v19[1] = CFSTR("Sparse");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Sparse")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 997, v6);
      goto LABEL_10;
    case 4:
      v14[0] = CFSTR("EnableIRProjector");
      v14[1] = CFSTR("ProjectorType");
      v15[0] = &__kCFBooleanTrue;
      v15[1] = CFSTR("Dense");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("Dense")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1014, v6);
      goto LABEL_10;
    case 5:
      v16[0] = CFSTR("EnableIRProjector");
      v16[1] = CFSTR("ProjectorType");
      v17[0] = &__kCFBooleanTrue;
      v17[1] = CFSTR("DenseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v17, v16, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("DenseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1005, v6);
      goto LABEL_10;
    case 6:
      v12[0] = CFSTR("EnableIRProjector");
      v12[1] = CFSTR("ProjectorType");
      v13[0] = &__kCFBooleanTrue;
      v13[1] = CFSTR("SparseProbeAB");
      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Setting Pearl Ir configuration to %@"), CFSTR("SparseProbeAB")));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1023, v6);
LABEL_10:

      break;
    default:
      v3 = 0;
      break;
  }
  v7 = DeviceCMInterface::setStreamProperty(this, this->var3.var3, CFSTR("IRProjectorParams"), v3);
  if ((_DWORD)v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setProjectorMode failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1031, v10);

  }
  return v7;
}

void sub_1000088BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlDepthConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  __CFDictionary *Mutable;
  CFNumberRef v9;
  CFNumberRef v10;
  const void **v11;
  __CFArray *v12;
  __CFArray *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t valuePtr;

  v24 = a3;
  valuePtr = a2;
  if (!*(_QWORD *)(a1 + 16))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "lastPathComponent"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v21, 1042, v22, v24, valuePtr);
    v14 = 3758097084;

    return v14;
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v24);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputWidth, v9);
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_OutputHeight, v10);
  CFRelease(v9);
  CFRelease(v10);
  v11 = (const void **)&kFigCapturePortType_FrontFacingCamera;
  if (!a4)
    v11 = (const void **)&kFigCapturePortType_FrontFacingInfraredCamera;
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_DepthPerspectivePortType, *v11);
  v12 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  v13 = v12;
  if ((a5 & 1) != 0)
  {
    CFArrayAppendValue(v12, kFigCaptureStreamDepthData_DX);
    if ((a5 & 0x10000) == 0)
    {
LABEL_6:
      if ((a5 & 0x1000000) == 0)
        goto LABEL_7;
      goto LABEL_16;
    }
  }
  else if ((a5 & 0x10000) == 0)
  {
    goto LABEL_6;
  }
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DY);
  if ((a5 & 0x1000000) == 0)
  {
LABEL_7:
    if ((a5 & 0x100) == 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_DepthImage);
  if ((a5 & 0x100) == 0)
  {
LABEL_8:
    if ((a5 & 0x100000000) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_17:
  CFArrayAppendValue(v13, kFigCaptureStreamDepthData_NormalizedDX);
  if ((a5 & 0x100000000) != 0)
LABEL_9:
    CFArrayAppendValue(v13, kFigCaptureStreamDepthData_GMS);
LABEL_10:
  CFDictionarySetValue(Mutable, kFigCaptureStreamDepthEngineConfigurationKey_EnabledOutputs, v13);
  v14 = HxISPCaptureDeviceController::SetStreamProperty(*(HxISPCaptureDeviceController **)(a1 + 16), *(_DWORD *)(a1 + 36), kFigCaptureStreamProperty_DepthEngineConfiguration, Mutable);
  CFRelease(v13);
  if ((_DWORD)v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed with OSStatus 0x%x (%@)"), v14, v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1092, v19, v24, valuePtr);

    return 3758097129;
  }
  return v14;
}

void sub_100008D0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbSuperWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var4);
}

uint64_t DeviceCMInterface::startRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t started;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  DeviceCMInterface *v17;
  const __CFString *ErrorInformationString;
  uint64_t v19;
  DeviceCMInterface *v20;
  const __CFString *v21;

  if (!this->var2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1289, v14);
    started = 3758097084;
LABEL_13:

    return started;
  }
  if ((a2 & 0x80000000) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stream id is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1295, v6);

  }
  if (!this->var5.var4)
  {
    v16 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_100016C20);
    if ((_DWORD)v16)
    {
      v17 = (DeviceCMInterface *)v16;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v17);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v17, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1301, v15);
      goto LABEL_12;
    }
    v19 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_100016C20);
    if ((_DWORD)v19)
    {
      v20 = (DeviceCMInterface *)v19;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v21 = DeviceCMInterface::getErrorInformationString(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v20, v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1307, v15);
      goto LABEL_12;
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1312, v9);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, a2, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100009E20, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startRgbStream failed with OSStatus 0x%x (%@)"), started, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1321, v15);
LABEL_12:

    started = 3758097129;
    goto LABEL_13;
  }
  return started;
}

void sub_1000090DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startRgbWideRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var1);
}

uint64_t DeviceCMInterface::startJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *var2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  const __CFString *v16;
  DeviceCMInterface *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFNumber *v23;
  uint64_t v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  DeviceCMInterface *v31;
  const __CFString *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  DeviceCMInterface *started;
  const __CFString *v38;
  void *v39;
  id v40;
  unsigned int valuePtr;
  const __CFBoolean *v42;

  var2 = this->var2;
  if (!var2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 1114, v13);

    return 3758097084;
  }
  v42 = 0;
  valuePtr = 0x7FFFFFFF;
  v40 = 0;
  v3 = HxISPCaptureDeviceController::CopyStreamProperty(var2, this->var3.var5, kFigCaptureProperty_SupportedPropertiesDictionary, &v40);
  if ((_DWORD)v3)
  {
    v4 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("get SupportedPropertiesDictionary failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1127, v9);
    goto LABEL_4;
  }
  v15 = v40;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allKeys"));

  v40 = 0;
  v16 = (const __CFString *)kFigCaptureStreamProperty_MaximumAllowedFrameRate;
  if (objc_msgSend(v5, "containsObject:", kFigCaptureStreamProperty_MaximumAllowedFrameRate))
  {
    v17 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, v16, &v42);
    if ((_DWORD)v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = DeviceCMInterface::getErrorInformationString(v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed resolving maximum frame rate information OSStatus 0x%x (%@)"), v17, v21));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1148, v22);
      v10 = 3758097129;

      if (v42)
        CFRelease(v42);
      goto LABEL_5;
    }
    v23 = v42;
    if (!v42)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("null maximum frame rate detected")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1156, v9);
      v4 = 3758097129;
      goto LABEL_4;
    }
  }
  else
  {
    v23 = (const __CFNumber *)&off_100016C08;
    v42 = (const __CFBoolean *)&off_100016C08;
  }
  CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr);
  v24 = valuePtr;
  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_MinimumFrameRate, v42);
  v4 = 3758097129;
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v28 = DeviceCMInterface::getErrorInformationString(v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps of %d failed with OSStatus 0x%x (%@)"), v24, v25, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1168, v30);
  }
  else
  {
    v31 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_MaximumFrameRate, v42);
    if (!(_DWORD)v31)
    {
      v10 = 0;
      v33 = 1;
      goto LABEL_18;
    }
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    v32 = DeviceCMInterface::getErrorInformationString(v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v32);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps of %d failed with OSStatus 0x%x (%@)"), v24, v31, v29));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1176, v30);
  }

  v33 = 0;
  v10 = 3758097129;
LABEL_18:
  CFRelease(v42);
  if (!v33)
    goto LABEL_5;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastPathComponent"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->var3.var5));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v35, 1187, v36);

  started = (DeviceCMInterface *)HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, this->var3.var5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                   0,
                                   (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_1000097F8,
                                   this);
  if (!(_DWORD)started)
  {
    v10 = 0;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  v38 = DeviceCMInterface::getErrorInformationString(started);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startJasperStream failed with OSStatus 0x%x (%@)"), started, v9));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1201, v39);

LABEL_4:
  v10 = v4;
LABEL_5:

  return v10;
}

void sub_10000972C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t sub_1000097F8(uint64_t result, __int128 *a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  __int128 v8;
  uint64_t v9;

  if (a4)
  {
    v4 = result;
    result = *(_QWORD *)(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 32) == a3)
          v7 = 2;
        else
          v7 = v6;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v7;
      }
      v8 = *a2;
      v9 = *((_QWORD *)a2 + 2);
      return (*(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t))(*(_QWORD *)result + 8))(result, v4, &v8, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopJasperStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *var2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  var2 = this->var2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!var2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1212, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->var3.var5));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1216, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->var2, this->var3.var5);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopJasperStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1220, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_100009A2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *var2;
  uint64_t v3;
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  const __CFString *ErrorInformationString;
  void *v8;
  void *v9;
  uint64_t started;
  DeviceCMInterface *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;

  var2 = this->var2;
  if (!var2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1232, v8);
    started = 3758097084;
LABEL_10:

    return started;
  }
  v3 = HxISPCaptureDeviceController::SetStreamProperty(var2, this->var3.var3, kFigCaptureStreamProperty_MinimumFrameRate, (const __CFBoolean *)&off_100016C20);
  if ((_DWORD)v3)
  {
    v4 = (DeviceCMInterface *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set min fps 30 failed with OSStatus 0x%x (%@)"), v4, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1239, v9);
LABEL_9:

    started = 3758097129;
    goto LABEL_10;
  }
  v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_MaximumFrameRate, (const __CFBoolean *)&off_100016C20);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v5 = v12;
  if ((_DWORD)v11)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
    v13 = DeviceCMInterface::getErrorInformationString(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set max fps 30 failed with OSStatus 0x%x (%@)"), v11, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1245, v9);
    goto LABEL_9;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("start receiving stream id: %d"), this->var3.var3));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 1250, v15);

  started = HxISPCaptureDeviceController::startReceiveWithRealTimeCallbacks(this->var2, this->var3.var3, (void (*)(__CVBuffer *, CMTime *__struct_ptr, unsigned int, void *))sub_100009E20, this, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
              0,
              0,
              0);
  if ((_DWORD)started)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v16 = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)started);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("startIrStream failed with OSStatus 0x%x (%@)"), started, v8));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 1259, v9);
    goto LABEL_9;
  }
  return started;
}

void sub_100009DA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t (***sub_100009E20(uint64_t (***result)(_QWORD, _QWORD, __int128 *, uint64_t), __int128 *a2, int a3, uint64_t a4))(_QWORD, _QWORD, __int128 *, uint64_t)
{
  uint64_t (***v4)(_QWORD, _QWORD, _OWORD *, uint64_t);
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  uint64_t v8;

  if (a4)
  {
    v4 = result;
    result = *(uint64_t (****)(_QWORD, _QWORD, __int128 *, uint64_t))(a4 + 8);
    if (result)
    {
      if (*(_DWORD *)(a4 + 36) == a3)
      {
        v5 = 1;
      }
      else
      {
        if (*(_DWORD *)(a4 + 28) == a3)
          v6 = 5;
        else
          v6 = 0;
        if (*(_DWORD *)(a4 + 40) == a3)
          v6 = 3;
        if (*(_DWORD *)(a4 + 32) == a3)
          v6 = 2;
        if (*(_DWORD *)(a4 + 44) == a3)
          v5 = 4;
        else
          v5 = v6;
      }
      v7 = *a2;
      v8 = *((_QWORD *)a2 + 2);
      return (uint64_t (***)(_QWORD, _QWORD, __int128 *, uint64_t))(**result)(result, v4, &v7, v5);
    }
  }
  return result;
}

uint64_t DeviceCMInterface::stopPearlIrStream(DeviceCMInterface *this)
{
  HxISPCaptureDeviceController *var2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  var2 = this->var2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v4 = v3;
  if (!var2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1270, v10);
    v7 = 3758097084;
    goto LABEL_5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), this->var3.var3));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v5, 1274, v6);

  v7 = HxISPCaptureDeviceController::stopReceive(this->var2, this->var3.var3);
  if ((_DWORD)v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopIrStream failed with OSStatus 0x%x (%@)"), v7, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1278, v11);

    v7 = 3758097129;
LABEL_5:

  }
  return v7;
}

void sub_10000A060(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::startPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::startRgbStream(this, this->var3.var2);
}

uint64_t DeviceCMInterface::stopRgbStream(DeviceCMInterface *this, uint64_t a2)
{
  HxISPCaptureDeviceController *var2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;

  var2 = this->var2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v6 = v5;
  if (!var2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1337, v12);
    v9 = 3758097084;
    goto LABEL_5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stop receiving stream id: %d"), a2));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1341, v8);

  v9 = HxISPCaptureDeviceController::stopReceive(this->var2, a2);
  if ((_DWORD)v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopRgbStream failed with OSStatus 0x%x (%@)"), v9, v12));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1345, v13);

LABEL_5:
  }
  return v9;
}

void sub_10000A26C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::stopPearlRgbStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var2);
}

uint64_t DeviceCMInterface::stopRgbSuperWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var4);
}

uint64_t DeviceCMInterface::stopRgbWideStream(DeviceCMInterface *this)
{
  return DeviceCMInterface::stopRgbStream(this, this->var3.var1);
}

uint64_t DeviceCMInterface::validateJasperFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  DeviceCMInterface *v4;
  uint64_t result;
  void *v6;
  void *v7;
  uint64_t var3;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("ValidateComplianceWithDetails"), &number);
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    result = 0;
    *a2 = valuePtr;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    var3 = this->var3.var3;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateJasperFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v4, var3, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 1385, v11);

    return 3758097084;
  }
  return result;
}

void sub_10000A408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::validateIrFwStatus(DeviceCMInterface *this, unsigned int *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int v5;
  uint64_t v6;
  DeviceCMInterface *v7;
  void *v8;
  void *v9;
  uint64_t var3;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0x7FFFFFFF;
  *a2 = 0x7FFFFFFF;
  var2 = this->var2;
  if (var2 && *((_BYTE *)var2 + 2148) && (v5 = this->var3.var3, (v5 & 0x80000000) == 0))
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, CFSTR("ValidateComplianceWithDetails"), &number);
    if ((_DWORD)v6)
    {
      v7 = (DeviceCMInterface *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      var3 = this->var3.var3;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed with OSStatus 0x%x for stream id %d (%@)"), v7, var3, v12));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1407, v13);
      v14 = 3758097084;

    }
    else
    {
      v14 = 0;
    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
      return v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("validateIrFwStatus failed as bit mask was NULL")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1419, v17);
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("device is not activated")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1400, v17);
  }
  v14 = 3758097084;

  return v14;
}

void sub_10000A65C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableDefaultDepthStream(DeviceCMInterface *this)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = DeviceCMInterface::setPearlDepthConfiguration((uint64_t)this, 360, 640, 1, 0x1000000);
  if ((_DWORD)v1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setDepthCofiguration failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1435, v4);

  }
  return v1;
}

void sub_10000A758(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setPearlMultiCam(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;
  const void *Group;
  uint64_t v6;
  const void *v7;
  void *v8;
  void *v9;
  void *v10;
  DeviceCMInterface *v11;
  __CFArray *Mutable;
  __CFArray *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t var3;
  const __CFString *ErrorInformationString;
  void *v22;
  void *v23;
  uint64_t v25;
  __CFArray *v26;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting multicam...")));
  NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 1443, v4);

  Group = (const void *)HxISPCaptureDeviceController::FindGroup(this->var2, this->var3.var3);
  v6 = HxISPCaptureDeviceController::FindGroup(this->var2, this->var3.var2);
  if (Group && (v7 = (const void *)v6, Group != (const void *)v6) && v6)
  {
    CFRelease(Group);
    CFRelease(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set multi cam if both rgb/ir groups not the same")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1452, v10);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 1, &kCFTypeArrayCallBacks);
    v13 = Mutable;
    if (Mutable)
      CFArrayAppendValue(Mutable, Group);
    v25 = kFigCaptureDeviceMultiCamConfigurationKey_ActiveSynchronizedStreamsGroups;
    v26 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
    v11 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetDeviceProperty(this->var2, kFigCaptureDeviceProperty_MultiCamConfiguration, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setting kFigCaptureDeviceProperty_MultiCamConfiguration return val is %d"), v11));
    NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 1469, v17);

    if (v13)
      CFRelease(v13);
    if ((_DWORD)v11)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      var3 = this->var3.var3;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kFigCaptureDeviceProperty_MultiCamConfiguration failed with OSStatus 0x%x for stream id %d (%@)"), v11, var3, v22));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1476, v23);

    }
  }
  return v11;
}

void sub_10000AAA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::enableSyncForEnumeratedStreams(DeviceCMInterface *this, int a2)
{
  unsigned int var3;
  __CFArray *Mutable;
  __CFArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t var2;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;

  if (!this->var2 || this->var3.var2 < 0 || this->var3.var3 < 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot enableSyncForEnumeratedStreams one or more stream ids is invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1486, v11);
    v6 = 3758097084;
    goto LABEL_13;
  }
  var3 = a2;
  this->var6 = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 2, &kCFTypeArrayCallBacks);
  v5 = Mutable;
  if (Mutable)
  {
    CFArrayAppendValue(Mutable, *((const void **)this->var2 + this->var3.var2 + 2));
    CFArrayAppendValue(v5, *((const void **)this->var2 + this->var3.var3 + 2));
  }
  if (!var3)
    var3 = this->var3.var3;
  v6 = HxISPCaptureDeviceController::SetGroupProperty(this->var2, var3, kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams, v5);
  if (v5)
    CFRelease(v5);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    var2 = this->var3.var2;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString((DeviceCMInterface *)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed with OSStatus 0x%x for stream id %d (%@)"), v6, var2, v11));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1538, v12);

    v6 = 3758097129;
LABEL_13:

  }
  return v6;
}

void sub_10000AD28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlSyncSlave(DeviceCMInterface *this, uint64_t a2, int a3)
{
  __CFDictionary *Mutable;
  CFNumberRef v7;
  DeviceCMInterface *v8;
  void *v9;
  void *v10;
  const __CFString *ErrorInformationString;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  int valuePtr;

  valuePtr = a3;
  if (this->var2)
  {
    if ((a2 & 0x80000000) == 0 || this->var3.var3 == (_DWORD)a2 || this->var3.var2 == (_DWORD)a2)
    {
      Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled, kCFBooleanTrue);
      CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled, kCFBooleanFalse);
      if (a3)
      {
        v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        CFDictionarySetValue(Mutable, kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_MasterToSlaveFrameRateRatio, v7);
        CFRelease(v7);
      }
      v8 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration, Mutable);
      CFRelease(Mutable);
      if ((_DWORD)v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastPathComponent"));
        ErrorInformationString = DeviceCMInterface::getErrorInformationString(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setSyncSlave failed with OSStatus 0x%x for stream id %d (%@)"), v8, a2, v12));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v10, 1598, v13);

      }
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot set stream %d as master for sync, stream is invalid"), a2));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v19, 1556, v20);

      return 3758096385;
    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v15, 1549, v16);

    return 3758097084;
  }
  return (uint64_t)v8;
}

void sub_10000B018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlIRAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->var3.var3, a2);
}

uint64_t DeviceCMInterface::setPearlRgbAsSyncSlave(DeviceCMInterface *this, int a2)
{
  return DeviceCMInterface::setPearlSyncSlave(this, this->var3.var2, a2);
}

DeviceCMInterface *DeviceCMInterface::disablePearlSyncMode(DeviceCMInterface *this, unsigned int var3)
{
  int var6;
  HxISPCaptureDeviceController *var2;
  const __CFString *v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;

  var6 = this->var6;
  if (var6 == -1)
  {
    var2 = this->var2;
    if (!var3)
      var3 = this->var3.var3;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
  }
  else
  {
    var2 = this->var2;
    v5 = (const __CFString *)kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams;
    var3 = var6;
  }
  v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetGroupProperty(var2, var3, v5, 0);
  if ((_DWORD)v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("disableSyncMode failed with OSStatus 0x%x for stream id (%@)"), v6, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 1636, v11);

  }
  return v6;
}

void sub_10000B194(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::setPearlFormatIndex(DeviceCMInterface *this, unsigned int a2)
{
  return HxISPCaptureDeviceController::SetStreamProperty(this->var2, a2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
}

uint64_t DeviceCMInterface::configPearlDevice(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  uint64_t var2;
  _BOOL4 v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL var0;
  uint64_t var3;
  uint64_t v21;
  uint64_t PearlProjectorHWVersion;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  int v43;

  *(_WORD *)&this->var7 = 0;
  *(_WORD *)&this->var4.var0 = 0;
  this->var4.var2 = 0;
  this->var4.var3 = 0;
  this->var4.var4 = 0;
  if (a2->var2)
  {
    var2 = this->var3.var2;
    if ((_DWORD)var2 == -1)
    {
      DeviceCMInterface::enumerateStreamsIndices(this);
      var2 = this->var3.var2;
      if ((_DWORD)var2 == -1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available RGB stream index")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1731, v10);
LABEL_32:
        v11 = 3758097136;
        goto LABEL_40;
      }
      v5 = a2->var2;
    }
    else
    {
      v5 = 1;
    }
    if (a2->var0 && v5)
    {
      v11 = DeviceCMInterface::enableSyncForEnumeratedStreams(this, var2);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lastPathComponent"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsync 2 3 (enableSyncForEnumeratedStreams) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v13, 1740, v14);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableSyncForEnumeratedStreams failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1744, v10);
        goto LABEL_40;
      }
      v11 = (uint64_t)DeviceCMInterface::setPearlMultiCam(this);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CMMULTICAMCREATE -s 2 3(setPearlMultiCam) ret = %d"), v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v17, 1750, v18);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1754, v10);
        goto LABEL_40;
      }
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var2, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 0, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, 0) ret = %d"), this->var3.var2));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 1760, v28);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1764, v10);
        goto LABEL_40;
      }
      var2 = this->var3.var2;
    }
    v7 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, var2, 1);
    if ((_DWORD)v7)
    {
      v11 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId for rgb failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1773, v10);
LABEL_40:

      return v11;
    }
    v15 = DeviceCMInterface::enablePearlRGBOutput(this);
    if ((_DWORD)v15)
    {
      v11 = v15;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1781, v10);
      goto LABEL_40;
    }
    this->var7 = 1;
  }
  var0 = a2->var0;
  if (!a2->var0)
    goto LABEL_49;
  var3 = this->var3.var3;
  if ((_DWORD)var3 == -1)
  {
    DeviceCMInterface::enumerateStreamsIndices(this);
    var3 = this->var3.var3;
    if ((_DWORD)var3 == -1)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("no available IR stream index")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1792, v10);
      goto LABEL_32;
    }
  }
  v21 = DeviceCMInterface::setPearlMultiOutModeByStreamId(this, var3, 1);
  if ((_DWORD)v21)
  {
    v11 = v21;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setMultiOutModeByStreamId failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1800, v10);
    goto LABEL_40;
  }
  if (this->var0 < 11)
    goto LABEL_35;
  v43 = 0;
  PearlProjectorHWVersion = DeviceCMInterface::getPearlProjectorHWVersion(this, &v43);
  if (!(_DWORD)PearlProjectorHWVersion)
  {
    if (v43 == 10)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "lastPathComponent"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("projector version %d"), 10));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v30, 1816, v31);

      v32 = 1;
LABEL_36:
      v11 = HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var3, kFigCaptureStreamProperty_FormatIndex, (const __CFBoolean *)+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v32));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastPathComponent"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cmsetcurrentformat 2 %d, setPearlFormatIndex(m_streamIdsInfo.rgbPearlStreamId, %d) ret = %d"), this->var3.var2, v32, v11));
      NSLog(CFSTR("<%@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v34, 1826, v35);

      if ((_DWORD)v11)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setPearlFormatIndex failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1830, v10);
        goto LABEL_40;
      }
      v36 = DeviceCMInterface::enablePearlIROutput(this);
      if ((_DWORD)v36)
      {
        v11 = v36;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Configure the primary output to multioutput + enable failed")));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1838, v10);
        goto LABEL_40;
      }
      v38 = DeviceCMInterface::setPearlIrCofiguration(this, a2->var3);
      if ((_DWORD)v38)
      {
        v11 = v38;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastPathComponent"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("set projector mode to %u failed"), a2->var3));
        NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v40, 1846, v41);

        return v11;
      }
      if (a2->var1)
      {
        v42 = DeviceCMInterface::enableDefaultDepthStream(this);
        if ((_DWORD)v42)
        {
          v11 = v42;
          v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastPathComponent"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("enableDefaultDepthStream failed")));
          NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v9, 1856, v10);
          goto LABEL_40;
        }
      }
      this->var8 = 1;
      var0 = a2->var0;
LABEL_49:
      v11 = 0;
      this->var4.var3 = a2->var3;
      this->var4.var0 = var0;
      *(_WORD *)&this->var4.var1 = *(_WORD *)&a2->var1;
      return v11;
    }
LABEL_35:
    v32 = 0;
    goto LABEL_36;
  }
  v11 = PearlProjectorHWVersion;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastPathComponent"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("config pearl device failed to read projector version")));
  NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v24, 1821, v25);

  return v11;
}

void sub_10000BB78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlProjectorHWVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int var3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  var2 = this->var2;
  if (!var2 || (var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlProjectorVersion failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2385, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, CFSTR("ProjectorHWVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorHWVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2397, v13);

    }
  }
  return v6;
}

void sub_10000BE08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setCurrentPearlConfiguration(DeviceCMInterface *this, const PearlConfiguration *a2)
{
  this->var4.var3 = a2->var3;
  this->var4.var2 = a2->var2;
  *(_WORD *)&this->var4.var0 = *(_WORD *)&a2->var0;
  return this;
}

id DeviceCMInterface::getJasperConfigurationStringKey(DeviceCMInterface *this, JasperConfiguration *a2)
{
  JasperConfiguration *p_var5;
  JasperConfiguration v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  p_var5 = &this->var5;
  if (a2)
    p_var5 = a2;
  v3 = *p_var5;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v4, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (v3.var0)
    objc_msgSend(v4, "appendString:", CFSTR("_JASPER_DEPTH"));
  if ((*(_QWORD *)&v3 & 0xFF0000) != 0)
    objc_msgSend(v4, "appendString:", CFSTR("_WIDE"));
  if ((*(_WORD *)&v3.var0 & 0xFF00) != 0)
  {
    if ((*(_DWORD *)&v3.var0 & 0xFF000000) != 0)
      v5 = CFSTR("_SUPER_WIDE_SYNCED");
    else
      v5 = CFSTR("_SUPER_WIDE_UNSYNCED");
    objc_msgSend(v4, "appendString:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v4));

  return v6;
}

void sub_10000BF34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id DeviceCMInterface::getPearlConfigurationStringKey(DeviceCMInterface *this, PearlConfiguration *a2)
{
  PearlConfiguration *p_var4;
  BOOL *p_var1;
  BOOL *p_var2;
  int *p_var3;
  id *p_var5;
  _BOOL4 var0;
  _BOOL4 v8;
  _BOOL4 v9;
  int v10;
  id v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  p_var4 = &this->var4;
  p_var1 = &this->var4.var1;
  p_var2 = &this->var4.var2;
  p_var3 = &this->var4.var3;
  p_var5 = &this->var4.var5;
  if (a2)
  {
    p_var5 = &a2->var5;
    p_var3 = &a2->var3;
    p_var2 = &a2->var2;
    p_var1 = &a2->var1;
    p_var4 = a2;
  }
  var0 = p_var4->var0;
  v8 = *p_var1;
  v9 = *p_var2;
  v10 = *p_var3;
  v11 = *p_var5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  objc_msgSend(v12, "appendString:", CFSTR("DEVICE_CONFIG"));
  if (var0)
    objc_msgSend(v12, "appendString:", CFSTR("_IR"));
  if (v8)
    v13 = CFSTR("_DEPTH");
  else
    v13 = CFSTR("_NO_PCE");
  objc_msgSend(v12, "appendString:", v13);
  if (v9)
    objc_msgSend(v12, "appendString:", CFSTR("_RGB"));
  v14 = CFSTR("_DENSE");
  switch(v10)
  {
    case 0:
      v14 = CFSTR("_IR_MODE_NONE");
      goto LABEL_17;
    case 1:
      v14 = CFSTR("_FLOOD");
      goto LABEL_17;
    case 2:
      v14 = CFSTR("_SPARSE_LOW_POWER");
      goto LABEL_17;
    case 3:
      v14 = CFSTR("_SPARSE");
      goto LABEL_17;
    case 4:
      goto LABEL_17;
    case 5:
      objc_msgSend(v12, "appendString:", CFSTR("_DENSE_PROB_AB"));
      goto LABEL_16;
    case 6:
LABEL_16:
      v14 = CFSTR("_SPARSE_PROB_AB");
LABEL_17:
      objc_msgSend(v12, "appendString:", v14);
      break;
    default:
      break;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithString:](NSString, "stringWithString:", v12));

  return v15;
}

void sub_10000C0C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::isPDECaliobrationValid(DeviceCMInterface *this, BOOL *a2)
{
  HxISPCaptureDeviceController *var2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  CFTypeRef cf;

  var2 = this->var2;
  if (!var2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("plugin CM controller is nil")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2004, v7);
LABEL_6:
    v4 = 3758097084;

    return v4;
  }
  cf = 0;
  *a2 = HxISPCaptureDeviceController::CopyStreamProperty(var2, this->var3.var3, CFSTR("PCECalib"), &cf) == 0;
  if (!cf)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2023, v7);
    goto LABEL_6;
  }
  CFRelease(cf);
  return 0;
}

void sub_10000C22C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperRikerProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  uint64_t v4;
  DeviceCMInterface *v5;
  void *v6;
  void *v7;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("ProjectorRikerFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (DeviceCMInterface *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v5, var5, v10));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v7, 2039, v11);
    v12 = 3758097084;

  }
  else
  {
    v12 = 0;
  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRikerFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2051, v15);
    v12 = 3758097084;

  }
  return v12;
}

void sub_10000C408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerProjectorWillFault(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("ProjectorWillFaultStatus"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerProjectorWillFault failed with OSStatus 0x%x for stream id %d (%@)"), v4, var5, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2067, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorWillFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2079, v13);

  }
  return v4;
}

void sub_10000C5E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getJasperRikerResistance(DeviceCMInterface *this, unint64_t *a2)
{
  DeviceCMInterface *v4;
  void *v5;
  void *v6;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  v4 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("RikerResistance"), &number);
  if ((_DWORD)v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getJasperRikerResistance failed with OSStatus 0x%x for stream id %d (%@)"), v4, var5, v9));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v6, 2094, v10);

  }
  if (number)
  {
    CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
    CFRelease(number);
    *a2 = valuePtr;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RikerResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2106, v13);

  }
  return v4;
}

void sub_10000C7B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getPearlFloodProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  uint64_t var3;
  const __CFString *ErrorInformationString;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  unsigned int valuePtr;
  CFNumberRef number;

  number = 0;
  valuePtr = 0;
  var2 = this->var2;
  if (!var2 || (v5 = this->var3.var3, (v5 & 0x80000000) != 0))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2119, v15);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, CFSTR("ProjectorRosalineFaultStatus"), &number);
    if ((_DWORD)v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
      var3 = this->var3.var3;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getFloodProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, var3, v11));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2126, v12);

    }
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt32Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastPathComponent"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v18, 2138, v19);

    }
  }
  return v6;
}

void sub_10000CA10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getStructuredProjectorFault(DeviceCMInterface *this, unint64_t *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  uint64_t var3;
  const __CFString *ErrorInformationString;
  void *v15;
  void *v16;
  unint64_t valuePtr;
  CFNumberRef number;

  valuePtr = 0;
  number = 0;
  var2 = this->var2;
  if (!var2 || (v5 = this->var3.var3, (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2150, v9);

    return (DeviceCMInterface *)3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(var2, v5, CFSTR("ProjectorFaultStatus"), &number);
    if (number)
    {
      CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr);
      CFRelease(number);
      *a2 = valuePtr;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      var3 = this->var3.var3;
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getStructuredProjectorFault failed with OSStatus 0x%x for stream id %d (%@)"), v6, var3, v15));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2163, v16);

    }
  }
  return v6;
}

void sub_10000CC00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

HxISPCaptureDeviceController *DeviceCMInterface::releaseDevice(DeviceCMInterface *this)
{
  void *v2;
  void *v3;
  void *v4;

  if (DeviceCMInterface::releaseControlOfStreams(this))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("releaseControlOfStreams failed")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v3, 2174, v4);

  }
  return DeviceCMInterface::releaseInterface(this);
}

void sub_10000CCF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

__n128 DeviceCMInterface::getStreamIdsInfo@<Q0>(DeviceCMInterface *this@<X0>, int a2@<W1>, __n128 *a3@<X8>)
{
  __n128 result;

  if (a2)
    DeviceCMInterface::initAndActivateCaptureDeviceController(this);
  result = *(__n128 *)&this->var3.var0;
  *a3 = result;
  a3[1].n128_u64[0] = *(_QWORD *)&this->var3.var4;
  return result;
}

DeviceCMInterface *DeviceCMInterface::getRgbjReport(DeviceCMInterface *this, int *a2, int *a3, int *a4, int *a5, int *a6)
{
  DeviceCMInterface *v12;
  void *v13;
  void *v14;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v17;
  void *v18;
  const __CFNumber *Value;
  const __CFNumber *v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  CFTypeID TypeID;
  CFDictionaryRef theDict;

  theDict = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("RgbjReport"), &theDict);
  if ((_DWORD)v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getRgbjReport: failed with OSStatus 0x%x for stream id %d (%@)"), v12, var5, v17));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v14, 2219, v18);

  }
  else
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerReached"));
    CFNumberGetValue(Value, kCFNumberIntType, a2);
    v20 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportControllerPassed"));
    CFNumberGetValue(v20, kCFNumberIntType, a3);
    v21 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfSuccess"));
    CFNumberGetValue(v21, kCFNumberIntType, a4);
    v22 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportIsfFailure"));
    CFNumberGetValue(v22, kCFNumberIntType, a5);
    *a6 = 0;
    v23 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("RgbjReportFailedToSave"));
    if (v23)
    {
      v24 = v23;
      TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v24))
        CFNumberGetValue(v24, kCFNumberIntType, a6);
      else
        NSLog(CFSTR("The value for key %@ is not a number"), CFSTR("RgbjReportFailedToSave"));
    }
    CFRelease(theDict);
  }
  return v12;
}

void sub_10000CF5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::forceSaveWideJasperCalib(DeviceCMInterface *this)
{
  DeviceCMInterface *v2;
  void *v3;
  void *v4;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v7;
  void *v8;

  v2 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, CFSTR("RgbjForceSaveCalib"), 0);
  if ((_DWORD)v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("forceSaveWideJasperCalib: failed with OSStatus 0x%x for stream id %d (%@)"), v2, var5, v7));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v4, 2250, v8);

  }
  return v2;
}

void sub_10000D070(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setRgbjConfiguration(DeviceCMInterface *this, unsigned int a2, unsigned int a3, uint64_t a4)
{
  void *v6;
  void *v7;
  const __CFBoolean *v8;
  DeviceCMInterface *v9;
  void *v10;
  void *v11;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];

  v17[0] = CFSTR("RgbjConfigurationFeatureVectorSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:"));
  v17[1] = CFSTR("RgbjConfigurationDilutionRate");
  v18[0] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", a4));
  v18[1] = v7;
  v8 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));

  v9 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, CFSTR("RgbjConfiguration"), v8);
  if ((_DWORD)v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setRgbjConfiguration: failed with OSStatus 0x%x for stream id %d (%@)"), v9, var5, v14));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v11, 2263, v15);

  }
  return v9;
}

void sub_10000D22C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::setWideJasperExtrinsics(DeviceCMInterface *this, float a2, float a3, float a4, float a5, float a6, float a7)
{
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  const __CFBoolean *v24;
  DeviceCMInterface *v25;
  void *v26;
  void *v27;
  uint64_t var5;
  const __CFString *ErrorInformationString;
  void *v30;
  void *v31;
  _QWORD v33[6];

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
  v33[0] = v13;
  *(float *)&v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14));
  v33[1] = v15;
  *(float *)&v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  v33[2] = v17;
  *(float *)&v18 = a5;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  v33[3] = v19;
  *(float *)&v20 = a6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
  v33[4] = v21;
  *(float *)&v22 = a7;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
  v33[5] = v23;
  v24 = (const __CFBoolean *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 6));

  v25 = (DeviceCMInterface *)HxISPCaptureDeviceController::SetStreamProperty(this->var2, this->var3.var5, CFSTR("OverrideJasperWideExtrinsics"), v24);
  if ((_DWORD)v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastPathComponent"));
    var5 = this->var3.var5;
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("setWideJasperExtrinsics: failed with OSStatus 0x%x for stream id %d (%@)"), v25, var5, v30));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v27, 2275, v31);

  }
  return v25;
}

void sub_10000D494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getJasperModuleInfo(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, kFigCaptureStreamProperty_ModuleInfo, a2);
}

uint64_t DeviceCMInterface::getJasperCalib(DeviceCMInterface *this, const __CFData **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("JasperCalib"), a2);
}

uint64_t DeviceCMInterface::getJasperCalibData(DeviceCMInterface *this, const __CFDictionary **a2)
{
  return HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var5, CFSTR("JapserCalibData"), a2);
}

uint64_t DeviceCMInterface::getPearlPleUUID(DeviceCMInterface *this, unsigned __int8 *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int var3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFDataRef theData;

  var2 = this->var2;
  if (!var2 || (var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlPCECalib failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2307, v9);

    return 3758097084;
  }
  else
  {
    theData = 0;
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, CFSTR("PCECalib"), &theData);
    if (theData)
    {
      *(_OWORD *)a2 = *(_OWORD *)(CFDataGetBytePtr(theData) + 8);
      CFRelease(theData);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_PCECalib")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2323, v13);

    }
  }
  return v6;
}

void sub_10000D6D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelSerialNumber(uint64_t a1, _QWORD *a2)
{
  HxISPCaptureDeviceController *v3;
  unsigned int v5;
  DeviceCMInterface *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *ErrorInformationString;
  void *v14;
  void *v15;
  id v16;

  v16 = 0;
  v3 = *(HxISPCaptureDeviceController **)(a1 + 16);
  if (!v3 || (v5 = *(_DWORD *)(a1 + 36), (v5 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelSerialNumber failed, ir stream id invalid")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2336, v9);

    return 3758097084;
  }
  else
  {
    v6 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(v3, v5, CFSTR("RigelSerialNumber"), &v16);
    if (v16)
    {
      *a2 = v16;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      ErrorInformationString = DeviceCMInterface::getErrorInformationString(v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_RigelSerialNumber, %@"), v14));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2347, v15);

    }
  }
  return (uint64_t)v6;
}

void sub_10000D89C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t DeviceCMInterface::getPearlRigelOtpVersion(DeviceCMInterface *this, int *a2)
{
  HxISPCaptureDeviceController *var2;
  unsigned int var3;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  CFTypeRef cf;

  cf = 0;
  var2 = this->var2;
  if (!var2 || (var3 = this->var3.var3, (var3 & 0x80000000) != 0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("getPearlRigelOtpVersion failed, ir stream id invalid, %@"), CFSTR("OK")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v8, 2360, v9);

    return 3758097084;
  }
  else
  {
    v6 = HxISPCaptureDeviceController::CopyStreamProperty(var2, var3, CFSTR("ProjectorVersion"), &cf);
    if (cf)
    {
      *a2 = FigCFNumberGetSInt32();
      CFRelease(cf);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorVersion")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v12, 2372, v13);

    }
  }
  return v6;
}

void sub_10000DA40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

DeviceCMInterface *DeviceCMInterface::getGuadalupeValues(DeviceCMInterface *this, uint64_t *a2, uint64_t *a3, uint64_t *a4, int *a5, uint64_t *a6)
{
  DeviceCMInterface *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *ErrorInformationString;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CFTypeRef cf;

  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, CFSTR("GuadRecordRegisters"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    ErrorInformationString = DeviceCMInterface::getErrorInformationString(v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(ErrorInformationString);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadRecordRegisters, %@"), v18));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2415, v19);

LABEL_14:
    return v12;
  }
  *a6 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, CFSTR("GuadLastResistance"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_GuadLastResistance")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2430, v18);
    goto LABEL_14;
  }
  *a5 = FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v12 = (DeviceCMInterface *)HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, CFSTR("BaneState"), &cf);
  if (!cf)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastPathComponent"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneState")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v16, 2444, v18);
    goto LABEL_14;
  }
  *a2 = (int)FigCFNumberGetSInt32();
  CFRelease(cf);
  cf = 0;
  v13 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, CFSTR("ProjectorRosalineFaultStatus"), &cf);
  if (cf)
  {
    *a3 = (int)FigCFNumberGetSInt32();
    CFRelease(cf);
    cf = 0;
    v14 = HxISPCaptureDeviceController::CopyStreamProperty(this->var2, this->var3.var3, CFSTR("BaneResistance"), &cf);
    if (cf)
    {
      if (!(_DWORD)v12)
        LODWORD(v12) = v13;
      *a4 = (int)FigCFNumberGetSInt32();
      CFRelease(cf);
      if ((_DWORD)v12)
        return (DeviceCMInterface *)v12;
      else
        return (DeviceCMInterface *)v14;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastPathComponent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorBaneResistance")));
      NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v25, 2477, v26);

      return (DeviceCMInterface *)v14;
    }
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/DepthDiagnostics/Common/DeviceCMInterface.mm"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastPathComponent"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Null cfType detected for kFigCaptureStreamProperty_ProjectorRosalineFaultStatus")));
    NSLog(CFSTR("<ERROR %@: %@:%d> %@"), CFSTR("Diagnostic_FW_Status_iOS"), v22, 2460, v23);

    return (DeviceCMInterface *)v13;
  }
}

void sub_10000DE58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_10000E394(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  operator delete[]();
}

void sub_10000E6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000E81C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000E84C(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000E8FC();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_10000E8FC()
{
  sub_10000E910("basic_string");
}

void sub_10000E910(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000E960(exception, a1);
}

void sub_10000E94C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_10000E960(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_getCalibResults_focalPoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCalibResults:focalPoint:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_initDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initDevice");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_log_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
