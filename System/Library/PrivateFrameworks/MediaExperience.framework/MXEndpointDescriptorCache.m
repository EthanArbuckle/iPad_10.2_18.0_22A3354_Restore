@implementation MXEndpointDescriptorCache

- (__CFArray)copyAvailableEndpointsForManager:(OpaqueFigEndpointManager *)a3
{
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  __CFArray *v6;
  CFTypeRef cf;

  if (!a3)
    return 0;
  cf = 0;
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
    v5(CMBaseObject, *MEMORY[0x1E0CA3A40], *MEMORY[0x1E0C9AE00], &cf);
  MEMORY[0x1940352BC](self->_cacheMutex);
  v6 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, (uint64_t)CFSTR("Endpoint"));
  MEMORY[0x1940352C8](self->_cacheMutex);
  if (cf)
    CFRelease(cf);
  return v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_13 != -1)
    dispatch_once(&sharedInstance_onceToken_13, &__block_literal_global_74);
  return (id)sharedInstance_sSharedInstance_11;
}

- (__CFArray)copyRegisteredEndpointMangers
{
  __CFArray *registeredEndpointManagers;
  __CFArray *Copy;

  MEMORY[0x1940352BC](self->_cacheMutex, a2);
  registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers)
    Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], registeredEndpointManagers);
  else
    Copy = 0;
  MEMORY[0x1940352C8](self->_cacheMutex);
  return Copy;
}

- (__CFArray)copyRouteDescriptorsForEndpoints:(__CFArray *)a3
{
  __CFArray *v4;

  MEMORY[0x1940352BC](self->_cacheMutex, a2);
  v4 = MXEndpointDescriptorCopyAvailableRouteDescriptorsFromEndpoints(self->_availableEndpointsInfo);
  MEMORY[0x1940352C8](self->_cacheMutex);
  return v4;
}

- (OpaqueFigEndpointManager)getEndpointManagerForType:(__CFString *)a3
{
  CFIndex v4;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *registeredEndpointManagers;
  OpaqueFigEndpointManager *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v10)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef cf;

  MEMORY[0x1940352BC](self->_cacheMutex, a2);
  v4 = 0;
  v5 = *MEMORY[0x1E0CA3A40];
  v6 = *MEMORY[0x1E0C9AE00];
  while (1)
  {
    registeredEndpointManagers = self->_registeredEndpointManagers;
    if (registeredEndpointManagers)
      registeredEndpointManagers = (const __CFArray *)CFArrayGetCount(registeredEndpointManagers);
    if (v4 >= (uint64_t)registeredEndpointManagers)
    {
      ValueAtIndex = 0;
      goto LABEL_14;
    }
    ValueAtIndex = (OpaqueFigEndpointManager *)CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v4);
    cf = 0;
    CMBaseObject = FigEndpointManagerGetCMBaseObject();
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v10)
      v10(CMBaseObject, v5, v6, &cf);
    if (FigCFEqual())
      break;
    if (cf)
      CFRelease(cf);
    ++v4;
  }
  if (cf)
    CFRelease(cf);
LABEL_14:
  MEMORY[0x1940352C8](self->_cacheMutex);
  return ValueAtIndex;
}

