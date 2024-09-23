@implementation ARQATracer

- (ARQATracer)init
{
  ARQATracer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *traceHeader;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *processingQueue;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *segmentationVideoQueue;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *semanticsVideoQueue;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSOutputStream *framesStreamToFile;
  uint64_t v20;
  NSMutableData *dataBuffer;
  uint64_t v22;
  NSMutableDictionary *additionalResults;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)ARQATracer;
  v2 = -[ARQATracer init](&v25, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    traceHeader = v2->_traceHeader;
    v2->_traceHeader = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.arQATracer", v5);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.arQATracer.segmentation", v8);
    segmentationVideoQueue = v2->_segmentationVideoQueue;
    v2->_segmentationVideoQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.arQATracer.semantics", v11);
    semanticsVideoQueue = v2->_semanticsVideoQueue;
    v2->_semanticsVideoQueue = (OS_dispatch_queue *)v12;

    objc_msgSend((id)objc_opt_class(), "traceOutputDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("data.json"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARQATracer setTraceOutputFilePath:](v2, "setTraceOutputFilePath:", v15);

    v16 = objc_alloc(MEMORY[0x1E0C99E48]);
    -[ARQATracer traceOutputFilePath](v2, "traceOutputFilePath");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initToFileAtPath:append:", v17, 0);
    framesStreamToFile = v2->_framesStreamToFile;
    v2->_framesStreamToFile = (NSOutputStream *)v18;

    v20 = objc_opt_new();
    dataBuffer = v2->_dataBuffer;
    v2->_dataBuffer = (NSMutableData *)v20;

    v2->_additionalResultsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = objc_claimAutoreleasedReturnValue();
    additionalResults = v2->_additionalResults;
    v2->_additionalResults = (NSMutableDictionary *)v22;

  }
  return v2;
}

- (void)dealloc
{
  __CVPixelBufferPool *segmentationYUVPixelBufferPool;
  __CVPixelBufferPool *semanticsYUVPixelBufferPool;
  OpaqueVTPixelTransferSession *segmentationTransferSession;
  OpaqueVTPixelTransferSession *v6;
  objc_super v7;

  segmentationYUVPixelBufferPool = self->_segmentationYUVPixelBufferPool;
  if (segmentationYUVPixelBufferPool)
  {
    CVPixelBufferPoolRelease(segmentationYUVPixelBufferPool);
    self->_segmentationYUVPixelBufferPool = 0;
  }
  semanticsYUVPixelBufferPool = self->_semanticsYUVPixelBufferPool;
  if (semanticsYUVPixelBufferPool)
  {
    CVPixelBufferPoolRelease(semanticsYUVPixelBufferPool);
    self->_semanticsYUVPixelBufferPool = 0;
  }
  segmentationTransferSession = self->_segmentationTransferSession;
  if (segmentationTransferSession)
  {
    VTPixelTransferSessionInvalidate(segmentationTransferSession);
    v6 = self->_segmentationTransferSession;
    if (v6)
      CFRelease(v6);
    self->_segmentationTransferSession = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)ARQATracer;
  -[ARQATracer dealloc](&v7, sel_dealloc);
}

+ (BOOL)isEnabled
{
  return +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.qatracing"));
}

- (void)traceRaycastQuery:(id)a3
{
  NSDictionary *v4;
  NSDictionary *raycastQueryData;

  +[ARQAHelper dictionaryFromRaycastQuery:](ARQAHelper, "dictionaryFromRaycastQuery:", a3);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  raycastQueryData = self->_raycastQueryData;
  self->_raycastQueryData = v4;

}

