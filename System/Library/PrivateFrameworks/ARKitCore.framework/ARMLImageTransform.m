@implementation ARMLImageTransform

- (ARMLImageTransform)initWithScaledSize:(CGSize)a3 useOptimalMSRCoefficients:(BOOL)a4 useExplicitBGRAConversion:(BOOL)a5
{
  CGFloat height;
  CGFloat width;
  ARMLImageTransform *v9;
  ARMLImageTransform *v10;
  NSArray *imageScalePassDescriptions;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)ARMLImageTransform;
  v9 = -[ARMLImageTransform init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    imageScalePassDescriptions = v9->_imageScalePassDescriptions;
    v9->_imageScalePassDescriptions = 0;

    v10->_inputSize = (CGSize)*MEMORY[0x1E0C9D820];
    v10->_scaledSize.width = width;
    v10->_scaledSize.height = height;
    v10->_useOptimalMSRCoefficients = a4;
    v10->_useExplicitBGRAConversion = a5;
  }
  return v10;
}

- (void)dealloc
{
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelTransferSession *scalingSession;
  OpaqueVTPixelTransferSession *conversionSession;
  objc_super v6;

  rotationSession = self->_rotationSession;
  if (rotationSession)
  {
    VTPixelRotationSessionInvalidate(rotationSession);
    CFRelease(self->_rotationSession);
  }
  scalingSession = self->_scalingSession;
  if (scalingSession)
  {
    VTPixelTransferSessionInvalidate(scalingSession);
    CFRelease(self->_scalingSession);
  }
  conversionSession = self->_conversionSession;
  if (conversionSession)
  {
    VTPixelTransferSessionInvalidate(conversionSession);
    CFRelease(self->_conversionSession);
  }
  CVPixelBufferPoolRelease(self->_resultBufferPool);
  CVPixelBufferPoolRelease(self->_scaledBufferPool);
  CVPixelBufferPoolRelease(self->_conversionBufferPool);
  v6.receiver = self;
  v6.super_class = (Class)ARMLImageTransform;
  -[ARMLImageTransform dealloc](&v6, sel_dealloc);
}

