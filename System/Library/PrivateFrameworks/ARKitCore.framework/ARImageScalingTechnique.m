@implementation ARImageScalingTechnique

- (ARImageScalingTechnique)initWithDownscaleFactor:(unsigned __int8)a3
{
  ARImageScalingTechnique *v4;
  ARImageScalingTechnique *v5;
  NSMutableArray *scalingPasses;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ARImageScalingTechnique;
  v4 = -[ARTechnique init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_downscaleFactor = a3;
    v4->_shouldUseScaleFactor = 1;
    v4->_conversionPixelFormatType = 0;
    v4->_scalingInputSize = (CGSize)*MEMORY[0x1E0C9D820];
    scalingPasses = v4->_scalingPasses;
    v4->_scalingPasses = 0;

  }
  return v5;
}

- (ARImageScalingTechnique)initWithScaledSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  ARImageScalingTechnique *v5;
  ARImageScalingTechnique *v6;
  NSMutableArray *scalingPasses;
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)ARImageScalingTechnique;
  v5 = -[ARTechnique init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_downscaleFactor = 0;
    v5->_conversionPixelFormatType = 0;
    v5->_scaledSize.width = width;
    v5->_scaledSize.height = height;
    v5->_shouldUseScaleFactor = 0;
    v5->_scalingInputSize = (CGSize)*MEMORY[0x1E0C9D820];
    scalingPasses = v5->_scalingPasses;
    v5->_scalingPasses = 0;

  }
  return v6;
}

- (unint64_t)requiredSensorDataTypes
{
  return 1;
}

- (id)processData:(id)a3
{
  id v4;
  char isKindOfClass;
  ARModifiedImageData *v6;
  ARModifiedImageData *v7;
  ARModifiedImageData *v8;
  double Width;
  double Height;
  double v11;
  double v12;
  __CVBuffer *v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v26;
  double v27;
  float v28;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = (ARModifiedImageData *)v4;
  v7 = v6;
  v8 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    Width = (double)CVPixelBufferGetWidth(-[ARImageData pixelBuffer](v6, "pixelBuffer"));
    Height = (double)CVPixelBufferGetHeight(-[ARImageData pixelBuffer](v7, "pixelBuffer"));
    if (!self->_shouldUseScaleFactor)
      goto LABEL_5;
    if (-[ARImageScalingTechnique downscaleFactor](self, "downscaleFactor") > 1)
    {
LABEL_9:
      -[ARImageScalingTechnique _createScalingPassesForInputSize:](self, "_createScalingPassesForInputSize:", Width, Height);
      v14 = -[ARImageScalingTechnique _applyScalingPasses:](self, "_applyScalingPasses:", -[ARImageData pixelBuffer](v7, "pixelBuffer"));
      v8 = -[ARModifiedImageData initWithImageData:]([ARModifiedImageData alloc], "initWithImageData:", v7);
      -[ARImageData setPixelBuffer:](v8, "setPixelBuffer:", v14);
      -[ARImageData cameraIntrinsics](v7, "cameraIntrinsics");
      v27 = v16;
      v28 = v15;
      v26 = v17;
      -[ARImageData imageResolution](v7, "imageResolution");
      v19 = v18;
      v21 = v20;
      -[ARImageData imageResolution](v8, "imageResolution");
      *(float *)&v24 = ARAdjustIntrinsicsForViewportSize(v28, v27, v26, v19, v21, v22, v23);
      -[ARImageData setCameraIntrinsics:](v8, "setCameraIntrinsics:", v24);
      CVPixelBufferRelease(v14);
LABEL_11:

      goto LABEL_12;
    }
    if (!self->_shouldUseScaleFactor)
    {
LABEL_5:
      -[ARImageScalingTechnique scaledSize](self, "scaledSize");
      if (v12 != Width || v11 != Height)
        goto LABEL_9;
    }
    v8 = v7;
    goto LABEL_11;
  }
LABEL_12:

  return v8;
}

