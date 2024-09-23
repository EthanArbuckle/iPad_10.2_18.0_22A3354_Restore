@implementation MADRemoveBackgroundMaskResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADRemoveBackgroundMaskResult)initWithInstances:(id)a3 instanceMaskSurface:(id)a4 perInstanceMaskSurfaces:(id)a5 sourceRegionOfInterest:(CGRect)a6 confidence:(float)a7 animatedStickerScore:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  MADRemoveBackgroundMaskResult *v22;
  MADRemoveBackgroundMaskResult *v23;
  objc_super v25;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)MADRemoveBackgroundMaskResult;
  v22 = -[MADResult init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_allInstances, a3);
    objc_storeStrong((id *)&v23->_instanceMaskSurface, a4);
    objc_storeStrong((id *)&v23->_perInstanceMaskSurfaces, a5);
    v23->_sourceRegionOfInterest.origin.x = x;
    v23->_sourceRegionOfInterest.origin.y = y;
    v23->_sourceRegionOfInterest.size.width = width;
    v23->_sourceRegionOfInterest.size.height = height;
    v23->_confidence = a7;
    objc_storeStrong((id *)&v23->_animatedStickerScore, a8);
  }

  return v23;
}

- (MADRemoveBackgroundMaskResult)initWithCoder:(id)a3
{
  id v4;
  MADRemoveBackgroundMaskResult *v5;
  uint64_t v6;
  NSIndexSet *allInstances;
  uint64_t v8;
  IOSurface *instanceMaskSurface;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSDictionary *perInstanceMaskSurfaces;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  float v19;
  uint64_t v20;
  NSNumber *animatedStickerScore;
  objc_super v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MADRemoveBackgroundMaskResult;
  v5 = -[MADResult initWithCoder:](&v23, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AllInstances"));
    v6 = objc_claimAutoreleasedReturnValue();
    allInstances = v5->_allInstances;
    v5->_allInstances = (NSIndexSet *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstanceMaskSurface"));
    v8 = objc_claimAutoreleasedReturnValue();
    instanceMaskSurface = v5->_instanceMaskSurface;
    v5->_instanceMaskSurface = (IOSurface *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("PerInstanceMaskSurfaces"));
    v13 = objc_claimAutoreleasedReturnValue();
    perInstanceMaskSurfaces = v5->_perInstanceMaskSurfaces;
    v5->_perInstanceMaskSurfaces = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeRectForKey:", CFSTR("SourceRegionOfInterest"));
    v5->_sourceRegionOfInterest.origin.x = v15;
    v5->_sourceRegionOfInterest.origin.y = v16;
    v5->_sourceRegionOfInterest.size.width = v17;
    v5->_sourceRegionOfInterest.size.height = v18;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("Confidence"));
    v5->_confidence = v19;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AnimatedStickerScore"));
    v20 = objc_claimAutoreleasedReturnValue();
    animatedStickerScore = v5->_animatedStickerScore;
    v5->_animatedStickerScore = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MADRemoveBackgroundMaskResult;
  -[MADResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_allInstances, CFSTR("AllInstances"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_instanceMaskSurface, CFSTR("InstanceMaskSurface"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_perInstanceMaskSurfaces, CFSTR("PerInstanceMaskSurfaces"));
  objc_msgSend(v4, "encodeRect:forKey:", CFSTR("SourceRegionOfInterest"), self->_sourceRegionOfInterest.origin.x, self->_sourceRegionOfInterest.origin.y, self->_sourceRegionOfInterest.size.width, self->_sourceRegionOfInterest.size.height);
  *(float *)&v5 = self->_confidence;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("Confidence"), v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_animatedStickerScore, CFSTR("AnimatedStickerScore"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p, "), v5, self);

  objc_msgSend(v3, "appendFormat:", CFSTR("allInstances: %@, "), self->_allInstances);
  objc_msgSend(v3, "appendFormat:", CFSTR("instanceMaskSurface: %@, "), self->_instanceMaskSurface);
  objc_msgSend(v3, "appendFormat:", CFSTR("perInstanceMaskSurfaces: %@, "), self->_perInstanceMaskSurfaces);
  objc_msgSend(v3, "appendFormat:", CFSTR("sourceRegionOfInterest: %0.2fx%0.2f @ (%0.2f, %0.2f), "), *(_QWORD *)&self->_sourceRegionOfInterest.size.width, *(_QWORD *)&self->_sourceRegionOfInterest.size.height, *(_QWORD *)&self->_sourceRegionOfInterest.origin.x, *(_QWORD *)&self->_sourceRegionOfInterest.origin.y);
  objc_msgSend(v3, "appendFormat:", CFSTR("confidence: %0.2f, "), self->_confidence);
  objc_msgSend(v3, "appendFormat:", CFSTR("animatedStickerScore: %@>"), self->_animatedStickerScore);
  return v3;
}

- (__CVBuffer)instanceMaskPixelBuffer
{
  CF<__CVBuffer *> *p_instanceMaskPixelBuffer;
  __CVBuffer *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  p_instanceMaskPixelBuffer = &self->_instanceMaskPixelBuffer;
  result = self->_instanceMaskPixelBuffer.value_;
  if (!result)
  {
    v5 = CVPixelBufferCreateWithIOSurface(0, (IOSurfaceRef)self->_instanceMaskSurface, 0, &p_instanceMaskPixelBuffer->value_);
    result = p_instanceMaskPixelBuffer->value_;
    if (!p_instanceMaskPixelBuffer->value_)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADRemoveBackgroundMaskResult instanceMaskPixelBuffer].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
      return p_instanceMaskPixelBuffer->value_;
    }
  }
  return result;
}

- (CGImage)instanceMaskImage
{
  CF<CGImage *> *p_instanceMaskImage;
  CGImage *result;
  __CVBuffer *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  p_instanceMaskImage = &self->_instanceMaskImage;
  result = self->_instanceMaskImage.value_;
  if (!result)
  {
    v5 = -[MADRemoveBackgroundMaskResult instanceMaskPixelBuffer](self, "instanceMaskPixelBuffer");
    result = p_instanceMaskImage->value_;
    if (v5)
    {
      if (result)
      {
        CFRelease(result);
        p_instanceMaskImage->value_ = 0;
      }
      v6 = VTCreateCGImageFromCVPixelBuffer(v5, 0, &p_instanceMaskImage->value_);
      result = p_instanceMaskImage->value_;
      if (!p_instanceMaskImage->value_)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[MADRemoveBackgroundMaskResult instanceMaskImage].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
        return p_instanceMaskImage->value_;
      }
    }
  }
  return result;
}

- (id)maskPixelBuffersForInstances:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSDictionary *perInstanceMaskSurfaces;
  void *v10;
  __IOSurface *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v32;
  void *v33;
  uint8_t buf[4];
  int v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "firstIndex");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    v13 = v7;
  }
  else
  {
    v29 = *MEMORY[0x1E0CB2F90];
    v30 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      perInstanceMaskSurfaces = self->_perInstanceMaskSurfaces;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](perInstanceMaskSurfaces, "objectForKeyedSubscript:", v10);
      v11 = (__IOSurface *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        break;
      pixelBufferOut = 0;
      v12 = CVPixelBufferCreateWithIOSurface(0, v11, 0, &pixelBufferOut);
      if (!pixelBufferOut)
      {
        v24 = v12;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:].cold.2(buf, v24, &v35);
        if (a4)
        {
          v25 = (void *)MEMORY[0x1E0CB35C8];
          v32 = v30;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create CVPixelBufferRef from IOSurface (%d)"), v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "errorWithDomain:code:userInfo:", v29, -18, v27);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        CF<CGColorSpace *>::~CF((const void **)&pixelBufferOut);

        goto LABEL_16;
      }
      objc_msgSend(v7, "addObject:");
      v8 = objc_msgSend(v6, "indexGreaterThanIndex:", v8);
      CF<CGColorSpace *>::~CF((const void **)&pixelBufferOut);

      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:].cold.1(v8, v14, v15, v16, v17, v18, v19, v20);
    if (a4)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v36 = v30;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid instance index %d"), v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v29, -50, v23);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_16:
    v13 = 0;
  }

  return v13;
}

