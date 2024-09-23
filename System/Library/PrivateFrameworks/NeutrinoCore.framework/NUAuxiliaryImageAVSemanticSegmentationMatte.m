@implementation NUAuxiliaryImageAVSemanticSegmentationMatte

- (id)initAuxiliaryImageFromAVSemanticSegmentationMatte:(id)a3
{
  id v5;
  void *v6;
  NUAuxiliaryImageAVSemanticSegmentationMatte *v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_13197();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "avSemanticSegmentationMatte != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v12;
      _os_log_error_impl(&dword_1A6553000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13197();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2114;
        v31 = v22;
        _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v17;
      _os_log_error_impl(&dword_1A6553000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageAVSemanticSegmentationMatte initAuxiliaryImageFromAVSemanticSegmentationMatte:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 437, CFSTR("Invalid parameter not satisfying: %s"), v23, v24, v25, v26, (uint64_t)"avSemanticSegmentationMatte != nil");
  }
  v6 = v5;
  v27.receiver = self;
  v27.super_class = (Class)NUAuxiliaryImageAVSemanticSegmentationMatte;
  v7 = -[NUAuxiliaryImageAVSemanticSegmentationMatte init](&v27, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "matteType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8ACF0]))
    {
      v9 = 4;
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8ACE8]))
    {
      v9 = 5;
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8ACF8]))
    {
      v9 = 6;
    }
    else if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C8ACE0]))
    {
      v9 = 8;
    }
    else
    {
      if (!objc_msgSend(v8, "isEqualToString:", CFSTR("AVSemanticSegmentationMatteTypeSky")))
      {
        v7->_auxiliaryImageType = 0;
        goto LABEL_14;
      }
      v9 = 9;
    }
    v7->_auxiliaryImageType = v9;
LABEL_14:
    objc_storeStrong((id *)&v7->_avSemanticSegmentationMatte, a3);

  }
  return v7;
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[NUAuxiliaryImageAVSemanticSegmentationMatte avSemanticSegmentationMatte](self, "avSemanticSegmentationMatte");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "semanticSegmentationMatteByApplyingExifOrientation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUAuxiliaryImageAVSemanticSegmentationMatte initAuxiliaryImageFromAVSemanticSegmentationMatte:]([NUAuxiliaryImageAVSemanticSegmentationMatte alloc], "initAuxiliaryImageFromAVSemanticSegmentationMatte:", v5);
  return v6;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  -[NUAuxiliaryImageAVSemanticSegmentationMatte avSemanticSegmentationMatte](self, "avSemanticSegmentationMatte");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "semanticSegmentationMatteByReplacingSemanticSegmentationMatteWithPixelBuffer:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[NUAuxiliaryImageAVSemanticSegmentationMatte initAuxiliaryImageFromAVSemanticSegmentationMatte:]([NUAuxiliaryImageAVSemanticSegmentationMatte alloc], "initAuxiliaryImageFromAVSemanticSegmentationMatte:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;

  v3 = 0;
  -[NUAuxiliaryImageAVSemanticSegmentationMatte dictionaryRepresentationForAuxiliaryDataType:](self, "dictionaryRepresentationForAuxiliaryDataType:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  void *v4;
  void *v5;

  -[NUAuxiliaryImageAVSemanticSegmentationMatte avSemanticSegmentationMatte](self, "avSemanticSegmentationMatte");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentationForAuxiliaryDataType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)pixelFormatType
{
  void *v2;
  unsigned int v3;

  -[NUAuxiliaryImageAVSemanticSegmentationMatte avSemanticSegmentationMatte](self, "avSemanticSegmentationMatte");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pixelFormatType");

  return v3;
}

- (__CVBuffer)cvPixelBufferRef
{
  id v2;
  __CVBuffer *v3;

  -[NUAuxiliaryImageAVSemanticSegmentationMatte avSemanticSegmentationMatte](self, "avSemanticSegmentationMatte");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (__CVBuffer *)objc_msgSend(v2, "mattingImage");

  return v3;
}

- (CGImage)cgImageRef
{
  OSStatus v2;
  OSStatus v3;
  NSObject *v4;
  CGImageRef imageOut;
  uint8_t buf[4];
  OSStatus v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  imageOut = 0;
  v2 = VTCreateCGImageFromCVPixelBuffer(-[NUAuxiliaryImageAVSemanticSegmentationMatte cvPixelBufferRef](self, "cvPixelBufferRef"), 0, &imageOut);
  if (v2)
  {
    v3 = v2;
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_190);
    v4 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v8 = v3;
      _os_log_error_impl(&dword_1A6553000, v4, OS_LOG_TYPE_ERROR, "VTCreateCGImageFromCVPixelBuffer() failed: %d", buf, 8u);
    }
  }
  return imageOut;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (CGImageMetadata)metadata
{
  return self->metadata;
}

- (NUColorSpace)colorSpace
{
  return self->colorSpace;
}

- (AVSemanticSegmentationMatte)avSemanticSegmentationMatte
{
  return (AVSemanticSegmentationMatte *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avSemanticSegmentationMatte, 0);
  objc_storeStrong((id *)&self->colorSpace, 0);
}

@end
