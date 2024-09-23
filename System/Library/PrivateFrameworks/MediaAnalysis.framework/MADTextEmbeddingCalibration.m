@implementation MADTextEmbeddingCalibration

- (MADTextEmbeddingCalibration)init
{
  MADTextEmbeddingCalibration *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingCalibration;
  v2 = -[MADTextEmbeddingCalibration init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MADTextEmbeddingCalibration", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;
  uint8_t buf[16];

  if (espresso_plan_destroy()
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to destroy plan", buf, 2u);
  }
  if (espresso_context_destroy()
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to destroy context", buf, 2u);
  }
  v3.receiver = self;
  v3.super_class = (Class)MADTextEmbeddingCalibration;
  -[MADTextEmbeddingCalibration dealloc](&v3, sel_dealloc);
}

- (int)_createPlan
{
  void *plan;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int blob_dimensions;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  int64x2_t v18;
  int64x2_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
    return -18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("text_calibration_md3.espresso.net"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "UTF8String");
  blob_dimensions = espresso_plan_add_network();

  if (!blob_dimensions)
  {
    blob_dimensions = espresso_plan_build();
    if (!blob_dimensions)
    {
      v18 = 0u;
      v19 = 0u;
      blob_dimensions = espresso_network_query_blob_dimensions();
      if (!blob_dimensions)
      {
        if ((vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v18, (int64x2_t)xmmword_1B6FBF1F0), (int32x4_t)vceqq_s64(v19, vdupq_n_s64(1uLL)))))) & 1) != 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v10 = 134218752;
            v11 = v18.i64[0];
            v12 = 2048;
            v13 = v18.i64[1];
            v14 = 2048;
            v15 = v19.i64[0];
            v16 = 2048;
            v17 = v19.i64[1];
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Input has unexpected dimension %zux%zux%zux%zu", (uint8_t *)&v10, 0x2Au);
          }
          blob_dimensions = -18;
        }
        else
        {
          blob_dimensions = espresso_network_bind_cvpixelbuffer();
          if (!blob_dimensions)
          {
            blob_dimensions = espresso_network_bind_buffer();
            if (!blob_dimensions)
              blob_dimensions = espresso_network_bind_buffer();
          }
        }
      }
    }
  }

  return blob_dimensions;
}

- (int)_loadResources
{
  void *context;
  CVReturn v4;
  const __CFDictionary *v5;
  __CVBuffer *value;
  uint8_t v8[8];
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (self->_inputBuffer.value_)
  {
LABEL_2:
    if (self->_context || (context = (void *)espresso_create_context(), (self->_context = context) != 0))
    {
      if (self->_plan)
      {
        return 0;
      }
      else
      {
        v4 = -[MADTextEmbeddingCalibration _createPlan](self, "_createPlan");
        if (v4)
        {
          espresso_plan_destroy();
          self->_plan = 0;
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to create ANE context", v8, 2u);
      }
      return -18;
    }
    return v4;
  }
  v9 = *MEMORY[0x1E0CA8FF0];
  v10[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  value = self->_inputBuffer.value_;
  if (value)
  {
    CFRelease(value);
    self->_inputBuffer.value_ = 0;
  }
  v4 = CVPixelBufferCreate(0, 0x200uLL, 1uLL, 0x4C303068u, v5, &self->_inputBuffer.value_);
  if (!v4)
  {

    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to create input buffer", v8, 2u);
  }

  return v4;
}

- (int)loadResources
{
  NSObject *queue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__MADTextEmbeddingCalibration_loadResources__block_invoke;
  v5[3] = &unk_1E6B158A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__MADTextEmbeddingCalibration_loadResources__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7
{
  id v12;
  int v13;
  unint64_t v14;
  __CVBuffer *value;
  void *v16;
  void *v17;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *BaseAddress;
  uint8_t v28[16];
  uint8_t buf[4];
  _BYTE v30[20];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = -[MADTextEmbeddingCalibration _loadResources](self, "_loadResources");
  if (v13)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to load calibration network", buf, 2u);
    }
    goto LABEL_22;
  }
  if (a4 != 3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v30 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Calibration not supported for embedding version %@", buf, 0xCu);

    }
    goto LABEL_21;
  }
  if (a5 != 2)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Calibration only supported for fp16", buf, 2u);
    }
    goto LABEL_21;
  }
  v14 = (unint64_t)objc_msgSend(v12, "length") >> 1;
  if (v14 != 512)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v30 = v17;
      *(_WORD *)&v30[8] = 2112;
      *(_QWORD *)&v30[10] = &unk_1E6B74468;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Embedding size (%@) does not match expected (%@)", buf, 0x16u);

    }