- (id)maskImagesForInstances:(id)a3 error:(id *)a4
{
  uint64_t v6;
  NSDictionary *perInstanceMaskSurfaces;
  void *v8;
  void *v9;
  size_t v10;
  size_t v11;
  size_t v12;
  CGImageRef v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint8_t v44;
  _BYTE v45[15];
  CGImageRef v46;
  CGColorSpaceRef space;
  uint8_t v48;
  _BYTE v49[7];
  CGDataProviderRef provider;
  CGDataProviderDirectCallbacks callbacks;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v42 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v42, "firstIndex");
  v40 = *MEMORY[0x1E0CB2F90];
  v41 = *MEMORY[0x1E0CB2D50];
  while (1)
  {
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = v43;
      goto LABEL_33;
    }
    perInstanceMaskSurfaces = self->_perInstanceMaskSurfaces;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](perInstanceMaskSurfaces, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      break;
    if (objc_msgSend(v9, "pixelFormat") != 1278226534)
    {
      v35 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v35)
        -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:].cold.4(v35, v36, v37);
      if (a4)
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        v56 = v41;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected pixel format"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", v40, -50, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      goto LABEL_31;
    }
    *(_OWORD *)&callbacks.version = xmmword_1E97E2A90;
    *(_OWORD *)&callbacks.releaseBytePointer = *(_OWORD *)&off_1E97E2AA0;
    callbacks.releaseInfo = (CGDataProviderReleaseInfoCallback)SurfaceReleaseInfoCallback;
    provider = CGDataProviderCreateDirect(v9, objc_msgSend(v9, "height") * objc_msgSend(v9, "bytesPerRow"), &callbacks);
    if (provider)
    {
      CFRetain(v9);
      space = CGColorSpaceCreateDeviceGray();
      v10 = objc_msgSend(v9, "width");
      v11 = objc_msgSend(v9, "height");
      v12 = objc_msgSend(v9, "bytesPerRow");
      v13 = CGImageCreate(v10, v11, 0x20uLL, 0x20uLL, v12, space, 0x2100u, provider, 0, 1, kCGRenderingIntentDefault);
      v46 = v13;
      if (v13)
      {
        objc_msgSend(v43, "addObject:", v13);
        v6 = objc_msgSend(v42, "indexGreaterThanIndex:", v6);
        v14 = 0;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:].cold.3(&v44, v45, v19);
        if (a4)
        {
          v20 = (void *)MEMORY[0x1E0CB35C8];
          v52 = v41;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create CGImage for IOSurface"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", v40, -18, v22);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
        v14 = 1;
      }
      CF<CGColorSpace *>::~CF((const void **)&v46);
      CF<CGColorSpace *>::~CF((const void **)&space);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[MADRemoveBackgroundMaskResult maskImagesForInstances:error:].cold.2(&v48, v49, v15);
      if (a4)
      {
        v16 = (void *)MEMORY[0x1E0CB35C8];
        v54 = v41;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create CGDataProviderRef for IOSurface"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "errorWithDomain:code:userInfo:", v40, -18, v18);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      v14 = 1;
    }
    CF<CGColorSpace *>::~CF((const void **)&provider);

    if (v14)
      goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[MADRemoveBackgroundMaskResult maskPixelBuffersForInstances:error:].cold.1(v6, v24, v25, v26, v27, v28, v29, v30);
  if (a4)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v58 = v41;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid instance index %d"), v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v40, -50, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
    *a4 = v34;

  }
