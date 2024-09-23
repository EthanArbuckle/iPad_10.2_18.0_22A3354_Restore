@implementation ARMLImageDownScalingTechnique

- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3
{
  return -[ARMLImageDownScalingTechnique initWithSize:requiredTimeInterval:](self, "initWithSize:requiredTimeInterval:", a3.width, a3.height, 0.0);
}

- (ARMLImageDownScalingTechnique)initWithSize:(CGSize)a3 requiredTimeInterval:(double)a4
{
  double height;
  double width;
  ARMLImageDownScalingTechnique *v7;
  ARMLImageDownScalingTechnique *v8;
  int v9;
  uint64_t v10;
  OS_dispatch_queue *processingQueue;
  ARMLImageTransform *v12;
  ARMLImageTransform *fastPassImageScaler;
  ARMLImageTransform *v14;
  ARMLImageTransform *fastPassUltraWideImageScaler;
  objc_super v17;

  height = a3.height;
  width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)ARMLImageDownScalingTechnique;
  v7 = -[ARImageBasedTechnique init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_lockedOrientation = -1;
    v7->_imageSize.width = width;
    v7->_imageSize.height = height;
    v9 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.doubleMLResolutionForIPad"));
    if (v9)
      LOBYTE(v9) = ARDeviceIsiPad();
    v8->_enableDoubleMLResolutionForIPad = v9;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.mldownsampling");
    v10 = objc_claimAutoreleasedReturnValue();
    processingQueue = v8->_processingQueue;
    v8->_processingQueue = (OS_dispatch_queue *)v10;

    v8->_resultLatency = a4;
    v8->_resizeUltraWideImage = 0;
    v8->_saveIntermediateScaleResultData = 0;
    v12 = -[ARMLImageTransform initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:]([ARMLImageTransform alloc], "initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:", +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.scaling.useOptimalMSRCoeficients")), 0, width, height);
    fastPassImageScaler = v8->_fastPassImageScaler;
    v8->_fastPassImageScaler = v12;

    v14 = -[ARMLImageTransform initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:]([ARMLImageTransform alloc], "initWithScaledSize:useOptimalMSRCoefficients:useExplicitBGRAConversion:", 1, 1, width, height);
    fastPassUltraWideImageScaler = v8->_fastPassUltraWideImageScaler;
    v8->_fastPassUltraWideImageScaler = v14;

    v8->_shouldOperateOnHighResolutionImages = 0;
  }
  return v8;
}

- (void)dealloc
{
  vImageCVImageFormat *cvImageFormatRef;
  __CVPixelBufferPool *bgraPixelBufferPool;
  objc_super v5;

  cvImageFormatRef = self->_cvImageFormatRef;
  if (cvImageFormatRef)
    vImageCVImageFormat_Release(cvImageFormatRef);
  bgraPixelBufferPool = self->_bgraPixelBufferPool;
  if (bgraPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraPixelBufferPool);
    self->_bgraPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageDownScalingTechnique;
  -[ARMLImageDownScalingTechnique dealloc](&v5, sel_dealloc);
}

- (void)prepare:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARMLImageDownScalingTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministic = a3;
}

- (void)lockOrientation:(int64_t)a3
{
  self->_lockedOrientation = a3;
}

- (double)requiredTimeInterval
{
  return self->_resultLatency;
}

- (id)resultDataClasses
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)processData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  int v7;
  id v8;
  NSObject *processingQueue;
  _QWORD block[4];
  id v12;
  id v13;
  id location;
  objc_super v15;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = -[ARMLImageDownScalingTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages");
    if (v7 == objc_msgSend(v6, "isHighResolution"))
    {
      v15.receiver = self;
      v15.super_class = (Class)ARMLImageDownScalingTechnique;
      v8 = -[ARImageBasedTechnique processData:](&v15, sel_processData_, v6);
      objc_initWeak(&location, self);
      processingQueue = self->_processingQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__ARMLImageDownScalingTechnique_processData___block_invoke;
      block[3] = &unk_1E66721B8;
      objc_copyWeak(&v13, &location);
      v12 = v6;
      dispatch_async(processingQueue, block);
      if (self->_deterministic)
        dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_15);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

  return v6;
}

