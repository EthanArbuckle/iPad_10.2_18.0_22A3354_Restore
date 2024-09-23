@implementation AVFigAssetTrackInspector

- (int)trackID
{
  OpaqueFigAssetTrack *figAssetTrack;
  void (*v3)(OpaqueFigAssetTrack *, int *, _QWORD);
  int v5;

  v5 = 0;
  figAssetTrack = self->_figAssetTrack;
  v3 = *(void (**)(OpaqueFigAssetTrack *, int *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (!v3)
    return 0;
  v3(figAssetTrack, &v5, 0);
  return v5;
}

- (id)_initWithAsset:(id)a3 trackID:(int)a4 trackIndex:(int64_t)a5
{
  uint64_t v6;
  _QWORD *v8;
  CFTypeRef v9;
  const void *v10;
  void (*v11)(const void *, uint64_t, CFTypeRef *);
  uint64_t CMBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v14;
  CFTypeRef v15;
  BOOL v16;
  CFTypeID v17;
  CFTypeID TypeID;
  CFIndex Count;
  CFTypeRef v20;
  void (*v21)(CFTypeRef, _QWORD, int *);
  CFTypeRef v22;
  NSObject *v23;
  CFTypeRef cf;
  int v26;
  CFTypeRef ValueAtIndex;
  objc_super v28;

  v6 = *(_QWORD *)&a4;
  v28.receiver = self;
  v28.super_class = (Class)AVFigAssetTrackInspector;
  v8 = -[AVAssetTrackInspector _initWithAsset:trackID:trackIndex:](&v28, sel__initWithAsset_trackID_trackIndex_);
  if (v8)
  {
    if (a3)
    {
      ValueAtIndex = 0;
      v9 = (CFTypeRef)objc_msgSend(a3, "_figAsset");
      v26 = 0;
      if (v9)
      {
        v10 = v9;
        if ((_DWORD)v6)
        {
          v11 = *(void (**)(const void *, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 40);
          if (v11)
            v11(v10, v6, &ValueAtIndex);
        }
        else if ((a5 & 0x8000000000000000) == 0)
        {
          cf = 0;
          CMBaseObject = FigAssetGetCMBaseObject();
          v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 48);
          if (v13)
          {
            v14 = v13(CMBaseObject, *MEMORY[0x1E0CC3AA8], *MEMORY[0x1E0C9AE00], &cf);
            v15 = cf;
            if (v14)
              v16 = 1;
            else
              v16 = cf == 0;
            if (!v16)
            {
              v17 = CFGetTypeID(cf);
              TypeID = CFArrayGetTypeID();
              v15 = cf;
              if (v17 == TypeID)
              {
                Count = CFArrayGetCount((CFArrayRef)cf);
                v15 = cf;
                if (Count > a5)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)cf, a5);
                  v15 = cf;
                }
              }
            }
            if (v15)
              CFRelease(v15);
          }
        }
        v20 = ValueAtIndex;
        if (ValueAtIndex)
        {
          v21 = *(void (**)(CFTypeRef, _QWORD, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
          if (v21)
            v21(v20, 0, &v26);
        }
        v22 = CFRetain(v10);
        v9 = ValueAtIndex;
        v8[4] = v22;
        if (v9)
          v9 = CFRetain(v9);
      }
      else
      {
        v8[4] = 0;
      }
      v8[5] = v9;
      v8[6] = objc_alloc_init(AVDispatchOnce);
      v8[8] = objc_alloc_init(AVDispatchOnce);
      v8[10] = objc_alloc_init(AVDispatchOnce);
      *((_DWORD *)v8 + 32) = v26;
      *((_BYTE *)v8 + 144) = objc_msgSend(a3, "_prefersNominalDurations");
      v8[17] = (id)objc_msgSend(a3, "_weakReference");
      v8[13] = FigSimpleMutexCreate();
      v8[15] = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
      v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v8[14] = dispatch_queue_create("com.apple.avfoundation.avassettrack.completionsQueue", v23);
      objc_msgSend(v8, "_addFigNotifications");
    }
    if (!v8[4] || !v8[5] || !v8[13] || !v8[15] || !v8[14])
    {

      return 0;
    }
  }
  return v8;
}

- (void)_addFigNotifications
{
  id v3;
  id v4;

  if (self->_figAsset)
  {
    if (self->_figAssetTrack)
    {
      v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v4 = -[AVAssetTrackInspector _weakReference](self, "_weakReference");
      CFRetain(v4);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleFigAssetTrackNotification, *MEMORY[0x1E0CC3BF8], self->_figAssetTrack, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleFigAssetNotification, *MEMORY[0x1E0CC3688], self->_figAsset, 0);
    }
  }
}