- (OpaqueFigEndpoint)copyEndpointWithDeviceID:(__CFString *)a3 isStreamID:(BOOL)a4 managerType:(__CFString *)a5 routingContextUUID:(__CFString *)a6
{
  int ContextType;
  __CFArray *registeredEndpointManagers;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  __CFArray *Mutable;
  const __CFAllocator *v15;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v18)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *);
  int v19;
  void (*v20)(const void *, __CFString *, const __CFAllocator *, _QWORD, _QWORD, CFArrayRef *);
  uint64_t (*v21)(void);
  uint64_t v22;
  void (*v23)(uint64_t, __CFString *, const __CFAllocator *, CFArrayRef *);
  CFIndex Count;
  CFIndex v25;
  CFIndex i;
  const void *v27;
  int v28;
  CFIndex v29;
  const void *v30;
  OpaqueFigEndpoint *v31;
  CFIndex v32;
  const void *v33;
  CFIndex v34;
  _BOOL4 v36;
  int v37;
  uint64_t v38;
  CFArrayRef theArray;
  CFTypeRef cf;

  v36 = a4;
  if (!a3)
    return 0;
  ContextType = FigRoutingManagerContextUtilities_GetContextType((uint64_t)a6);
  MEMORY[0x1940352BC](self->_cacheMutex);
  registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers && (v11 = CFArrayGetCount(registeredEndpointManagers), v11 >= 1))
  {
    v12 = v11;
    v13 = 0;
    Mutable = 0;
    v38 = *MEMORY[0x1E0CA3A40];
    v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v37 = ContextType;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v13);
      cf = 0;
      CMBaseObject = FigEndpointManagerGetCMBaseObject();
      v18 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                        + 48);
      if (v18)
        v18(CMBaseObject, v38, v15, &cf);
      if (FigCFEqual() && !FigRoutingManagerShouldSkipEndpointManager())
      {
        if (FigCFEqual())
        {
          theArray = 0;
          if (ContextType == 13)
          {
            v20 = *(void (**)(const void *, __CFString *, const __CFAllocator *, _QWORD, _QWORD, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 24);
            if (v20)
              v20(ValueAtIndex, CFSTR("VAEM_AvailableInputEndpoints"), v15, 0, 0, &theArray);
          }
          else
          {
            v22 = FigEndpointManagerGetCMBaseObject();
            v23 = *(void (**)(uint64_t, __CFString *, const __CFAllocator *, CFArrayRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
            if (v23)
              v23(v22, CFSTR("VAEM_AllEndpoints"), v15, &theArray);
          }
          Mutable = CFArrayCreateMutable(v15, 0, MEMORY[0x1E0C9B378]);
          if (theArray)
          {
            Count = CFArrayGetCount(theArray);
            if (Count >= 1)
            {
              v25 = Count;
              for (i = 0; i != v25; ++i)
              {
                v27 = CFArrayGetValueAtIndex(theArray, i);
                if (FigEndpointUtility_EndpointPredicate_ContainsID())
                  CFArrayAppendValue(Mutable, v27);
              }
            }
          }
          if (Mutable && !CFArrayGetCount(Mutable))
          {
            CFRelease(Mutable);
            Mutable = 0;
          }
          ContextType = v37;
          if (theArray)
            CFRelease(theArray);
        }
        else
        {
          if (v36)
            v21 = MEMORY[0x1E0CA07F0];
          else
            v21 = MEMORY[0x1E0CA07E8];
          Mutable = -[MXEndpointDescriptorCache _copyMatchingEndpointsForManagerType:predicateMatchFunction:inEndpointPredicateRefCon:](self, "_copyMatchingEndpointsForManagerType:predicateMatchFunction:inEndpointPredicateRefCon:", a5, v21, a3);
        }
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
      if (cf)
        CFRelease(cf);
      if (++v13 == v12)
        v28 = 1;
      else
        v28 = v19;
    }
    while (v28 != 1);
  }
  else
  {
    Mutable = 0;
  }
  if (FigCFEqual())
  {
    if (Mutable)
      v29 = CFArrayGetCount(Mutable);
    else
      v29 = 0;
    if (ContextType == 7 || ContextType == 9)
    {
      if (v29 < 1)
        goto LABEL_62;
      v32 = 0;
      while (1)
      {
        v33 = CFArrayGetValueAtIndex(Mutable, v32);
        if ((FigEndpointGetSupportedFeatures() & 0x10) != 0)
          break;
        if (v29 == ++v32)
          goto LABEL_62;
      }
    }
    else
    {
      if (v29 < 1)
        goto LABEL_62;
      v34 = 0;
      while (1)
      {
        v33 = CFArrayGetValueAtIndex(Mutable, v34);
        if ((FigEndpointGetSupportedFeatures() & 0x10) == 0)
          break;
        if (v29 == ++v34)
          goto LABEL_62;
      }
    }
    if (v33)
    {
      v31 = (OpaqueFigEndpoint *)CFRetain(v33);
      goto LABEL_63;
    }
LABEL_62:
    v31 = 0;
LABEL_63:
    if (!Mutable)
      goto LABEL_67;
    goto LABEL_66;
  }
  if (!Mutable)
  {
    v31 = 0;
    goto LABEL_67;
  }
  if (CFArrayGetCount(Mutable) >= 1 && (v30 = CFArrayGetValueAtIndex(Mutable, 0)) != 0)
    v31 = (OpaqueFigEndpoint *)CFRetain(v30);
  else
    v31 = 0;
LABEL_66:
  CFRelease(Mutable);
LABEL_67:
  MEMORY[0x1940352C8](self->_cacheMutex);
  return v31;
}

- (__CFArray)_copyMatchingEndpointsForManagerType:(__CFString *)a3 predicateMatchFunction:(void *)a4 inEndpointPredicateRefCon:(void *)a5
{
  __CFArray *Mutable;
  CFIndex i;
  const __CFArray *availableEndpointsInfo;
  const __CFDictionary *ValueAtIndex;
  const void *Value;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  for (i = 0; ; ++i)
  {
    availableEndpointsInfo = self->_availableEndpointsInfo;
    if (availableEndpointsInfo)
      availableEndpointsInfo = (const __CFArray *)CFArrayGetCount(availableEndpointsInfo);
    if (i >= (uint64_t)availableEndpointsInfo)
      break;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_availableEndpointsInfo, i);
    CFDictionaryGetValue(ValueAtIndex, CFSTR("ManagerType"));
    Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("Endpoint"));
    if (FigCFEqual())
    {
      if (((unsigned int (*)(const void *, void *))a4)(Value, a5))
        CFArrayAppendValue(Mutable, Value);
    }
  }
  return Mutable;
}

