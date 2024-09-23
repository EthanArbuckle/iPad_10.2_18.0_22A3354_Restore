@implementation MADVideoRemoveBackgroundCropTask

- (MADVideoRemoveBackgroundCropTask)initWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  MADVideoRemoveBackgroundCropTask *v22;
  MADVideoRemoveBackgroundCropTask *v23;
  void *v24;
  id progressHandler;
  void *v26;
  id resultHandler;
  void *v28;
  id completionHandler;
  id v31;
  id v32;
  id v33;
  objc_super v34;
  _QWORD aBlock[4];
  id v36;

  v33 = a3;
  v32 = a4;
  v31 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __143__MADVideoRemoveBackgroundCropTask_initWithAsset_previewRequest_generationRequest_cancelBlock_progressHandler_resultHandler_completionHandler___block_invoke;
  aBlock[3] = &unk_1E6B15F88;
  v20 = v19;
  v36 = v20;
  v21 = _Block_copy(aBlock);
  v34.receiver = self;
  v34.super_class = (Class)MADVideoRemoveBackgroundCropTask;
  v22 = -[VCPMABaseTask initWithCompletionHandler:](&v34, sel_initWithCompletionHandler_, v21);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_previewRequest, a4);
    objc_storeStrong((id *)&v23->_request, a5);
    objc_storeStrong((id *)&v23->_asset, a3);
    v24 = _Block_copy(v17);
    progressHandler = v23->_progressHandler;
    v23->_progressHandler = v24;

    v26 = _Block_copy(v18);
    resultHandler = v23->_resultHandler;
    v23->_resultHandler = v26;

    v28 = _Block_copy(v20);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = v28;

    -[VCPMABaseTask setCancelBlock:](v23, "setCancelBlock:", v16, v31, v32, v33);
  }

  return v23;
}

uint64_t __143__MADVideoRemoveBackgroundCropTask_initWithAsset_previewRequest_generationRequest_cancelBlock_progressHandler_resultHandler_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)taskWithAsset:(id)a3 previewRequest:(id)a4 generationRequest:(id)a5 cancelBlock:(id)a6 progressHandler:(id)a7 resultHandler:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAsset:previewRequest:generationRequest:cancelBlock:progressHandler:resultHandler:completionHandler:", v14, v15, v16, v17, v18, v19, v20);

  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CEE040], "globalSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "releaseCachedResources");

  v4.receiver = self;
  v4.super_class = (Class)MADVideoRemoveBackgroundCropTask;
  -[VCPMABaseTask dealloc](&v4, sel_dealloc);
}

- (BOOL)cachesResources
{
  return 1;
}

- (BOOL)isCanceled
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[MADVideoRemoveBackgroundRequest stickerIdentifiers](self->_request, "stickerIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)MADVideoRemoveBackgroundCropTask;
    v4 = -[VCPMABaseTask isCanceled](&v6, sel_isCanceled);
  }

  return v4;
}

- (BOOL)validateRequest:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MADVideoRemoveBackgroundRequest **p_request;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  _QWORD v39[2];
  CGPoint v40;
  CGRect v41;

  v39[1] = *MEMORY[0x1E0C80C00];
  -[MADVideoRemoveBackgroundRequest maxDimension](self->_request, "maxDimension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MADVideoRemoveBackgroundRequest minDimension](self->_request, "minDimension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MADVideoRemoveBackgroundRequest maxDimension](self->_request, "maxDimension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");
      -[MADVideoRemoveBackgroundRequest minDimension](self->_request, "minDimension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "integerValue");

      if (v8 < v10)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0CB2D50];
        v12 = (void *)MEMORY[0x1E0CB3940];
        p_request = &self->_request;
        -[MADVideoRemoveBackgroundRequest minDimension](self->_request, "minDimension");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MADVideoRemoveBackgroundRequest maxDimension](*p_request, "maxDimension");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("Invalid request - min dimension (%@) exceeds max dimension (%@)"), v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *a3;
        *a3 = v18;

        goto LABEL_14;
      }
    }
    else
    {

    }
  }
  -[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20
    && (-[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_msgSend(v21, "unsignedIntegerValue"),
        v21,
        v20,
        !v22))
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v33 = (void *)MEMORY[0x1E0CB3940];
    -[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Invalid request - max file size (%@) must be greater than zero"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MADVideoRemoveBackgroundRequest instancePoint](self->_request, "instancePoint");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
      return 1;
    -[MADVideoRemoveBackgroundRequest instancePoint](self->_request, "instancePoint");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "pointValue");
    v40.x = v25;
    v40.y = v26;
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = 1.0;
    v41.size.height = 1.0;
    v27 = CGRectContainsPoint(v41, v40);

    if (v27)
      return 1;
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v34 = *MEMORY[0x1E0CB2D50];
    v30 = (void *)MEMORY[0x1E0CB3940];
    -[MADVideoRemoveBackgroundRequest instancePoint](self->_request, "instancePoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Invalid request - instance point (%@) outside of unit rect"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = *a3;
  *a3 = v31;
LABEL_14:

  return 0;
}

- (id)decodeSettingsForTrack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  _DWORD v18[2];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E6B72A28, *MEMORY[0x1E0CA9040]);
  -[MADVideoRemoveBackgroundRequest maxDimension](self->_request, "maxDimension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MADVideoRemoveBackgroundRequest maxDimension](self->_request, "maxDimension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v4, "naturalSize");
    v12 = v10 >= v11 ? v10 : v11;
    if (v9 < v12)
    {
      v13 = ((unint64_t)(v10 * (v9 / v12)) + 1) & 0xFFFFFFFFFFFFFFFELL;
      v14 = ((unint64_t)(v11 * (v9 / v12)) + 1) & 0xFFFFFFFFFFFFFFFELL;
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v18[0] = 67109376;
        v18[1] = v13;
        v19 = 1024;
        v20 = v14;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Scaling decode to %dx%d", (uint8_t *)v18, 0xEu);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CA90E0]);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CA8FD8]);

    }
  }

  return v5;
}

- (id)decodeSamplesUntilTime:(id *)a3 trackOutput:(id)a4 baseTime:(id *)a5 progress:(id)a6 error:(id *)a7
{
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  CMTimeValue v16;
  CMTimeScale timescale;
  int64_t var0;
  int var1;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  int v28;
  void *v29;
  opaqueCMSampleBuffer *v30;
  CMTime *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  opaqueCMSampleBuffer *value;
  void *v38;
  id v39;
  void *v41;
  int64_t v43;
  id v44;
  void *v45;
  CMTime v46;
  CMSampleBufferRef originalSBuf;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v48;
  CMTime rhs;
  uint64_t v50;
  void *v51;
  _BYTE lhs[28];
  __int16 v53;
  CMTimeScale v54;
  CMSampleTimingInfo buf;
  uint64_t v56;
  _QWORD v57[4];

  v57[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v44 = a6;
  v45 = v11;
  objc_msgSend(v11, "track");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *a3;
  objc_msgSend(v12, "makeSampleCursorWithPresentationTimeStamp:", &v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v14 = MEMORY[0x1E0C81028];
    v15 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (v13)
      {
        objc_msgSend(v13, "presentationTimeStamp");
        v16 = *(_QWORD *)lhs;
        objc_msgSend(v13, "presentationTimeStamp");
        timescale = rhs.timescale;
      }
      else
      {
        timescale = 0;
        v16 = 0;
        memset(lhs, 0, 24);
        memset(&rhs, 0, sizeof(rhs));
      }
      var0 = a3->var0;
      var1 = a3->var1;
      LODWORD(buf.duration.value) = 134218752;
      *(CMTimeValue *)((char *)&buf.duration.value + 4) = v16;
      LOWORD(buf.duration.flags) = 1024;
      *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = timescale;
      WORD1(buf.duration.epoch) = 2048;
      *(CMTimeEpoch *)((char *)&buf.duration.epoch + 4) = var0;
      WORD2(buf.presentationTimeStamp.value) = 1024;
      *(_DWORD *)((char *)&buf.presentationTimeStamp.value + 6) = var1;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Decoding until %lld/%d (mask time: %lld/%d)", (uint8_t *)&buf, 0x22u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a5->var0;
  v20 = *MEMORY[0x1E0CB2F90];
  v21 = *MEMORY[0x1E0CB2D50];
  do
  {
    v22 = (void *)MEMORY[0x1BCCA1B2C]();
    if (-[MADVideoRemoveBackgroundCropTask isCanceled](self, "isCanceled"))
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v56 = v21;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request canceled"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v20, -128, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *a7;
      *a7 = v26;

      v28 = 1;
      goto LABEL_37;
    }
    v29 = v13;
    v30 = (opaqueCMSampleBuffer *)objc_msgSend(v45, "copyNextSampleBuffer");
    originalSBuf = v30;
    if (v30)
    {
      memset(&v46, 0, sizeof(v46));
      CMSampleBufferGetPresentationTimeStamp(&v46, v30);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LODWORD(buf.duration.value) = 134218240;
        *(CMTimeValue *)((char *)&buf.duration.value + 4) = v46.value;
        LOWORD(buf.duration.flags) = 1024;
        *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = v46.timescale;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Decoded %lld/%d", (uint8_t *)&buf, 0x12u);
      }
      if (v43)
      {
        memset(&buf.presentationTimeStamp, 0, 48);
        v31 = (CMTime *)MEMORY[0x1E0CA2E18];
        *(_OWORD *)&buf.duration.value = *MEMORY[0x1E0CA2E18];
        buf.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
        *(CMTime *)lhs = v46;
        rhs = (CMTime)*a5;
        CMTimeSubtract(&buf.presentationTimeStamp, (CMTime *)lhs, &rhs);
        buf.decodeTimeStamp = *v31;
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)lhs = 134218752;
          *(_QWORD *)&lhs[4] = v46.value;
          *(_WORD *)&lhs[12] = 1024;
          *(_DWORD *)&lhs[14] = v46.timescale;
          *(_WORD *)&lhs[18] = 2048;
          *(_QWORD *)&lhs[20] = buf.presentationTimeStamp.value;
          v53 = 1024;
          v54 = buf.presentationTimeStamp.timescale;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Adjusting time %lld/%d --> %lld/%d", lhs, 0x22u);
        }
        rhs.value = 0;
        if (CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &buf, (CMSampleBufferRef *)&rhs))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)lhs = 134218240;
            *(_QWORD *)&lhs[4] = v46.value;
            *(_WORD *)&lhs[12] = 1024;
            *(_DWORD *)&lhs[14] = v46.timescale;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] Failed to adjust sample timing (%lld/%d)", lhs, 0x12u);
          }
          v32 = (void *)MEMORY[0x1E0CB35C8];
          v50 = v21;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to adjust sample timing (%lld/%d)"), v46.value, v46.timescale);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v33;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "errorWithDomain:code:userInfo:", v20, -18, v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = *a7;
          *a7 = v35;

          CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
          v28 = 1;
          goto LABEL_36;
        }
        value = (opaqueCMSampleBuffer *)rhs.value;
        v29 = v13;
        if (rhs.value)
          value = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)rhs.value);
        *(_QWORD *)lhs = value;
        if (originalSBuf)
        {
          CFRelease(originalSBuf);
          value = *(opaqueCMSampleBuffer **)lhs;
        }
        originalSBuf = value;
        *(_QWORD *)lhs = 0;
        CF<opaqueCMSampleBuffer *>::~CF((const void **)lhs);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
      }
      objc_msgSend(v41, "addObject:", originalSBuf);
      objc_msgSend(v44, "setCompletedUnitCount:", objc_msgSend(v44, "completedUnitCount") + 1);
      if (v29)
        objc_msgSend(v29, "presentationTimeStamp");
      else
        memset(&rhs, 0, sizeof(rhs));
      buf.duration = v46;
      *(CMTime *)lhs = rhs;
      if (CMTimeCompare(&buf.duration, (CMTime *)lhs) >= 0)
        v28 = 5;
      else
        v28 = 0;
    }
    else
    {
      v28 = 5;
    }