- (OpaqueFigAssetTrack)_figAssetTrack
{
  return self->_figAssetTrack;
}

- (void)_valueAsCFTypeForProperty:(__CFString *)a3
{
  void *result;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, __CFString *, _QWORD, void **);
  void *v7;

  v7 = 0;
  result = -[AVFigAssetTrackInspector _figAssetTrack](self, "_figAssetTrack");
  if (result)
  {
    CMBaseObject = FigAssetTrackGetCMBaseObject();
    v6 = *(void (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v6)
    {
      v6(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v7);
      return v7;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (id)_loadingBatches
{
  return self->_loadingBatches;
}

- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "objectForKey:", 0x1E3048418);
        if (v9)
          dispatch_async((dispatch_queue_t)self->_completionHandlerQueue, v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (unsigned)_figMediaType
{
  return self->_mediaType;
}

- (void)dealloc
{
  NSObject *completionHandlerQueue;
  OpaqueFigAsset *figAsset;
  OpaqueFigAssetTrack *figAssetTrack;
  OpaqueFigFormatReader *figFormatReader;
  OpaqueFigTrackReader *figTrackReader;
  OpaqueFigSampleCursorService *figSampleCursorService;
  objc_super v9;

  -[AVFigAssetTrackInspector _removeFigNotifications](self, "_removeFigNotifications");

  completionHandlerQueue = self->_completionHandlerQueue;
  if (completionHandlerQueue)
    dispatch_release(completionHandlerQueue);
  if (self->_loadingMutex)
    FigSimpleMutexDestroy();
  figAsset = self->_figAsset;
  if (figAsset)
    CFRelease(figAsset);
  figAssetTrack = self->_figAssetTrack;
  if (figAssetTrack)
    CFRelease(figAssetTrack);
  figFormatReader = self->_figFormatReader;
  if (figFormatReader)
    CFRelease(figFormatReader);
  figTrackReader = self->_figTrackReader;
  if (figTrackReader)
    CFRelease(figTrackReader);

  figSampleCursorService = self->_figSampleCursorService;
  if (figSampleCursorService)
    CFRelease(figSampleCursorService);
  v9.receiver = self;
  v9.super_class = (Class)AVFigAssetTrackInspector;
  -[AVAssetTrackInspector dealloc](&v9, sel_dealloc);
}

- (void)_removeFigNotifications
{
  id v3;
  id v4;

  if (self->_figAsset)
  {
    if (self->_figAssetTrack)
    {
      v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v4 = -[AVAssetTrackInspector _weakReference](self, "_weakReference");
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleFigAssetTrackNotification, *MEMORY[0x1E0CC3BF8], self->_figAssetTrack);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleFigAssetNotification, *MEMORY[0x1E0CC3688], self->_figAsset);
      CFRelease(v4);
    }
  }
}

- (int64_t)_loadStatusForFigAssetTrackProperty:(id)a3 error:(id *)a4
{
  OpaqueFigAssetTrack *figAssetTrack;
  uint64_t (*v7)(OpaqueFigAssetTrack *, id, char *, uint64_t *, id *);
  signed int v8;
  id v9;
  int64_t v10;
  id v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  figAssetTrack = self->_figAssetTrack;
  v7 = *(uint64_t (**)(OpaqueFigAssetTrack *, id, char *, uint64_t *, id *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 8);
  if (!v7)
  {
    v9 = 0;
    v8 = -12782;
LABEL_6:
    v10 = 3;
    if (!a4)
      return v10;
LABEL_7:
    if (v10 == 3)
    {
      *a4 = (id)AVErrorWithNSErrorAndOSStatus((uint64_t)v9, v8, 0);
      return 3;
    }
    return v10;
  }
  v8 = v7(figAssetTrack, a3, (char *)&v13 + 4, &v13, &v12);
  v9 = v12;
  if (v8)
    goto LABEL_6;
  if ((_DWORD)v13 == -12844)
    return 2;
  v10 = SHIDWORD(v13);
  if (HIDWORD(v13) == 3)
    v8 = v13;
  else
    v8 = 0;
  if (a4)
    goto LABEL_7;
  return v10;
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  _BOOL4 prefersNominalDurations;
  uint64_t *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  prefersNominalDurations = self->_prefersNominalDurations;
  if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1)
    dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
  v8 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
  if (!prefersNominalDurations)
    v8 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
  v9 = objc_msgSend((id)*v8, "objectForKey:", a3);
  if (v9)
  {
    v10 = (void *)v9;
    MEMORY[0x194033BF8](self->_loadingMutex);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      v14 = 2;
LABEL_8:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v16 = -[AVFigAssetTrackInspector _loadStatusForFigAssetTrackProperty:error:](self, "_loadStatusForFigAssetTrackProperty:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), &v24);
        v17 = v16 == 3 ? 3 : v14;
        v14 = v16 <= 1 ? v16 : v17;
        if (v16 < 2 || v16 == 3)
          break;
        if (v12 == ++v15)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
          if (v12)
            goto LABEL_8;
          break;
        }
      }
    }
    else
    {
      v14 = 2;
    }
    MEMORY[0x194033C04](self->_loadingMutex);
    if (a4 && v14 == 3)
      *a4 = v24;
  }
  else
  {
    NSLog(CFSTR("-[AVAssetTrack statusOfValueForKey:error:] invoked with unrecognized key %@."), a3);
    return 2;
  }
  return v14;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  void *v7;
  _BOOL4 prefersNominalDurations;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  OpaqueFigAssetTrack *figAssetTrack;
  unsigned int (*v15)(OpaqueFigAssetTrack *, void *, char *, int *);
  CFNumberRef v17;
  CFNumberRef v18;
  void *v19;
  char v20;
  int valuePtr;
  _QWORD v22[7];

  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  if (a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    prefersNominalDurations = self->_prefersNominalDurations;
    if (dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce != -1)
      dispatch_once(&dictionaryOfFigAssetTrackPropertiesForTrackKeys_buildFigAssetTrackPropertiesForTrackKeysOnce, &__block_literal_global_31);
    v9 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sLegacyFigAssetTrackPropertiesForTrackKeys;
    if (!prefersNominalDurations)
      v9 = &dictionaryOfFigAssetTrackPropertiesForTrackKeys_sFigAssetTrackPropertiesForTrackKeys;
    v10 = *v9;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __78__AVFigAssetTrackInspector_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke;
    v22[3] = &unk_1E3034698;
    v22[4] = v10;
    v22[5] = v12;
    v22[6] = v11;
    objc_msgSend(a3, "enumerateObjectsUsingBlock:", v22);
    if (objc_msgSend(v11, "count"))
      NSLog(CFSTR("-[AVAssetTrack loadValuesAsynchronouslyForKeys:completionHandler:] invoked with unrecognized keys %@."), objc_msgSend(v11, "allObjects"));
    v13 = (void *)objc_msgSend(v12, "allObjects");
    if (objc_msgSend(v13, "count"))
    {
      valuePtr = 0;
      v20 = 0;
      figAssetTrack = self->_figAssetTrack;
      v15 = *(unsigned int (**)(OpaqueFigAssetTrack *, void *, char *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 16);
      if (v15)
      {
        if (!v15(figAssetTrack, v13, &v20, &valuePtr) && v20 == 0)
        {
          v17 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
          if (v17)
          {
            v18 = v17;
            objc_msgSend(v7, "setObject:forKey:", v17, 0x1E30483F8);
            CFRelease(v18);
          }
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v7, "count"))
  {
    if (a4)
    {
      v19 = (void *)objc_msgSend(a4, "copy");
      objc_msgSend(v7, "setObject:forKey:", v19, 0x1E3048418);

    }
    -[NSMutableArray addObject:](self->_loadingBatches, "addObject:", v7);
    MEMORY[0x194033C04](self->_loadingMutex);
  }
  else
  {
    MEMORY[0x194033C04](self->_loadingMutex);
    if (a4)
      (*((void (**)(id))a4 + 2))(a4);
  }
}

uint64_t __78__AVFigAssetTrackInspector_loadValuesAsynchronouslyForKeys_completionHandler___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(a1[4], "objectForKey:", a2);
  if (v4)
    return objc_msgSend(a1[5], "addObjectsFromArray:", v4);
  else
    return objc_msgSend(a1[6], "addObject:", a2);
}

- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3
{
  dispatch_semaphore_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[5];

  if (-[AVFigAssetTrackInspector statusOfValueForKey:error:](self, "statusOfValueForKey:error:", a3, 0) <= 1)
  {
    v5 = dispatch_semaphore_create(0);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __65__AVFigAssetTrackInspector__ensureAllDependenciesOfKeyAreLoaded___block_invoke;
      v8[3] = &unk_1E302FA10;
      v8[4] = v6;
      -[AVFigAssetTrackInspector loadValuesAsynchronouslyForKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:completionHandler:", v7, v8);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v6);
    }
  }
}

intptr_t __65__AVFigAssetTrackInspector__ensureAllDependenciesOfKeyAreLoaded___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)asset
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject");
}