- (OpaqueFigReentrantMutex)_getCacheMutex
{
  return self->_cacheMutex;
}

- (void)_availableEndpointsDidChangeForEndpointManager:(OpaqueFigEndpointManager *)a3 atDate:(id)a4
{
  const __CFAllocator *v6;
  uint64_t CMBaseObject;
  void (*v8)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *);
  __CFArray *v12;
  __CFArray *v13;
  __CFArray *availableEndpointsInfo;
  CFIndex Count;
  CFIndex v16;
  CFIndex i;
  MXEndpointDescriptorCache *v18;
  __CFArray *v19;
  CFIndex v20;
  uint64_t v21;
  CFMutableDictionaryRef Mutable;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *);
  CFIndex v25;
  NSObject *notificationQueue;
  __CFArray *v27;
  OpaqueFigEndpointManager *v28;
  MXEndpointDescriptorCache *v29;
  __CFArray *theArray;
  _QWORD v31[8];
  os_log_type_t type;
  int v33;
  CFTypeRef v34;
  CFTypeRef v35;
  CFTypeRef cf[18];

  cf[16] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  v34 = 0;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v8 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 8)
                                                                                  + 48);
  if (v8)
    v8(CMBaseObject, *MEMORY[0x1E0CA3A40], v6, &v34);
  if (dword_1EE2B3F38)
  {
    v33 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v35 = 0;
  v28 = a3;
  v10 = FigEndpointManagerGetCMBaseObject();
  v11 = *(void (**)(uint64_t, _QWORD, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 8)
                                                                                   + 48);
  if (v11)
    v11(v10, *MEMORY[0x1E0CA3A28], v6, &v35);
  v29 = self;
  v12 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, (uint64_t)CFSTR("Endpoint"));
  v13 = MXCopyCFArrayDifferenceFromArray((uint64_t)v12, (const __CFArray *)v35);
  v27 = v12;
  theArray = MXCopyCFArrayDifferenceFromArray((uint64_t)v35, v12);
  if (theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      MXEndpointDescriptorLogRouteDelta((uint64_t)v34, self->_availableEndpointsInfo, (uint64_t)theArray, 1);
      availableEndpointsInfo = self->_availableEndpointsInfo;
      if (availableEndpointsInfo)
      {
        Count = CFArrayGetCount(availableEndpointsInfo);
        if (Count >= 1)
        {
          v16 = Count;
          for (i = 0; i < v16; ++i)
          {
            CFArrayGetValueAtIndex(availableEndpointsInfo, i);
            FigCFDictionaryGetValue();
            if (FigCFArrayContainsValue())
            {
              CMNotificationCenterGetDefaultLocalCenter();
              +[MXEndpointDescriptorCache sharedInstance](MXEndpointDescriptorCache, "sharedInstance");
              CMNotificationCenterRemoveListener();
              CFArrayRemoveValueAtIndex(availableEndpointsInfo, i--);
              v16 = CFArrayGetCount(availableEndpointsInfo);
            }
          }
        }
      }
    }
  }
  v18 = self;
  if (v13 && CFArrayGetCount(v13))
  {
    v19 = self->_availableEndpointsInfo;
    if (CFArrayGetCount(v13) >= 1)
    {
      v20 = 0;
      v21 = *MEMORY[0x1E0CA43E0];
      do
      {
        Mutable = CFDictionaryCreateMutable(v6, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        FigCFDictionarySetValue();
        CFArrayGetValueAtIndex(v13, v20);
        FigCFDictionarySetValue();
        cf[0] = 0;
        CFArrayGetValueAtIndex(v13, v20);
        v23 = FigEndpointGetCMBaseObject();
        v24 = *(void (**)(uint64_t, uint64_t, const __CFAllocator *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                          + 48);
        if (v24)
          v24(v23, v21, v6, cf);
        FigCFDictionarySetValue();
        if (cf[0])
        {
          CFRelease(cf[0]);
          cf[0] = 0;
        }
        CFArrayAppendValue(v19, Mutable);
        if (Mutable)
          CFRelease(Mutable);
        ++v20;
      }
      while (v20 < CFArrayGetCount(v13));
    }
    if (CFArrayGetCount(v13) >= 1)
    {
      v25 = 0;
      do
      {
        CFArrayGetValueAtIndex(v13, v25);
        FigEndpointDescriptorUtility_IsEndpointOfType();
        CMNotificationCenterGetDefaultLocalCenter();
        +[MXEndpointDescriptorCache sharedInstance](MXEndpointDescriptorCache, "sharedInstance");
        CMNotificationCenterAddListener();
        -[MXEndpointDescriptorCache _endpointDescriptionDidChangeForEndpoint:](+[MXEndpointDescriptorCache sharedInstance](MXEndpointDescriptorCache, "sharedInstance"), "_endpointDescriptionDidChangeForEndpoint:", CFArrayGetValueAtIndex(v13, v25++));
      }
      while (v25 < CFArrayGetCount(v13));
    }
    v18 = v29;
    MXEndpointDescriptorLogRouteDelta((uint64_t)v34, v29->_availableEndpointsInfo, (uint64_t)v13, 0);
  }
  if (v28)
    CFRetain(v28);
  if (v35)
    CFRetain(v35);
  if (v13)
    CFRetain(v13);
  if (theArray)
    CFRetain(theArray);
  notificationQueue = v18->_notificationQueue;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __83__MXEndpointDescriptorCache__availableEndpointsDidChangeForEndpointManager_atDate___block_invoke;
  v31[3] = &__block_descriptor_64_e5_v8__0l;
  v31[4] = v28;
  v31[5] = v35;
  v31[6] = v13;
  v31[7] = theArray;
  MXDispatchAsync((uint64_t)"-[MXEndpointDescriptorCache _availableEndpointsDidChangeForEndpointManager:atDate:]", (uint64_t)"MXEndpointDescriptorCache.m", 727, 0, 0, notificationQueue, (uint64_t)v31);
  if (v34)
  {
    CFRelease(v34);
    v34 = 0;
  }
  if (v27)
    CFRelease(v27);
  if (v35)
    CFRelease(v35);
  if (v13)
    CFRelease(v13);
  if (theArray)
    CFRelease(theArray);
}

void __83__MXEndpointDescriptorCache__availableEndpointsDidChangeForEndpointManager_atDate___block_invoke(const void **a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  const void *v5;

  FigRoutingManagerAvailableEndpointsDidChangeForEndpointManager(a1[4], a1[5], a1[6], a1[7]);
  v2 = a1[4];
  if (v2)
    CFRelease(v2);
  v3 = a1[5];
  if (v3)
    CFRelease(v3);
  v4 = a1[6];
  if (v4)
    CFRelease(v4);
  v5 = a1[7];
  if (v5)
    CFRelease(v5);
}

MXEndpointDescriptorCache *__43__MXEndpointDescriptorCache_sharedInstance__block_invoke()
{
  MXEndpointDescriptorCache *result;

  result = objc_alloc_init(MXEndpointDescriptorCache);
  sharedInstance_sSharedInstance_11 = (uint64_t)result;
  return result;
}

- (MXEndpointDescriptorCache)init
{
  MXEndpointDescriptorCache *v2;
  const __CFAllocator *v3;
  const CFArrayCallBacks *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXEndpointDescriptorCache;
  v2 = -[MXEndpointDescriptorCache init](&v7, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    v2->_registeredEndpointManagers = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v2->_availableEndpointsInfo = CFArrayCreateMutable(v3, 0, v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_notificationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mediaexperience.mxendpointdescriptor.notificationQueue", v5);
    v2->_cacheMutex = (OpaqueFigReentrantMutex *)FigReentrantMutexCreate();
  }
  return v2;
}

- (void)dealloc
{
  __CFArray *registeredEndpointManagers;
  __CFArray *availableEndpointsInfo;
  objc_super v5;

  registeredEndpointManagers = self->_registeredEndpointManagers;
  if (registeredEndpointManagers)
    CFRelease(registeredEndpointManagers);
  self->_registeredEndpointManagers = 0;
  availableEndpointsInfo = self->_availableEndpointsInfo;
  if (availableEndpointsInfo)
    CFRelease(availableEndpointsInfo);
  self->_availableEndpointsInfo = 0;
  dispatch_release((dispatch_object_t)self->_notificationQueue);
  self->_notificationQueue = 0;
  FigSimpleMutexDestroy();
  self->_cacheMutex = 0;
  v5.receiver = self;
  v5.super_class = (Class)MXEndpointDescriptorCache;
  -[MXEndpointDescriptorCache dealloc](&v5, sel_dealloc);
}

- (void)registerEndpointManagerForCaching:(OpaqueFigEndpointManager *)a3
{
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  CFTypeRef cf[21];

  cf[20] = *(CFTypeRef *)MEMORY[0x1E0C80C00];
  if (a3)
  {
    MEMORY[0x1940352BC](self->_cacheMutex, a2);
    if (!FigCFArrayContainsValue())
    {
      cf[0] = 0;
      CMBaseObject = FigEndpointManagerGetCMBaseObject();
      v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v6)
        v6(CMBaseObject, *MEMORY[0x1E0CA3A40], *MEMORY[0x1E0C9AE00], cf);
      if (dword_1EE2B3F38)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (FigCFEqual())
      {
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        CFArrayInsertValueAtIndex(self->_registeredEndpointManagers, 0, a3);
      }
      else
      {
        CFArrayAppendValue(self->_registeredEndpointManagers, a3);
        CMNotificationCenterGetDefaultLocalCenter();
        CMNotificationCenterAddListener();
        -[MXEndpointDescriptorCache _availableEndpointsDidChangeForEndpointManager:atDate:](self, "_availableEndpointsDidChangeForEndpointManager:atDate:", a3, objc_msgSend(MEMORY[0x1E0C99D68], "date"));
      }
      if (cf[0])
        CFRelease(cf[0]);
    }
    MEMORY[0x1940352C8](self->_cacheMutex);
  }
}

- (__CFArray)copyAvailableRouteDescriptorsForManager:(OpaqueFigEndpointManager *)a3
{
  uint64_t CMBaseObject;
  void (*v5)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  __CFArray *v6;
  CFTypeRef cf;

  if (!a3)
    return 0;
  cf = 0;
  CMBaseObject = FigEndpointManagerGetCMBaseObject();
  v5 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v5)
    v5(CMBaseObject, *MEMORY[0x1E0CA3A40], *MEMORY[0x1E0C9AE00], &cf);
  MEMORY[0x1940352BC](self->_cacheMutex);
  v6 = MXEndpointDescriptorCopyReducedForManager(self->_availableEndpointsInfo, (uint64_t)CFSTR("RouteDescriptor"));
  MEMORY[0x1940352C8](self->_cacheMutex);
  if (cf)
    CFRelease(cf);
  return v6;
}