LABEL_36:
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&originalSBuf);
LABEL_37:
    objc_autoreleasePoolPop(v22);
  }
  while (!v28);
  if (v28 == 5)
  {
    v38 = v41;
    v39 = v41;
  }
  else
  {
    v39 = 0;
    v38 = v41;
  }

  return v39;
}

- (__CVBuffer)generateMaskForSampleBuffer:(opaqueCMSampleBuffer *)a3 orientation:(unsigned int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  char v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  __CVBuffer *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  __CVBuffer *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  unint64_t v58;
  __CFString *v59;
  __CFString *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  int Width;
  int Height;
  size_t BytesPerRow;
  _BYTE *BaseAddress;
  int v74;
  int v75;
  int v76;
  size_t v77;
  int v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  size_t v87;
  int v88;
  int v89;
  int v90;
  uint64_t i;
  int v92;
  uint64_t v93;
  __CVBuffer *v94;
  char v95;
  CVReturn v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  _BYTE *v101;
  int v102;
  int v103;
  int v104;
  void *v105;
  void *context;
  void *v107;
  id v108;
  id v109;
  uint64_t v110;
  void *v111;
  uint8_t v112[4];
  _BYTE v113[10];
  double v114;
  uint64_t v115;
  void *v116;
  uint8_t buf[4];
  _BYTE v118[12];
  uint64_t v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  void *v123;
  _QWORD v124[3];

  v6 = *(_QWORD *)&a4;
  v124[1] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCA1B2C](self, a2);
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Creating mask to seed tracking", buf, 2u);
  }
  +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMaskOnly:", 1);
  +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activateResource:", v9);
  v107 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0CEDF20]);
  objc_msgSend(v11, "setRevision:", 1);
  if (DeviceHasANE())
  {
    objc_msgSend(MEMORY[0x1E0CEDFC0], "defaultANEDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setProcessingDevice:", v12);

  }
  v13 = objc_alloc(MEMORY[0x1E0CEDF70]);
  objc_msgSend(v9, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithCMSampleBuffer:orientation:options:session:", a3, v6, MEMORY[0x1E0C9AA70], v14);

  VCPSignPostLog();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VNGenerateInstanceMaskRequest_PerformRequest", ", buf, 2u);
  }

  v124[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0;
  v21 = objc_msgSend(v15, "performRequests:error:", v20, &v109);
  v22 = v109;

  if ((v21 & 1) != 0)
  {
    VCPSignPostLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_END, v17, "VNGenerateInstanceMaskRequest_PerformRequest", ", buf, 2u);
    }

    objc_msgSend(v11, "results");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Video frame failed to produce a mask", buf, 2u);
      }
      v48 = (void *)MEMORY[0x1E0CB35C8];
      v122 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Video frame failed to produce a mask"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v123, &v122, 1);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = *a5;
      *a5 = v51;

      goto LABEL_45;
    }
    objc_msgSend(v26, "allInstances");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count") == 0;

    if (v28)
    {
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] No instances detected in video frame", buf, 2u);
      }
      v53 = (void *)MEMORY[0x1E0CB35C8];
      v120 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No instances detected in video frame"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v121 = v49;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = *a5;
      *a5 = v55;

      goto LABEL_45;
    }
    objc_msgSend(v26, "allInstances");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v29, "count") <= 1)
    {

    }
    else
    {
      -[MADVideoRemoveBackgroundRequest instancePoint](self->_request, "instancePoint");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v30 == 0;

      if (!v31)
      {
        -[MADVideoRemoveBackgroundRequest instancePoint](self->_request, "instancePoint");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "pointValue");
        v34 = v33;
        v36 = v35;

        v37 = (__CVBuffer *)objc_msgSend(v26, "instanceMask");
        v38 = (uint64_t)v37;
        *(_QWORD *)&v118[4] = v37;
        v119 = 1;
        if (!v37)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[MADVideoRemoveBackgroundCropTask generateMaskForSampleBuffer:orientation:error:].cold.1();
          *(_DWORD *)buf = -50;
          goto LABEL_44;
        }
        v39 = CVPixelBufferLockBaseAddress(v37, 1uLL);
        *(_DWORD *)buf = v39;
        if ((_DWORD)v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[MADVideoRemoveBackgroundCropTask generateMaskForSampleBuffer:orientation:error:].cold.2(v38, v39, v40, v41, v42, v43, v44, v45);
LABEL_44:
          v64 = (void *)MEMORY[0x1E0CB35C8];
          v115 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to lock instance mask"));
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = v65;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = *a5;
          *a5 = v67;

          v49 = 0;
LABEL_45:
          v47 = 0;
LABEL_46:

          goto LABEL_47;
        }
        Width = CVPixelBufferGetWidth((CVPixelBufferRef)objc_msgSend(v26, "instanceMask"));
        Height = CVPixelBufferGetHeight((CVPixelBufferRef)objc_msgSend(v26, "instanceMask"));
        BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)objc_msgSend(v26, "instanceMask"));
        BaseAddress = CVPixelBufferGetBaseAddress((CVPixelBufferRef)objc_msgSend(v26, "instanceMask"));
        v74 = (int)(v34 * (double)(Width - 1));
        v75 = Width;
        v76 = (int)((1.0 - v36) * (double)(Height - 1));
        v104 = v74;
        v77 = BytesPerRow * v76 + v74;
        v78 = Height;
        v79 = BaseAddress[v77];
        if (BaseAddress[v77])
        {
          if ((int)MediaAnalysisLogLevel() < 5 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_81;
          *(_DWORD *)v112 = 67109632;
          *(_DWORD *)v113 = v79;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v104;
          LOWORD(v114) = 1024;
          *(_DWORD *)((char *)&v114 + 2) = v76;
          v80 = MEMORY[0x1E0C81028];
          v81 = "[RMBG] Selecting instance %d at location (%d, %d)";
        }
        else
        {
          v101 = BaseAddress;
          v102 = v78;
          v103 = v75;
          if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v112 = 67109376;
            *(_DWORD *)v113 = v104;
            *(_WORD *)&v113[4] = 1024;
            *(_DWORD *)&v113[6] = v76;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] No instance at (%d, %d), searching nearby", v112, 0xEu);
          }
          v82 = 0;
          v79 = 0;
          v83 = v102 - 50;
          if (v76 - 25 < v102 - 50)
            v83 = v76 - 25;
          if (v76 <= 25)
            v84 = 0;
          else
            v84 = v83;
          v85 = v103 - 50;
          if (v104 - 25 < v103 - 50)
            v85 = v104 - 25;
          if (v104 <= 25)
            v86 = 0;
          else
            v86 = v85;
          v87 = (size_t)&v101[BytesPerRow * v84 + v86];
          v88 = v84 - v76;
          v89 = v86 - v104;
          v90 = 0x7FFFFFFF;
          do
          {
            for (i = 0; i != 50; ++i)
            {
              v92 = (v88 + v82) * (v88 + v82) + (v89 + i) * (v89 + i);
              if (v92 >= v90)
                v93 = v79;
              else
                v93 = *(unsigned __int8 *)(v87 + i);
              if (v92 >= v90)
                v92 = v90;
              if (*(_BYTE *)(v87 + i))
              {
                v79 = v93;
                v90 = v92;
              }
            }
            ++v82;
            v87 += BytesPerRow;
          }
          while (v82 != 50);
          if (!v79)
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v112 = 134218240;
              *(double *)v113 = v34;
              *(_WORD *)&v113[8] = 2048;
              v114 = v36;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] No instances near specified point (%0.2f, %0.2f)", v112, 0x16u);
            }
            v97 = (void *)MEMORY[0x1E0CB35C8];
            v110 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No instances near specified point (%0.2f, %0.2f)"), *(_QWORD *)&v34, *(_QWORD *)&v36);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v105;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = (__CVBuffer *)v38;
            objc_msgSend(v97, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v98);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = *a5;
            *a5 = v99;

            v95 = 0;
            v49 = 0;
LABEL_82:
            v96 = CVPixelBufferUnlockBaseAddress(v94, 1uLL);
            if (v96 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v112 = 134218240;
              *(_QWORD *)v113 = v94;
              *(_WORD *)&v113[8] = 1024;
              LODWORD(v114) = v96;
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unlock CVPixelBuffer (%p, %d)", v112, 0x12u);
            }
            if ((v95 & 1) == 0)
              goto LABEL_45;
LABEL_37:
            v108 = v22;
            v47 = (__CVBuffer *)objc_msgSend(v26, "createMaskForInstances:error:", v49, &v108);
            v61 = v108;

            if (v47)
            {
              objc_msgSend(v107, "reset");
            }
            else
            {
              v62 = (void *)objc_msgSend(v61, "copy");
              v63 = *a5;
              *a5 = v62;

              v47 = 0;
            }
            v22 = v61;
            goto LABEL_46;
          }
          if ((int)MediaAnalysisLogLevel() < 5 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
LABEL_81:
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v79);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = (__CVBuffer *)v38;
            v95 = 1;
            goto LABEL_82;
          }
          *(_DWORD *)v112 = 67109632;
          *(_DWORD *)v113 = v79;
          *(_WORD *)&v113[4] = 1024;
          *(_DWORD *)&v113[6] = v104;
          LOWORD(v114) = 1024;
          *(_DWORD *)((char *)&v114 + 2) = v76;
          v80 = MEMORY[0x1E0C81028];
          v81 = "[RMBG] Selecting instance %d near location (%d, %d)";
        }
        _os_log_impl(&dword_1B6C4A000, v80, OS_LOG_TYPE_DEFAULT, v81, v112, 0x14u);
        goto LABEL_81;
      }
    }
    objc_msgSend(v26, "allInstances");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "count");
    v59 = CFSTR("only instance");
    if (v58 > 1)
      v59 = CFSTR("all instances");
    v60 = v59;

    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v118 = v60;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Selecting %@", buf, 0xCu);
    }
    objc_msgSend(v26, "allInstances");
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_37;
  }
  v46 = (void *)objc_msgSend(v22, "copy");
  v47 = 0;
  v26 = *a5;
  *a5 = v46;
LABEL_47:

  objc_autoreleasePoolPop(context);
  return v47;
}

- (CGRect)scaleNormalizedCropRect:(CGRect)a3 forPixelBuffer:(__CVBuffer *)a4
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v9;
  CGRect v10;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (double)CVPixelBufferGetWidth(a4);
  v12.size.height = (double)CVPixelBufferGetHeight(a4);
  v10.origin.x = round(x * v9);
  v10.origin.y = round((1.0 - y - height) * v12.size.height);
  v10.size.width = round(width * v9);
  v10.size.height = round(height * v12.size.height);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = v9;
  return CGRectIntersection(v10, v12);
}