- (OpaqueFigFormatReader)_figFormatReader
{
  AVDispatchOnce *copyFigFormatReaderOnce;
  _QWORD v5[5];

  copyFigFormatReaderOnce = self->_copyFigFormatReaderOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__AVFigAssetTrackInspector__figFormatReader__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](copyFigFormatReaderOnce, "runBlockOnce:", v5);
  return self->_figFormatReader;
}

uint64_t __44__AVFigAssetTrackInspector__figFormatReader__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(v1 + 32);
  if (result)
  {
    CMBaseObject = FigAssetGetCMBaseObject();
    result = CMBaseObjectGetVTable();
    v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 48);
    if (v4)
      return v4(CMBaseObject, *MEMORY[0x1E0CC39C8], *MEMORY[0x1E0C9AE00], v1 + 56);
  }
  return result;
}

- (OpaqueFigTrackReader)_figTrackReader
{
  AVDispatchOnce *copyFigTrackReaderOnce;
  _QWORD v5[5];

  copyFigTrackReaderOnce = self->_copyFigTrackReaderOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVFigAssetTrackInspector__figTrackReader__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](copyFigTrackReaderOnce, "runBlockOnce:", v5);
  return self->_figTrackReader;
}

uint64_t __43__AVFigAssetTrackInspector__figTrackReader__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t (*v4)(uint64_t, unsigned int *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, _QWORD);
  unsigned int v9;

  v9 = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, unsigned int *, _QWORD))(*(_QWORD *)(result + 16) + 32);
  if (v4)
  {
    result = v4(v2, &v9, 0);
    if (!(_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "_figFormatReader");
      if (result)
      {
        v5 = result;
        v6 = v9;
        v7 = *(_QWORD *)(a1 + 32);
        result = CMBaseObjectGetVTable();
        v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 56);
        if (v8)
          return v8(v5, v6, v7 + 72, 0);
      }
    }
  }
  return result;
}

