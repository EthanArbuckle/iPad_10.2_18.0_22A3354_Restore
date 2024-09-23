@implementation BWIrisMovieGenerator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWIrisMovieGenerator)initWithReadableByteStream:(OpaqueCMByteStream *)a3 forFrontFacingCamera:(BOOL)a4 forExternalCamera:(BOOL)a5 clientExpectsCameraMountedInLandscapeOrientation:(BOOL)a6 sampleReferenceMoviesEnabled:(BOOL)a7 movieGenerationQueue:(id)a8 irisStillImageMovieMetadataCache:(id)a9 videoOrientationTimeMachine:(id)a10
{
  return (BWIrisMovieGenerator *)-[BWIrisMovieGenerator initWithReadableByteStream:metadataByteStream:forFrontFacingCamera:forExternalCamera:clientExpectsCameraMountedInLandscapeOrientation:sampleReferenceMoviesEnabled:movieGenerationQueue:irisStillImageMovieMetadataCache:videoOrientationTimeMachine:]((char *)self, a3, (uint64_t)a3, a4, a5, a6, a7, a8, a9, a10);
}

- (char)initWithReadableByteStream:(uint64_t)a3 metadataByteStream:(char)a4 forFrontFacingCamera:(char)a5 forExternalCamera:(char)a6 clientExpectsCameraMountedInLandscapeOrientation:(char)a7 sampleReferenceMoviesEnabled:(void *)a8 movieGenerationQueue:(void *)a9 irisStillImageMovieMetadataCache:(void *)a10 videoOrientationTimeMachine:
{
  char *v10;
  char *v17;
  uint64_t v18;
  BWLimitedGMErrorLogger *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v22;
  uint64_t v23;

  v10 = a1;
  v23 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2 && a8)
    {
      v22.receiver = a1;
      v22.super_class = (Class)BWIrisMovieGenerator;
      v17 = (char *)objc_msgSendSuper2(&v22, sel_init);
      v10 = v17;
      if (v17)
      {
        v17[8] = a4;
        v17[9] = a5;
        v17[10] = a6;
        v17[11] = a7;
        *((_QWORD *)v17 + 5) = CFRetain(a2);
        *((_QWORD *)v10 + 12) = FigSimpleMutexCreate();
        *((_QWORD *)v10 + 13) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        *((_QWORD *)v10 + 15) = a8;
        v18 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)(v10 + 72) = *MEMORY[0x1E0CA2E18];
        *((_QWORD *)v10 + 11) = *(_QWORD *)(v18 + 16);
        *((_QWORD *)v10 + 17) = a9;
        *((_QWORD *)v10 + 18) = a10;
        v19 = [BWLimitedGMErrorLogger alloc];
        *((_QWORD *)v10 + 19) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:](v19, "initWithName:maxLoggingCount:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p Live Photo Movie Generator"), v10), 10);
        FigAtomicIncrement32();
        if (dword_1EE6BE518)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
      }
    }
    else
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v10;
}

- (void)dealloc
{
  OpaqueCMByteStream *byteStream;
  OpaqueFigFormatReader *masterMovieReader;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v6;
  os_log_type_t type;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  byteStream = self->_byteStream;
  if (byteStream)
    CFRelease(byteStream);
  masterMovieReader = self->_masterMovieReader;
  if (masterMovieReader)
    CFRelease(masterMovieReader);
  -[NSMutableArray count](self->_movieInfoAndCallbacks, "count");

  FigSimpleMutexDestroy();
  FigAtomicDecrement32();
  if (dword_1EE6BE518)
  {
    v8 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6.receiver = self;
  v6.super_class = (Class)BWIrisMovieGenerator;
  -[BWIrisMovieGenerator dealloc](&v6, sel_dealloc);
}

- (void)writeMovieWithInfo:(id)a3 completionHandler:(id)a4
{
  void *v7;
  BWIrisMovieInfoAndCallback *v8;
  int v9;
  CMTime v10;
  CMTime time1;

  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  v7 = (void *)objc_msgSend((id)-[NSMutableArray lastObject](self->_movieInfoAndCallbacks, "lastObject"), "info");
  if (v7)
  {
    objc_msgSend(v7, "movieTrimEndTime");
    if (a3)
      objc_msgSend(a3, "movieTrimEndTime");
    else
      memset(&v10, 0, sizeof(v10));
    CMTimeCompare(&time1, &v10);
  }
  v8 = +[BWIrisMovieInfoAndCallback movieInfoAndCallbackWithMovieInfo:callback:](BWIrisMovieInfoAndCallback, "movieInfoAndCallbackWithMovieInfo:callback:", a3, a4, v10.value, *(_QWORD *)&v10.timescale, v10.epoch);
  -[NSMutableArray addObject:](self->_movieInfoAndCallbacks, "addObject:", v8);
  if (-[BWIrisMovieInfo numberOfRequestedVariants](-[BWIrisMovieInfoAndCallback info](v8, "info"), "numberOfRequestedVariants") < 2)v9 = 1;
  else
    v9 = -[BWIrisMovieInfo numberOfRequestedVariants](-[BWIrisMovieInfoAndCallback info](v8, "info"), "numberOfRequestedVariants");
  self->_numberOfPendingReferenceMovies += v9;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
}

- (void)parseAdditionalFragments
{
  _DWORD *v3;
  NSObject *movieGenerationQueue;
  _QWORD v5[5];

  v3 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  movieGenerationQueue = self->_movieGenerationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__BWIrisMovieGenerator_parseAdditionalFragments__block_invoke;
  v5[3] = &unk_1E491E720;
  v5[4] = self;
  fig_dispatch_async_autoreleasepool(movieGenerationQueue, v5);
  if (*v3 == 1)
    kdebug_trace();
}

uint64_t __48__BWIrisMovieGenerator_parseAdditionalFragments__block_invoke(uint64_t a1)
{
  return -[BWIrisMovieGenerator _generateIrisMovies:](*(_QWORD *)(a1 + 32), 0);
}

- (uint64_t)_generateIrisMovies:(uint64_t)a1
{
  uint64_t v2;
  _DWORD *v4;
  uint64_t v5;
  double v6;
  void *v7;
  CMTime v9;
  CMTime v10;
  CMTime v11;
  CMTime v12;

  v2 = a1;
  if (!a1)
    return v2;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (*(_BYTE *)(v2 + 57))
  {
    -[BWIrisMovieGenerator _cancelAllPendingIrisMoviesWithError:](v2, *(unsigned int *)(v2 + 60));
    v5 = objc_msgSend((id)v2, "suspended");
LABEL_10:
    v2 = v5;
    goto LABEL_11;
  }
  if (!_FigIsCurrentDispatchQueue())
    FigDebugAssert3();
  if (!-[BWIrisMovieGenerator _doIrisMovieParsing:](v2, a2))
  {
    memset(&v12, 0, sizeof(v12));
    memset(&v11, 0, sizeof(v11));
    -[BWIrisMovieGenerator _findIrisShortestTrackDuration:audioTrackDuration:flush:](v2, &v11, &v12, a2, v6);
    v10 = v11;
    v9 = v12;
    v7 = (void *)-[BWIrisMovieGenerator _completedMovieInfoAndCallbacksForShortestTrackDuration:audioTrackDuration:flush:](v2, (__int128 *)&v10.value, (__int128 *)&v9.value, a2);
    v5 = -[BWIrisMovieGenerator _generateCompletedIrisMovies:](v2, v7);
    goto LABEL_10;
  }
  v2 = 0;
LABEL_11:
  if (*v4 == 1)
    kdebug_trace();
  return v2;
}

- (BOOL)flush
{
  NSObject *movieGenerationQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  movieGenerationQueue = self->_movieGenerationQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__BWIrisMovieGenerator_flush__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(movieGenerationQueue, v5);
  v3 = *((_BYTE *)v7 + 24) == 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __29__BWIrisMovieGenerator_flush__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A858DD40]();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[BWIrisMovieGenerator _generateIrisMovies:](*(_QWORD *)(a1 + 32), 1);
  objc_autoreleasePoolPop(v2);
}

- (BOOL)flushAsync
{
  NSObject *movieGenerationQueue;
  BOOL v4;
  _QWORD v6[5];

  movieGenerationQueue = self->_movieGenerationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__BWIrisMovieGenerator_flushAsync__block_invoke;
  v6[3] = &unk_1E491E720;
  v6[4] = self;
  fig_dispatch_async_autoreleasepool(movieGenerationQueue, v6);
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  v4 = -[NSMutableArray count](self->_movieInfoAndCallbacks, "count") == 0;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  return v4;
}

uint64_t __34__BWIrisMovieGenerator_flushAsync__block_invoke(uint64_t a1)
{
  return -[BWIrisMovieGenerator _generateIrisMovies:](*(_QWORD *)(a1 + 32), 1);
}

- (void)updateOverCaptureQualityScoresForMoviesEndingBefore:(id *)a3 fromMetadataRingBuffer:(id)a4
{
  uint64_t v5;

  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  v5 = -[NSMutableArray count](self->_movieInfoAndCallbacks, "count");
  if (v5 - 1 >= 0)
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_movieInfoAndCallbacks, "objectAtIndexedSubscript:", v5 - 1), "overCaptureQualityScore");
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
}

uint64_t __99__BWIrisMovieGenerator_updateOverCaptureQualityScoresForMoviesEndingBefore_fromMetadataRingBuffer___block_invoke(uint64_t a1, uint64_t a2, CMTime *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  CMTime v9;
  CMTime time1;

  time1 = *a3;
  v9 = *(CMTime *)(a1 + 40);
  result = CMTimeCompare(&time1, &v9);
  if ((result & 0x80000000) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "processMetadata:", a2);
  *a5 = 1;
  return result;
}

- (void)setSuspended:(BOOL)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  self->_suspended = a3;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
}

- (BOOL)suspended
{
  BOOL suspended;

  pthread_mutex_lock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  suspended = self->_suspended;
  pthread_mutex_unlock((pthread_mutex_t *)self->_movieInfoAndCallbacksMutex);
  return suspended;
}

- (int)numberOfPendingReferenceMovies
{
  FigMemoryBarrier();
  return self->_numberOfPendingReferenceMovies;
}

- (uint64_t)_cancelAllPendingIrisMoviesWithError:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  int v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 96));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = *(void **)(v3 + 104);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = (void *)MEMORY[0x1A858DD40]();
          v11 = 1;
          objc_msgSend(v9, "setProcessed:", 1);
          if ((int)objc_msgSend((id)objc_msgSend(v9, "info"), "numberOfRequestedVariants") >= 2)
            v11 = objc_msgSend((id)objc_msgSend(v9, "info"), "numberOfRequestedVariants");
          v12 = *(_DWORD *)(v3 + 112);
          v13 = __OFSUB__(v12, v11);
          v14 = v12 - v11;
          if (v14 < 0 != v13)
            v14 = 0;
          *(_DWORD *)(v3 + 112) = v14;
          v15 = objc_msgSend(v9, "callback");
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, objc_msgSend(v9, "info"), a2);
          objc_autoreleasePoolPop(v10);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
    objc_msgSend(*(id *)(v3 + 104), "removeAllObjects");
    return pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
  }
  return result;
}

