@implementation MADHEVCAlphaSequenceWriter

- (MADHEVCAlphaSequenceWriter)initWithFrameCount:(unint64_t)a3
{
  MADHEVCAlphaSequenceWriter *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURL *url;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  NSURL *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  AVAssetWriter *writer;
  uint64_t v25;
  NSMutableArray *sampleQueue;
  dispatch_semaphore_t v27;
  OS_dispatch_semaphore *enqueueSemaphore;
  dispatch_semaphore_t v29;
  OS_dispatch_semaphore *dequeueSemaphore;
  dispatch_semaphore_t v31;
  OS_dispatch_semaphore *completionSemaphore;
  MADHEVCAlphaSequenceWriter *v33;
  void *v34;
  id v36;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v38.receiver = self;
  v38.super_class = (Class)MADHEVCAlphaSequenceWriter;
  v3 = -[MADHEVCAlphaSequenceWriter init](&v38, sel_init, a3);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR(".mov"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    url = v3->_url;
    v3->_url = (NSURL *)v10;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v3->_url, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v12, "fileExistsAtPath:", v13);

    if ((_DWORD)v6)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[NSURL path](v3->_url, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing existing file at path %@", buf, 0xCu);

      }
      -[NSURL path](v3->_url, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      v16 = objc_msgSend(v12, "removeItemAtPath:error:", v15, &v37);
      v17 = v37;

      if ((v16 & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[NSURL path](v3->_url, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v40 = v18;
          v41 = 2112;
          v42 = v19;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to remove existing file at path %@ (%@)", buf, 0x16u);

        }
LABEL_18:

        v33 = 0;
        goto LABEL_19;
      }
    }
    else
    {
      v17 = 0;
    }
    v20 = v3->_url;
    v21 = *MEMORY[0x1E0C8A2E8];
    v36 = v17;
    objc_msgSend(MEMORY[0x1E0C8B018], "assetWriterWithURL:fileType:error:", v20, v21, &v36);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v36;

    writer = v3->_writer;
    v3->_writer = (AVAssetWriter *)v22;

    if (!v3->_writer)
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "description");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v40 = v34;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create asset writer (%@)", buf, 0xCu);

      }
      v17 = v23;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    sampleQueue = v3->_sampleQueue;
    v3->_sampleQueue = (NSMutableArray *)v25;

    v27 = dispatch_semaphore_create(5);
    enqueueSemaphore = v3->_enqueueSemaphore;
    v3->_enqueueSemaphore = (OS_dispatch_semaphore *)v27;

    v29 = dispatch_semaphore_create(0);
    dequeueSemaphore = v3->_dequeueSemaphore;
    v3->_dequeueSemaphore = (OS_dispatch_semaphore *)v29;

    v31 = dispatch_semaphore_create(0);
    completionSemaphore = v3->_completionSemaphore;
    v3->_completionSemaphore = (OS_dispatch_semaphore *)v31;

    atomic_store(1u, (unsigned int *)&v3->_status);
  }
  v33 = v3;
LABEL_19:

  return v33;
}

+ (id)assetWriterWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithURL:", v3);

  return v4;
}

- (void)dealloc
{
  unsigned int v3;
  id v4;
  void *v5;
  NSURL *url;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSURL *v13;
  void *v14;
  objc_super v15;
  id v16;
  __int128 v17;
  uint64_t v18;
  _BYTE buf[12];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned int *)&self->_status);
  if (v3 == 1)
  {
    v17 = *MEMORY[0x1E0CA2E18];
    v18 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v4 = -[MADHEVCAlphaSequenceWriter finishWithEndTime:](self, "finishWithEndTime:", &v17);
  }
  while (-[NSMutableArray count](self->_sampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sampleQueue, "objectAtIndexedSubscript:", 0);
    *(_QWORD *)buf = objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_sampleQueue, "removeObjectAtIndex:", 0);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)buf);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  url = self->_url;
  if (url)
  {
    -[NSURL path](url, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

    if (v8)
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        -[NSURL path](self->_url, "path");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Removing temporary file at path %@", buf, 0xCu);

      }
      -[NSURL path](self->_url, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v11 = objc_msgSend(v5, "removeItemAtPath:error:", v10, &v16);
      v12 = v16;

      if ((v11 & 1) == 0
        && (int)MediaAnalysisLogLevel() >= 3
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = self->_url;
        objc_msgSend(v12, "description");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        v20 = 2112;
        v21 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to remove temporary file %@ (%@)", buf, 0x16u);

      }
    }
  }

  v15.receiver = self;
  v15.super_class = (Class)MADHEVCAlphaSequenceWriter;
  -[MADHEVCAlphaSequenceWriter dealloc](&v15, sel_dealloc);
}

