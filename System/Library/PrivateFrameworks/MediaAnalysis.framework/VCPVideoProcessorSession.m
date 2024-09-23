@implementation VCPVideoProcessorSession

- (VCPVideoProcessorSession)init
{
  VCPVideoProcessorSession *v2;
  VCPVideoProcessorSession *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableArray *nodes;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VCPVideoProcessorSession;
  v2 = -[VCPVideoProcessorSession init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_orientation = 1;
    v4 = dispatch_queue_create("com.apple.mediaanalysis.VCPVideoProcessorSession", 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    nodes = v3->_nodes;
    v3->_nodes = (NSMutableArray *)v6;

    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)(&v3->_modified + 4) = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&v3->_startTime.flags = *(_QWORD *)(v8 + 16);
  }
  return v3;
}

- (BOOL)addRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *queue;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "completionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (!a5)
      goto LABEL_7;
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video processing requests must have completion handler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
    LOBYTE(a5) = 0;
    goto LABEL_7;
  }
  if (!+[VCPVideoProcessorNode validateConfiguration:withError:](VCPVideoProcessorNode, "validateConfiguration:withError:", v9, a5))goto LABEL_6;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__VCPVideoProcessorSession_addRequest_withConfiguration_error___block_invoke;
  v16[3] = &unk_1E6B16F78;
  v16[4] = self;
  v19 = &v21;
  v20 = a5;
  v17 = v8;
  v18 = v9;
  dispatch_sync(queue, v16);
  LOBYTE(a5) = *((_BYTE *)v22 + 24) != 0;

  _Block_object_dispose(&v21, 8);
LABEL_7:

  return (char)a5;
}