- (void)traceRaycastResults:(id)a3
{
  NSArray *v4;
  NSArray *raycastResultData;

  +[ARQAHelper arrayFromRaycastResults:](ARQAHelper, "arrayFromRaycastResults:", a3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  raycastResultData = self->_raycastResultData;
  self->_raycastResultData = v4;

}

- (void)trace:(id)a3 forKey:(id)a4
{
  id v6;
  os_unfair_lock_s *p_additionalResultsLock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  p_additionalResultsLock = &self->_additionalResultsLock;
  os_unfair_lock_lock(&self->_additionalResultsLock);
  -[ARQATracer additionalResults](self, "additionalResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[ARQATracer additionalResults](self, "additionalResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "encodeToDictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v14, "encodeToDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARQATracer additionalResults](self, "additionalResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v6);
  }

  os_unfair_lock_unlock(p_additionalResultsLock);
}

- (void)receiveDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  id v13;

  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.session.qatracing.screenRecording"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;
  -[ARQATracer setRecordScreen:](self, "setRecordScreen:", v4);
  +[ARKitUserDefaults valueForKey:](ARKitUserDefaults, "valueForKey:", CFSTR("com.apple.arkit.session.qatracing.forceQuitApp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "BOOLValue");
  else
    v7 = 1;
  -[ARQATracer setForceQuitApp:](self, "setForceQuitApp:", v7);
  +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.session.qatracing.framesLabelOffset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 2)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)objc_msgSend(v10, "integerValue");
    objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ARQATracer setOffset:](self, "setOffset:", v11, (double)objc_msgSend(v12, "integerValue"));

  }
}

- (void)writeJSONObjectToStream:(id)a3 prefix:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  ARQATracer *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
    -[ARQATracer writeStringToOutputStream:](self, "writeStringToOutputStream:", v7);
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 0, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  -[NSMutableData appendData:](self->_dataBuffer, "appendData:", v8);

  if (v9)
  {
    _ARLogGeneral_28();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v12;
      v16 = 2048;
      v17 = self;
      v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_1B3A68000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error serializing JSON with error %@", buf, 0x20u);

    }
    -[ARQATracer writeStringToOutputStream:](self, "writeStringToOutputStream:", CFSTR("{}"));
  }

}

- (void)writeStringToOutputStream:(id)a3
{
  id v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableData appendData:](self->_dataBuffer, "appendData:", v4);

}

- (void)flushDataBufferToFile
{
  NSInteger v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  ARQATracer *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = -[NSOutputStream write:maxLength:](self->_framesStreamToFile, "write:maxLength:", -[NSMutableData bytes](self->_dataBuffer, "bytes"), -[NSMutableData length](self->_dataBuffer, "length"));
  if (v3 != -[NSMutableData length](self->_dataBuffer, "length"))
  {
    _ARLogGeneral_28();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543618;
      v8 = v6;
      v9 = 2048;
      v10 = self;
      _os_log_impl(&dword_1B3A68000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Not all bytes could be written to file", (uint8_t *)&v7, 0x16u);

    }
  }
  -[NSMutableData setLength:](self->_dataBuffer, "setLength:", 0);
}

- (void)start:(id)a3
{
  id v4;
  NSObject *processingQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __20__ARQATracer_start___block_invoke;
  v7[3] = &unk_1E6672118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(processingQueue, v7);

}