- (uint64_t)_doIrisMovieParsing:(uint64_t)a1
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, _QWORD, int *);
  unsigned int v9;
  int v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (uint64_t *)(a1 + 48);
  if (!*(_QWORD *)(a1 + 48))
  {
    v12 = *MEMORY[0x1E0CC4290];
    v13[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v5 = FigFormatReaderCreateForStream();
    if ((_DWORD)v5)
    {
      v6 = v5;
      goto LABEL_17;
    }
  }
  if (*(_BYTE *)(a1 + 56))
    return 0;
  v11 = 0;
  v7 = *v4;
  v8 = *(uint64_t (**)(uint64_t, _QWORD, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v8)
    v9 = v8(v7, 0, &v11);
  else
    v9 = -12782;
  if ((a2 & (v9 != 0)) != 0)
    v6 = 0;
  else
    v6 = v9;
  if ((_DWORD)v6)
  {
LABEL_17:
    FigDebugAssert3();
    return v6;
  }
  if ((v11 & 4) != 0)
    *(_BYTE *)(a1 + 56) = 1;
  return v6;
}

- (double)_findIrisShortestTrackDuration:(CMTime *)a3 audioTrackDuration:(char)a4 flush:(double)result
{
  __int128 v7;
  CMTimeEpoch v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, _QWORD, char *, uint64_t *);
  unsigned int (*v15)(uint64_t, uint64_t, CFTypeRef *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  unsigned int (*v17)(uint64_t, uint64_t, uint64_t, CFDictionaryRef *);
  CMTime v18;
  CMTime v19;
  CMTime v20;
  CMTime time2;
  CMTime time1;
  CMTime v23;
  CFDictionaryRef v24;
  uint64_t v25;
  uint64_t v26;
  CFTypeRef v27[3];

  if (a1)
  {
    v20 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
    v7 = *MEMORY[0x1E0CA2E18];
    *(_OWORD *)&v19.value = *MEMORY[0x1E0CA2E18];
    v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v19.epoch = v8;
    if ((a4 & 1) != 0)
    {
LABEL_27:
      *a2 = v19;
      result = *(double *)&v20.value;
      *a3 = v20;
      return result;
    }
    v9 = *(_QWORD *)(a1 + 48);
    *(_OWORD *)&v18.value = v7;
    v18.epoch = v8;
    v26 = 0;
    v27[0] = 0;
    v10 = *(unsigned int (**)(uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v10 && !v10(v9, &v26))
    {
      if (v26 < 1)
      {
LABEL_24:
        if (v27[0])
          CFRelease(v27[0]);
        v19 = v18;
        goto LABEL_27;
      }
      v11 = 0;
      v12 = *MEMORY[0x1E0CC6240];
      v13 = *MEMORY[0x1E0C9AE00];
      while (1)
      {
        v25 = 0;
        v14 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD, char *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                         + 48);
        if (!v14 || v14(v9, v11, 0, (char *)&v25 + 4, &v25))
          break;
        if (HIDWORD(v25) != 1835365473 || (qtrmg_metadataTrackWithIDShouldBePropagated(v9, v25) & 1) != 0)
        {
          v15 = *(unsigned int (**)(uint64_t, uint64_t, CFTypeRef *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 48);
          if (!v15)
            break;
          if (v15(v9, v11, v27, 0, 0))
            break;
          v24 = 0;
          FigBaseObject = FigTrackReaderGetFigBaseObject();
          v17 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, CFDictionaryRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                            + 48);
          if (!v17 || v17(FigBaseObject, v12, v13, &v24))
            break;
          memset(&v23, 0, sizeof(v23));
          CMTimeMakeFromDictionary(&v23, v24);
          if (v24)
            CFRelease(v24);
          if (HIDWORD(v25) == 1936684398)
            v20 = v23;
          time1 = v18;
          time2 = v23;
          CMTimeMinimum(&v18, &time1, &time2);
          if (v27[0])
          {
            CFRelease(v27[0]);
            v27[0] = 0;
          }
        }
        if (++v11 >= v26)
          goto LABEL_24;
      }
    }
    FigDebugAssert3();
    goto LABEL_24;
  }
  return result;
}

- (uint64_t)_completedMovieInfoAndCallbacksForShortestTrackDuration:(__int128 *)a3 audioTrackDuration:(char)a4 flush:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char v15;

  if (result)
  {
    v7 = result;
    pthread_mutex_lock(*(pthread_mutex_t **)(result + 96));
    v8 = *(void **)(v7 + 104);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__BWIrisMovieGenerator__completedMovieInfoAndCallbacksForShortestTrackDuration_audioTrackDuration_flush___block_invoke;
    v10[3] = &unk_1E491E9F8;
    v15 = a4;
    v10[4] = v7;
    v11 = *a3;
    v12 = *((_QWORD *)a3 + 2);
    v13 = *a2;
    v14 = *((_QWORD *)a2 + 2);
    v9 = objc_msgSend(*(id *)(v7 + 104), "objectsAtIndexes:", objc_msgSend(v8, "indexesOfObjectsPassingTest:", v10));
    pthread_mutex_unlock(*(pthread_mutex_t **)(v7 + 96));
    return v9;
  }
  return result;
}

- (uint64_t)_generateCompletedIrisMovies:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  float v13;
  float v14;
  double v15;
  float v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v25;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v25 != v5)
            objc_enumerationMutation(a2);
          v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
          v8 = (void *)MEMORY[0x1A858DD40]();
          if ((objc_msgSend((id)v3, "suspended") & 1) != 0)
          {
            objc_autoreleasePoolPop(v8);
            return 1;
          }
          objc_msgSend(v7, "setProcessed:", 1);
          v9 = v7;
          v10 = (void *)objc_msgSend(v7, "info");
          v11 = objc_msgSend((id)objc_msgSend(v10, "settings"), "movieLevelMetadata");
          v12 = (id)v11;
          if (*(_QWORD *)(v3 + 136))
            v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityDisabledIfRequired(v11);
          if (objc_msgSend(v10, "isVitalityScoreValid"))
          {
            objc_msgSend(v10, "vitalityScore");
            v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithVitalityScore(v12, objc_msgSend(v10, "vitalityScoringVersion"), v13);
          }
          if (objc_msgSend(v10, "limitStillImageTransformDuringVitalityPlayback"))
            v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithLimitStillImageTransformFlagIfRequired(v12);
          if (objc_msgSend((id)objc_msgSend(v10, "subjectRelightingResult"), "relightingRequired"))
          {
            objc_msgSend((id)objc_msgSend(v10, "subjectRelightingResult"), "curveParameter");
            v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSubjectRelightingAppliedCurveParameter(v12, v14);
          }
          if (objc_msgSend((id)objc_msgSend(v10, "stillImageRequestSettings"), "smartStyle"))
            v12 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSmartStyleMetadata(v12, (void *)objc_msgSend((id)objc_msgSend(v10, "stillImageRequestSettings"), "smartStyle"), objc_msgSend((id)objc_msgSend(v10, "settings"), "smartStyleRenderingBypassed"));
          objc_msgSend(v7, "overCaptureQualityScore");
          objc_msgSend(v7, "overCaptureQualityScore");
          v16 = v15;
          v17 = (id)FigCaptureMetadataUtilitiesCreateMovieLevelMetadataWithSpatialOverCaptureQualityScore(v12, objc_msgSend(v7, "overCaptureQualityScoringVersion"), v16);
          v18 = -[BWIrisMovieGenerator _generateRefMovieForInfo:movieLevelMetadata:generateMetadataMovie:](v3, v10, (uint64_t)v17, 0);
          pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 96));
          if ((int)objc_msgSend((id)objc_msgSend(v7, "info"), "numberOfRequestedVariants") < 2)
            v19 = 1;
          else
            v19 = objc_msgSend((id)objc_msgSend(v7, "info"), "numberOfRequestedVariants");
          v20 = *(_DWORD *)(v3 + 112);
          v21 = __OFSUB__(v20, v19);
          v22 = v20 - v19;
          if (v22 < 0 != v21)
            v22 = 0;
          *(_DWORD *)(v3 + 112) = v22;
          pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));
          v23 = objc_msgSend(v7, "callback");
          (*(void (**)(uint64_t, void *, uint64_t))(v23 + 16))(v23, v10, v18);
          pthread_mutex_lock(*(pthread_mutex_t **)(v3 + 96));
          objc_msgSend(*(id *)(v3 + 104), "removeObjectIdenticalTo:", v7);
          pthread_mutex_unlock(*(pthread_mutex_t **)(v3 + 96));

          objc_autoreleasePoolPop(v8);
          ++v6;
        }
        while (v4 != v6);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        v4 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

uint64_t __105__BWIrisMovieGenerator__completedMovieInfoAndCallbacksForShortestTrackDuration_audioTrackDuration_flush___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  CMTime time1;
  CMTime time2;
  CMTime v18;
  CMTime rhs;
  CMTime lhs;
  CMTime v21;

  if ((objc_msgSend(a2, "processed") & 1) != 0)
    return 0;
  memset(&v21, 0, sizeof(v21));
  v8 = (void *)objc_msgSend(a2, "info");
  if (v8)
    objc_msgSend(v8, "movieEndTime");
  else
    memset(&lhs, 0, sizeof(lhs));
  v9 = (void *)objc_msgSend(a2, "info");
  if (v9)
    objc_msgSend(v9, "audioOffset");
  else
    memset(&rhs, 0, sizeof(rhs));
  CMTimeAdd(&v21, &lhs, &rhs);
  if (*(_BYTE *)(a1 + 88))
    return 1;
  memset(&v18, 0, sizeof(v18));
  v10 = *(_QWORD *)(a1 + 32);
  v11 = (void *)objc_msgSend(a2, "info");
  if (!v10)
    goto LABEL_16;
  if ((*(_BYTE *)(v10 + 84) & 1) != 0)
  {
    v18 = *(CMTime *)(v10 + 72);
    goto LABEL_17;
  }
  if (!v11)
  {
LABEL_16:
    memset(&v18, 0, sizeof(v18));
    goto LABEL_17;
  }
  objc_msgSend(v11, "masterMovieStartTime");
