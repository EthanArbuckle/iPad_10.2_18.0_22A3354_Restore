@implementation VCPMADMLEnhancementTask

- (VCPMADMLEnhancementTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADMLEnhancementTask *v12;
  VCPMADMLEnhancementTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADMLEnhancementTask;
  v12 = -[VCPMADMLEnhancementTask init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_imageAsset, a4);
    objc_storeStrong((id *)&v13->_signpostPayload, a5);
  }

  return v13;
}

+ (id)taskWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  id v13;
  objc_class *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRequest:imageAsset:andSignpostPayload:", v8, v9, v10);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Incompatible request (%@) specified to %@", (uint8_t *)&v17, 0x16u);

    }
    v11 = 0;
  }

  return v11;
}

+ (id)dependencies
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (float)resourceRequirement
{
  return 1.0;
}

- (BOOL)autoCancellable
{
  return 0;
}

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
}

- (int)convertPixelFormat:(__CVBuffer *)a3
{
  __CVBuffer *v5;
  CF<__CVPixelBufferPool *> *p_pixelBufferPool;
  CF<OpaqueVTPixelTransferSession *> *p_transferSession;
  OpaqueVTPixelTransferSession *value;
  __CVPixelBufferPool *v9;
  CVReturn v10;
  __CVBuffer *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const __CFDictionary *v16;
  uint8_t v18[8];
  CFTypeRef cf;
  CVPixelBufferRef pixelBuffer;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v5 = *a3;
  cf = 0;
  pixelBuffer = v5;
  p_pixelBufferPool = &self->_pixelBufferPool;
  if (self->_pixelBufferPool.value_)
    goto LABEL_2;
  if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Pixel buffer format is not 32BGRA; copying",
      v18,
      2u);
  }
  v12 = *MEMORY[0x1E0CA9040];
  v22[0] = &unk_1E6B74780;
  v13 = *MEMORY[0x1E0CA90E0];
  v21[0] = v12;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetWidth(pixelBuffer));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  v21[2] = *MEMORY[0x1E0CA8FD8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", CVPixelBufferGetHeight(pixelBuffer));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = *MEMORY[0x1E0CA8FF0];
  v22[2] = v15;
  v22[3] = MEMORY[0x1E0C9AA70];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (p_pixelBufferPool->value_)
  {
    CFRelease(p_pixelBufferPool->value_);
    p_pixelBufferPool->value_ = 0;
  }
  v10 = CVPixelBufferPoolCreate(0, 0, v16, &p_pixelBufferPool->value_);

  if (!v10)
  {
LABEL_2:
    value = self->_transferSession.value_;
    p_transferSession = &self->_transferSession;
    if (value || (v10 = VTPixelTransferSessionCreate(0, &p_transferSession->value_)) == 0)
    {
      v9 = p_pixelBufferPool->value_;
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      v10 = CVPixelBufferPoolCreatePixelBuffer(0, v9, (CVPixelBufferRef *)&cf);
      if (!v10)
      {
        v10 = VTPixelTransferSessionTransferImage(p_transferSession->value_, pixelBuffer, (CVPixelBufferRef)cf);
        if (!v10)
        {
          v11 = (__CVBuffer *)cf;
          if (cf)
            v11 = (__CVBuffer *)CFRetain(cf);
          v10 = 0;
          *a3 = v11;
        }
      }
    }
  }
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&pixelBuffer);
  return v10;
}