void __20__ARQATracer_start___block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  objc_class *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD block[5];
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    _ARLogGeneral_28();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = (objc_class *)objc_opt_class();
      NSStringFromClass(v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v44 = v4;
      v45 = 2048;
      v46 = v5;
      _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Start", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "open");
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\"version\":\"%@\",\"frames\":["), CFSTR("1.1"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeStringToOutputStream:", v7);

    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "replaySensor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "setTraceReplaySensorDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "receiveDefaults");
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "frameSemantics");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "traceOutputDirectory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@/segmentation.mov"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _ARLogGeneral_28();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v44 = v17;
        v45 = 2048;
        v46 = v18;
        v47 = 2114;
        v48 = v14;
        _os_log_impl(&dword_1B3A68000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recording segmentation output to %{public}@", buf, 0x20u);

      }
      v19 = objc_alloc(MEMORY[0x1E0CFCB58]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "initWithFileURL:expectedFrameRate:fileSummary:", v20, MEMORY[0x1E0C9AA70], 60.0);
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 56);
      *(_QWORD *)(v22 + 56) = v21;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "registerStreamID:withConfigObject:", CFSTR("Segmentation"), 0);
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldDumpSemanticData")
      && objc_msgSend(*(id *)(a1 + 32), "isSemanticSegmentationDataAvailableForSession:", *(_QWORD *)(a1 + 40)))
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "traceOutputDirectory");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", CFSTR("%@/semantics.mov"), v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      _ARLogGeneral_28();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v44 = v29;
        v45 = 2048;
        v46 = v30;
        v47 = 2114;
        v48 = v26;
        _os_log_impl(&dword_1B3A68000, v27, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recording semantics output to %{public}@", buf, 0x20u);

      }
      v31 = objc_alloc(MEMORY[0x1E0CFCB58]);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v26);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v31, "initWithFileURL:expectedFrameRate:fileSummary:", v32, MEMORY[0x1E0C9AA70], 10.0);
      v34 = *(_QWORD *)(a1 + 32);
      v35 = *(void **)(v34 + 64);
      *(_QWORD *)(v34 + 64) = v33;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "registerStreamID:withConfigObject:", CFSTR("Semantics"), 0);
    }
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "technique");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[ARQAHelper headerInformationWithConfiguration:technique:](ARQAHelper, "headerInformationWithConfiguration:technique:", v36, v37);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = *(_QWORD *)(a1 + 32);
    v40 = *(void **)(v39 + 24);
    *(_QWORD *)(v39 + 24) = v38;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__ARQATracer_start___block_invoke_35;
    block[3] = &unk_1E6674C70;
    block[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v42, (id *)buf);
    dispatch_sync(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

  }
}

void __20__ARQATracer_start___block_invoke_35(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  float v14;
  float v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  void *v28;
  id v29;
  char v30;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(*(id *)(a1 + 32), "offset");
    objc_msgSend(v4, "getFrameLabelFrameForOffset:");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f,%.f"), v6, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v13, CFSTR("frameLabelOffset"));

    v14 = v10;
    v15 = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f,%.f"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v16, CFSTR("frameLabelSize"));

  }
  v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(v19, "getDeviceViewSize");
    v21 = v20;
    v23 = v22;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.f,%.f"), v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v24, CFSTR("deviceViewSize"));

  }
  v25 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) != 0)
  {
    v27 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    objc_msgSend(v27, "getRendererDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", v28, CFSTR("rendererDescription"));

  }
  v29 = objc_loadWeakRetained((id *)(a1 + 40));
  v30 = objc_opt_respondsToSelector();

  if ((v30 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel__startScreenRecording);
}

- (void)stop
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __18__ARQATracer_stop__block_invoke;
  block[3] = &unk_1E6672168;
  block[4] = self;
  dispatch_sync(processingQueue, block);
}

void __18__ARQATracer_stop__block_invoke(uint64_t a1)
{
  NSObject *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;
  char v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  id v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_28();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v47 = v4;
    v48 = 2048;
    v49 = v5;
    _os_log_impl(&dword_1B3A68000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stop requested", buf, 0x16u);

  }
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 16);
  _ARLogGeneral_28();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v47 = v10;
      v48 = 2048;
      v49 = v11;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping", buf, 0x16u);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    objc_msgSend(*(id *)(a1 + 32), "writeStringToOutputStream:", CFSTR("]"));
    objc_msgSend(*(id *)(a1 + 32), "additionalResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "additionalResults");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "writeJSONObjectToStream:prefix:", v15, CFSTR(",\"additionalData\":"));

    }
    objc_msgSend(*(id *)(a1 + 32), "writeJSONObjectToStream:prefix:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR(",\"header\":"));
    objc_msgSend(*(id *)(a1 + 32), "writeStringToOutputStream:", CFSTR("}"));
    objc_msgSend(*(id *)(a1 + 32), "flushDataBufferToFile");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "close");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "traceOutputFilePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tracer:finishedWritingJSONToPath:", v19, v20);

    }
    v21 = *(_QWORD **)(a1 + 32);
    v22 = (void *)v21[7];
    if (v22)
    {
      v45 = 0;
      objc_msgSend(v22, "finishWriting:", &v45);
      v23 = v45;
      if (v23)
      {
        _ARLogGeneral_28();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v47 = v26;
          v48 = 2048;
          v49 = v27;
          _os_log_impl(&dword_1B3A68000, v24, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not write segmentation video", buf, 0x16u);

        }
      }

      v21 = *(_QWORD **)(a1 + 32);
    }
    v28 = (void *)v21[8];
    if (v28)
    {
      v44 = 0;
      objc_msgSend(v28, "finishWriting:", &v44);
      v29 = v44;
      if (v29)
      {
        _ARLogGeneral_28();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v47 = v32;
          v48 = 2048;
          v49 = v33;
          _os_log_impl(&dword_1B3A68000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not write semantics video", buf, 0x16u);

        }
      }

      v21 = *(_QWORD **)(a1 + 32);
    }
    if (objc_msgSend(v21, "forceQuitApp"))
    {
      _ARLogGeneral_28();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v47 = v36;
        v48 = 2048;
        v49 = v37;
        _os_log_impl(&dword_1B3A68000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Requesting App termination on ARQATracer stop", buf, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "requestDelayedAppTermination");

    }
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __18__ARQATracer_stop__block_invoke_65;
    v42[3] = &unk_1E66721B8;
    objc_copyWeak(&v43, (id *)buf);
    v42[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v42);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v47 = v40;
      v48 = 2048;
      v49 = v41;
      _os_log_impl(&dword_1B3A68000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: User default for tracing is not set or not tracing", buf, 0x16u);

    }
  }
}