- (id)processPastSampleBuffers:(id)a3 orientation:(unsigned int)a4 maskPixelBuffer:(__CVBuffer *)a5 cropUnion:(CGRect *)a6 progress:(id)a7 error:(id *)a8
{
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  os_signpost_id_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  char v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  float v35;
  double v36;
  double v37;
  double v38;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  MADMattedFullFrame *v51;
  uint64_t v52;
  float v53;
  MADMattedFullFrame *v54;
  void *v55;
  void *v56;
  id v57;
  void *context;
  MADConfidenceTracker *v60;
  void *v61;
  id v63;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  __int128 v70;
  uint64_t v71;
  id v72;
  CMTime v73;
  __int128 v74;
  uint64_t v75;
  _BYTE buf[48];
  void *v77;
  uint64_t v78;
  _QWORD v79[3];
  CGRect v80;
  CGRect v81;

  v79[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v63 = a7;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  +[MADVideoRemoveBackgroundResource sharedResource](MADVideoRemoveBackgroundResource, "sharedResource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "session");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0;
  v74 = kMaskUpdateInterval;
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE058]), "initWithFrameUpdateSpacing:mask:completionHandler:", &v74, a5, 0);
  objc_msgSend(v68, "setGenerateCropRect:", 1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_alloc_init(MADConfidenceTracker);
  v13 = MEMORY[0x1E0C81028];
  v65 = *MEMORY[0x1E0CB2F90];
  v66 = *MEMORY[0x1E0CB2D50];
  do
  {
    if (!objc_msgSend(v11, "count"))
      goto LABEL_35;
    v14 = (void *)MEMORY[0x1BCCA1B2C]();
    if (-[MADVideoRemoveBackgroundCropTask isCanceled](self, "isCanceled"))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v78 = v66;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request canceled"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, &v78, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v65, -128, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *a8;
      *a8 = v18;

      v20 = 1;
    }
    else
    {
      objc_msgSend(v11, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      memset(&v73, 0, sizeof(v73));
      CMSampleBufferGetPresentationTimeStamp(&v73, (CMSampleBufferRef)v21);
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&buf[4] = v73.value;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v73.timescale;
        _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_INFO, "[RMBG][BW] Tracking mask %lld/%d", buf, 0x12u);
      }
      v22 = objc_alloc(MEMORY[0x1E0CEDF70]);
      v23 = (void *)objc_msgSend(v22, "initWithCMSampleBuffer:orientation:options:session:", v21, a4, MEMORY[0x1E0C9AA70], v67);
      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_signpost_id_generate(v24);

      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v25, "VNTrackMaskRequest_PerformRequest", ", buf, 2u);
      }

      v77 = v68;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v29 = objc_msgSend(v23, "performRequests:error:", v28, &v72);
      v30 = v72;

      if ((v29 & 1) != 0)
      {
        VCPSignPostLog();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v32, OS_SIGNPOST_INTERVAL_END, v25, "VNTrackMaskRequest_PerformRequest", ", buf, 2u);
        }

        objc_msgSend(v68, "results");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          if (+[MADVideoRemoveBackgroundSettings visionTrimEnabled](MADVideoRemoveBackgroundSettings, "visionTrimEnabled")&& (objc_msgSend(v34, "confidence"), -[MADConfidenceTracker updateConfidence:](v60, "updateConfidence:", v35), v37 = v36, +[MADVideoRemoveBackgroundSettings visionTrimThreshold](MADVideoRemoveBackgroundSettings, "visionTrimThreshold"), v37 < v38))
          {
            if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              *(_QWORD *)&buf[4] = v73.value;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v73.timescale;
              _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_DEFAULT, "[RMBG][BW] Confidence below threshold (%lld/%d), trimming", buf, 0x12u);
            }
            objc_msgSend(v11, "removeAllObjects");
            v20 = 3;
          }
          else
          {
            x = a6->origin.x;
            y = a6->origin.y;
            width = a6->size.width;
            height = a6->size.height;
            objc_msgSend(v34, "croppedBoundingBox");
            -[MADVideoRemoveBackgroundCropTask scaleNormalizedCropRect:forPixelBuffer:](self, "scaleNormalizedCropRect:forPixelBuffer:", objc_msgSend(v34, "pixelBuffer"), v43, v44, v45, v46);
            v81.origin.x = v47;
            v81.origin.y = v48;
            v81.size.width = v49;
            v81.size.height = v50;
            v80.origin.x = x;
            v80.origin.y = y;
            v80.size.width = width;
            v80.size.height = height;
            *a6 = CGRectUnion(v80, v81);
            v51 = [MADMattedFullFrame alloc];
            v52 = objc_msgSend(v34, "pixelBuffer");
            objc_msgSend(v34, "timeRange");
            v70 = *(_OWORD *)buf;
            v71 = *(_QWORD *)&buf[16];
            objc_msgSend(v34, "confidence");
            v54 = -[MADMattedFullFrame initWithPixelBuffer:presentationTimestamp:confidence:](v51, "initWithPixelBuffer:presentationTimestamp:confidence:", v52, &v70, v53);
            objc_msgSend(v61, "addObject:", v54);

            objc_msgSend(v11, "removeLastObject");
            objc_msgSend(v63, "setCompletedUnitCount:", objc_msgSend(v63, "completedUnitCount") + 1);
            v20 = 0;
          }
        }
        else
        {
          if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&buf[4] = v73.value;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v73.timescale;
            _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_DEFAULT, "[RMBG][BW] No observation at time %lld/%d", buf, 0x12u);
          }
          v20 = 2;
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v30, "description");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v55;
          _os_log_impl(&dword_1B6C4A000, v13, OS_LOG_TYPE_ERROR, "[RMBG][BW] VNTrackMaskRequest failed (%@)", buf, 0xCu);

        }
        v56 = (void *)objc_msgSend(v30, "copy");
        v34 = *a8;
        *a8 = v56;
        v20 = 1;
      }

    }
    objc_autoreleasePoolPop(v14);
  }
  while (!v20 || v20 == 2);
  if (v20 == 3)
  {
LABEL_35:
    v57 = v61;
    goto LABEL_37;
  }
  v57 = 0;
LABEL_37:

  objc_autoreleasePoolPop(context);
  return v57;
}

- (BOOL)exportPastSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t v47[8];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  int v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = a4;
  v40 = a5;
  v11 = *MEMORY[0x1E0CB2F90];
  v42 = *MEMORY[0x1E0CB2D50];
  do
  {
    v12 = objc_msgSend(v10, "count");
    if (!v12)
      break;
    v13 = (void *)MEMORY[0x1BCCA1B2C]();
    if (-[MADVideoRemoveBackgroundCropTask isCanceled](self, "isCanceled"))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v56 = v42;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request canceled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v11, -128, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a6;
      *a6 = v17;

    }
    else
    {
      objc_msgSend(v10, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v19 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          if (v15)
          {
            objc_msgSend(v15, "presentationTimestamp");
            v21 = *(_QWORD *)v47;
            objc_msgSend(v15, "presentationTimestamp");
            v22 = v45;
          }
          else
          {
            v22 = 0;
            v21 = 0;
            *(_QWORD *)v47 = 0;
            v48 = 0;
            v49 = 0;
            v44 = 0;
            v45 = 0;
            v46 = 0;
          }
          *(_DWORD *)buf = 134218240;
          v53 = v21;
          v54 = 1024;
          v55 = v22;
          v19 = MEMORY[0x1E0C81028];
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Encoding %lld/%d", buf, 0x12u);
        }

      }
      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_generate(v23);

      VCPSignPostLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "MADVideoRemoveBackground_ExportFrame", ", v47, 2u);
      }

      v27 = objc_msgSend(v15, "pixelBuffer");
      if (v15)
        objc_msgSend(v15, "presentationTimestamp");
      else
        memset(v43, 0, sizeof(v43));
      if (!objc_msgSend(v41, "addPixelBuffer:withTime:", v27, v43))
      {
        VCPSignPostLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)v47 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_END, v24, "MADVideoRemoveBackground_ExportFrame", ", v47, 2u);
        }

        objc_msgSend(v10, "removeLastObject");
        objc_msgSend(v40, "setCompletedUnitCount:", objc_msgSend(v40, "completedUnitCount") + 1);
        v34 = 1;
        goto LABEL_28;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v50 = v42;
      v29 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
      {
        objc_msgSend(v15, "presentationTimestamp");
        v30 = *(_QWORD *)v47;
        objc_msgSend(v15, "presentationTimestamp");
        v31 = v45;
      }
      else
      {
        v31 = 0;
        v30 = 0;
        *(_QWORD *)v47 = 0;
        v48 = 0;
        v49 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
      }
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to export matted frame (%lld/%d)"), v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v11, -18, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *a6;
      *a6 = v37;

    }
    v34 = 0;
LABEL_28:

    objc_autoreleasePoolPop(v13);
  }
  while ((v34 & 1) != 0);

  return v12 == 0;
}

