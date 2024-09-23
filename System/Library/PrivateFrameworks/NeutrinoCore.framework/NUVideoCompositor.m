@implementation NUVideoCompositor

- (BOOL)canConformColorOfSourceFrames
{
  return 1;
}

- (BOOL)supportsHDRSourceFrames
{
  return 0;
}

- (BOOL)supportsHDROutput
{
  return 0;
}

- (id)standardPixelFormats:(int64_t)a3
{
  void *v3;

  if (areUniversalCompressionFormatsSupported())
  {
    objc_msgSend(&unk_1E50A38E0, "arrayByAddingObjectsFromArray:", &unk_1E50A38C8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &unk_1E50A38C8;
  }
  return v3;
}

- (id)hdrPixelFormats:(int64_t)a3
{
  void *v3;
  uint64_t v4;

  if (+[NUGlobalSettings disablePacked10BitPixelFormats](NUGlobalSettings, "disablePacked10BitPixelFormats", a3))
  {
    v3 = &unk_1E50A38F8;
  }
  else
  {
    objc_msgSend(&unk_1E50A3910, "arrayByAddingObjectsFromArray:", &unk_1E50A38F8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (areUniversalCompressionFormatsSupported())
  {
    objc_msgSend(&unk_1E50A3928, "arrayByAddingObjectsFromArray:", v3);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[NUVideoCompositor standardPixelFormats:](self, "standardPixelFormats:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NUVideoCompositor supportsHDRSourceFrames](self, "supportsHDRSourceFrames"))
  {
    -[NUVideoCompositor hdrPixelFormats:](self, "hdrPixelFormats:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v3);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  v6 = *MEMORY[0x1E0CA8FF0];
  v9[0] = *MEMORY[0x1E0CA9040];
  v9[1] = v6;
  v10[0] = v3;
  v10[1] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (NSDictionary)requiredPixelBufferAttributesForRenderContext
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[NUVideoCompositor standardPixelFormats:](self, "standardPixelFormats:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NUVideoCompositor supportsHDROutput](self, "supportsHDROutput"))
  {
    -[NUVideoCompositor hdrPixelFormats:](self, "hdrPixelFormats:", 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  v5 = *MEMORY[0x1E0CA8FF0];
  v8[0] = *MEMORY[0x1E0CA9040];
  v8[1] = v5;
  v9[0] = v3;
  v9[1] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NUVideoCompositor)init
{
  NUVideoCompositor *v2;
  OS_dispatch_queue *renderingQueue;
  uint64_t v4;
  NSMutableSet *pendingRequests;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVideoCompositor;
  v2 = -[NUVideoCompositor init](&v7, sel_init);
  renderingQueue = v2->_renderingQueue;
  v2->_renderingQueue = 0;

  v4 = objc_opt_new();
  pendingRequests = v2->_pendingRequests;
  v2->_pendingRequests = (NSMutableSet *)v4;

  *(_QWORD *)&v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
  return v2;
}

- (BOOL)testAndSetVideoCompositionRequestFinished:(id)a3
{
  os_unfair_lock_s *p_pendingRequestsLock;
  id v5;

  p_pendingRequestsLock = &self->_pendingRequestsLock;
  v5 = a3;
  os_unfair_lock_lock(p_pendingRequestsLock);
  -[NSMutableSet removeObject:](self->_pendingRequests, "removeObject:", v5);

  os_unfair_lock_unlock(p_pendingRequestsLock);
  return 1;
}

- (void)startVideoCompositionRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t *p_requestCounter;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __CVBuffer *v22;
  NSObject *v23;
  void *v24;
  __CVBuffer *v25;
  NSObject *v26;
  os_signpost_id_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  NSObject *v35;
  NSObject *v36;
  dispatch_qos_class_t v37;
  NSObject *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  id v45;
  OS_dispatch_queue *v46;
  OS_dispatch_queue *renderingQueue;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  _QWORD block[4];
  NSObject *v52;
  NUVideoCompositor *v53;
  id v54;
  os_signpost_id_t v55;
  unint64_t v56;
  uint8_t buf[4];
  unint64_t v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  p_requestCounter = &self->_requestCounter;
  do
    v7 = __ldaxr(p_requestCounter);
  while (__stlxr(v7 + 1, p_requestCounter));
  objc_msgSend(v4, "sourceTrackIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(v5, "sourceSampleDataTrackIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    objc_msgSend(v5, "videoCompositionInstruction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requiredSourceSampleDataTrackIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v11 < v14)
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
      v15 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "[NUVideoCompositor startVideoCompositionRequest] received request without required sampleData tracks", buf, 2u);
      }
    }
    if (+[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 1)
    {
      objc_msgSend(v5, "sourceTrackIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v5, "sourceFrameByTrackID:", objc_msgSend(v17, "intValue"));

      objc_msgSend(v5, "finishWithComposedVideoFrame:", v18);
    }
    else if (+[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 2
           && (objc_msgSend(v5, "sourceTrackIDs"),
               v20 = (void *)objc_claimAutoreleasedReturnValue(),
               objc_msgSend(v20, "firstObject"),
               v21 = (void *)objc_claimAutoreleasedReturnValue(),
               v22 = (__CVBuffer *)objc_msgSend(v5, "sourceFrameByTrackID:", objc_msgSend(v21, "intValue")),
               v21,
               v20,
               NUIsPixelBufferProbablyAllZeros(v22)))
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
      v23 = _NULogger;
      if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v58 = (unint64_t)v22;
        v59 = 2112;
        v60 = v5;
        _os_log_error_impl(&dword_1A6553000, v23, OS_LOG_TYPE_ERROR, "green input frame detected frame: %@ avRequest: %@", buf, 0x16u);
      }
      objc_msgSend(v5, "renderContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (__CVBuffer *)objc_msgSend(v24, "newPixelBuffer");

      NUDebugWatermarkCVPixelBuffer(v25, 1);
      objc_msgSend(v5, "finishWithComposedVideoFrame:", v25);
      CFRelease(v25);
    }
    else
    {
      if (_NULogOnceToken != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_159);
      v26 = (id)_NUScheduleLogger;
      v27 = os_signpost_id_make_with_pointer(v26, v5);
      v28 = v26;
      v29 = v28;
      if (v27 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        v31 = v29;
      }
      else
      {
        if (os_signpost_enabled(v28))
        {
          *(_DWORD *)buf = 134217984;
          v58 = v7;
          _os_signpost_emit_with_name_impl(&dword_1A6553000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VideoCompositionRequest", "ID=%llu", buf, 0xCu);
        }

        v30 = v29;
        if (os_signpost_enabled(v30))
        {
          *(_DWORD *)buf = 134217984;
          v58 = v7;
          _os_signpost_emit_with_name_impl(&dword_1A6553000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v27, "VideoCompositionRequestQueueDelay", "ID=%llu", buf, 0xCu);
        }
      }

      os_unfair_lock_lock(&self->_pendingRequestsLock);
      -[NSMutableSet addObject:](self->_pendingRequests, "addObject:", v5);
      os_unfair_lock_unlock(&self->_pendingRequestsLock);
      os_unfair_lock_lock(&self->_renderingQueueInitializeLock);
      if (!self->_renderingQueue)
      {
        objc_msgSend(v5, "videoCompositionInstruction");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "renderJob");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "priority");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "level");

        dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34 > 3)
          v37 = QOS_CLASS_UNSPECIFIED;
        else
          v37 = dword_1A671A4E0[v34];
        dispatch_queue_attr_make_with_qos_class(v35, v37, 0);
        v38 = objc_claimAutoreleasedReturnValue();

        v39 = (void *)MEMORY[0x1E0CB3940];
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34 > 3)
          v42 = 0;
        else
          v42 = off_1E50610B0[v34];
        v43 = v42;
        objc_msgSend(v39, "stringWithFormat:", CFSTR("%@-RenderingQueue-%@"), v41, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = objc_retainAutorelease(v44);
        v46 = (OS_dispatch_queue *)dispatch_queue_create((const char *)objc_msgSend(v45, "UTF8String"), v38);
        renderingQueue = self->_renderingQueue;
        self->_renderingQueue = v46;

      }
      os_unfair_lock_unlock(&self->_renderingQueueInitializeLock);
      v48 = self->_renderingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__NUVideoCompositor_startVideoCompositionRequest___block_invoke;
      block[3] = &unk_1E5062818;
      v55 = v27;
      v56 = v7;
      v52 = v29;
      v53 = self;
      v54 = v5;
      v49 = v29;
      dispatch_async(v48, block);

    }
  }
  else
  {
    objc_msgSend(v5, "finishCancelledRequest");
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
    v19 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A6553000, v19, OS_LOG_TYPE_ERROR, "[NUVideoCompositor startVideoCompositionRequest] received degenerate request. request.sourceTrackIDs.count == 0. treating as canceled.", buf, 2u);
    }
  }

}

- (BOOL)supportsWideColorSourceFrames
{
  return 1;
}

- (void)cancelAllPendingVideoCompositionRequests
{
  os_unfair_lock_s *p_pendingRequestsLock;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_pendingRequestsLock = &self->_pendingRequestsLock;
  os_unfair_lock_lock(&self->_pendingRequestsLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_pendingRequests;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "finishCancelledRequest", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  -[NSMutableSet removeAllObjects](self->_pendingRequests, "removeAllObjects");
  os_unfair_lock_unlock(p_pendingRequestsLock);
}

- (void)fulfillVideoCompositionRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *specific;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_160);
  v4 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = v4;
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1)
        dispatch_once(&_NULogOnceToken, &__block_literal_global_160);
      goto LABEL_8;
    }
    if (v10 != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_160);
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    v12 = (void *)MEMORY[0x1E0CB3978];
    v13 = v11;
    objc_msgSend(v12, "callStackSymbols");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
    goto LABEL_15;
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E0CB3978];
  v19 = specific;
  v13 = v16;
  objc_msgSend(v18, "callStackSymbols");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  NSStringFromClass(v22);
  v23 = objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor fulfillVideoCompositionRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 336, CFSTR("This is an abstract method! Subclass '%@' should provide concrete implementation"), v24, v25, v26, v27, v23);
}

