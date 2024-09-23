@implementation AVPlayerItemIntegratedTimeline

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (id)_initInternal
{
  AVPlayerItemIntegratedTimeline *v2;
  NSObject *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemIntegratedTimeline;
  v2 = -[AVPlayerItemIntegratedTimeline init](&v5, sel_init);
  v2->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v2);
  v2->_seekIDMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
  v2->_nextSeekIDToGenerate = FPSupport_InitialSeekIDForSource();
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2->_stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.integratedtimelinestatequeue", v3);
  v2->_observers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  return v2;
}

- (void)dealloc
{
  OpaqueFigItemIntegratedTimeline *figTimeline;
  __CFDictionary *initialOptions;
  objc_super v5;

  -[AVPlayerItemIntegratedTimeline _removeListeners](self, "_removeListeners");
  -[AVPlayerItemIntegratedTimeline _cancelPendingSeeks](self, "_cancelPendingSeeks");
  -[AVPlayerItemIntegratedTimeline _removeInterstitialPlayerListeners](self, "_removeInterstitialPlayerListeners");
  FigSimpleMutexDestroy();
  figTimeline = self->_figTimeline;
  if (figTimeline)
    CFRelease(figTimeline);
  initialOptions = self->_initialOptions;
  if (initialOptions)
    CFRelease(initialOptions);

  dispatch_release((dispatch_object_t)self->_stateQueue);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerItemIntegratedTimeline;
  -[AVPlayerItemIntegratedTimeline dealloc](&v5, sel_dealloc);
}

- (void)_attachToItem:(id)a3
{
  uint64_t v5;
  const void *v6;
  BOOL v7;

  v5 = objc_msgSend(a3, "_copyFigPlaybackItem");
  v6 = (const void *)v5;
  if (self->_figTimeline)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    if (!v5)
      return;
  }
  else
  {
    FigItemIntegratedTimelineCreate();
    -[AVPlayerItemIntegratedTimeline _addListener](self, "_addListener", 0, 0x193504984, timeline_WrapperToSegment);
    self->_weakReferenceToPrimaryItem = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  }
  CFRelease(v6);
}

- (void)_attachCoordinator:(OpaqueFigPlayerInterstitialCoordinator *)a3
{
  OpaqueFigItemIntegratedTimeline *figTimeline;
  void (*v5)(OpaqueFigItemIntegratedTimeline *, _QWORD, OpaqueFigPlayerInterstitialCoordinator *);

  figTimeline = self->_figTimeline;
  if (figTimeline)
  {
    v5 = *(void (**)(OpaqueFigItemIntegratedTimeline *, _QWORD, OpaqueFigPlayerInterstitialCoordinator *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v5)
      v5(figTimeline, *MEMORY[0x1E0CC46C8], a3);
  }
}

- (void)_attachInterstitialPlayer:(id)a3
{
  if (a3)
  {
    if (!self->_weakReferenceToInterstitialPlayer)
    {
      self->_weakReferenceToInterstitialPlayer = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
      -[AVPlayerItemIntegratedTimeline _addInterstitialPlayerListeners](self, "_addInterstitialPlayerListeners");
    }
  }
}

- (id)_primaryItem
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToPrimaryItem, "referencedObject");
}

- (id)_interstitialPlayer
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToInterstitialPlayer, "referencedObject");
}

- (AVPlayerItemIntegratedTimelineSnapshot)currentSnapshot
{
  OpaqueFigItemIntegratedTimeline *figTimeline;
  void (*v3)(OpaqueFigItemIntegratedTimeline *, CFTypeRef *, __int128 *, __int128 *, CFTypeRef *, CFTypeRef *);
  AVPlayerItemIntegratedTimelineSnapshot *v4;
  AVPlayerItemIntegratedTimelineSnapshot *v5;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  CFTypeRef v15;
  CFTypeRef v16;
  CFTypeRef v17;

  v16 = 0;
  v17 = 0;
  v15 = 0;
  v13 = *MEMORY[0x1E0CA2E18];
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v11 = v13;
  v12 = v14;
  figTimeline = self->_figTimeline;
  if (figTimeline)
  {
    v3 = *(void (**)(OpaqueFigItemIntegratedTimeline *, CFTypeRef *, __int128 *, __int128 *, CFTypeRef *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v3)
      v3(figTimeline, &v15, &v13, &v11, &v17, &v16);
  }
  v4 = [AVPlayerItemIntegratedTimelineSnapshot alloc];
  v9 = v13;
  v10 = v14;
  v7 = v11;
  v8 = v12;
  v5 = -[AVPlayerItemIntegratedTimelineSnapshot initWithSegments:duration:currentTime:currentDate:currentSegment:](v4, "initWithSegments:duration:currentTime:currentDate:currentSegment:", v15, &v9, &v7, v17, v16);
  if (v15)
    CFRelease(v15);
  if (v17)
    CFRelease(v17);
  if (v16)
    CFRelease(v16);
  return v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)currentTime
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *);

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)&self->var1;
  if (v4)
  {
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMBaseObjectGetVTable();
    v5 = *(uint64_t (**)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(self->var3 + 16);
    if (v5)
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)v5(v4, retstr);
  }
  return self;
}

