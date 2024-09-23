@implementation VCPMADMLScalingTask

- (VCPMADMLScalingTask)initWithRequest:(id)a3 imageAsset:(id)a4 andSignpostPayload:(id)a5
{
  id v9;
  id v10;
  id v11;
  VCPMADMLScalingTask *v12;
  VCPMADMLScalingTask *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)VCPMADMLScalingTask;
  v12 = -[VCPMADMLScalingTask init](&v15, sel_init);
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

+ (int64_t)getDownsamplingMode
{
  return 2;
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
  v22[0] = &unk_1E6B72DD0;
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

- (int)run
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  MADMLScalingRequest *request;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MADMLScalingRequest *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int Width;
  int Height;
  CF<__CVPixelBufferPool *> *p_outputPixelBufferPool;
  __CVPixelBufferPool *v24;
  MADMLScalingRequest *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFDictionary *Mutable;
  __CFDictionary *v31;
  CFNumberRef v32;
  __CFDictionary *v33;
  CFNumberRef v34;
  __CFDictionary *v35;
  CFNumberRef v36;
  const __CFDictionary *v37;
  MADMLScalingRequest *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CNNMLScalerEspresso *v44;
  CNNMLScalerEspresso *v45;
  MADMLScalingRequest *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  MADMLScalingRequest *v51;
  void *v52;
  float v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  MADMLScalingRequest *v66;
  void *v67;
  uint64_t v68;
  MADMLScalingRequest *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  NSObject *v73;
  MADMLScalingRequest *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  vImage_Buffer value;
  _DWORD valuePtr[6];
  CFMutableDictionaryRef theDict[3];
  vImage_Buffer buf;
  int v83;
  CVPixelBufferRef texture;
  CFTypeRef cf;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  _QWORD v93[3];
  _QWORD v94[3];
  const __CFString *v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  _QWORD v106[3];

  v106[1] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v3 = -[MADMLScalingRequest scaledImageWidth](self->_request, "scaledImageWidth");
  v4 = -[MADMLScalingRequest scaledImageHeight](self->_request, "scaledImageHeight");
  VCPSignPostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  VCPSignPostLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "VCPMADMLScalingTask", ", (uint8_t *)&buf, 2u);
  }

  texture = 0;
  v83 = 0;
  if (-[VCPMADServiceImageAsset loadPixelBuffer:orientation:](self->_imageAsset, "loadPixelBuffer:orientation:", &texture, &v83))
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADMLScalingTask: Failed to load pixel buffer", (uint8_t *)&buf, 2u);
    }
    request = self->_request;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v105 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load pixel buffer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, &v105, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](request, "setError:", v13);

    goto LABEL_9;
  }
  if (CVPixelBufferGetPixelFormatType(texture) != 1111970369
    && -[VCPMADMLScalingTask convertPixelFormat:](self, "convertPixelFormat:", &texture))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to convert pixel format", (uint8_t *)&buf, 2u);
    }
    v16 = self->_request;
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v103 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to convert pixel format"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](v16, "setError:", v20);

    goto LABEL_9;
  }
  Width = CVPixelBufferGetWidth(texture);
  Height = CVPixelBufferGetHeight(texture);
  p_outputPixelBufferPool = &self->_outputPixelBufferPool;
  v24 = self->_outputPixelBufferPool.value_;
  if (!v24)
  {
    value.data = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v31 = Mutable;
    theDict[0] = Mutable;
    if (value.data && Mutable)
    {
      valuePtr[0] = v3;
      v32 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v32;
      if (v32)
        CFDictionarySetValue(v31, (const void *)*MEMORY[0x1E0CA90E0], v32);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      v33 = theDict[0];
      valuePtr[0] = v4;
      v34 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v34;
      if (v34)
        CFDictionarySetValue(v33, (const void *)*MEMORY[0x1E0CA8FD8], v34);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      v35 = theDict[0];
      valuePtr[0] = 1111970369;
      v36 = CFNumberCreate(0, kCFNumberSInt32Type, valuePtr);
      buf.data = v36;
      if (v36)
        CFDictionarySetValue(v35, (const void *)*MEMORY[0x1E0CA9040], v36);
      CF<opaqueCMSampleBuffer *>::~CF((const void **)&buf.data);
      CFDictionarySetValue(theDict[0], (const void *)*MEMORY[0x1E0CA8FF0], value.data);
      v37 = theDict[0];
      if (p_outputPixelBufferPool->value_)
      {
        CFRelease(p_outputPixelBufferPool->value_);
        p_outputPixelBufferPool->value_ = 0;
      }
      if (!CVPixelBufferPoolCreate(0, 0, v37, &self->_outputPixelBufferPool.value_))
      {
        CF<opaqueCMSampleBuffer *>::~CF((const void **)theDict);
        CF<opaqueCMSampleBuffer *>::~CF((const void **)&value.data);
        v24 = p_outputPixelBufferPool->value_;
        goto LABEL_20;
      }
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer pool", (uint8_t *)&buf, 2u);
      }
      v38 = self->_request;
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v99 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create pixel buffer pool"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -108, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADMLScalingRequest setError:](v38, "setError:", v42);
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.data) = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer pool", (uint8_t *)&buf, 2u);
      }
      v51 = self->_request;
      v52 = (void *)MEMORY[0x1E0CB35C8];
      v101 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create pixel buffer pool"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -108, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[MADMLScalingRequest setError:](v51, "setError:", v42);
    }

    CF<opaqueCMSampleBuffer *>::~CF((const void **)theDict);
    CF<opaqueCMSampleBuffer *>::~CF((const void **)&value.data);
LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
LABEL_20:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (CVPixelBufferPoolCreatePixelBuffer(0, v24, (CVPixelBufferRef *)&cf))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to create pixel buffer", (uint8_t *)&buf, 2u);
    }
    v25 = self->_request;
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v97 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create pixel buffer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -108, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](v25, "setError:", v29);

    goto LABEL_9;
  }
  if ((int)v3 < Width || (int)v4 < Height)
  {
    v53 = (float)(int)v3 / (float)Width;
    if (+[VCPMADMLScalingTask getDownsamplingMode](VCPMADMLScalingTask, "getDownsamplingMode"))
    {
      if (+[VCPMADMLScalingTask getDownsamplingMode](VCPMADMLScalingTask, "getDownsamplingMode") == 1)
      {
        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", texture);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = CFSTR("inputScale");
        *(float *)&v55 = v53;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v94[0] = v56;
        v94[1] = &unk_1E6B72DE8;
        v93[1] = CFSTR("inputB");
        v93[2] = CFSTR("inputC");
        v94[2] = &unk_1E6B722F0;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "imageByApplyingFilter:withInputParameters:", CFSTR("CIBicubicScaleTransform"), v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C9DD90], "context");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "render:toCVPixelBuffer:", v58, cf);

      }
      else if (+[VCPMADMLScalingTask getDownsamplingMode](VCPMADMLScalingTask, "getDownsamplingMode") == 2)
      {
        CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)theDict, texture, 1uLL);
        if (!LODWORD(theDict[0]))
        {
          buf.data = CVPixelBufferGetBaseAddress(texture);
          buf.height = CVPixelBufferGetHeight(texture);
          buf.width = CVPixelBufferGetWidth(texture);
          buf.rowBytes = CVPixelBufferGetBytesPerRow(texture);
          CVPixelBufferLock::CVPixelBufferLock((CVPixelBufferLock *)valuePtr, (CVPixelBufferRef)cf, 0);
          if (!valuePtr[0])
          {
            value.data = CVPixelBufferGetBaseAddress((CVPixelBufferRef)cf);
            value.height = CVPixelBufferGetHeight((CVPixelBufferRef)cf);
            value.width = CVPixelBufferGetWidth((CVPixelBufferRef)cf);
            value.rowBytes = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)cf);
            vImageScale_ARGB8888(&buf, &value, 0, 0);
            if (!CVPixelBufferLock::Unlock((CVPixelBufferLock *)theDict)
              && !CVPixelBufferLock::Unlock((CVPixelBufferLock *)valuePtr))
            {
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)valuePtr);
              CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)theDict);
              goto LABEL_74;
            }
          }
          CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)valuePtr);
        }
        CVPixelBufferLock::~CVPixelBufferLock((CVPixelBufferLock *)theDict);
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:", texture);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = CFSTR("inputScale");
      *(float *)&v61 = v53;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = v62;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "imageByApplyingFilter:withInputParameters:", CFSTR("CILanczosScaleTransform"), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DD90], "context");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "render:toCVPixelBuffer:", v64, cf);

    }