- (int)createModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  int v13;
  void *v14;
  NSString *v15;
  CNNMLEnhancerEspresso *v16;
  CNNMLEnhancerEspresso **p_enhancer;
  CNNMLEnhancerEspresso *enhancer;
  void *v19;
  NSString *v20;
  NSString *modelName;
  NSString *v22;
  NSString *modelVersion;
  NSString *v24;
  uint64_t v25;
  void *v26;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  void *v31;
  NSString *v32;
  void *v33;
  id v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  NSString *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  +[VCPMobileAssetManager sharedManager](VCPMobileAssetManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "retrieveAssetLocalURL:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MADMLEnhancementRequest uuid](self->_request, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] UUID not set, creating universal model", buf, 2u);
      }
      v14 = v4;
      goto LABEL_21;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("index.json"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &v34);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSString *)v34;
      if (v9)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_DWORD *)buf = 138412290;
        v36 = v9;
        v10 = MEMORY[0x1E0C81028];
        v11 = "[VCPMADMLEnhancementTask] Serializing index.json error %@";
        v12 = 12;
LABEL_42:
        _os_log_impl(&dword_1B6C4A000, v10, OS_LOG_TYPE_ERROR, v11, buf, v12);
LABEL_43:
        v13 = -18;
LABEL_44:

        goto LABEL_45;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((int)MediaAnalysisLogLevel() < 3 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_WORD *)buf = 0;
        v10 = MEMORY[0x1E0C81028];
        v11 = "[VCPMADMLEnhancementTask] Parsing index.json error, not a dictionary";
        v12 = 2;
        goto LABEL_42;
      }
      v33 = v8;
      -[MADMLEnhancementRequest uuid](self->_request, "uuid");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("name"));
          v20 = (NSString *)objc_claimAutoreleasedReturnValue();
          modelName = self->_modelName;
          self->_modelName = v20;

          objc_msgSend(v8, "objectForKey:", CFSTR("ver"));
          v22 = (NSString *)objc_claimAutoreleasedReturnValue();
          modelVersion = self->_modelVersion;
          self->_modelVersion = v22;

          objc_msgSend(v3, "retrieveAssetLocalURL:assetVersion:petWatchDog:cancelBlock:", self->_modelName, self->_modelVersion, 0, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v24 = self->_modelName;
              v32 = self->_modelVersion;
              -[MADMLEnhancementRequest uuid](self->_request, "uuid");
              v25 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v36 = v24;
              v37 = 2112;
              v38 = v32;
              v39 = 2112;
              v40 = v25;
              v26 = (void *)v25;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Creating %@ (%@) for %@", buf, 0x20u);

            }
LABEL_20:

LABEL_21:
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:relativeToURL:", CFSTR("pissarro.espresso.net"), v14);
            v15 = (NSString *)objc_claimAutoreleasedReturnValue();
            v16 = -[CNNMLEnhancerEspresso initWithModelFile:]([CNNMLEnhancerEspresso alloc], "initWithModelFile:", v15);
            enhancer = self->_enhancer;
            p_enhancer = &self->_enhancer;
            *p_enhancer = v16;

            if (*p_enhancer)
            {
              if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v15;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Model created from %@", buf, 0xCu);
              }
              v13 = 0;
            }
            else
            {
              if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to allocate enhancer", buf, 2u);
              }
              v13 = -108;
            }

            goto LABEL_45;
          }
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v30 = self->_modelName;
            v29 = self->_modelVersion;
            -[MADMLEnhancementRequest uuid](self->_request, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v36 = v30;
            v37 = 2112;
            v38 = v29;
            v39 = 2112;
            v40 = (uint64_t)v31;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to retrieve %@ (%@) for %@", buf, 0x20u);

          }
          v4 = 0;
        }
        else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Parsing index.json error, model info is not a dictionary", buf, 2u);
        }
        v13 = -18;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          -[MADMLEnhancementRequest uuid](self->_request, "uuid");
          v28 = (NSString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v36 = v28;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] No model registered for target %@", buf, 0xCu);

        }
        v13 = -4;
      }
      v9 = (NSString *)v33;
      goto LABEL_44;
    }
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[VCPMADMLEnhancementTask] Cannot read index.json, using universal model", buf, 2u);
    }
    v14 = v4;
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPMADMLEnhancementTask] Unable to retrieve Pissarro index or universal model", buf, 2u);
  }
  v13 = -18;
