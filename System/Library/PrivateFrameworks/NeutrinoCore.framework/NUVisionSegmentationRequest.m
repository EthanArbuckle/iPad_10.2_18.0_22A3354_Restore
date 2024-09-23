@implementation NUVisionSegmentationRequest

- (NUVisionSegmentationRequest)initWithComposition:(id)a3
{
  NUVisionSegmentationRequest *v3;
  NUPixelCountScalePolicy *v4;
  NUScalePolicy *scalePolicy;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVisionSegmentationRequest;
  v3 = -[NURenderRequest initWithComposition:](&v7, sel_initWithComposition_, a3);
  v4 = -[NUPixelCountScalePolicy initWithTargetPixelCount:]([NUPixelCountScalePolicy alloc], "initWithTargetPixelCount:", 3048192);
  scalePolicy = v3->_scalePolicy;
  v3->_scalePolicy = (NUScalePolicy *)v4;

  -[NURenderRequest setSampleMode:](v3, "setSampleMode:", 2);
  return v3;
}

- (void)takePropertiesFromRequest:(id)a3
{
  id v4;
  int64_t v5;
  objc_super v6;

  v4 = a3;
  v5 = -[NURenderRequest sampleMode](self, "sampleMode");
  v6.receiver = self;
  v6.super_class = (Class)NUVisionSegmentationRequest;
  -[NURenderRequest takePropertiesFromRequest:](&v6, sel_takePropertiesFromRequest_, v4);

  -[NURenderRequest setSampleMode:](self, "setSampleMode:", v5);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  id *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUVisionSegmentationRequest;
  v4 = -[NURenderRequest copyWithZone:](&v7, sel_copyWithZone_, a3);
  v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 22, self->_scalePolicy);
    v5[20] = (id)self->_segmentationType;
    v5[21] = (id)self->_visionSegmentationPolicy;
    *((_BYTE *)v5 + 152) = self->_produceConfidenceMap;
  }
  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUVisionSegmentationRequest;
  -[NURenderRequest description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NUVisionSegmentationRequest segmentationType](self, "segmentationType") - 1;
  if (v4 > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = off_1E5062F08[v4];
  v6 = -[NUVisionSegmentationRequest visionSegmentationPolicy](self, "visionSegmentationPolicy") - 1;
  if (v6 > 2)
    v7 = CFSTR("First");
  else
    v7 = off_1E5062F20[v6];
  -[NUVisionSegmentationRequest scalePolicy](self, "scalePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("Segmentation Type: %@, Vision Segmentation Policy: %@, Scale Policy: %@"), v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)newRenderJob
{
  return -[NUVisionSegmentationJob initWithVisionSegmentationRequest:]([NUVisionSegmentationJob alloc], "initWithVisionSegmentationRequest:", self);
}

- (int64_t)mediaComponentType
{
  return 1;
}

- (int64_t)segmentationType
{
  return self->_segmentationType;
}

- (void)setSegmentationType:(int64_t)a3
{
  self->_segmentationType = a3;
}

- (BOOL)produceConfidenceMap
{
  return self->_produceConfidenceMap;
}

- (void)setProduceConfidenceMap:(BOOL)a3
{
  self->_produceConfidenceMap = a3;
}

- (int64_t)visionSegmentationPolicy
{
  return self->_visionSegmentationPolicy;
}

- (void)setVisionSegmentationPolicy:(int64_t)a3
{
  self->_visionSegmentationPolicy = a3;
}

- (NUScalePolicy)scalePolicy
{
  return self->_scalePolicy;
}

- (void)setScalePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scalePolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalePolicy, 0);
}

+ (void)warmUp
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0CEDF30]);
  objc_msgSend(v3, "setRevision:", 1);
  objc_msgSend(v3, "setQualityLevel:", 1);
  objc_msgSend(v2, "addObject:", v3);

  v4 = objc_alloc_init(MEMORY[0x1E0CEDF00]);
  objc_msgSend(v2, "addObject:", v4);

  v5 = objc_alloc_init(MEMORY[0x1E0CEDF38]);
  objc_msgSend(v2, "addObject:", v5);

  +[NUFactory sharedFactory](NUFactory, "sharedFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visionSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "prepareForPerformingRequests:error:", v2, &v11);
  v9 = v11;

  if ((v8 & 1) == 0)
  {
    if (_NULogOnceToken != -1)
      dispatch_once(&_NULogOnceToken, &__block_literal_global_204);
    v10 = _NULogger;
    if (os_log_type_enabled((os_log_t)_NULogger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v9;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Failed to warmUp Vision segmentation requests, error: %{public}@", buf, 0xCu);
    }
  }

}

@end