- (__CFDictionary)copyRouteDescriptorForEndpoint:(OpaqueFigEndpoint *)a3
{
  __CFArray *v5;
  const __CFArray *v6;
  const void *ValueAtIndex;
  __CFDictionary *v8;

  if (!a3)
    return 0;
  MEMORY[0x1940352BC](self->_cacheMutex, a2);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
  v5 = MXEndpointDescriptorCopyAvailableRouteDescriptorsFromEndpoints(self->_availableEndpointsInfo);
  if (v5)
  {
    v6 = v5;
    if (CFArrayGetCount(v5) && (ValueAtIndex = CFArrayGetValueAtIndex(v6, 0)) != 0)
      v8 = (__CFDictionary *)CFRetain(ValueAtIndex);
    else
      v8 = 0;
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }
  MEMORY[0x1940352C8](self->_cacheMutex);
  return v8;
}

- (OpaqueFigEndpoint)copyEndpointFromRouteDescriptor:(__CFDictionary *)a3 routingContextUUID:(__CFString *)a4
{
  uint64_t Value;
  uint64_t v8;
  int ContextType;
  const void *v10;
  CFIndex v11;
  uint64_t v12;
  const __CFArray *registeredEndpointManagers;
  const void *ValueAtIndex;
  uint64_t CMBaseObject;
  void (*v16)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFTypeRef v17;
  void (*v18)(const void *, __CFString *, uint64_t, _QWORD, _QWORD, CFTypeRef *);
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  const __CFArray *v29;
  OpaqueFigEndpoint *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t, uint64_t, CFTypeRef *);
  CFIndex Count;
  const void *v34;
  CFIndex v35;
  CFIndex v36;
  const __CFString *v38;
  uint64_t v39;
  MXEndpointDescriptorCache *v40;
  uint64_t v41;
  int v42;
  CFTypeRef v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  CFTypeRef cf;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  Value = FigCFDictionaryGetValue();
  if (!Value)
    return 0;
  v8 = Value;
  ContextType = FigRoutingManagerContextUtilities_GetContextType((uint64_t)a4);
  MEMORY[0x1940352BC](self->_cacheMutex);
  CFDictionaryGetValue(a3, CFSTR("AudioRouteName"));
  v10 = 0;
  v11 = 0;
  v41 = *MEMORY[0x1E0CA3A40];
  v12 = *MEMORY[0x1E0C9AE00];
  v38 = CFSTR("HeadsetBT");
  v39 = *MEMORY[0x1E0CA3A80];
  v42 = ContextType;
  while (1)
  {
    registeredEndpointManagers = self->_registeredEndpointManagers;
    if (registeredEndpointManagers)
      registeredEndpointManagers = (const __CFArray *)CFArrayGetCount(registeredEndpointManagers);
    if (v11 >= (uint64_t)registeredEndpointManagers)
      break;
    ValueAtIndex = CFArrayGetValueAtIndex(self->_registeredEndpointManagers, v11);
    if (!FigRoutingManagerShouldSkipEndpointManager())
    {
      cf = 0;
      CMBaseObject = FigEndpointManagerGetCMBaseObject();
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v16)
        v16(CMBaseObject, v41, v12, &cf);
      if (FigCFEqual() && FigCFEqual())
      {
        v17 = cf;
        ContextType = v42;
        if (!cf)
          goto LABEL_24;
LABEL_23:
        CFRelease(v17);
LABEL_24:
        v10 = ValueAtIndex;
        break;
      }
      ContextType = v42;
      if (FigCFEqual() && v42 != 13 && (FigCFEqual() || FigCFEqual()))
      {
        if (!CFDictionaryGetValue(a3, CFSTR("PortNumber")))
          goto LABEL_22;
      }
      else if (FigCFEqual())
      {
        v10 = ValueAtIndex;
        if (v42 == 13)
        {
LABEL_22:
          v17 = cf;
          if (cf)
            goto LABEL_23;
          goto LABEL_24;
        }
      }
      if (cf)
        CFRelease(cf);
    }
    ++v11;
  }
  if (!v10)
  {
    MEMORY[0x1940352C8](self->_cacheMutex);
    return 0;
  }
  if (ContextType == 13)
  {
    v40 = self;
    cf = 0;
    v18 = *(void (**)(const void *, __CFString *, uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                                                  + 24);
    if (v18)
      v18(v10, CFSTR("VAEM_AvailableInputEndpoints"), v12, 0, 0, &cf);
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v20 = (void *)cf;
    v21 = objc_msgSend((id)cf, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v45;
      v24 = *MEMORY[0x1E0CA4258];
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v45 != v23)
            objc_enumerationMutation(v20);
          v26 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v43 = 0;
          v27 = FigEndpointGetCMBaseObject();
          v28 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                              + 48);
          if (v28)
            v28(v27, v24, v12, &v43);
          if (objc_msgSend((id)v43, "containsString:", v8, v38))
            objc_msgSend(v19, "addObject:", v26);
          if (v43)
            CFRelease(v43);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v22);
    }
    v29 = (const __CFArray *)v19;

    if (cf)
      CFRelease(cf);
    self = v40;
    ContextType = v42;
  }
  else
  {
    v29 = (const __CFArray *)FigEndpointManagerCopyMatchingEndpoints();
  }
  cf = 0;
  v31 = FigEndpointManagerGetCMBaseObject();
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v32)
    v32(v31, v41, v12, &cf);
  FigRoutingManagerLogEndpointIDs((uint64_t)CFSTR("The matching endpoints are:"), v29, 0, 1);
  if (!FigCFEqual())
  {
    if (v29)
    {
      if (CFArrayGetCount(v29) >= 1)
      {
        v34 = CFArrayGetValueAtIndex(v29, 0);
        if (v34)
          goto LABEL_73;
      }
    }
    goto LABEL_74;
  }
  if (v29)
    Count = CFArrayGetCount(v29);
  else
    Count = 0;
  if (ContextType == 7 || ContextType == 9)
  {
    if (Count >= 1)
    {
      v35 = 0;
      do
      {
        v34 = CFArrayGetValueAtIndex(v29, v35);
        if ((FigEndpointGetSupportedFeatures() & 0x10) != 0)
          goto LABEL_72;
      }
      while (Count != ++v35);
    }
LABEL_74:
    v30 = 0;
    goto LABEL_75;
  }
  if (Count < 1)
    goto LABEL_74;
  v36 = 0;
  while (1)
  {
    v34 = CFArrayGetValueAtIndex(v29, v36);
    if ((FigEndpointGetSupportedFeatures() & 0x10) == 0)
      break;
    if (Count == ++v36)
      goto LABEL_74;
  }