void __63__VCPVideoProcessorSession_addRequest_withConfiguration_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "request", (_QWORD)v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 == *(void **)(a1 + 40);

        if (v7)
        {
          if (*(_QWORD *)(a1 + 64))
          {
            v8 = (void *)MEMORY[0x1E0CB35C8];
            v20 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified request already active; cannot add"));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v9;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v10);
            **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_13;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v3)
        continue;
      break;
    }
  }

  +[VCPVideoProcessorNode nodeWithRequest:andConfiguration:](VCPVideoProcessorNode, "nodeWithRequest:andConfiguration:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  }
  else
  {
    if (*(_QWORD *)(a1 + 64))
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create request with specified configuration"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v13);
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_13:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)removeRequest:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint64_t *v12;
  id *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__VCPVideoProcessorSession_removeRequest_error___block_invoke;
  v10[3] = &unk_1E6B16CC0;
  v10[4] = self;
  v11 = v6;
  v12 = &v14;
  v13 = a4;
  v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

void __48__VCPVideoProcessorSession_removeRequest_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v4)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v5);
      objc_msgSend(v6, "request", (_QWORD)v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 == *(void **)(a1 + 40);

      if (v8)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v9 = v6;

    if (!v9)
      goto LABEL_12;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", v9);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;

  }
  else
  {
LABEL_9:

LABEL_12:
    if (*(_QWORD *)(a1 + 56))
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Specified request not found; cannot remove"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v12);
      **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (BOOL)addFrameProcessingRequest:(id)a3 withConfiguration:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  BOOL v11;
  _QWORD block[4];
  id v14;
  VCPVideoProcessorSession *v15;
  id v16;
  uint64_t *v17;
  id *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v9 = a4;
  if (+[VCPVideoProcessorNode validateConfiguration:withError:](VCPVideoProcessorNode, "validateConfiguration:withError:", v9, a5))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__VCPVideoProcessorSession_addFrameProcessingRequest_withConfiguration_error___block_invoke;
    block[3] = &unk_1E6B16FA0;
    v16 = v8;
    v17 = &v19;
    v18 = a5;
    v14 = v9;
    v15 = self;
    dispatch_sync(queue, block);
    v11 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __78__VCPVideoProcessorSession_addFrameProcessingRequest_withConfiguration_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  +[VCPVideoProcessorNode nodeWithFrameProcessor:andConfiguration:](VCPVideoProcessorNode, "nodeWithFrameProcessor:andConfiguration:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "addObject:", v2);
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 24) = 1;
  }
  else
  {
    if (*(_QWORD *)(a1 + 64))
    {
      v3 = (void *)MEMORY[0x1E0CB35C8];
      v6 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create video processor node with specified configuration"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v5);
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

- (BOOL)shouldProcessSampleWithTimeRange:(id *)a3 atSamplingInterval:(id *)a4
{
  __int128 v7;
  int32_t v8;
  unsigned int v9;
  Float64 Seconds;
  int64_t var0;
  int var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  CMTime v16;
  CMTime v17;
  CMTimeRange range;
  CMTime v19;
  CMTime v20;
  CMTime rhs;
  CMTime lhs;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(&v19, 0, sizeof(v19));
  v7 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&range.start.epoch = v7;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
  CMTimeRangeGetEnd(&v19, &range);
  memset(&v17, 0, sizeof(v17));
  lhs = (CMTime)a3->var0;
  *(_OWORD *)&rhs.value = *(_OWORD *)(&self->_modified + 4);
  rhs.epoch = *(_QWORD *)&self->_startTime.flags;
  CMTimeSubtract(&v17, &lhs, &rhs);
  v8 = vcvtpd_s64_f64((double)a4->var1 * (double)v17.value / (double)(a4->var0 * v17.timescale));
  memset(&v16, 0, sizeof(v16));
  lhs = *(CMTime *)a4;
  CMTimeMultiply(&v20, &lhs, v8);
  *(_OWORD *)&lhs.value = *(_OWORD *)(&self->_modified + 4);
  lhs.epoch = *(_QWORD *)&self->_startTime.flags;
  rhs = v20;
  CMTimeAdd(&v16, &lhs, &rhs);
  lhs = v16;
  rhs = v19;
  v9 = CMTimeCompare(&lhs, &rhs);
  if ((v9 & 0x80000000) != 0)
  {
    rhs = v16;
    v20 = (CMTime)*a4;
    CMTimeAdd(&lhs, &rhs, &v20);
    v16 = lhs;
    rhs = v19;
    if (CMTimeCompare(&lhs, &rhs) < 0
      && (int)MediaAnalysisLogLevel() >= 4
      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v15 = *a4;
      Seconds = CMTimeGetSeconds((CMTime *)&v15);
      var0 = a3->var0.var0;
      var1 = a3->var0.var1;
      LODWORD(lhs.value) = 134218496;
      *(Float64 *)((char *)&lhs.value + 4) = Seconds;
      LOWORD(lhs.flags) = 2048;
      *(_QWORD *)((char *)&lhs.flags + 2) = var0;
      HIWORD(lhs.epoch) = 1024;
      v23 = var1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Multiple sampling times (%0.1fs) intersect frame at %lld/%d", (uint8_t *)&lhs, 0x1Cu);
    }
  }
  return v9 >> 31;
}

- (BOOL)allRequestsFinished
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  BOOL v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_nodes;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "finished", (_QWORD)v8) & 1) == 0)
        {
          v6 = 0;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 withEndTime:(id *)a4 error:(id *)a5
{
  opaqueCMSampleBuffer *v7;
  NSObject *queue;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t frameCount;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  BOOL v24;
  unint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  CMTimeValue v31;
  CMTimeScale v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  char v39;
  objc_class *v40;
  CMTimeValue value;
  CMTimeScale timescale;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  void *v49;
  id v50;
  void *v51;
  opaqueCMSampleBuffer *v52;
  unint64_t v53;
  id obj;
  _QWORD v55[7];
  _QWORD v56[6];
  id v57;
  _QWORD v58[3];
  _BYTE v59[72];
  _QWORD v60[7];
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  _QWORD block[6];
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  CMTime end;
  CMTime start;
  CMTimeRange v82;
  CMTime time2;
  void *v84;
  CMTime buf;
  _BYTE v86[14];
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;
  _QWORD v91[4];

  v7 = a3;
  v91[1] = *MEMORY[0x1E0C80C00];
  if (!CMSampleBufferGetImageBuffer(a3))
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v90 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sample buffer does not contain video frame"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v91[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v90, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
    return (char)a5;
  }
  memset(&v82, 0, sizeof(v82));
  CMSampleBufferGetPresentationTimeStamp(&start, v7);
  end = (CMTime)*a4;
  CMTimeRangeFromTimeToTime(&v82, &start, &end);
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = __Block_byref_object_copy__15;
  v78 = __Block_byref_object_dispose__15;
  v79 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke;
  block[3] = &unk_1E6B158A0;
  block[5] = &v74;
  block[4] = self;
  dispatch_sync(queue, block);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v12 = -[VCPVideoProcessorSession orientation](self, "orientation");
  v51 = (void *)objc_msgSend(v11, "initWithCMSampleBuffer:orientation:options:", v7, v12, MEMORY[0x1E0C9AA70]);
  frameCount = self->_frameCount;
  self->_frameCount = frameCount + 1;
  if (*((_BYTE *)v70 + 24))
    goto LABEL_3;
  v53 = frameCount;
  v52 = v7;
  do
  {
    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    obj = (id)v75[5];
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
    if (!v17)
      goto LABEL_51;
    v18 = *(_QWORD *)v66;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v66 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v19);
        if ((objc_msgSend(v10, "containsObject:", v20) & 1) == 0)
        {
          v61 = 0;
          v62 = &v61;
          v63 = 0x2020000000;
          v64 = 0;
          v21 = self->_queue;
          v60[0] = MEMORY[0x1E0C809B0];
          v60[1] = 3221225472;
          v60[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2;
          v60[3] = &unk_1E6B16B08;
          v60[5] = v20;
          v60[6] = &v61;
          v60[4] = self;
          dispatch_sync(v21, v60);
          if (*((_BYTE *)v62 + 24))
            goto LABEL_14;
          if ((unint64_t)objc_msgSend(v20, "frameInterval") >= 2 && v53 % objc_msgSend(v20, "frameInterval"))
          {
            if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              goto LABEL_14;
          }
          else
          {
            if (v20)
              objc_msgSend(v20, "timeInterval");
            else
              memset(&v59[48], 0, 24);
            buf = *(CMTime *)&v59[48];
            time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
            if (!CMTimeCompare(&buf, &time2))
              goto LABEL_30;
            *(CMTimeRange *)v59 = v82;
            if (v20)
              objc_msgSend(v20, "timeInterval");
            else
              memset(v58, 0, sizeof(v58));
            if (-[VCPVideoProcessorSession shouldProcessSampleWithTimeRange:atSamplingInterval:](self, "shouldProcessSampleWithTimeRange:atSamplingInterval:", v59, v58))
            {
LABEL_30:
              objc_msgSend(v20, "frameLimit");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = v23 == 0;

              if (v24
                || (v25 = objc_msgSend(v20, "processedFrameCount"),
                    objc_msgSend(v20, "frameLimit"),
                    v26 = (void *)objc_claimAutoreleasedReturnValue(),
                    LOBYTE(v25) = v25 < objc_msgSend(v26, "unsignedIntegerValue"),
                    v26,
                    (v25 & 1) != 0))
              {
                LOBYTE(time2.value) = 0;
                objc_msgSend(v20, "frameProcessor");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = v27 == 0;

                if (v28)
                {
                  objc_msgSend(v20, "request");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  v36 = v35 == 0;

                  if (v36)
                  {
                    if ((int)MediaAnalysisLogLevel() >= 3
                      && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      LOWORD(buf.value) = 0;
                      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "A processor node must contain either a frame processor or a vision request!", (uint8_t *)&buf, 2u);
                    }
                    _Block_object_dispose(&v61, 8);

                    LOBYTE(a5) = 0;
                    goto LABEL_57;
                  }
                  objc_msgSend(v20, "request");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  v84 = v37;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v57 = 0;
                  v39 = objc_msgSend(v51, "performRequests:error:", v38, &v57);
                  v29 = v57;

                  v7 = v52;
                  if ((v39 & 1) == 0
                    && (int)MediaAnalysisLogLevel() >= 4
                    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v20, "request");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v40);
                    v50 = (id)objc_claimAutoreleasedReturnValue();
                    value = v82.start.value;
                    timescale = v82.start.timescale;
                    objc_msgSend(v29, "description");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    LODWORD(buf.value) = 138413058;
                    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v50;
                    LOWORD(buf.flags) = 2048;
                    *(_QWORD *)((char *)&buf.flags + 2) = value;
                    HIWORD(buf.epoch) = 1024;
                    *(_DWORD *)v86 = timescale;
                    *(_WORD *)&v86[4] = 2112;
                    *(_QWORD *)&v86[6] = v43;
                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ failed for sample at %lld/%d (%@)", (uint8_t *)&buf, 0x26u);

                    v7 = v52;
                  }
                }
                else
                {
                  objc_msgSend(v20, "frameProcessor");
                  v29 = (id)objc_claimAutoreleasedReturnValue();
                  (*((void (**)(id, opaqueCMSampleBuffer *, CMTime *))v29 + 2))(v29, v7, &time2);
                }

                objc_msgSend(v20, "setProcessedFrameCount:", objc_msgSend(v20, "processedFrameCount") + 1);
                if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v20, "typeDescription");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(buf.value) = 138413058;
                  *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v44;
                  LOWORD(buf.flags) = 2048;
                  *(_QWORD *)((char *)&buf.flags + 2) = v53;
                  HIWORD(buf.epoch) = 2048;
                  *(_QWORD *)v86 = v82.start.value;
                  *(_WORD *)&v86[8] = 1024;
                  *(_DWORD *)&v86[10] = v82.start.timescale;
                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ processed sample %llu at %lld/%d", (uint8_t *)&buf, 0x26u);

                }
                objc_msgSend(v10, "addObject:", v20);
                if (LOBYTE(time2.value))
                {
                  v45 = self->_queue;
                  v56[0] = MEMORY[0x1E0C809B0];
                  v56[1] = 3221225472;
                  v56[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_19;
                  v56[3] = &unk_1E6B16D58;
                  v56[4] = self;
                  v56[5] = v20;
                  dispatch_sync(v45, v56);
                }
              }
              else if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v20, "typeDescription");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = v82.start.value;
                v32 = v82.start.timescale;
                objc_msgSend(v20, "frameLimit");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v33, "unsignedIntegerValue");
                LODWORD(buf.value) = 138413314;
                *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v30;
                LOWORD(buf.flags) = 2048;
                *(_QWORD *)((char *)&buf.flags + 2) = v53;
                HIWORD(buf.epoch) = 2048;
                *(_QWORD *)v86 = v31;
                *(_WORD *)&v86[8] = 1024;
                *(_DWORD *)&v86[10] = v32;
                v87 = 2048;
                v88 = v34;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ skipping sample %llu at %lld/%d due to frame process limit %llu reached", (uint8_t *)&buf, 0x30u);

                v7 = v52;
              }
              goto LABEL_14;
            }
            if ((int)MediaAnalysisLogLevel() < 7 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
LABEL_14:
              _Block_object_dispose(&v61, 8);
              goto LABEL_15;
            }
          }
          objc_msgSend(v20, "typeDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf.value) = 138413058;
          *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v22;
          LOWORD(buf.flags) = 2048;
          *(_QWORD *)((char *)&buf.flags + 2) = v53;
          HIWORD(buf.epoch) = 2048;
          *(_QWORD *)v86 = v82.start.value;
          *(_WORD *)&v86[8] = 1024;
          *(_DWORD *)&v86[10] = v82.start.timescale;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ skipping sample %lld at %lld/%d", (uint8_t *)&buf, 0x26u);

          goto LABEL_14;
        }