- (void)finishCompositionRequest:(id)a3 withComposedVideoFrame:(__CVBuffer *)a4
{
  id v5;
  NSObject *v6;
  int v7;
  __CVBuffer *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[NUGlobalSettings videoCompositorDebugMode](NUGlobalSettings, "videoCompositorDebugMode") == 2
    && NUIsPixelBufferProbablyAllZeros(a4))
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
    v6 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = a4;
      v9 = 2112;
      v10 = v5;
      _os_log_error_impl(&dword_1A6553000, v6, OS_LOG_TYPE_ERROR, "green output frame detected. frame:%@ avRequest:%@", (uint8_t *)&v7, 0x16u);
    }
    NUDebugWatermarkCVPixelBuffer(a4, 3);
  }
  objc_msgSend(v5, "finishWithComposedVideoFrame:", a4);

}

- (id)videoSampleSlicesFromRequest:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int32_t v34;
  uint64_t *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  int64_t v39;
  id v40;
  id v41;
  id v42;
  NSObject *v44;
  void *v45;
  void *specific;
  NSObject *v47;
  _BOOL4 v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v63;
  void *v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  uint64_t *v72;
  _BYTE *v73;
  uint64_t *v74;
  int64_t v75;
  CMTime v76;
  CMTimeRange v77;
  CMTime time;
  CMTime v79;
  CMTime rhs;
  CMTime lhs;
  CMTime duration;
  CMTime start;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  void *v87;
  CMTime v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  _BYTE buf[24];
  void *v100;
  CMTimeRange v101;
  _BYTE v102[128];
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  objc_msgSend(v65, "sourceTrackIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    NUAssertLogger_15529();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Track IDs are missing on instruction"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v45;
      _os_log_error_impl(&dword_1A6553000, v44, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15529();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v48)
      {
        v51 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v52 = (void *)MEMORY[0x1E0CB3978];
        v53 = v51;
        objc_msgSend(v52, "callStackSymbols");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v51;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v55;
        _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v48)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v50;
      _os_log_error_impl(&dword_1A6553000, v47, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor videoSampleSlicesFromRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 355, CFSTR("Track IDs are missing on instruction"), v56, v57, v58, v59, v60);
  }
  v93 = 0;
  v94 = &v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__15560;
  v97 = __Block_byref_object_dispose__15561;
  v98 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v65, "videoCompositionInstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "requestedWindowOfSamples") & 1) != 0)
  {
    objc_msgSend(v5, "mainTrackSourceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trackIDForSourceIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intValue");
    v64 = v5;

    objc_msgSend(v5, "mainTrackSourceIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUVideoCompositor videoFramesInWindowForTrackID:fromRequest:](NUVideoCompositor, "videoFramesInWindowForTrackID:fromRequest:", v8, v65);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!objc_msgSend(v63, "count"))
    {
      v29 = (id)v94[5];
LABEL_29:

      v5 = v64;
      goto LABEL_30;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(v5, "requiredSourceTrackIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v90 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "intValue");
          if ((_DWORD)v16 != (_DWORD)v8)
          {
            objc_msgSend(v64, "sourceIdentifierForTrackID:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            +[NUVideoCompositor videoFramesInWindowForTrackID:fromRequest:](NUVideoCompositor, "videoFramesInWindowForTrackID:fromRequest:", v16, v65);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v18, "mutableCopy");
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, v17);

          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
      }
      while (v12);
    }

    objc_msgSend(v64, "requiredSourceSampleDataTrackIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "intValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "sourceIdentifierForMetadataTrackID:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[NUVideoCompositor metadataSamplesInWindowForTrackID:fromRequest:](NUVideoCompositor, "metadataSamplesInWindowForTrackID:fromRequest:", v22, v65);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    v84 = 0;
    v85 = &v84;
    v86 = 0x3810000000;
    v87 = &unk_1A674C0CB;
    memset(&v88, 0, sizeof(v88));
    CMTimeMake(&v88, 30, 600);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x5010000000;
    v100 = &unk_1A674C0CB;
    memset(&v101, 0, sizeof(v101));
    objc_msgSend(v63, "lastObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
      objc_msgSend(v27, "frameTime");
    else
      memset(&start, 0, sizeof(start));
    duration = *(CMTime *)(v85 + 4);
    CMTimeRangeMake(&v101, &start, &duration);

    v30 = v63;
    if ((unint64_t)objc_msgSend(v63, "count") < 2)
    {
LABEL_28:
      v39 = -[NUVideoCompositor playbackDirection](self, "playbackDirection");
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke;
      v66[3] = &unk_1E5062890;
      v67 = v61;
      v68 = v30;
      v72 = &v84;
      v73 = buf;
      v75 = v39;
      v40 = v10;
      v69 = v40;
      v41 = v26;
      v70 = v41;
      v42 = v24;
      v71 = v42;
      v74 = &v93;
      objc_msgSend(v68, "enumerateObjectsWithOptions:usingBlock:", 2, v66);
      v29 = (id)v94[5];

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v84, 8);

      goto LABEL_29;
    }
    objc_msgSend(v63, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "lastObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    memset(&duration, 0, sizeof(duration));
    if (v32)
    {
      objc_msgSend(v32, "frameTime");
      if (v31)
      {
LABEL_21:
        objc_msgSend(v31, "frameTime");
LABEL_24:
        CMTimeSubtract(&duration, &lhs, &rhs);
        v34 = objc_msgSend(v63, "count");
        time = duration;
        CMTimeMultiplyByRatio(&v79, &time, 1, v34);
        v35 = v85;
        *(CMTime *)(v85 + 4) = v79;
        if (v33)
        {
          objc_msgSend(v33, "frameTime");
          v35 = v85;
        }
        else
        {
          memset(&v76, 0, sizeof(v76));
        }
        time = *(CMTime *)(v35 + 4);
        CMTimeRangeMake(&v77, &v76, &time);
        v36 = *(_QWORD *)&buf[8];
        v38 = *(_OWORD *)&v77.start.epoch;
        v37 = *(_OWORD *)&v77.duration.timescale;
        *(_OWORD *)(*(_QWORD *)&buf[8] + 32) = *(_OWORD *)&v77.start.value;
        *(_OWORD *)(v36 + 48) = v38;
        *(_OWORD *)(v36 + 64) = v37;

        v30 = v63;
        goto LABEL_28;
      }
    }
    else
    {
      memset(&lhs, 0, sizeof(lhs));
      if (v31)
        goto LABEL_21;
    }
    memset(&rhs, 0, sizeof(rhs));
    goto LABEL_24;
  }
  v29 = (id)v94[5];
LABEL_30:

  _Block_object_dispose(&v93, 8);
  return v29;
}

- (id)videoFramesFromRequest:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NURenderPipelineVideoFrame *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  uint64_t v23;
  NURenderPipelineVideoFrame *v24;
  NSObject *v26;
  void *v27;
  void *specific;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[3];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _BYTE v51[18];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "sourceTrackIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
    NUAssertLogger_15529();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Track IDs are missing on instruction"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v51 = v27;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15529();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v30)
      {
        v33 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v34 = (void *)MEMORY[0x1E0CB3978];
        v35 = v33;
        objc_msgSend(v34, "callStackSymbols");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "componentsJoinedByString:", CFSTR("\n"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v51 = v33;
        *(_WORD *)&v51[8] = 2114;
        *(_QWORD *)&v51[10] = v37;
        _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v30)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v51 = v32;
      _os_log_error_impl(&dword_1A6553000, v29, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor videoFramesFromRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 470, CFSTR("Track IDs are missing on instruction"), v38, v39, v40, v41, v42);
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "videoCompositionInstruction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v3, "sourceTrackIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v46;
    v43 = 67109378;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v46 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "intValue", v43);
        objc_msgSend(v7, "sourceIdentifierForTrackID:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_msgSend(v3, "sourceFrameByTrackID:", v14);
          if (v16)
          {
            v17 = v16;
            v18 = [NURenderPipelineVideoFrame alloc];
            if (v3)
              objc_msgSend(v3, "compositionTime");
            else
              memset(v44, 0, sizeof(v44));
            v24 = -[NURenderPipelineVideoFrame initWithFrameTime:pixelBuffer:](v18, "initWithFrameTime:pixelBuffer:", v44, v17);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, v15);

          }
          else
          {
            if (_NULogOnceToken != -1)
              dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
            v23 = _NULogger;
            if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v43;
              *(_DWORD *)v51 = v14;
              *(_WORD *)&v51[4] = 2114;
              *(_QWORD *)&v51[6] = v15;
              v20 = v23;
              v21 = "[NUVideoCompositor videoFramesFromRequest] skipping frame. srcPixels is nil for trackID %d (%{public}@)";
              v22 = 18;
              goto LABEL_19;
            }
          }
        }
        else
        {
          if (_NULogOnceToken != -1)
            dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
          v19 = _NULogger;
          if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v51 = v14;
            v20 = v19;
            v21 = "[NUVideoCompositor videoFramesFromRequest] skipping frame. sourceIdentifier is nil for trackID %d";
            v22 = 8;
LABEL_19:
            _os_log_error_impl(&dword_1A6553000, v20, OS_LOG_TYPE_ERROR, v21, buf, v22);
          }
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)videoMetadataSamplesFromRequest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NURenderPipelineVideoMetadataSample *v13;
  NURenderPipelineVideoMetadataSample *v14;
  id obj;
  _QWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "videoCompositionInstruction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "sourceSampleDataTrackIDs");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "sourceIdentifierForMetadataTrackID:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "sourceTimedMetadataByTrackID:", objc_msgSend(v10, "intValue"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = [NURenderPipelineVideoMetadataSample alloc];
        if (v3)
          objc_msgSend(v3, "compositionTime");
        else
          memset(v17, 0, sizeof(v17));
        v14 = -[NURenderPipelineVideoMetadataSample initWithFrameTime:metadataGroup:](v13, "initWithFrameTime:metadataGroup:", v17, v12);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v11);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)setColorSpaceOfDestinationBuffer:(__CVBuffer *)a3 fromPrimarySourceBufferOfRequest:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __CVBuffer *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *specific;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v48 = a4;
  objc_msgSend(v48, "sourceTrackIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    NUAssertLogger_15529();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Track IDs are missing on instruction"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v16;
      _os_log_error_impl(&dword_1A6553000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15529();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v19)
      {
        v29 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v30 = (void *)MEMORY[0x1E0CB3978];
        v31 = v29;
        objc_msgSend(v30, "callStackSymbols");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v29;
        v51 = 2114;
        v52 = v33;
        _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v21;
      _os_log_error_impl(&dword_1A6553000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 530, CFSTR("Track IDs are missing on instruction"), v34, v35, v36, v37, v47);
  }
  objc_msgSend(v48, "videoCompositionInstruction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    NUAssertLogger_15529();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected videoComposition request"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v23;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v24 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_15529();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
    if (v24)
    {
      if (v26)
      {
        v38 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v39 = (void *)MEMORY[0x1E0CB3978];
        v40 = v38;
        objc_msgSend(v39, "callStackSymbols");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "componentsJoinedByString:", CFSTR("\n"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v50 = v38;
        v51 = 2114;
        v52 = v42;
        _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v26)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v50 = v28;
      _os_log_error_impl(&dword_1A6553000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUVideoCompositor setColorSpaceOfDestinationBuffer:fromPrimarySourceBufferOfRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NUVideoCompositor.m", 533, CFSTR("Unexpected videoComposition request"), v43, v44, v45, v46, v47);
  }
  objc_msgSend(v7, "trackIDForSourceIdentifier:", CFSTR("video"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v48, "sourceTrackIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (__CVBuffer *)objc_msgSend(v48, "sourceFrameByTrackID:", objc_msgSend(v8, "intValue"));
  v11 = (const __CFString *)*MEMORY[0x1E0CA8CD8];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8CD8]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8EE8]);
  v12 = (const __CFString *)*MEMORY[0x1E0CA8E98];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8E98]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8D68]);
  v13 = (const __CFString *)*MEMORY[0x1E0CA8DF8];
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8DF8]);
  v14 = (void *)CVBufferCopyAttachment(a3, v12, 0);
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CA8ED8]))
  {
    CVBufferSetAttachment(a3, v12, (CFTypeRef)*MEMORY[0x1E0CA8EB0], kCVAttachmentMode_ShouldPropagate);
    CVBufferRemoveAttachment(a3, v13);
    CVBufferRemoveAttachment(a3, v11);
  }
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8CC8]);
  NUCopyCVBufferAttachment(v10, a3, (CFStringRef)*MEMORY[0x1E0CA8E88]);

}