LABEL_45:

  return v13;
}

- (int)run
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  CVReturn v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t numer;
  MADMLEnhancementRequest *request;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CF<__CVPixelBufferPool *> *p_outputPixelBufferPool;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSString *modelVersion;
  NSString *modelName;
  void *v28;
  int v29;
  __CVPixelBufferPool *value;
  int v31;
  uint64_t v32;
  MADMLEnhancementRequest *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  const __CFDictionary *v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  uint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  NSString *v54;
  uint64_t v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  MADMLEnhancementRequest *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  os_signpost_id_t spid;
  vImage_Buffer dest;
  _DWORD v71[6];
  CVPixelBufferRef pixelBufferOut;
  CVReturn v73;
  CVPixelBufferRef v74;
  CVPixelBufferLockFlags unlockFlags;
  int v76;
  CVPixelBufferRef pixelBuffer;
  mach_timebase_info info;
  CFTypeRef cf;
  uint64_t v80;
  void *v81;
  _QWORD v82[6];
  _QWORD v83[6];
  void *v84;
  vImage_Buffer buf;
  _QWORD v86[4];
  _QWORD v87[4];
  uint64_t v88;
  _QWORD v89[4];

  v89[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  mach_timebase_info(&info);
  v5 = mach_absolute_time();
  v6 = mach_absolute_time();
  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  VCPSignPostLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VCPMADMLEnhancementModelCreation", ", (uint8_t *)&buf, 2u);
  }

  v11 = -[VCPMADMLEnhancementTask createModel](self, "createModel");
  if (!v11)
  {
    VCPSignPostLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf.data) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v13, OS_SIGNPOST_INTERVAL_END, v8, "VCPMADMLEnhancementModelCreation", ", (uint8_t *)&buf, 2u);
    }

    if (v6)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    v14 = mach_absolute_time();
    numer = info.numer;
    LODWORD(v2) = info.denom;
    if (-[MADMLEnhancementRequest modelPreparationOnly](self->_request, "modelPreparationOnly"))
    {
      if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[VCPMADMLEnhancementTask] Finished model preparation", (uint8_t *)&buf, 2u);
      }
