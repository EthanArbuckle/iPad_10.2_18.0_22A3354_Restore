@implementation ARMLImageMattingMetadataTechnique

- (ARMLImageMattingMetadataTechnique)init
{
  ARMLImageMattingMetadataTechnique *v2;
  int v3;
  uint64_t v4;
  OS_dispatch_queue *processingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ARMLImageMattingMetadataTechnique;
  v2 = -[ARImageBasedTechnique init](&v7, sel_init);
  if (v2)
  {
    v3 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.matting.doubleMLResolutionForIPad"));
    if (v3)
      LOBYTE(v3) = ARDeviceIsiPad();
    v2->_enableDoubleMLResolutionForIPad = v3;
    ARCreateFixedPriorityDispatchQueue("com.apple.arkit.mlmattingmetadata");
    v4 = objc_claimAutoreleasedReturnValue();
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v4;

    v2->_shouldOperateOnHighResolutionImages = 0;
  }
  return v2;
}

- (void)dealloc
{
  vImageCVImageFormat *cvImageFormatRef;
  __CVPixelBufferPool *bgraMattingPixelBufferPool;
  objc_super v5;

  cvImageFormatRef = self->_cvImageFormatRef;
  if (cvImageFormatRef)
    vImageCVImageFormat_Release(cvImageFormatRef);
  bgraMattingPixelBufferPool = self->_bgraMattingPixelBufferPool;
  if (bgraMattingPixelBufferPool)
  {
    CVPixelBufferPoolRelease(bgraMattingPixelBufferPool);
    self->_bgraMattingPixelBufferPool = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)ARMLImageMattingMetadataTechnique;
  -[ARMLImageMattingMetadataTechnique dealloc](&v5, sel_dealloc);
}

- (void)prepare:(BOOL)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARMLImageMattingMetadataTechnique;
  -[ARTechnique prepare:](&v5, sel_prepare_);
  self->_deterministic = a3;
}

- (double)requiredTimeInterval
{
  return 0.003;
}

- (id)resultDataClasses
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

- (id)processData:(id)a3
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  NSObject *processingQueue;
  id v16;
  id v17;
  _QWORD block[4];
  id v20;
  id v21;
  id location;
  objc_super v23;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v4;
  v7 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "originalImageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ARMLImageMattingMetadataTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages");
    if (v9 != objc_msgSend(v8, "isHighResolution"))
    {
LABEL_3:
      v10 = v7;
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v8, "cameraPosition") != 2)
    {
      objc_msgSend(v8, "cameraType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C89FA0]))
      {

      }
      else
      {
        objc_msgSend(v8, "cameraType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C89F90]);

        if ((v13 & 1) == 0)
          goto LABEL_3;
      }
    }
    v23.receiver = self;
    v23.super_class = (Class)ARMLImageMattingMetadataTechnique;
    v14 = -[ARImageBasedTechnique processData:](&v23, sel_processData_, v7);
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__ARMLImageMattingMetadataTechnique_processData___block_invoke;
    block[3] = &unk_1E66721B8;
    objc_copyWeak(&v21, &location);
    v16 = v7;
    v20 = v16;
    dispatch_async(processingQueue, block);
    if (self->_deterministic)
      dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_2);
    v17 = v16;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

void __49__ARMLImageMattingMetadataTechnique_processData___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_processDataInBackgound:", *(_QWORD *)(a1 + 32));

}

- (void)_processDataInBackgound:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  objc_msgSend(v7, "timestamp");
  kdebug_trace();
  -[ARMLImageMattingMetadataTechnique _generateMattingMetadata:](self, "_generateMattingMetadata:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "addObject:", v4);
  objc_msgSend(v7, "timestamp");
  -[ARImageBasedTechnique pushResultData:forTimestamp:](self, "pushResultData:forTimestamp:", v6);
  objc_msgSend(v7, "timestamp");
  kdebug_trace();

}