- (void)failVideoCompositionRequest:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  const __CFAllocator *v7;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  CMTime v12;
  CMTime time;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
    objc_msgSend(v5, "compositionTime");
  else
    memset(&v12, 0, sizeof(v12));
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  time = v12;
  v8 = (__CFString *)CMTimeCopyDescription(v7, &time);
  if (_NULogOnceToken != -1)
    dispatch_once(&_NULogOnceToken, &__block_literal_global_15526);
  v9 = (void *)_NULogger;
  if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    v11 = objc_opt_class();
    LODWORD(time.value) = 138543874;
    *(CMTimeValue *)((char *)&time.value + 4) = v11;
    LOWORD(time.flags) = 2114;
    *(_QWORD *)((char *)&time.flags + 2) = v8;
    HIWORD(time.epoch) = 2114;
    v14 = v6;
    _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "%{public}@ failed to generate video frame at %{public}@: %{public}@", (uint8_t *)&time, 0x20u);

  }
  objc_msgSend(v5, "finishWithError:", v6);

}

- (void)anticipateRenderingUsingHint:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  CMTime v7;
  CMTime v8;
  CMTime time2;
  CMTime time1;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "startCompositionTime");
    objc_msgSend(v5, "endCompositionTime");
    if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    {
      objc_msgSend(v5, "startCompositionTime");
      objc_msgSend(v5, "endCompositionTime");
      goto LABEL_6;
    }
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  memset(&time1, 0, sizeof(time1));
  memset(&time2, 0, sizeof(time2));
  if (CMTimeCompare(&time1, &time2) < 0)
    goto LABEL_8;
  memset(&v8, 0, sizeof(v8));
  memset(&v7, 0, sizeof(v7));