- (id)fastPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4 rotation:(int64_t)a5 rotationOfResultTensor:(int64_t)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CVBuffer *v17;
  __CVBuffer *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  float v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ARMLImageDownScalingResult *v39;
  ARMLImageDownScalingResultData *v40;
  void *v41;
  ARMLImageDownScalingResultData *v42;
  _QWORD v44[2];
  ARMLImageDownScalingResult *v45;
  _QWORD v46[2];
  _QWORD v47[4];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v47[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  objc_msgSend(v13, "timestamp");
  objc_msgSend(v13, "cameraType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x1E0C89F98];
  objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C89F98]);
  objc_msgSend(v13, "imageResolution");
  objc_msgSend(v13, "imageResolution");
  kdebug_trace();

  objc_msgSend(v13, "cameraIntrinsics");
  objc_msgSend(v13, "cameraIntrinsics");
  objc_msgSend(v13, "cameraIntrinsics");
  kdebug_trace();
  objc_msgSend(v13, "imageResolution");
  -[ARMLImageTransform _calculatePreScalingPassesForInputResolution:](self, "_calculatePreScalingPassesForInputResolution:");
  -[ARMLImageTransform _preScaleImageData:](self, "_preScaleImageData:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (__CVBuffer *)objc_msgSend(v13, "pixelBuffer");
  if (v17)
  {
    v18 = v17;
    v19 = (double)CVPixelBufferGetWidth(v17);
    v20 = (double)CVPixelBufferGetHeight(v18);
  }
  else
  {
    v19 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v21 = self->_scaledSize.width;
  v22 = self->_scaledSize.height;
  v23 = v21 / v19;
  v24 = v23;
  v25 = v20 * v24;
  v26 = (unint64_t)v25;
  if (a5 == 90 || a5 == -90)
  {
    v27 = (double)(unint64_t)v21;
    v28 = (unint64_t)(v19 * v24);
  }
  else
  {
    v27 = self->_scaledSize.height;
    v22 = self->_scaledSize.width;
    v28 = (unint64_t)v25;
    v26 = (unint64_t)(v19 * v24);
  }
  v29 = (double)v26;
  v30 = (double)v28;
  objc_msgSend(v16, "timestamp");
  objc_msgSend(v16, "cameraType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "isEqualToString:", v15);
  kdebug_trace();

  objc_msgSend(v16, "imageResolution");
  objc_msgSend(v16, "imageResolution");
  kdebug_trace();
  -[ARMLImageTransform _applyFinalTransformToScaledImage:rotation:finalResultSize:originalImageData:](self, "_applyFinalTransformToScaledImage:rotation:finalResultSize:originalImageData:", v16, a5, v13, v22, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cameraIntrinsics");
  objc_msgSend(v13, "imageResolution");
  ARAdjustIntrincisForOrientation();
  objc_msgSend(v32, "setCameraIntrinsics:");
  objc_msgSend(v32, "setMirrored:", 0);
  objc_msgSend(v32, "imageResolution");
  objc_msgSend(v32, "imageResolution");
  kdebug_trace();
  objc_msgSend(v16, "timestamp");
  kdebug_trace();
  objc_msgSend(v32, "cameraIntrinsics");
  objc_msgSend(v32, "cameraIntrinsics");
  objc_msgSend(v32, "cameraIntrinsics");
  kdebug_trace();
  objc_msgSend(v32, "timestamp");
  objc_msgSend(v32, "imageResolution");
  objc_msgSend(v32, "imageResolution");
  kdebug_trace();
  v46[0] = CFSTR("imageDownScalingRotationOfResultTensorKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = CFSTR("imageDownScalingRegionOfInterest");
  v47[0] = v33;
  *(double *)v44 = v29;
  *(double *)&v44[1] = v30;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v44, "{CGSize=dd}");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "metaData");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    objc_msgSend(v32, "metaData");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "mutableCopy");

    objc_msgSend(v38, "addEntriesFromDictionary:", v35);
    objc_msgSend(v32, "setMetaData:", v38);

  }
  else
  {
    objc_msgSend(v32, "setMetaData:", v35);
  }
  v39 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:]([ARMLImageDownScalingResult alloc], "initWithPixelBuffer:regionOfInterest:cropRegion:", objc_msgSend(v32, "pixelBuffer"), v29, v30, x, y, width, height);
  v40 = [ARMLImageDownScalingResultData alloc];
  v45 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestamp");
  v42 = -[ARMLImageDownScalingResultData initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:](v40, "initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:", v41, a6, v13);

  return v42;
}

- (void)_calculatePreScalingPassesForInputResolution:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  _BOOL4 v5;
  NSArray *imageScalePassDescriptions;
  BOOL v7;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  ARImageScalingTechnique *imageScalingTechnique;
  NSArray *v21;
  NSArray *v22;
  uint64_t v23;
  void *v24;
  ARImageScalingTechnique *v25;
  ARImageScalingTechnique *v26;
  ARImageScalingTechnique *v27;
  int v28;
  void *v29;
  __int16 v30;
  ARMLImageTransform *v31;
  __int16 v32;
  CGFloat v33;
  __int16 v34;
  CGFloat v35;
  uint64_t v36;

  height = a3.height;
  width = a3.width;
  v36 = *MEMORY[0x1E0C80C00];
  v5 = self->_inputSize.width == a3.width;
  if (self->_inputSize.height != a3.height)
    v5 = 0;
  imageScalePassDescriptions = self->_imageScalePassDescriptions;
  if (imageScalePassDescriptions)
    v7 = !v5;
  else
    v7 = 1;
  if (v7)
  {
    if (!imageScalePassDescriptions)
      LOBYTE(v5) = 1;
    if (!v5)
    {
      kdebug_trace();
      _ARLogTechnique_0();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v11;
        v30 = 2048;
        v31 = self;
        _os_log_impl(&dword_1B3A68000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recreating scaling passes", (uint8_t *)&v28, 0x16u);

      }
      _ARLogTechnique_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = self->_inputSize.width;
        v16 = self->_inputSize.height;
        v28 = 138544130;
        v29 = v14;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = v15;
        v34 = 2048;
        v35 = v16;
        _os_log_impl(&dword_1B3A68000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was scaling from %.1f x %.1f", (uint8_t *)&v28, 0x2Au);

      }
      _ARLogTechnique_0();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138544130;
        v29 = v19;
        v30 = 2048;
        v31 = self;
        v32 = 2048;
        v33 = width;
        v34 = 2048;
        v35 = height;
        _os_log_impl(&dword_1B3A68000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: now scaling from %.1f x %.1f", (uint8_t *)&v28, 0x2Au);

      }
    }
    self->_inputSize.width = width;
    self->_inputSize.height = height;
    imageScalingTechnique = self->_imageScalingTechnique;
    self->_imageScalingTechnique = 0;

    +[ARImageScalingTechnique scalingPassDescriptionForInputSize:scaledSize:conversionPixelFormat:](ARImageScalingTechnique, "scalingPassDescriptionForInputSize:scaledSize:conversionPixelFormat:", 0, self->_inputSize.width, self->_inputSize.height, self->_scaledSize.width, self->_scaledSize.height);
    v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v22 = self->_imageScalePassDescriptions;
    self->_imageScalePassDescriptions = v21;

    v23 = -[NSArray count](self->_imageScalePassDescriptions, "count");
    if (v23 >= 2)
    {
      -[NSArray objectAtIndexedSubscript:](self->_imageScalePassDescriptions, "objectAtIndexedSubscript:", v23 - 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = [ARImageScalingTechnique alloc];
      objc_msgSend(v24, "size");
      v26 = -[ARImageScalingTechnique initWithScaledSize:](v25, "initWithScaledSize:");
      v27 = self->_imageScalingTechnique;
      self->_imageScalingTechnique = v26;

      -[ARImageScalingTechnique setConversionPixelFormatType:](self->_imageScalingTechnique, "setConversionPixelFormatType:", 875704422);
    }
  }
}