void __45__ARMLImageDownScalingTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_processImageDataInBackground:", *(_QWORD *)(a1 + 32));

}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  void *v12;
  objc_super v13;

  v6 = a4;
  v7 = -[ARMLImageDownScalingTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages");
  objc_msgSend(v6, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHighResolution");

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARMLImageDownScalingTechnique;
    -[ARImageBasedTechnique requestResultDataAtTimestamp:context:](&v13, sel_requestResultDataAtTimestamp_context_, v6, a3);
  }
  else
  {
    -[ARTechnique delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[ARTechnique delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "technique:didOutputResultData:timestamp:context:", self, MEMORY[0x1E0C9AA60], v6, a3);

    }
  }

}

- (void)_processImageDataInBackground:(id)a3
{
  NSObject *processingQueue;
  id v5;
  void *v6;
  double v7;
  float v8;
  double v9;
  float v10;
  float v11;
  ARImageCroppingTechnique *imageCroppingTechnique;
  double v13;
  double v14;
  double v15;
  double v16;
  ARImageCroppingTechnique *v17;
  ARImageCroppingTechnique *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  ARModifiedImageData *v30;
  ARMLImageDownScalingResultData *v31;
  ARMLImageDownScalingResultData *downSamplingResultData;
  void *v33;
  ARMLImageDownScalingResultData *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  ARMLImageDownScalingResultData *v39;
  ARMLIntermediateDownScalingResultData *intermediateDownSamplingResultData;
  ARModifiedImageData *v41;

  processingQueue = self->_processingQueue;
  v5 = a3;
  dispatch_assert_queue_V2(processingQueue);
  v41 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v5);

  -[ARImageData timestamp](v41, "timestamp");
  -[ARImageData cameraType](v41, "cameraType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C89F98]);
  kdebug_trace();

  if (-[ARMLImageDownScalingTechnique centerCropImage](self, "centerCropImage"))
  {
    -[ARImageData timestamp](v41, "timestamp");
    kdebug_trace();
    -[ARImageData imageResolution](v41, "imageResolution");
    -[ARImageData imageResolution](v41, "imageResolution");
    kdebug_trace();
    -[ARImageData cameraIntrinsics](v41, "cameraIntrinsics");
    -[ARImageData cameraIntrinsics](v41, "cameraIntrinsics");
    -[ARImageData cameraIntrinsics](v41, "cameraIntrinsics");
    kdebug_trace();
    -[ARImageData imageResolution](v41, "imageResolution");
    v8 = v7;
    -[ARImageData imageResolution](v41, "imageResolution");
    v10 = v9;
    v11 = fminf(v8, v10);
    imageCroppingTechnique = self->_imageCroppingTechnique;
    if (!imageCroppingTechnique
      || (-[ARImageCroppingTechnique croppedImageSize](imageCroppingTechnique, "croppedImageSize"),
          v14 = v13,
          -[ARImageCroppingTechnique croppedImageSize](self->_imageCroppingTechnique, "croppedImageSize"),
          v14 != v15)
      || (-[ARImageCroppingTechnique croppedImageSize](self->_imageCroppingTechnique, "croppedImageSize"), v16 != v11))
    {
      v17 = -[ARImageCroppingTechnique initWithCroppedImageSize:]([ARImageCroppingTechnique alloc], "initWithCroppedImageSize:", v11, v11);
      v18 = self->_imageCroppingTechnique;
      self->_imageCroppingTechnique = v17;

    }
    -[ARImageCroppingTechnique processData:](self->_imageCroppingTechnique, "processData:", v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "metaData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", CFSTR("croppedRect"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "rectValue");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
    }
    else
    {
      v25 = 0.0;
      v29 = 1.0;
      v27 = 1.0;
      v23 = 0.0;
    }
    v30 = v19;

    -[ARImageData imageResolution](v30, "imageResolution");
    -[ARImageData imageResolution](v30, "imageResolution");
    kdebug_trace();
    -[ARImageData cameraIntrinsics](v30, "cameraIntrinsics");
    -[ARImageData cameraIntrinsics](v30, "cameraIntrinsics");
    -[ARImageData cameraIntrinsics](v30, "cameraIntrinsics");
    kdebug_trace();
    -[ARImageData timestamp](v30, "timestamp");

    kdebug_trace();
    v41 = v30;
  }
  else
  {
    v25 = 0.0;
    v29 = 1.0;
    v27 = 1.0;
    v23 = 0.0;
  }
  if (-[ARMLImageDownScalingTechnique saveIntermediateScaleResultData](self, "saveIntermediateScaleResultData"))
    -[ARMLImageDownScalingTechnique _twoPassDownscaledResultDataFromImageData:croppedRect:](self, "_twoPassDownscaledResultDataFromImageData:croppedRect:", v41, v23, v25, v27, v29);
  else
    -[ARMLImageDownScalingTechnique _fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:](self, "_fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:", v41, self->_fastPassImageScaler, v23, v25, v27, v29);
  v31 = (ARMLImageDownScalingResultData *)objc_claimAutoreleasedReturnValue();
  downSamplingResultData = self->_downSamplingResultData;
  self->_downSamplingResultData = v31;

  -[ARImageData latestUltraWideImage](v41, "latestUltraWideImage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 && self->_resizeUltraWideImage)
  {
    v34 = self->_downSamplingResultData;

    if (v34)
    {
      -[ARImageData latestUltraWideImage](v41, "latestUltraWideImage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARMLImageDownScalingTechnique _fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:](self, "_fastPassDownscaledResultDataFromImageData:croppedRect:fastPassScaler:", v35, self->_fastPassUltraWideImageScaler, 0.0, 0.0, 1.0, 1.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ARMLImageDownScalingResultData setLatestResizedUltraWideImageData:](self->_downSamplingResultData, "setLatestResizedUltraWideImageData:", v36);

    }
  }
  else
  {

  }
  -[ARImageData timestamp](v41, "timestamp");
  kdebug_trace();
  v37 = (void *)objc_opt_new();
  v38 = v37;
  if (self->_downSamplingResultData)
  {
    objc_msgSend(v37, "addObject:");
    v39 = self->_downSamplingResultData;
    self->_downSamplingResultData = 0;

  }
  if (self->_intermediateDownSamplingResultData)
  {
    objc_msgSend(v38, "addObject:");
    intermediateDownSamplingResultData = self->_intermediateDownSamplingResultData;
    self->_intermediateDownSamplingResultData = 0;

  }
  -[ARImageData timestamp](v41, "timestamp");
  kdebug_trace();
  -[ARImageData timestamp](v41, "timestamp");
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v38);

}

- (int64_t)getDeviceOrientationFromImageData:(id)a3
{
  id v4;
  int64_t lockedOrientation;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  if (!objc_msgSend(v4, "deviceOrientation"))
  {
    lockedOrientation = self->_lockedOrientation;
    if ((lockedOrientation & 0x80000000) == 0)
      goto LABEL_6;
    +[ARBKSAccelerometer sharedWeakAccelerometerHandle](ARBKSAccelerometer, "sharedWeakAccelerometerHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = v6;
      lockedOrientation = objc_msgSend(v6, "currentOrientation");

      goto LABEL_6;
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageDownScalingTechnique;
  lockedOrientation = -[ARImageBasedTechnique getDeviceOrientationFromImageData:](&v9, sel_getDeviceOrientationFromImageData_, v4);
LABEL_6:

  return lockedOrientation;
}

- (id)defaultRotationStrategy
{
  return &__block_literal_global_76_0;
}

void __56__ARMLImageDownScalingTechnique_defaultRotationStrategy__block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3, _QWORD *a4)
{
  uint64_t v4;

  switch(a2)
  {
    case 4:
      v4 = 180;
      *a4 = 180;
      goto LABEL_6;
    case 3:
      *a4 = 0;
      *a3 = 0;
      break;
    case 2:
      *a4 = 90;
      v4 = -90;
LABEL_6:
      *a3 = v4;
      return;
    default:
      *a3 = 90;
      *a4 = -90;
      break;
  }
}

- (id)_twoPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v9;
  double v10;
  id v11;
  void *v12;
  ARMLImageDownScalingResult *v13;
  uint64_t v14;
  ARMLImageDownScalingResult *v15;
  ARMLIntermediateDownScalingResultData *v16;
  uint64_t v17;
  ARMLIntermediateDownScalingResultData *v18;
  ARMLIntermediateDownScalingResultData *intermediateDownSamplingResultData;
  void *v20;
  ARMLImageDownScalingResult *v21;
  uint64_t v22;
  ARMLImageDownScalingResult *v23;
  ARMLImageDownScalingResultData *v24;
  void *v25;
  ARMLImageDownScalingResultData *v26;
  uint64_t v28;
  double v29;
  double v30;
  _QWORD v31[2];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v31[1] = *MEMORY[0x1E0C80C00];
  v9 = self->_imageSize.width;
  v10 = self->_imageSize.height;
  v11 = a3;
  -[ARMLImageDownScalingTechnique _scaleImageDataForNeuralNetwork:scaledSize:](self, "_scaleImageDataForNeuralNetwork:scaledSize:", v11, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [ARMLImageDownScalingResult alloc];
  v14 = objc_msgSend(v12, "pixelBuffer");
  objc_msgSend(v12, "imageResolution");
  v15 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v13, "initWithPixelBuffer:regionOfInterest:cropRegion:", v14);
  v16 = [ARMLIntermediateDownScalingResultData alloc];
  v17 = -[ARMLImageDownScalingResult pixelBuffer](v15, "pixelBuffer");
  objc_msgSend(v11, "timestamp");
  v18 = -[ARMLIntermediateDownScalingResultData initWithPixelBuffer:timestamp:originalImageData:](v16, "initWithPixelBuffer:timestamp:originalImageData:", v17, v11);
  intermediateDownSamplingResultData = self->_intermediateDownSamplingResultData;
  self->_intermediateDownSamplingResultData = v18;

  v29 = 0.0;
  v30 = 0.0;
  v28 = 0;
  -[ARMLImageDownScalingTechnique _rotateImageDataForNeuralNetwork:deviceOrientation:pRegionOfInterest:pRotationOfResultTensor:](self, "_rotateImageDataForNeuralNetwork:deviceOrientation:pRegionOfInterest:pRotationOfResultTensor:", v12, -[ARMLImageDownScalingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v11), &v29, &v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = [ARMLImageDownScalingResult alloc];
  v22 = objc_msgSend(v20, "pixelBuffer");
  v23 = -[ARMLImageDownScalingResult initWithPixelBuffer:regionOfInterest:cropRegion:](v21, "initWithPixelBuffer:regionOfInterest:cropRegion:", v22, v29, v30, x, y, width, height);
  v24 = [ARMLImageDownScalingResultData alloc];
  v31[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timestamp");
  v26 = -[ARMLImageDownScalingResultData initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:](v24, "initWithResultDataArray:timestamp:rotationOfResultTensor:originalImageData:", v25, v28, v11);

  return v26;
}

- (id)_scaleImageDataForNeuralNetwork:(id)a3 scaledSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  ARImageScalingTechnique *imageScalingTechnique;
  double v9;
  double v10;
  BOOL v11;
  ARImageScalingTechnique *v12;
  ARImageScalingTechnique *v13;
  void *v14;
  void *v15;
  ARModifiedImageData *v16;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  imageScalingTechnique = self->_imageScalingTechnique;
  if (!imageScalingTechnique
    || ((-[ARImageScalingTechnique scaledSize](imageScalingTechnique, "scaledSize"), v10 == width)
      ? (v11 = v9 == height)
      : (v11 = 0),
        !v11))
  {
    v12 = -[ARImageScalingTechnique initWithScaledSize:]([ARImageScalingTechnique alloc], "initWithScaledSize:", width, height);
    v13 = self->_imageScalingTechnique;
    self->_imageScalingTechnique = v12;

    -[ARImageScalingTechnique setConversionPixelFormatType:](self->_imageScalingTechnique, "setConversionPixelFormatType:", 1111970369);
  }
  objc_msgSend(v7, "timestamp");
  objc_msgSend(v7, "cameraType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0C89F98]);
  objc_msgSend(v7, "imageResolution");
  objc_msgSend(v7, "imageResolution");
  kdebug_trace();

  objc_msgSend(v7, "cameraIntrinsics");
  objc_msgSend(v7, "cameraIntrinsics");
  objc_msgSend(v7, "cameraIntrinsics");
  kdebug_trace();
  -[ARImageScalingTechnique processData:](self->_imageScalingTechnique, "processData:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cameraIntrinsics");
  objc_msgSend(v15, "cameraIntrinsics");
  objc_msgSend(v15, "cameraIntrinsics");
  kdebug_trace();
  objc_msgSend(v7, "timestamp");
  kdebug_trace();
  v16 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v7);
  objc_msgSend(v7, "timestamp");
  -[ARImageData setTimestamp:](v16, "setTimestamp:");
  -[ARImageData setPixelBuffer:](v16, "setPixelBuffer:", objc_msgSend(v15, "pixelBuffer"));

  return v16;
}

- (id)_rotateImageDataForNeuralNetwork:(id)a3 deviceOrientation:(int64_t)a4 pRegionOfInterest:(CGSize *)a5 pRotationOfResultTensor:(int64_t *)a6
{
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  ARImageRotationTechnique *imageRotationTechnique;
  uint64_t v24;
  ARImageRotationTechnique *v25;
  ARImageRotationTechnique *v26;
  ARImageRotationTechnique *v27;
  void *v28;
  void *v29;
  __CVBuffer *v30;
  __CVBuffer *v31;
  double Width;
  double Height;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGSize v45;
  uint64_t v46;
  _QWORD v47[2];
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  objc_msgSend(v10, "originalImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  -[ARMLImageDownScalingTechnique wideRotationStrategy](self, "wideRotationStrategy");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x1E0C89F98];
  if (v12
    && (v14 = (void *)v12,
        objc_msgSend(v11, "cameraType"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0C89FA0]),
        v15,
        v14,
        v16))
  {
    -[ARMLImageDownScalingTechnique wideRotationStrategy](self, "wideRotationStrategy");
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ARMLImageDownScalingTechnique ultrawideRotationStrategy](self, "ultrawideRotationStrategy");
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18
      && (v19 = (void *)v18,
          objc_msgSend(v11, "cameraType"),
          v20 = (void *)objc_claimAutoreleasedReturnValue(),
          v21 = objc_msgSend(v20, "isEqualToString:", *v13),
          v20,
          v19,
          v21))
    {
      -[ARMLImageDownScalingTechnique ultrawideRotationStrategy](self, "ultrawideRotationStrategy");
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ARMLImageDownScalingTechnique defaultRotationStrategy](self, "defaultRotationStrategy");
      v17 = objc_claimAutoreleasedReturnValue();
    }
  }
  v22 = (void *)v17;
  (*(void (**)(uint64_t, int64_t, uint64_t *, int64_t *))(v17 + 16))(v17, a4, &v46, a6);

  imageRotationTechnique = self->_imageRotationTechnique;
  if (!imageRotationTechnique
    || (v24 = -[ARImageRotationTechnique rotationAngle](imageRotationTechnique, "rotationAngle"), v24 != v46)
    || -[ARImageRotationTechnique mirrorMode](self->_imageRotationTechnique, "mirrorMode"))
  {
    v25 = [ARImageRotationTechnique alloc];
    v26 = -[ARImageRotationTechnique initWithRotation:mirror:](v25, "initWithRotation:mirror:", v46, 0);
    v27 = self->_imageRotationTechnique;
    self->_imageRotationTechnique = v26;

  }
  objc_msgSend(v11, "timestamp");
  objc_msgSend(v11, "cameraType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "isEqualToString:", *v13);
  kdebug_trace();

  objc_msgSend(v10, "imageResolution");
  objc_msgSend(v10, "imageResolution");
  kdebug_trace();
  -[ARImageRotationTechnique processData:](self->_imageRotationTechnique, "processData:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "imageResolution");
  objc_msgSend(v29, "imageResolution");
  kdebug_trace();
  objc_msgSend(v11, "timestamp");
  kdebug_trace();
  v30 = (__CVBuffer *)objc_msgSend(v11, "pixelBuffer");
  if (v30)
  {
    v31 = v30;
    Width = (double)CVPixelBufferGetWidth(v30);
    Height = (double)CVPixelBufferGetHeight(v31);
  }
  else
  {
    Width = *MEMORY[0x1E0C9D820];
    Height = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(v10, "imageResolution");
  *(float *)&v34 = v34 / Width;
  v35 = *(float *)&v34;
  v36 = (unint64_t)(Width * v35);
  if (v46 == 90 || v46 == -90)
  {
    v37 = (unint64_t)(Height * v35);
  }
  else
  {
    v37 = (unint64_t)(Width * v35);
    v36 = (unint64_t)(Height * v35);
  }
  a5->width = (double)v37;
  a5->height = (double)v36;
  objc_msgSend(v11, "timestamp");
  objc_msgSend(v29, "setTimestamp:");
  v47[0] = CFSTR("imageDownScalingRotationOfResultTensorKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *a6);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = CFSTR("imageDownScalingRegionOfInterest");
  v48[0] = v38;
  v45 = *a5;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v45, "{CGSize=dd}");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "metaData");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  if (v41)
  {
    objc_msgSend(v29, "metaData");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(v42, "mutableCopy");

    objc_msgSend(v43, "addEntriesFromDictionary:", v40);
    objc_msgSend(v29, "setMetaData:", v43);

  }
  else
  {
    objc_msgSend(v29, "setMetaData:", v40);
  }
  objc_msgSend(v29, "setDeviceOrientation:", a4);

  return v29;
}

- (id)_fastPassDownscaledResultDataFromImageData:(id)a3 croppedRect:(CGRect)a4 fastPassScaler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = a5;
  v13 = -[ARMLImageDownScalingTechnique getDeviceOrientationFromImageData:](self, "getDeviceOrientationFromImageData:", v11);
  v26 = 0;
  v27 = 0;
  -[ARMLImageDownScalingTechnique wideRotationStrategy](self, "wideRotationStrategy");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14
    && (v15 = (void *)v14,
        objc_msgSend(v11, "cameraType"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0C89FA0]),
        v16,
        v15,
        v17))
  {
    -[ARMLImageDownScalingTechnique wideRotationStrategy](self, "wideRotationStrategy");
    v18 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ARMLImageDownScalingTechnique ultrawideRotationStrategy](self, "ultrawideRotationStrategy");
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19
      && (v20 = (void *)v19,
          objc_msgSend(v11, "cameraType"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0C89F98]),
          v21,
          v20,
          v22))
    {
      -[ARMLImageDownScalingTechnique ultrawideRotationStrategy](self, "ultrawideRotationStrategy");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ARMLImageDownScalingTechnique defaultRotationStrategy](self, "defaultRotationStrategy");
      v18 = objc_claimAutoreleasedReturnValue();
    }
  }
  v23 = (void *)v18;
  (*(void (**)(uint64_t, int64_t, uint64_t *, uint64_t *))(v18 + 16))(v18, v13, &v27, &v26);

  objc_msgSend(v12, "fastPassDownscaledResultDataFromImageData:croppedRect:rotation:rotationOfResultTensor:", v11, v27, v26, x, y, width, height);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double *v5;
  BOOL v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ARMLImageDownScalingTechnique;
  if (-[ARTechnique isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = (double *)v4;
    v6 = self->_imageSize.width == v5[27] && self->_imageSize.height == v5[28];
    v7 = v6
      && self->_centerCropImage == *((unsigned __int8 *)v5 + 193)
      && self->_resizeUltraWideImage == *((unsigned __int8 *)v5 + 194)
      && self->_saveIntermediateScaleResultData == *((unsigned __int8 *)v5 + 195)
      && self->_shouldOperateOnHighResolutionImages == *((unsigned __int8 *)v5 + 196);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_fullDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v8.receiver = self;
  v8.super_class = (Class)ARMLImageDownScalingTechnique;
  -[ARImageBasedTechnique _fullDescription](&v8, sel__fullDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  CVPixelBufferPoolGetPixelBufferAttributes(self->_bgraPixelBufferPool);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\tPixelBufferPool attr: %@\n"), v6);

  return v5;
}

- (BOOL)centerCropImage
{
  return self->_centerCropImage;
}

- (void)setCenterCropImage:(BOOL)a3
{
  self->_centerCropImage = a3;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)resizeUltraWideImage
{
  return self->_resizeUltraWideImage;
}

- (void)setResizeUltraWideImage:(BOOL)a3
{
  self->_resizeUltraWideImage = a3;
}

- (BOOL)saveIntermediateScaleResultData
{
  return self->_saveIntermediateScaleResultData;
}

- (void)setSaveIntermediateScaleResultData:(BOOL)a3
{
  self->_saveIntermediateScaleResultData = a3;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (id)wideRotationStrategy
{
  return self->_wideRotationStrategy;
}

- (void)setWideRotationStrategy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)ultrawideRotationStrategy
{
  return self->_ultrawideRotationStrategy;
}

- (void)setUltrawideRotationStrategy:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ultrawideRotationStrategy, 0);
  objc_storeStrong(&self->_wideRotationStrategy, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_downSamplingResultData, 0);
  objc_storeStrong((id *)&self->_intermediateDownSamplingResultData, 0);
  objc_storeStrong((id *)&self->_fastPassUltraWideImageScaler, 0);
  objc_storeStrong((id *)&self->_fastPassImageScaler, 0);
  objc_storeStrong((id *)&self->_imageCroppingTechnique, 0);
  objc_storeStrong((id *)&self->_imageRotationTechnique, 0);
  objc_storeStrong((id *)&self->_imageScalingTechnique, 0);
}

@end