LABEL_17:
  time1 = v21;
  v15 = v18;
  CMTimeSubtract(&time2, &time1, &v15);
  time1 = *(CMTime *)(a1 + 40);
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
  {
    v12 = (void *)objc_msgSend(a2, "info");
    if (v12)
      objc_msgSend(v12, "movieEndTime");
    else
      memset(&v13, 0, sizeof(v13));
    time1 = v18;
    CMTimeSubtract(&v14, &v13, &time1);
    time1 = *(CMTime *)(a1 + 64);
    if (CMTimeCompare(&v14, &time1) < 1)
      return 1;
  }
  result = 0;
  *a4 = 1;
  return result;
}

- (uint64_t)_generateRefMovieForInfo:(uint64_t)a3 movieLevelMetadata:(int)a4 generateMetadataMovie:
{
  uint64_t v4;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  int32_t v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v14;
  unsigned int v15;
  Float64 Seconds;
  Float64 v17;
  Float64 v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFTypeRef v25;
  uint64_t (*v26)(CFTypeRef, _QWORD, uint64_t);
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t *);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, _QWORD, CMTime *, CMTime *);
  uint64_t v35;
  uint64_t v36;
  int v37;
  CFTypeRef v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(CFTypeRef, uint64_t, _QWORD, CMTime *);
  uint64_t v42;
  uint64_t (*v43)(CFTypeRef, uint64_t, _QWORD, CMTime *);
  uint64_t v44;
  uint64_t v45;
  const __CFAllocator *v46;
  CFTypeRef v47;
  uint64_t (*v48)(CFTypeRef, uint64_t, CMTime *);
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, CFTypeRef *, _QWORD);
  uint64_t v54;
  void *v55;
  int v56;
  int v57;
  uint64_t v58;
  unsigned int v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  CFTypeRef v63;
  uint64_t v64;
  uint64_t (*v65)(CFTypeRef, uint64_t, uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  __CFDictionary *Mutable;
  CFTypeRef v69;
  uint64_t v70;
  uint64_t (*v71)(CFTypeRef, uint64_t, uint64_t, __CFDictionary *);
  uint64_t v72;
  void *v73;
  CFTypeRef v74;
  uint64_t v75;
  uint64_t (*v76)(CFTypeRef, uint64_t, uint64_t, void *);
  uint64_t v77;
  CFDictionaryRef v78;
  CFTypeRef v79;
  uint64_t v80;
  uint64_t (*v81)(CFTypeRef, uint64_t, uint64_t, CFDictionaryRef);
  CFDictionaryRef v82;
  CFTypeRef v83;
  uint64_t v84;
  uint64_t (*v85)(CFTypeRef, uint64_t, uint64_t, CFDictionaryRef);
  uint64_t TrackTimescale;
  CFTypeRef v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t (*v90)(CFTypeRef, uint64_t, uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  CFTypeRef v93;
  uint64_t v94;
  uint64_t (*v95)(CFTypeRef, uint64_t, uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  int v100;
  uint64_t v101;
  uint64_t v102;
  CMTimeEpoch epoch;
  uint64_t started;
  void *v105;
  void *v106;
  Float64 v107;
  uint64_t v108;
  CFTypeRef v109;
  uint64_t (*v110)(CFTypeRef, CMTime *);
  char *v111;
  __int128 v112;
  CMTimeEpoch v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  void *v119;
  int v120;
  uint64_t v121;
  CFTypeRef v122;
  unsigned int (*v123)(CFTypeRef, uint64_t);
  CFTypeRef v124;
  uint64_t (*v125)(CFTypeRef, uint64_t, uint64_t, char *, CMSampleBufferRef *);
  CMSampleBufferRef v126;
  opaqueCMSampleBuffer *v127;
  uint64_t v128;
  opaqueCMSampleBuffer *v129;
  _BOOL4 v130;
  uint64_t v131;
  BOOL v132;
  CMTimeEpoch v133;
  CFTypeRef v134;
  void (*v135)(CFTypeRef, uint64_t);
  CFTypeRef v136;
  CMSampleBufferRef v137;
  uint64_t (*v138)(CFTypeRef, uint64_t, CMSampleBufferRef);
  uint64_t v139;
  char v140;
  char *v141;
  CMTimeFlags v142;
  CMTimeEpoch v143;
  void *v144;
  uint64_t v145;
  const __CFString *v146;
  void *v147;
  void *v148;
  void *v149;
  uint64_t v150;
  void *v151;
  id v152;
  uint64_t v153;
  void *v154;
  unsigned int v155;
  CFDictionaryRef v156;
  CFDictionaryRef v157;
  uint64_t v158;
  unsigned int v159;
  void *v160;
  void *v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  CFTypeRef v165;
  uint64_t (*v166)(CFTypeRef, CMTime *);
  void *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  char *v174;
  CMTimeFlags v175;
  CMTimeEpoch v176;
  uint64_t v177;
  CFTypeRef v178;
  uint64_t v179;
  uint64_t (*v180)(CFTypeRef, uint64_t, uint64_t, uint64_t);
  uint64_t v181;
  void *v182;
  Float64 v183;
  Float64 v184;
  uint64_t v185;
  CFTypeRef v186;
  uint64_t v187;
  uint64_t (*v188)(CFTypeRef, uint64_t, _QWORD, uint64_t);
  CFTypeRef v189;
  uint64_t (*v190)(CFTypeRef);
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  unsigned int v195;
  unsigned int v196;
  Float64 v197;
  Float64 v198;
  Float64 v199;
  void *v200;
  uint64_t v201;
  void *v202;
  const __CFString *v203;
  void *v204;
  uint64_t v205;
  void *v206;
  const __CFString *v207;
  NSObject *v208;
  unsigned int v209;
  unsigned int v210;
  Float64 v211;
  Float64 v212;
  Float64 v213;
  uint64_t v214;
  NSObject *v215;
  unsigned int v216;
  unsigned int v217;
  Float64 v218;
  Float64 v219;
  Float64 v220;
  NSObject *v221;
  unsigned int v222;
  unsigned int v223;
  Float64 v224;
  Float64 v225;
  Float64 v226;
  uint64_t v227;
  CMTime *p_value;
  CMTime *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  void *key;
  uint64_t v244;
  void *v245;
  char v246;
  uint64_t v247;
  char *v248;
  int v249;
  uint64_t v250;
  uint64_t value_low;
  unsigned int v252;
  const __CFString *v253;
  unsigned int v254;
  int32_t v255;
  unsigned int v256;
  const __CFString *v257;
  CMTimeEpoch v258;
  __int128 v259;
  CMTimeEpoch v260;
  __int128 v261;
  const __CFAllocator *allocator;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  __int128 v271;
  uint64_t v272;
  uint64_t v273;
  CMTime v274;
  CMTime v275;
  CMTime v276;
  CMTime v277;
  CMTime v278;
  CMTime v279;
  CMTime v280;
  CMTime v281;
  CMTime v282;
  CMTime v283;
  CMTime v284;
  CMTime v285;
  CMTime v286;
  CMTime v287;
  CMTime v288;
  CMTime v289;
  CMTime v290;
  CMTime v291;
  CMTime v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  CMTime v297;
  char v298[24];
  CMTime v299;
  CMTime v300;
  CMTime v301;
  CMTime v302;
  CMSampleBufferRef v303;
  CMTime v304;
  CMTime v305;
  CMTime type;
  CMSampleBufferRef sbuf;
  char v308;
  id v309;
  CMTime v310;
  char v311;
  CMTime v312;
  CMTime v313;
  CMTime v314;
  char v315;
  CMTime v316;
  CMTime v317;
  CMTime v318;
  CMTime v319;
  CMTime v320;
  CMTime lhs;
  CMTime v322;
  CMTime v323;
  __int128 v324;
  uint64_t v325;
  __int128 v326;
  uint64_t v327;
  CMTime v328;
  CMTime v329;
  CMTime v330;
  CMTime v331;
  CMTime rhs;
  CMTime v333;
  CMTime v334;
  CMTime v335;
  CMTime v336;
  CMTime v337;
  uint64_t v338;
  uint64_t v339;
  id v340;
  uint64_t v341;
  CMTime v342;
  CMTime v343;
  uint64_t v344;
  CFTypeRef cf;
  CFTypeRef v346;
  CFTypeRef v347;
  CMTime time2;
  CMTime time1;
  char v350;
  char v351;
  CMTime v352;
  _BYTE v353[128];
  CMTime v354;
  CMTime v355;
  CMTime value;
  Float64 v357;
  __int16 v358;
  Float64 v359;
  __int16 v360;
  Float64 v361;
  __int16 v362;
  Float64 v363;
  CMTime time;
  uint64_t v365;

  v365 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v8 = a1;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    if (a2)
      objc_msgSend(a2, "stillImageCaptureHostTime");
    else
      memset(&v352, 0, sizeof(v352));
    time = v352;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  if (!a2)
    return 4294950346;
  objc_msgSend(a2, "masterMovieStartTime");
  if ((v351 & 1) == 0)
    return 4294950346;
  objc_msgSend(a2, "stillImageCaptureTime");
  if ((v350 & 1) == 0)
    return 4294950346;
  objc_msgSend(a2, "stillImageCaptureTime");
  objc_msgSend(a2, "masterMovieStartTime");
  if (CMTimeCompare(&time1, &time2) < 1)
    return 4294950346;
  v347 = 0;
  v346 = 0;
  cf = 0;
  v344 = 0;
  v267 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v266 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v263 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v264 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v261 = *MEMORY[0x1E0CA2E30];
  *(_OWORD *)&v343.value = *MEMORY[0x1E0CA2E30];
  v260 = *(_QWORD *)(MEMORY[0x1E0CA2E30] + 16);
  v343.epoch = v260;
  v259 = *MEMORY[0x1E0CA2E28];
  *(_OWORD *)&v342.value = *MEMORY[0x1E0CA2E28];
  v258 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  v342.epoch = v258;
  v341 = 0;
  v338 = FigReentrantMutexCreate();
  v339 = FigConditionVariableCreate();
  v340 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(a2, "numberOfRequestedVariants") != 1)
  {
    LODWORD(p_value) = 0;
    FigDebugAssert3();
    v10 = FigSignalErrorAt();
    v98 = *(void **)(v8 + 152);
    v99 = CFSTR("too many variants");
    goto LABEL_115;
  }
  memset(&v337, 0, sizeof(v337));
  if ((*(_BYTE *)(v8 + 84) & 1) != 0)
    v337 = *(CMTime *)(v8 + 72);
  else
    objc_msgSend(a2, "masterMovieStartTime");
  objc_msgSend(a2, "movieStartTime");
  objc_msgSend(a2, "movieTrimStartTime");
  v12 = CMTimeCompare(&v336, &v335);
  objc_msgSend(a2, "masterMovieStartTime");
  time = v337;
  if (CMTimeCompare(&v334, &time))
  {
    memset(&v333, 0, sizeof(v333));
    objc_msgSend(a2, "masterMovieStartTime");
    time = v337;
    CMTimeSubtract(&v333, &time, &rhs);
    if (dword_1EE6BE518)
    {
      LODWORD(v355.value) = 0;
      LOBYTE(type.value) = 0;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      v14 = v355.value;
      if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT))
        v15 = v14;
      else
        v15 = v14 & 0xFFFFFFFE;
      if (v15)
      {
        v273 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        objc_msgSend(a2, "masterMovieStartTime");
        Seconds = CMTimeGetSeconds(&v331);
        time = v337;
        v17 = CMTimeGetSeconds(&time);
        time = v333;
        v18 = CMTimeGetSeconds(&time);
        LODWORD(value.value) = 136316418;
        *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInfo:movieL"
                                                                  "evelMetadata:generateMetadataMovie:]";
        LOWORD(value.flags) = 2048;
        *(_QWORD *)((char *)&value.flags + 2) = v8;
        HIWORD(value.epoch) = 2048;
        v357 = *(double *)&v273;
        v358 = 2048;
        v359 = Seconds;
        v360 = 2048;
        v361 = v17;
        v362 = 2048;
        v363 = v18;
        LODWORD(v230) = 62;
        p_value = &value;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    objc_msgSend(a2, "movieStartTime", p_value, v230);
    objc_msgSend(a2, "masterMovieStartTime");
    if (!CMTimeCompare(&v330, &v329))
    {
      v328 = v337;
      objc_msgSend(a2, "setMovieStartTime:", &v328);
      if (!v12)
      {
        objc_msgSend(a2, "movieStartTime");
        v324 = v326;
        v325 = v327;
        objc_msgSend(a2, "setMovieTrimStartTime:", &v324);
      }
    }
    v323 = v337;
    objc_msgSend(a2, "setMasterMovieStartTime:", &v323);
  }
  if (objc_msgSend(a2, "temporaryMovieURL"))
    v19 = objc_msgSend(a2, "temporaryMovieURL");
  else
    v19 = objc_msgSend(a2, "outputMovieURL");
  v270 = (void *)v19;
  memset(&v322, 0, sizeof(v322));
  objc_msgSend(a2, "movieTrimStartTime");
  objc_msgSend(a2, "masterMovieStartTime");
  CMTimeSubtract(&v322, &lhs, &v320);
  memset(&v319, 0, sizeof(v319));
  objc_msgSend(a2, "movieTrimEndTime");
  objc_msgSend(a2, "masterMovieStartTime");
  CMTimeSubtract(&v319, &v318, &v317);
  time = v319;
  -[BWIrisMovieGenerator _getAdjustedRefMovieEndTime:adjustedRefMovieEndTimeOut:](v8, &time, &v319);
  v20 = *(_QWORD *)(v8 + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3AD0], 0);
  v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  objc_msgSend(a2, "masterMovieURL");
  v22 = FigAssetReaderCreateWithURLAndFormatReader();
  if ((_DWORD)v22)
  {
    v10 = v22;
    LODWORD(p_value) = v22;
    FigDebugAssert3();
    v201 = v8;
    v202 = *(void **)(v8 + 152);
    v203 = CFSTR("create asset reader");
LABEL_354:
    objc_msgSend(v202, "logErrorNumber:errorString:", v10, v203, p_value, v4);
    v148 = 0;
    v8 = v201;
    goto LABEL_287;
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC3CF0], 0);
  v23 = FigAssetWriterCreateWithURL();
  if ((_DWORD)v23)
  {
    v10 = v23;
    LODWORD(p_value) = v23;
    FigDebugAssert3();
    v201 = v8;
    v202 = *(void **)(v8 + 152);
    v203 = CFSTR("create asset writer");
    goto LABEL_354;
  }
  CMNotificationCenterGetDefaultLocalCenter();
  v24 = CMNotificationCenterAddListener();
  if ((_DWORD)v24)
  {
    v10 = v24;
    LODWORD(p_value) = v24;
    FigDebugAssert3();
    v98 = *(void **)(v8 + 152);
    v99 = CFSTR("add queue level callbacks");
    goto LABEL_115;
  }
  if (a3)
  {
    v25 = v346;
    v26 = *(uint64_t (**)(CFTypeRef, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
    if (v26)
    {
      v27 = v26(v25, *MEMORY[0x1E0CC4470], a3);
      if (!(_DWORD)v27)
        goto LABEL_38;
      v10 = v27;
    }
    else
    {
      v10 = 4294954514;
    }
    LODWORD(p_value) = v10;
    FigDebugAssert3();
    v98 = *(void **)(v8 + 152);
    v99 = CFSTR("set movie level metadata");
    goto LABEL_115;
  }
LABEL_38:
  v28 = *(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v28)
  {
    v10 = 4294954514;
LABEL_112:
    LODWORD(p_value) = v10;
    FigDebugAssert3();
    v98 = *(void **)(v8 + 152);
    v99 = CFSTR("get track count");
LABEL_115:
    objc_msgSend(v98, "logErrorNumber:errorString:", v10, v99, p_value, v4);
    goto LABEL_286;
  }
  v29 = v28(v20, &v344);
  if ((_DWORD)v29)
  {
    v10 = v29;
    goto LABEL_112;
  }
  v30 = v344;
  if (a4 && v344 != 1)
  {
    FigDebugAssert3();
    v148 = 0;
    v10 = 0xFFFFFFFFLL;
    goto LABEL_287;
  }
  allocator = v21;
  *(_QWORD *)(v8 + 64) = -1;
  if (v30 >= 1)
  {
    v31 = 0;
    v252 = 0;
    v249 = 0;
    v32 = 0;
    v246 = 0;
    v33 = 0;
    v269 = 0;
    v235 = *MEMORY[0x1E0CC4628];
    v234 = *MEMORY[0x1E0CC45C0];
    v240 = *MEMORY[0x1E0CC6130];
    v238 = *MEMORY[0x1E0CC4688];
    v239 = *MEMORY[0x1E0CECEB0];
    key = (void *)*MEMORY[0x1E0CC47F8];
    v242 = (void *)*MEMORY[0x1E0CC47F0];
    v237 = (void *)*MEMORY[0x1E0CC4758];
    value_low = -1;
    v241 = *MEMORY[0x1E0CC4600];
    v236 = *MEMORY[0x1E0CC4760];
    v247 = *MEMORY[0x1E0CC45F0];
    v244 = *MEMORY[0x1E0CC4668];
    v250 = -1;
    while (1)
    {
      LODWORD(v355.value) = 0;
      LODWORD(type.value) = 0;
      LODWORD(v305.value) = 0;
      LODWORD(v304.value) = 0;
      v34 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, CMTime *, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 48);
      if (!v34)
      {
        v10 = 4294954514;
LABEL_239:
        v144 = *(void **)(v8 + 152);
        v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("copy track with index %d"), v33);
        goto LABEL_284;
      }
      v35 = v34(v20, v33, 0, &type, &v355);
      if ((_DWORD)v35)
      {
        v10 = v35;
        goto LABEL_239;
      }
      if (a4 && LODWORD(type.value) != 1835365473)
      {
LABEL_48:
        v36 = v32;
        goto LABEL_109;
      }
      if (LODWORD(type.value) == 1986618469)
      {
        v36 = (v32 + 1);
        if (objc_msgSend(a2, "requestedSDOFVariants") == 2 && (_DWORD)v32
          || objc_msgSend(a2, "requestedSDOFVariants") == 1 && (_DWORD)v32 != 1)
        {
          goto LABEL_109;
        }
        v256 = v32 + 1;
        LODWORD(v31) = qtrmg_getTrackTimescale(v20, LODWORD(v355.value));
      }
      else
      {
        if (LODWORD(type.value) == 1835365473)
        {
          if (!qtrmg_metadataTrackWithIDShouldBePropagated(v20, LODWORD(v355.value)))
            goto LABEL_48;
          if (value_low == -1)
            value_low = SLODWORD(v355.value);
        }
        v256 = v32;
      }
      v37 = *(unsigned __int8 *)(v8 + 11);
      v38 = v347;
      v39 = LODWORD(v355.value);
      v40 = *(_QWORD *)(CMBaseObjectGetVTable() + 16);
      if (v37)
      {
        v41 = *(uint64_t (**)(CFTypeRef, uint64_t, _QWORD, CMTime *))(v40 + 32);
        if (!v41)
        {
          v10 = 4294954514;
          goto LABEL_251;
        }
        v42 = v41(v38, v39, 0, &v305);
        if ((_DWORD)v42)
        {
          v10 = v42;
LABEL_251:
          v144 = *(void **)(v8 + 152);
          v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enable original sample reference extraction for index %d"), v33);
          goto LABEL_284;
        }
      }
      else
      {
        v43 = *(uint64_t (**)(CFTypeRef, uint64_t, _QWORD, CMTime *))(v40 + 24);
        if (!v43)
        {
          v10 = 4294954514;
LABEL_265:
          v144 = *(void **)(v8 + 152);
          v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enable original sample extraction for index %d"), v33);
          goto LABEL_284;
        }
        v44 = v43(v38, v39, 0, &v305);
        if ((_DWORD)v44)
        {
          v10 = v44;
          goto LABEL_265;
        }
      }
      v45 = LODWORD(type.value);
      if (LODWORD(type.value) == 1986618469)
      {
        v250 = SLODWORD(v305.value);
        v46 = allocator;
      }
      else
      {
        v46 = allocator;
        if (LODWORD(type.value) == 1936684398)
          *(_QWORD *)(v8 + 64) = SLODWORD(v305.value);
      }
      v47 = v346;
      v48 = *(uint64_t (**)(CFTypeRef, uint64_t, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
      if (!v48)
      {
        v10 = 4294954514;
LABEL_246:
        v144 = *(void **)(v8 + 152);
        v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("add native track for index %d"), v33);
        goto LABEL_284;
      }
      v49 = v48(v47, v45, &v304);
      if ((_DWORD)v49)
      {
        v10 = v49;
        goto LABEL_246;
      }
      v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v269);
      objc_msgSend(v266, "setObject:forKeyedSubscript:", v50, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v304.value)));
      v254 = v31;
      if (SLODWORD(type.value) > 1936684397)
      {
        if (LODWORD(type.value) == 1936684398)
        {
          CMTimeMake(&v316, 10, 1);
          v78 = CMTimeCopyAsDictionary(&v316, v46);
          v79 = v346;
          v80 = LODWORD(v304.value);
          v81 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
          if (!v81)
          {
            CFRelease(v78);
            v10 = 4294954514;
LABEL_283:
            v144 = *(void **)(v8 + 152);
            v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set preferred chunk duration for track %d"), LODWORD(v304.value));
            goto LABEL_284;
          }
          v10 = v81(v79, v80, v235, v78);
          CFRelease(v78);
          if ((_DWORD)v10)
            goto LABEL_283;
          time = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
          v82 = CMTimeCopyAsDictionary(&time, allocator);
          v83 = v346;
          v84 = LODWORD(v304.value);
          v85 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, CFDictionaryRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 64);
          if (!v85)
          {
            CFRelease(v82);
            v10 = 4294954514;
LABEL_300:
            v144 = *(void **)(v8 + 152);
            v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set interleave advance for track %d"), LODWORD(v304.value));
LABEL_284:
            objc_msgSend(v144, "logErrorNumber:errorString:", v10, v145);
LABEL_285:
            v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_286:
            v148 = 0;
            goto LABEL_287;
          }
          v10 = v85(v83, v84, v234, v82);
          CFRelease(v82);
          if ((_DWORD)v10)
            goto LABEL_300;
        }
        else if (LODWORD(type.value) == 1986618469)
        {
          v252 = v304.value;
LABEL_81:
          v52 = LODWORD(v355.value);
          v53 = *(uint64_t (**)(uint64_t, uint64_t, CFTypeRef *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 56);
          if (!v53)
          {
            v10 = 4294954514;
LABEL_268:
            FigDebugAssert3();
            goto LABEL_285;
          }
          v54 = v53(v20, v52, &cf, 0);
          if ((_DWORD)v54)
          {
            v10 = v54;
            goto LABEL_268;
          }
          v55 = (void *)objc_msgSend(a2, "settings");
          v56 = objc_msgSend(v55, "videoOrientation");
          v57 = objc_msgSend(v55, "videoMirrored");
          time.value = 0;
          v58 = FigTrackReaderCopyProperty((uint64_t)cf, v240, (uint64_t)v46, (uint64_t)&time);
          if ((_DWORD)v58)
          {
            v10 = v58;
            goto LABEL_268;
          }
          v59 = objc_msgSend((id)objc_msgSend((id)time.value, "objectForKeyedSubscript:", CFSTR("Width")), "intValue");
          v60 = objc_msgSend((id)objc_msgSend((id)time.value, "objectForKeyedSubscript:", CFSTR("Height")), "intValue");

          v61 = BWBuildVideoTrackMatrix(v56, v57, 0, *(unsigned __int8 *)(v8 + 8), *(unsigned __int8 *)(v8 + 9), 0, v59 | (unint64_t)(v60 << 32));
          if (v61)
          {
            v62 = v61;
            v63 = v346;
            v64 = LODWORD(v304.value);
            v65 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 64);
            if (!v65)
            {
              v10 = 4294954514;
LABEL_277:
              v144 = *(void **)(v8 + 152);
              v145 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set track matrix for track %d"), LODWORD(v304.value));
              goto LABEL_284;
            }
            v66 = v65(v63, v64, v238, v62);
            if ((_DWORD)v66)
            {
              v10 = v66;
              goto LABEL_277;
            }
          }
          v246 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v55, "videoSettings"), "objectForKeyedSubscript:", CFSTR("AVVideoCompressionPropertiesKey")), "objectForKeyedSubscript:", v239), "BOOLValue");
          value.value = 0;
          v67 = FigMetadataCopyTrackQuickTimeMetadata();
          if ((_DWORD)v67)
          {
            v10 = v67;
            goto LABEL_268;
          }
          if (value.value)
          {
            Mutable = CFDictionaryCreateMutable(allocator, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            CFDictionaryAddValue(Mutable, key, (const void *)value.value);
            CFRelease((CFTypeRef)value.value);
            CFDictionaryAddValue(Mutable, v242, v237);
            v69 = v346;
            v70 = LODWORD(v304.value);
            v71 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 64);
            if (!v71)
            {
              CFRelease(Mutable);
              v10 = 4294954514;
LABEL_279:
              FigDebugAssert3();
              goto LABEL_262;
            }
            v10 = v71(v69, v70, v241, Mutable);
            CFRelease(Mutable);
            if ((_DWORD)v10)
              goto LABEL_279;
          }
          v333.value = 0;
          v72 = FigMetadataCopyTrackQuickTimeUserdata();
          if ((_DWORD)v72)
          {
            v10 = v72;
            goto LABEL_279;
          }
          if (v333.value)
          {
            v73 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v236, v242);
            objc_msgSend(v73, "setObject:forKeyedSubscript:", v333.value, key);
            if (v333.value)
              CFRelease((CFTypeRef)v333.value);
            v74 = v346;
            v75 = LODWORD(v304.value);
            v76 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
            if (!v76)
            {
              v10 = 4294954514;
LABEL_281:
              FigDebugAssert3();
              v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
              goto LABEL_286;
            }
            v77 = v76(v74, v75, v241, v73);
            if ((_DWORD)v77)
            {
              v10 = v77;
              goto LABEL_281;
            }
          }
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
        }
      }
      else
      {
        if (LODWORD(type.value) == 1635088502)
          goto LABEL_81;
        if (LODWORD(type.value) == 1835365473)
        {
          objc_msgSend(v264, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v304.value)));
          v51 = v249;
          if (!v249)
            v51 = v304.value;
          v249 = v51;
        }
      }
      TrackTimescale = qtrmg_getTrackTimescale(v20, LODWORD(v355.value));
      v87 = v346;
      v88 = LODWORD(v304.value);
      v89 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", TrackTimescale);
      v90 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 64);
      if (!v90)
      {
        v10 = 4294954514;
LABEL_249:
        v149 = *(void **)(v8 + 152);
        v150 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set time scale %d for track %d"), TrackTimescale, LODWORD(v304.value));
        goto LABEL_261;
      }
      v91 = v90(v87, v88, v247, v89);
      if ((_DWORD)v91)
      {
        v10 = v91;
        goto LABEL_249;
      }
      if (*(_BYTE *)(v8 + 11))
      {
        v92 = objc_msgSend((id)objc_msgSend(v270, "URLByDeletingLastPathComponent"), "absoluteURL");
        v93 = v346;
        v94 = LODWORD(v304.value);
        v95 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 64);
        if (!v95)
        {
          v10 = 4294954514;
          goto LABEL_260;
        }
        v96 = v95(v93, v94, v244, v92);
        if ((_DWORD)v96)
        {
          v10 = v96;
LABEL_260:
          v149 = *(void **)(v8 + 152);
          v150 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set sample reference base URL for track %d"), LODWORD(v304.value), v231);
LABEL_261:
          objc_msgSend(v149, "logErrorNumber:errorString:", v10, v150);
LABEL_262:
          v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          goto LABEL_286;
        }
      }
      ++v269;
      v97 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v305.value));
      objc_msgSend(v267, "setObject:forKeyedSubscript:", v97, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(v304.value)));
      v31 = v254;
      v36 = v256;