- (void)_createScalingPassesForInputSize:(CGSize)a3
{
  double height;
  double width;
  CGSize *p_scaledSize;
  double v7;
  double v8;
  CGSize *p_scalingInputSize;
  double v11;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  unsigned int v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  NSObject *v28;
  objc_class *v29;
  void *v30;
  void *v31;
  NSMutableArray *v32;
  NSMutableArray *scalingPasses;
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  ARImageScalingTechnique *v38;
  __int16 v39;
  double v40;
  __int16 v41;
  CGFloat v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  uint64_t v47;

  height = a3.height;
  width = a3.width;
  v47 = *MEMORY[0x1E0C80C00];
  p_scaledSize = &self->_scaledSize;
  if (self->_shouldUseScaleFactor)
  {
    v7 = a3.width / (double)-[ARImageScalingTechnique downscaleFactor](self, "downscaleFactor");
    v8 = height / (double)-[ARImageScalingTechnique downscaleFactor](self, "downscaleFactor");
  }
  else
  {
    v7 = p_scaledSize->width;
    v8 = self->_scaledSize.height;
  }
  p_scalingInputSize = &self->_scalingInputSize;
  if (self->_scalingInputSize.width != width || self->_scalingInputSize.height != height)
    goto LABEL_27;
  v11 = p_scaledSize->height;
  if (p_scaledSize->width != v7 || v11 != v8)
    goto LABEL_27;
  -[NSMutableArray lastObject](self->_scalingPasses, "lastObject", p_scaledSize->width, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13
    || (v14 = (void *)v13,
        -[NSMutableArray lastObject](self->_scalingPasses, "lastObject"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "conversionPixelFormatType"),
        v17 = -[ARImageScalingTechnique conversionPixelFormatType](self, "conversionPixelFormatType"),
        v15,
        v14,
        v16 != v17))
  {
LABEL_27:
    if (self->_scalingPasses)
    {
      kdebug_trace();
      _ARLogTechnique_12();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v20;
        v37 = 2048;
        v38 = self;
        _os_log_impl(&dword_1B3A68000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Recreating scaling passes", buf, 0x16u);

      }
      _ARLogTechnique_12();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = p_scalingInputSize->width;
        v25 = self->_scalingInputSize.height;
        v26 = p_scaledSize->width;
        v27 = p_scaledSize->height;
        *(_DWORD *)buf = 138544642;
        v36 = v23;
        v37 = 2048;
        v38 = self;
        v39 = 2048;
        v40 = v24;
        v41 = 2048;
        v42 = v25;
        v43 = 2048;
        v44 = v26;
        v45 = 2048;
        v46 = v27;
        _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was scaling from %.1f x %.1f to %.1f x %.1f", buf, 0x3Eu);

      }
      _ARLogTechnique_12();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v36 = v30;
        v37 = 2048;
        v38 = self;
        v39 = 2048;
        v40 = width;
        v41 = 2048;
        v42 = height;
        v43 = 2048;
        v44 = v7;
        v45 = 2048;
        v46 = v8;
        _os_log_impl(&dword_1B3A68000, v28, OS_LOG_TYPE_INFO, "%{public}@ <%p>: now scaling from %.1f x %.1f to %.1f x %.1f", buf, 0x3Eu);

      }
    }
    p_scalingInputSize->width = width;
    self->_scalingInputSize.height = height;
    p_scaledSize->width = v7;
    p_scaledSize->height = v8;
    objc_msgSend((id)objc_opt_class(), "scalingPassDescriptionForInputSize:scaledSize:conversionPixelFormat:", -[ARImageScalingTechnique conversionPixelFormatType](self, "conversionPixelFormatType"), p_scalingInputSize->width, self->_scalingInputSize.height, p_scaledSize->width, p_scaledSize->height);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (NSMutableArray *)objc_opt_new();
    scalingPasses = self->_scalingPasses;
    self->_scalingPasses = v32;

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __60__ARImageScalingTechnique__createScalingPassesForInputSize___block_invoke;
    v34[3] = &unk_1E6675610;
    v34[4] = self;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v34);

  }
}

void __60__ARImageScalingTechnique__createScalingPassesForInputSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ARImageScalePass *v4;

  v3 = a2;
  v4 = -[ARImageScalePass initWithDescription:]([ARImageScalePass alloc], "initWithDescription:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "addObject:", v4);
}