LABEL_6:
  if (CMTimeCompare(&v8, &v7) < 1)
    v6 = 3;
  else
    v6 = 2;
LABEL_10:
  self->_playbackDirection = v6;

}

- (int64_t)playbackDirection
{
  return self->_playbackDirection;
}

- (void)setPlaybackDirection:(int64_t)a3
{
  self->_playbackDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_renderingQueue, 0);
}

void __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  NURenderPipelineVideoSampleSlice *v19;
  uint64_t v20;
  NURenderPipelineVideoSampleSlice *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  CMTime start;
  CMTimeRange v33;
  CMTime lhs;
  CMTime rhs;
  CMTime v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a2;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__15560;
  v41 = __Block_byref_object_dispose__15561;
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)v38[5], "setObject:forKeyedSubscript:", v5, *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 != a3)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    if (v5)
      objc_msgSend(v5, "frameTime");
    else
      memset(&rhs, 0, sizeof(rhs));
    lhs = *(CMTime *)(v6 + 32);
    CMTimeSubtract(&v36, &lhs, &rhs);
    *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32) = v36;
    if (v5)
      objc_msgSend(v5, "frameTime");
    else
      memset(&start, 0, sizeof(start));
    lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32);
    CMTimeRangeMake(&v33, &start, &lhs);
    v7 = *(_OWORD **)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(_OWORD *)&v33.start.epoch;
    v8 = *(_OWORD *)&v33.duration.timescale;
    v7[2] = *(_OWORD *)&v33.start.value;
    v7[3] = v9;
    v7[4] = v8;
  }
  v10 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_2;
  v28[3] = &unk_1E5062840;
  v31 = *(_QWORD *)(a1 + 96);
  v11 = *(id *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 80);
  v29 = v11;
  v30 = v12;
  v13 = (void *)MEMORY[0x1A85C1564](v28);
  v14 = *(void **)(a1 + 48);
  v22 = v10;
  v23 = 3221225472;
  v24 = __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_3;
  v25 = &unk_1E5062868;
  v15 = v13;
  v26 = v15;
  v27 = &v37;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", &v22);
  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = objc_msgSend(*(id *)(a1 + 56), "indexOfObjectWithOptions:passingTest:", 2, v15, v22, v23, v24, v25);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectAtIndexedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, *(_QWORD *)(a1 + 64));

    objc_msgSend(*(id *)(a1 + 56), "removeObjectsInRange:", v17, objc_msgSend(*(id *)(a1 + 56), "count") - v17);
  }
  v19 = [NURenderPipelineVideoSampleSlice alloc];
  v20 = v38[5];
  lhs = *(CMTime *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 32);
  v21 = -[NURenderPipelineVideoSampleSlice initWithFrameTime:videoFrames:metadataSamples:](v19, "initWithFrameTime:videoFrames:metadataSamples:", &lhs, v20, v16);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "insertObject:atIndex:", v21, 0);

  _Block_object_dispose(&v37, 8);
}