void __18__ARQATracer_stop__block_invoke_65(uint64_t a1)
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "performSelector:", sel__stopScreenRecording);
}

- (void)update:(id)a3 session:(id)a4
{
  id v5;
  NSObject *processingQueue;
  id v7;
  _QWORD block[5];
  id v9;

  v5 = a3;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__ARQATracer_update_session___block_invoke;
  block[3] = &unk_1E6672118;
  block[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_sync(processingQueue, block);

}

void __29__ARQATracer_update_session___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  const __CFString *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  char v33;
  _QWORD v34[5];
  id v35[2];
  id location;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  _QWORD block[4];
  id v41;
  uint64_t v42;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v2 = (void *)MEMORY[0x1E0C99E08];
    +[ARQAHelper traceFrameData:withFrameIndex:writeOBJ:](ARQAHelper, "traceFrameData:withFrameIndex:writeOBJ:", *(_QWORD *)(a1 + 40));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dictionaryWithDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(*(id *)(a1 + 40), "segmentationBuffer");
    v6 = MEMORY[0x1E0C809B0];
    if (v5)
    {
      v7 = *(void **)(a1 + 40);
      v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 88);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __29__ARQATracer_update_session___block_invoke_2;
      block[3] = &unk_1E6672118;
      v9 = v7;
      v10 = *(_QWORD *)(a1 + 32);
      v41 = v9;
      v42 = v10;
      dispatch_async(v8, block);

    }
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldDumpSemanticData"))
    {
      objc_msgSend(*(id *)(a1 + 40), "rawSceneUnderstandingData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "semanticSegmentationBuffer");

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
        v37[0] = v6;
        v37[1] = 3221225472;
        v37[2] = __29__ARQATracer_update_session___block_invoke_3;
        v37[3] = &unk_1E6672118;
        v15 = v13;
        v16 = *(_QWORD *)(a1 + 32);
        v38 = v15;
        v39 = v16;
        dispatch_async(v14, v37);

      }
    }
    v17 = *(_QWORD **)(a1 + 32);
    v18 = v17[14];
    if (v18)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("raycastQueryData"));
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(void **)(v19 + 112);
      *(_QWORD *)(v19 + 112) = 0;

      v17 = *(_QWORD **)(a1 + 32);
    }
    v21 = v17[15];
    if (v21)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("raycastResultData"));
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 120);
      *(_QWORD *)(v22 + 120) = 0;

      v17 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v17, "additionalResults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 128));
      objc_msgSend(*(id *)(a1 + 32), "additionalResults");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addEntriesFromDictionary:", v26);

      objc_msgSend(*(id *)(a1 + 32), "additionalResults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeAllObjects");

      os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 128));
    }
    v28 = *(_QWORD **)(a1 + 32);
    if (v28[1])
      v29 = CFSTR(",");
    else
      v29 = 0;
    objc_msgSend(v28, "writeJSONObjectToStream:prefix:", v4, v29);
    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "length") >= 0x30D41)
      objc_msgSend(*(id *)(a1 + 32), "flushDataBufferToFile");
    v30 = *(_QWORD **)(a1 + 32);
    v31 = (void *)v30[1];
    objc_initWeak(&location, v30);
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) != 0)
    {
      v34[0] = v6;
      v34[1] = 3221225472;
      v34[2] = __29__ARQATracer_update_session___block_invoke_4;
      v34[3] = &unk_1E6673840;
      objc_copyWeak(v35, &location);
      v34[4] = *(_QWORD *)(a1 + 32);
      v35[1] = v31;
      dispatch_async(MEMORY[0x1E0C80D38], v34);
      objc_destroyWeak(v35);
    }
    objc_destroyWeak(&location);

  }
}