- (id)mediaType
{
  int v2;

  v2 = bswap32(-[AVFigAssetTrackInspector _figMediaType](self, "_figMediaType"));
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c"), (char)v2, ((__int16)v2 >> 8), (v2 << 8 >> 24), (v2 >> 24));
}

- (OpaqueFigSampleCursorService)_getFigSampleCursorServiceReportingTimeAccuracy:(BOOL *)a3
{
  AVDispatchOnce *copySampleCursorServiceOnce;
  _QWORD v7[5];

  copySampleCursorServiceOnce = self->_copySampleCursorServiceOnce;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__AVFigAssetTrackInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke;
  v7[3] = &unk_1E302FA10;
  v7[4] = self;
  -[AVDispatchOnce runBlockOnce:](copySampleCursorServiceOnce, "runBlockOnce:", v7);
  if (a3)
    *a3 = self->_sampleCursorTimeAccuracyIsExact;
  return self->_figSampleCursorService;
}

void __76__AVFigAssetTrackInspector__getFigSampleCursorServiceReportingTimeAccuracy___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, _QWORD, const void **);
  const void *v8;
  const void *v9;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_figTrackReader");
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v5)
      v5(v3, v4 + 88);
    if (objc_msgSend(*(id *)(a1 + 32), "_figFormatReader"))
    {
      v9 = 0;
      FigBaseObject = FigFormatReaderGetFigBaseObject();
      v7 = *(void (**)(uint64_t, _QWORD, _QWORD, const void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                         + 48);
      if (v7)
      {
        v7(FigBaseObject, *MEMORY[0x1E0CC4318], *MEMORY[0x1E0C9AE00], &v9);
        v8 = v9;
      }
      else
      {
        v8 = 0;
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = v8 == (const void *)*MEMORY[0x1E0C9AE50];
      if (v8)
        CFRelease(v8);
    }
  }
}