- (__CVBuffer)_applyScalingPasses:(__CVBuffer *)a3
{
  __CVBuffer *v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CVBuffer *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  CVPixelBufferRetain(a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_scalingPasses;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      v10 = v3;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v3 = (__CVBuffer *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "scalePixelBuffer:", v10, (_QWORD)v12);
        CVPixelBufferRelease(v10);
        ++v9;
        v10 = v3;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

+ (id)scalingPassDescriptionForInputSize:(CGSize)a3 scaledSize:(CGSize)a4 conversionPixelFormat:(unsigned int)a5
{
  double height;
  double width;
  double v7;
  double v8;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  ARImageScalingPassDescription *v20;
  NSObject *v21;
  objc_class *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  double v31;
  double v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  double v38;
  __int16 v39;
  double v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  _BOOL4 v52;
  uint64_t v53;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  v53 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_opt_new();
  _ARLogTechnique_12();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v34 = v13;
    v35 = 2048;
    v36 = a1;
    v37 = 2048;
    v38 = v8;
    v39 = 2048;
    v40 = v7;
    v41 = 2048;
    v42 = width;
    v43 = 2048;
    v44 = height;
    _os_log_impl(&dword_1B3A68000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: scale (%.1f x %.1f) to (%.1f x %.1f) START", buf, 0x3Eu);

  }
  v31 = width;
  v32 = height;
  do
  {
    v14 = width / v8;
    v15 = height / v7;
    v16 = fmaxf(v14, 0.25);
    v17 = round(v8 * v16);
    v18 = fmaxf(v15, 0.25);
    v19 = round(v7 * v18);
    v20 = -[ARImageScalingPassDescription initWithSize:]([ARImageScalingPassDescription alloc], "initWithSize:", v17, v19);
    objc_msgSend(v10, "addObject:", v20);

    _ARLogTechnique_12();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545666;
      v34 = v23;
      v35 = 2048;
      v36 = a1;
      v37 = 2048;
      v38 = v8;
      v39 = 2048;
      v40 = v7;
      v41 = 2048;
      v42 = v17;
      v43 = 2048;
      v44 = v19;
      v45 = 2048;
      v46 = v16;
      v47 = 2048;
      v48 = v18;
      v49 = 1024;
      v50 = v14 >= 0.25;
      v51 = 1024;
      v52 = v15 >= 0.25;
      _os_log_impl(&dword_1B3A68000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: \tscale (%f x %f) to (%f x %f) scaleX=%f, scaleY=%f, finalXPass=%d, finalYPass=%d", buf, 0x5Eu);

    }
    width = v31;
    height = v32;
    v24 = v17 == v31 && v19 == v32;
    v7 = v19;
    v8 = v17;
  }
  while (!v24);
  _ARLogTechnique_12();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v34 = v27;
    v35 = 2048;
    v36 = a1;
    v37 = 2048;
    v38 = v17;
    v39 = 2048;
    v40 = v19;
    _os_log_impl(&dword_1B3A68000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: scaled to (%.1f x %.1f) COMPLETE", buf, 0x2Au);

  }
  objc_msgSend(v10, "lastObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setPixelBufferFormat:", a5);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARImageScalingTechnique;
  if (-[ARTechnique isEqual:](&v15, sel_isEqual_, v4))
  {
    v5 = v4;
    if (self->_shouldUseScaleFactor)
    {
      v6 = -[ARImageScalingTechnique downscaleFactor](self, "downscaleFactor");
      v7 = v6 == objc_msgSend(v5, "downscaleFactor");
    }
    else
    {
      -[ARImageScalingTechnique scaledSize](self, "scaledSize");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v5, "scaledSize");
      v7 = v11 == v13 && v9 == v12;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (CGSize)scaledSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scaledSize.width;
  height = self->_scaledSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (unsigned)conversionPixelFormatType
{
  return self->_conversionPixelFormatType;
}

- (void)setConversionPixelFormatType:(unsigned int)a3
{
  self->_conversionPixelFormatType = a3;
}

- (unsigned)downscaleFactor
{
  return self->_downscaleFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalingPasses, 0);
}

@end