LABEL_109:
      ++v33;
      v32 = v36;
      if (v33 >= v344)
        goto LABEL_117;
    }
  }
  v250 = -1;
  value_low = -1;
  v269 = 0;
  v246 = 0;
  v249 = 0;
  v252 = 0;
  v31 = 0;
LABEL_117:
  objc_msgSend(a2, "stillImageCaptureTime");
  if ((v315 & 1) != 0
    && (a4 & 1) == 0
    && +[BWIrisMovieGenerator _addNewMetadataTrackToAssetWriter:forTrackTimeScale:yieldingTrackID:]((uint64_t)BWIrisMovieGenerator, (uint64_t)v346, v31, (unsigned int *)&v341 + 1))
  {
    objc_msgSend(v264, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v341)));
  }
  v100 = objc_msgSend((id)objc_msgSend(a2, "settings"), "recordVideoOrientationAndMirroringChanges");
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v100
    && *(_QWORD *)(v8 + 144)
    && +[BWIrisMovieGenerator _addNewMetadataTrackToAssetWriter:forTrackTimeScale:yieldingTrackID:]((uint64_t)BWIrisMovieGenerator, (uint64_t)v346, v31, (unsigned int *)&v341))
  {
    objc_msgSend(v264, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v341));
  }
  v101 = objc_msgSend(v267, "allKeys");
  v102 = qtrmg_setupMetadataTrackReferences((uint64_t)v346, v252, v264);
  if ((_DWORD)v102)
  {
    v10 = v102;
    v232 = v4;
    LODWORD(p_value) = v102;
    FigDebugAssert3();
    v147 = *(void **)(v8 + 152);
    v146 = CFSTR("set metadata track references");
    goto LABEL_243;
  }
  memset(&v314, 0, sizeof(v314));
  time = v322;
  CMTimeConvertScale(&v314, &time, v31, kCMTimeRoundingMethod_QuickTime);
  v313 = v319;
  memset(&v312, 0, sizeof(v312));
  objc_msgSend(a2, "audioOffset");
  if ((v311 & 1) != 0)
  {
    objc_msgSend(a2, "audioOffset");
    time = v313;
    CMTimeAdd(&v312, &time, &v310);
  }
  else
  {
    v312 = v313;
  }
  time = v313;
  CMTimeConvertScale(&v313, &time, v314.timescale, kCMTimeRoundingMethod_QuickTime);
  value = v312;
  CMTimeConvertScale(&time, &value, v314.timescale, kCMTimeRoundingMethod_QuickTime);
  epoch = time.epoch;
  v312 = time;
  time = v314;
  *(_OWORD *)&value.value = *(_OWORD *)&v312.value;
  value.epoch = epoch;
  started = FigAssetReaderStartExtractionForTimeRange((uint64_t)v347, (__int128 *)&time.value, (__int128 *)&value.value);
  if ((_DWORD)started)
  {
    v10 = started;
    v105 = *(void **)(v8 + 152);
    v106 = (void *)MEMORY[0x1E0CB3940];
    time = v314;
    v107 = CMTimeGetSeconds(&time);
    time = v313;
    v108 = objc_msgSend(v106, "stringWithFormat:", CFSTR("start extraction %.4lf to %.4lf"), *(_QWORD *)&v107, CMTimeGetSeconds(&time));
LABEL_242:
    v146 = (const __CFString *)v108;
    v147 = v105;
LABEL_243:
    objc_msgSend(v147, "logErrorNumber:errorString:", v10, v146, p_value, v232);
    v148 = 0;
    goto LABEL_287;
  }
  v109 = v346;
  value = v314;
  v110 = *(uint64_t (**)(CFTypeRef, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
  if (!v110)
  {
    v10 = 4294954514;
    goto LABEL_241;
  }
  time = value;
  v10 = v110(v109, &time);
  if ((_DWORD)v10)
  {
LABEL_241:
    v105 = *(void **)(v8 + 152);
    time = v314;
    v108 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin session from %.4lf"), CMTimeGetSeconds(&time), v231);
    goto LABEL_242;
  }
  v255 = v31;
  if (v269 <= 0)
  {
    FigDebugAssert3();
    v148 = 0;
    v10 = 0xFFFFFFFFLL;
    goto LABEL_287;
  }
  v245 = (void *)v101;
  v111 = (char *)malloc_type_malloc(24 * v269, 0x1000040504FFAC1uLL);
  v112 = *MEMORY[0x1E0CA2E18];
  v113 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v248 = v111;
  v114 = v111;
  v115 = v269;
  do
  {
    *(_OWORD *)v114 = v112;
    *((_QWORD *)v114 + 2) = v113;
    v114 += 24;
    --v115;
  }
  while (v115);
  v271 = v112;
  if (!objc_msgSend(v267, "count"))
  {
    v10 = 0;
    goto LABEL_254;
  }
  v257 = (const __CFString *)*MEMORY[0x1E0CA2728];
  v253 = (const __CFString *)*MEMORY[0x1E0CA2720];
  do
  {
    v309 = 0;
    v116 = qtrmg_trackIDForNextTrackBelowWater((uint64_t)&v338, &v309);
    if ((_DWORD)v116)
    {
      v10 = v116;
      LODWORD(p_value) = v116;
      FigDebugAssert3();
      objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", v10, CFSTR("next track below water level"), p_value, v4);
      goto LABEL_367;
    }
    v117 = v309;
    v118 = objc_msgSend(v309, "intValue");
    v119 = v267;
    if (!objc_msgSend(v267, "objectForKeyedSubscript:", v117))
    {
      v10 = 0;
      continue;
    }
    v120 = objc_msgSend((id)objc_msgSend(v267, "objectForKeyedSubscript:", v117), "intValue");
    v308 = 0;
    v121 = v120;
    while (1)
    {
      v122 = v346;
      v123 = *(unsigned int (**)(CFTypeRef, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 96);
      if (v123)
      {
        if (v123(v122, v118))
          break;
      }
      sbuf = 0;
      v124 = v347;
      v125 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, char *, CMSampleBufferRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 104);
      if (!v125)
      {
        v10 = 4294954514;
LABEL_150:
        v128 = 84;
        if (!v308)
          v128 = 70;
        objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("extract next sample for %d (complete %c)"), v121, v128));
        goto LABEL_154;
      }
      v10 = v125(v124, v121, 1, &v308, &sbuf);
      if ((_DWORD)v10)
        goto LABEL_150;
      if (value_low <= v121 && CMSampleBufferGetNumSamples(sbuf) == 1)
      {
        time = v313;
        v126 = qtrmg_createTrimmedSampleBufferIfNeeded(sbuf, &time);
        if (v126)
        {
          v127 = v126;
          CFRelease(sbuf);
          v10 = 0;
          sbuf = v127;
          memset(&time, 0, sizeof(time));
LABEL_155:
          CMSampleBufferGetPresentationTimeStamp(&time, v127);
          v129 = sbuf;
          goto LABEL_157;
        }
      }
      v10 = 0;
LABEL_154:
      v127 = sbuf;
      memset(&time, 0, sizeof(time));
      if (sbuf)
        goto LABEL_155;
      v129 = 0;
      *(_OWORD *)&time.value = v271;
      time.epoch = v113;
LABEL_157:
      value = time;
      memset(&v333, 0, sizeof(v333));
      if (v129)
      {
        CMSampleBufferGetDecodeTimeStamp(&v333, v129);
        memset(&v355, 0, sizeof(v355));
        if (sbuf)
        {
          CMSampleBufferGetDuration(&v355, sbuf);
          goto LABEL_162;
        }
      }
      else
      {
        *(_OWORD *)&v333.value = v271;
        v333.epoch = v113;
      }
      *(_OWORD *)&v355.value = v271;
      v355.epoch = v113;
LABEL_162:
      memset(&type, 0, sizeof(type));
      if ((v355.flags & 1) != 0)
      {
        v305 = time;
        v304 = v355;
        CMTimeAdd(&type, &v305, &v304);
      }
      else
      {
        type = time;
      }
      if ((v333.flags & 1) == 0)
        v333 = time;
      if (CMGetAttachment(sbuf, v257, 0))
      {
        v130 = 0;
      }
      else
      {
        v305 = time;
        v304 = v314;
        v130 = CMTimeCompare(&v305, &v304) >= 0;
      }
      v131 = *(_QWORD *)(v8 + 64);
      if ((v131 & 0x8000000000000000) == 0 && v131 == v121 && (time.flags & 1) != 0)
      {
        v303 = 0;
        memset(&v305, 0, sizeof(v305));
        objc_msgSend(a2, "audioOffset");
        v304 = time;
        CMTimeSubtract(&v305, &v304, &v302);
        memset(&v304, 0, sizeof(v304));
        if ((v355.flags & 1) != 0)
        {
          v354 = v305;
          v301 = v355;
          CMTimeAdd(&v304, &v354, &v301);
        }
        else
        {
          v304 = v305;
        }
        v354 = v304;
        v301 = v314;
        if (CMTimeCompare(&v354, &v301) < 0)
        {
          if (sbuf)
          {
            CFRelease(sbuf);
            sbuf = 0;
          }
          *(_OWORD *)&time.value = v271;
          time.epoch = v113;
          *(_OWORD *)&v355.value = v271;
          v355.epoch = v113;
          *(_OWORD *)&type.value = v271;
          type.epoch = v113;
        }
        else if (sbuf)
        {
          v354 = v305;
          *(_OWORD *)&v301.value = v271;
          v301.epoch = v113;
          v10 = BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(sbuf, &v354, (__int128 *)&v301.value, &v303);
          CFRelease(sbuf);
          sbuf = v303;
          time = v305;
          type = v304;
          v354 = v305;
          v301 = v314;
          v130 = CMTimeCompare(&v354, &v301) > 0;
        }
      }
      v132 = CMGetAttachment(sbuf, v253, 0) != 0;
      if ((time.flags & 1) == 0)
        goto LABEL_183;
      if (*(_QWORD *)(v8 + 64) == v121)
      {
        *(_OWORD *)&v305.value = *(_OWORD *)&time.value;
        v133 = time.epoch;
LABEL_187:
        v305.epoch = v133;
        v304 = v313;
        if (CMTimeCompare(&v305, &v304) <= 0)
          goto LABEL_183;
        goto LABEL_188;
      }
      if (v250 == v121)
      {
        if ((v246 & 1) != 0)
        {
          if (CMSampleBufferGetNumSamples(sbuf) >= 1)
          {
            v305 = type;
            v304 = v313;
            if (CMTimeCompare(&v305, &v304) >= 1)
            {
              if (CMGetAttachment(sbuf, v257, 0))
                CMRemoveAttachment(sbuf, v257);
              v132 = 1;
            }
          }
LABEL_183:
          if (!v308)
            goto LABEL_194;
          goto LABEL_191;
        }
        *(_OWORD *)&v305.value = *(_OWORD *)&type.value;
        v133 = type.epoch;
        goto LABEL_187;
      }
      if ((int)v118 >= v249)
      {
        v305 = time;
        v304 = v313;
        if ((CMTimeCompareApproximately(&v305, &v304) & 0x80000000) != 0)
          goto LABEL_183;
      }
      else
      {
        v305 = type;
        v304 = v313;
        if (CMTimeCompare(&v305, &v304) < 1)
          goto LABEL_183;
      }
LABEL_188:
      if (sbuf)
      {
        CFRelease(sbuf);
        sbuf = 0;
      }
      v308 = 1;
      *(_OWORD *)&time.value = v271;
      time.epoch = v113;
LABEL_191:
      v134 = v346;
      v135 = *(void (**)(CFTypeRef, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 104);
      if (v135)
        v135(v134, v118);
      objc_msgSend(v263, "addObject:", v309);
LABEL_194:
      if (sbuf)
      {
        if (CMSampleBufferGetNumSamples(sbuf) >= 1)
        {
          v136 = v346;
          v137 = sbuf;
          v138 = *(uint64_t (**)(CFTypeRef, uint64_t, CMSampleBufferRef))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 80);
          if (!v138)
          {
            v10 = 4294954514;
LABEL_270:
            v156 = CMCopyDictionaryOfAttachments(allocator, sbuf, 1u);
            v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
            v148 = v248;
            if (v156)
              CFRelease(v156);
            v157 = CMCopyDictionaryOfAttachments(allocator, sbuf, 0);
            if (v157)
              CFRelease(v157);
            objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("add sample buffer to track %d"), v118));
            goto LABEL_287;
          }
          v139 = v138(v136, v118, v137);
          if ((_DWORD)v139)
          {
            v10 = v139;
            goto LABEL_270;
          }
          if ((time.flags & 0x1D) == 1)
          {
            if (v130)
            {
              v305 = time;
              v304 = v343;
              if (CMTimeCompare(&v305, &v304) < 0)
                v343 = time;
            }
            if ((type.flags & 0x1D) == 1)
            {
              v305 = type;
              v304 = v342;
              v140 = CMTimeCompare(&v305, &v304) < 1 || v132;
              if ((v140 & 1) == 0)
                v342 = type;
            }
            if ((v355.flags & 1) == 0)
              objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", 0, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wrote sample with no duration to track %d"), v118));
            v141 = &v248[24
                       * objc_msgSend((id)objc_msgSend(v266, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v118)), "integerValue")];
            v354.value = *(_QWORD *)v141;
            v354.timescale = *((_DWORD *)v141 + 2);
            v142 = *((_DWORD *)v141 + 3);
            if ((v142 & 1) == 0
              || (v143 = *((_QWORD *)v141 + 2),
                  v305.value = v354.value,
                  v305.timescale = v354.timescale,
                  v305.flags = v142,
                  v305.epoch = v143,
                  v304 = value,
                  CMTimeCompare(&v305, &v304) >= 1))
            {
              *(CMTime *)v141 = value;
            }
            v10 = 0;
          }
          else
          {
            v10 = 0;
          }
        }
        CFRelease(sbuf);
      }
      if ((_DWORD)v10 || v308)
        goto LABEL_234;
    }
    v10 = 0;