LABEL_74:
    CVBufferPropagateAttachments(texture, (CVBufferRef)cf);
    goto LABEL_75;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("out_res_%dx%d"), v3, v4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[CNNMLScalerEspresso initWithConfig:modelIndex:scalingFactor:]([CNNMLScalerEspresso alloc], "initWithConfig:modelIndex:scalingFactor:", v43, -[MADMLScalingRequest scalingModelIndex](self->_request, "scalingModelIndex"), ((int)v3 / Width));
  v45 = v44;
  if (!v44)
  {
    if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "VCPMADMLScalingTask: Failed to initialize model", (uint8_t *)&buf, 2u);
    }
    v66 = self->_request;
    v67 = (void *)MEMORY[0x1E0CB35C8];
    v91 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to initialize model"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](v66, "setError:", v50);
    goto LABEL_64;
  }
  if (-[CNNMLScalerEspresso inferenceWithPixelBuffer:toDestinationPixelBuffer:](v44, "inferenceWithPixelBuffer:toDestinationPixelBuffer:", texture, cf))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask: Failed to inference with model", (uint8_t *)&buf, 2u);
    }
    v46 = self->_request;
    v47 = (void *)MEMORY[0x1E0CB35C8];
    v89 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to inference with model"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](v46, "setError:", v50);
LABEL_64:

    goto LABEL_9;
  }

LABEL_75:
  CVPixelBufferGetIOSurface((CVPixelBufferRef)cf);
  v68 = objc_claimAutoreleasedReturnValue();
  if (!v68)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADImageCaptionTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
    }
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.data) = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "VCPMADMLScalingTask failed creating output IOSurface", (uint8_t *)&buf, 2u);
    }
    v74 = self->_request;
    v75 = (void *)MEMORY[0x1E0CB35C8];
    v87 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating output IOSurface failed"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -18, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[MADMLScalingRequest setError:](v74, "setError:", v78);

    goto LABEL_9;
  }
  v69 = self->_request;
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D47718]), "initWithSurface:", v68);
  v86 = v70;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  -[MADMLScalingRequest setResults:](v69, "setResults:", v71);

  VCPSignPostLog();
  v72 = objc_claimAutoreleasedReturnValue();
  v73 = v72;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
  {
    LOWORD(buf.data) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v73, OS_SIGNPOST_INTERVAL_END, v6, "VCPMADMLScalingTask", ", (uint8_t *)&buf, 2u);
  }

  v14 = (void *)v68;
LABEL_10:
  if (texture)
    CVPixelBufferRelease(texture);

  CF<opaqueCMSampleBuffer *>::~CF(&cf);
  return 0;
}

- (void).cxx_destruct
{
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_transferSession.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_outputPixelBufferPool.value_);
  CF<opaqueCMSampleBuffer *>::~CF((const void **)&self->_pixelBufferPool.value_);
  objc_storeStrong((id *)&self->_signpostPayload, 0);
  objc_storeStrong((id *)&self->_imageAsset, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  return self;
}

@end