LABEL_31:

LABEL_32:
  v23 = 0;
LABEL_33:

  return v23;
}

- (NSIndexSet)allInstances
{
  return self->_allInstances;
}

- (CGRect)sourceRegionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRegionOfInterest.origin.x;
  y = self->_sourceRegionOfInterest.origin.y;
  width = self->_sourceRegionOfInterest.size.width;
  height = self->_sourceRegionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (float)confidence
{
  return self->_confidence;
}

- (NSNumber)animatedStickerScore
{
  return self->_animatedStickerScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedStickerScore, 0);
  objc_storeStrong((id *)&self->_allInstances, 0);
  CF<CGColorSpace *>::~CF((const void **)&self->_instanceMaskImage.value_);
  CF<CGColorSpace *>::~CF((const void **)&self->_instanceMaskPixelBuffer.value_);
  objc_storeStrong((id *)&self->_perInstanceMaskSurfaces, 0);
  objc_storeStrong((id *)&self->_instanceMaskSurface, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

- (void)instanceMaskPixelBuffer
{
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Failed to create CVPixelBuffer from IOSurface (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)instanceMaskImage
{
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Failed to create CGImage from CVPixelBuffer (%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)maskPixelBuffersForInstances:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Invalid instance index %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)maskPixelBuffersForInstances:(_DWORD *)a3 error:.cold.2(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1D461A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create CVPixelBufferRef from IOSurface (%d)", buf, 8u);
}

- (void)maskImagesForInstances:(uint64_t)a3 error:.cold.2(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Failed to create CGDataProviderRef for IOSurface", a1);
}

- (void)maskImagesForInstances:(uint64_t)a3 error:.cold.3(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Failed to create CGImage for IOSurface", a1);
}

- (void)maskImagesForInstances:(uint64_t)a3 error:.cold.4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_0(&dword_1D461A000, MEMORY[0x1E0C81028], a3, "Unexpected pixel format", v3);
  OUTLINED_FUNCTION_1();
}

@end