- (id)formatDescriptions
{
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5FE8]);
}

- (BOOL)isPlayable
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3C48]) == 0;
}

- (int)playabilityValidationResult
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3C48]);
}

- (BOOL)isDecodable
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3C40]) == 0;
}

- (int)decodabilityValidationResult
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC3C40]);
}

- (BOOL)isEnabled
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC5FF0]) != 0;
}

- (BOOL)isSelfContained
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC6000]) != 0;
}

- (int64_t)totalSampleDataLength
{
  return -[AVFigObjectInspector _longLongForProperty:](self, "_longLongForProperty:", *MEMORY[0x1E0CC6080]);
}

- ($1CE2C3FC342086196D07C2B4E8C70800)timeRange
{
  if (self)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 _timeRangeForProperty:](self, "_timeRangeForProperty:", *MEMORY[0x1E0CC6078]);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)uneditedDuration
{
  uint64_t FigBaseObject;
  void (*v6)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *);
  const __CFDictionary *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  objc_super v9;
  CFDictionaryRef dictionaryRepresentation;

  dictionaryRepresentation = 0;
  if (-[AVFigAssetTrackInspector _figTrackReader](self, "_figTrackReader")
    && (FigBaseObject = FigTrackReaderGetFigBaseObject(),
        (v6 = *(void (**)(uint64_t, _QWORD, _QWORD, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48)) != 0)
    && (v6(FigBaseObject, *MEMORY[0x1E0CC6240], *MEMORY[0x1E0C9AE00], &dictionaryRepresentation),
        (v7 = dictionaryRepresentation) != 0))
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
    CMTimeMakeFromDictionary((CMTime *)retstr, v7);
    CFRelease(dictionaryRepresentation);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVFigAssetTrackInspector;
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE uneditedDuration](&v9, sel_uneditedDuration);
  }
  return result;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaPresentationTimeRange
{
  if (self)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 _timeRangeForProperty:](self, "_timeRangeForProperty:", *MEMORY[0x1E0CC6038]);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)mediaDecodeTimeRange
{
  if (self)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 _timeRangeForProperty:](self, "_timeRangeForProperty:", *MEMORY[0x1E0CC6030]);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (BOOL)requiresFrameReordering
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  BOOL v4;
  BOOL v5;
  CFTypeRef cf;

  if (!-[AVFigAssetTrackInspector _figTrackReader](self, "_figTrackReader"))
    return 0;
  cf = 0;
  FigBaseObject = FigTrackReaderGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3)
    return 0;
  if (v3(FigBaseObject, *MEMORY[0x1E0CC6198], *MEMORY[0x1E0C9AE00], &cf))
    v4 = 0;
  else
    v4 = cf == (CFTypeRef)*MEMORY[0x1E0C9AE50];
  v5 = v4;
  if (cf)
    CFRelease(cf);
  return v5;
}