- (NSDate)currentDate
{
  OpaqueFigItemIntegratedTimeline *figTimeline;
  void (*v3)(OpaqueFigItemIntegratedTimeline *, void **);
  void *v4;
  void *v6;

  v6 = 0;
  figTimeline = self->_figTimeline;
  if (figTimeline
    && (v3 = *(void (**)(OpaqueFigItemIntegratedTimeline *, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                               + 24)) != 0)
  {
    v3(figTimeline, &v6);
    v4 = v6;
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (int64_t)_currentSegmentTypeOfCurrentSnapshot
{
  return -[AVPlayerItemSegment segmentType](-[AVPlayerItemIntegratedTimelineSnapshot currentSegment](-[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), "currentSegment"), "segmentType");
}

- (int)_createSeekID
{
  int nextSeekIDToGenerate;

  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  nextSeekIDToGenerate = self->_nextSeekIDToGenerate;
  self->_nextSeekIDToGenerate = FPSupport_IncrementSeekID();
  MEMORY[0x194033C04](self->_seekIDMutex);
  return nextSeekIDToGenerate;
}

- (void)_cancelPendingSeekAndRegisterSeekID:(int)a3 seekTime:(id *)a4 withCompletionHandler:(id)a5
{
  int pendingSeekID;
  void (**seekCompletionHandler)(id, _QWORD);
  int64_t var3;
  void *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  pendingSeekID = self->_pendingSeekID;
  seekCompletionHandler = (void (**)(id, _QWORD))self->_seekCompletionHandler;
  self->_pendingSeekID = a3;
  var3 = a4->var3;
  *(_OWORD *)&self->_pendingSeekTime.value = *(_OWORD *)&a4->var0;
  self->_pendingSeekTime.epoch = var3;
  if (a5)
    v12 = (void *)objc_msgSend(a5, "copy");
  else
    v12 = 0;
  self->_seekCompletionHandler = v12;
  MEMORY[0x194033C04](self->_seekIDMutex);
  if (pendingSeekID && seekCompletionHandler)
  {
    if (dword_1EE2B0310)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    seekCompletionHandler[2](seekCompletionHandler, 0);

  }
}

- (void)_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:(int)a3 finished:(BOOL)a4
{
  _BOOL8 v4;
  int pendingSeekID;
  BOOL v8;
  void (**seekCompletionHandler)(id, _BOOL8);
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v4 = a4;
  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  pendingSeekID = self->_pendingSeekID;
  if (pendingSeekID)
    v8 = pendingSeekID == a3;
  else
    v8 = 0;
  if (!v8)
    JUMPOUT(0x194033C04);
  seekCompletionHandler = (void (**)(id, _BOOL8))self->_seekCompletionHandler;
  self->_pendingSeekID = 0;
  v10 = MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_pendingSeekTime.value = *MEMORY[0x1E0CA2E18];
  self->_pendingSeekTime.epoch = *(_QWORD *)(v10 + 16);
  self->_seekCompletionHandler = 0;
  MEMORY[0x194033C04](self->_seekIDMutex);
  if (seekCompletionHandler)
  {
    if (dword_1EE2B0310)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    seekCompletionHandler[2](seekCompletionHandler, v4);

  }
}

- (void)_clearCachedSeek
{
  uint64_t v3;
  __int128 v4;
  int64_t v5;

  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  self->_initialSeekID = 0;
  v3 = MEMORY[0x1E0CA2E18];
  v4 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)(&self->_initialSeekID + 1) = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(v3 + 16);
  *(_QWORD *)&self->_initialTime.flags = v5;
  *(_OWORD *)&self->_initialToleranceAfter.value = v4;
  self->_initialToleranceAfter.epoch = v5;
  *(_OWORD *)&self->_initialToleranceBefore.value = v4;
  self->_initialToleranceBefore.epoch = v5;

  self->_initialDate = 0;
  JUMPOUT(0x194033C04);
}

- (void)_issueCachedSeekIfNecessary
{
  uint64_t initialSeekID;
  int timescale;
  uint64_t v5;
  NSDate *initialDate;
  __CFDictionary *initialOptions;
  OpaqueFigItemIntegratedTimeline *v8;
  unsigned int (*v9)(OpaqueFigItemIntegratedTimeline *, uint64_t, uint64_t *, $95D729B680665BEAEFA1D6FCA8238556 *, $95D729B680665BEAEFA1D6FCA8238556 *, __CFDictionary *);
  OpaqueFigItemIntegratedTimeline *figTimeline;
  unsigned int (*v11)(OpaqueFigItemIntegratedTimeline *, uint64_t, NSDate *, __CFDictionary *);
  $95D729B680665BEAEFA1D6FCA8238556 initialToleranceAfter;
  $95D729B680665BEAEFA1D6FCA8238556 initialToleranceBefore;
  $95D729B680665BEAEFA1D6FCA8238556 v14;
  $95D729B680665BEAEFA1D6FCA8238556 v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int value_high;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  initialSeekID = self->_initialSeekID;
  v20 = *(_QWORD *)(&self->_initialSeekID + 1);
  timescale = self->_initialTime.timescale;
  value_high = HIDWORD(self->_initialTime.value);
  v5 = *(_QWORD *)&self->_initialTime.flags;
  initialDate = self->_initialDate;
  initialToleranceBefore = self->_initialToleranceBefore;
  initialOptions = self->_initialOptions;
  initialToleranceAfter = self->_initialToleranceAfter;
  MEMORY[0x194033C04](self->_seekIDMutex);
  if ((_DWORD)initialSeekID)
  {
    if ((timescale & 1) == 0 || initialDate)
    {
      if (!initialDate)
        goto LABEL_11;
      -[AVPlayerItemIntegratedTimeline _resetPlaybackCoordinatorTimelineExpectations:](self, "_resetPlaybackCoordinatorTimelineExpectations:", initialOptions);
      figTimeline = self->_figTimeline;
      v11 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, NSDate *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v11)
      {
        if (!v11(figTimeline, initialSeekID, initialDate, initialOptions))
          goto LABEL_11;
      }
    }
    else
    {
      -[AVPlayerItemIntegratedTimeline _resetPlaybackCoordinatorTimelineExpectations:](self, "_resetPlaybackCoordinatorTimelineExpectations:", initialOptions);
      v8 = self->_figTimeline;
      v9 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, uint64_t *, $95D729B680665BEAEFA1D6FCA8238556 *, $95D729B680665BEAEFA1D6FCA8238556 *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v9)
      {
        v16 = v20;
        v17 = value_high;
        v18 = timescale;
        v19 = v5;
        v15 = initialToleranceBefore;
        v14 = initialToleranceAfter;
        if (!v9(v8, initialSeekID, &v16, &v15, &v14, initialOptions))
          goto LABEL_11;
      }
    }
    -[AVPlayerItemIntegratedTimeline _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", initialSeekID, 0);
LABEL_11:
    -[AVPlayerItemIntegratedTimeline _clearCachedSeek](self, "_clearCachedSeek");
  }
}

- (void)_setInitialSeekState:(int)a3 time:(id *)a4 date:(id)a5 toleranceBefore:(id *)a6 toleranceAfter:(id *)a7 options:(__CFDictionary *)a8
{
  int64_t var3;
  __int128 v16;
  __int128 v17;
  __CFDictionary *v18;

  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  self->_initialSeekID = a3;
  var3 = a4->var3;
  *(_OWORD *)(&self->_initialSeekID + 1) = *(_OWORD *)&a4->var0;
  *(_QWORD *)&self->_initialTime.flags = var3;
  v16 = *(_OWORD *)&a7->var0;
  self->_initialToleranceAfter.epoch = a7->var3;
  *(_OWORD *)&self->_initialToleranceAfter.value = v16;
  v17 = *(_OWORD *)&a6->var0;
  self->_initialToleranceBefore.epoch = a6->var3;
  *(_OWORD *)&self->_initialToleranceBefore.value = v17;
  self->_initialDate = (NSDate *)a5;
  if (a8)
    v18 = (__CFDictionary *)CFRetain(a8);
  else
    v18 = 0;
  self->_initialOptions = v18;
  JUMPOUT(0x194033C04);
}

- (int)_getPendingSeekID
{
  return self->_pendingSeekID;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_getPendingSeekTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)_cancelPendingSeeks
{
  uint64_t pendingSeekID;

  MEMORY[0x194033BF8](self->_seekIDMutex, a2);
  pendingSeekID = self->_pendingSeekID;
  MEMORY[0x194033C04](self->_seekIDMutex);
  -[AVPlayerItemIntegratedTimeline _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", pendingSeekID, 0);
}

- (void)_seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 options:(__CFDictionary *)a6 completionHandler:(id)a7
{
  uint64_t v13;
  NSUInteger v14;
  OpaqueFigItemIntegratedTimeline *figTimeline;
  unsigned int (*v16)(OpaqueFigItemIntegratedTimeline *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, __int128 *, __int128 *, __CFDictionary *);
  __int128 v17;
  int64_t v18;
  __int128 v19;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v21;
  __int128 v22;
  int64_t v23;
  __int128 v24;
  int64_t v25;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v26;

  v13 = -[AVPlayerItemIntegratedTimeline _createSeekID](self, "_createSeekID");
  v14 = -[NSArray count](-[AVPlayerItemIntegratedTimelineSnapshot segments](-[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), "segments"), "count");
  v26 = *a3;
  -[AVPlayerItemIntegratedTimeline _cancelPendingSeekAndRegisterSeekID:seekTime:withCompletionHandler:](self, "_cancelPendingSeekAndRegisterSeekID:seekTime:withCompletionHandler:", v13, &v26, a7);
  if (self->_figTimeline && v14)
  {
    -[AVPlayerItemIntegratedTimeline _resetPlaybackCoordinatorTimelineExpectations:](self, "_resetPlaybackCoordinatorTimelineExpectations:", a6);
    figTimeline = self->_figTimeline;
    *(_OWORD *)&v21.var0 = *(_OWORD *)&a3->var0;
    v21.var3 = a3->var3;
    v19 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v17 = *(_OWORD *)&a5->var0;
    v18 = a5->var3;
    v16 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, __int128 *, __int128 *, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (!v16 || (v26 = v21, v24 = v19, v25 = var3, v22 = v17, v23 = v18, v16(figTimeline, v13, &v26, &v24, &v22, a6)))
      -[AVPlayerItemIntegratedTimeline _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v13, 0, v17, v18);
  }
  else
  {
    v26 = *a3;
    v24 = *(_OWORD *)&a4->var0;
    v25 = a4->var3;
    v22 = *(_OWORD *)&a5->var0;
    v23 = a5->var3;
    -[AVPlayerItemIntegratedTimeline _setInitialSeekState:time:date:toleranceBefore:toleranceAfter:options:](self, "_setInitialSeekState:time:date:toleranceBefore:toleranceAfter:options:", v13, &v26, 0, &v24, &v22, a6);
  }
}

- (void)seekToTime:(id *)a3 toleranceBefore:(id *)a4 toleranceAfter:(id *)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0CC5490];
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0, a4);
  v15[1] = *MEMORY[0x1E0CC5488];
  v16[0] = v10;
  v16[1] = &unk_1E3093748;
  v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v14 = *a3;
  v13 = *a5;
  v12 = *a5;
  -[AVPlayerItemIntegratedTimeline _seekToTime:toleranceBefore:toleranceAfter:options:completionHandler:](self, "_seekToTime:toleranceBefore:toleranceAfter:options:completionHandler:", &v14, &v13, &v12, v11, a6);
}

