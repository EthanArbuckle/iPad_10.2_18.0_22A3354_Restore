@implementation VCPVideoAnalysisPipelineManager

- (VCPVideoAnalysisPipelineManager)initWithVideoAnalysisBlocks:(id)a3 videoDecoder:(id)a4 maxBufferedFrames:(unint64_t)a5 cancelBlock:(id)a6
{
  id v11;
  VCPVideoAnalysisPipelineManager *v12;
  uint64_t v13;
  NSString *logPrefix;
  uint64_t v15;
  int v16;
  NSString *v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  NSString *v21;
  NSString *v22;
  VCPVideoAnalysisPipelineManager *v23;
  NSMutableArray *v25;
  NSMutableArray *frameResources;
  void *v27;
  id cancelBlock;
  NSObject *v29;
  void *v30;
  id v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *decodeQueue;
  NSMutableArray *v34;
  NSMutableArray *pipelineQueues;
  unint64_t i;
  void *v37;
  NSMutableArray *v38;
  id v39;
  dispatch_queue_t v40;
  dispatch_group_t v41;
  OS_dispatch_group *group;
  void *aBlock;
  id v44;
  id v45;
  objc_super v46;
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v44 = a4;
  v11 = a6;
  v46.receiver = self;
  v46.super_class = (Class)VCPVideoAnalysisPipelineManager;
  v12 = -[VCPVideoAnalysisPipelineManager init](&v46, sel_init);
  if (!v12)
    goto LABEL_16;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@]"), objc_opt_class());
  v13 = objc_claimAutoreleasedReturnValue();
  aBlock = v11;
  logPrefix = v12->_logPrefix;
  v12->_logPrefix = (NSString *)v13;

  if (!v44)
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v21 = v12->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v48 = v21;
    v18 = MEMORY[0x1E0C81028];
    v19 = "%@ video decoder can not be nil.";
LABEL_14:
    v20 = 12;
    goto LABEL_15;
  }
  if (!objc_msgSend(v45, "count"))
  {
    if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v22 = v12->_logPrefix;
    *(_DWORD *)buf = 138412290;
    v48 = v22;
    v18 = MEMORY[0x1E0C81028];
    v19 = "%@ empty analysis blocks.";
    goto LABEL_14;
  }
  v15 = objc_msgSend(v45, "count");
  v16 = v15 + 1;
  if (v15 + 1 <= a5)
  {
    atomic_store(0, (unsigned int *)&v12->_err);
    v12->_flags = 0;
    objc_storeStrong((id *)&v12->_decoder, a4);
    v12->_decodeDone = 0;
    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    frameResources = v12->_frameResources;
    v12->_frameResources = v25;

    v12->_maxBufferedFrames = a5;
    objc_storeStrong((id *)&v12->_pipelineBlocks, a3);
    v27 = _Block_copy(v11);
    cancelBlock = v12->_cancelBlock;
    v12->_cancelBlock = v27;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@."), objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByAppendingString:", CFSTR("Decode"));
    v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v32 = dispatch_queue_create((const char *)objc_msgSend(v31, "UTF8String"), v29);
    decodeQueue = v12->_decodeQueue;
    v12->_decodeQueue = (OS_dispatch_queue *)v32;

    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pipelineQueues = v12->_pipelineQueues;
    v12->_pipelineQueues = v34;

    for (i = 0; i < -[NSArray count](v12->_pipelineBlocks, "count"); ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Stage-%lu"), i);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v12->_pipelineQueues;
      objc_msgSend(v30, "stringByAppendingString:", v37);
      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v40 = dispatch_queue_create((const char *)objc_msgSend(v39, "UTF8String"), v29);
      -[NSMutableArray addObject:](v38, "addObject:", v40);

    }
    v41 = dispatch_group_create();
    group = v12->_group;
    v12->_group = (OS_dispatch_group *)v41;

    v23 = v12;
    goto LABEL_23;
  }
  if ((int)MediaAnalysisLogLevel() < 3)
  {
    v23 = 0;
LABEL_23:
    v11 = aBlock;
    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = v12->_logPrefix;
    *(_DWORD *)buf = 138412802;
    v48 = v17;
    v49 = 1024;
    v50 = a5;
    v51 = 1024;
    v52 = v16;
    v18 = MEMORY[0x1E0C81028];
    v19 = "%@ maxBufferedFrames %u < pipelineDepth %u";
    v20 = 24;
LABEL_15:
    _os_log_impl(&dword_1B6C4A000, v18, OS_LOG_TYPE_ERROR, v19, buf, v20);
  }
LABEL_16:
  v23 = 0;
LABEL_17:

  return v23;
}