void __29__ARQATracer_update_session___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __CVBuffer *v10;
  void *v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v17 = 0uLL;
  v18 = 0;
  v2 = (void *)MEMORY[0x1E0CFCB58];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(v2, "cmTimeFromTimestamp:");
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsics");
  DWORD2(v14) = v4;
  DWORD2(v15) = v5;
  *(_QWORD *)&v14 = v6;
  *(_QWORD *)&v15 = v7;
  DWORD2(v16) = v8;
  *(_QWORD *)&v16 = v9;

  v10 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 40), "_createRecordablePixelBufferFromSegmentationBuffer:", objc_msgSend(*(id *)(a1 + 32), "segmentationBuffer"));
  v11 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
  v12 = v17;
  v13 = v18;
  objc_msgSend(v11, "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", v10, &v12, &v14, CFSTR("Segmentation"), 0.0);
  CVPixelBufferRelease(v10);
}

void __29__ARQATracer_update_session___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __CVBuffer *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v19 = 0uLL;
  v20 = 0;
  v2 = (void *)MEMORY[0x1E0CFCB58];
  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  objc_msgSend(v2, "cmTimeFromTimestamp:");
  v17 = 0u;
  v18 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "camera");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intrinsics");
  DWORD2(v16) = v4;
  DWORD2(v17) = v5;
  *(_QWORD *)&v16 = v6;
  *(_QWORD *)&v17 = v7;
  DWORD2(v18) = v8;
  *(_QWORD *)&v18 = v9;

  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "rawSceneUnderstandingData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (__CVBuffer *)objc_msgSend(v10, "_createRecordablePixelBufferFromSemanticsBuffer:", objc_msgSend(v11, "semanticSegmentationBuffer"));

  v13 = *(void **)(*(_QWORD *)(a1 + 40) + 64);
  v14 = v19;
  v15 = v20;
  objc_msgSend(v13, "processPixelBuffer:withTimeStamp:intrinsics:exposureTime:streamID:", v12, &v14, &v16, CFSTR("Semantics"), 0.0);
  CVPixelBufferRelease(v12);
}

void __29__ARQATracer_update_session___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tracer:processedFrameNumber:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

}

+ (id)traceOutputDirectory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  objc_class *v21;
  id v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  +[ARKitUserDefaults stringForKey:](ARKitUserDefaults, "stringForKey:", CFSTR("com.apple.arkit.session.qatracing.filepath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "infoDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0C9AE70]);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      v11 = v8;
    else
      v11 = CFSTR("UnitTest");
    objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "fileExistsAtPath:", v5) & 1) == 0)
  {
    v24 = 0;
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v24);
    v13 = v24;
    _ARLogGeneral_28();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v17;
        v27 = 2048;
        v28 = a1;
        v29 = 2112;
        v30 = v13;
        v18 = "%{public}@ <%p>: Error creating directory: %@";
        v19 = v15;
        v20 = OS_LOG_TYPE_ERROR;