- (id)processFutureSamplesFromTrackOutput:(id)a3 baseTime:(id *)a4 orientation:(unsigned int)a5 maskSampleBuffer:(opaqueCMSampleBuffer *)a6 maskPixelBuffer:(__CVBuffer *)a7 cropUnion:(CGRect *)a8 endTime:(id *)a9 progress:(id)a10 error:(id *)a11
{
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  int v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  int v35;
  opaqueCMSampleBuffer *v36;
  CMTime *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  opaqueCMSampleBuffer *value;
  id v44;
  void *v45;
  NSObject *v46;
  os_signpost_id_t v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  char v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  float v57;
  double v58;
  double v59;
  double v60;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  MADMattedFullFrame *v73;
  uint64_t v74;
  float v75;
  MADMattedFullFrame *v76;
  void *v77;
  NSObject *v78;
  id v79;
  MADConfidenceTracker *v81;
  void *v82;
  void *context;
  int64_t var0;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  CMTime v94;
  id v95;
  CMTime presentationTimeStamp;
  CMSampleBufferRef originalSBuf;
  id v98;
  __int128 v99;
  uint64_t v100;
  CMTime rhs;
  void *v102;
  uint64_t v103;
  void *v104;
  _BYTE lhs[28];
  __int16 v106;
  CMTimeScale timescale;
  CMSampleTimingInfo buf;
  uint64_t v109;
  void *v110;
  _QWORD v111[4];
  CGRect v112;
  CGRect v113;

  v111[1] = *MEMORY[0x1E0C80C00];
  v90 = a3;
  v93 = a10;
  context = (void *)MEMORY[0x1BCCA1B2C]();
  +[MADVideoRemoveBackgroundResource sharedResource](MADVideoRemoveBackgroundResource, "sharedResource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "session");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = 0;
  v99 = kMaskUpdateInterval;
  v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEE058]), "initWithFrameUpdateSpacing:mask:completionHandler:", &v99, a7, 0);
  v15 = (void *)MEMORY[0x1BCCA1B2C](objc_msgSend(v89, "setGenerateCropRect:", 1));
  v16 = objc_alloc(MEMORY[0x1E0CEDF70]);
  v17 = (void *)objc_msgSend(v16, "initWithCMSampleBuffer:orientation:options:session:", a6, a5, MEMORY[0x1E0C9AA70], v88);
  VCPSignPostLog();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  VCPSignPostLog();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    LOWORD(buf.duration.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "VNTrackMaskRequest_PerformRequest", ", (uint8_t *)&buf, 2u);
  }

  v111[0] = v89;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0;
  v23 = objc_msgSend(v17, "performRequests:error:", v22, &v98);
  v24 = v98;

  if ((v23 & 1) != 0)
  {
    VCPSignPostLog();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      LOWORD(buf.duration.value) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_END, v19, "VNTrackMaskRequest_PerformRequest", ", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    v27 = (void *)objc_msgSend(v24, "copy");
    v26 = *a11;
    *a11 = v27;
  }

  objc_autoreleasePoolPop(v15);
  v28 = v89;
  if (!v23)
  {
    v79 = 0;
    goto LABEL_64;
  }
  var0 = a4->var0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_alloc_init(MADConfidenceTracker);
  v91 = *MEMORY[0x1E0CB2F90];
  v92 = *MEMORY[0x1E0CB2D50];
  do
  {
    v29 = (void *)MEMORY[0x1BCCA1B2C]();
    if (!-[MADVideoRemoveBackgroundCropTask isCanceled](self, "isCanceled"))
    {
      v36 = (opaqueCMSampleBuffer *)objc_msgSend(v90, "copyNextSampleBuffer");
      originalSBuf = v36;
      if (v36)
      {
        memset(&presentationTimeStamp, 0, sizeof(presentationTimeStamp));
        CMSampleBufferGetPresentationTimeStamp(&presentationTimeStamp, v36);
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.duration.value) = 134218240;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
          LOWORD(buf.duration.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG][FW] Decoded %lld/%d", (uint8_t *)&buf, 0x12u);
        }
        objc_msgSend(v93, "setCompletedUnitCount:", objc_msgSend(v93, "completedUnitCount") + 1);
        if (var0)
        {
          memset(&buf.presentationTimeStamp, 0, 48);
          v37 = (CMTime *)MEMORY[0x1E0CA2E18];
          *(_OWORD *)&buf.duration.value = *MEMORY[0x1E0CA2E18];
          buf.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          *(CMTime *)lhs = presentationTimeStamp;
          rhs = (CMTime)*a4;
          CMTimeSubtract(&buf.presentationTimeStamp, (CMTime *)lhs, &rhs);
          buf.decodeTimeStamp = *v37;
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)lhs = 134218752;
            *(_QWORD *)&lhs[4] = presentationTimeStamp.value;
            *(_WORD *)&lhs[12] = 1024;
            *(_DWORD *)&lhs[14] = presentationTimeStamp.timescale;
            *(_WORD *)&lhs[18] = 2048;
            *(_QWORD *)&lhs[20] = buf.presentationTimeStamp.value;
            v106 = 1024;
            timescale = buf.presentationTimeStamp.timescale;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG][FW] Adjusting time %lld/%d --> %lld/%d", lhs, 0x22u);
          }
          rhs.value = 0;
          if (CMSampleBufferCreateCopyWithNewTiming(0, originalSBuf, 1, &buf, (CMSampleBufferRef *)&rhs))
          {
            if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)lhs = 134218240;
              *(_QWORD *)&lhs[4] = presentationTimeStamp.value;
              *(_WORD *)&lhs[12] = 1024;
              *(_DWORD *)&lhs[14] = presentationTimeStamp.timescale;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG][FW] Failed to adjust sample timing (%lld/%d)", lhs, 0x12u);
            }
            v38 = (void *)MEMORY[0x1E0CB35C8];
            v103 = v92;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to adjust sample timing (%lld/%d)"), presentationTimeStamp.value, presentationTimeStamp.timescale);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v104 = v39;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorWithDomain:code:userInfo:", v91, -18, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = *a11;
            *a11 = v41;

            CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
            v35 = 1;
            goto LABEL_56;
          }
          value = (opaqueCMSampleBuffer *)rhs.value;
          if (rhs.value)
            value = (opaqueCMSampleBuffer *)CFRetain((CFTypeRef)rhs.value);
          *(_QWORD *)lhs = value;
          if (originalSBuf)
          {
            CFRelease(originalSBuf);
            value = *(opaqueCMSampleBuffer **)lhs;
          }
          originalSBuf = value;
          *(_QWORD *)lhs = 0;
          CF<opaqueCMSampleBuffer *>::~CF((const void **)lhs);
          presentationTimeStamp = buf.presentationTimeStamp;
          CF<opaqueCMSampleBuffer *>::~CF((const void **)&rhs);
        }
        if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          LODWORD(buf.duration.value) = 134218240;
          *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
          LOWORD(buf.duration.flags) = 1024;
          *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG][FW] Tracking mask %lld/%d", (uint8_t *)&buf, 0x12u);
        }
        v44 = objc_alloc(MEMORY[0x1E0CEDF70]);
        v45 = (void *)objc_msgSend(v44, "initWithCMSampleBuffer:orientation:options:session:", originalSBuf, a5, MEMORY[0x1E0C9AA70], v88);
        VCPSignPostLog();
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = os_signpost_id_generate(v46);

        VCPSignPostLog();
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = v48;
        if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
        {
          LOWORD(buf.duration.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v49, OS_SIGNPOST_INTERVAL_BEGIN, v47, "VNTrackMaskRequest_PerformRequest", ", (uint8_t *)&buf, 2u);
        }

        v102 = v89;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v102, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0;
        v51 = objc_msgSend(v45, "performRequests:error:", v50, &v95);
        v52 = v95;

        if ((v51 & 1) != 0)
        {
          VCPSignPostLog();
          v53 = objc_claimAutoreleasedReturnValue();
          v54 = v53;
          if (v47 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
          {
            LOWORD(buf.duration.value) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v54, OS_SIGNPOST_INTERVAL_END, v47, "VNTrackMaskRequest_PerformRequest", ", (uint8_t *)&buf, 2u);
          }

          objc_msgSend(v89, "results");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "firstObject");
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          {
            objc_msgSend(v93, "setCompletedUnitCount:", objc_msgSend(v93, "completedUnitCount") + 1);
            if (+[MADVideoRemoveBackgroundSettings visionTrimEnabled](MADVideoRemoveBackgroundSettings, "visionTrimEnabled")&& (objc_msgSend(v56, "confidence"), -[MADConfidenceTracker updateConfidence:](v81, "updateConfidence:", v57), v59 = v58, +[MADVideoRemoveBackgroundSettings visionTrimThreshold](MADVideoRemoveBackgroundSettings, "visionTrimThreshold"), v59 < v60))
            {
              if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.duration.value) = 134218240;
                *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
                LOWORD(buf.duration.flags) = 1024;
                *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG][FW] Confidence below threshold (%lld/%d), trimming", (uint8_t *)&buf, 0x12u);
              }
              *(CMTime *)a9 = presentationTimeStamp;
              v35 = 5;
            }
            else
            {
              x = a8->origin.x;
              y = a8->origin.y;
              width = a8->size.width;
              height = a8->size.height;
              objc_msgSend(v56, "croppedBoundingBox");
              -[MADVideoRemoveBackgroundCropTask scaleNormalizedCropRect:forPixelBuffer:](self, "scaleNormalizedCropRect:forPixelBuffer:", objc_msgSend(v56, "pixelBuffer"), v65, v66, v67, v68);
              v113.origin.x = v69;
              v113.origin.y = v70;
              v113.size.width = v71;
              v113.size.height = v72;
              v112.origin.x = x;
              v112.origin.y = y;
              v112.size.width = width;
              v112.size.height = height;
              *a8 = CGRectUnion(v112, v113);
              v73 = [MADMattedFullFrame alloc];
              v74 = objc_msgSend(v56, "pixelBuffer");
              v94 = presentationTimeStamp;
              objc_msgSend(v56, "confidence");
              v76 = -[MADMattedFullFrame initWithPixelBuffer:presentationTimestamp:confidence:](v73, "initWithPixelBuffer:presentationTimestamp:confidence:", v74, &v94, v75);
              objc_msgSend(v82, "addObject:", v76);

              v35 = 0;
            }
          }
          else
          {
            if ((int)MediaAnalysisLogLevel() >= 4)
            {
              v78 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.duration.value) = 134218240;
                *(CMTimeValue *)((char *)&buf.duration.value + 4) = presentationTimeStamp.value;
                LOWORD(buf.duration.flags) = 1024;
                *(CMTimeFlags *)((char *)&buf.duration.flags + 2) = presentationTimeStamp.timescale;
                _os_log_impl(&dword_1B6C4A000, v78, OS_LOG_TYPE_DEFAULT, "[RMBG][FW] No observation at time %lld/%d", (uint8_t *)&buf, 0x12u);
              }
            }
            v35 = 4;
          }
        }
        else
        {
          v77 = (void *)objc_msgSend(v52, "copy");
          v56 = *a11;
          *a11 = v77;
          v35 = 1;
        }

        goto LABEL_56;
      }
      v35 = 5;
LABEL_56:
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&originalSBuf);
      goto LABEL_57;
    }
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v109 = v92;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request canceled"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", v91, -128, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *a11;
    *a11 = v33;

    v35 = 1;
LABEL_57:
    objc_autoreleasePoolPop(v29);
  }
  while (!v35 || v35 == 4);
  if (v35 == 5)
    v79 = v82;
  else
    v79 = 0;

  v28 = v89;
LABEL_64:

  objc_autoreleasePoolPop(context);
  return v79;
}

- (BOOL)isAnimatedStickerPreferredWithPastSamples:(id)a3 futureSamples:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  uint64_t v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  _BOOL4 v21;
  uint64_t i;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  _DWORD v29[2];
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = +[MADVideoRemoveBackgroundSettings visionTrimWindow](MADVideoRemoveBackgroundSettings, "visionTrimWindow");
  v8 = objc_msgSend(v5, "count");
  if (objc_msgSend(v6, "count") + v8 <= 2 * v7)
  {
    LOBYTE(v21) = 0;
  }
  else
  {
    +[MADVideoRemoveBackgroundSettings visionPreferredVideoQualityThreshold](MADVideoRemoveBackgroundSettings, "visionPreferredVideoQualityThreshold");
    v10 = v9;
    +[MADVideoRemoveBackgroundSettings visionPreferredLowQualityProportionThreshold](MADVideoRemoveBackgroundSettings, "visionPreferredLowQualityProportionThreshold");
    v12 = v11;
    +[MADVideoRemoveBackgroundSettings visionPreferredWorstFrameScoreThreshold](MADVideoRemoveBackgroundSettings, "visionPreferredWorstFrameScoreThreshold");
    v14 = v13;
    v15 = 0;
    v16 = 0;
    v17 = 1.0;
    while (v7 + v16 < objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "confidence");
      v20 = v19;

      if (v20 < v17)
        v17 = v20;
      if (v20 < v10)
        ++v15;
      ++v16;
    }
    for (i = 0; v7 + i < objc_msgSend(v6, "count"); ++i)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", i);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "confidence");
      v25 = v24;

      if (v25 < v17)
        v17 = v25;
      if (v25 < v10)
        ++v15;
    }
    v26 = objc_msgSend(v5, "count");
    v27 = (double)v15 / (double)(unint64_t)(objc_msgSend(v6, "count") + v26);
    v21 = v27 <= v12 && v17 >= v14;
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v29[0] = 67110400;
      v29[1] = v21;
      v30 = 2048;
      v31 = v27;
      v32 = 2048;
      v33 = v10;
      v34 = 2048;
      v35 = v12;
      v36 = 2048;
      v37 = v17;
      v38 = 2048;
      v39 = v14;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Vision Preferred: %d - low quality proportion: %0.3f (th_v: %0.3f, th_prop: %0.3f), worst frame score: %0.3f (th_wfs: %0.3f)", (uint8_t *)v29, 0x3Au);
    }
  }

  return v21;
}

- (BOOL)exportFutureSamples:(id)a3 sequenceWriter:(id)a4 progress:(id)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  int v22;
  NSObject *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v40;
  id v41;
  uint64_t v42;
  _QWORD v43[3];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t v47[8];
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  int v55;
  uint64_t v56;
  _QWORD v57[3];

  v57[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v41 = a4;
  v40 = a5;
  v11 = *MEMORY[0x1E0CB2F90];
  v42 = *MEMORY[0x1E0CB2D50];
  do
  {
    v12 = objc_msgSend(v10, "count");
    if (!v12)
      break;
    v13 = (void *)MEMORY[0x1BCCA1B2C]();
    if (-[MADVideoRemoveBackgroundCropTask isCanceled](self, "isCanceled"))
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v56 = v42;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Request canceled"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v11, -128, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *a6;
      *a6 = v17;

    }
    else
    {
      objc_msgSend(v10, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v19 = MEMORY[0x1E0C81028];
        v20 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          if (v15)
          {
            objc_msgSend(v15, "presentationTimestamp");
            v21 = *(_QWORD *)v47;
            objc_msgSend(v15, "presentationTimestamp");
            v22 = v45;
          }
          else
          {
            v22 = 0;
            v21 = 0;
            *(_QWORD *)v47 = 0;
            v48 = 0;
            v49 = 0;
            v44 = 0;
            v45 = 0;
            v46 = 0;
          }
          *(_DWORD *)buf = 134218240;
          v53 = v21;
          v54 = 1024;
          v55 = v22;
          v19 = MEMORY[0x1E0C81028];
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Encoding %lld/%d", buf, 0x12u);
        }

      }
      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = os_signpost_id_generate(v23);

      VCPSignPostLog();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)v47 = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "MADVideoRemoveBackground_ExportFrame", ", v47, 2u);
      }

      v27 = objc_msgSend(v15, "pixelBuffer");
      if (v15)
        objc_msgSend(v15, "presentationTimestamp");
      else
        memset(v43, 0, sizeof(v43));
      if (!objc_msgSend(v41, "addPixelBuffer:withTime:", v27, v43))
      {
        VCPSignPostLog();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
        {
          *(_WORD *)v47 = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v33, OS_SIGNPOST_INTERVAL_END, v24, "MADVideoRemoveBackground_ExportFrame", ", v47, 2u);
        }

        objc_msgSend(v10, "removeObjectAtIndex:", 0);
        objc_msgSend(v40, "setCompletedUnitCount:", objc_msgSend(v40, "completedUnitCount") + 1);
        v34 = 1;
        goto LABEL_28;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v50 = v42;
      v29 = (void *)MEMORY[0x1E0CB3940];
      if (v15)
      {
        objc_msgSend(v15, "presentationTimestamp");
        v30 = *(_QWORD *)v47;
        objc_msgSend(v15, "presentationTimestamp");
        v31 = v45;
      }
      else
      {
        v31 = 0;
        v30 = 0;
        *(_QWORD *)v47 = 0;
        v48 = 0;
        v49 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
      }
      objc_msgSend(v29, "stringWithFormat:", CFSTR("Failed to export matted frame (%lld/%d)"), v30, v31);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v35;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v11, -18, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = *a6;
      *a6 = v37;

    }
    v34 = 0;