- (int)naturalTimeScale
{
  return -[AVFigObjectInspector _SInt32ForProperty:](self, "_SInt32ForProperty:", *MEMORY[0x1E0CC6050]);
}

- (float)estimatedDataRate
{
  float v2;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC5FD8]);
  return v2 * 8.0;
}

- (float)peakDataRate
{
  float v2;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC6060]);
  return v2 * 8.0;
}

- (id)languageCode
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC6008]);
}

- (id)extendedLanguageTag
{
  return -[AVFigObjectInspector _stringForProperty:](self, "_stringForProperty:", *MEMORY[0x1E0CC5FE0]);
}

- (CGSize)naturalSize
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC6048]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)dimensions
{
  double v2;
  double v3;
  CGSize result;

  -[AVFigObjectInspector _sizeForProperty:](self, "_sizeForProperty:", *MEMORY[0x1E0CC5FD0]);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGAffineTransform)preferredTransform
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform _affineTransformForProperty:](self, "_affineTransformForProperty:", *MEMORY[0x1E0CC6068]);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (int64_t)layer
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC6010]);
}

- (float)preferredVolume
{
  double v2;
  float result;

  LODWORD(v2) = 1.0;
  -[AVFigObjectInspector _floatForProperty:defaultValue:](self, "_floatForProperty:defaultValue:", *MEMORY[0x1E0CC6088], v2);
  return result;
}

- (id)loudnessInfo
{
  return -[AVFigObjectInspector _dictionaryForProperty:](self, "_dictionaryForProperty:", *MEMORY[0x1E0CC6020]);
}

- (float)nominalFrameRate
{
  float result;

  -[AVFigObjectInspector _floatForProperty:](self, "_floatForProperty:", *MEMORY[0x1E0CC6058]);
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minSampleDuration
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    v3 = *MEMORY[0x1E0CC6040];
    v4 = *MEMORY[0x1E0CA2E18];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:defaultValue:](self, "_timeForProperty:defaultValue:", v3, &v4);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)latentBaseDecodeTimeStampOfFirstTrackFragment
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  if (self)
  {
    v3 = *MEMORY[0x1E0CC3C38];
    v4 = *MEMORY[0x1E0CA2E18];
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE _timeForProperty:defaultValue:](self, "_timeForProperty:defaultValue:", v3, &v4);
  }
  else
  {
    retstr->var0 = 0;
    *(_QWORD *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }
  return self;
}

- (id)_segmentsForProperty:(__CFString *)a3
{
  return -[AVAssetTrackInspector _segmentsForSegmentData:](self, "_segmentsForSegmentData:", -[AVFigObjectInspector _dataForProperty:](self, "_dataForProperty:", a3));
}

- (__CFString)figAssetPropertyForSegments
{
  __CFString **v2;

  if (self->_prefersNominalDurations)
    v2 = (__CFString **)MEMORY[0x1E0CC3C10];
  else
    v2 = (__CFString **)MEMORY[0x1E0CC3C50];
  return *v2;
}

- (id)segments
{
  return -[AVFigAssetTrackInspector _segmentsForProperty:](self, "_segmentsForProperty:", -[AVFigAssetTrackInspector figAssetPropertyForSegments](self, "figAssetPropertyForSegments"));
}