LABEL_13:
        _os_log_impl(&dword_1B3A68000, v19, v20, v18, buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v17;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = v5;
      v18 = "%{public}@ <%p>: Created tracing output directory: %{public}@";
      v19 = v15;
      v20 = OS_LOG_TYPE_DEBUG;
      goto LABEL_13;
    }

  }
  v22 = v5;

  return v22;
}

- (BOOL)isSemanticSegmentationDataAvailableForSession:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  char v11;

  v3 = a3;
  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v3, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_msgSend(v6, "planeDetection") && (objc_msgSend(v7, "isMLModelEnabled") & 1) != 0
      || objc_msgSend(v7, "sceneReconstruction") != 0;
    goto LABEL_14;
  }
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  objc_msgSend(v3, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if ((v9 & 1) != 0)
  {
LABEL_10:
    if (objc_msgSend(v10, "planeDetection"))
      v8 = objc_msgSend(v7, "isMLModelEnabled");
    else
      v8 = 0;
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v3, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v10;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_15:

  return v8;
}

- (BOOL)_shouldDumpSemanticData
{
  if (_shouldDumpSemanticData_onceToken != -1)
    dispatch_once(&_shouldDumpSemanticData_onceToken, &__block_literal_global_72);
  return _shouldDumpSemanticData_dumpSemantics;
}

BOOL __37__ARQATracer__shouldDumpSemanticData__block_invoke()
{
  _BOOL8 result;

  result = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.session.qatracing.dumpSemanticSegmantationData"));
  _shouldDumpSemanticData_dumpSemantics = result;
  return result;
}

- (void)replaySensorDidFinishReplayingData
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  ARQATracer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _ARLogGeneral_28();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543618;
    v7 = v5;
    v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_1B3A68000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replay finished", (uint8_t *)&v6, 0x16u);

  }
  -[ARQATracer stop](self, "stop");
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  -[ARQATracer update:session:](self, "update:session:", a4, a3);
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (!a4)
  {
    v7 = v6;
    -[ARQATracer stop](self, "stop");
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = v6;
    -[ARQATracer start:](self, "start:", v6);
LABEL_5:
    v6 = v7;
  }

}

- (__CVBuffer)_createRecordablePixelBufferFromSegmentationBuffer:(__CVBuffer *)a3
{
  __CVPixelBufferPool **p_segmentationYUVPixelBufferPool;
  const __CFAllocator *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  unsigned int Width;
  unsigned int Height;
  objc_class *v13;
  objc_class *v14;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  ARQATracer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_segmentationYUVPixelBufferPool = &self->_segmentationYUVPixelBufferPool;
  if (!self->_segmentationYUVPixelBufferPool)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (ar_pixelBufferPoolCreateNew(Width, Height, 875704422, p_segmentationYUVPixelBufferPool))
    {
      _ARLogGeneral_28();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v21 = v9;
        v22 = 2048;
        v23 = self;
        v10 = "%{public}@ <%p>: Could not create pixel buffer pool.";
        goto LABEL_12;
      }
      goto LABEL_13;
    }
  }
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!self->_segmentationTransferSession
    && VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &self->_segmentationTransferSession))
  {
    _ARLogGeneral_28();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2048;
      v23 = self;
      v10 = "%{public}@ <%p>: Could not create VTPixelTransferSession.";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer(v6, *p_segmentationYUVPixelBufferPool, &pixelBufferOut))
  {
    _ARLogGeneral_28();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v9;
      v22 = 2048;
      v23 = self;
      v10 = "%{public}@ <%p>: Could not create pixel buffer.";
LABEL_12:
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);

    }
LABEL_13:

    return 0;
  }
  if (VTPixelTransferSessionTransferImage(self->_segmentationTransferSession, a3, pixelBufferOut))
  {
    _ARLogGeneral_28();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2048;
      v23 = self;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create transfer pixel buffer.", buf, 0x16u);

    }
  }
  return pixelBufferOut;
}