LABEL_28:

    objc_autoreleasePoolPop(v13);
  }
  while ((v34 & 1) != 0);

  return v12 == 0;
}

- (id)compressSequenceData:(id)a3 sequenceWriter:(id)a4 outputWidth:(unint64_t *)a5 outputHeight:(unint64_t *)a6
{
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t i;
  void *v19;
  int v20;
  NSObject *v21;
  os_signpost_id_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  int v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  void *v33;
  id obj;
  unint64_t v35;
  id v36;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  int v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v36 = a4;
  -[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "unsignedIntegerValue");

  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v46 = objc_msgSend(v39, "length");
    v47 = 1024;
    v48 = v35;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Output exceeds max file size (%d > %d); compressing...",
      buf,
      0xEu);
  }
  -[MADVideoRemoveBackgroundRequest minDimension](self->_request, "minDimension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MADVideoRemoveBackgroundRequest minDimension](self->_request, "minDimension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

  }
  else
  {
    v11 = 300;
  }

  v12 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithObject:", v13);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *a5;
  if (*a5 <= *a6)
    v14 = *a6;
  if (v14 >= 0x259 && v11 <= 0x257)
    objc_msgSend(v33, "insertObject:atIndex:", &unk_1E6B72A40, 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v33;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v15)
    goto LABEL_37;
  v16 = *(_QWORD *)v41;
  v17 = MEMORY[0x1E0C81028];
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v41 != v16)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_msgSend(v19, "intValue");
        *(_DWORD *)buf = 67109120;
        v46 = v20;
        _os_log_impl(&dword_1B6C4A000, v17, OS_LOG_TYPE_DEFAULT, "[RMBG] Transcoding to max dimension %d", buf, 8u);
      }
      VCPSignPostLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_signpost_id_generate(v21);

      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v24, OS_SIGNPOST_INTERVAL_BEGIN, v22, "MADVideoRemoveBackground_ReEncode", ", buf, 2u);
      }

      objc_msgSend((id)objc_opt_class(), "transcodeSequenceData:maxDimension:outputWidth:outputHeight:", v39, objc_msgSend(v19, "unsignedIntegerValue"), a5, a6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      VCPSignPostLog();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v27, OS_SIGNPOST_INTERVAL_END, v22, "MADVideoRemoveBackground_ReEncode", ", buf, 2u);
      }

      if (v25)
      {
        if (objc_msgSend(v25, "length") <= v35)
          goto LABEL_38;
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_msgSend(v25, "length");
          *(_DWORD *)buf = 67109376;
          v46 = v28;
          v47 = 1024;
          v48 = v35;
          v29 = v17;
          v30 = "[RMBG] Transcoded output exceeds max file size (%d vs %d)";
          v31 = 14;
LABEL_34:
          _os_log_impl(&dword_1B6C4A000, v29, OS_LOG_TYPE_ERROR, v30, buf, v31);
        }
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v29 = v17;
        v30 = "[RMBG] Failed to transcode sequence";
        v31 = 2;
        goto LABEL_34;
      }

    }
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v15);
LABEL_37:
  v25 = 0;
LABEL_38:

  return v25;
}

- (void)publishPreviewResultsTimeRange:(id *)a3 pastSamples:(id)a4 futureSamples:(id)a5 cropRect:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  __CVBuffer *v32;
  int v33;
  int v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  id v40;
  __int128 v41;
  void *v42;
  void *v43;
  MADVideoRemoveBackgroundCropTask *v44;
  id v46;
  void *v47;
  _OWORD v48[3];
  uint8_t buf[8];
  _QWORD v50[3];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[3];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v44 = self;
  v63 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v46 = a5;
  v47 = v11;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  objc_msgSend(v11, "reverseObjectEnumerator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v57 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x1BCCA1B2C]();
        CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v17, "pixelBuffer"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_alloc(MEMORY[0x1E0D47860]);
        if (v17)
          objc_msgSend(v17, "presentationTimestamp");
        else
          memset(v55, 0, sizeof(v55));
        v21 = (void *)objc_msgSend(v20, "initWithPresentationTimeStamp:surface:", v55, v19, v44);
        objc_msgSend(v12, "addObject:", v21);

        objc_autoreleasePoolPop(v18);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v14);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v22 = v46;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v52 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
        v27 = (void *)MEMORY[0x1BCCA1B2C]();
        CVPixelBufferGetIOSurface((CVPixelBufferRef)objc_msgSend(v26, "pixelBuffer"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_alloc(MEMORY[0x1E0D47860]);
        if (v26)
          objc_msgSend(v26, "presentationTimestamp");
        else
          memset(v50, 0, sizeof(v50));
        v30 = (void *)objc_msgSend(v29, "initWithPresentationTimeStamp:surface:", v50, v28, v44);
        objc_msgSend(v12, "addObject:", v30);

        objc_autoreleasePoolPop(v27);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v23);
  }

  if (objc_msgSend(v47, "count"))
    objc_msgSend(v47, "lastObject");
  else
    objc_msgSend(v22, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (__CVBuffer *)objc_msgSend(v31, "pixelBuffer");

  if (v32)
  {
    v33 = CVPixelBufferGetWidth(v32);
    v34 = CVPixelBufferGetHeight(v32);
    v64.origin.x = x / (double)v33;
    v64.origin.y = 1.0 - (y + height) / (double)v34;
    v64.size.width = width / (double)v33;
    v64.size.height = height / (double)v34;
    v66.origin.x = 0.0;
    v66.origin.y = 0.0;
    v66.size.width = 1.0;
    v66.size.height = 1.0;
    v65 = CGRectIntersection(v64, v66);
    v35 = v65.origin.x;
    v36 = v65.origin.y;
    v37 = v65.size.width;
    v38 = v65.size.height;
  }
  else
  {
    v37 = 1.0;
    v35 = 0.0;
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Failed to normalize crop rect", buf, 2u);
    }
    v36 = 0.0;
    v38 = 1.0;
  }
  v39 = objc_alloc_init(MEMORY[0x1E0D47888]);
  v40 = objc_alloc(MEMORY[0x1E0D47870]);
  v41 = *(_OWORD *)&a3->var0.var3;
  v48[0] = *(_OWORD *)&a3->var0.var0;
  v48[1] = v41;
  v48[2] = *(_OWORD *)&a3->var1.var1;
  v42 = (void *)objc_msgSend(v40, "initWithTimeRange:frames:normalizedCropRect:", v48, v12, v35, v36, v37, v38);
  v60 = v42;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setResults:", v43);

  (*((void (**)(void))v44->_resultHandler + 2))();
}

- (void)publishPayloadWidth:(unint64_t)a3 height:(unint64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0D47888]);
  v10 = objc_alloc(MEMORY[0x1E0D47880]);
  -[MADVideoRemoveBackgroundRequest outputType](self->_request, "outputType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithUniformTypeIdentifier:width:height:data:", v11, a3, a4, v8);
  v14[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResults:", v13);

  (*((void (**)(void))self->_resultHandler + 2))();
}