- (void)pushSample:(opaqueCMSampleBuffer *)a3
{
  NSMutableArray *v5;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_enqueueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (a3)
  {
    v5 = self->_sampleQueue;
    objc_sync_enter(v5);
    -[NSMutableArray addObject:](self->_sampleQueue, "addObject:", a3);
    objc_sync_exit(v5);

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_dequeueSemaphore);
}

- (opaqueCMSampleBuffer)popSample
{
  NSMutableArray *v3;
  void *v4;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_dequeueSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v3 = self->_sampleQueue;
  objc_sync_enter(v3);
  if (-[NSMutableArray count](self->_sampleQueue, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_sampleQueue, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray removeObjectAtIndex:](self->_sampleQueue, "removeObjectAtIndex:", 0);
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_enqueueSemaphore);
  return (opaqueCMSampleBuffer *)v4;
}

- (void)processMediaRequest
{
  AVAssetWriterInput *input;
  AVAssetWriter *writer;
  _QWORD v5[5];
  opaqueCMSampleBuffer *v6;

  if (-[AVAssetWriterInput isReadyForMoreMediaData](self->_input, "isReadyForMoreMediaData"))
  {
    while (1)
    {
      v6 = -[MADHEVCAlphaSequenceWriter popSample](self, "popSample");
      input = self->_input;
      if (!v6)
      {
        -[AVAssetWriterInput markAsFinished](input, "markAsFinished");
        writer = self->_writer;
        v5[0] = MEMORY[0x1E0C809B0];
        v5[1] = 3221225472;
        v5[2] = __49__MADHEVCAlphaSequenceWriter_processMediaRequest__block_invoke;
        v5[3] = &unk_1E6B15468;
        v5[4] = self;
        -[AVAssetWriter finishWritingWithCompletionHandler:](writer, "finishWritingWithCompletionHandler:", v5);
        goto LABEL_8;
      }
      if (!-[AVAssetWriterInput appendSampleBuffer:](input, "appendSampleBuffer:"))
        break;
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&v6);
      if (!-[AVAssetWriterInput isReadyForMoreMediaData](self->_input, "isReadyForMoreMediaData"))
        return;
    }
    atomic_store(3u, (unsigned int *)&self->_status);
    -[AVAssetWriter cancelWriting](self->_writer, "cancelWriting");
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
LABEL_8:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v6);
  }
}

intptr_t __49__MADHEVCAlphaSequenceWriter_processMediaRequest__block_invoke(uint64_t a1)
{
  atomic_store(2u, (unsigned int *)(*(_QWORD *)(a1 + 32) + 72));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 64));
}