- (id)_generateMattingMetadata:(id)a3
{
  id v4;
  void *v5;
  ARModifiedImageData *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  ARImageScalingTechnique *mattingImageScalingTechnique;
  double v24;
  double v25;
  BOOL v26;
  ARImageScalingTechnique *v27;
  ARImageScalingTechnique *v28;
  ARModifiedImageData *v29;
  ARMattingImageMetaData *v30;
  double v31;
  ARMattingImageMetaData *v32;

  v4 = a3;
  objc_msgSend(v4, "originalImageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v5);
  -[ARImageData setPixelBuffer:](v6, "setPixelBuffer:", objc_msgSend(v4, "pixelBuffer"));
  -[ARImageData imageResolution](v6, "imageResolution");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v5, "imageResolution");
  v12 = v11;
  *(float *)&v13 = v13;
  v14 = v8 / v12;
  v15 = *(float *)&v13 * v14;
  v16 = (double)(unint64_t)v15;
  if (v10 == v16)
  {
    v17 = v8 + v8;
    if (self->_enableDoubleMLResolutionForIPad)
      v18 = v10 + v10;
    else
      v18 = v10;
    if (self->_enableDoubleMLResolutionForIPad)
      v8 = v8 + v8;
  }
  else
  {
    v19 = v12 * v14;
    v20 = v19;
    v21 = v15;
    v17 = (float)(v19 + v19);
    v22 = (float)(v15 + v15);
    if (self->_enableDoubleMLResolutionForIPad)
      v18 = v22;
    else
      v18 = v21;
    if (self->_enableDoubleMLResolutionForIPad)
      v8 = v17;
    else
      v8 = v20;
  }
  mattingImageScalingTechnique = self->_mattingImageScalingTechnique;
  if (!mattingImageScalingTechnique
    || ((-[ARImageScalingTechnique scaledSize](mattingImageScalingTechnique, "scaledSize", v17), v25 == v8)
      ? (v26 = v24 == v18)
      : (v26 = 0),
        !v26))
  {
    v27 = -[ARImageScalingTechnique initWithScaledSize:]([ARImageScalingTechnique alloc], "initWithScaledSize:", v8, v18);
    v28 = self->_mattingImageScalingTechnique;
    self->_mattingImageScalingTechnique = v27;

    -[ARImageScalingTechnique setConversionPixelFormatType:](self->_mattingImageScalingTechnique, "setConversionPixelFormatType:", 1111970369);
  }
  if (v10 == v16 && !self->_enableDoubleMLResolutionForIPad)
  {
    v29 = v6;
  }
  else
  {
    objc_msgSend(v4, "timestamp");
    objc_msgSend(v5, "imageResolution");
    objc_msgSend(v5, "imageResolution");
    kdebug_trace();
    -[ARImageScalingTechnique processData:](self->_mattingImageScalingTechnique, "processData:", v5);
    v29 = (ARModifiedImageData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    kdebug_trace();
  }
  v30 = [ARMattingImageMetaData alloc];
  objc_msgSend(v4, "timestamp");
  v32 = -[ARMattingImageMetaData initWithTimestamp:downSampledImageBuffer:mattingScaleImageBuffer:](v30, "initWithTimestamp:downSampledImageBuffer:mattingScaleImageBuffer:", objc_msgSend(v4, "pixelBuffer"), -[ARImageData pixelBuffer](v29, "pixelBuffer"), v31);

  return v32;
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
  v7 = -[ARMLImageMattingMetadataTechnique shouldOperateOnHighResolutionImages](self, "shouldOperateOnHighResolutionImages");
  objc_msgSend(v6, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isHighResolution");

  if (v7 == v9)
  {
    v13.receiver = self;
    v13.super_class = (Class)ARMLImageMattingMetadataTechnique;
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

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  BOOL v5;
  objc_super v7;

  v4 = (unsigned __int8 *)a3;
  v7.receiver = self;
  v7.super_class = (Class)ARMLImageMattingMetadataTechnique;
  if (-[ARTechnique isEqual:](&v7, sel_isEqual_, v4))
    v5 = self->_shouldOperateOnHighResolutionImages == v4[129];
  else
    v5 = 0;

  return v5;
}

- (BOOL)shouldOperateOnHighResolutionImages
{
  return self->_shouldOperateOnHighResolutionImages;
}

- (void)setShouldOperateOnHighResolutionImages:(BOOL)a3
{
  self->_shouldOperateOnHighResolutionImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_mattingImageScalingTechnique, 0);
}

@end