- (BOOL)run:(id *)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  MADServiceVideoAsset *asset;
  NSObject *v15;
  id v16;
  MADVideoRemoveBackgroundRequest *request;
  MADVideoRemoveBackgroundRequest *v18;
  BOOL v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  MADServiceVideoAsset *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void (**progressHandler)(double);
  void *v33;
  NSObject *v34;
  id v35;
  void *v36;
  NSObject *v37;
  os_signpost_id_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  Float64 v46;
  Float64 v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  id v58;
  Float64 Seconds;
  Float64 v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  NSObject *v64;
  os_signpost_id_t v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  uint64_t v71;
  __int128 v72;
  NSObject *v73;
  CGSize v74;
  NSObject *v75;
  os_signpost_id_t v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  NSObject *v86;
  id v87;
  Float64 v88;
  Float64 v89;
  double v90;
  double v91;
  double v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t j;
  void *v102;
  CGFloat y;
  CGFloat height;
  NSObject *v105;
  id v106;
  void *v107;
  NSObject *v108;
  os_signpost_id_t v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  os_signpost_id_t v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  id v121;
  void *v122;
  void *v123;
  unint64_t v124;
  void *v125;
  _BOOL4 v126;
  uint64_t v127;
  NSObject *v128;
  id v129;
  void *v130;
  void *v131;
  __CFString *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  id v139;
  NSObject *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  uint64_t v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  NSObject *v152;
  id v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  void *v158;
  NSObject *v159;
  id v160;
  int value;
  int v162;
  int v163;
  void (**v164)(double);
  void *v165;
  BOOL v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  _BOOL4 v171;
  _BOOL8 v172;
  void *v173;
  uint64_t v174;
  NSObject *v175;
  id v176;
  _MADObjCStickerStoreFacade *v177;
  void *v178;
  void *v179;
  BOOL v180;
  NSObject *v181;
  id v182;
  void *v183;
  void *v184;
  id v185;
  _BOOL4 v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  id v190;
  void *v191;
  NSObject *v192;
  NSObject *group;
  id v194;
  id v195;
  unsigned int v196;
  void *v197;
  void *v198;
  void *v199;
  uint64_t v200;
  void *v201;
  id v202;
  void *v203;
  uint64_t v204;
  void *v205;
  void *v206;
  void *v207;
  id v208;
  CMTimeRange v209;
  CMTime v210;
  CMTimeRange v211;
  CMTime v212;
  CMTime v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  CMTime v218;
  CMTime v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  CMTime duration;
  CMTime v225;
  CMTime v226;
  CMTime v227;
  __int128 v228;
  CMTimeEpoch v229;
  CMTimeRange v230;
  CMTime v231;
  CGRect r2;
  _QWORD block[5];
  id v234;
  id v235;
  uint64_t *v236;
  CMTimeRange *v237;
  CMTimeRange *p_buf;
  CFTypeRef v239;
  unsigned int v240;
  uint64_t v241;
  uint64_t *v242;
  uint64_t v243;
  uint64_t (*v244)(uint64_t, uint64_t);
  void (*v245)(uint64_t);
  id v246;
  CFTypeRef cf;
  CFTypeRef v248;
  __int128 v249;
  CMTimeEpoch epoch;
  CMTime v251;
  _QWORD v252[4];
  id v253;
  MADVideoRemoveBackgroundCropTask *v254;
  CMTimeRange v255;
  CMTimeRange v256;
  CMTimeRange v257;
  CMTime v258;
  CMTime v259;
  CMTime v260;
  CMTime time;
  CMTimeRange range;
  CMTime v263;
  CMTimeRange otherRange;
  CMTimeRange v265;
  CMTimeRange v266;
  CMTime v267;
  CMTime start;
  CMTime time2;
  CMTime time1;
  CMTimeRange v271;
  id v272;
  CMTime rhs;
  _BYTE lhs[30];
  uint64_t v275;
  void *v276;
  uint64_t v277;
  void *v278;
  uint64_t v279;
  void *v280;
  _BYTE v281[32];
  _BYTE v282[128];
  _BYTE v283[128];
  uint64_t v284;
  void *v285;
  CMTimeRange v286;
  __int128 v287;
  __int128 v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  CMTimeRange buf;
  uint64_t v296;
  void *v297;
  uint64_t v298;
  _QWORD v299[4];
  CGRect v300;

  v299[1] = *MEMORY[0x1E0C80C00];
  if (-[MADVideoRemoveBackgroundCropTask validateRequest:](self, "validateRequest:"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSince1970");
    v7 = v6;

    v8 = (void *)MEMORY[0x1E0C8AF90];
    -[MADServiceVideoAsset url](self->_asset, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetWithURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v272 = 0;
      objc_msgSend(MEMORY[0x1E0C8AFD0], "assetReaderWithAsset:error:", v10, &v272);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v272;
      v206 = v12;
      v207 = v11;
      if (v11)
      {
        objc_msgSend(v10, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E0C8A808]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v205 = v13;
        if (!v13)
        {
          if (a3)
          {
            v23 = (void *)MEMORY[0x1E0CB35C8];
            v296 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Asset contains no video tracks"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v297 = v24;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v297, &v296, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = *a3;
            *a3 = v26;

          }
          goto LABEL_49;
        }
        memset(&v271, 0, sizeof(v271));
        objc_msgSend(v13, "timeRange");
        if (+[MADVideoRemoveBackgroundSettings autoplayTrimEnabled](MADVideoRemoveBackgroundSettings, "autoplayTrimEnabled"))
        {
          memset(&v286, 0, sizeof(v286));
          asset = self->_asset;
          if (asset
            && (-[MADServiceVideoAsset trimTimeRange](asset, "trimTimeRange"), (v286.start.flags & 1) != 0)
            && (v286.duration.flags & 1) != 0
            && !v286.duration.epoch
            && (v286.duration.value & 0x8000000000000000) == 0
            && (time1 = v286.duration, time2 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68], CMTimeCompare(&time1, &time2)))
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v57 = MEMORY[0x1E0C81028];
              v58 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                start = v286.start;
                Seconds = CMTimeGetSeconds(&start);
                v266 = v286;
                CMTimeRangeGetEnd(&v267, &v266);
                v60 = CMTimeGetSeconds(&v267);
                LODWORD(buf.start.value) = 134218240;
                *(Float64 *)((char *)&buf.start.value + 4) = Seconds;
                LOWORD(buf.start.flags) = 2048;
                *(Float64 *)((char *)&buf.start.flags + 2) = v60;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Applying autoplay trim (%0.3fs-%0.3fs)", (uint8_t *)&buf, 0x16u);
              }

            }
            v265 = v271;
            otherRange = v286;
            CMTimeRangeGetIntersection(&buf, &v265, &otherRange);
            v271 = buf;
          }
          else if ((int)MediaAnalysisLogLevel() >= 4)
          {
            v15 = MEMORY[0x1E0C81028];
            v16 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(buf.start.value) = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Autoplay trim range not available for asset", (uint8_t *)&buf, 2u);
            }

          }
        }
        memset(&v263, 0, sizeof(v263));
        request = self->_request;
        if (request)
        {
          -[MADVideoRemoveBackgroundRequest maskTime](request, "maskTime");
          if ((v286.start.flags & 1) != 0)
          {
            v18 = self->_request;
            if (v18)
            {
              -[MADVideoRemoveBackgroundRequest maskTime](v18, "maskTime");
LABEL_28:
              range = v271;
              time = v263;
              if (CMTimeRangeContainsTime(&range, &time))
              {
                -[MADVideoRemoveBackgroundCropTask decodeSettingsForTrack:](self, "decodeSettingsForTrack:", v205);
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C8B000], "assetReaderTrackOutputWithTrack:outputSettings:", v205);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v204 = (uint64_t)v29;
                if (v29)
                {
                  objc_msgSend(v11, "addOutput:", v29);
                  v256 = v271;
                  objc_msgSend(v11, "setTimeRange:", &v256);
                  if ((objc_msgSend(v11, "startReading") & 1) != 0)
                  {
                    v196 = objc_msgSend(v205, "vcp_imageOrientation");
                    v255 = v271;
                    v200 = objc_msgSend(v205, "vcp_sampleCountForTimeRange:", &v255);
                    if ((int)MediaAnalysisLogLevel() >= 6)
                    {
                      v30 = MEMORY[0x1E0C81028];
                      v31 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        LODWORD(v286.start.value) = 67109120;
                        HIDWORD(v286.start.value) = v200;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Sample Count: %d", (uint8_t *)&v286, 8u);
                      }

                    }
                    progressHandler = (void (**)(double))self->_progressHandler;
                    if (progressHandler)
                      progressHandler[2](0.0);
                    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 3 * v200);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v252[0] = MEMORY[0x1E0C809B0];
                    v252[1] = 3221225472;
                    v252[2] = __40__MADVideoRemoveBackgroundCropTask_run___block_invoke;
                    v252[3] = &unk_1E6B16D58;
                    v202 = v33;
                    v253 = v202;
                    v254 = self;
                    +[VCPTimer timerWithInterval:unit:oneShot:andBlock:](VCPTimer, "timerWithInterval:unit:oneShot:andBlock:", 250, 2, 0, v252);
                    v199 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((int)MediaAnalysisLogLevel() >= 7)
                    {
                      v34 = MEMORY[0x1E0C81028];
                      v35 = MEMORY[0x1E0C81028];
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                      {
                        LOWORD(v286.start.value) = 0;
                        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RMBG] Resetting cached mask state", (uint8_t *)&v286, 2u);
                      }

                    }
                    +[MADImageRemoveBackgroundResource sharedResource](MADImageRemoveBackgroundResource, "sharedResource");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "setCachedMaskState:", 0);

                    VCPSignPostLog();
                    v37 = objc_claimAutoreleasedReturnValue();
                    v38 = os_signpost_id_generate(v37);

                    VCPSignPostLog();
                    v39 = objc_claimAutoreleasedReturnValue();
                    v40 = v39;
                    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
                    {
                      LOWORD(v286.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v40, OS_SIGNPOST_INTERVAL_BEGIN, v38, "MADVideoRemoveBackground_DecodePastFrames", ", (uint8_t *)&v286, 2u);
                    }

                    v251 = v263;
                    v249 = *(_OWORD *)&v271.start.value;
                    epoch = v271.start.epoch;
                    -[MADVideoRemoveBackgroundCropTask decodeSamplesUntilTime:trackOutput:baseTime:progress:error:](self, "decodeSamplesUntilTime:trackOutput:baseTime:progress:error:", &v251, v204, &v249, v202, a3);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    if (!v41)
                    {
                      v19 = 0;
                      goto LABEL_168;
                    }
                    v198 = v41;
                    if (objc_msgSend(v11, "status") == 3)
                    {
                      objc_msgSend(v11, "error");
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      v43 = *a3;
                      *a3 = v42;

                      v19 = 0;
LABEL_168:

                      v51 = v253;
                      goto LABEL_169;
                    }
                    VCPSignPostLog();
                    v61 = objc_claimAutoreleasedReturnValue();
                    v62 = v61;
                    if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
                    {
                      LOWORD(v286.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v62, OS_SIGNPOST_INTERVAL_END, v38, "MADVideoRemoveBackground_DecodePastFrames", ", (uint8_t *)&v286, 2u);
                    }

                    objc_msgSend(v198, "lastObject");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v248 = CFRetain(v63);

                    VCPSignPostLog();
                    v64 = objc_claimAutoreleasedReturnValue();
                    v65 = os_signpost_id_generate(v64);

                    VCPSignPostLog();
                    v66 = objc_claimAutoreleasedReturnValue();
                    v67 = v66;
                    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v66))
                    {
                      LOWORD(v286.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v67, OS_SIGNPOST_INTERVAL_BEGIN, v65, "MADVideoRemoveBackground_GenerateMask", ", (uint8_t *)&v286, 2u);
                    }

                    cf = -[MADVideoRemoveBackgroundCropTask generateMaskForSampleBuffer:orientation:error:](self, "generateMaskForSampleBuffer:orientation:error:", v248, v196, a3);
                    v41 = v198;
                    if (!cf)
                    {
                      v19 = 0;
LABEL_167:
                      CF<opaqueCMSampleBuffer *>::~CF(&cf);
                      CF<opaqueCMSampleBuffer *>::~CF(&v248);
                      goto LABEL_168;
                    }
                    VCPSignPostLog();
                    v68 = objc_claimAutoreleasedReturnValue();
                    v69 = v68;
                    if (v65 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
                    {
                      LOWORD(v286.start.value) = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v69, OS_SIGNPOST_INTERVAL_END, v65, "MADVideoRemoveBackground_GenerateMask", ", (uint8_t *)&v286, 2u);
                    }

                    +[MADVideoRemoveBackgroundResource sharedResource](MADVideoRemoveBackgroundResource, "sharedResource");
                    v189 = (void *)objc_claimAutoreleasedReturnValue();
                    +[VCPMADResourceManager sharedManager](VCPMADResourceManager, "sharedManager");
                    v70 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "activateResource:", v189);
                    v191 = (void *)objc_claimAutoreleasedReturnValue();

                    v286.start.value = 0;
                    *(_QWORD *)&v286.start.timescale = &v286;
                    v286.start.epoch = 0x5012000000;
                    v286.duration.value = (CMTimeValue)__Block_byref_object_copy__11;
                    *(_QWORD *)&v286.duration.timescale = __Block_byref_object_dispose__11;
                    v286.duration.epoch = (CMTimeEpoch)&unk_1B706A4DA;
                    v71 = MEMORY[0x1E0C9D628];
                    v72 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
                    v287 = *MEMORY[0x1E0C9D628];
                    v288 = v72;
                    buf.start.value = 0;
                    *(_QWORD *)&buf.start.timescale = &buf;
                    buf.start.epoch = 0x3032000000;
                    buf.duration.value = (CMTimeValue)__Block_byref_object_copy__307;
                    *(_QWORD *)&buf.duration.timescale = __Block_byref_object_dispose__308;
                    buf.duration.epoch = 0;
                    v241 = 0;
                    v242 = &v241;
                    v243 = 0x3032000000;
                    v244 = __Block_byref_object_copy__307;
                    v245 = __Block_byref_object_dispose__308;
                    v246 = 0;
                    group = dispatch_group_create();
                    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                    v73 = objc_claimAutoreleasedReturnValue();
                    v192 = dispatch_queue_create("trackMaskPastFrames", v73);

                    block[0] = MEMORY[0x1E0C809B0];
                    block[1] = 3321888768;
                    block[2] = __40__MADVideoRemoveBackgroundCropTask_run___block_invoke_310;
                    block[3] = &unk_1E6B14620;
                    v236 = &v241;
                    block[4] = self;
                    v240 = v196;
                    v234 = v198;
                    v239 = cf;
                    if (cf)
                      CFRetain(cf);
                    v237 = &v286;
                    v190 = v202;
                    v235 = v190;
                    p_buf = &buf;
                    dispatch_group_async(group, v192, block);
                    v74 = *(CGSize *)(v71 + 16);
                    r2.origin = *(CGPoint *)v71;
                    r2.size = v74;
                    memset(&v231, 0, sizeof(v231));
                    v230 = v271;
                    CMTimeRangeGetEnd(&v231, &v230);
                    VCPSignPostLog();
                    v75 = objc_claimAutoreleasedReturnValue();
                    v76 = os_signpost_id_generate(v75);

                    VCPSignPostLog();
                    v77 = objc_claimAutoreleasedReturnValue();
                    v78 = v77;
                    if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
                    {
                      *(_WORD *)v281 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v78, OS_SIGNPOST_INTERVAL_BEGIN, v76, "MADVideoRemoveBackground_ProcessFutureFrames", ", v281, 2u);
                    }

                    v228 = *(_OWORD *)&v271.start.value;
                    v229 = v271.start.epoch;
                    -[MADVideoRemoveBackgroundCropTask processFutureSamplesFromTrackOutput:baseTime:orientation:maskSampleBuffer:maskPixelBuffer:cropUnion:endTime:progress:error:](self, "processFutureSamplesFromTrackOutput:baseTime:orientation:maskSampleBuffer:maskPixelBuffer:cropUnion:endTime:progress:error:", v204, &v228, v196, v248, cf, &r2, &v231, v190, a3);
                    v197 = (void *)objc_claimAutoreleasedReturnValue();
                    VCPSignPostLog();
                    v79 = objc_claimAutoreleasedReturnValue();
                    v80 = v79;
                    if (v76 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
                    {
                      *(_WORD *)v281 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v80, OS_SIGNPOST_INTERVAL_END, v76, "MADVideoRemoveBackground_ProcessFutureFrames", ", v281, 2u);
                    }

                    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
                    if (v197)
                    {
                      if (v242[5])
                      {
                        objc_msgSend(v191, "reset");
                        v188 = objc_msgSend(v197, "count");
                        v187 = objc_msgSend((id)v242[5], "count");
                        if (!+[MADVideoRemoveBackgroundSettings visionTrimEnabled](MADVideoRemoveBackgroundSettings, "visionTrimEnabled"))goto LABEL_118;
                        memset(&v227, 0, sizeof(v227));
                        objc_msgSend((id)v242[5], "lastObject");
                        v81 = (void *)objc_claimAutoreleasedReturnValue();
                        v82 = v81;
                        if (v81)
                          objc_msgSend(v81, "presentationTimestamp");
                        else
                          memset(&v227, 0, sizeof(v227));

                        *(_OWORD *)lhs = *(_OWORD *)&v271.start.value;
                        *(_QWORD *)&lhs[16] = v271.start.epoch;
                        rhs = v227;
                        CMTimeAdd((CMTime *)v281, (CMTime *)lhs, &rhs);
                        *(_OWORD *)&v271.start.value = *(_OWORD *)v281;
                        v85 = *(_QWORD *)&v281[16];
                        v271.start.epoch = *(_QWORD *)&v281[16];
                        *(CMTime *)v281 = v231;
                        *(_OWORD *)lhs = *(_OWORD *)&v271.start.value;
                        *(_QWORD *)&lhs[16] = v85;
                        CMTimeSubtract(&rhs, (CMTime *)v281, (CMTime *)lhs);
                        v271.duration = rhs;
                        if ((int)MediaAnalysisLogLevel() >= 5)
                        {
                          v86 = MEMORY[0x1E0C81028];
                          v87 = MEMORY[0x1E0C81028];
                          if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
                          {
                            v226 = v271.start;
                            v88 = CMTimeGetSeconds(&v226);
                            v225 = v231;
                            v89 = CMTimeGetSeconds(&v225);
                            *(_DWORD *)v281 = 134218240;
                            *(Float64 *)&v281[4] = v88;
                            *(_WORD *)&v281[12] = 2048;
                            *(Float64 *)&v281[14] = v89;
                            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Tracking based trim (%0.3fs-%0.3fs)", v281, 0x16u);
                          }

                        }
                        +[MADVideoRemoveBackgroundSettings visionTrimMininumDuration](MADVideoRemoveBackgroundSettings, "visionTrimMininumDuration");
                        v91 = v90;
                        duration = v271.duration;
                        v92 = CMTimeGetSeconds(&duration);
                        if (v92 >= v91)
                        {
                          v222 = 0u;
                          v223 = 0u;
                          v220 = 0u;
                          v221 = 0u;
                          v93 = (id)v242[5];
                          v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v220, v283, 16);
                          if (v94)
                          {
                            v95 = *(_QWORD *)v221;
                            do
                            {
                              for (i = 0; i != v94; ++i)
                              {
                                if (*(_QWORD *)v221 != v95)
                                  objc_enumerationMutation(v93);
                                v97 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
                                if (v97)
                                  objc_msgSend(*(id *)(*((_QWORD *)&v220 + 1) + 8 * i), "presentationTimestamp");
                                else
                                  memset(&rhs, 0, sizeof(rhs));
                                *(CMTime *)v281 = rhs;
                                *(CMTime *)lhs = v227;
                                CMTimeSubtract(&v219, (CMTime *)v281, (CMTime *)lhs);
                                v218 = v219;
                                objc_msgSend(v97, "setPresentationTimestamp:", &v218);
                              }
                              v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v220, v283, 16);
                            }
                            while (v94);
                          }

                          v216 = 0u;
                          v217 = 0u;
                          v214 = 0u;
                          v215 = 0u;
                          v98 = v197;
                          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v214, v282, 16);
                          if (v99)
                          {
                            v100 = *(_QWORD *)v215;
                            do
                            {
                              for (j = 0; j != v99; ++j)
                              {
                                if (*(_QWORD *)v215 != v100)
                                  objc_enumerationMutation(v98);
                                v102 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * j);
                                if (v102)
                                  objc_msgSend(*(id *)(*((_QWORD *)&v214 + 1) + 8 * j), "presentationTimestamp");
                                else
                                  memset(&rhs, 0, sizeof(rhs));
                                *(CMTime *)v281 = rhs;
                                *(CMTime *)lhs = v227;
                                CMTimeSubtract(&v213, (CMTime *)v281, (CMTime *)lhs);
                                v212 = v213;
                                objc_msgSend(v102, "setPresentationTimestamp:", &v212);
                              }
                              v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v214, v282, 16);
                            }
                            while (v99);
                          }