LABEL_19:
      v11 = 0;
      goto LABEL_20;
    }
    pixelBuffer = 0;
    v76 = 0;
    if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &pixelBuffer, &v76))
    {
      if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADMLEnhancementTask image loading failed", (uint8_t *)&buf, 2u);
      }
      request = self->_request;
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v88 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image loading failed"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, &v88, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADMLEnhancementRequest setError:](request, "setError:", v20);

      goto LABEL_19;
    }
    if (CVPixelBufferGetPixelFormatType(pixelBuffer) != 1111970369)
      -[VCPMADMLEnhancementTask convertPixelFormat:](self, "convertPixelFormat:", &pixelBuffer);
    p_outputPixelBufferPool = &self->_outputPixelBufferPool;
    if (self->_outputPixelBufferPool.value_)
      goto LABEL_24;
    v38 = *MEMORY[0x1E0CA90E0];
    v86[0] = *MEMORY[0x1E0CA9040];
    v86[1] = v38;
    v87[0] = &unk_1E6B74780;
    v87[1] = &unk_1E6B74798;
    v39 = *MEMORY[0x1E0CA8FF0];
    v86[2] = *MEMORY[0x1E0CA8FD8];
    v86[3] = v39;
    v87[2] = &unk_1E6B747B0;
    v87[3] = MEMORY[0x1E0C9AA70];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 4);
    v40 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (p_outputPixelBufferPool->value_)
    {
      CFRelease(p_outputPixelBufferPool->value_);
      p_outputPixelBufferPool->value_ = 0;
    }
    v11 = CVPixelBufferPoolCreate(0, 0, v40, &self->_outputPixelBufferPool.value_);

    if (!v11)
    {
LABEL_24:
      v67 = mach_absolute_time();
      v68 = mach_absolute_time();
      VCPSignPostLog();
      v23 = objc_claimAutoreleasedReturnValue();
      spid = os_signpost_id_generate(v23);

      VCPSignPostLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        modelName = self->_modelName;
        modelVersion = self->_modelVersion;
        -[MADMLEnhancementRequest uuid](self->_request, "uuid");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.data) = 138412802;
        *(void **)((char *)&buf.data + 4) = modelName;
        WORD2(buf.height) = 2112;
        *(vImagePixelCount *)((char *)&buf.height + 6) = (vImagePixelCount)modelVersion;
        HIWORD(buf.width) = 2112;
        buf.rowBytes = (size_t)v28;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v25, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPMADMLEnhancementModelExecution", "%@-%@ (%@)", (uint8_t *)&buf, 0x20u);

      }
      if (CVPixelBufferGetWidth(pixelBuffer) == 3840 && CVPixelBufferGetHeight(pixelBuffer) == 2160)
      {
        v29 = 0;
        goto LABEL_30;
      }
      v73 = 0;
      v74 = pixelBuffer;
      unlockFlags = 1;
      if (pixelBuffer)
      {
        v11 = CVPixelBufferLockBaseAddress(pixelBuffer, 1uLL);
        v73 = v11;
        if (!v11
          || os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR)
          && (LODWORD(buf.data) = 134218240,
              *(void **)((char *)&buf.data + 4) = v74,
              WORD2(buf.height) = 1024,
              *(_DWORD *)((char *)&buf.height + 6) = v11,
              _os_log_error_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to lock CVPixelBuffer (%p, %d)", (uint8_t *)&buf, 0x12u), (v11 = v73) == 0))
        {
          buf.data = CVPixelBufferGetBaseAddress(pixelBuffer);
          buf.height = CVPixelBufferGetHeight(pixelBuffer);
          buf.width = CVPixelBufferGetWidth(pixelBuffer);
          buf.rowBytes = CVPixelBufferGetBytesPerRow(pixelBuffer);
          pixelBufferOut = 0;
          v31 = CVPixelBufferPoolCreatePixelBuffer(0, p_outputPixelBufferPool->value_, &pixelBufferOut);
          if (v31)
          {
            v11 = 0;
            v37 = 16;
            goto LABEL_57;
          }
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)v71, pixelBufferOut, 0);
          v11 = v71[0];
          if (v71[0])
          {
            v31 = 0;
          }
          else
          {
            dest.data = CVPixelBufferGetBaseAddress(pixelBufferOut);
            dest.height = CVPixelBufferGetHeight(pixelBufferOut);
            dest.width = CVPixelBufferGetWidth(pixelBufferOut);
            dest.rowBytes = CVPixelBufferGetBytesPerRow(pixelBufferOut);
            v31 = vImageScale_ARGB8888(&buf, &dest, 0, 0x20u);
            if (v31)
            {
              v11 = 0;
              v37 = 16;
              goto LABEL_56;
            }
            v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)v71);
            if (!v11)
            {
              v11 = CVPixelBufferLock::Unlock((CVPixelBufferLock *)&v73);
              if (!v11)
              {
                CVPixelBufferRelease(pixelBuffer);
                v37 = 0;
                v11 = 0;
                pixelBuffer = pixelBufferOut;
                goto LABEL_56;
              }
            }
          }
          v37 = 1;
LABEL_56:
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)v71);
LABEL_57:
          if (v74
            && !v73
            && CVPixelBufferUnlockBaseAddress(v74, unlockFlags)
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            -[MADHEICSAlphaSequenceWriter demuxPixelBuffer:imagePixelBuffer:alphaPixelBuffer:].cold.2();
          }
          if (v37)
          {
            if (v37 != 16)
              goto LABEL_20;
            goto LABEL_64;
          }
          v29 = v31;