LABEL_234:
    v119 = v267;
    objc_msgSend(v267, "removeObjectsForKeys:", v263);
    objc_msgSend(v263, "removeAllObjects");
    v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  }
  while (objc_msgSend(v119, "count"));
LABEL_254:
  v151 = v264;
  if (objc_msgSend(v264, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v341))))
  {
    memset(&time, 0, sizeof(time));
    objc_msgSend(a2, "stillImageCaptureTime");
    objc_msgSend(a2, "masterMovieStartTime");
    CMTimeSubtract(&time, &v300, &v299);
    v152 = *(id *)(v8 + 136);
    if (v152)
    {
      v152 = (id)objc_msgSend(v152, "copyAndClearStillImageTransformDataForSettingsID:", objc_msgSend(a2, "livePhotoMetadataStillImageKeyFrameSettingsID"));
      if (v152 || (v153 = objc_msgSend(MEMORY[0x1E0C99D50], "data"), (v152 = (id)v153) != 0))
      {
        v154 = (void *)objc_msgSend(a2, "settings");
        v155 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v154, "videoSettings"), "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), "intValue");
        v153 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v154, "videoSettings"), "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), "intValue");
      }
      else
      {
        v155 = 0;
      }
    }
    else
    {
      v155 = 0;
      v153 = 0;
    }
    value = time;
    v10 = qtrmg_writeStillImageTimeMetadataSample((uint64_t)v346, HIDWORD(v341), (__int128 *)&value.value, v152, v155 | (unint64_t)(v153 << 32), v255);
    if ((_DWORD)v10)
    {
      objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("write still image metadata to track %d"), HIDWORD(v341)));