- (void)_seekToDate:(id)a3 options:(__CFDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  OpaqueFigItemIntegratedTimeline *figTimeline;
  unsigned int (*v13)(OpaqueFigItemIntegratedTimeline *, uint64_t, id, __CFDictionary *);
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  v9 = -[AVPlayerItemIntegratedTimeline _createSeekID](self, "_createSeekID");
  v10 = -[NSArray count](-[AVPlayerItemIntegratedTimelineSnapshot segments](-[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), "segments"), "count");
  v14 = *MEMORY[0x1E0CA2E18];
  v19 = *MEMORY[0x1E0CA2E18];
  v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v20 = v11;
  -[AVPlayerItemIntegratedTimeline _cancelPendingSeekAndRegisterSeekID:seekTime:withCompletionHandler:](self, "_cancelPendingSeekAndRegisterSeekID:seekTime:withCompletionHandler:", v9, &v19, a5);
  if (self->_figTimeline && v10)
  {
    -[AVPlayerItemIntegratedTimeline _resetPlaybackCoordinatorTimelineExpectations:](self, "_resetPlaybackCoordinatorTimelineExpectations:", a4);
    figTimeline = self->_figTimeline;
    v13 = *(unsigned int (**)(OpaqueFigItemIntegratedTimeline *, uint64_t, id, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (!v13 || v13(figTimeline, v9, a3, a4))
      -[AVPlayerItemIntegratedTimeline _unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:](self, "_unregisterInvokeAndReleasePendingSeekCompletionHandlerForSeekID:finished:", v9, 0);
  }
  else
  {
    v19 = v14;
    v20 = v11;
    v17 = v14;
    v18 = v11;
    v15 = v14;
    v16 = v11;
    -[AVPlayerItemIntegratedTimeline _setInitialSeekState:time:date:toleranceBefore:toleranceAfter:options:](self, "_setInitialSeekState:time:date:toleranceBefore:toleranceAfter:options:", v9, &v19, a3, &v17, &v15, a4);
  }
}

- (void)seekToDate:(id)a3 completionHandler:(id)a4
{
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CC5490];
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v8[1] = *MEMORY[0x1E0CC5488];
  v9[0] = v7;
  v9[1] = &unk_1E3093748;
  -[AVPlayerItemIntegratedTimeline _seekToDate:options:completionHandler:](self, "_seekToDate:options:completionHandler:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2), a4);
}

- (void)_resetPlaybackCoordinatorTimelineExpectations:(__CFDictionary *)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(-[AVWeakReference referencedObject](self->_weakReferenceToPrimaryItem, "referencedObject"), "_copyPlayer");
  objc_msgSend(v3, "_playbackCoordinatorWithoutTriggeringFullSetup");
  FigCFDictionaryGetInt32IfPresent();

}

- (void)_addListener
{
  id v3;

  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46F8], self->_figTimeline, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46E8], self->_figTimeline, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46F0], self->_figTimeline, 0);
}