LABEL_30:
          value = p_outputPixelBufferPool->value_;
          if (cf)
          {
            CFRelease(cf);
            cf = 0;
          }
          v31 = CVPixelBufferPoolCreatePixelBuffer(0, value, (CVPixelBufferRef *)&cf);
          if (!v31)
          {
            -[CNNMLEnhancerEspresso inferenceWithPixelBuffer:toDestinationPixelBuffer:](self->_enhancer, "inferenceWithPixelBuffer:toDestinationPixelBuffer:", pixelBuffer, cf);
            CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
            v32 = objc_claimAutoreleasedReturnValue();
            if (!v32
              && (int)MediaAnalysisLogLevel() >= 3
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.data) = 0;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLEnhancementTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
            }
            v33 = self->_request;
            v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47708]), "initWithSurface:", v32);
            v84 = v34;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v84, 1);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            -[MADMLEnhancementRequest setResults:](v33, "setResults:", v35);

            v36 = (void *)v32;
            v31 = v29;
            goto LABEL_65;
          }
LABEL_64:
          v36 = 0;
LABEL_65:
          VCPSignPostLog();
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
          {
            LOWORD(buf.data) = 0;
            _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v50, OS_SIGNPOST_INTERVAL_END, spid, "VCPMADMLEnhancementModelExecution", ", (uint8_t *)&buf, 2u);
          }

          if (v68)
          {
            mach_absolute_time();
            VCPPerformance_LogMeasurement();
          }
          v51 = mach_absolute_time();
          v82[0] = CFSTR("RequestType");
          v82[1] = CFSTR("AssetType");
          v52 = CFSTR("Unknown");
          v53 = (const __CFString *)self->_modelName;
          v54 = self->_modelVersion;
          if (!v53)
            v53 = CFSTR("Unknown");
          v83[0] = CFSTR("AerialWallpaperEnhancement");
          v83[1] = v53;
          v55 = info.numer;
          LODWORD(v3) = info.denom;
          if (v54)
            v52 = (const __CFString *)v54;
          v83[2] = v52;
          v82[2] = CFSTR("AssetSubtype");
          v82[3] = CFSTR("Client");
          -[MADMLEnhancementRequest uuid](self->_request, "uuid");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            -[MADMLEnhancementRequest uuid](self->_request, "uuid");
            v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v57 = CFSTR("Unknown");
          }
          v83[3] = v57;
          v82[4] = CFSTR("QueuedTime");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)((v14 - v5) * numer) / (double)v2 / 1000000.0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v83[4] = v58;
          v82[5] = CFSTR("ProcessingTime");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)((v51 - v67) * v55) / (double)v3 / 1000000.0);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v83[5] = v59;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 6);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
          if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            LODWORD(buf.data) = 138412290;
            *(void **)((char *)&buf.data + 4) = v60;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "VCPMADMLEnhancementTask Report CoreAnalytics: %@", (uint8_t *)&buf, 0xCu);
          }
          +[VCPMADCoreAnalyticsManager sharedManager](VCPMADCoreAnalyticsManager, "sharedManager");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "sendEvent:withAnalytics:", CFSTR("com.apple.mediaanalysisd.service.request"), v60);

          if (v31)
          {
            v62 = self->_request;
            v63 = (void *)MEMORY[0x1E0CB35C8];
            v80 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Image pre-processing failed"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v64;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v31, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[MADMLEnhancementRequest setError:](v62, "setError:", v66);

          }
          else if (pixelBuffer)
          {
            CVPixelBufferRelease(pixelBuffer);
          }

          goto LABEL_19;
        }
      }
      else
      {
        v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v41)
          -[VCPVideoCNNAnalyzer copyImage:withChannels:settling:].cold.1(v41, v42, v43, v44, v45, v46, v47, v48);
        v11 = -50;
      }
    }
  }
LABEL_20:
  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return v11;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_outputPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_enhancer, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  return self;
}

@end