- (void)flushFrameResources
{
  NSMutableArray *i;
  void *v4;

  for (i = self->_frameResources; -[NSMutableArray count](i, "count"); i = self->_frameResources)
  {
    -[NSMutableArray objectAtIndex:](self->_frameResources, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flags |= objc_msgSend(v4, "frameFlags");
    -[NSMutableArray removeObjectAtIndex:](self->_frameResources, "removeObjectAtIndex:", 0);

  }
}

- (int)manageFrameResources
{
  void *v3;
  NSString *logPrefix;
  int v6;
  int v7;
  NSString *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_frameResources, "count") >= self->_maxBufferedFrames)
  {
    -[NSMutableArray objectAtIndex:](self->_frameResources, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_flags |= objc_msgSend(v3, "frameFlags");
    -[NSMutableArray removeObjectAtIndex:](self->_frameResources, "removeObjectAtIndex:", 0);

  }
  if (-[NSMutableArray count](self->_frameResources, "count") < self->_maxBufferedFrames)
    return 0;
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    logPrefix = self->_logPrefix;
    v6 = -[NSMutableArray count](self->_frameResources, "count");
    v7 = 138412546;
    v8 = logPrefix;
    v9 = 1024;
    v10 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ total buffered %u frames exceeding capacity.", (uint8_t *)&v7, 0x12u);
  }
  return -18;
}

- (id)nextFrameResource
{
  opaqueCMSampleBuffer *v3;
  NSString *logPrefix;
  int v6;
  NSString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[VCPVideoTrackDecoder copyNextSampleBuffer](self->_decoder, "copyNextSampleBuffer");
  if (v3)
    return -[VCPVideoAnalysisPipelineFrameResource initWithSampleBuffer:]([VCPVideoAnalysisPipelineFrameResource alloc], "initWithSampleBuffer:", v3);
  self->_decodeDone = 1;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    logPrefix = self->_logPrefix;
    v6 = 138412290;
    v7 = logPrefix;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%@ frame decoding finished.", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)lastFrameResource
{
  void *v3;

  v3 = (void *)-[NSMutableArray count](self->_frameResources, "count");
  if (v3)
  {
    -[NSMutableArray lastObject](self->_frameResources, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)addFrameResource:(id)a3
{
  id v4;
  int v5;
  NSString *logPrefix;
  int v7;
  int v9;
  NSString *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_frameResources, "count") >= self->_maxBufferedFrames)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      v7 = -[NSMutableArray count](self->_frameResources, "count");
      v9 = 138412546;
      v10 = logPrefix;
      v11 = 1024;
      v12 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ total buffered %u frames exceeding capacity.", (uint8_t *)&v9, 0x12u);
    }
    v5 = -18;
  }
  else
  {
    -[NSMutableArray addObject:](self->_frameResources, "addObject:", v4);
    v5 = 0;
  }

  return v5;
}

- (void)executeDecode
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unsigned int (**cancelBlock)(void);
  unsigned int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  NSObject *group;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[16];

  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoAnalysisPipelineManager_ExecuteDecode", ", buf, 2u);
  }

  if (!atomic_load((unsigned int *)&self->_err))
  {
    cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (cancelBlock && cancelBlock[2]())
    {
      atomic_store(0xFFFFFF80, (unsigned int *)&self->_err);
    }
    else if (!self->_decodeDone)
    {
      v9 = -[VCPVideoAnalysisPipelineManager manageFrameResources](self, "manageFrameResources");
      if (v9)
      {
        atomic_store(v9, (unsigned int *)&self->_err);
      }
      else
      {
        -[VCPVideoAnalysisPipelineManager lastFrameResource](self, "lastFrameResource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VCPVideoAnalysisPipelineManager nextFrameResource](self, "nextFrameResource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11 && (v12 = -[VCPVideoAnalysisPipelineManager addFrameResource:](self, "addFrameResource:", v11)) != 0)
        {
          atomic_store(v12, (unsigned int *)&self->_err);
        }
        else
        {
          if (v10)
          {
            group = self->_group;
            -[NSMutableArray objectAtIndex:](self->_pipelineQueues, "objectAtIndex:", 0);
            v14 = objc_claimAutoreleasedReturnValue();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __48__VCPVideoAnalysisPipelineManager_executeDecode__block_invoke;
            block[3] = &unk_1E6B17B88;
            block[4] = self;
            v18 = v10;
            v19 = v11;
            dispatch_group_async(group, v14, block);

          }
          VCPSignPostLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v16, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoAnalysisPipelineManager_ExecuteDecode", ", buf, 2u);
          }

        }
      }
    }
  }
}

uint64_t __48__VCPVideoAnalysisPipelineManager_executeDecode__block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = (void *)a1[6];
  if (v3)
    v4 = objc_msgSend(v3, "frameSampleBuffer");
  else
    v4 = 0;
  return objc_msgSend(v1, "executePipelineStageAt:currentFrameResource:nextFrameSample:", 0, v2, v4);
}