LABEL_349:
      v148 = v248;
      goto LABEL_287;
    }
    v151 = v264;
  }
  if (objc_msgSend(v151, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v341)))
  {
    v160 = *(void **)(v8 + 144);
    objc_msgSend(a2, "masterMovieStartTime");
    time = v314;
    value = v313;
    v161 = (void *)objc_msgSend(v160, "copyVideoOrientationSbufFromPTS:toPTS:referencePTS:", &time, &value, v298);
    if (objc_msgSend(v161, "count"))
    {
      time = v313;
      v162 = qtrmg_writeVideoOrientationMetadataSamples((uint64_t)v346, v341, v161, &time);
      if ((_DWORD)v162)
      {
        v10 = v162;
        v163 = *(void **)(v8 + 152);
        v164 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("write video orientation metadata to track %d"), v341);
        goto LABEL_310;
      }
    }
    else
    {
      v163 = *(void **)(v8 + 152);
      v164 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("copy video orientation samples from %@"), *(_QWORD *)(v8 + 144));
LABEL_310:
      objc_msgSend(v163, "logErrorNumber:errorString:", v10, v164);
    }

  }
  v165 = v346;
  value = v313;
  v166 = *(uint64_t (**)(CFTypeRef, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 112);
  if (!v166)
  {
    v10 = 4294954514;
    goto LABEL_348;
  }
  time = value;
  v10 = v166(v165, &time);
  if ((_DWORD)v10)
  {
LABEL_348:
    v200 = *(void **)(v8 + 152);
    time = v313;
    objc_msgSend(v200, "logErrorNumber:errorString:", v10, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end session to %.4lf"), CMTimeGetSeconds(&time)));
    goto LABEL_349;
  }
  memset(&v297, 0, sizeof(v297));
  time = v313;
  value = v314;
  CMTimeSubtract(&v297, &time, &value);
  v293 = 0u;
  v294 = 0u;
  v295 = 0u;
  v296 = 0u;
  v167 = v245;
  v168 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v293, v353, 16);
  if (!v168)
    goto LABEL_331;
  v169 = v168;
  v170 = *(_QWORD *)v294;
  v268 = *MEMORY[0x1E0CC4550];
  v272 = *(_QWORD *)v294;
  v148 = v248;
  while (2)
  {
    v171 = 0;
    while (2)
    {
      if (*(_QWORD *)v294 != v170)
        objc_enumerationMutation(v167);
      v172 = *(void **)(*((_QWORD *)&v293 + 1) + 8 * v171);
      v173 = objc_msgSend((id)objc_msgSend(v266, "objectForKeyedSubscript:", v172), "integerValue");
      if (v173 >= v269)
      {
        v10 = 0;
        goto LABEL_287;
      }
      v174 = &v248[24 * v173];
      v355.value = *(_QWORD *)v174;
      v355.timescale = *((_DWORD *)v174 + 2);
      v175 = *((_DWORD *)v174 + 3);
      if ((v175 & 1) == 0)
      {
        objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Earliest read PTS not available for track %@, not able to make an edit"), v172));
        goto LABEL_329;
      }
      v176 = *((_QWORD *)v174 + 2);
      memset(&time, 0, sizeof(time));
      value = v314;
      v333.value = v355.value;
      v333.timescale = v355.timescale;
      v333.flags = v175;
      v333.epoch = v176;
      CMTimeSubtract(&time, &value, &v333);
      value = time;
      if (CMTimeGetSeconds(&value) > 0.0005)
      {
        value = time;
        v333 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
        if (CMTimeCompare(&value, &v333) < 1)
        {
          v265 = *(void **)(v8 + 152);
          v182 = (void *)MEMORY[0x1E0CB3940];
          value.value = v355.value;
          value.timescale = v355.timescale;
          value.flags = v175;
          value.epoch = v176;
          v183 = CMTimeGetSeconds(&value);
          value = v314;
          v184 = CMTimeGetSeconds(&value);
          value = time;
          objc_msgSend(v265, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(v182, "stringWithFormat:", CFSTR("Earliest read PTS %.4lf is larger than from value %.4lf by %.4lf for track %@, not able to make an edit"), *(_QWORD *)&v183, *(_QWORD *)&v184, -CMTimeGetSeconds(&value), v172));
          v170 = v272;
        }
        else
        {
          value = v297;
          v333 = time;
          v177 = BWTrackEditListArrayForRegularTrackInIrisMovie((__int128 *)&value.value, (__int128 *)&v333.value);
          v178 = v346;
          v179 = objc_msgSend(v172, "intValue");
          v180 = *(uint64_t (**)(CFTypeRef, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 64);
          if (!v180)
          {
            v10 = 4294954514;
            goto LABEL_364;
          }
          v181 = v180(v178, v179, v268, v177);
          v170 = v272;
          if ((_DWORD)v181)
          {
            v10 = v181;
LABEL_364:
            v204 = *(void **)(v8 + 152);
            v205 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set edit list for track %d"), objc_msgSend(v172, "intValue"));
            goto LABEL_365;
          }
        }
      }
      v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_329:
      ++v171;
      v167 = v245;
      if (v169 != v171)
        continue;
      break;
    }
    v169 = objc_msgSend(v245, "countByEnumeratingWithState:objects:count:", &v293, v353, 16);
    if (v169)
      continue;
    break;
  }
LABEL_331:
  if (!HIDWORD(v341))
  {
LABEL_334:
    v189 = v346;
    v190 = *(uint64_t (**)(CFTypeRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 120);
    if (v190)
    {
      v191 = v190(v189);
      if (!(_DWORD)v191)
      {
        v192 = FigAssetReaderInvalidate();
        if ((_DWORD)v192)
        {
          v10 = v192;
          v231 = v4;
          LODWORD(p_value) = v192;
          FigDebugAssert3();
          v206 = *(void **)(v8 + 152);
          v207 = CFSTR("reader invalidate");
          goto LABEL_366;
        }
        v193 = FigAssetWriterInvalidate();
        if ((_DWORD)v193)
        {
          v10 = v193;
          v231 = v4;
          LODWORD(p_value) = v193;
          FigDebugAssert3();
          v206 = *(void **)(v8 + 152);
          v207 = CFSTR("writer invalidate");
          goto LABEL_366;
        }
        time = v343;
        *(_OWORD *)&value.value = v261;
        value.epoch = v260;
        if (CMTimeCompare(&time, &value))
        {
          time = v342;
          *(_OWORD *)&value.value = v259;
          value.epoch = v258;
          if (CMTimeCompare(&time, &value))
          {
            memset(&v333, 0, sizeof(v333));
            time = v343;
            value = v314;
            CMTimeSubtract(&v333, &time, &value);
            memset(&v355, 0, sizeof(v355));
            objc_msgSend(a2, "movieStartTime");
            time = v333;
            CMTimeAdd(&v355, &v292, &time);
            if ((objc_msgSend(a2, "containsTrims") & 1) == 0)
            {
              if (dword_1EE6BE518)
              {
                LODWORD(type.value) = 0;
                LOBYTE(v305.value) = 0;
                v194 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v195 = type.value;
                if (os_log_type_enabled(v194, v305.value))
                  v196 = v195;
                else
                  v196 = v195 & 0xFFFFFFFE;
                if (v196)
                {
                  objc_msgSend(a2, "movieTrimStartTime");
                  v197 = CMTimeGetSeconds(&v291);
                  time = v355;
                  v198 = CMTimeGetSeconds(&time);
                  objc_msgSend(a2, "movieTrimStartTime");
                  time = v355;
                  CMTimeSubtract(&v290, &time, &v289);
                  v199 = CMTimeGetSeconds(&v290);
                  LODWORD(value.value) = 136316162;
                  *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForI"
                                                                            "nfo:movieLevelMetadata:generateMetadataMovie:]";
                  LOWORD(value.flags) = 2048;
                  *(_QWORD *)((char *)&value.flags + 2) = v8;
                  HIWORD(value.epoch) = 2048;
                  v357 = v197;
                  v358 = 2048;
                  v359 = v198;
                  v360 = 2048;
                  v361 = v199;
                  LODWORD(v231) = 52;
                  p_value = &value;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              v288 = v355;
              objc_msgSend(a2, "setMovieTrimStartTime:", &v288, p_value, v231);
            }
            if (dword_1EE6BE518)
            {
              LODWORD(type.value) = 0;
              LOBYTE(v305.value) = 0;
              v208 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v209 = type.value;
              if (os_log_type_enabled(v208, v305.value))
                v210 = v209;
              else
                v210 = v209 & 0xFFFFFFFE;
              if (v210)
              {
                objc_msgSend(a2, "movieStartTime");
                v211 = CMTimeGetSeconds(&v287);
                time = v355;
                v212 = CMTimeGetSeconds(&time);
                objc_msgSend(a2, "movieStartTime");
                time = v355;
                CMTimeSubtract(&v286, &time, &v285);
                v213 = CMTimeGetSeconds(&v286);
                *(double *)&v214 = COERCE_DOUBLE(objc_msgSend(a2, "description"));
                LODWORD(value.value) = 136316418;
                *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInf"
                                                                          "o:movieLevelMetadata:generateMetadataMovie:]";
                LOWORD(value.flags) = 2048;
                *(_QWORD *)((char *)&value.flags + 2) = v8;
                HIWORD(value.epoch) = 2048;
                v357 = v211;
                v358 = 2048;
                v359 = v212;
                v360 = 2048;
                v361 = v213;
                v362 = 2112;
                v363 = *(double *)&v214;
                LODWORD(v231) = 62;
                p_value = &value;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            v284 = v355;
            objc_msgSend(a2, "setMovieStartTime:", &v284, p_value, v231);
            memset(&type, 0, sizeof(type));
            time = v342;
            value = v343;
            CMTimeSubtract(&type, &time, &value);
            memset(&v305, 0, sizeof(v305));
            objc_msgSend(a2, "movieStartTime");
            time = type;
            CMTimeAdd(&v305, &v283, &time);
            if ((objc_msgSend(a2, "containsTrims") & 1) == 0)
            {
              if (dword_1EE6BE518)
              {
                LODWORD(v304.value) = 0;
                LOBYTE(v354.value) = 0;
                v215 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                v216 = v304.value;
                if (os_log_type_enabled(v215, v354.value))
                  v217 = v216;
                else
                  v217 = v216 & 0xFFFFFFFE;
                if (v217)
                {
                  objc_msgSend(a2, "movieTrimEndTime");
                  v218 = CMTimeGetSeconds(&v282);
                  time = v305;
                  v219 = CMTimeGetSeconds(&time);
                  objc_msgSend(a2, "movieTrimEndTime");
                  time = v305;
                  CMTimeSubtract(&v281, &time, &v280);
                  v220 = CMTimeGetSeconds(&v281);
                  LODWORD(value.value) = 136316162;
                  *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForI"
                                                                            "nfo:movieLevelMetadata:generateMetadataMovie:]";
                  LOWORD(value.flags) = 2048;
                  *(_QWORD *)((char *)&value.flags + 2) = v8;
                  HIWORD(value.epoch) = 2048;
                  v357 = v218;
                  v358 = 2048;
                  v359 = v219;
                  v360 = 2048;
                  v361 = v220;
                  LODWORD(v233) = 52;
                  v229 = &value;
                  _os_log_send_and_compose_impl();
                }
                fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
              v279 = v305;
              objc_msgSend(a2, "setMovieTrimEndTime:", &v279, v229, v233);
            }
            if (dword_1EE6BE518)
            {
              LODWORD(v304.value) = 0;
              LOBYTE(v354.value) = 0;
              v221 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              v222 = v304.value;
              if (os_log_type_enabled(v221, v354.value))
                v223 = v222;
              else
                v223 = v222 & 0xFFFFFFFE;
              if (v223)
              {
                objc_msgSend(a2, "movieEndTime");
                v224 = CMTimeGetSeconds(&v278);
                time = v305;
                v225 = CMTimeGetSeconds(&time);
                objc_msgSend(a2, "movieEndTime");
                time = v305;
                CMTimeSubtract(&v277, &time, &v276);
                v226 = CMTimeGetSeconds(&v277);
                *(double *)&v227 = COERCE_DOUBLE(objc_msgSend(a2, "description"));
                LODWORD(value.value) = 136316418;
                *(CMTimeValue *)((char *)&value.value + 4) = (CMTimeValue)"-[BWIrisMovieGenerator _generateRefMovieForInf"
                                                                          "o:movieLevelMetadata:generateMetadataMovie:]";
                LOWORD(value.flags) = 2048;
                *(_QWORD *)((char *)&value.flags + 2) = v8;
                HIWORD(value.epoch) = 2048;
                v357 = v224;
                v358 = 2048;
                v359 = v225;
                v360 = 2048;
                v361 = v226;
                v362 = 2112;
                v363 = *(double *)&v227;
                LODWORD(v233) = 62;
                v229 = &value;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            v275 = v305;
            objc_msgSend(a2, "setMovieEndTime:", &v275, v229, v233);
          }
        }
        v10 = 0;
        v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
        v148 = v248;
        goto LABEL_287;
      }
      v10 = v191;
    }
    else
    {
      v10 = 4294954514;
    }
    v231 = v4;
    LODWORD(p_value) = v10;
    FigDebugAssert3();
    v206 = *(void **)(v8 + 152);
    v207 = CFSTR("writer finish");
    goto LABEL_366;
  }
  v185 = BWTrackEditListArrayForStillImageDisplayTimeTrackInIrisTrimmedMovie(a2, v255);
  v186 = v346;
  v187 = HIDWORD(v341);
  v188 = *(uint64_t (**)(CFTypeRef, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v188)
  {
    v10 = v188(v186, v187, *MEMORY[0x1E0CC4550], v185);
    if (!(_DWORD)v10)
      goto LABEL_334;
  }
  else
  {
    v10 = 4294954514;
  }
  v204 = *(void **)(v8 + 152);
  v205 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("set edit list for still image track %d"), HIDWORD(v341));
LABEL_365:
  v207 = (const __CFString *)v205;
  v206 = v204;
LABEL_366:
  objc_msgSend(v206, "logErrorNumber:errorString:", v10, v207, p_value, v231);
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_367:
  v148 = v248;
LABEL_287:
  if (v347)
    CFRelease(v347);
  CMNotificationCenterGetDefaultLocalCenter();
  v158 = CMNotificationCenterRemoveListener();
  if ((_DWORD)v158)
  {
    v159 = v158;
    objc_msgSend(*(id *)(v8 + 152), "logErrorNumber:errorString:", v158, CFSTR("remove queue level callbacks"));
    if ((_DWORD)v10)
      v10 = v10;
    else
      v10 = v159;
  }
  if (v346)
    CFRelease(v346);
  if (cf)
    CFRelease(cf);

  FigSimpleMutexDestroy();
  FigConditionVariableDestroy();
  v340 = 0;
  v338 = 0;
  v339 = 0;
  free(v148);
  if (*v9 == 1)
  {
    objc_msgSend(a2, "stillImageCaptureHostTime");
    time = v274;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  return v10;
}

- (uint64_t)_getAdjustedRefMovieEndTime:(CMTime *)a3 adjustedRefMovieEndTimeOut:
{
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t, CFTypeRef *, int *);
  uint64_t v7;
  CFTypeRef v8;
  uint64_t (*v9)(CFTypeRef, CFTypeRef *);
  uint64_t v10;
  CFTypeRef v11;
  uint64_t (*v12)(CFTypeRef, CMTime *, CFTypeRef *, _QWORD, _QWORD);
  uint64_t v13;
  CFTypeRef v14;
  uint64_t (*v15)(CFTypeRef, CMTime *);
  uint64_t v16;
  CFTypeRef v17;
  uint64_t (*v18)(CFTypeRef, CMTime *);
  uint64_t v19;
  uint64_t v20;
  CMTime rhs;
  CMTime v23;
  CMTime v24;
  CMTime v25;
  CFTypeRef cf;
  CFTypeRef v27;
  CFTypeRef v28;
  int v29;
  CMTime v30;
  CMTime lhs;

  if (!a1)
    return 0;
  v30 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  v29 = 0;
  v27 = 0;
  v28 = 0;
  cf = 0;
  v25 = v30;
  v24 = v30;
  v23 = v30;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 64);
  if (v6)
  {
    v7 = v6(v5, 0, 1986618469, &v28, &v29);
    if ((_DWORD)v7)
    {
      v20 = v7;
    }
    else
    {
      v8 = v28;
      v9 = *(uint64_t (**)(CFTypeRef, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v9)
      {
        v10 = v9(v8, &v27);
        if ((_DWORD)v10)
        {
          v20 = v10;
        }
        else
        {
          v11 = v27;
          rhs = *a2;
          v12 = *(uint64_t (**)(CFTypeRef, CMTime *, CFTypeRef *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 8);
          if (v12)
          {
            lhs = rhs;
            v13 = v12(v11, &lhs, &cf, 0, 0);
            if ((_DWORD)v13)
            {
              v20 = v13;
            }
            else
            {
              v14 = cf;
              v15 = *(uint64_t (**)(CFTypeRef, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
              if (v15)
              {
                v16 = v15(v14, &v25);
                if ((_DWORD)v16)
                {
                  v20 = v16;
                }
                else
                {
                  v17 = cf;
                  v18 = *(uint64_t (**)(CFTypeRef, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
                  if (v18)
                  {
                    v19 = v18(v17, &v23);
                    if (!(_DWORD)v19)
                    {
                      lhs = v25;
                      rhs = v23;
                      CMTimeAdd(&v24, &lhs, &rhs);
                      v30 = v24;
                      lhs = v24;
                      rhs = *a2;
                      CMTimeCompare(&lhs, &rhs);
                      v20 = 0;
                      if (a3)
                        *a3 = v30;
                      goto LABEL_20;
                    }
                    v20 = v19;
                  }
                  else
                  {
                    v20 = 4294954514;
                  }
                }
              }
              else
              {
                v20 = 4294954514;
              }
            }
          }
          else
          {
            v20 = 4294954514;
          }
        }
      }
      else
      {
        v20 = 4294954514;
      }
    }
  }
  else
  {
    v20 = 4294954514;
  }
  FigDebugAssert3();
LABEL_20:
  if (v28)
    CFRelease(v28);
  if (v27)
    CFRelease(v27);
  if (cf)
    CFRelease(cf);
  return v20;
}

+ (BOOL)_addNewMetadataTrackToAssetWriter:(uint64_t)a3 forTrackTimeScale:(unsigned int *)a4 yieldingTrackID:
{
  uint64_t (*v7)(uint64_t, uint64_t, unsigned int *);
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, _QWORD, uint64_t);
  int v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, _QWORD, _QWORD);
  int v15;
  int v16;
  unsigned int v18;

  objc_opt_self();
  v18 = 0;
  v7 = *(uint64_t (**)(uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (!v7)
  {
    v16 = -12782;
LABEL_12:
    FigDebugAssert3();
    return v16 == 0;
  }
  v8 = v7(a2, 1835365473, &v18);
  if (v8)
  {
    v16 = v8;
    goto LABEL_12;
  }
  v9 = v18;
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (!v11)
  {
    v16 = -12782;
    goto LABEL_12;
  }
  v12 = v11(a2, v9, *MEMORY[0x1E0CC45F0], v10);
  if (v12)
  {
    v16 = v12;
    goto LABEL_12;
  }
  v13 = v18;
  v14 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (!v14)
  {
    v16 = -12782;
    goto LABEL_12;
  }
  v15 = v14(a2, v13, *MEMORY[0x1E0CC45B0], *MEMORY[0x1E0C9AE40]);
  if (v15)
  {
    v16 = v15;
    goto LABEL_12;
  }
  v16 = 0;
  if (a4)
    *a4 = v18;
  return v16 == 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)actualMovieStartTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setActualMovieStartTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_actualMovieStartTime.epoch = a3->var3;
  *(_OWORD *)&self->_actualMovieStartTime.value = v3;
}

- (BOOL)vitalInputStreamHasBeenForcedOff
{
  return self->_vitalInputStreamHasBeenForcedOff;
}

- (void)setVitalInputStreamHasBeenForcedOff:(BOOL)a3
{
  self->_vitalInputStreamHasBeenForcedOff = a3;
}

- (int)streamForcedOffErrorCode
{
  return self->_streamForcedOffErrorCode;
}

- (void)setStreamForcedOffErrorCode:(int)a3
{
  self->_streamForcedOffErrorCode = a3;
}

@end