BOOL __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  CMTimeRange v12;
  CMTime time;
  CMTime time1;

  v6 = a2;
  if (*(_QWORD *)(a1 + 48) == 3 && objc_msgSend(*(id *)(a1 + 32), "count") == 1)
  {
    v7 = 1;
  }
  else
  {
    if (v6)
      objc_msgSend(v6, "frameTime");
    else
      memset(&time1, 0, sizeof(time1));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_OWORD *)&v12.start.value = *(_OWORD *)(v8 + 32);
    v12.start.epoch = *(_QWORD *)(v8 + 48);
    if (CMTimeCompare(&time1, &v12.start) < 0)
    {
      v7 = 0;
      *a4 = 1;
    }
    else
    {
      v9 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32);
      if (v6)
        objc_msgSend(v6, "frameTime");
      else
        memset(&time, 0, sizeof(time));
      v10 = v9[1];
      *(_OWORD *)&v12.start.value = *v9;
      *(_OWORD *)&v12.start.epoch = v10;
      *(_OWORD *)&v12.duration.timescale = v9[2];
      v7 = CMTimeRangeContainsTime(&v12, &time) != 0;
    }
  }

  return v7;
}

void __50__NUVideoCompositor_videoSampleSlicesFromRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v5, "indexOfObjectWithOptions:passingTest:", 2, *(_QWORD *)(a1 + 32));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v9);

    objc_msgSend(v5, "removeObjectsInRange:", v7, objc_msgSend(v5, "count") - v7);
  }

}

