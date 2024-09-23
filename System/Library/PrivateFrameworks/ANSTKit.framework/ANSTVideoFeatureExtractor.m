@implementation ANSTVideoFeatureExtractor

- (int64_t)windowSize
{
  return 16;
}

- (ANSTVideoFeatureExtractor)initWithConfiguration:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  ANSTVideoFeatureExtractor *v14;

  v4 = a3;
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_235911D98(v5, v6, v7, v8, v9, v10, v11, v12);

  v14 = (ANSTVideoFeatureExtractor *)objc_msgSend__initWithConfig_error_(self, v13, (uint64_t)v4, 0);
  return v14;
}

- (ANSTVideoFeatureExtractor)initWithConfig:(id)a3 error:(id *)a4
{
  _BYTE *v5;
  id v6;
  ANSTVideoFeatureExtractor *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id v12;

  v12 = 0;
  v5 = (_BYTE *)objc_msgSend__initWithConfig_error_(self, a2, (uint64_t)a3, &v12);
  v6 = v12;
  if (v5[105])
  {
    v7 = v5;
  }
  else
  {
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_235911E08((uint64_t)v6, v8);

    objc_msgSend_releaseResourceSafely(v5, v9, v10);
    v7 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }

  return v7;
}

- (id)_initWithConfig:(id)a3 error:(id *)a4
{
  id v7;
  ANSTVideoFeatureExtractor *v8;
  ANSTVideoFeatureExtractor *v9;
  ANSTVideoFoundationModelConfiguration *v10;
  const char *v11;
  void *v12;
  ANSTVideoFoundationModel *v13;
  const char *v14;
  uint64_t v15;
  ANSTVideoFoundationModel *model;
  const char *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  size_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  ANSTTensorData *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  ANSTTensorData *currentVideoFeatureData;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSMutableSet *modalityStatus;
  VTSessionRef *p_pixelTransferSession;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  size_t v65;
  const char *v66;
  objc_super v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  _QWORD v71[2];

  v71[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ANSTVideoFeatureExtractor;
  v8 = -[ANSTVideoFeatureExtractor init](&v67, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v10 = [ANSTVideoFoundationModelConfiguration alloc];
    v12 = (void *)objc_msgSend_initWithVersion_(v10, v11, 0x10000);
    v13 = [ANSTVideoFoundationModel alloc];
    v15 = objc_msgSend_initWithConfiguration_(v13, v14, (uint64_t)v12);
    model = v9->_model;
    v9->_model = (ANSTVideoFoundationModel *)v15;

    if (!objc_msgSend_prepareWithError_(v9->_model, v17, (uint64_t)a4))
      goto LABEL_13;
    objc_msgSend_outputFeatureDescriptor(v9->_model, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_sizeInBytes(v20, v21, v22);

    v26 = objc_msgSend_windowSize(v9, v24, v25);
    v9->_windowBuffer = (float **)malloc_type_malloc(8 * v26, 0x80040B8603338uLL);
    if (objc_msgSend_windowSize(v9, v27, v28) >= 1)
    {
      v29 = 0;
      do
        v9->_windowBuffer[v29++] = (float *)malloc_type_calloc(1uLL, v23, 0xAB6E4948uLL);
      while (objc_msgSend_windowSize(v9, v30, v31) > v29);
    }
    v9->_currentIndex = 0;
    v9->_windowSum = (float *)malloc_type_calloc(1uLL, v23, 0x7B97DDB0uLL);
    v9->_normalizedMeanFeature = (float *)malloc_type_calloc(1uLL, v23, 0x34A3D00EuLL);
    v32 = [ANSTTensorData alloc];
    objc_msgSend_outputFeatureDescriptor(v9->_model, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend_initWithDescriptor_dataPointer_length_deallocator_error_(v32, v36, (uint64_t)v35, v9->_normalizedMeanFeature, v23, 0, a4);
    currentVideoFeatureData = v9->_currentVideoFeatureData;
    v9->_currentVideoFeatureData = (ANSTTensorData *)v37;

    if (!v9->_currentVideoFeatureData)
      goto LABEL_13;
    v9->_inputBindingCommitted = 0;
    objc_msgSend_set(MEMORY[0x24BDBCEF0], v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    modalityStatus = v9->_modalityStatus;
    v9->_modalityStatus = (NSMutableSet *)v41;

    p_pixelTransferSession = (VTSessionRef *)&v9->_pixelTransferSession;
    if (VTPixelTransferSessionCreate(0, &v9->_pixelTransferSession)
      || VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9680], (CFTypeRef)*MEMORY[0x24BDF98F0])|| VTSessionSetProperty(*p_pixelTransferSession, (CFStringRef)*MEMORY[0x24BDF9678], (CFTypeRef)*MEMORY[0x24BDBD270]))
    {
      if (a4)
      {
        v46 = (void *)MEMORY[0x24BDD1540];
        v70 = *MEMORY[0x24BDD0BA0];
        v71[0] = CFSTR("Failed to prepare VTPixelTransferSession.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)v71, &v70, 1);
LABEL_12:
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorWithDomain_code_userInfo_(v46, v48, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v47);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend_inputImageDescriptor(v9->_model, v44, v45);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend_pixelFormatType(v50, v51, v52);
      objc_msgSend_inputImageDescriptor(v9->_model, v54, v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = (const char *)objc_msgSend_width(v56, v57, v58);
      objc_msgSend_inputImageDescriptor(v9->_model, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = objc_msgSend_height(v62, v63, v64);
      LODWORD(v53) = sub_2358ED0FC(v53, v59, v65, &v9->_preprocessedInputImage);

      if (!(_DWORD)v53)
      {
        v9->_rawInputImage = 0;
        *(_WORD *)&v9->_needsPreprocessing = 257;
        goto LABEL_13;
      }
      if (a4)
      {
        v46 = (void *)MEMORY[0x24BDD1540];
        v68 = *MEMORY[0x24BDD0BA0];
        v69 = CFSTR("Failed to allocate intermediate pixel buffer for preprocessing.");
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v66, (uint64_t)&v69, &v68, 1);
        goto LABEL_12;
      }
    }
LABEL_13:

  }
  return v9;
}

- (void)releaseResourceSafely
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  float *v9;
  float *windowSum;
  float *normalizedMeanFeature;
  OpaqueVTPixelTransferSession *pixelTransferSession;

  objc_msgSend_resetInputBinding(self, a2, v2);
  if (self->_windowBuffer)
  {
    if (objc_msgSend_windowSize(self, v4, v5) >= 1)
    {
      v8 = 0;
      do
      {
        v9 = self->_windowBuffer[v8];
        if (v9)
          free(v9);
        ++v8;
      }
      while (objc_msgSend_windowSize(self, v6, v7) > v8);
    }
    free(self->_windowBuffer);
    self->_windowBuffer = 0;
  }
  windowSum = self->_windowSum;
  if (windowSum)
  {
    free(windowSum);
    self->_windowSum = 0;
  }
  normalizedMeanFeature = self->_normalizedMeanFeature;
  if (normalizedMeanFeature)
  {
    free(normalizedMeanFeature);
    self->_normalizedMeanFeature = 0;
  }
  pixelTransferSession = self->_pixelTransferSession;
  if (pixelTransferSession)
  {
    VTPixelTransferSessionInvalidate(self->_pixelTransferSession);
    CFRelease(pixelTransferSession);
  }
  self->_pixelTransferSession = 0;
  CVPixelBufferRelease(self->_rawInputImage);
  self->_rawInputImage = 0;
  CVPixelBufferRelease(self->_preprocessedInputImage);
  self->_preprocessedInputImage = 0;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_releaseResourceSafely(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)ANSTVideoFeatureExtractor;
  -[ANSTVideoFeatureExtractor dealloc](&v4, sel_dealloc);
}

- (BOOL)digestFrame:(__CVBuffer *)a3 error:(id *)a4
{
  const char *v7;
  const char *v8;
  const char *v9;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  if (self->_initSucceeded)
  {
    objc_msgSend_resetInputBinding(self, a2, (uint64_t)a3);
    if (objc_msgSend_bindVideoInput_error_(self, v7, (uint64_t)a3, a4)
      && objc_msgSend_commitInputBindingWithError_(self, v8, (uint64_t)a4))
    {
      return objc_msgSend_executeInferenceWithError_(self, v9, (uint64_t)a4);
    }
  }
  else if (a4)
  {
    v11 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0BA0];
    v15[0] = CFSTR("Initialization was not successful. Please check error log.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v15, &v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v11, v13, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v12);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (BOOL)bindVideoInput:(__CVBuffer *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  const char *v8;
  int v9;
  __CVBuffer *v10;
  __CVBuffer *rawInputImage;
  __CVBuffer **p_rawInputImage;
  size_t Width;
  __CVBuffer **p_preprocessedInputImage;
  const char *v15;
  size_t Height;
  OSType PixelFormatType;
  BOOL v18;
  CVPixelBufferRef v19;
  const char *v20;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_initSucceeded)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BDD0BA0];
      v25[0] = CFSTR("Initialization was not successful. Please check error log.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v25, &v24, 1);
      goto LABEL_7;
    }
LABEL_8:
    LOBYTE(v9) = 0;
    return v9;
  }
  if (self->_inputBindingCommitted)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BDD1540];
      v22 = *MEMORY[0x24BDD0FC8];
      v23 = CFSTR("Input binding ready comitted. In order to binding new input, please run -[ANSTVideoFeatureExtractor resetInputBinding] first.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)&v23, &v22, 1);
LABEL_7:
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v6, v8, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = a3;
  p_rawInputImage = &self->_rawInputImage;
  rawInputImage = self->_rawInputImage;
  if (rawInputImage != a3)
  {
    CVPixelBufferRelease(rawInputImage);
    *p_rawInputImage = v10;
    CVPixelBufferRetain(v10);
    v10 = *p_rawInputImage;
  }
  Width = CVPixelBufferGetWidth(v10);
  p_preprocessedInputImage = &self->_preprocessedInputImage;
  if (Width == CVPixelBufferGetWidth(self->_preprocessedInputImage)
    && (Height = CVPixelBufferGetHeight(*p_rawInputImage), Height == CVPixelBufferGetHeight(*p_preprocessedInputImage))
    && (PixelFormatType = CVPixelBufferGetPixelFormatType(*p_rawInputImage),
        PixelFormatType == CVPixelBufferGetPixelFormatType(*p_preprocessedInputImage)))
  {
    v18 = 0;
    p_preprocessedInputImage = &self->_rawInputImage;
  }
  else
  {
    v18 = 1;
  }
  v19 = *p_preprocessedInputImage;
  self->_needsPreprocessing = v18;
  v9 = objc_msgSend_bindInputFrameBuffer_error_(self->_model, v15, (uint64_t)v19, a4);
  if (v9)
  {
    objc_msgSend_addObject_(self->_modalityStatus, v20, (uint64_t)CFSTR("Video"));
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)bindAudioInput:(id)a3 error:(id *)a4
{
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (self->_initSucceeded)
  {
    if (a4)
    {
      v8 = (void *)MEMORY[0x24BDD1540];
      v12 = *MEMORY[0x24BDD0FC8];
      v13 = CFSTR("Audio input is not supported yet.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)&v13, &v12, 1);
LABEL_6:
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v8, v10, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else if (a4)
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BDD0BA0];
    v15[0] = CFSTR("Initialization was not successful. Please check error log.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v6, (uint64_t)v15, &v14, 1);
    goto LABEL_6;
  }

  return 0;
}

- (BOOL)executeInferenceWithError:(id *)a3
{
  _QWORD *normalizedMeanFeature;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  __IOSurface *v20;
  void *BaseAddress;
  float *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  size_t v28;
  uint64_t currentIndex;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v36;
  const char *v37;
  uint64_t v38;
  float *windowSum;
  void *v40;
  const char *v41;
  uint64_t v42;
  size_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[2];

  normalizedMeanFeature = a3;
  v55[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_initSucceeded)
  {
    if (!a3)
      return (char)normalizedMeanFeature;
    v17 = (void *)MEMORY[0x24BDD1540];
    v54 = *MEMORY[0x24BDD0BA0];
    v55[0] = CFSTR("Initialization was not successful. Please check error log.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v55, &v54, 1);
LABEL_19:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v17, v34, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v15);
    goto LABEL_20;
  }
  if (!self->_inputBindingCommitted)
  {
    if (!a3)
      return (char)normalizedMeanFeature;
    v17 = (void *)MEMORY[0x24BDD1540];
    v52 = *MEMORY[0x24BDD0FC8];
    v53 = CFSTR("Input binding not committed yet. Please run -[ANSTVideoFeatureExtractor commitInputBinding] first.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)&v53, &v52, 1);
    goto LABEL_19;
  }
  if (!self->_needsPreprocessing
    || !VTPixelTransferSessionTransferImage(self->_pixelTransferSession, self->_rawInputImage, self->_preprocessedInputImage))
  {
    if (!objc_msgSend_executeInferenceWithError_(self->_model, a2, (uint64_t)normalizedMeanFeature))
    {
LABEL_21:
      LOBYTE(normalizedMeanFeature) = 0;
      return (char)normalizedMeanFeature;
    }
    v20 = (__IOSurface *)objc_msgSend_outputFeatureSurfaceRef(self->_model, v18, v19);
    IOSurfaceLock(v20, 1u, 0);
    BaseAddress = IOSurfaceGetBaseAddress(v20);
    v22 = self->_windowBuffer[self->_currentIndex];
    cblas_saxpy_NEWLAPACK();
    if (self->_windowFilled)
      cblas_saxpy_NEWLAPACK();
    objc_msgSend_outputFeatureDescriptor(self->_model, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend_sizeInBytes(v25, v26, v27);
    memcpy(v22, BaseAddress, v28);

    IOSurfaceUnlock(v20, 1u, 0);
    currentIndex = self->_currentIndex;
    self->_currentIndex = currentIndex + 1;
    if (objc_msgSend_windowSize(self, v30, v31) <= currentIndex + 1)
    {
      self->_currentIndex = 0;
      self->_windowFilled = 1;
    }
    else if (!self->_windowFilled)
    {
      goto LABEL_26;
    }
    objc_msgSend_delegate(self, v32, v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      windowSum = self->_windowSum;
      normalizedMeanFeature = self->_normalizedMeanFeature;
      objc_msgSend_outputFeatureDescriptor(self->_model, v37, v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend_sizeInBytes(v40, v41, v42);
      memcpy(normalizedMeanFeature, windowSum, v43);

      objc_msgSend_windowSize(self, v44, v45);
      LOBYTE(normalizedMeanFeature) = 1;
      cblas_sscal_NEWLAPACK();
      cblas_snrm2_NEWLAPACK();
      cblas_sscal_NEWLAPACK();
      objc_msgSend_delegate(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_videoFeatureExtractor_didUpdateVideoFeature_(v48, v49, (uint64_t)self, self->_currentVideoFeatureData);

      return (char)normalizedMeanFeature;
    }
LABEL_26:
    LOBYTE(normalizedMeanFeature) = 1;
    return (char)normalizedMeanFeature;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_235911E8C(v5, v6, v7, v8, v9, v10, v11, v12);

  if (normalizedMeanFeature)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    v51 = CFSTR("Failed to preprocess input pixel buffer.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v13, (uint64_t)&v51, &v50, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v14, v16, (uint64_t)CFSTR("ANSTErrorDomain"), 4, v15);
LABEL_20:
    *normalizedMeanFeature = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  return (char)normalizedMeanFeature;
}

- (BOOL)commitInputBindingWithError:(id *)a3
{
  const char *v5;
  BOOL result;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if (self->_initSucceeded)
  {
    if (objc_msgSend_count(self->_modalityStatus, a2, (uint64_t)a3))
    {
      result = 1;
      self->_inputBindingCommitted = 1;
      return result;
    }
    if (a3)
    {
      v7 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BDD0FC8];
      v11 = CFSTR("Commit failure since no input is binded yet. Please run -[ANSTVideoFeatureExtractor bindVideoInput:error:] or -[ANSTVideoFeatureExtractor bindAudioInput:error:] first.");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)&v11, &v10, 1);
      goto LABEL_8;
    }
  }
  else if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0BA0];
    v13[0] = CFSTR("Initialization was not successful. Please check error log.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v13, &v12, 1);
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v7, v9, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (void)resetInputBinding
{
  uint64_t v2;

  if (self->_initSucceeded)
  {
    objc_msgSend_removeAllObjects(self->_modalityStatus, a2, v2);
    self->_inputBindingCommitted = 0;
    CVPixelBufferRelease(self->_rawInputImage);
    self->_rawInputImage = 0;
    self->_needsPreprocessing = 1;
  }
}

- (void)resetInferenceState
{
  uint64_t v2;
  float *windowSum;
  void *v5;
  const char *v6;
  uint64_t v7;
  size_t v8;

  if (self->_initSucceeded)
  {
    windowSum = self->_windowSum;
    objc_msgSend_outputFeatureDescriptor(self->_model, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend_sizeInBytes(v5, v6, v7);
    bzero(windowSum, v8);

    self->_windowFilled = 0;
    self->_currentIndex = 0;
  }
}

- (id)getCurrentVideoFeatureWithOutError:(id *)a3
{
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if (self->_initSucceeded)
  {
    if (self->_windowFilled)
      return self->_currentVideoFeatureData;
  }
  else if (a3)
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v8 = *MEMORY[0x24BDD0BA0];
    v9[0] = CFSTR("Initialization was not successful. Please check error log.");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v5, v7, (uint64_t)CFSTR("ANSTErrorDomain"), 3, v6);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

- (ANSTVideoFeatureExtractorConfiguration)configuration
{
  return self->_configuration;
}

- (ANSTVideoFeatureExtractorDelegate)delegate
{
  return (ANSTVideoFeatureExtractorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_modalityStatus, 0);
  objc_storeStrong((id *)&self->_currentVideoFeatureData, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
