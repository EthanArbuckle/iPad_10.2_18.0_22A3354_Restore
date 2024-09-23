@implementation MADTextEmbeddingThreshold

+ (NSString)modelName
{
  return 0;
}

+ (unint64_t)embeddingVersion
{
  return 0;
}

+ (unint64_t)embeddingLength
{
  return 0;
}

+ (float)thresholdBase
{
  return 0.0;
}

- (MADTextEmbeddingThreshold)init
{
  MADTextEmbeddingThreshold *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MADTextEmbeddingThreshold;
  v2 = -[MADTextEmbeddingThreshold init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MADTextEmbeddingThreshold", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

+ (id)createForEmbeddingVersion:(unint64_t)a3
{
  int v3;
  __objc2_class *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3 == 5)
  {
    v4 = MADTextEmbeddingThresholdMD5;
    return objc_alloc_init(v4);
  }
  v3 = a3;
  if (a3 == 4)
  {
    v4 = MADTextEmbeddingThresholdMD4;
    return objc_alloc_init(v4);
  }
  if (a3 == 3)
  {
    v4 = MADTextEmbeddingThresholdMD3;
    return objc_alloc_init(v4);
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding version %d not supported", (uint8_t *)v6, 8u);
  }
  return 0;
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
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to destroy plan", buf, 2u);
  }
  if (espresso_context_destroy()
    && (int)MediaAnalysisLogLevel() >= 3
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to destroy context", buf, 2u);
  }
  v3.receiver = self;
  v3.super_class = (Class)MADTextEmbeddingThreshold;
  -[MADTextEmbeddingThreshold dealloc](&v3, sel_dealloc);
}

- (int)_createPlan
{
  void *plan;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int blob_dimensions;
  uint64_t v11;
  int64x2_t v12;
  int32x4_t v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  int64x2_t v23;
  int64x2_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  if (!plan)
    return -18;
  objc_msgSend(MEMORY[0x1E0CB34D0], "vcp_mediaAnalysisBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend((id)objc_opt_class(), "modelName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLWithString:relativeToURL:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "path");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "UTF8String");
  blob_dimensions = espresso_plan_add_network();

  if (!blob_dimensions)
  {
    blob_dimensions = espresso_plan_build();
    if (!blob_dimensions)
    {
      v23 = 0u;
      v24 = 0u;
      blob_dimensions = espresso_network_query_blob_dimensions();
      if (!blob_dimensions)
      {
        v11 = objc_msgSend((id)objc_opt_class(), "embeddingLength");
        v12 = vdupq_n_s64(1uLL);
        v13 = (int32x4_t)vceqq_s64(v24, v12);
        v12.i64[0] = v11;
        if ((vmaxv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v23, v12), v13))), 0xFuLL))) & 1) != 0)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218752;
            v16 = v23.i64[0];
            v17 = 2048;
            v18 = v23.i64[1];
            v19 = 2048;
            v20 = v24.i64[0];
            v21 = 2048;
            v22 = v24.i64[1];
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Input has unexpected dimension %zux%zux%zux%zu", buf, 0x2Au);
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
  size_t v6;
  __CVBuffer *value;
  uint8_t v9[8];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
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
        v4 = -[MADTextEmbeddingThreshold _createPlan](self, "_createPlan");
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
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to create ANE context", v9, 2u);
      }
      return -18;
    }
    return v4;
  }
  v10 = *MEMORY[0x1E0CA8FF0];
  v11[0] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "embeddingLength");
  value = self->_inputBuffer.value_;
  if (value)
  {
    CFRelease(value);
    self->_inputBuffer.value_ = 0;
  }
  v4 = CVPixelBufferCreate(0, v6, 1uLL, 0x4C303068u, v5, &self->_inputBuffer.value_);
  if (!v4)
  {

    goto LABEL_2;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to create input buffer", v9, 2u);
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
  v5[2] = __42__MADTextEmbeddingThreshold_loadResources__block_invoke;
  v5[3] = &unk_1E6B158A0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__MADTextEmbeddingThreshold_loadResources__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_loadResources");
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (float)computeThresholdBase:(float)a3
{
  float v4;
  float v5;
  int v7;
  double v8;
  __int16 v9;
  double v10;
  __int16 v11;
  double v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = logf(a3);
  v5 = logf(1.0 - a3);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 134219008;
    v8 = a3;
    v9 = 2048;
    v10 = 1.0 - a3;
    v11 = 2048;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = (float)(v4 - v5);
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[Text|Threshold] Base: ln(%0.3f) - ln(%0.3f) = %0.6f - %0.6f = %0.6f", (uint8_t *)&v7, 0x34u);
  }
  return v4 - v5;
}