- (void)_addInterstitialPlayerListeners
{
  objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakReference, avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback, CFSTR("AVPlayerCurrentItemDidChangeNotification"), -[AVWeakReference referencedObject](self->_weakReferenceToInterstitialPlayer, "referencedObject"), 0);
}

- (void)_removeInterstitialPlayerListeners
{
  objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avitemintegratedtimeline_interstitialPlayer_fpNotificationCallback, CFSTR("AVPlayerCurrentItemDidChangeNotification"), -[AVWeakReference referencedObject](self->_weakReferenceToInterstitialPlayer, "referencedObject"));
}

- (void)_removeListeners
{
  id v3;
  void *v4;

  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  if (self->_figTimeline)
  {
    v4 = v3;
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46F8]);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46E8], self->_figTimeline);
    objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_weakReference, avitemintegratedtimeline_fpNotificationCallback, *MEMORY[0x1E0CC46F0], self->_figTimeline);
  }
}

- (id)_currentItemForSegmentType:(int64_t)a3
{
  if (a3)
    return (id)objc_msgSend(-[AVPlayerItemIntegratedTimeline _interstitialPlayer](self, "_interstitialPlayer"), "currentItem");
  else
    return -[AVPlayerItemIntegratedTimeline _primaryItem](self, "_primaryItem");
}