- (id)_preScaleImageData:(id)a3
{
  ARImageScalingTechnique *imageScalingTechnique;
  id v4;
  ARModifiedImageData *v5;
  ARModifiedImageData *v6;

  imageScalingTechnique = self->_imageScalingTechnique;
  v4 = a3;
  if (imageScalingTechnique)
  {
    -[ARImageScalingTechnique processData:](imageScalingTechnique, "processData:", v4);
    v5 = (ARModifiedImageData *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v4);
  }
  v6 = v5;

  return v6;
}

- (void)_prepareSessionAndPoolForRotation:(int64_t)a3
{
  OpaqueVTPixelTransferSession *scalingSession;
  OpaqueVTPixelRotationSession *rotationSession;
  OpaqueVTPixelTransferSession *conversionSession;
  __CVPixelBufferPool *scaledBufferPool;
  __CVPixelBufferPool *resultBufferPool;

  if (self->_rotationAngle != a3)
  {
    self->_rotationAngle = a3;
    scalingSession = self->_scalingSession;
    if (scalingSession)
    {
      VTPixelTransferSessionInvalidate(scalingSession);
      CFRelease(self->_scalingSession);
      self->_scalingSession = 0;
    }
    rotationSession = self->_rotationSession;
    if (rotationSession)
    {
      VTPixelRotationSessionInvalidate(rotationSession);
      CFRelease(self->_rotationSession);
      self->_rotationSession = 0;
    }
    conversionSession = self->_conversionSession;
    if (conversionSession)
    {
      VTPixelTransferSessionInvalidate(conversionSession);
      CFRelease(self->_conversionSession);
      self->_conversionSession = 0;
    }
    scaledBufferPool = self->_scaledBufferPool;
    if (scaledBufferPool)
    {
      CVPixelBufferPoolRelease(scaledBufferPool);
      self->_scaledBufferPool = 0;
    }
    resultBufferPool = self->_resultBufferPool;
    if (resultBufferPool)
    {
      CVPixelBufferPoolRelease(resultBufferPool);
      self->_resultBufferPool = 0;
    }
  }
}