- (id)segmentForTrackTime:(id *)a3
{
  id v4;
  unint64_t v5;
  id result;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  AVAssetTrackSegment *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  AVAssetTrackSegment *v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  CMTimeRange v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime time;
  CMTimeRange time2;

  v4 = -[AVFigObjectInspector _dataForProperty:](self, "_dataForProperty:", -[AVFigAssetTrackInspector figAssetPropertyForSegments](self, "figAssetPropertyForSegments"));
  v5 = objc_msgSend(v4, "length");
  if (v5 < 0x60)
    return 0;
  v7 = v5 / 0x60;
  v8 = objc_msgSend(v4, "bytes");
  v9 = v8;
  v10 = v7 - 1;
  if (v7 <= 1)
    v11 = 1;
  else
    v11 = v7;
  v12 = v8;
  while (1)
  {
    time2 = *(CMTimeRange *)(v12 + 48);
    v25 = time2;
    time = (CMTime)*a3;
    if (CMTimeRangeContainsTime(&v25, &time))
      break;
    v12 += 96;
    if (!--v11)
      goto LABEL_11;
  }
  v13 = [AVAssetTrackSegment alloc];
  v14 = *(_OWORD *)(v12 + 16);
  *(_OWORD *)&v25.start.value = *(_OWORD *)v12;
  *(_OWORD *)&v25.start.epoch = v14;
  v15 = *(_OWORD *)(v12 + 32);
  v16 = *(_OWORD *)(v12 + 48);
  v17 = *(_OWORD *)(v12 + 80);
  v27 = *(_OWORD *)(v12 + 64);
  v28 = v17;
  *(_OWORD *)&v25.duration.timescale = v15;
  v26 = v16;
  result = -[AVAssetTrackSegment _initWithTimeMapping:](v13, "_initWithTimeMapping:", &v25);
  if (result)
    return result;
LABEL_11:
  *(_OWORD *)&v25.start.value = *(_OWORD *)&a3->var0;
  v25.start.epoch = a3->var3;
  *(_OWORD *)&time2.start.value = *(_OWORD *)(v9 + 48);
  time2.start.epoch = *(_QWORD *)(v9 + 64);
  if (CMTimeCompare(&v25.start, &time2.start) < 0)
    v18 = 0;
  else
    v18 = v10;
  v19 = [AVAssetTrackSegment alloc];
  v20 = (_OWORD *)(v9 + 96 * v18);
  v21 = v20[1];
  *(_OWORD *)&v25.start.value = *v20;
  *(_OWORD *)&v25.start.epoch = v21;
  v22 = v20[2];
  v23 = v20[3];
  v24 = v20[5];
  v27 = v20[4];
  v28 = v24;
  *(_OWORD *)&v25.duration.timescale = v22;
  v26 = v23;
  return -[AVAssetTrackSegment _initWithTimeMapping:](v19, "_initWithTimeMapping:", &v25);
}

- (BOOL)segmentsExcludeAudioPrimingAndRemainderDurations
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3C18]) != 0;
}

- ($1CE2C3FC342086196D07C2B4E8C70800)gaplessSourceTimeRange
{
  if (self)
    return ($1CE2C3FC342086196D07C2B4E8C70800 *)-[$1CE2C3FC342086196D07C2B4E8C70800 _timeRangeForProperty:](self, "_timeRangeForProperty:", *MEMORY[0x1E0CC3C28]);
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return self;
}

- (id)segmentsAsPresented
{
  return -[AVFigAssetTrackInspector _segmentsForProperty:](self, "_segmentsForProperty:", *MEMORY[0x1E0CC3C50]);
}

- (id)commonMetadata
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5FC0]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (v8)
          objc_msgSend(v3, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  return v3;
}

- (id)availableMetadataFormats
{
  -[AVFigAssetTrackInspector _ensureAllDependenciesOfKeyAreLoaded:](self, "_ensureAllDependenciesOfKeyAreLoaded:", CFSTR("availableMetadataFormats"));
  return -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", *MEMORY[0x1E0CC5FB8]);
}