- (void)executePipelineStageAt:(unint64_t)a3 currentFrameResource:(id)a4 nextFrameSample:(opaqueCMSampleBuffer *)a5
{
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  unsigned int (**cancelBlock)(void);
  uint64_t (**v15)(_QWORD, _QWORD, _QWORD);
  unsigned int v16;
  unint64_t v17;
  NSObject *group;
  NSObject *v19;
  NSObject *decodeQueue;
  NSObject *v21;
  NSObject *v22;
  _QWORD block[5];
  id v24;
  unint64_t v25;
  opaqueCMSampleBuffer *v26;
  _QWORD v27[5];
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  VCPSignPostLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 67109120;
    v29 = a3;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPVideoAnalysisPipelineManager_ExecuteStage", "-%u", buf, 8u);
  }

  if (!atomic_load((unsigned int *)&self->_err))
  {
    cancelBlock = (unsigned int (**)(void))self->_cancelBlock;
    if (cancelBlock && cancelBlock[2]())
    {
      atomic_store(0xFFFFFF80, (unsigned int *)&self->_err);
    }
    else
    {
      -[NSArray objectAtIndex:](self->_pipelineBlocks, "objectAtIndex:", a3);
      v15 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v16 = ((uint64_t (**)(_QWORD, id, opaqueCMSampleBuffer *))v15)[2](v15, v8, a5);

      if (v16)
      {
        atomic_store(v16, (unsigned int *)&self->_err);
      }
      else
      {
        v17 = (a3 + 1) % -[NSArray count](self->_pipelineBlocks, "count");
        group = self->_group;
        if (v17)
        {
          -[NSMutableArray objectAtIndex:](self->_pipelineQueues, "objectAtIndex:", v17);
          v19 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke_2;
          block[3] = &unk_1E6B19CA0;
          block[4] = self;
          v25 = v17;
          v24 = v8;
          v26 = a5;
          dispatch_group_async(group, v19, block);

        }
        else
        {
          decodeQueue = self->_decodeQueue;
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke;
          v27[3] = &unk_1E6B15468;
          v27[4] = self;
          dispatch_group_async(group, decodeQueue, v27);
        }
        VCPSignPostLog();
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_DWORD *)buf = 67109120;
          v29 = a3;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v22, OS_SIGNPOST_INTERVAL_END, v10, "VCPVideoAnalysisPipelineManager_ExecuteStage", "-%u", buf, 8u);
        }

      }
    }
  }

}

uint64_t __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeDecode");
}

uint64_t __95__VCPVideoAnalysisPipelineManager_executePipelineStageAt_currentFrameResource_nextFrameSample___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executePipelineStageAt:currentFrameResource:nextFrameSample:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
}

- (int)run
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *group;
  NSObject *decodeQueue;
  int v12;
  NSString *logPrefix;
  NSObject *v14;
  NSObject *v15;
  NSString *v16;
  _QWORD block[5];
  uint8_t buf[4];
  NSString *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  VCPSignPostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPVideoAnalysisPipelineManager_Run", ", buf, 2u);
  }

  if (self->_maxBufferedFrames)
  {
    v7 = 0;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      group = self->_group;
      decodeQueue = self->_decodeQueue;
      block[0] = v8;
      block[1] = 3221225472;
      block[2] = __38__VCPVideoAnalysisPipelineManager_run__block_invoke;
      block[3] = &unk_1E6B15468;
      block[4] = self;
      dispatch_group_async(group, decodeQueue, block);
      ++v7;
    }
    while (v7 < self->_maxBufferedFrames);
  }
  dispatch_group_wait((dispatch_group_t)self->_group, 0xFFFFFFFFFFFFFFFFLL);
  if (atomic_load((unsigned int *)&self->_err))
  {
    v12 = atomic_load((unsigned int *)&self->_err);
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      logPrefix = self->_logPrefix;
      *(_DWORD *)buf = 138412546;
      v20 = logPrefix;
      v21 = 1024;
      v22 = v12;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ Pipeline execution err: %d.", buf, 0x12u);
    }
  }
  else if (-[VCPVideoTrackDecoder status](self->_decoder, "status") == 2)
  {
    -[VCPVideoAnalysisPipelineManager flushFrameResources](self, "flushFrameResources");
    VCPSignPostLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v15, OS_SIGNPOST_INTERVAL_END, v4, "VCPVideoAnalysisPipelineManager_Run", ", buf, 2u);
    }

    return 0;
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = self->_logPrefix;
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%@ video decoder read err.", buf, 0xCu);
    }
    return -19;
  }
  return v12;
}

uint64_t __38__VCPVideoAnalysisPipelineManager_run__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeDecode");
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong(&self->_cancelBlock, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_pipelineQueues, 0);
  objc_storeStrong((id *)&self->_decodeQueue, 0);
  objc_storeStrong((id *)&self->_pipelineBlocks, 0);
  objc_storeStrong((id *)&self->_frameResources, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

@end