- (id)_applyFinalTransformToScaledImage:(id)a3 rotation:(int64_t)a4 finalResultSize:(CGSize)a5 originalImageData:(id)a6
{
  double height;
  double width;
  id v11;
  id v12;
  __CVBuffer *v13;
  OpaqueVTPixelTransferSession **p_conversionSession;
  _BOOL4 useOptimalMSRCoefficients;
  CFTypeRef *p_scalingSession;
  CFTypeRef *p_rotationSession;
  int v18;
  size_t v19;
  size_t v20;
  double v21;
  double v22;
  NSObject *v23;
  objc_class *v24;
  void *v25;
  OSStatus v26;
  CFTypeRef v27;
  objc_class *v28;
  void *v29;
  OSStatus v30;
  CFTypeRef v31;
  objc_class *v32;
  void *v33;
  CVPixelBufferRef v34;
  __CVBuffer *v35;
  OSStatus v36;
  objc_class *v37;
  void *v38;
  __CVBuffer *v39;
  OSStatus v40;
  objc_class *v41;
  void *v42;
  CVPixelBufferRef v43;
  __CVBuffer *v44;
  OSStatus v45;
  objc_class *v46;
  void *v47;
  CVPixelBufferRef v48;
  ARModifiedImageData *v49;
  objc_class *v50;
  void *v51;
  const void *v52;
  OSStatus v53;
  objc_class *v54;
  void *v55;
  _QWORD v57[2];
  void (*v58)(_QWORD *);
  void *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t buf[4];
  void *v76;
  __int16 v77;
  ARMLImageTransform *v78;
  __int16 v79;
  OSStatus v80;
  uint64_t v81;

  height = a5.height;
  width = a5.width;
  v81 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a6;
  -[ARMLImageTransform _prepareSessionAndPoolForRotation:](self, "_prepareSessionAndPoolForRotation:", a4);
  v13 = (__CVBuffer *)objc_msgSend(v11, "pixelBuffer");
  v71 = 0;
  v72 = &v71;
  v73 = 0x2020000000;
  v74 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x2020000000;
  v70 = 0;
  v63 = 0;
  v64 = &v63;
  v65 = 0x2020000000;
  v66 = 0;
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v58 = __99__ARMLImageTransform__applyFinalTransformToScaledImage_rotation_finalResultSize_originalImageData___block_invoke;
  v59 = &unk_1E6672D98;
  v60 = &v71;
  v61 = &v67;
  v62 = &v63;
  if (self->_useExplicitBGRAConversion)
  {
    p_conversionSession = &self->_conversionSession;
    if (!self->_conversionSession)
    {
      if (VTPixelTransferSessionCreate(0, &self->_conversionSession))
      {
        CFRelease(*p_conversionSession);
        *p_conversionSession = 0;
        _ARLogTechnique_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v25;
          v77 = 2048;
          v78 = self;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel transfer session for bgra conversion", buf, 0x16u);

        }
LABEL_44:

        v49 = 0;
        goto LABEL_45;
      }
    }
  }
  useOptimalMSRCoefficients = self->_useOptimalMSRCoefficients;
  if (self->_useOptimalMSRCoefficients)
  {
    p_scalingSession = (CFTypeRef *)&self->_scalingSession;
    if (!self->_scalingSession)
    {
      v26 = VTPixelTransferSessionCreate(0, &self->_scalingSession);
      v27 = *p_scalingSession;
      if (v26)
      {
        CFRelease(v27);
        *p_scalingSession = 0;
        _ARLogTechnique_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v29;
          v77 = 2048;
          v78 = self;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create pixel transfer session for image downscaling", buf, 0x16u);

        }
        goto LABEL_44;
      }
      if (VTSessionSetProperty(v27, (CFStringRef)*MEMORY[0x1E0CED860], (CFTypeRef)*MEMORY[0x1E0C9AE50]))
      {
        CFRelease(*p_scalingSession);
        *p_scalingSession = 0;
        _ARLogTechnique_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v50 = (objc_class *)objc_opt_class();
          NSStringFromClass(v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v76 = v51;
          v77 = 2048;
          v78 = self;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to update pixel transfer session properties", buf, 0x16u);

        }
        goto LABEL_44;
      }
    }
  }
  if (self->_rotationAngle || !self->_useOptimalMSRCoefficients)
  {
    p_rotationSession = (CFTypeRef *)&self->_rotationSession;
    if (!self->_rotationSession)
    {
      v30 = VTPixelRotationSessionCreate(0, &self->_rotationSession);
      v31 = *p_rotationSession;
      if (v30)
      {
        CFRelease(*p_rotationSession);
        *p_rotationSession = 0;
        _ARLogTechnique_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v33;
          v77 = 2048;
          v78 = self;
          v79 = 1024;
          v80 = v30;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Creation of VTPixelRotationSession failed with error %d", buf, 0x1Cu);

        }
        goto LABEL_44;
      }
      v52 = (const void *)kVTRotationFromARRotationAngle(self->_rotationAngle);
      v53 = VTSessionSetProperty(v31, (CFStringRef)*MEMORY[0x1E0CED7A0], v52);
      if (v53)
      {
        _ARLogTechnique_0();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v54 = (objc_class *)objc_opt_class();
          NSStringFromClass(v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v76 = v55;
          v77 = 2048;
          v78 = self;
          v79 = 1024;
          v80 = v53;
          _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Configuration of VTPixelRotationSession failed with error %d", buf, 0x1Cu);

        }
        goto LABEL_44;
      }
    }
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }
  if (self->_useExplicitBGRAConversion)
  {
    if (v13)
    {
      v19 = CVPixelBufferGetWidth(v13);
      v20 = CVPixelBufferGetHeight(v13);
      v21 = (double)v19;
      v22 = (double)v20;
    }
    else
    {
      v21 = *MEMORY[0x1E0C9D820];
      v22 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    }
    v35 = ARCreateCVPixelBufferFromPool(&self->_conversionBufferPool, 1111970369, self, CFSTR("conversion buffer pool"), v21, v22);
    v72[3] = (uint64_t)v35;
    v36 = VTPixelTransferSessionTransferImage(self->_conversionSession, v13, v35);
    if (v36)
    {
      _ARLogTechnique_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v38;
        v77 = 2048;
        v78 = self;
        v79 = 1024;
        v80 = v36;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to convert image to BGRA: %d", buf, 0x1Cu);

      }
      goto LABEL_44;
    }
  }
  else
  {
    v34 = CVPixelBufferRetain(v13);
    v72[3] = (uint64_t)v34;
  }
  if (useOptimalMSRCoefficients)
  {
    v39 = ARCreateCVPixelBufferFromPool(&self->_scaledBufferPool, 1111970369, self, CFSTR("downscale buffer pool"), self->_scaledSize.width, self->_scaledSize.height);
    v68[3] = (uint64_t)v39;
    v40 = VTPixelTransferSessionTransferImage(self->_scalingSession, (CVPixelBufferRef)v72[3], v39);
    if (v40)
    {
      _ARLogTechnique_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v41 = (objc_class *)objc_opt_class();
        NSStringFromClass(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v42;
        v77 = 2048;
        v78 = self;
        v79 = 1024;
        v80 = v40;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to scale: %d", buf, 0x1Cu);

      }
      goto LABEL_44;
    }
  }
  else
  {
    v43 = CVPixelBufferRetain((CVPixelBufferRef)v72[3]);
    v68[3] = (uint64_t)v43;
  }
  if (v18)
  {
    v44 = ARCreateCVPixelBufferFromPool(&self->_resultBufferPool, 1111970369, self, CFSTR("rotate pass buffer pool"), width, height);
    v64[3] = (uint64_t)v44;
    v45 = VTPixelRotationSessionRotateImage(self->_rotationSession, (CVPixelBufferRef)v68[3], v44);
    if (v45)
    {
      _ARLogTechnique_0();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v46 = (objc_class *)objc_opt_class();
        NSStringFromClass(v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v76 = v47;
        v77 = 2048;
        v78 = self;
        v79 = 1024;
        v80 = v45;
        _os_log_impl(&dword_1B3A68000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to scale+rotate+convert: %d", buf, 0x1Cu);

      }
      goto LABEL_44;
    }
  }
  else
  {
    v48 = CVPixelBufferRetain((CVPixelBufferRef)v68[3]);
    v64[3] = (uint64_t)v48;
  }
  v49 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v12);
  -[ARImageData setPixelBuffer:](v49, "setPixelBuffer:", v64[3]);
  objc_msgSend(v12, "timestamp");
  -[ARImageData setTimestamp:](v49, "setTimestamp:");
LABEL_45:
  v58(v57);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);

  return v49;
}

void __99__ARMLImageTransform__applyFinalTransformToScaledImage_rotation_finalResultSize_originalImageData___block_invoke(_QWORD *a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[5] + 8) + 24));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(*(_QWORD *)(a1[6] + 8) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScalePassDescriptions, 0);
  objc_storeStrong((id *)&self->_imageScalingTechnique, 0);
}

@end