void __50__NUVideoCompositor_startVideoCompositionRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A85C1390]();
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 56);
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v6 = *(_QWORD *)(a1 + 64);
    v21 = 134217984;
    v22 = v6;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v4, OS_SIGNPOST_INTERVAL_END, v5, "VideoCompositionRequestQueueDelay", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  v7 = *(id *)(a1 + 32);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 56);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v10 = *(_QWORD *)(a1 + 64);
    v21 = 134217984;
    v22 = v10;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VideoCompositionRequestFulfill", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 32));
  v11 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "containsObject:", *(_QWORD *)(a1 + 48));
  v12 = *(_QWORD *)(a1 + 40);
  if (v11)
  {
    objc_msgSend(*(id *)(v12 + 24), "removeObject:", *(_QWORD *)(a1 + 48));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(*(id *)(a1 + 40), "fulfillVideoCompositionRequest:", *(_QWORD *)(a1 + 48));
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 32));
  }
  v13 = *(id *)(a1 + 32);
  v14 = v13;
  v15 = *(_QWORD *)(a1 + 56);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    v16 = *(_QWORD *)(a1 + 64);
    v21 = 134217984;
    v22 = v16;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v14, OS_SIGNPOST_INTERVAL_END, v15, "VideoCompositionRequestFulfill", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  v17 = *(id *)(a1 + 32);
  v18 = v17;
  v19 = *(_QWORD *)(a1 + 56);
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    v20 = *(_QWORD *)(a1 + 64);
    v21 = 134217984;
    v22 = v20;
    _os_signpost_emit_with_name_impl(&dword_1A6553000, v18, OS_SIGNPOST_INTERVAL_END, v19, "VideoCompositionRequest", "ID=%llu", (uint8_t *)&v21, 0xCu);
  }

  objc_autoreleasePoolPop(v2);
}