- (id)_currentItemForCurrentSegment
{
  return -[AVPlayerItemIntegratedTimeline _currentItemForSegmentType:](self, "_currentItemForSegmentType:", -[AVPlayerItemIntegratedTimeline _currentSegmentTypeOfCurrentSnapshot](self, "_currentSegmentTypeOfCurrentSnapshot"));
}

- (id)addPeriodicTimeObserverForInterval:(id *)a3 queue:(id)a4 usingBlock:(id)a5
{
  AVPlayerItemIntegratedTimelinePeriodicObserver *v9;
  AVPlayerItemIntegratedTimelinePeriodicObserver *v10;
  NSObject *stateQueue;
  _QWORD v13[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v9 = [AVPlayerItemIntegratedTimelinePeriodicObserver alloc];
  v14 = *a3;
  v10 = -[AVPlayerItemIntegratedTimelinePeriodicObserver initWithInterval:queue:block:](v9, "initWithInterval:queue:block:", &v14, a4, a5);
  -[AVPlayerItemIntegratedTimelinePeriodicObserver rescheduleObserverWithSnapshot:itemToSchedule:](v10, "rescheduleObserverWithSnapshot:itemToSchedule:", -[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), -[AVPlayerItemIntegratedTimeline _currentItemForCurrentSegment](self, "_currentItemForCurrentSegment"));
  stateQueue = self->_stateQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __126__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke;
  v13[3] = &unk_1E302FCE8;
  v13[4] = self;
  v13[5] = v10;
  dispatch_sync(stateQueue, v13);
  return v10;
}

uint64_t __126__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addPeriodicTimeObserverForInterval_queue_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addObject:", *(_QWORD *)(a1 + 40));
}