LABEL_15:
        ++v19;
      }
      while (v17 != v19);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
      v17 = v46;
      if (v46)
        continue;
      break;
    }
LABEL_51:

    v47 = self->_queue;
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2_20;
    v55[3] = &unk_1E6B16FC8;
    v55[4] = self;
    v55[5] = &v74;
    v55[6] = &v69;
    dispatch_sync(v47, v55);
  }
  while (!*((_BYTE *)v70 + 24));
LABEL_3:
  LOBYTE(a5) = 1;
LABEL_57:

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v74, 8);

  return (char)a5;
}

void __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
}

uint64_t __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    result = objc_msgSend(*(id *)(v2 + 16), "containsObject:", *(_QWORD *)(result + 40));
    v3 = result ^ 1;
  }
  else
  {
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = v3;
  return result;
}

uint64_t __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_19(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  return result;
}

void __66__VCPVideoProcessorSession_processSampleBuffer_withEndTime_error___block_invoke_2_20(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(v2 + 16));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1[5] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    *(_BYTE *)(a1[4] + 24) = 0;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

- (BOOL)processSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v7;
  const void *value;
  CF<opaqueCMSampleBuffer *> *p_nextSampleBuffer;
  const void *v10;
  BOOL v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  CMTime v17;
  CMTime v18;
  const void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (CMSampleBufferGetImageBuffer(a3))
  {
    v7 = (void *)MEMORY[0x1BCCA1B2C]();
    p_nextSampleBuffer = &self->_nextSampleBuffer;
    value = self->_nextSampleBuffer.value_;
    if (value)
      value = CFRetain(value);
    v19 = value;
    v18.value = (CMTimeValue)CFRetain(a3);
    CF<__CVBuffer *>::operator=((const void **)&self->_nextSampleBuffer.value_, (const void **)&v18);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&v18);
    v10 = v19;
    if (v19)
    {
      CMSampleBufferGetPresentationTimeStamp(&v17, p_nextSampleBuffer->value_);
      v16 = 0;
      v11 = -[VCPVideoProcessorSession processSampleBuffer:withEndTime:error:](self, "processSampleBuffer:withEndTime:error:", v10, &v17, &v16);
      v12 = v16;
    }
    else
    {
      CMSampleBufferGetPresentationTimeStamp(&v18, p_nextSampleBuffer->value_);
      v11 = 0;
      v12 = 0;
      *(CMTime *)(&self->_modified + 4) = v18;
    }
    CF<opaqueCMSampleBuffer *>::~CF(&v19);
    objc_autoreleasePoolPop(v7);
    if (v10)
    {
      if (a4 && v12)
        *a4 = (id)objc_msgSend(v12, "copy");
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
    if (!a4)
      return 0;
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sample buffer must contain uncompressed video"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v11 = 0;
  }

  return v11;
}

