@implementation VCPVideoProcessorNode

- (NSString)typeDescription
{
  objc_class *v2;
  __CFString *v3;

  if (self->_request)
  {
    v2 = (objc_class *)objc_opt_class();
    NSStringFromClass(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("FrameProcessingRequest");
  }
  return (NSString *)v3;
}

+ (BOOL)validateConfiguration:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t *v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[3];
  char v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__VCPVideoProcessorNode_validateConfiguration_withError___block_invoke;
  v10[3] = &unk_1E6B15C78;
  v10[4] = v17;
  v10[5] = &v11;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);
  v6 = v12;
  if (v12[5])
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v12[5], "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Invalid request configuration (%@)", buf, 0xCu);

    }
    v6 = v12;
    if (a4)
    {
      *a4 = objc_retainAutorelease((id)v12[5]);
      v6 = v12;
    }
  }
  v8 = v6[5] == 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(v17, 8);
  return v8;
}

void __57__VCPVideoProcessorNode_validateConfiguration_withError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  float v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("FramesPerSecond"));
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEE3F0]) & 1) != 0
    || (v9 | objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CEE3F8])) == 1)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v10 + 24))
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Multiple cadence options specified"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v13);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

LABEL_13:
      *a4 = 1;
      goto LABEL_14;
    }
    *(_BYTE *)(v10 + 24) = 1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ value must be NSNumber"), v7);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = v28;

      goto LABEL_13;
    }
    v17 = v8;
    objc_msgSend(v17, "floatValue");
    if (v18 <= 0.0)
    {
      v37 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ value must be positive"), v7);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v38;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v39);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v42 = *(void **)(v41 + 40);
      *(_QWORD *)(v41 + 40) = v40;

      *a4 = 1;
    }
    else
    {

    }
  }
  else
  {
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("FrameLimit")))
    {
      v31 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not supported"), v7, *MEMORY[0x1E0CB2D50]);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v33);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v36 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v34;

      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ value must be NSNumber"), v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      goto LABEL_13;
    }
  }
LABEL_14:

}

- (void)_processConfiguration:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  CMTimeEpoch epoch;
  void *v18;
  NSNumber *v19;
  NSNumber *frameLimit;
  uint64_t v21;
  CMTime v22;

  v4 = a3;
  v5 = *MEMORY[0x1E0CEE3F0];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEE3F0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_frameInterval = objc_msgSend(v7, "unsignedIntegerValue");

  }
  else
  {
    self->_frameInterval = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FramesPerSecond"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FramesPerSecond"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    v11 = v10;

    CMTimeMakeWithSeconds(&v22, 1.0 / v11, 1000);
LABEL_8:
    *(_OWORD *)&self->_timeInterval.value = *(_OWORD *)&v22.value;
    epoch = v22.epoch;
    goto LABEL_9;
  }
  v12 = *MEMORY[0x1E0CEE3F8];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEE3F8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    CMTimeMakeWithSeconds(&v22, v16, 1000);
    goto LABEL_8;
  }
  v21 = MEMORY[0x1E0CA2E68];
  *(_OWORD *)&self->_timeInterval.value = *MEMORY[0x1E0CA2E68];
  epoch = *(_QWORD *)(v21 + 16);
LABEL_9:
  self->_timeInterval.epoch = epoch;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FrameLimit"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FrameLimit"));
    v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    frameLimit = self->_frameLimit;
    self->_frameLimit = v19;

  }
}

- (VCPVideoProcessorNode)initWithRequest:(id)a3 andConfiguration:(id)a4
{
  id v7;
  id v8;
  VCPVideoProcessorNode *v9;
  VCPVideoProcessorNode *v10;
  VCPVideoProcessorNode *v11;
  objc_super v13;
  uint8_t buf[16];

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)VCPVideoProcessorNode;
    v9 = -[VCPVideoProcessorNode init](&v13, sel_init);
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_request, a3);
      -[VCPVideoProcessorNode _processConfiguration:](v10, "_processConfiguration:", v8);
    }
    self = v10;
    v11 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VNRequest must be non-nil", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)nodeWithRequest:(id)a3 andConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRequest:andConfiguration:", v5, v6);

  return v7;
}

- (VCPVideoProcessorNode)initWithFrameProcessor:(id)a3 andConfiguration:(id)a4
{
  id v6;
  id v7;
  VCPVideoProcessorNode *v8;
  void *v9;
  id frameProcessor;
  VCPVideoProcessorNode *v11;
  objc_super v13;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v13.receiver = self;
    v13.super_class = (Class)VCPVideoProcessorNode;
    v8 = -[VCPVideoProcessorNode init](&v13, sel_init);
    if (v8)
    {
      v9 = _Block_copy(v6);
      frameProcessor = v8->_frameProcessor;
      v8->_frameProcessor = v9;

      -[VCPVideoProcessorNode _processConfiguration:](v8, "_processConfiguration:", v7);
    }
    self = v8;
    v11 = self;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Frame processor must be non-nil", buf, 2u);
    }
    v11 = 0;
  }

  return v11;
}

+ (id)nodeWithFrameProcessor:(id)a3 andConfiguration:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrameProcessor:andConfiguration:", v5, v6);

  return v7;
}

- (BOOL)finished
{
  NSNumber *frameLimit;
  unint64_t processedFrameCount;

  frameLimit = self->_frameLimit;
  if (frameLimit)
  {
    processedFrameCount = self->_processedFrameCount;
    LOBYTE(frameLimit) = processedFrameCount >= -[NSNumber unsignedIntegerValue](frameLimit, "unsignedIntegerValue");
  }
  return (char)frameLimit;
}

- (VNRequest)request
{
  return self->_request;
}

- (id)frameProcessor
{
  return self->_frameProcessor;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timeInterval
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (unint64_t)frameInterval
{
  return self->_frameInterval;
}

- (NSNumber)frameLimit
{
  return self->_frameLimit;
}

- (unint64_t)processedFrameCount
{
  return self->_processedFrameCount;
}

- (void)setProcessedFrameCount:(unint64_t)a3
{
  self->_processedFrameCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameLimit, 0);
  objc_storeStrong(&self->_frameProcessor, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