LABEL_72:
  if (!v34)
    goto LABEL_74;
LABEL_73:
  v30 = (OpaqueFigEndpoint *)CFRetain(v34);
LABEL_75:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v29)
    CFRelease(v29);
  MEMORY[0x1940352C8](self->_cacheMutex);
  if (v30
    && FigRoutingManagerIsEndpointOfType((uint64_t)v30)
    && CMSMVAUtility_IsPortAvailableForEndpoint((uint64_t)v30, 0))
  {
    CFRelease(v30);
    return FigRoutingManagerCopyEndpointWithDeviceID(v8, 0, v39, 0);
  }
  return v30;
}

- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3 notificationName:(__CFString *)a4 payload:(__CFDictionary *)a5
{
  CFIndex i;
  const __CFArray *availableEndpointsInfo;
  __CFDictionary *v11;
  NSObject *notificationQueue;
  _QWORD v13[7];

  if (a3)
  {
    for (i = 0; ; ++i)
    {
      availableEndpointsInfo = self->_availableEndpointsInfo;
      if (availableEndpointsInfo)
        availableEndpointsInfo = (const __CFArray *)CFArrayGetCount(availableEndpointsInfo);
      if (i >= (uint64_t)availableEndpointsInfo)
        break;
      CFArrayGetValueAtIndex(self->_availableEndpointsInfo, i);
      FigCFDictionaryGetValue();
      if (FigCFEqual())
      {
        v11 = FigEndpointDescriptorUtility_CopyDescriptorForNonVirtualAudioEndpoint((uint64_t)a3);
        FigCFDictionarySetValue();
        if (v11)
          CFRelease(v11);
      }
    }
    CFRetain(a3);
    if (a4)
      CFRetain(a4);
    if (a5)
      CFRetain(a5);
    notificationQueue = self->_notificationQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__MXEndpointDescriptorCache__endpointDescriptionDidChangeForEndpoint_notificationName_payload___block_invoke;
    v13[3] = &__block_descriptor_56_e5_v8__0l;
    v13[4] = a3;
    v13[5] = a4;
    v13[6] = a5;
    MXDispatchAsync((uint64_t)"-[MXEndpointDescriptorCache _endpointDescriptionDidChangeForEndpoint:notificationName:payload:]", (uint64_t)"MXEndpointDescriptorCache.m", 761, 0, 0, notificationQueue, (uint64_t)v13);
  }
}

void __95__MXEndpointDescriptorCache__endpointDescriptionDidChangeForEndpoint_notificationName_payload___block_invoke(const void **a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  FigRoutingManagerHandleFigEndpointDescriptionChangedNotificationFromCache(a1[4], a1[5], a1[6]);
  v2 = a1[4];
  if (v2)
    CFRelease(v2);
  v3 = a1[5];
  if (v3)
    CFRelease(v3);
  v4 = a1[6];
  if (v4)
    CFRelease(v4);
}

- (void)_endpointDescriptionDidChangeForEndpoint:(OpaqueFigEndpoint *)a3
{
  -[MXEndpointDescriptorCache _endpointDescriptionDidChangeForEndpoint:notificationName:payload:](self, "_endpointDescriptionDidChangeForEndpoint:notificationName:payload:", a3, 0, 0);
}

@end