- (id)addBoundaryTimeObserverForSegment:(id)a3 offsetsIntoSegment:(id)a4 queue:(id)a5 usingBlock:(id)a6
{
  AVPlayerItemIntegratedTimelineBoundaryObserver *v8;
  NSObject *stateQueue;
  _QWORD v11[6];

  v8 = -[AVPlayerItemIntegratedTimelineBoundaryObserver initWithSegment:offsetTimes:queue:block:]([AVPlayerItemIntegratedTimelineBoundaryObserver alloc], "initWithSegment:offsetTimes:queue:block:", a3, a4, a5, a6);
  -[AVPlayerItemIntegratedTimelineBoundaryObserver rescheduleObserverWithSnapshot:itemToSchedule:](v8, "rescheduleObserverWithSnapshot:itemToSchedule:", -[AVPlayerItemIntegratedTimeline currentSnapshot](self, "currentSnapshot"), -[AVPlayerItemIntegratedTimeline _currentItemForSegmentType:](self, "_currentItemForSegmentType:", objc_msgSend(a3, "segmentType")));
  stateQueue = self->_stateQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __144__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addBoundaryTimeObserverForSegment_offsetsIntoSegment_queue_usingBlock___block_invoke;
  v11[3] = &unk_1E302FCE8;
  v11[4] = self;
  v11[5] = v8;
  dispatch_sync(stateQueue, v11);
  return v8;
}

uint64_t __144__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__addBoundaryTimeObserverForSegment_offsetsIntoSegment_queue_usingBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeTimeObserver:(id)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __93__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__removeTimeObserver___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __93__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver__removeTimeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_ensureObserversAreScheduledForItem:(id)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  if (a3)
  {
    stateQueue = self->_stateQueue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __110__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversAreScheduledForItem___block_invoke;
    v4[3] = &unk_1E302FCE8;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(stateQueue, v4);
  }
}

uint64_t __110__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversAreScheduledForItem___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "currentSnapshot");
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "rescheduleObserverWithSnapshot:itemToSchedule:", v3, *(_QWORD *)(a1 + 40));
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_ensureObserversHandleSnapshotSegmentsChanged
{
  NSObject *stateQueue;
  _QWORD block[5];

  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __119__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversHandleSnapshotSegmentsChanged__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __119__AVPlayerItemIntegratedTimeline_AVPlayerItemIntegratedTimelineObserver___ensureObserversHandleSnapshotSegmentsChanged__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "count");
  if (result)
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "currentSnapshot");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 192);
    result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)v12;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "ensureBoundaryObserverSegmentStillExistsWithNewSnapshot:", v3);
            v9 = (void *)objc_msgSend(v8, "scheduledSegment");
            if ((objc_msgSend(v8, "hasObserverBeenScheduledYet") & 1) != 0)
              goto LABEL_13;
            v10 = objc_msgSend(*(id *)(a1 + 32), "_currentItemForSegmentType:", objc_msgSend(v9, "segmentType"));
          }
          else
          {
            if ((objc_msgSend(v8, "hasObserverBeenScheduledYet") & 1) != 0)
              goto LABEL_13;
            v10 = objc_msgSend(*(id *)(a1 + 32), "_currentItemForCurrentSegment");
          }
          objc_msgSend(v8, "rescheduleObserverWithSnapshot:itemToSchedule:", v3, v10);
LABEL_13:
          ++v7;
        }
        while (v5 != v7);
        result = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v5 = result;
      }
      while (result);
    }
  }
  return result;
}

@end
