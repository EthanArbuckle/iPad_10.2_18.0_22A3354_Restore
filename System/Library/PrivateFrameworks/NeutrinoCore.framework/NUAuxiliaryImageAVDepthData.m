@implementation NUAuxiliaryImageAVDepthData

- (id)initAuxiliaryImageFromAVDepthData:(id)a3
{
  id v5;
  void *v6;
  NUAuxiliaryImageAVDepthData *v7;
  NUAuxiliaryImageAVDepthData *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    NUAssertLogger_13197();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "avDepthData != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_13197();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v21;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"-[NUAuxiliaryImageAVDepthData initAuxiliaryImageFromAVDepthData:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Image/NUAuxiliaryImage.m", 282, CFSTR("Invalid parameter not satisfying: %s"), v22, v23, v24, v25, (uint64_t)"avDepthData != nil");
  }
  v6 = v5;
  v26.receiver = self;
  v26.super_class = (Class)NUAuxiliaryImageAVDepthData;
  v7 = -[NUAuxiliaryImageAVDepthData init](&v26, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_auxiliaryImageType = 2;
    objc_storeStrong((id *)&v7->_avDepthData, a3);
  }

  return v8;
}

- (id)auxiliaryImageByApplyingExifOrientation:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)&a3;
  -[NUAuxiliaryImageAVDepthData avDepthData](self, "avDepthData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "depthDataByApplyingExifOrientation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NUAuxiliaryImageAVDepthData initAuxiliaryImageFromAVDepthData:]([NUAuxiliaryImageAVDepthData alloc], "initAuxiliaryImageFromAVDepthData:", v5);
  return v6;
}

- (id)auxiliaryImageByReplacingAuxiliaryImageWithPixelBuffer:(__CVBuffer *)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;

  -[NUAuxiliaryImageAVDepthData avDepthData](self, "avDepthData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "depthDataByReplacingDepthDataMapWithPixelBuffer:error:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = -[NUAuxiliaryImageAVDepthData initAuxiliaryImageFromAVDepthData:]([NUAuxiliaryImageAVDepthData alloc], "initAuxiliaryImageFromAVDepthData:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)dictionaryRepresentation
{
  uint64_t v3;

  v3 = 0;
  -[NUAuxiliaryImageAVDepthData dictionaryRepresentationForAuxiliaryDataType:](self, "dictionaryRepresentationForAuxiliaryDataType:", &v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)dictionaryRepresentationForAuxiliaryDataType:(id *)a3
{
  void *v4;
  void *v5;

  -[NUAuxiliaryImageAVDepthData avDepthData](self, "avDepthData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentationForAuxiliaryDataType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unsigned)pixelFormatType
{
  void *v2;
  unsigned int v3;

  -[NUAuxiliaryImageAVDepthData avDepthData](self, "avDepthData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "depthDataType");

  return v3;
}

- (__CVBuffer)cvPixelBufferRef
{
  id v2;
  __CVBuffer *v3;

  -[NUAuxiliaryImageAVDepthData avDepthData](self, "avDepthData");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (__CVBuffer *)objc_msgSend(v2, "depthDataMap");

  return v3;
}

- (CGImage)cgImageRef
{
  return 0;
}

- (CGImageMetadata)metadata
{
  void *v2;
  void *v3;

  -[NUAuxiliaryImageAVDepthData dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CGImageMetadata *)v3;
}

- (int64_t)auxiliaryImageType
{
  return self->_auxiliaryImageType;
}

- (NUColorSpace)colorSpace
{
  return self->colorSpace;
}

- (AVDepthData)avDepthData
{
  return (AVDepthData *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avDepthData, 0);
  objc_storeStrong((id *)&self->colorSpace, 0);
}

@end