- (int)_processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6
{
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  __CVBuffer *value;
  void *BaseAddress;
  id v16;
  const void *v17;
  uint64_t v18;
  __CVBuffer *v19;
  __CVBuffer *v20;
  __CVBuffer *v21;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float *data;
  float v32;
  float v33;
  double v34;
  double v35;
  double v36;
  int v37;
  CVPixelBufferRef pixelBuffer;
  CVPixelBufferLockFlags unlockFlags;
  uint8_t buf[4];
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = -[MADTextEmbeddingThreshold _loadResources](self, "_loadResources");
  if (v11)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to load network", buf, 2u);
    }
    goto LABEL_27;
  }
  v12 = objc_msgSend(v10, "version");
  if (v12 != objc_msgSend((id)objc_opt_class(), "embeddingVersion"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "version"));
      v19 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = *(double *)&v19;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding version (%@) is not supported", buf, 0xCu);

    }
    goto LABEL_26;
  }
  if (objc_msgSend(v10, "type") != 1)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "type"));
      v20 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = *(double *)&v20;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding type (%@) is not supported", buf, 0xCu);

    }
    goto LABEL_26;
  }
  v13 = objc_msgSend(v10, "count");
  if (v13 != objc_msgSend((id)objc_opt_class(), "embeddingLength"))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v21 = (__CVBuffer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v41 = *(double *)&v21;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Embedding size (%@) is not supported", buf, 0xCu);

    }
LABEL_26:
    v11 = -50;
    goto LABEL_27;
  }
  value = self->_inputBuffer.value_;
  v37 = 0;
  pixelBuffer = value;
  unlockFlags = 0;
  if (value)
  {
    v11 = CVPixelBufferLockBaseAddress(value, 0);
    v37 = v11;
    if (!v11
      || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
      && (*(_DWORD *)buf = 134218240,
          v41 = *(double *)&pixelBuffer,
          v42 = 1024,
          LODWORD(v43) = v11,
          _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", buf, 0x12u), (v11 = v37) == 0))
    {
      BaseAddress = CVPixelBufferGetBaseAddress(self->_inputBuffer.value_);
      objc_msgSend(v10, "data");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v17 = (const void *)objc_msgSend(v16, "bytes");
      v18 = objc_msgSend((id)objc_opt_class(), "embeddingLength");
      memcpy(BaseAddress, v17, 2 * v18);

      v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v37);
      if (!v11)
      {
        v11 = espresso_plan_execute_sync();
        if (v11)
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[Text|Threshold] Failed to execute network", buf, 2u);
          }
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "thresholdBase");
          *a4 = *(float *)self->_biasBuffer.data;
          data = (float *)self->_scaleBuffer.data;
          v32 = *data;
          *a5 = *data;
          *a6 = (float)(v33 - *a4) / v32;
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v34 = *a4;
            v35 = *a5;
            v36 = *a6;
            *(_DWORD *)buf = 134218496;
            v41 = v34;
            v42 = 2048;
            v43 = v35;
            v44 = 2048;
            v45 = v36;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Bias: %0.3f  Scale: %0.3f  Threshold: %0.3f", buf, 0x20u);
          }
          v11 = 0;
        }
      }
    }
  }
  else
  {
    v23 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v23)
      -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);
    v11 = -50;
    v37 = -50;
  }
  if (pixelBuffer
    && !v37
    && CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags)
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[VCPImageExposurePreAnalyzer analyzePixelBuffer:flags:results:cancel:].cold.1();
  }
LABEL_27:

  return v11;
}

- (int)processEmbedding:(id)a3 bias:(float *)a4 scale:(float *)a5 threshold:(float *)a6
{
  id v10;
  NSObject *queue;
  id v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  float *v17;
  float *v18;
  float *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;

  v10 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__MADTextEmbeddingThreshold_processEmbedding_bias_scale_threshold___block_invoke;
  v14[3] = &unk_1E6B16CE8;
  v14[4] = self;
  v15 = v10;
  v16 = &v20;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v12 = v10;
  dispatch_sync(queue, v14);
  LODWORD(a5) = *((_DWORD *)v21 + 6);

  _Block_object_dispose(&v20, 8);
  return (int)a5;
}

uint64_t __67__MADTextEmbeddingThreshold_processEmbedding_bias_scale_threshold___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_processEmbedding:bias:scale:threshold:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
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