- (__CVBuffer)_createRecordablePixelBufferFromSemanticsBuffer:(__CVBuffer *)a3
{
  __CVPixelBufferPool *semanticsYUVPixelBufferPool;
  __CVPixelBufferPool **p_semanticsYUVPixelBufferPool;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  const char *v10;
  unsigned int Width;
  unsigned int Height;
  objc_class *v13;
  CVPixelBufferRef pixelBufferOut;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  ARQATracer *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  p_semanticsYUVPixelBufferPool = &self->_semanticsYUVPixelBufferPool;
  semanticsYUVPixelBufferPool = self->_semanticsYUVPixelBufferPool;
  if (!semanticsYUVPixelBufferPool)
  {
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    if (ar_pixelBufferPoolCreateNew(Width, Height, 1111970369, p_semanticsYUVPixelBufferPool))
    {
      _ARLogGeneral_28();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        v18 = 2048;
        v19 = self;
        v10 = "%{public}@ <%p>: Could not create pixel buffer pool.";
        goto LABEL_8;
      }
LABEL_9:

      return 0;
    }
    semanticsYUVPixelBufferPool = *p_semanticsYUVPixelBufferPool;
  }
  pixelBufferOut = 0;
  if (CVPixelBufferPoolCreatePixelBuffer((CFAllocatorRef)*MEMORY[0x1E0C9AE00], semanticsYUVPixelBufferPool, &pixelBufferOut))
  {
    _ARLogGeneral_28();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      v18 = 2048;
      v19 = self;
      v10 = "%{public}@ <%p>: Could not create pixel buffer.";
LABEL_8:
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, v10, buf, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  ARCreatePixelBufferFromSourceWithPixelConverter(a3, 0x42475241u, &pixelBufferOut, &__block_literal_global_80_0);
  return pixelBufferOut;
}

int8x8_t __62__ARQATracer__createRecordablePixelBufferFromSemanticsBuffer___block_invoke(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _DWORD *a4)
{
  __n128 v5;
  double v6;
  int16x8_t v7;
  int8x8_t result;

  v5 = ARCV3DColorComponentsForRawSemantics(*a2);
  v6 = v5.n128_f32[0];
  v5.n128_u32[0] = vextq_s8((int8x16_t)v5, (int8x16_t)v5, 8uLL).u32[0];
  v5.n128_u64[0] = (unint64_t)vmovn_s64(vcvtq_s64_f64(vmulq_f64(vcvtq_f64_f32((float32x2_t)v5.n128_u64[0]), (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL))));
  v7.i16[3] = 255;
  v7.i64[1] = 0xFF00FF00FF00FFLL;
  v7.i16[0] = v5.n128_u16[0];
  v7.i16[1] = v5.n128_i16[2];
  v7.i16[2] = (int)(v6 * 255.0);
  result = vmovn_s16(v7);
  *a4 = result.i32[0];
  return result;
}

- (ARQATracerDelegate)delegate
{
  return (ARQATracerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)traceOutputFilePath
{
  return self->_traceOutputFilePath;
}

- (void)setTraceOutputFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_traceOutputFilePath, a3);
}

- (BOOL)recordScreen
{
  return self->_recordScreen;
}

- (void)setRecordScreen:(BOOL)a3
{
  self->_recordScreen = a3;
}

- (id)screenRecorder
{
  return self->_screenRecorder;
}

- (void)setScreenRecorder:(id)a3
{
  objc_storeStrong(&self->_screenRecorder, a3);
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (BOOL)forceQuitApp
{
  return self->_forceQuitApp;
}

- (void)setForceQuitApp:(BOOL)a3
{
  self->_forceQuitApp = a3;
}

- (NSMutableDictionary)additionalResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAdditionalResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalResults, 0);
  objc_storeStrong(&self->_screenRecorder, 0);
  objc_storeStrong((id *)&self->_traceOutputFilePath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_raycastResultData, 0);
  objc_storeStrong((id *)&self->_raycastQueryData, 0);
  objc_storeStrong((id *)&self->_semanticsVideoQueue, 0);
  objc_storeStrong((id *)&self->_segmentationVideoQueue, 0);
  objc_storeStrong((id *)&self->_semanticsVideoFileWriter, 0);
  objc_storeStrong((id *)&self->_segmentationVideoFileWriter, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_framesStreamToFile, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
  objc_storeStrong((id *)&self->_traceHeader, 0);
}

@end