LABEL_118:
                          memset(v281, 0, sizeof(v281));
                          v300 = CGRectUnion(*(CGRect *)(*(_QWORD *)&v286.start.timescale + 48), r2);
                          y = v300.origin.y;
                          *(int64x2_t *)&v300.origin.y = vdupq_n_s64(0xFFFFFFFFFFFFFFFELL);
                          height = v300.size.height;
                          *(float64x2_t *)v281 = vcvtq_f64_u64((uint64x2_t)vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)v300.origin), *(int8x16_t *)&v300.origin.y));
                          *(float64x2_t *)&v281[16] = vcvtq_f64_u64((uint64x2_t)vandq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)v300.size), *(int8x16_t *)&v300.origin.y));
                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            v105 = MEMORY[0x1E0C81028];
                            v106 = MEMORY[0x1E0C81028];
                            if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)lhs = 67109888;
                              *(_DWORD *)&lhs[4] = (int)*(double *)v281;
                              *(_WORD *)&lhs[8] = 1024;
                              *(_DWORD *)&lhs[10] = (int)*(double *)&v281[8];
                              *(_WORD *)&lhs[14] = 1024;
                              *(_DWORD *)&lhs[16] = (int)(*(double *)v281 + *(double *)&v281[16]);
                              *(_WORD *)&lhs[20] = 1024;
                              *(_DWORD *)&lhs[22] = (int)(*(double *)&v281[8] + *(double *)&v281[24]);
                              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Crop (%d, %d) to (%d, %d)", lhs, 0x1Au);
                            }

                          }
                          if (self->_previewRequest)
                          {
                            v211 = v271;
                            -[MADVideoRemoveBackgroundCropTask publishPreviewResultsTimeRange:pastSamples:futureSamples:cropRect:](self, "publishPreviewResultsTimeRange:pastSamples:futureSamples:cropRect:", &v211, v242[5], v197, *(double *)v281, *(double *)&v281[8], *(double *)&v281[16], *(double *)&v281[24]);
                            if (!self->_request)
                            {
                              (*((void (**)(void))self->_completionHandler + 2))();
                              v19 = 1;
                              goto LABEL_166;
                            }
                          }
                          v186 = -[MADVideoRemoveBackgroundCropTask isAnimatedStickerPreferredWithPastSamples:futureSamples:](self, "isAnimatedStickerPreferredWithPastSamples:futureSamples:", v242[5], v197);
                          -[MADVideoRemoveBackgroundRequest outputType](self->_request, "outputType");
                          v107 = (void *)objc_claimAutoreleasedReturnValue();
                          +[MADAlphaSequenceWriter writerWithUniformTypeIdentifier:frameCount:crop:](MADAlphaSequenceWriter, "writerWithUniformTypeIdentifier:frameCount:crop:", v107, v200, v281);
                          v201 = (void *)objc_claimAutoreleasedReturnValue();

                          if (!v201)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 3)
                            {
                              v140 = MEMORY[0x1E0C81028];
                              v141 = MEMORY[0x1E0C81028];
                              if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
                              {
                                -[MADVideoRemoveBackgroundRequest outputType](self->_request, "outputType");
                                v142 = (void *)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)lhs = 138412290;
                                *(_QWORD *)&lhs[4] = v142;
                                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] Invalid output type specified (%@)", lhs, 0xCu);

                              }
                            }
                            v143 = (void *)MEMORY[0x1E0CB35C8];
                            v279 = *MEMORY[0x1E0CB2D50];
                            v144 = (void *)MEMORY[0x1E0CB3940];
                            -[MADVideoRemoveBackgroundRequest outputType](self->_request, "outputType");
                            v145 = objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v144, "stringWithFormat:", CFSTR("Invalid output type specified (%@)"), v145);
                            v146 = (void *)objc_claimAutoreleasedReturnValue();
                            v280 = v146;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v280, &v279, 1);
                            v147 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v143, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50, v147);
                            v148 = (void *)objc_claimAutoreleasedReturnValue();
                            v149 = *a3;
                            *a3 = v148;

                            v19 = 0;
                            v150 = (void *)v145;
                            goto LABEL_163;
                          }
                          VCPSignPostLog();
                          v108 = objc_claimAutoreleasedReturnValue();
                          v109 = os_signpost_id_generate(v108);

                          VCPSignPostLog();
                          v110 = objc_claimAutoreleasedReturnValue();
                          v111 = v110;
                          if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v111, OS_SIGNPOST_INTERVAL_BEGIN, v109, "MADVideoRemoveBackground_EncodePastFrames", ", lhs, 2u);
                          }

                          if (!-[MADVideoRemoveBackgroundCropTask exportPastSamples:sequenceWriter:progress:error:](self, "exportPastSamples:sequenceWriter:progress:error:", v242[5], v201, v190, a3))goto LABEL_152;
                          VCPSignPostLog();
                          v112 = objc_claimAutoreleasedReturnValue();
                          v113 = v112;
                          if (v109 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v112))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v113, OS_SIGNPOST_INTERVAL_END, v109, "MADVideoRemoveBackground_EncodePastFrames", ", lhs, 2u);
                          }

                          VCPSignPostLog();
                          v114 = objc_claimAutoreleasedReturnValue();
                          v115 = os_signpost_id_generate(v114);

                          VCPSignPostLog();
                          v116 = objc_claimAutoreleasedReturnValue();
                          v117 = v116;
                          if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v116))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v117, OS_SIGNPOST_INTERVAL_BEGIN, v115, "MADVideoRemoveBackground_EncodeFutureFrames", ", lhs, 2u);
                          }

                          if (!-[MADVideoRemoveBackgroundCropTask exportFutureSamples:sequenceWriter:progress:error:](self, "exportFutureSamples:sequenceWriter:progress:error:", v197, v201, v190, a3))
                          {
LABEL_152:
                            v19 = 0;
LABEL_164:

                            goto LABEL_166;
                          }
                          VCPSignPostLog();
                          v118 = objc_claimAutoreleasedReturnValue();
                          v119 = v118;
                          if (v115 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v118))
                          {
                            *(_WORD *)lhs = 0;
                            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v119, OS_SIGNPOST_INTERVAL_END, v115, "MADVideoRemoveBackground_EncodeFutureFrames", ", lhs, 2u);
                          }

                          if ((int)MediaAnalysisLogLevel() >= 6)
                          {
                            v120 = MEMORY[0x1E0C81028];
                            v121 = MEMORY[0x1E0C81028];
                            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)lhs = 0;
                              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[RMBG] Finalizing output", lhs, 2u);
                            }

                          }
                          v209 = v271;
                          CMTimeRangeGetEnd(&v210, &v209);
                          objc_msgSend(v201, "finishWithEndTime:", &v210);
                          v122 = (void *)objc_claimAutoreleasedReturnValue();
                          if (!v122)
                          {
                            if ((int)MediaAnalysisLogLevel() >= 3)
                            {
                              v152 = MEMORY[0x1E0C81028];
                              v153 = MEMORY[0x1E0C81028];
                              if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
                              {
                                *(_WORD *)lhs = 0;
                                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to finalize output sequence", lhs, 2u);
                              }

                            }
                            v154 = (void *)MEMORY[0x1E0CB35C8];
                            v277 = *MEMORY[0x1E0CB2D50];
                            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to finalize output sequence"));
                            v150 = (void *)objc_claimAutoreleasedReturnValue();
                            v278 = v150;
                            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v278, &v277, 1);
                            v155 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v154, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v155);
                            v156 = (void *)objc_claimAutoreleasedReturnValue();
                            v157 = *a3;
                            *a3 = v156;

                            v19 = 0;
                            goto LABEL_163;
                          }
                          rhs.value = (unint64_t)*(double *)&v281[16];
                          v227.value = (unint64_t)*(double *)&v281[24];
                          -[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize");
                          v123 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v123)
                          {
                            v124 = objc_msgSend(v122, "length");
                            -[MADVideoRemoveBackgroundRequest maxFileSize](self->_request, "maxFileSize");
                            v125 = (void *)objc_claimAutoreleasedReturnValue();
                            v126 = v124 > objc_msgSend(v125, "unsignedIntegerValue");

                            if (v126)
                            {
                              -[MADVideoRemoveBackgroundCropTask compressSequenceData:sequenceWriter:outputWidth:outputHeight:](self, "compressSequenceData:sequenceWriter:outputWidth:outputHeight:", v122, v201, &rhs, &v227);
                              v127 = objc_claimAutoreleasedReturnValue();

                              v122 = (void *)v127;
                              if (!v127)
                              {
                                if ((int)MediaAnalysisLogLevel() >= 3)
                                {
                                  v128 = MEMORY[0x1E0C81028];
                                  v129 = MEMORY[0x1E0C81028];
                                  if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)lhs = 0;
                                    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] Failed to meet target filesize requirement", lhs, 2u);
                                  }

                                }
                                v130 = (void *)MEMORY[0x1E0CB35C8];
                                v275 = *MEMORY[0x1E0CB2D50];
                                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to meet target filesize requirement"));
                                v131 = (void *)objc_claimAutoreleasedReturnValue();
                                v276 = v131;
                                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v276, &v275, 1);
                                v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v130, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v132);
                                v133 = (void *)objc_claimAutoreleasedReturnValue();
                                v134 = 0;
                                v194 = *a3;
                                *a3 = v133;