+ (id)videoFramesInWindowForTrackID:(int)a3 fromRequest:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  NURenderPipelineVideoFrame *v12;
  NURenderPipelineVideoFrame *v13;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v5, "numberOfSourceFramesInWindowForTrackID:", v4);
  if (v7 >= 1)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v17 = 0uLL;
      v18 = 0;
      v10 = objc_msgSend(v5, "sourceFrameByTrackID:atIndexInWindow:presentationTimeStamp:", v4, i, &v17);
      if (v10)
      {
        v11 = v10;
        v12 = [NURenderPipelineVideoFrame alloc];
        v15 = v17;
        v16 = v18;
        v13 = -[NURenderPipelineVideoFrame initWithFrameTime:pixelBuffer:](v12, "initWithFrameTime:pixelBuffer:", &v15, v11);
        objc_msgSend(v6, "addObject:", v13);

      }
    }
  }

  return v6;
}

+ (id)metadataSamplesInWindowForTrackID:(int)a3 fromRequest:(id)a4
{
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NURenderPipelineVideoMetadataSample *v11;
  NURenderPipelineVideoMetadataSample *v12;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v5, "numberOfSourceSampleBuffersInWindowForTrackID:", v4);
  if (v7 >= 1)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v16 = 0uLL;
      v17 = 0;
      objc_msgSend(v5, "sourceTimedMetadataByTrackID:atIndexInWindow:presentationTimeStamp:", v4, i, &v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = [NURenderPipelineVideoMetadataSample alloc];
        v14 = v16;
        v15 = v17;
        v12 = -[NURenderPipelineVideoMetadataSample initWithFrameTime:metadataGroup:](v11, "initWithFrameTime:metadataGroup:", &v14, v10);
        objc_msgSend(v6, "addObject:", v12);

      }
    }
  }

  return v6;
}

@end