LABEL_21:
    v13 = -50;
    goto LABEL_22;
  }
  value = self->_inputBuffer.value_;
  *(_QWORD *)&v30[4] = value;
  *(_QWORD *)&v30[12] = 0;
  if (value)
  {
    v13 = CVPixelBufferLockBaseAddress(value, 0);
    *(_DWORD *)buf = v13;
    if (v13)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.3();
    }
    else
    {
      BaseAddress = CVPixelBufferGetBaseAddress(self->_inputBuffer.value_);
      memcpy(BaseAddress, (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes"), 0x400uLL);
      v13 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)buf);
      if (!v13)
      {
        v13 = espresso_plan_execute_sync();
        if (v13)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Calibration] Failed to execute calibration network", v28, 2u);
          }
        }
        else
        {
          *a6 = *(float *)self->_meanBuffer.data;
          *a7 = *(float *)self->_standardDeviationBuffer.data;
        }
      }
    }
  }
  else
  {
    v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v19)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    v13 = -50;
    *(_DWORD *)buf = -50;
  }
  if (*(_QWORD *)&v30[4]
    && !*(_DWORD *)buf
    && CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)&v30[4], *(CVPixelBufferLockFlags *)&v30[12])
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPCNNSmileDetector detectSmileForFace:inBuffer:smile:].cold.1();
  }
LABEL_22:

  return v13;
}

- (int)processEmbedding:(id)a3 mean:(float *)a4 standardDeviation:(float *)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v13;
  MADTextEmbeddingCalibration *v14;
  uint64_t *v15;
  float *v16;
  float *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  v8 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MADTextEmbeddingCalibration_processEmbedding_mean_standardDeviation___block_invoke;
  block[3] = &unk_1E6B197C8;
  v13 = v8;
  v14 = self;
  v15 = &v18;
  v16 = a4;
  v17 = a5;
  v10 = v8;
  dispatch_sync(queue, block);
  LODWORD(a4) = *((_DWORD *)v19 + 6);

  _Block_object_dispose(&v18, 8);
  return (int)a4;
}

void __71__MADTextEmbeddingCalibration_processEmbedding_mean_standardDeviation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "type") == 2)
    v2 = 4;
  else
    v2 = 2 * (objc_msgSend(*(id *)(a1 + 32), "type") != 0);
  v3 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "data");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "_processEmbedding:version:typeSize:mean:standardDeviation:", v4, objc_msgSend(*(id *)(a1 + 32), "version"), v2, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (int)processEmbedding:(id)a3 version:(unint64_t)a4 typeSize:(unint64_t)a5 mean:(float *)a6 standardDeviation:(float *)a7
{
  id v12;
  NSObject *queue;
  id v14;
  _QWORD block[5];
  id v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  float *v21;
  float *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v12 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__MADTextEmbeddingCalibration_processEmbedding_version_typeSize_mean_standardDeviation___block_invoke;
  block[3] = &unk_1E6B197F0;
  block[4] = self;
  v17 = v12;
  v18 = &v23;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v14 = v12;
  dispatch_sync(queue, block);
  LODWORD(a6) = *((_DWORD *)v24 + 6);

  _Block_object_dispose(&v23, 8);
  return (int)a6;
}

uint64_t __88__MADTextEmbeddingCalibration_processEmbedding_version_typeSize_mean_standardDeviation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_processEmbedding:version:typeSize:mean:standardDeviation:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_inputBuffer.value_);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 48) = 0;
  return self;
}

@end