LABEL_206:
                                v19 = 0;
                                v150 = v134;
                                goto LABEL_163;
                              }
                            }
                          }
                          if ((int)MediaAnalysisLogLevel() >= 5)
                          {
                            v158 = v122;
                            v159 = MEMORY[0x1E0C81028];
                            v160 = MEMORY[0x1E0C81028];
                            if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
                            {
                              value = rhs.value;
                              v162 = v227.value;
                              v163 = objc_msgSend(v158, "length");
                              *(_DWORD *)lhs = 67109632;
                              *(_DWORD *)&lhs[4] = value;
                              *(_WORD *)&lhs[8] = 1024;
                              *(_DWORD *)&lhs[10] = v162;
                              *(_WORD *)&lhs[14] = 1024;
                              *(_DWORD *)&lhs[16] = v163;
                              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Output - Resolution: %dx%d  Size: %d", lhs, 0x14u);
                            }

                            v122 = v158;
                          }
                          objc_msgSend(v199, "destroy");
                          v164 = (void (**)(double))self->_progressHandler;
                          if (v164)
                            v164[2](1.0);
                          -[MADVideoRemoveBackgroundRequest stickerIdentifiers](self->_request, "stickerIdentifiers");
                          v165 = (void *)objc_claimAutoreleasedReturnValue();
                          v134 = v122;
                          v166 = objc_msgSend(v165, "count") == 0;

                          if (!v166)
                          {
                            -[MADServiceVideoAsset animatedStickerScore](self->_asset, "animatedStickerScore");
                            v167 = (void *)objc_claimAutoreleasedReturnValue();
                            v131 = v167;
                            if (v167)
                            {
                              objc_msgSend(v167, "doubleValue");
                              v169 = v168;
                              +[MADVideoRemoveBackgroundSettings photosPreferredThreshold](MADVideoRemoveBackgroundSettings, "photosPreferredThreshold");
                              v171 = v169 >= v170;
                              v172 = v169 >= v170 && v186;
                              v173 = (void *)MEMORY[0x1E0CB3940];
                              objc_msgSend(v131, "doubleValue");
                              objc_msgSend(v173, "stringWithFormat:", CFSTR("%0.3f"), v174);
                              v132 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

                            }
                            else
                            {
                              v171 = 1;
                              v132 = CFSTR("-");
                              v172 = v186;
                            }
                            if ((int)MediaAnalysisLogLevel() >= 5)
                            {
                              v175 = MEMORY[0x1E0C81028];
                              v176 = MEMORY[0x1E0C81028];
                              if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)lhs = 67109890;
                                *(_DWORD *)&lhs[4] = v172;
                                *(_WORD *)&lhs[8] = 1024;
                                *(_DWORD *)&lhs[10] = v186;
                                *(_WORD *)&lhs[14] = 1024;
                                *(_DWORD *)&lhs[16] = v171;
                                *(_WORD *)&lhs[20] = 2112;
                                *(_QWORD *)&lhs[22] = v132;
                                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[RMBG] Preferred: %d (Vision: %d, Photos: %d - Score: %@)", lhs, 0x1Eu);
                              }

                            }
                            v177 = objc_alloc_init(_MADObjCStickerStoreFacade);
                            -[MADVideoRemoveBackgroundRequest stickerIdentifiers](self->_request, "stickerIdentifiers");
                            v178 = (void *)objc_claimAutoreleasedReturnValue();
                            -[MADVideoRemoveBackgroundRequest outputType](self->_request, "outputType");
                            v179 = (void *)objc_claimAutoreleasedReturnValue();
                            v208 = 0;
                            v180 = -[_MADObjCStickerStoreFacade addAnimatedRepresentationWithIdentifiers:data:uti:size:isPreferred:error:](v177, "addAnimatedRepresentationWithIdentifiers:data:uti:size:isPreferred:error:", v178, v134, v179, v172, &v208, (double)(unint64_t)rhs.value, (double)(unint64_t)v227.value);
                            v195 = v208;

                            if (!v180)
                            {
                              if ((int)MediaAnalysisLogLevel() >= 3)
                              {
                                v181 = MEMORY[0x1E0C81028];
                                v182 = MEMORY[0x1E0C81028];
                                if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                                {
                                  objc_msgSend(v195, "description");
                                  v183 = (void *)objc_claimAutoreleasedReturnValue();
                                  *(_DWORD *)lhs = 138412290;
                                  *(_QWORD *)&lhs[4] = v183;
                                  _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] Failed to update sticker (%@)", lhs, 0xCu);

                                }
                              }
                              v184 = (void *)objc_msgSend(v195, "copy");
                              v185 = *a3;
                              *a3 = v184;

                              goto LABEL_206;
                            }

                          }
                          v150 = v134;
                          -[MADVideoRemoveBackgroundCropTask publishPayloadWidth:height:data:](self, "publishPayloadWidth:height:data:", rhs.value, v227.value, v134);
                          (*((void (**)(void))self->_completionHandler + 2))();
                          MADPLLogAnimatedStickerCreation(v187 + v188, v7);
                          v19 = 1;
LABEL_163:

                          goto LABEL_164;
                        }
                        if ((int)MediaAnalysisLogLevel() >= 3
                          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)v281 = 134218240;
                          *(double *)&v281[4] = v92;
                          *(_WORD *)&v281[12] = 2048;
                          *(double *)&v281[14] = v91;
                          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[RMBG] Trimmed duration is too short (%0.3fs < %0.3fs)", v281, 0x16u);
                        }
                        v135 = (void *)MEMORY[0x1E0CB35C8];
                        v284 = *MEMORY[0x1E0CB2D50];
                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Trimmed duration is too short (%0.3fs < %0.3fs)"), *(_QWORD *)&v92, *(_QWORD *)&v91);
                        v136 = (void *)objc_claimAutoreleasedReturnValue();
                        v285 = v136;
                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
                        v137 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v135, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v137);
                        v138 = (void *)objc_claimAutoreleasedReturnValue();
                        v139 = *a3;
                        *a3 = v138;

                      }
                      else
                      {
                        v83 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf.start.timescale + 40), "copy");
                        v84 = *a3;
                        *a3 = v83;

                      }
                    }
                    v19 = 0;
LABEL_166:

                    CF<opaqueCMSampleBuffer *>::~CF(&v239);
                    _Block_object_dispose(&v241, 8);

                    _Block_object_dispose(&buf, 8);
                    _Block_object_dispose(&v286, 8);

                    v41 = v198;
                    goto LABEL_167;
                  }
                  if (a3)
                  {
                    v54 = (void *)MEMORY[0x1E0CB35C8];
                    v289 = *MEMORY[0x1E0CB2D50];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to start decoding video track"));
                    v290 = objc_claimAutoreleasedReturnValue();
                    v202 = (id)v290;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v290, &v289, 1);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -19, v51);
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    v56 = *a3;
                    *a3 = v55;

                    goto LABEL_54;
                  }
                }
                else if (a3)
                {
                  v50 = (void *)MEMORY[0x1E0CB35C8];
                  v291 = *MEMORY[0x1E0CB2D50];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create video track output"));
                  v292 = objc_claimAutoreleasedReturnValue();
                  v202 = (id)v292;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v292, &v291, 1);
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v51);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  v53 = *a3;
                  *a3 = v52;

LABEL_54:
                  v19 = 0;
LABEL_169:

                  v49 = v202;
                  goto LABEL_170;
                }
                v19 = 0;
LABEL_171:

                goto LABEL_172;
              }
              if (a3)
              {
                v44 = (void *)MEMORY[0x1E0CB35C8];
                v293 = *MEMORY[0x1E0CB2D50];
                v45 = (void *)MEMORY[0x1E0CB3940];
                v260 = v263;
                v46 = CMTimeGetSeconds(&v260);
                v259 = v271.start;
                v47 = CMTimeGetSeconds(&v259);
                v257 = v271;
                CMTimeRangeGetEnd(&v258, &v257);
                objc_msgSend(v45, "stringWithFormat:", CFSTR("Mask time (%0.3fs) falls outside video time range (%0.3fs-%0.3fs)"), *(_QWORD *)&v46, *(_QWORD *)&v47, CMTimeGetSeconds(&v258));
                v203 = (void *)objc_claimAutoreleasedReturnValue();
                v294 = v203;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v294, &v293, 1);
                v204 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = 0;
                v49 = *a3;
                *a3 = v48;
LABEL_170:

                v29 = (void *)v204;
                goto LABEL_171;
              }
LABEL_49:
              v19 = 0;
LABEL_172:
              v22 = v205;
              goto LABEL_173;
            }
            goto LABEL_27;
          }
        }
        else
        {
          memset(&v286, 0, 24);
        }
        v28 = self->_asset;
        if (v28)
        {
          -[MADServiceVideoAsset stillTime](v28, "stillTime");
          goto LABEL_28;
        }
LABEL_27:
        memset(&v263, 0, sizeof(v263));
        goto LABEL_28;
      }
      v21 = (void *)objc_msgSend(v12, "copy");
    }
    else
    {
      if (!a3)
      {
        v19 = 0;
LABEL_174:

        return v19;
      }
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v298 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load asset"));
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      v299[0] = v206;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v299, &v298, 1);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -50);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v19 = 0;
    v22 = *a3;
    *a3 = v21;
LABEL_173:

    goto LABEL_174;
  }
  return 0;
}

void __40__MADVideoRemoveBackgroundCropTask_run___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "fractionCompleted");
    v4 = 134217984;
    v5 = v2 * 100.0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[RMBG] Progress: %0.2f%%", (uint8_t *)&v4, 0xCu);
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "fractionCompleted");
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

void __40__MADVideoRemoveBackgroundCropTask_run___block_invoke_310(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  VCPSignPostLog();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);

  VCPSignPostLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "MADVideoRemoveBackground_TrackMaskPastFrames", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "processPastSampleBuffers:orientation:maskPixelBuffer:cropUnion:progress:error:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 48, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_END, v3, "MADVideoRemoveBackground_TrackMaskPastFrames", ", v11, 2u);
  }

}

- (NSString)signpostPayload
{
  return self->_signpostPayload;
}

- (void)setSignpostPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_resultHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_previewRequest, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (void)generateMaskForSampleBuffer:orientation:error:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot lock NULL CVPixelBuffer", v0, 2u);
}

- (void)generateMaskForSampleBuffer:(uint64_t)a3 orientation:(uint64_t)a4 error:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B6C4A000, MEMORY[0x1E0C81028], a3, "Failed to lock CVPixelBuffer (%p, %d)", a5, a6, a7, a8, 0);
}

@end