- (id)metadataForFormat:(id)a3
{
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.udta")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3C68];
LABEL_5:
    v7 = *v6;
    goto LABEL_9;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("org.mp4ra")))
  {
    v6 = (uint64_t *)MEMORY[0x1E0CC3C30];
    goto LABEL_5;
  }
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("com.apple.quicktime.mdta")))
    v7 = *MEMORY[0x1E0CC3C60];
  else
    v7 = 0;
LABEL_9:
  v8 = -[AVFigObjectInspector _nonNilArrayForProperty:](self, "_nonNilArrayForProperty:", v7);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = +[AVMetadataItem _metadataItemWithFigMetadataDictionary:](AVMetadataItem, "_metadataItemWithFigMetadataDictionary:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
        if (v13)
          objc_msgSend(v5, "addObject:", v13);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
  return v5;
}

- (int64_t)alternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC5FB0]);
}

- (int64_t)defaultAlternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC5FC8]);
}

- (int64_t)provisionalAlternateGroupID
{
  return -[AVFigObjectInspector _SInt16ForProperty:](self, "_SInt16ForProperty:", *MEMORY[0x1E0CC6070]);
}

- (BOOL)isExcludedFromAutoselectionInTrackGroup
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC5FF8]) != 0;
}

- (id)_trackReferences
{
  return -[AVFigObjectInspector _nonNilDictionaryForProperty:](self, "_nonNilDictionaryForProperty:", *MEMORY[0x1E0CC3C70]);
}

- (BOOL)hasProtectedContent
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3C58]) != 0;
}

- (BOOL)hasAudibleBooksContent
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3C78]) != 0;
}

- (BOOL)isAudibleBooksContentAuthorized
{
  return -[AVFigObjectInspector _BOOLeanForProperty:](self, "_BOOLeanForProperty:", *MEMORY[0x1E0CC3C08]) != 0;
}

- (BOOL)hasSeamSamples
{
  uint64_t FigBaseObject;
  unsigned int (*v3)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  BOOL v4;
  BOOL v5;
  CFTypeRef cf;

  if (!-[AVFigAssetTrackInspector _figTrackReader](self, "_figTrackReader"))
    return 0;
  cf = 0;
  FigBaseObject = FigTrackReaderGetFigBaseObject();
  v3 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (!v3)
    return 0;
  if (v3(FigBaseObject, *MEMORY[0x1E0CC61B0], *MEMORY[0x1E0C9AE00], &cf))
    v4 = 0;
  else
    v4 = cf == (CFTypeRef)*MEMORY[0x1E0C9AE50];
  v5 = v4;
  if (cf)
    CFRelease(cf);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  OpaqueFigAssetTrack *v5;
  uint64_t v6;
  const void *v7;
  BOOL result;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[AVFigAssetTrackInspector _figAssetTrack](self, "_figAssetTrack");
  v6 = objc_msgSend(a3, "_figAssetTrack");
  if (v5 == (OpaqueFigAssetTrack *)v6)
    return 1;
  v7 = (const void *)v6;
  result = 0;
  if (v5)
  {
    if (v7)
      return CFEqual(v5, v7) != 0;
  }
  return result;
}

- (unint64_t)hash
{
  OpaqueFigAssetTrack *v3;
  objc_super v5;

  v3 = -[AVFigAssetTrackInspector _figAssetTrack](self, "_figAssetTrack");
  if (v3)
    return CFHash(v3);
  v5.receiver = self;
  v5.super_class = (Class)AVFigAssetTrackInspector;
  return -[AVFigAssetTrackInspector hash](&v5, sel_hash);
}

- (BOOL)_isDefunct
{
  OpaqueFigAssetTrack *v2;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigAssetTrack *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  v2 = -[AVFigAssetTrackInspector _figAssetTrack](self, "_figAssetTrack");
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigAssetTrack *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(v2, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

@end