- (BOOL)flushWithEndTime:(id *)a3 error:(id *)a4
{
  void *v7;
  opaqueCMSampleBuffer *value;
  CFTypeRef v9;
  opaqueCMSampleBuffer *v10;
  BOOL v11;
  id v12;
  char v13;
  id v15;
  __int128 v16;
  int64_t var3;
  const void *v18;

  v7 = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  value = self->_nextSampleBuffer.value_;
  if (value)
  {
    v9 = CFRetain(value);
    v10 = self->_nextSampleBuffer.value_;
    v18 = v9;
    if (v10)
    {
      CFRelease(v10);
      self->_nextSampleBuffer.value_ = 0;
      v9 = v18;
    }
    if (v9)
    {
      v16 = *(_OWORD *)&a3->var0;
      var3 = a3->var3;
      v15 = 0;
      v11 = -[VCPVideoProcessorSession processSampleBuffer:withEndTime:error:](self, "processSampleBuffer:withEndTime:error:", v9, &v16, &v15);
      v12 = v15;
      v13 = 0;
      goto LABEL_9;
    }
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v18 = 0;
  }
  v13 = 1;
LABEL_9:
  CF<opaqueCMSampleBuffer *>::~CF(&v18);
  objc_autoreleasePoolPop(v7);
  if ((v13 & 1) != 0)
  {
    v11 = 1;
  }
  else if (a4 && v12)
  {
    *a4 = (id)objc_msgSend(v12, "copy");
  }

  return v11;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_nextSampleBuffer.value_);
  objc_storeStrong((id *)&self->_nodes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