- (int)createAssetWriterInputWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AVAssetWriterInput *v11;
  AVAssetWriterInput *input;
  AVAssetWriter *writer;
  dispatch_queue_t v14;
  AVAssetWriterInput *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  _QWORD v20[5];
  __int128 v21;
  uint64_t v22;
  uint8_t buf[8];
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  v5 = *MEMORY[0x1E0C8AE68];
  v27[0] = *MEMORY[0x1E0C8AE80];
  v6 = *MEMORY[0x1E0C8AF60];
  v26[0] = v5;
  v26[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", Dimensions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v7;
  v26[2] = *MEMORY[0x1E0C8AEF0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v8;
  v26[3] = *MEMORY[0x1E0C8AEB8];
  v24 = *MEMORY[0x1E0CED210];
  v25 = &unk_1E6B72090;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C8B020], "assetWriterInputWithMediaType:outputSettings:", *MEMORY[0x1E0C8A808], v10);
  v11 = (AVAssetWriterInput *)objc_claimAutoreleasedReturnValue();
  input = self->_input;
  self->_input = v11;

  if (!self->_input)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Failed to create asset writer input";
    goto LABEL_10;
  }
  -[AVAssetWriter addInput:](self->_writer, "addInput:");
  if (!-[AVAssetWriter startWriting](self->_writer, "startWriting"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    v18 = "Failed to start asset writer";
LABEL_10:
    _os_log_impl(&dword_1B6C4A000, v17, OS_LOG_TYPE_ERROR, v18, buf, 2u);
LABEL_11:
    v16 = -18;
    goto LABEL_12;
  }
  writer = self->_writer;
  v21 = *MEMORY[0x1E0CA2E68];
  v22 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  -[AVAssetWriter startSessionAtSourceTime:](writer, "startSessionAtSourceTime:", &v21);
  v14 = dispatch_queue_create("VCPSimpleMovieWriter.mediaDataRequest", 0);
  v15 = self->_input;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __74__MADHEVCAlphaSequenceWriter_createAssetWriterInputWithFormatDescription___block_invoke;
  v20[3] = &unk_1E6B15468;
  v20[4] = self;
  -[AVAssetWriterInput requestMediaDataWhenReadyOnQueue:usingBlock:](v15, "requestMediaDataWhenReadyOnQueue:usingBlock:", v14, v20);

  v16 = 0;
LABEL_12:

  return v16;
}

uint64_t __74__MADHEVCAlphaSequenceWriter_createAssetWriterInputWithFormatDescription___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMediaRequest");
}

- (int)addPixelBuffer:(__CVBuffer *)a3 withTime:(id *)a4
{
  unsigned int v5;
  OSStatus v8;
  CFTypeRef v9;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  if (!a3)
    return -50;
  v5 = atomic_load((unsigned int *)&self->_status);
  if (v5 != 1)
    return -18;
  formatDescriptionOut = 0;
  v8 = CMVideoFormatDescriptionCreateForImageBuffer(0, a3, &formatDescriptionOut);
  if (!v8
    && (self->_input
     || (v8 = -[MADHEVCAlphaSequenceWriter createAssetWriterInputWithFormatDescription:](self, "createAssetWriterInputWithFormatDescription:", formatDescriptionOut)) == 0))
  {
    *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
    sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    sampleTiming.presentationTimeStamp = (CMTime)*a4;
    sampleTiming.decodeTimeStamp = sampleTiming.duration;
    sampleBufferOut = 0;
    v8 = CMSampleBufferCreateForImageBuffer(0, a3, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (!v8)
    {
      if (sampleBufferOut)
        v9 = CFRetain(sampleBufferOut);
      else
        v9 = 0;
      -[MADHEVCAlphaSequenceWriter pushSample:](self, "pushSample:", v9);
    }
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&sampleBufferOut);
  }
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&formatDescriptionOut);
  return v8;
}

- (id)finishWithEndTime:(id *)a3
{
  atomic<int> *p_status;
  unsigned int v4;
  void *v6;

  p_status = &self->_status;
  v4 = atomic_load((unsigned int *)&self->_status);
  if (v4 == 1)
  {
    -[MADHEVCAlphaSequenceWriter pushSample:](self, "pushSample:", 0);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_completionSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    atomic_store(2u, (unsigned int *)p_status);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", self->_url);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionSemaphore, 0);
  objc_storeStrong((id *)&self->_dequeueSemaphore, 0);
  objc_storeStrong((id *)&self->_enqueueSemaphore, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
