@implementation BWVISNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  void *v8;
  void *v9;
  BWPixelBufferPool *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  BWNodeOutputMediaConfiguration *v14;
  BWNodeOutputMediaConfiguration *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BWVideoFormatRequirements *v23;
  BWVideoFormatRequirements *v24;
  uint64_t v25;
  BWNodeOutput *output;
  __CFString *v27;
  BWNodeOutputMediaConfiguration *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  BWPixelBufferPool *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  BWNodeOutputMediaConfiguration *v38;
  BWNodeOutputMediaConfiguration *v39;
  BWVideoFormatRequirements *v40;
  id obj;
  objc_super v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[2];
  _BYTE v49[128];
  uint64_t v50;
  _QWORD v51[6];

  v51[4] = *MEMORY[0x1E0C80C00];
  v8 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    if (self->_visExecutionMode == 4)
    {
      -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
    }
    else
    {
      if (self->_onlyGeneratingTransforms)
        -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
      -[BWVISNode _updateOutputRequirements]((uint64_t)self);
    }
    return;
  }
  if ((!self->_personSegmentationRenderingEnabled
     || (objc_msgSend(a5, "isEqualToString:", 0x1E495AF78) & 1) == 0
     && (!self->_personSegmentationRenderingEnabled || (objc_msgSend(a5, "isEqualToString:", 0x1E495AFB8) & 1) == 0))
    && (!self->_stabilizeDepthAttachments || (objc_msgSend(a5, "isEqualToString:", CFSTR("Depth")) & 1) == 0)
    && (!self->_videoGreenGhostMitigationEnabled
     || !self->_lightSourceMaskAndKeypointDescriptorDataEnabled
     || (objc_msgSend(a5, "isEqualToString:", 0x1E494FB78) & 1) == 0
     && (objc_msgSend(a5, "isEqualToString:", 0x1E494FB98) & 1) == 0))
  {
    if (!self->_smartStyleRenderingEnabled || !objc_msgSend(v8, "containsObject:", a5))
    {
      v43.receiver = self;
      v43.super_class = (Class)BWVISNode;
      -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v43, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
      return;
    }
    v51[0] = 0x1E495B218;
    v51[1] = CFSTR("HumanSkinsMask");
    v51[2] = CFSTR("HumanFullBodiesMask");
    v51[3] = 0x1E495B3F8;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
    if (objc_msgSend(a5, "isEqual:", 0x1E495B358))
    {
      v10 = [BWPixelBufferPool alloc];
      v11 = -[BWNodeOutput retainedBufferCount](self->super._output, "retainedBufferCount");
      v12 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v10, "initWithVideoFormat:capacity:name:memoryPool:", a3, v11, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VIS %@ Intermediate Pool"), 0x1E495B358), -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
      if (v12)
      {
        v13 = (void *)v12;
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intermediatePixelBufferPools, "setObject:forKeyedSubscript:", v12, 0x1E495B358);

        if (!self->_smartStyleReversibilityEnabled)
          return;
        v14 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        if (v14)
        {
          v15 = v14;
          v16 = self->_smartStyleReversibilityUses4x3Spotlights ? 3 : 2;
          v17 = (void *)objc_msgSend(MEMORY[0x1E0D08AE0], "configurationForUseCase:", v16);
          v18 = objc_msgSend(v17, "outputCoefficientsF16");
          objc_msgSend(MEMORY[0x1E0D08AF0], "coefficientPixelBufferSizeForConfiguration:float16:", v17, v18);
          v20 = v19;
          v22 = v21;
          v23 = objc_alloc_init(BWVideoFormatRequirements);
          if (v23)
          {
            v24 = v23;
            if ((_DWORD)v18)
              v25 = 1278226536;
            else
              v25 = 1278226534;
            v50 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25);
            -[BWVideoFormatRequirements setSupportedPixelFormats:](v24, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1));
            -[BWVideoFormatRequirements setWidth:](v24, "setWidth:", (unint64_t)v20);
            -[BWVideoFormatRequirements setHeight:](v24, "setHeight:", (unint64_t)v22);
            -[BWVideoFormatRequirements setWidthAlignment:](v24, "setWidthAlignment:", 16);
            -[BWVideoFormatRequirements setHeightAlignment:](v24, "setHeightAlignment:", 16);
            -[BWNodeOutputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", v24);
            -[BWNodeOutputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 0);
            -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v15, "setProvidesPixelBufferPool:", 1);
            output = self->super._output;
            v27 = CFSTR("SmartStyleStreamingReverseLearnedCoefficients");
            v28 = v15;
            goto LABEL_52;
          }
        }
      }
LABEL_55:
      fig_log_get_emitter();
LABEL_54:
      FigDebugAssert3();
      return;
    }
    if (!objc_msgSend(a5, "isEqual:", 0x1E495B3B8))
    {
      if (!self->_smartStyleReversibilityEnabled || !objc_msgSend(v9, "containsObject:", a5))
        return;
      v38 = objc_alloc_init(BWNodeOutputMediaConfiguration);
      if (v38)
      {
        v39 = v38;
        if (objc_msgSend(a5, "isEqual:", 0x1E495B3F8))
        {
          v40 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v40, "setSupportedPixelFormats:", &unk_1E4A01100);
          -[BWVideoFormatRequirements setWidth:](v40, "setWidth:", objc_msgSend(a3, "width"));
          -[BWVideoFormatRequirements setHeight:](v40, "setHeight:", objc_msgSend(a3, "height"));
          -[BWVideoFormatRequirements setWidthAlignment:](v40, "setWidthAlignment:", 16);
          -[BWVideoFormatRequirements setHeightAlignment:](v40, "setHeightAlignment:", 16);
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v40, "setSupportedColorSpaceProperties:", &unk_1E4A01118);
          -[BWVideoFormatRequirements setSupportedCacheModes:](v40, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
        }
        else
        {
          v40 = -[BWVideoFormatRequirements initWithPixelBufferAttributes:]([BWVideoFormatRequirements alloc], "initWithPixelBufferAttributes:", objc_msgSend(a3, "pixelBufferAttributes"));
        }
        if (v40)
        {
          -[BWNodeOutputMediaConfiguration setFormatRequirements:](v39, "setFormatRequirements:", v40);
          -[BWNodeOutputMediaConfiguration setPassthroughMode:](v39, "setPassthroughMode:", 0);
          -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v39, "setProvidesPixelBufferPool:", 1);
          output = self->super._output;
          v28 = v39;
          v27 = (__CFString *)a5;
LABEL_52:
          -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](output, "setMediaConfiguration:forAttachedMediaKey:", v28, v27);
          return;
        }
      }
      goto LABEL_55;
    }
    if (self->_smartStyleReversibilityEnabled)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v48[0] = 0x1E495B3B8;
      v48[1] = 0x1E495B3D8;
      obj = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v45 != v31)
              objc_enumerationMutation(obj);
            v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
            v34 = [BWPixelBufferPool alloc];
            v35 = -[BWNodeOutput retainedBufferCount](self->super._output, "retainedBufferCount");
            v36 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:](v34, "initWithVideoFormat:capacity:name:memoryPool:", a3, v35, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VIS %@ Intermediate Pool"), v33), -[BWNodeOutput memoryPool](self->super._output, "memoryPool"));
            if (!v36)
            {
              fig_log_get_emitter();
              goto LABEL_54;
            }
            v37 = (void *)v36;
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_intermediatePixelBufferPools, "setObject:forKeyedSubscript:", v36, v33);

          }
          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v30)
            continue;
          break;
        }
      }
    }
  }
}

BOOL __38__BWVISNode__updateOutputRequirements__block_invoke(unsigned __int8 *a1, void *a2)
{
  int v3;

  v3 = objc_msgSend(a2, "intValue");
  return a1[32] == FigCapturePixelFormatIsTenBit(v3)
      && a1[33] == FigCapturePixelFormatIs422(v3)
      && a1[34] == FigCapturePixelFormatIsFullRange(v3);
}

- (void)setOutputDimensions:(id)a3
{
  if (self->_outputDimensions.width != a3.var0 || self->_outputDimensions.height != a3.var1)
  {
    self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (void)setVideoSTFEnabled:(BOOL)a3
{
  int stabilizationType;
  BOOL v4;

  if (!a3
    || ((stabilizationType = self->_stabilizationType, stabilizationType != 4)
      ? (v4 = stabilizationType == 2)
      : (v4 = 1),
        v4))
  {
    self->_videoSTFEnabled = a3;
  }
}

- (void)setVideoGreenGhostMitigationEnabled:(BOOL)a3
{
  int stabilizationType;
  BOOL v4;

  if (!a3
    || ((stabilizationType = self->_stabilizationType, stabilizationType != 4)
      ? (v4 = stabilizationType == 2)
      : (v4 = 1),
        v4))
  {
    if (self->_videoGreenGhostMitigationEnabled != a3)
    {
      self->_videoGreenGhostMitigationEnabled = a3;
      -[BWVISNode _updateInputRequirements]((uint64_t)self);
    }
  }
}

- (void)setSphereVideoEnabled:(BOOL)a3
{
  self->_sphereVideoEnabled = a3;
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3
{
  if (self->_personSegmentationRenderingEnabled != a3)
  {
    self->_personSegmentationRenderingEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
  }
}

- (void)setFrameRateConversionEnabled:(BOOL)a3
{
  self->_frameRateConversionEnabled = a3;
}

- (void)setFlipHorizontalExcludingIris:(BOOL)a3
{
  self->_flipHorizontalExcludingIris = a3;
}

- (void)_updateOutputRequirements
{
  BWVideoFormatRequirements *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char IsFullRange;
  char IsTenBit;
  char v10;
  uint64_t v11;
  _UNKNOWN **v12;
  BWNodeOutputMediaConfiguration *v13;
  BWVideoFormatRequirements *v14;
  BWVideoFormatRequirements *v15;
  void *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  BWVideoFormatRequirements *v24;
  BWNodeOutputMediaConfiguration *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  char v31;
  char v32;
  char v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v2, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
    v3 = *(unsigned int *)(a1 + 600);
    if ((_DWORD)v3
      || (v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "colorSpaceProperties"), (_DWORD)v3))
    {
      v35[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
      v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    }
    else
    {
      v4 = 0;
    }
    -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v2, "setSupportedColorSpaceProperties:", v4);
    if (*(_DWORD *)(a1 + 180) != 4)
    {
      v5 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
      v6 = v5;
      if (*(_DWORD *)(a1 + 148) && *(_DWORD *)(a1 + 152))
      {
        -[BWVideoFormatRequirements setWidth:](v2, "setWidth:");
        v7 = *(int *)(a1 + 152);
      }
      else
      {
        -[BWVideoFormatRequirements setWidth:](v2, "setWidth:", objc_msgSend(v5, "width"));
        v7 = objc_msgSend(v6, "height");
      }
      -[BWVideoFormatRequirements setHeight:](v2, "setHeight:", v7);
      if (v6)
      {
        IsFullRange = FigCapturePixelFormatIsFullRange(objc_msgSend(v6, "pixelFormat"));
        IsTenBit = FigCapturePixelFormatIsTenBit(objc_msgSend(v6, "pixelFormat"));
        v10 = FigCapturePixelFormatIs422(objc_msgSend(v6, "pixelFormat"));
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __38__BWVISNode__updateOutputRequirements__block_invoke;
        v30[3] = &__block_descriptor_35_e35_B24__0__NSNumber_8__NSDictionary_16l;
        v31 = IsTenBit;
        v32 = v10;
        v33 = IsFullRange;
        v11 = objc_msgSend(*(id *)(a1 + 136), "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v30));
      }
      else
      {
        v11 = *(_QWORD *)(a1 + 136);
      }
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v2, "setSupportedPixelFormats:", v11);
      v12 = &off_1E4914000;
      if (*(_BYTE *)(a1 + 665))
      {
        v13 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v14 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", &unk_1E4A01160);
        -[BWVideoFormatRequirements setWidth:](v14, "setWidth:", *(int *)(a1 + 668));
        -[BWVideoFormatRequirements setHeight:](v14, "setHeight:", *(int *)(a1 + 672));
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v13, "setFormatRequirements:", v14);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v13, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v13, "setProvidesPixelBufferPool:", 1);
      }
      else
      {
        v13 = 0;
      }
      objc_msgSend(*(id *)(a1 + 16), "setMediaConfiguration:forAttachedMediaKey:", v13, CFSTR("Depth"));
      if (*(_BYTE *)(a1 + 689))
      {
        v25 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v15 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v15, "setSupportedPixelFormats:", &unk_1E4A01178);
        v16 = (void *)objc_opt_new();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v17 = -[BWVideoFormatRequirements supportedColorSpaceProperties](v2, "supportedColorSpaceProperties");
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v27 != v20)
                objc_enumerationMutation(v17);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "intValue") == 3)
                v22 = &unk_1E49FAB18;
              else
                v22 = &unk_1E49FAB30;
              objc_msgSend(v16, "addObject:", v22);
            }
            v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v19);
        }
        -[BWVideoFormatRequirements setWidth:](v15, "setWidth:", -[BWVideoFormatRequirements width](v2, "width"));
        -[BWVideoFormatRequirements setHeight:](v15, "setHeight:", -[BWVideoFormatRequirements height](v2, "height"));
        -[BWVideoFormatRequirements setWidthAlignment:](v15, "setWidthAlignment:", -[BWVideoFormatRequirements widthAlignment](v2, "widthAlignment"));
        -[BWVideoFormatRequirements setHeightAlignment:](v15, "setHeightAlignment:", -[BWVideoFormatRequirements heightAlignment](v2, "heightAlignment"));
        -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v15, "setSupportedColorSpaceProperties:", v16);
        -[BWVideoFormatRequirements setSupportedCacheModes:](v15, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedCPUAccess](BWVideoFormatRequirements, "cacheModesForOptimizedCPUAccess"));
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v25, "setFormatRequirements:", v15);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v25, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v25, "setProvidesPixelBufferPool:", 1);
        objc_msgSend(*(id *)(a1 + 16), "setMediaConfiguration:forAttachedMediaKey:", v25, 0x1E495B418);

        v12 = &off_1E4914000;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 16), "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E495B418);
      }
      if (*(_BYTE *)(a1 + 692))
      {
        v23 = objc_alloc_init((Class)v12[446]);
        v24 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v24, "setSupportedPixelFormats:", &unk_1E4A01190);
        -[BWVideoFormatRequirements setWidth:](v24, "setWidth:", -[BWVideoFormatRequirements width](v2, "width") >> 2);
        -[BWVideoFormatRequirements setHeight:](v24, "setHeight:", -[BWVideoFormatRequirements height](v2, "height") >> 2);
        objc_msgSend(v23, "setFormatRequirements:", v24);
        objc_msgSend(v23, "setPassthroughMode:", 0);
        objc_msgSend(v23, "setProvidesPixelBufferPool:", 1);
        objc_msgSend(*(id *)(a1 + 16), "setMediaConfiguration:forAttachedMediaKey:", v23, 0x1E495B458);
      }
    }
    if (*(_BYTE *)(a1 + 161))
    {

      *(_QWORD *)(a1 + 200) = v2;
      v2 = objc_alloc_init(BWVideoFormatRequirements);
    }
    objc_msgSend(*(id *)(a1 + 16), "setFormatRequirements:", v2);

  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (uint64_t)_setupVISProcessorController
{
  int v2;
  int v3;
  int v4;
  uint64_t v8;
  int CompressionType;
  BOOL v10;
  void *v11;
  id v12;
  void *v13;
  int *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  BWVISProcessorController *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[6];
  _BYTE v45[128];
  __CFString *v46;
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = *(_DWORD *)(a1 + 100);
  if (v2 == 4)
  {
    CompressionType = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat"));
    if (FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat")))v10 = CompressionType == 0;
    else
      v10 = 1;
    if (v10)
      v8 = 0;
    else
      v8 = 3;
  }
  else if (v2 == 3)
  {
    v3 = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat"));
    v4 = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelFormat"));
    if (v4 == 4 || v4 == 2 || v3 == 4 || v3 == 2)
      v8 = 1;
    else
      v8 = 2;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 104), "setTransformPlatform:", v8);
  if (*(_BYTE *)(a1 + 176))
  {
    v11 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "videoFormat"), "pixelBufferAttributes");
    if (objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FA0]), "BOOLValue"))objc_msgSend(*(id *)(a1 + 104), "setExtendedOutputRowsToFill:", ((*(_DWORD *)(a1 + 152) + 15) & 0xFFFFFFF0) - *(_DWORD *)(a1 + 152));
  }
  if (*(_BYTE *)(a1 + 161))
  {
    v47[0] = *(_QWORD *)(a1 + 200);
    v12 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1));
  }
  else
  {
    v12 = (id)objc_msgSend(*(id *)(a1 + 16), "videoFormat");
  }
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 104), "setEmitSampleBufferSemaphore:", *(_QWORD *)(a1 + 208));
  objc_msgSend(*(id *)(a1 + 104), "setGpuPriority:", *(unsigned int *)(a1 + 156));
  objc_msgSend(*(id *)(a1 + 104), "setSphereVideoEnabled:", *(unsigned __int8 *)(a1 + 160));
  objc_msgSend(*(id *)(a1 + 104), "setFrameRateConversionEnabled:", *(unsigned __int8 *)(a1 + 664));
  objc_msgSend(*(id *)(a1 + 104), "setInputPixelBufferAttributes:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelBufferAttributes"));
  objc_msgSend(*(id *)(a1 + 104), "setOutputPixelBufferAttributes:", objc_msgSend(v13, "pixelBufferAttributes"));
  objc_msgSend(*(id *)(a1 + 104), "setOutputPixelBufferPool:", objc_msgSend(*(id *)(a1 + 16), "preparedPixelBufferPool"));
  if (*(_BYTE *)(a1 + 665))
    objc_msgSend(*(id *)(a1 + 104), "setOutputDepthPixelBufferPool:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "preparedPixelBufferPool"));
  objc_msgSend(*(id *)(a1 + 104), "setSmartStyleRenderingEnabled:", *(unsigned __int8 *)(a1 + 688));
  objc_msgSend(*(id *)(a1 + 104), "setSmartStyleReversibilityEnabled:", *(unsigned __int8 *)(a1 + 689));
  objc_msgSend(*(id *)(a1 + 104), "setSmartStyleMemoryPoolId:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v14 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  if (*(_BYTE *)(a1 + 688) || *(_BYTE *)(a1 + 689))
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!v15)
      goto LABEL_66;
    v16 = v15;
    if (*(_BYTE *)(a1 + 688))
    {
      v46 = CFSTR("SmartStyleStreamingLearnedCoefficients");
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i)), "preparedPixelBufferPool"), *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
        }
        while (v19);
      }
    }
    if (*(_BYTE *)(a1 + 689))
    {
      v44[0] = 0x1E495B218;
      v44[1] = CFSTR("HumanSkinsMask");
      v44[2] = CFSTR("HumanFullBodiesMask");
      v44[3] = 0x1E495B378;
      v44[4] = 0x1E495B3F8;
      v44[5] = 0x1E495B418;
      v22 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 6);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v36 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(v16, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j)), "preparedPixelBufferPool"), *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        }
        while (v24);
      }
    }
    objc_msgSend(v16, "addEntriesFromDictionary:", *(_QWORD *)(a1 + 680));
    objc_msgSend(*(id *)(a1 + 104), "setOutputAttachmentsPixelBufferPools:", v16);

    v14 = &OBJC_IVAR___BWLivePhotoMovieAnalyticsPayload__maxVideoFrameDurationInMilliseconds;
  }
  if (*(_BYTE *)(a1 + 692))
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (!v27)
      goto LABEL_66;
    v28 = v27;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", 0x1E495B458), "preparedPixelBufferPool"), 0x1E495B458);
    objc_msgSend(v28, "addEntriesFromDictionary:", objc_msgSend(*(id *)(a1 + 104), "outputAttachmentsPixelBufferPools"));
    objc_msgSend(*(id *)(a1 + 104), "setOutputAttachmentsPixelBufferPools:", v28);

  }
  if (*(_BYTE *)(a1 + 172))
    objc_msgSend(*(id *)(a1 + 104), "setVideoSTFParameters:", -[FigCaptureCameraParameters videoStabilizationSTFParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "videoStabilizationSTFParameters"));
  if (*(_BYTE *)(a1 + 173))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", -[FigCaptureCameraParameters commonVideoGreenGhostMitigationParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "commonVideoGreenGhostMitigationParameters"));
    if (v29)
    {
      v30 = v29;
      if (!*(_BYTE *)(a1 + 174))
        objc_msgSend(v29, "setObject:forKeyedSubscript:", 0, CFSTR("LowLightMitigationParameters"));
      objc_msgSend(*(id *)(a1 + 104), "setVideoGreenGhostMitigationParameters:", v30);

      goto LABEL_61;
    }
LABEL_66:
    v32 = 4294954510;
    goto LABEL_64;
  }
LABEL_61:
  objc_msgSend(*(id *)(a1 + 104), "setCameraExtrinsicMatrix:", *(_QWORD *)(a1 + 728));
  v31 = objc_alloc_init(BWVISProcessorController);
  *(_QWORD *)(a1 + v14[421]) = v31;
  if (!v31)
    goto LABEL_66;
  -[BWVISProcessorController setConfiguration:](v31, "setConfiguration:", *(_QWORD *)(a1 + 104));
  v32 = objc_msgSend(*(id *)(a1 + v14[421]), "prepareToProcess");
  v33 = *(void **)(a1 + v14[421]);
  if (!v33)
  {
    v32 = 4294954516;
    goto LABEL_64;
  }
  objc_msgSend(v33, "setDelegate:", a1);
  if ((_DWORD)v32)
  {
LABEL_64:
    objc_msgSend(*(id *)(a1 + 264), "logErrorNumber:errorString:", v32, CFSTR("Setup VIS Processor"));

    *(_QWORD *)(a1 + v14[421]) = 0;
  }
  return v32;
}

- (BWVISNode)initWithSensorIDDict:(id)a3 stabilizationMethod:(int)a4 stabilizationType:(int)a5 ispProcessingSession:(id)a6 maxSupportedFrameRate:(float)a7 activeMaxFrameRate:(float)a8 gpuPriority:(int)a9 metalSubmissionAndCompletionQueuePriority:(unsigned int)a10 motionAttachmentsSource:(int)a11 fillExtendedRowsOfOutputBuffer:(BOOL)a12 overCaptureEnabled:(BOOL)a13 stereoMode:(int)a14 videoStabilizationOverscanOverride:(float)a15 videoStabilizationStrength:(int)a16 zoomSmoothingEnabled:(BOOL)a17 applyFrameCropOffset:(BOOL)a18 motionMetadataPreloadingEnabled:(BOOL)a19 visExecutionMode:(int)a20 livePhotoCleanOutputRect:(CGRect)a21 cameraInfoByPortType:(id)a22 cvisExtendedLookAheadDuration:(float)a23 distortionCorrectionEnabledPortTypes:(id)a24 distortionCompensationEnabledPortTypes:(id)a25 minDistanceForBravoParallaxShift:(float)a26 lightSourceMaskAndKeypointDescriptorDataEnabled:(BOOL)a27 attachStabilizedOutputCameraTrajectory:(BOOL)a28
{
  BWVISNode *v28;
  uint64_t v30;
  double height;
  double width;
  double y;
  double x;
  _BOOL4 v43;
  _OWORD *v45;
  int visExecutionMode;
  BOOL v47;
  BOOL v48;
  float v49;
  NSMutableDictionary *v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t stereoMode;
  int v56;
  void *v57;
  uint64_t v58;
  BWVISProcessorControllerConfiguration *v59;
  double v60;
  double v61;
  int v62;
  _BOOL4 v63;
  BOOL v65;
  BWVISProcessorControllerConfiguration *processorControllerConfiguration;
  int v67;
  unsigned int v68;
  uint64_t v69;
  _BOOL8 v70;
  BWNodeInput *v71;
  BWVideoFormatRequirements *v72;
  BWNodeOutput *v73;
  BWVideoFormatRequirements *v74;
  int v76;
  id v77;
  unsigned int v78;
  uint64_t v79;
  id v80;
  objc_super v81;
  CGRect v82;
  CGRect v83;

  v28 = self;
  if (!a3)
    goto LABEL_89;
  v30 = *(_QWORD *)&a9;
  height = a21.size.height;
  width = a21.size.width;
  y = a21.origin.y;
  x = a21.origin.x;
  if (a5 != 2 && ((a5 - 5) < 0xFFFFFFFE || !a6 || a20 == 3 || self->_onlyGeneratingTransforms))
    goto LABEL_89;
  v81.receiver = self;
  v81.super_class = (Class)BWVISNode;
  v28 = -[BWNode init](&v81, sel_init);
  if (!v28)
    return v28;
  v80 = a3;
  v77 = a6;
  v82.origin.x = x;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = height;
  v43 = !CGRectIsEmpty(v82) && (a4 == 3 || a4 == 5);
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  LODWORD(v79) = CGRectIsEmpty(v83);
  HIDWORD(v79) = v43;
  v28->_stabilizationMethod = a4;
  v28->_stabilizationType = a5;
  v28->_fillExtendedRowsOfOutputBuffer = a12;
  v28->_visExecutionMode = a20;
  if (a23 == 0.0)
    a23 = 0.5;
  v28->_usingExtendedCVISLivePhotoStabilization = v43;
  v28->_cinematicLookAheadFrameCount = 0;
  v45 = (_OWORD *)MEMORY[0x1E0CA2E18];
  v28->_lastEmittedPTS.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  *(_OWORD *)&v28->_lastEmittedPTS.value = *v45;
  v28->_onlyGeneratingTransforms = (v28->_visExecutionMode < 6u) & (0x26u >> v28->_visExecutionMode);
  visExecutionMode = v28->_visExecutionMode;
  v47 = visExecutionMode == 3 || visExecutionMode == 0;
  v48 = v47;
  v28->_stabilizeMetadata = v48;
  v28->_pipelineTraceID = 81;
  v28->_videoStabilizationOverscanOverride = a15;
  v28->_gpuPriority = v30;
  v28->_lightSourceMaskAndKeypointDescriptorDataEnabled = a27;
  v28->_lowLightGreenGhostMitigationEnabled = 1;
  v28->_stereoMode = a14;
  v28->_smartStyleReversibilityUses4x3Spotlights = 1;
  v49 = fmaxf(a8, 30.0);
  v28->_maxFrameRate = v49;
  v50 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28->_intermediatePixelBufferPools = v50;
  if (!v50)
    goto LABEL_89;
  LODWORD(v30) = vcvtps_s32_f32(v49 * a23);
  v51 = v28->_visExecutionMode;
  if (v51 != 4)
  {
    v53 = 0;
    v76 = v43 | v79;
    v78 = 1;
    if (a4 > 5)
    {
      stereoMode = 0;
    }
    else
    {
      v54 = 1 << a4;
      stereoMode = 0;
      if ((v54 & 0x2C) != 0)
      {
        v53 = 0;
        stereoMode = 4;
        v78 = 1;
        if (v51 != 2 && v51 != 5)
        {
          if (v51 == 3)
          {
            v53 = 0;
            stereoMode = 5;
LABEL_42:
            v56 = 1;
            goto LABEL_43;
          }
          if (v79)
          {
            if (a19)
            {
              v53 = 0;
              v28->_cinematicLookAheadFrameCount = v30;
              stereoMode = 2;
              goto LABEL_42;
            }
            stereoMode = v28->_stereoMode;
            if ((_DWORD)stereoMode == 1)
            {
              v53 = 3;
            }
            else
            {
              if ((_DWORD)stereoMode == 2)
              {
                v53 = 0;
                stereoMode = 4;
                goto LABEL_42;
              }
              v53 = 0;
              stereoMode = 1;
            }
          }
          else
          {
            v53 = 0;
            stereoMode = 3;
          }
          v56 = v30 + 1;
LABEL_43:
          v78 = v56;
        }
      }
    }
    if (a5 == 2 && a7 >= 120.0)
    {
      v57 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v80);
      v58 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
      v80 = v57;
      objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, *MEMORY[0x1E0D061A8]);
    }
    if (!objc_msgSend(a24, "count") && !objc_msgSend(a25, "count") || a5 == 4 || a5 == 2)
    {
      v59 = objc_alloc_init(BWVISProcessorControllerConfiguration);
      v28->_processorControllerConfiguration = v59;
      if (v59)
      {
        -[BWVISProcessorControllerConfiguration setSensorIDDict:](v59, "setSensorIDDict:", v80);
        -[BWVISProcessorControllerConfiguration setSmoothingMethod:](v28->_processorControllerConfiguration, "setSmoothingMethod:", stereoMode);
        -[BWVISProcessorControllerConfiguration setMotionBlurShimmerMitigationMethod:](v28->_processorControllerConfiguration, "setMotionBlurShimmerMitigationMethod:", v53);
        *(float *)&v60 = a23;
        -[BWVISProcessorControllerConfiguration setCinematicLookAheadTime:](v28->_processorControllerConfiguration, "setCinematicLookAheadTime:", v60);
        -[BWVISProcessorControllerConfiguration setCinematicLookAheadFrameCount:](v28->_processorControllerConfiguration, "setCinematicLookAheadFrameCount:", v30);
        -[BWVISProcessorControllerConfiguration setUseISPMotionData:](v28->_processorControllerConfiguration, "setUseISPMotionData:", (a11 - 1) < 2);
        -[BWVISProcessorControllerConfiguration setSphereCorrectionEnabled:](v28->_processorControllerConfiguration, "setSphereCorrectionEnabled:", a11 == 2);
        *(float *)&v61 = a26;
        -[BWVISProcessorControllerConfiguration setMinDistanceForBravoParallaxShift:](v28->_processorControllerConfiguration, "setMinDistanceForBravoParallaxShift:", v61);
        -[BWVISProcessorControllerConfiguration setIspProcessingSession:](v28->_processorControllerConfiguration, "setIspProcessingSession:", v77);
        -[BWVISProcessorControllerConfiguration setMetalSubmissionAndCompletionQueuePriority:](v28->_processorControllerConfiguration, "setMetalSubmissionAndCompletionQueuePriority:", a10);
        if (objc_msgSend(a24, "count"))
          -[BWVISProcessorControllerConfiguration setDistortionCorrectionEnabledPortTypes:](v28->_processorControllerConfiguration, "setDistortionCorrectionEnabledPortTypes:", a24);
        if (objc_msgSend(a25, "count"))
          -[BWVISProcessorControllerConfiguration setDistortionCompensationEnabledPortTypes:](v28->_processorControllerConfiguration, "setDistortionCompensationEnabledPortTypes:", a25);
        if ((_DWORD)stereoMode == 2 || !a19)
        {
          if ((v43 | v79 ^ 1) != 1)
            goto LABEL_61;
          if ((((_DWORD)stereoMode != 3) & ~v76) == 0)
          {
            -[BWVISProcessorControllerConfiguration setLivePhotoCleanOutputRect:](v28->_processorControllerConfiguration, "setLivePhotoCleanOutputRect:", x, y, width, height);
            -[BWVISProcessorControllerConfiguration setBlurBorderPixels:](v28->_processorControllerConfiguration, "setBlurBorderPixels:", 1);
LABEL_61:
            -[BWVISProcessorControllerConfiguration setAttachStabilizedOutputCameraTrajectory:](v28->_processorControllerConfiguration, "setAttachStabilizedOutputCameraTrajectory:", a28);
            if (a13)
            {
              v62 = v28->_visExecutionMode;
              if ((v62 & 0xFFFFFFFE) == 2)
              {
LABEL_65:
                if (v62 == 3)
                {
                  v63 = 1;
                }
                else
                {
                  -[BWVISProcessorControllerConfiguration setAttachStabilizedTrajectoryHomography:](v28->_processorControllerConfiguration, "setAttachStabilizedTrajectoryHomography:", 1);
                  v63 = v28->_visExecutionMode > 2u;
                }
                if ((v76 & v63 & 1) == 0)
                  -[BWVISProcessorControllerConfiguration setAttachEstimatedMotionVector:](v28->_processorControllerConfiguration, "setAttachEstimatedMotionVector:", 1);
                if (v28->_onlyGeneratingTransforms)
                  -[BWVISProcessorControllerConfiguration setOnlyGenerateTransformsParameters:](v28->_processorControllerConfiguration, "setOnlyGenerateTransformsParameters:", 1);
                -[BWVISProcessorControllerConfiguration setEnableRollingShutterCorrectionOnly:](v28->_processorControllerConfiguration, "setEnableRollingShutterCorrectionOnly:", v28->_visExecutionMode == 5);
                v65 = (_DWORD)stereoMode == 4 && v28->_visExecutionMode == 5;
                v28->_overrideFinalCropRect = v65;
                -[BWVISProcessorControllerConfiguration setDisableTransformLimitsForPredeterminedTrajectory:](v28->_processorControllerConfiguration, "setDisableTransformLimitsForPredeterminedTrajectory:");
                if ((stereoMode - 1) <= 3)
                {
                  -[BWVISProcessorControllerConfiguration setUseCameraGeometry:](v28->_processorControllerConfiguration, "setUseCameraGeometry:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[FigCaptureCameraParameters videoStabilizationParameters](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "videoStabilizationParameters"), "objectForKeyedSubscript:", CFSTR("UseCameraGeometry")), "BOOLValue"));
                  processorControllerConfiguration = v28->_processorControllerConfiguration;
                  v67 = v28->_stereoMode;
                  v68 = -[BWVISProcessorControllerConfiguration useCameraGeometry](processorControllerConfiguration, "useCameraGeometry");
                  if (v67)
                    v69 = 1;
                  else
                    v69 = v68;
                  -[BWVISProcessorControllerConfiguration setUseCameraGeometry:](processorControllerConfiguration, "setUseCameraGeometry:", v69);
                }
                -[BWVISProcessorControllerConfiguration setCameraInfoByPortType:](v28->_processorControllerConfiguration, "setCameraInfoByPortType:", a22);
                -[BWVISProcessorControllerConfiguration setVideoStabilizationStrength:](v28->_processorControllerConfiguration, "setVideoStabilizationStrength:", a16);
                v28->_zoomSmoothingEnabled = a17;
                -[BWVISProcessorControllerConfiguration setZoomSmoothingEnabled:](v28->_processorControllerConfiguration, "setZoomSmoothingEnabled:", a17);
                -[BWVISProcessorControllerConfiguration setApplyFrameCropOffset:](v28->_processorControllerConfiguration, "setApplyFrameCropOffset:", a18);
                v52 = v78;
                goto LABEL_84;
              }
              -[BWVISProcessorControllerConfiguration setAttachStabilizedOutputCameraTrajectory:](v28->_processorControllerConfiguration, "setAttachStabilizedOutputCameraTrajectory:", 1);
            }
            v62 = v28->_visExecutionMode;
            goto LABEL_65;
          }
        }
      }
    }
LABEL_89:

    return 0;
  }
  v28->_cinematicLookAheadFrameCount = v30;
  v28->_offlineCameraInfoByPortType = (NSDictionary *)a22;
  v52 = 1;
LABEL_84:
  v70 = v28->_onlyGeneratingTransforms || v28->_visExecutionMode == 4;
  -[BWVISNode _updateSupportedPixelFormats]((id *)&v28->super.super.isa);
  v71 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v28);
  v72 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWNodeInput setFormatRequirements:](v71, "setFormatRequirements:", v72);
  -[BWNodeInput setDelayedBufferCount:](v71, "setDelayedBufferCount:", v52);
  -[BWNodeInput setPassthroughMode:](v71, "setPassthroughMode:", v70);

  -[BWNode addInput:](v28, "addInput:", v71);
  -[BWVISNode _updateInputRequirements]((uint64_t)v28);
  v73 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v28);
  v74 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWNodeOutput setFormatRequirements:](v73, "setFormatRequirements:", v74);
  -[BWNodeOutput setPassthroughMode:](v73, "setPassthroughMode:", v70);
  -[BWNodeOutput setOwningNodeRetainedBufferCount:](v73, "setOwningNodeRetainedBufferCount:", 1);

  -[BWNode addOutput:](v28, "addOutput:", v73);
  -[BWVISNode _updateOutputRequirements]((uint64_t)v28);

  v28->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("VIS"), 10);
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[0].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[0].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[1].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[1].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[2].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[2].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[3].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[3].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[4].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[4].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[5].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[5].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[6].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[6].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[7].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[7].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[8].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[8].framePTS.timescale = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[9].entries = 0u;
  *(_OWORD *)&v28->_frameMotionTensorsRingBuffer[9].framePTS.timescale = 0u;
  v28->_frameMotionTensorsRingBuffeLock._os_unfair_lock_opaque = 0;
  return v28;
}

- (void)setMaxLossyCompressionLevel:(int)a3
{
  if (self->_maxLossyCompressionLevel != a3)
  {
    self->_maxLossyCompressionLevel = a3;
    -[BWVISNode _updateSupportedPixelFormats]((id *)&self->super.super.isa);
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (uint64_t)_updateInputRequirements
{
  uint64_t v1;
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BWNodeInputMediaConfiguration *v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  BWNodeInputMediaConfiguration *v14;
  BWNodeInputMediaConfiguration *v15;
  BWNodeInputMediaConfiguration *v16;
  BWNodeInputMediaConfiguration *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "formatRequirements"), "setSupportedPixelFormats:", *(_QWORD *)(result + 128));
    v22 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "primaryMediaConfiguration"), "delayedBufferCount");
    v2 = BWSmartStyleLearningMaxFrameRate();
    v3 = *(double *)(v1 + 232);
    v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 0);
    v20 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(0, 1);
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      v21 = vcvtpd_s64_f64(v2 / v3 * (double)(int)v22);
      v18 = v1;
      do
      {
        v8 = 0;
        v19 = v6;
        do
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
          if ((!*(_BYTE *)(v1 + 688)
             || (objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v8)) & 1) == 0)
            && (!*(_BYTE *)(v1 + 689) || !objc_msgSend(v20, "containsObject:", v9)))
          {
            goto LABEL_21;
          }
          v10 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v10, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v10, "setPassthroughMode:", 0);
          if (objc_msgSend((id)BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly(), "containsObject:", v9))v11 = v21;
          else
            v11 = v22;
          -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v10, "setDelayedBufferCount:", v11);
          if (objc_msgSend(v9, "isEqual:", 0x1E495B358))
          {
            v12 = -[BWNodeInputMediaConfiguration delayedBufferCount](v10, "delayedBufferCount");
            if (v12 <= objc_msgSend(*(id *)(v1 + 104), "cinematicLookAheadFrameCount") + 1)
              v13 = objc_msgSend(*(id *)(v1 + 104), "cinematicLookAheadFrameCount") + 1;
            else
              v13 = -[BWNodeInputMediaConfiguration delayedBufferCount](v10, "delayedBufferCount");
            -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v10, "setDelayedBufferCount:", v13);
            v1 = v18;
            v6 = v19;
          }
          if (objc_msgSend(v9, "isEqual:", 0x1E494FBD8) && !*(_BYTE *)(v1 + 172))
LABEL_21:
            v10 = 0;
          objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", v10, v9);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v6);
    }
    if (*(_BYTE *)(v1 + 704))
    {
      v14 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v14, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v14, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v14, "setDelayedBufferCount:", v22);
      objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", v14, 0x1E495AF78);
      v15 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v15, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v15, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v15, "setDelayedBufferCount:", v22);
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E495AF78);
      v15 = 0;
    }
    objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", v15, 0x1E495AFB8);
    if (*(_BYTE *)(v1 + 173) && *(_BYTE *)(v1 + 175))
    {
      v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v16, "setDelayedBufferCount:", v22);
      objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", v16, 0x1E494FB78);
      v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
      -[BWNodeInputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 0);
      -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v17, "setDelayedBufferCount:", v22);
    }
    else
    {
      objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", 0, 0x1E494FB78);
      v17 = 0;
    }
    return objc_msgSend(*(id *)(v1 + 8), "setMediaConfiguration:forAttachedMediaKey:", v17, 0x1E494FB98);
  }
  return result;
}

- (id)_updateSupportedPixelFormats
{
  id *v1;
  BOOL v2;
  void *v3;
  BOOL v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id *v10;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;
  BOOL v14;

  if (result)
  {
    v1 = result;
    if ((*((_DWORD *)result + 25) - 3) > 1)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      objc_msgSend(v3, "addObjectsFromArray:", &unk_1E4A01148);
      if (*((_DWORD *)v1 + 25) == 2)
        objc_msgSend(v3, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, *((_DWORD *)v1 + 36)));

      v1[16] = (id)objc_msgSend(v3, "copy");
      result = (id *)objc_msgSend(v3, "copy");
      goto LABEL_13;
    }
    if (FigCapturePlatformSupportsUniversalCompression())
      v2 = 1;
    else
      v2 = FigCapturePlatformSupportsHTPC16x8Compression() != 0;
    v4 = FigCapturePlatformSupportsUniversalLossyCompression() != 0;
    v5 = *((_DWORD *)v1 + 25) == 4;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__BWVISNode__updateSupportedPixelFormats__block_invoke;
    v11[3] = &unk_1E4923F20;
    v12 = v2;
    v13 = v5;
    v14 = v4;
    v11[4] = v1;
    v6 = objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v11);
    v7 = objc_msgSend((id)objc_msgSend(v1[13], "ispProcessingSession"), "getProperty:error:", CFSTR("InputPixelBufferAttributes"), 0);
    v8 = (_QWORD *)MEMORY[0x1E0CA9040];
    if (v7)
    {
      v9 = (void *)v7;

      v1[16] = (id)objc_msgSend((id)visn_pixelFormatsArrayFromPixelFormatTypeValue(objc_msgSend(v9, "objectForKeyedSubscript:", *v8)), "filteredArrayUsingPredicate:", v6);
    }
    result = (id *)objc_msgSend((id)objc_msgSend(v1[13], "ispProcessingSession"), "getProperty:error:", CFSTR("OutputPixelBufferAttributes"), 0);
    if (result)
    {
      v10 = result;

      result = (id *)(id)objc_msgSend((id)visn_pixelFormatsArrayFromPixelFormatTypeValue(objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PrimaryScaler")), "objectForKeyedSubscript:", *v8)), "filteredArrayUsingPredicate:", v6);
LABEL_13:
      v1[17] = result;
    }
  }
  return result;
}

- (void)setIrisStillImageMovieMetadataCache:(id)a3
{

  self->_irisStillImageMovieMetadataCache = (BWIrisStillImageMovieMetadataCache *)a3;
}

- (void)setGeneratesDroppedSampleMarkerBuffers:(BOOL)a3
{
  self->_generatesDroppedSampleMarkerBuffers = a3;
}

- (int)cinematicLookAheadFrameCount
{
  return self->_cinematicLookAheadFrameCount;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  FourCharCode MediaSubType;
  int CompressionType;
  int v8;
  BWStats *ioSurfaceCompressionRatioStats;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWVISNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v10, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
  MediaSubType = CMFormatDescriptionGetMediaSubType(-[BWFormat formatDescription](-[BWNodeOutput format](self->super._output, "format"), "formatDescription"));
  CompressionType = FigCapturePixelFormatGetCompressionType(MediaSubType);
  if (CompressionType)
  {
    v8 = CompressionType;
    ioSurfaceCompressionRatioStats = self->_ioSurfaceCompressionRatioStats;
    if (ioSurfaceCompressionRatioStats)

    self->_ioSurfaceCompressionRatioStats = objc_alloc_init(BWStats);
    self->_totalCompressedDataSize = 0;
    self->_totalUncompressedDataSize = 0;
    self->_pixelBufferCompressionType = v8;
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  BWVISNode *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BWVISNode *v23;
  int v24;
  void *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  id v43;
  id v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  int v50;
  int v51;
  int v52;
  int v53;
  objc_super v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _BYTE v68[128];
  __CFString *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v2 = self;
  v72 = *MEMORY[0x1E0C80C00];
  if (self->_smartStyleRenderingEnabled)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:");
    v4 = v3;
    if (v2->_smartStyleReversibilityEnabled)
    {
      objc_msgSend(v3, "addObject:", 0x1E495B218);
      objc_msgSend(v4, "addObject:", CFSTR("HumanSkinsMask"));
      objc_msgSend(v4, "addObject:", CFSTR("HumanFullBodiesMask"));
      objc_msgSend(v4, "addObject:", 0x1E495B378);
      objc_msgSend(v4, "addObject:", 0x1E495B3F8);
      objc_msgSend(v4, "addObject:", 0x1E495B418);
    }
    v52 = objc_msgSend(-[BWNodeInput mediaConfigurationForAttachedMediaKey:](v2->super._input, "mediaConfigurationForAttachedMediaKey:", CFSTR("PrimaryFormat")), "delayedBufferCount");
    v5 = 16;
    v6 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v2->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("PrimaryFormat"));
    v7 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](v2->super._output, "mediaConfigurationForAttachedMediaKey:", CFSTR("PrimaryFormat"));
    v8 = objc_msgSend(v6, "resolvedRetainedBufferCount");
    if (v8 <= (int)objc_msgSend(v7, "owningNodeRetainedBufferCount"))
      v9 = objc_msgSend(v7, "owningNodeRetainedBufferCount");
    else
      v9 = objc_msgSend(v6, "resolvedRetainedBufferCount");
    v53 = v9;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v10 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v64 != v13)
            objc_enumerationMutation(v4);
          v15 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i);
          v16 = (void *)objc_msgSend(*(id *)((char *)&v2->super.super.isa + v5), "mediaPropertiesForAttachedMediaKey:", v15);
          v17 = objc_msgSend(*(id *)((char *)&v2->super.super.isa + v5), "mediaConfigurationForAttachedMediaKey:", v15);
          if (v16)
            v18 = v17 == 0;
          else
            v18 = 1;
          if (!v18)
          {
            v19 = (void *)v17;
            v20 = v5;
            v21 = v11;
            v22 = v13;
            v23 = v2;
            v24 = v12;
            v25 = v4;
            v26 = objc_msgSend(v16, "resolvedRetainedBufferCount");
            if (v26 <= (int)objc_msgSend(v19, "owningNodeRetainedBufferCount"))
              v27 = objc_msgSend(v19, "owningNodeRetainedBufferCount");
            else
              v27 = objc_msgSend(v16, "resolvedRetainedBufferCount");
            v28 = v27;
            v29 = v53;
            v4 = v25;
            if (v27 < v53)
            {
              objc_msgSend(v19, "setOwningNodeRetainedBufferCount:");
              v29 = v53;
            }
            if (v28 <= v29)
              v30 = v29;
            else
              v30 = v28;
            if (v24 <= v30)
              v12 = v30;
            else
              v12 = v24;
            v2 = v23;
            v13 = v22;
            v11 = v21;
            v5 = v20;
          }
        }
        v11 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v11);
    }
    else
    {
      v12 = 0;
    }
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v69 = CFSTR("SmartStyleStreamingLearnedCoefficients");
    v31 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v60;
      if (v52 <= 3)
        v35 = 3;
      else
        v35 = v52;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v60 != v34)
            objc_enumerationMutation(v31);
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v2->_intermediatePixelBufferPools, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j)), "setCapacity:", v35);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v33);
    }
    if (v2->_smartStyleReversibilityEnabled)
    {
      v57 = 0u;
      v58 = 0u;
      v55 = 0u;
      v56 = 0u;
      v67[0] = 0x1E495B3B8;
      v67[1] = 0x1E495B3D8;
      v37 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 2);
      v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
      if (v38)
      {
        v39 = v38;
        v40 = *(_QWORD *)v56;
        v41 = v12;
        do
        {
          for (k = 0; k != v39; ++k)
          {
            if (*(_QWORD *)v56 != v40)
              objc_enumerationMutation(v37);
            objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](v2->_intermediatePixelBufferPools, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * k)), "setCapacity:", v41);
          }
          v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        }
        while (v39);
      }
    }
  }
  if (v2->_lowResImageUsedByVideoEncoderEnabled && v2->_stabilizationType == 4)
  {
    v43 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v2->super._output, "mediaPropertiesForAttachedMediaKey:", CFSTR("PrimaryFormat"));
    v44 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](v2->super._output, "mediaConfigurationForAttachedMediaKey:", CFSTR("PrimaryFormat"));
    v45 = objc_msgSend(v43, "resolvedRetainedBufferCount");
    v46 = v45 <= (int)objc_msgSend(v44, "owningNodeRetainedBufferCount")
        ? objc_msgSend(v44, "owningNodeRetainedBufferCount")
        : objc_msgSend(v43, "resolvedRetainedBufferCount");
    v47 = v46;
    v48 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](v2->super._output, "mediaPropertiesForAttachedMediaKey:", 0x1E495B458);
    v49 = -[BWNodeOutput mediaConfigurationForAttachedMediaKey:](v2->super._output, "mediaConfigurationForAttachedMediaKey:", 0x1E495B458);
    v50 = objc_msgSend(v48, "resolvedRetainedBufferCount");
    v51 = v50 <= (int)objc_msgSend(v49, "owningNodeRetainedBufferCount")
        ? objc_msgSend(v49, "owningNodeRetainedBufferCount")
        : objc_msgSend(v48, "resolvedRetainedBufferCount");
    if (v51 < (int)v47)
      objc_msgSend(v49, "setOwningNodeRetainedBufferCount:", v47);
  }
  v54.receiver = v2;
  v54.super_class = (Class)BWVISNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v54, sel_prepareForCurrentConfigurationToBecomeLive);
  if (v2->_stabilizationType == 2 && v2->_outputColorSpaceProperties == 6)
    -[BWVISProcessorControllerConfiguration setP3ToBT2020ConversionEnabled:](v2->_processorControllerConfiguration, "setP3ToBT2020ConversionEnabled:", 1);
  if (!v2->_processorController && v2->_visExecutionMode != 4)
  {
    if (-[BWVISNode _setupVISProcessorController]((uint64_t)v2))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)setEmitSampleBufferSemaphore:(id)a3
{
  OS_dispatch_semaphore *emitSampleBufferSemaphore;

  emitSampleBufferSemaphore = self->_emitSampleBufferSemaphore;
  if (emitSampleBufferSemaphore != a3)
  {

    self->_emitSampleBufferSemaphore = (OS_dispatch_semaphore *)a3;
  }
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  double v3;
  objc_super v4;

  v3 = -[BWVISNode _releaseResources]((uint64_t)self);
  v4.receiver = self;
  v4.super_class = (Class)BWVISNode;
  -[BWNode dealloc](&v4, sel_dealloc, v3);
}

- (double)_releaseResources
{
  const void *v2;
  uint64_t v3;
  double result;

  if (a1)
  {

    *(_QWORD *)(a1 + 112) = 0;
    *(_QWORD *)(a1 + 104) = 0;

    *(_QWORD *)(a1 + 128) = 0;
    *(_QWORD *)(a1 + 136) = 0;

    *(_QWORD *)(a1 + 208) = 0;
    *(_QWORD *)(a1 + 184) = 0;

    *(_QWORD *)(a1 + 200) = 0;
    *(_QWORD *)(a1 + 240) = 0;
    if (*(_QWORD *)(a1 + 256))
      objc_msgSend(*(id *)(a1 + 264), "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unprocessed still frame settings ID %@"), *(_QWORD *)(a1 + 256)));

    *(_QWORD *)(a1 + 248) = 0;
    *(_QWORD *)(a1 + 256) = 0;

    *(_QWORD *)(a1 + 264) = 0;
    *(_QWORD *)(a1 + 608) = 0;

    *(_QWORD *)(a1 + 680) = 0;
    v2 = *(const void **)(a1 + 696);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 696) = 0;
    }

    *(_QWORD *)(a1 + 712) = 0;
    *(_QWORD *)(a1 + 720) = 0;

    v3 = 0;
    *(_QWORD *)(a1 + 728) = 0;
    do
    {

      *(_QWORD *)(a1 + 272 + v3) = 0;
      v3 += 32;
    }
    while (v3 != 320);
    result = 0.0;
    *(_OWORD *)(a1 + 560) = 0u;
    *(_OWORD *)(a1 + 576) = 0u;
    *(_OWORD *)(a1 + 528) = 0u;
    *(_OWORD *)(a1 + 544) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
  }
  return result;
}

- (id)nodeSubType
{
  return CFSTR("VideoStabilizer");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  double v5;
  BWStats *ioSurfaceCompressionRatioStats;
  double v7;
  objc_super v8;

  v5 = -[BWVISNode _flushBuffers]((uint64_t)self);
  ioSurfaceCompressionRatioStats = self->_ioSurfaceCompressionRatioStats;
  if (ioSurfaceCompressionRatioStats)
  {
    if (-[BWStats numberOfSamples](ioSurfaceCompressionRatioStats, "numberOfSamples", v5))
      -[BWVISNode _reportIOSurfaceCompressionCoreAnalyticsData]((uint64_t)self);

    self->_ioSurfaceCompressionRatioStats = 0;
  }
  v7 = -[BWVISNode _releaseResources]((uint64_t)self);
  v8.receiver = self;
  v8.super_class = (Class)BWVISNode;
  -[BWNode didReachEndOfDataForInput:](&v8, sel_didReachEndOfDataForInput_, a3, v7);
}

- (double)_flushBuffers
{
  uint64_t i;
  double result;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 112))
    {
      *(_BYTE *)(a1 + 120) = 1;
      objc_msgSend(*(id *)(a1 + 112), "finishPendingProcessing");
      *(_BYTE *)(a1 + 120) = 0;
    }
    objc_msgSend(*(id *)(a1 + 264), "resetCurrentLoggingCounter");
    for (i = 0; i != 320; i += 32)

    result = 0.0;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(_OWORD *)(a1 + 336) = 0u;
    *(_OWORD *)(a1 + 352) = 0u;
    *(_OWORD *)(a1 + 368) = 0u;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(_OWORD *)(a1 + 416) = 0u;
    *(_OWORD *)(a1 + 432) = 0u;
    *(_OWORD *)(a1 + 448) = 0u;
    *(_OWORD *)(a1 + 464) = 0u;
    *(_OWORD *)(a1 + 480) = 0u;
    *(_OWORD *)(a1 + 496) = 0u;
    *(_OWORD *)(a1 + 512) = 0u;
    *(_OWORD *)(a1 + 528) = 0u;
    *(_OWORD *)(a1 + 544) = 0u;
    *(_OWORD *)(a1 + 560) = 0u;
    *(_OWORD *)(a1 + 576) = 0u;
  }
  return result;
}

- (uint64_t)_reportIOSurfaceCompressionCoreAnalyticsData
{
  uint64_t v1;
  BWIOSurfaceCompressionStatisticsAnalyticsPayload *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(BWIOSurfaceCompressionStatisticsAnalyticsPayload);
    objc_msgSend(*(id *)(v1 + 608), "average");
    *(float *)&v3 = v3;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setAverageRatio:](v2, "setAverageRatio:", v3);
    objc_msgSend(*(id *)(v1 + 608), "min");
    *(float *)&v4 = v4;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setMinRatio:](v2, "setMinRatio:", v4);
    objc_msgSend(*(id *)(v1 + 608), "max");
    *(float *)&v5 = v5;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setMaxRatio:](v2, "setMaxRatio:", v5);
    objc_msgSend(*(id *)(v1 + 608), "standardDeviation");
    *(float *)&v6 = v6;
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setStandardDeviation:](v2, "setStandardDeviation:", v6);
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNumberOfSamples:](v2, "setNumberOfSamples:", objc_msgSend(*(id *)(v1 + 608), "numberOfSamples"));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setCompressionType:](v2, "setCompressionType:", *(unsigned int *)(v1 + 616));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setBufferHeight:](v2, "setBufferHeight:", *(unsigned int *)(v1 + 152));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setTotalCompressedSize:](v2, "setTotalCompressedSize:", *(_QWORD *)(v1 + 624));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setTotalUncompressedSize:](v2, "setTotalUncompressedSize:", *(_QWORD *)(v1 + 632));
    -[BWIOSurfaceCompressionStatisticsAnalyticsPayload setNodeType:](v2, "setNodeType:", 2);
    return -[BWCoreAnalyticsReporter sendEvent:](+[BWCoreAnalyticsReporter sharedInstance](BWCoreAnalyticsReporter, "sharedInstance"), "sendEvent:", v2);
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  __CFDictionary *v7;
  _DWORD *v8;
  void *v9;
  CFTypeRef v10;
  CFTypeRef v11;
  double v12;
  CFTypeID v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *Value;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __CFDictionary *v22;
  const void *AttachedMedia;
  const void *v24;
  CFTypeRef v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  int v38;
  CMTime time;
  CMTime v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  memset(&v40, 0, sizeof(v40));
  CMSampleBufferGetPresentationTimeStamp(&v40, a3);
  time = v40;
  CMTimeGetSeconds(&time);
  v7 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v38 = 0;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0])
  {
    FigCFDictionaryGetIntIfPresent();
    if (*v8 == 1)
    {
      -[BWVISNode pipelineTraceID](self, "pipelineTraceID");
      kdebug_trace();
    }
  }
  -[BWNode name](self, "name");
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    v9 = (void *)CMGetAttachment(a3, CFSTR("FileWriterAction"), 0);
    v10 = CMGetAttachment(a3, CFSTR("AttachedMediaSwapPlaceholderSampleBuffer"), 0);
    v11 = CMGetAttachment(a3, CFSTR("RecordingSettings"), 0);
    if (v9 && (v13 = CFGetTypeID(v9), v13 == CFStringGetTypeID()))
    {
      if (!CFEqual(v9, CFSTR("Stop"))
        && !CFEqual(v9, CFSTR("Pause"))
        && !CFEqual(v9, CFSTR("Flush"))
        && !CFEqual(v9, CFSTR("Terminate"))
        && !CFEqual(v9, CFSTR("StreamForcedOff"))
        && v10 != (CFTypeRef)*MEMORY[0x1E0C9AE50])
      {
        v14 = 0;
        goto LABEL_20;
      }
    }
    else if (v10 != (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      v14 = 0;
      if (v9)
        goto LABEL_20;
      goto LABEL_23;
    }
    v14 = 1;
    if (v9)
    {
LABEL_20:
      if (CFEqual(v9, CFSTR("Start")))
        v9 = (void *)v11;
      else
        v9 = 0;
    }
LABEL_23:
    if (v14)
      v12 = -[BWVISNode _flushBuffers]((uint64_t)self);
    if (self->_usingExtendedCVISLivePhotoStabilization && v9)
    {
      v15 = objc_msgSend(v9, "isIrisMovieRecording", v12);
      self->_stabilizeForLongPressVideo = v15;
      -[BWVISProcessorController setLongPressModeEnabled:](self->_processorController, "setLongPressModeEnabled:", v15);
    }
    if (self->_flipHorizontalExcludingIris && v9)
    {
      if (objc_msgSend(v9, "isIrisRecording", v12)
        && !objc_msgSend(v9, "isIrisMovieRecording"))
      {
        v16 = 0;
      }
      else
      {
        v16 = objc_msgSend(v9, "videoMirrored");
      }
      -[BWVISProcessorController setFlipHorizontalOrientationEnabled:](self->_processorController, "setFlipHorizontalOrientationEnabled:", v16);
      self->_liveFlipHorizontal = v16;
    }
    if (self->_personSegmentationRenderingEnabled && v9)
    {

      self->_foregroundColorCube = (NSData *)(id)objc_msgSend(v9, "personSegmentationForegroundColorCube");
      self->_backgroundColorCube = (NSData *)(id)objc_msgSend(v9, "personSegmentationBackgroundColorCube");
    }
    if (self->_videoSTFEnabled && v9)
      objc_msgSend(v9, "setVideoSTFEnabled:", 1, v12);
    if (self->_smartStyleReversibilityEnabled && v9)
    {
      self->_stabilizeForSmartStyleReversibility = objc_msgSend(v9, "smartStyleReversibilitySupported", v12);
      -[BWVISProcessorController setSmartStyleReversibilityProcessingEnabled:](self->_processorController, "setSmartStyleReversibilityProcessingEnabled:", objc_msgSend(v9, "smartStyleReversibilitySupported"));
    }
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3, v12);
    if ((v40.flags & 0x1D) == 1)
      self->_lastEmittedPTS = ($95D729B680665BEAEFA1D6FCA8238556)v40;
    goto LABEL_72;
  }
  if (self->_visExecutionMode == 4)
  {
    -[BWVISNode _tallyAndEmitSampleBuffer:]((uint64_t)self, a3);
    goto LABEL_72;
  }
  if (!self->_processorController)
  {
    fig_log_get_emitter();
    v33 = v4;
    LODWORD(v32) = 0;
    goto LABEL_76;
  }
  -[BWVISNode _handleIrisKeyFrameCachingForSampleBuffer:]((uint64_t)self, a3);
  -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, v7, a3, 0);
  if (self->_visExecutionMode == 1)
  {
    Value = (void *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0D082D8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v18 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(Value);
          -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, *(__CFDictionary **)(*((_QWORD *)&v34 + 1) + 8 * i), a3, 0);
        }
        v19 = objc_msgSend(Value, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v19);
    }
    v22 = (__CFDictionary *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0D082D0]);
    if (v22)
      -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:]((uint64_t)self, v22, a3, 0);
  }
  if (self->_stabilizeDepthAttachments)
  {
    AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
    if (AttachedMedia)
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08850], AttachedMedia, 0);
  }
  if (self->_personSegmentationRenderingEnabled)
  {
    if (!self->_foregroundColorCube || !self->_backgroundColorCube)
      goto LABEL_65;
    v24 = (const void *)BWSampleBufferGetAttachedMedia(a3, 0x1E495AF78);
    if (v24)
    {
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05DA8], v24, 0);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05DA0], self->_foregroundColorCube, 0);
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D98], self->_backgroundColorCube, 0);
LABEL_65:
      BWSampleBufferRemoveAttachedMedia(a3, 0x1E495AF78);
      BWSampleBufferRemoveAttachedMedia(a3, 0x1E495AFB8);
      goto LABEL_66;
    }
    fig_log_get_emitter();
    v33 = v4;
    LODWORD(v32) = 0;
LABEL_76:
    FigDebugAssert3();
    v30 = 4294954516;
LABEL_78:
    -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v30, CFSTR("when rendering"), v32, v33);
    time = v40;
    v31 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EFB8, &time);
    -[BWVISNode _tallyAndEmitDroppedSample:]((uint64_t)self, v31);

    goto LABEL_72;
  }
LABEL_66:
  v25 = CMGetAttachment(a3, CFSTR("SubjectRelightingResult"), 0);
  if (v25)
  {
    v26 = (void *)v25;
    mach_absolute_time();
    objc_msgSend(v26, "waitForResult");
    if (objc_msgSend(v26, "relightingRequired"))
    {
      v27 = (const __CFString *)*MEMORY[0x1E0D05DB0];
      v28 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v26, "curveParameter");
      CMSetAttachment(a3, v27, (CFTypeRef)objc_msgSend(v28, "numberWithFloat:"), 1u);
    }
  }
  v29 = -[BWVISProcessorController enqueueBufferForProcessing:](self->_processorController, "enqueueBufferForProcessing:", a3);
  if ((_DWORD)v29)
  {
    v30 = v29;
    fig_log_get_emitter();
    v33 = v4;
    LODWORD(v32) = v30;
    FigDebugAssert3();
    goto LABEL_78;
  }
  if (self->_smartStyleRenderingEnabled)
    CMSetAttachment(a3, CFSTR("FiltersApplied"), MEMORY[0x1E0C9AAB0], 1u);
LABEL_72:
  if (*v8 == 1)
  {
    -[BWVISNode pipelineTraceID](self, "pipelineTraceID");
    kdebug_trace();
  }
}

- (void)_tallyAndEmitSampleBuffer:(uint64_t)a1
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  opaqueCMSampleBuffer *v11;
  opaqueCMSampleBuffer *v12;
  void *v13;
  CVImageBufferRef ImageBuffer;
  CMTime v15;

  if (a1)
  {
    v4 = CMGetAttachment(target, CFSTR("SampleDataToBeDropped"), 0) != (CFTypeRef)*MEMORY[0x1E0C9AE50]
      || *(_BYTE *)(a1 + 196) == 0;
    v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v6 = v5;
    if (*(_DWORD *)(a1 + 180) == 4)
    {
      if (v5)
        -[BWVISNode _collectMetadataForReprocessingFrom:to:](a1, target, v5);
    }
    else if (*(_QWORD *)(a1 + 608))
    {
      -[BWVISNode _tallyCompressedIOSurfaceStatsForSBuf:](a1, (opaqueCMSampleBuffer *)target);
    }
    if (((*(_DWORD *)(a1 + 180) != 4) & ~v4) != 0)
    {
      if (CMGetAttachment(target, CFSTR("SampleDataToBeDroppedEmitSampleBufferSemaphores"), 0))
      {
        v11 = +[BWNodeInput newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:](BWNodeInput, "newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:", target);
        if (v11)
        {
          v12 = v11;
          objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", v11);
          CMSampleBufferGetPresentationTimeStamp(&v15, v12);
          *(CMTime *)(a1 + 640) = v15;
          CFRelease(v12);
        }
      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 240))
      {
        v7 = (void *)objc_msgSend(*(id *)(a1 + 16), "videoFormat");
        v8 = objc_msgSend(v7, "width");
        v9 = objc_msgSend(v7, "height");
        if (*(_BYTE *)(a1 + 161) || *(_DWORD *)(a1 + 180) == 4)
        {
          v8 = *(_DWORD *)(a1 + 148);
          v10 = *(unsigned int *)(a1 + 152);
        }
        else
        {
          v10 = v9;
        }
        objc_msgSend(*(id *)(a1 + 240), "cacheStillImageTransformDataFromMetadata:transformReferenceDimensions:", v6, v8 | (unint64_t)(v10 << 32));
      }
      if (*(_BYTE *)(a1 + 162))
      {
        if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D059E8]), "BOOLValue") & 1) == 0)
          BWDetectedFacesConvertSampleBufferFacesFromSensorToBufferCoordinateSpace(target);
        if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A08]), "BOOLValue") & 1) == 0)
          BWDetectedObjectsConvertSampleBufferDetectedObjectsFromSensorToBufferCoordinateSpace(target);
        -[BWVISNode _harvestMetadataFromSampleBuffer:]((os_unfair_lock_s *)a1, target);
        -[BWVISNode _stabilizeMetadataForSampleBuffer:](a1, target);
        v13 = (void *)-[BWVISNode _cinematographyFrameForSampleBuffer:](a1, target);
        -[BWVISNode _attachHarvestedStabilizationMetadataToCinematographyFrame:]((os_unfair_lock_s *)a1, v13);
        -[BWVISNode _stabilizeCinematographyMetadataInCinematographyFrame:](a1, v13);
      }
      if (*(_BYTE *)(a1 + 164))
      {
        ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
        if (ImageBuffer)
          CMSetAttachment(ImageBuffer, CFSTR("MirroredHorizontal"), MEMORY[0x1E0C9AAB0], 1u);
      }
      objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", target);
      CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)target);
      *(CMTime *)(a1 + 640) = v15;
    }
    ++*(_DWORD *)(a1 + 220);
  }
}

- (void)_handleIrisKeyFrameCachingForSampleBuffer:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  if (a1)
  {
    if (CMGetAttachment(target, CFSTR("SampleDataToBeDropped"), 0) == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      v6 = *MEMORY[0x1E0D088C0];
      v7 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D088C0]);
      v8 = *MEMORY[0x1E0D05A00];
      v9 = objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D05A00]);
      if (v7 | v9)
      {
        v10 = (void *)v9;
        v11 = *(void **)(a1 + 248);
        if (v11 || *(_QWORD *)(a1 + 256))
        {

          *(_QWORD *)(a1 + 248) = 0;
          *(_QWORD *)(a1 + 256) = 0;
        }
        *(_QWORD *)(a1 + 248) = (id)v7;
        *(_QWORD *)(a1 + 256) = v10;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v8);
        visn_setSynchronizedSlaveFrameLivePhotoKeyFrameMetadata(0, 0, target);
      }
    }
    else if (*(_QWORD *)(a1 + 248) || *(_QWORD *)(a1 + 256))
    {
      v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 248), *MEMORY[0x1E0D088C0]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 256), *MEMORY[0x1E0D05A00]);
      visn_setSynchronizedSlaveFrameLivePhotoKeyFrameMetadata(*(_QWORD *)(a1 + 248), *(_QWORD *)(a1 + 256), target);

      *(_QWORD *)(a1 + 248) = 0;
      *(_QWORD *)(a1 + 256) = 0;
    }
  }
}

- (void)_addVISDigitalZoomToMetadata:(const void *)a3 sampleBuffer:(int)a4 forReprocessing:
{
  void *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  int v20;
  double v21;
  double v22;
  double v23;
  float v24;
  BOOL v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  CFDictionaryRef DictionaryRepresentation;
  CFTypeRef v30;
  double v31;
  double v32;
  __int128 v33;
  CGPoint v34;

  if (!a1)
    return;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
  v9 = objc_msgSend(v8, "width");
  v10 = objc_msgSend(v8, "height");
  v11 = (void *)objc_msgSend(*(id *)(a1 + 16), "videoFormat");
  v12 = objc_msgSend(v11, "width");
  v13 = objc_msgSend(v11, "height");
  v14 = v13;
  v31 = 0.0;
  v32 = 0.0;
  __asm { FMOV            V0.2D, #1.0 }
  v33 = _Q0;
  if (*(_BYTE *)(a1 + 161))
    _ZF = 0;
  else
    _ZF = a4 == 0;
  if (!_ZF && *(_DWORD *)(a1 + 148))
  {
    v20 = *(_DWORD *)(a1 + 152);
    v14 = v20 ? *(_DWORD *)(a1 + 152) : v13;
    if (v20)
      v12 = *(_DWORD *)(a1 + 148);
  }
  if (*(_BYTE *)(a1 + 737))
  {
    v33 = _Q0;
  }
  else
  {
    if (FigCFDictionaryGetCGRectIfPresent())
      v25 = 1;
    else
      v25 = a4 == 0;
    if (!v25 && CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0))
      FigCFDictionaryGetCGRectIfPresent();
    if (*(_BYTE *)(a1 + 177) && !*(_BYTE *)(a1 + 178))
    {
      v31 = FigCaptureMetadataUtilitiesScaleRect(0.0, 0.0, *(CGFloat *)&v33, *((CGFloat *)&v33 + 1), (float)(*(float *)(a1 + 192) + 1.0));
      v32 = v26;
      *(_QWORD *)&v33 = v27;
      *((_QWORD *)&v33 + 1) = v28;
      FigCFDictionarySetCGRect();
    }
  }
  v21 = *(double *)&v33 * (double)v9;
  v22 = *((double *)&v33 + 1) * (double)v10;
  v23 = ((double)v12 / v21 + (double)v14 / v22) * 0.5;
  v24 = v23;
  if (*(_DWORD *)(a1 + 740) == 2 && FigCFDictionaryGetFloatIfPresent())
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!a3)
      goto LABEL_32;
LABEL_18:
    if ((*(_DWORD *)(a1 + 100) - 3) <= 1 && v24 > 2.25)
    {
      *(float *)&v23 = v24 / 2.25;
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08880], (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23), 1u);
      if (a4)
        FigCFDictionarySetCGFloat();
    }
    goto LABEL_32;
  }
  if (a3)
    goto LABEL_18;
LABEL_32:
  FigCFDictionarySetCGFloat();
  v34.x = v31 - ((double)v9 - v21) * 0.5 / (double)v9;
  v34.y = v32 - ((double)v10 - v22) * 0.5 / (double)v10;
  DictionaryRepresentation = CGPointCreateDictionaryRepresentation(v34);
  CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E0D088B8], DictionaryRepresentation);
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if ((*(_BYTE *)(a1 + 736) || a4) && !CFDictionaryGetValue(a2, CFSTR("TotalZoomFactor")))
  {
    v30 = CMGetAttachment(a3, CFSTR("TotalZoomFactor"), 0);
    if (v30)
      CFDictionarySetValue(a2, (const void *)*MEMORY[0x1E0D088D0], v30);
  }
}

- (double)_tallyAndEmitDroppedSample:(uint64_t)a1
{
  double result;
  __int128 v5;
  uint64_t v6;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 16), "emitDroppedSample:", a2);
    if (a2)
    {
      objc_msgSend(a2, "pts");
    }
    else
    {
      v5 = 0uLL;
      v6 = 0;
    }
    result = *(double *)&v5;
    *(_OWORD *)(a1 + 640) = v5;
    *(_QWORD *)(a1 + 656) = v6;
    ++*(_DWORD *)(a1 + 220);
  }
  return result;
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  id v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (self->_emitSampleBufferSemaphore)
  {
    v7[0] = self->_emitSampleBufferSemaphore;
    v5 = +[BWDroppedSample newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:](BWDroppedSample, "newDroppedSampleFromDroppedSample:backPressureSemaphoresToIgnore:", a3, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1));
  }
  else
  {
    v5 = a3;
  }
  v6 = v5;
  -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", v5);

}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (BOOL)sphereVideoEnabled
{
  return self->_sphereVideoEnabled;
}

- (BOOL)flipHorizontalExcludingIris
{
  return self->_flipHorizontalExcludingIris;
}

- (BOOL)frameRateConversionEnabled
{
  return self->_frameRateConversionEnabled;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (BOOL)generatesDroppedSampleMarkerBuffers
{
  return self->_generatesDroppedSampleMarkerBuffers;
}

- (OS_dispatch_semaphore)emitSampleBufferSemaphore
{
  return self->_emitSampleBufferSemaphore;
}

- (id)irisStillImageMovieMetadataCache
{
  return self->_irisStillImageMovieMetadataCache;
}

- (void)setStabilizeDepthAttachments:(BOOL)a3
{
  int visExecutionMode;
  BWNodeInputMediaConfiguration *v6;
  BWVideoFormatRequirements *v7;
  BWNodeInput **p_input;

  if (!a3)
  {
    v6 = 0;
    p_input = &self->super._input;
    goto LABEL_9;
  }
  visExecutionMode = self->_visExecutionMode;
  if (visExecutionMode == 3 || visExecutionMode == 0)
  {
    self->_stabilizeDepthAttachments = a3;
    v6 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v7 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v7, "setSupportedPixelFormats:", &unk_1E4A01130);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v6, "setFormatRequirements:", v7);
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v6, "setPassthroughMode:", 0);
    p_input = &self->super._input;
    -[BWNodeInputMediaConfiguration setDelayedBufferCount:](v6, "setDelayedBufferCount:", -[BWNodeInputMediaConfiguration delayedBufferCount](-[BWNodeInput primaryMediaConfiguration](self->super._input, "primaryMediaConfiguration"), "delayedBufferCount"));
LABEL_9:
    -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](*p_input, "setMediaConfiguration:forAttachedMediaKey:", v6, CFSTR("Depth"));
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (BOOL)stabilizeDepthAttachments
{
  return self->_stabilizeDepthAttachments;
}

- (void)setOutputDepthDimensions:(id)a3
{
  if (self->_outputDepthDimensions.width != a3.var0 || self->_outputDepthDimensions.height != a3.var1)
  {
    self->_outputDepthDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- ($2825F4736939C4A6D3AD43837233062D)outputDepthDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDepthDimensions;
}

- (BOOL)personSegmentationRenderingEnabled
{
  return self->_personSegmentationRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  if (self->_smartStyleRenderingEnabled != a3)
  {
    self->_smartStyleRenderingEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
  }
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  if (self->_smartStyleReversibilityEnabled != a3)
  {
    self->_smartStyleReversibilityEnabled = a3;
    -[BWVISNode _updateInputRequirements]((uint64_t)self);
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (void)setLowResImageUsedByVideoEncoderEnabled:(BOOL)a3
{
  if (self->_lowResImageUsedByVideoEncoderEnabled != a3)
  {
    self->_lowResImageUsedByVideoEncoderEnabled = a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (BOOL)lowResImageUsedByVideoEncoderEnabled
{
  return self->_lowResImageUsedByVideoEncoderEnabled;
}

- (void)setCameraExtrinsicMatrix:(id)a3
{

  self->_cameraExtrinsicMatrix = (NSData *)a3;
}

- (id)cameraExtrinsicMatrix
{
  return self->_cameraExtrinsicMatrix;
}

BOOL __41__BWVISNode__updateSupportedPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  int CompressionType;
  int LossyCompressionLevel;

  v3 = objc_msgSend(a2, "intValue");
  CompressionType = FigCapturePixelFormatGetCompressionType(v3);
  if (!CompressionType)
    goto LABEL_11;
  if (!*(_BYTE *)(a1 + 40))
    return 0;
  if (CompressionType != 4)
  {
LABEL_11:
    if (*(_BYTE *)(a1 + 41))
      return 0;
  }
  LossyCompressionLevel = FigCapturePixelFormatGetLossyCompressionLevel(v3);
  if (!LossyCompressionLevel || *(_BYTE *)(a1 + 42))
    return LossyCompressionLevel <= *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144);
  return 0;
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  if (self->_outputColorSpaceProperties != a3)
  {
    self->_outputColorSpaceProperties = a3;
    -[BWVISNode _updateOutputRequirements]((uint64_t)self);
  }
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (int)maxLossyCompressionLevel
{
  return self->_maxLossyCompressionLevel;
}

- (BOOL)videoSTFEnabled
{
  return self->_videoSTFEnabled;
}

- (BOOL)videoGreenGhostMitigationEnabled
{
  return self->_videoGreenGhostMitigationEnabled;
}

- (uint64_t)_collectMetadataForReprocessingFrom:(void *)a3 to:
{
  uint64_t v4;
  const __CFString *v6;
  CFTypeRef v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFDictionary *v16;
  __CFDictionary *v17;
  opaqueCMSampleBuffer *v18;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v20;
  opaqueCMSampleBuffer *v21;
  opaqueCMSampleBuffer *v22;
  opaqueCMSampleBuffer *v23;
  opaqueCMSampleBuffer *v24;
  CFTypeRef v25;
  uint64_t IOSurface;
  __IOSurface *v27;
  id v28;
  void *BaseAddress;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  CFTypeRef v33;
  uint64_t v34;
  CFTypeRef v35;
  uint64_t v36;
  CFTypeRef v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v4 = result;
    result = 4294954516;
    if (target)
    {
      if (a3)
      {
        v6 = (const __CFString *)*MEMORY[0x1E0D05CB0];
        v7 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (v7)
        {
          v8 = (void *)v7;
          objc_msgSend(a3, "setObject:forKeyedSubscript:", *(_QWORD *)(v4 + 184), *MEMORY[0x1E0D06140]);
          -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, (__CFDictionary *)a3, target, 1);
          v9 = *MEMORY[0x1E0D082D8];
          if (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D082D8]))
          {
            v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", objc_msgSend(v8, "objectForKeyedSubscript:", v9));
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v40;
              do
              {
                v14 = 0;
                do
                {
                  if (*(_QWORD *)v40 != v13)
                    objc_enumerationMutation(v10);
                  -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, *(__CFDictionary **)(*((_QWORD *)&v39 + 1) + 8 * v14++), target, 1);
                }
                while (v12 != v14);
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
              }
              while (v12);
            }
            objc_msgSend(a3, "setObject:forKeyedSubscript:", v10, v9);
          }
          v15 = *MEMORY[0x1E0D082D0];
          if (objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D082D0]))
          {
            v16 = (__CFDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", v15));
            if (v16)
            {
              v17 = v16;
              -[BWVISNode _addVISDigitalZoomToMetadata:sampleBuffer:forReprocessing:](v4, v16, target, 1);
              objc_msgSend(a3, "setObject:forKeyedSubscript:", v17, v15);
            }
          }
          v18 = (opaqueCMSampleBuffer *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DA8], 0);
          if (v18)
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v18, *MEMORY[0x1E0D05CE8], *MEMORY[0x1E0D05CF0], a3);
          AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, (uint64_t)CFSTR("Depth"));
          if (AttachedMedia)
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, AttachedMedia, *MEMORY[0x1E0D05CB8], *MEMORY[0x1E0D05CC0], a3);
          v20 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1E495B478);
          if (v20)
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v20, *MEMORY[0x1E0D05CC8], *MEMORY[0x1E0D05CD0], a3);
          v21 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1E494FBD8);
          if (v21)
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v21, *MEMORY[0x1E0D05CD8], *MEMORY[0x1E0D05CE0], a3);
          v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1E494FB78);
          if (v22)
            -[BWVISNode _collectAttachedMediaForReprocessingFrom:offlineKey:offlineKeyData:to:](v4, v22, *MEMORY[0x1E0D08298], *MEMORY[0x1E0D082A0], a3);
          v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, 0x1E494FB98);
          if (v23)
          {
            v24 = v23;
            v25 = CMGetAttachment(v23, v6, 0);
            if (BWSampleBufferGetCVDataBuffer(v24))
            {
              IOSurface = CVDataBufferGetIOSurface();
              if (v25)
              {
                v27 = (__IOSurface *)IOSurface;
                if (IOSurface)
                {
                  v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v28, "setObject:forKeyedSubscript:", v25, v6);
                  IOSurfaceLock(v27, 1u, 0);
                  BaseAddress = IOSurfaceGetBaseAddress(v27);
                  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", BaseAddress, CVDataBufferGetDataSize(), 0);
                  v31 = objc_msgSend(v30, "compressedDataUsingAlgorithm:error:", 1, 0);
                  objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D06730]);

                  IOSurfaceUnlock(v27, 1u, 0);
                  objc_msgSend(a3, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D08290]);

                }
              }
            }
          }
          v32 = *MEMORY[0x1E0D05DB0];
          v33 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DB0], 0);
          if (v33)
            objc_msgSend(a3, "setObject:forKeyedSubscript:", v33, v32);
          v34 = *MEMORY[0x1E0D05DA0];
          v35 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05DA0], 0);
          if (v35)
            objc_msgSend(a3, "setObject:forKeyedSubscript:", v35, v34);
          v36 = *MEMORY[0x1E0D05D98];
          v37 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D98], 0);
          if (v37)
            objc_msgSend(a3, "setObject:forKeyedSubscript:", v37, v36);
          v38 = *MEMORY[0x1E0D08870];
          result = (uint64_t)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08870], 0);
          if (result)
          {
            objc_msgSend(a3, "setObject:forKeyedSubscript:", result, v38);
            return 0;
          }
        }
        else
        {
          return 4294954516;
        }
      }
    }
  }
  return result;
}

- (void)_tallyCompressedIOSurfaceStatsForSBuf:(uint64_t)a1
{
  float v3;
  unint64_t v5;
  unint64_t v6;

  if (a1)
  {
    v5 = 0;
    v6 = 0;
    v3 = BWSampleBufferComputeIOSurfaceCompressionRatio(a2, &v6, &v5);
    if (v3 > 0.0 && v3 <= 1.0)
    {
      objc_msgSend(*(id *)(a1 + 608), "addDataPoint:", v3);
      *(_QWORD *)(a1 + 624) += v6;
      *(_QWORD *)(a1 + 632) += v5;
    }
  }
}

- (uint64_t)_harvestMetadataFromSampleBuffer:(os_unfair_lock_s *)a1
{
  CFTypeRef v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  CMTime v14;
  CMTime v15;

  if (a1)
  {
    if (target)
    {
      v4 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (v4)
      {
        v5 = (void *)v4;
        memset(&v15, 0, sizeof(v15));
        CMSampleBufferGetPresentationTimeStamp(&v15, (CMSampleBufferRef)target);
        v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
        v7 = *MEMORY[0x1E0D08848];
        v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08848], 0);
        if (v8)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v8, "copy"), v7);
        v9 = *MEMORY[0x1E0D08898];
        v10 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D08898], 0);
        if (v10)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v10, "copy"), v9);
        v11 = *MEMORY[0x1E0D08860];
        v12 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D08860]);
        if (v12)
          objc_msgSend(v6, "setObject:forKeyedSubscript:", (id)objc_msgSend(v12, "copy"), v11);
        v14 = v15;
        -[BWVISNode _addMotionTensorsToRingBuffer:pts:](a1, v6, (uint64_t)&v14);
      }
    }
  }
  return 0;
}

- (uint64_t)_stabilizeMetadataForSampleBuffer:(uint64_t)a1
{
  CFTypeRef v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  int64_t v19;
  CMTime v21;
  CMTime v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CMTime v27;
  CMTime time;
  CMTime v29;
  CMTime v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (target)
    {
      v4 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      if (v4)
      {
        v5 = (void *)v4;
        memset(&v30, 0, sizeof(v30));
        CMSampleBufferGetPresentationTimeStamp(&v30, (CMSampleBufferRef)target);
        v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
        v7 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D069A0]);
        v8 = objc_msgSend(v6, "count");
        v9 = (uint64_t *)MEMORY[0x1E0D06F20];
        if (v8)
        {
          memset(&v29, 0, sizeof(v29));
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "objectAtIndexedSubscript:", 0), "objectForKeyedSubscript:", *MEMORY[0x1E0D06F20]), "longLongValue");
          v10 = FigHostTimeToNanoseconds();
          CMTimeMake(&time, v10, 1000000000);
          CMTimeConvertScale(&v29, &time, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          v27 = v29;
          -[BWVISNode _tranformRectanglesInMetadata:pts:](a1, v6, (__int128 *)&v27.value);
          CMSetAttachment(target, CFSTR("DetectedFacesArrayHasBeenStabilized"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
        }
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v24;
          v14 = *MEMORY[0x1E0D064D0];
          v15 = *v9;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(v7);
              v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              v18 = (void *)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v14);
              if (objc_msgSend(v18, "count"))
              {
                memset(&v29, 0, sizeof(v29));
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v17), "objectForKeyedSubscript:", v15), "longLongValue");
                v19 = FigHostTimeToNanoseconds();
                CMTimeMake(&v22, v19, 1000000000);
                CMTimeConvertScale(&v29, &v22, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                v21 = v29;
                -[BWVISNode _tranformRectanglesInMetadata:pts:](a1, v18, (__int128 *)&v21.value);
              }
            }
            v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v12);
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_cinematographyFrameForSampleBuffer:(uint64_t)a1
{
  void *v2;

  if (a1 && target && (v2 = (void *)CMGetAttachment(target, CFSTR("CinematicVideoCinematographyMetadata"), 0)) != 0)
    return objc_msgSend(v2, "objectForKeyedSubscript:", 0x1E4959E18);
  else
    return 0;
}

- (uint64_t)_attachHarvestedStabilizationMetadataToCinematographyFrame:(os_unfair_lock_s *)a1
{
  int v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CMTime v15[2];

  if (a1)
  {
    if (a2)
    {
      memset(&v15[1], 0, sizeof(CMTime));
      objc_msgSend(a2, "time");
      v15[0] = v15[1];
      v4 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:](a1, 0, v15);
      if ((v4 & 0x80000000) == 0)
      {
        v5 = v4;
        v6 = (void *)objc_msgSend(*(id *)&a1[8 * v4 + 68]._os_unfair_lock_opaque, "objectForKeyedSubscript:", *MEMORY[0x1E0D08898]);
        if (objc_msgSend(v6, "length") == 36)
        {
          v7 = (void *)objc_msgSend(*(id *)&a1[8 * v5 + 68]._os_unfair_lock_opaque, "objectForKeyedSubscript:", *MEMORY[0x1E0D08860]);
          if (objc_msgSend(v7, "length") == 8)
          {
            v8 = objc_msgSend(v6, "bytes");
            v9 = 0;
            v12 = 0u;
            v13 = 0u;
            v14 = 0u;
            do
            {
              *((_DWORD *)&v12 + 4 * (v9 % 3u) + v9 / 3u) = *(_DWORD *)(v8 + 4 * v9);
              ++v9;
            }
            while (v9 != 9);
            v10 = (void *)objc_msgSend(objc_alloc((Class)getPTTimedStabilizationMetadataVersion1Class()), "initWithMinorVersion:", 1);
            objc_msgSend(v10, "setStabilizationHomography:", *(double *)&v12, *(double *)&v13, *(double *)&v14);
            objc_msgSend(v10, "setEstimatedMotionBlur:", *(double *)objc_msgSend(v7, "bytes"));
            objc_setAssociatedObject(a2, CFSTR("CinematicVideoTimedStabilizationMetadata"), v10, (void *)1);

          }
        }
      }
    }
  }
  return 0;
}

- (uint64_t)_stabilizeCinematographyMetadataInCinematographyFrame:(uint64_t)a1
{
  uint64_t v4;
  unsigned int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t i;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[56];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a2)
    {
      memset(&v30[32], 0, 24);
      objc_msgSend(a2, "time");
      v4 = *MEMORY[0x1E0D08848];
      *(CMTime *)v30 = *(CMTime *)&v30[32];
      v5 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:]((os_unfair_lock_s *)a1, v4, (CMTime *)v30);
      if ((v5 & 0x80000000) == 0)
      {
        v6 = (void *)objc_msgSend(*(id *)(a1 + 272 + 32 * v5), "objectForKeyedSubscript:", v4);
        if (objc_msgSend(v6, "length") == 36)
        {
          v7 = objc_msgSend(v6, "bytes");
          if (v7)
          {
            v8 = v7;
            v9 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
            v10 = objc_msgSend(v9, "width");
            v11 = objc_msgSend(v9, "height");
            v12 = (void *)objc_msgSend(*(id *)(a1 + 16), "videoFormat");
            v13 = objc_msgSend(v12, "width");
            objc_msgSend(v12, "height");
            v14 = (void *)objc_msgSend((id)objc_msgSend(a2, "detections"), "allValues");
            if (objc_msgSend(v14, "count"))
            {
              v28 = 0u;
              v29 = 0u;
              v26 = 0u;
              v27 = 0u;
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
              if (v15)
              {
                v16 = v15;
                v17 = *(_QWORD *)v27;
                v18 = v10 | ((unint64_t)v11 << 32);
                do
                {
                  for (i = 0; i != v16; ++i)
                  {
                    if (*(_QWORD *)v27 != v17)
                      objc_enumerationMutation(v14);
                    v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                    objc_msgSend(v20, "rect");
                    objc_msgSend(v20, "setRect:", visn_transformRectangle(v8, v18, v13, v21, v22, v23, v24));
                  }
                  v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
                }
                while (v16);
              }
            }
          }
        }
      }
    }
  }
  return 0;
}

- (double)_droppedSamplePTSFromSampleBuffer:(uint64_t)a3@<X8>
{
  __int128 v5;
  uint64_t v6;
  CMTime *v7;
  int32_t timescale;
  int64_t v9;
  CMTime v11;
  CMTime rhs;
  CMTime v13;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  if (a2)
  {
    if (sbuf)
    {
      CMSampleBufferGetPresentationTimeStamp((CMTime *)a3, sbuf);
    }
    else
    {
      v6 = MEMORY[0x1E0CA2E18];
      v5 = *MEMORY[0x1E0CA2E18];
      *(_OWORD *)a3 = *MEMORY[0x1E0CA2E18];
      *(_QWORD *)(a3 + 16) = *(_QWORD *)(v6 + 16);
    }
    if ((*(_BYTE *)(a3 + 12) & 1) == 0)
    {
      if ((*(_BYTE *)(a2 + 652) & 1) == 0)
      {
        CMTimeMake(&v13, 1, 1000);
        *(CMTime *)(a2 + 640) = v13;
      }
      v7 = (CMTime *)(a2 + 640);
      timescale = v7->timescale;
      if (timescale <= 999)
        v9 = 1;
      else
        v9 = timescale / 0x3E8u;
      CMTimeMake(&rhs, v9, timescale);
      v11 = *v7;
      CMTimeAdd(&v13, &v11, &rhs);
      *(_QWORD *)&v5 = v13.value;
      *(CMTime *)a3 = v13;
    }
  }
  return *(double *)&v5;
}

- (uint64_t)_collectAttachedMediaForReprocessingFrom:(uint64_t)a3 offlineKey:(uint64_t)a4 offlineKeyData:(void *)a5 to:
{
  opaqueCMSampleBuffer *v5;
  uint64_t v9;
  CFTypeRef v10;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v12;
  size_t Height;
  size_t BytesPerRow;
  uint64_t Attributes;
  opaqueCMSampleBuffer *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;

  if (!a1)
    return 0;
  v5 = target;
  if (!target)
  {
    v19 = 0;
    goto LABEL_12;
  }
  v9 = *MEMORY[0x1E0D05CB0];
  v10 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  ImageBuffer = CMSampleBufferGetImageBuffer(v5);
  if (!ImageBuffer)
  {
    v19 = 0;
    v5 = 0;
    goto LABEL_12;
  }
  v12 = ImageBuffer;
  Height = CVPixelBufferGetHeight(ImageBuffer);
  BytesPerRow = CVPixelBufferGetBytesPerRow(v12);
  Attributes = CVPixelBufferGetAttributes();
  v16 = (opaqueCMSampleBuffer *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = v16;
  if (!v16)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v19 = 0;
LABEL_17:
    v21 = 4294954510;
    goto LABEL_13;
  }
  -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", Attributes, *MEMORY[0x1E0D088E0]);
  if (v10)
    -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v10, v9);
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", BytesPerRow);
  -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CA8F98]);
  CVPixelBufferLockBaseAddress(v12, 1uLL);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", CVPixelBufferGetBaseAddress(v12), BytesPerRow * Height, 0);
  v19 = v18;
  if (!v18 || (v20 = objc_msgSend(v18, "compressedDataUsingAlgorithm:error:", 1, 0)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_17;
  }
  -[opaqueCMSampleBuffer setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, a4);
  CVPixelBufferUnlockBaseAddress(v12, 1uLL);
  objc_msgSend(a5, "setObject:forKeyedSubscript:", v5, a3);
LABEL_12:
  v21 = 0;
LABEL_13:

  return v21;
}

- (void)didCompleteProcessingOfBuffer:(opaqueCMSampleBuffer *)a3 withStatus:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  __CFDictionary *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  __CFString **v13;
  uint64_t v14;
  const void *v15;
  _BOOL4 v16;
  BOOL v17;
  const __CFString *v18;
  CFTypeRef v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  const void *AttachedMedia;
  const __CFString *v27;
  CFTypeRef v28;
  const __CFString *v29;
  void *v30;
  float v31;
  float v32;
  CVImageBufferRef ImageBuffer;
  const __CFString *v34;
  __CVBuffer *v35;
  __CVBuffer *v36;
  uint64_t v37;
  const __CFString *v38;
  CFTypeRef v39;
  void *v40;
  int v41;
  const __CFString *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[24];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  __CFString *v52;
  uint64_t v53;
  _QWORD v54[2];
  _QWORD v55[4];

  v5 = *(_QWORD *)&a4;
  v55[2] = *MEMORY[0x1E0C80C00];
  if (a4)
    goto LABEL_51;
  v8 = (__CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (self->_frameRateConversionEnabled)
  {
    if (!a3)
      return;
    v9 = (void *)CMGetAttachment(a3, CFSTR("VariableFrameRateInfo"), 0);
    if (!v9)
    {
      v16 = v8 != 0;
      goto LABEL_13;
    }
    v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", 0x1E495A538), "intValue");
    v54[0] = 0x1E495A578;
    v54[1] = 0x1E495A598;
    v55[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
    v55[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_frameRateConversionEnabled);
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = v55;
    v13 = (__CFString **)v54;
    v14 = 2;
  }
  else
  {
    v52 = CFSTR("VFREnabled");
    v53 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v53;
    v13 = &v52;
    v14 = 1;
  }
  v15 = (const void *)objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, v14);
  v16 = v8 != 0;
  if (v8)
    v17 = v15 == 0;
  else
    v17 = 1;
  if (!v17)
    CFDictionarySetValue(v8, CFSTR("VariableFrameRateStats"), v15);
  if (a3)
  {
LABEL_13:
    v18 = (const __CFString *)*MEMORY[0x1E0CA26A8];
    v19 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0CA26A8], 0);
    if (v19 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      v20 = v19;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v21 = (void *)objc_msgSend((id)CMGetAttachment(a3, CFSTR("AttachedMedia"), 0), "allKeys");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v48 != v24)
              objc_enumerationMutation(v21);
            AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(a3, *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i));
            CMSetAttachment(AttachedMedia, v18, v20, 1u);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v23);
      }
    }
    if (self->_stabilizeDepthAttachments)
    {
      v27 = (const __CFString *)*MEMORY[0x1E0D08850];
      v28 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08850], 0);
      if (v28)
      {
        BWSampleBufferSetAttachedMedia(a3, (uint64_t)CFSTR("Depth"), (uint64_t)v28);
        CMRemoveAttachment(a3, v27);
      }
    }
    if (!v16)
      goto LABEL_32;
    if ((self->_stabilizationType - 3) > 1)
    {
      if (self->_onlyGeneratingTransforms)
        goto LABEL_32;
    }
    else
    {
      v29 = (const __CFString *)*MEMORY[0x1E0D08880];
      v30 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08880], 0);
      objc_msgSend(v30, "floatValue");
      v32 = v31;
      if (v30)
        CMRemoveAttachment(a3, v29);
      if (v32 > 1.0)
      {
        FigCFDictionarySetCGRect();
        goto LABEL_32;
      }
    }
    CFDictionaryRemoveValue(v8, (const void *)*MEMORY[0x1E0D05E68]);
LABEL_32:
    if (!self->_lowResImageUsedByVideoEncoderEnabled)
      goto LABEL_38;
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    v34 = (const __CFString *)*MEMORY[0x1E0D05CA0];
    v35 = (__CVBuffer *)CMGetAttachment(ImageBuffer, (CFStringRef)*MEMORY[0x1E0D05CA0], 0);
    if (!v35)
      goto LABEL_38;
    v36 = v35;
    if (v16 && CFDictionaryContainsKey(v8, (const void *)*MEMORY[0x1E0D05E68])
      || (v37 = BWSampleBufferSetAttachedMediaFromPixelBuffer(a3, 0x1E495B458, v36, (CFTypeRef *)&self->_lowResImageUsedByVideoEncoderFormatDescription, objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), 0, 0), !(_DWORD)v37))
    {
      CMRemoveAttachment(ImageBuffer, v34);
LABEL_38:
      v38 = (const __CFString *)*MEMORY[0x1E0D08878];
      v39 = (id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D08878], 0);
      if (v39)
      {
        v40 = (void *)v39;
        v41 = -[BWVISProcessorControllerConfiguration videoStabilizationStrength](self->_processorControllerConfiguration, "videoStabilizationStrength");
        if (v41 == 3)
        {
          v42 = CFSTR("action");
        }
        else if (v41 == 4)
        {
          v42 = CFSTR("actionUltra");
        }
        else if (self->_stereoMode)
        {
          v42 = CFSTR("stereo");
        }
        else
        {
          v42 = CFSTR("video");
        }
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0D08320]);
        CMSetAttachment(a3, v38, v40, 1u);

      }
      -[BWVISNode _tallyAndEmitSampleBuffer:]((uint64_t)self, a3);
      return;
    }
    v5 = v37;
    fig_log_get_emitter();
    v45 = v4;
    LODWORD(v44) = v5;
    FigDebugAssert3();
LABEL_51:
    -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v5, CFSTR("VIS Processor ready callback, generating drop"), v44, v45);
    v43 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494EFB8, v46, -[BWVISNode _droppedSamplePTSFromSampleBuffer:](a3, (uint64_t)self, (uint64_t)v46));
    -[BWVISNode _tallyAndEmitDroppedSample:]((uint64_t)self, v43);

  }
}

- (void)_addMotionTensorsToRingBuffer:(uint64_t)a3 pts:
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (a1)
  {
    os_unfair_lock_lock(a1 + 149);
    v6 = (uint64_t)&a1[8 * a1[148]._os_unfair_lock_opaque + 68];
    v7 = *(void **)v6;
    v8 = *(_QWORD *)(a3 + 16);
    *(_OWORD *)(v6 + 8) = *(_OWORD *)a3;
    *(_QWORD *)(v6 + 24) = v8;
    *(_QWORD *)&a1[8 * a1[148]._os_unfair_lock_opaque + 68]._os_unfair_lock_opaque = a2;

    a1[148]._os_unfair_lock_opaque = (a1[148]._os_unfair_lock_opaque + 1) % 0xA;
    os_unfair_lock_unlock(a1 + 149);
  }
}

- (uint64_t)_findBestMotionTensorsInRingBufferWithKey:(CMTime *)a3 pts:
{
  uint64_t v6;
  int i;
  uint64_t v8;
  void *v9;
  CMTime v11;
  CMTime lhs;
  CMTime time;
  CMTime v14;
  CMTime v15;

  if (!a1)
    return 0;
  v15 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E30];
  os_unfair_lock_lock(a1 + 149);
  v6 = 0xFFFFFFFFLL;
  for (i = 9; i != -1; --i)
  {
    v8 = i + a1[148]._os_unfair_lock_opaque - 10 * ((a1[148]._os_unfair_lock_opaque + i) / 0xA);
    v9 = *(void **)&a1[8 * v8 + 68]._os_unfair_lock_opaque;
    if (v9 && (!a2 || objc_msgSend(v9, "objectForKeyedSubscript:", a2)))
    {
      memset(&v14, 0, sizeof(v14));
      lhs = *(CMTime *)&a1[8 * v8 + 70]._os_unfair_lock_opaque;
      v11 = *a3;
      CMTimeSubtract(&time, &lhs, &v11);
      CMTimeAbsoluteValue(&v14, &time);
      lhs = v14;
      v11 = v15;
      if (CMTimeCompare(&lhs, &v11) > 0)
        break;
      v15 = v14;
      v6 = v8;
    }
  }
  os_unfair_lock_unlock(a1 + 149);
  return v6;
}

- (uint64_t)_tranformRectanglesInMetadata:(__int128 *)a3 pts:
{
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  double v19;
  double v20;
  __double2 v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  char v25;
  double *v26;
  double v27;
  double v28;
  float *v29;
  double v30;
  float v31;
  const float *v32;
  float32x2_t v33;
  float v34;
  id obj;
  __int128 v38;
  __int128 v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  float32x2_t v51;
  uint64_t v52;
  double v53[4];
  double v54[4];
  _BYTE v55[128];
  uint64_t v56;

  obj = a2;
  v56 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a2, "count"))
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
      v5 = objc_msgSend(v4, "width");
      v6 = objc_msgSend(v4, "height");
      v7 = (void *)objc_msgSend(*(id *)(a1 + 16), "videoFormat");
      v43 = objc_msgSend(v7, "width");
      objc_msgSend(v7, "height");
      v8 = *MEMORY[0x1E0D08848];
      v45 = *a3;
      *(_QWORD *)&v46 = *((_QWORD *)a3 + 2);
      v9 = -[BWVISNode _findBestMotionTensorsInRingBufferWithKey:pts:]((os_unfair_lock_s *)a1, v8, (CMTime *)&v45);
      if ((v9 & 0x80000000) == 0)
      {
        v10 = (void *)objc_msgSend(*(id *)(a1 + 272 + 32 * v9), "objectForKeyedSubscript:", v8);
        if (objc_msgSend(v10, "length") == 36)
        {
          v42 = objc_msgSend(v10, "bytes");
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v44)
          {
            v40 = v5 | ((unint64_t)v6 << 32);
            v41 = *(_QWORD *)v48;
            v11 = *MEMORY[0x1E0D06888];
            v12 = (double)v5;
            v13 = (double)v6;
            v14 = *MEMORY[0x1E0D06890];
            v38 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
            v39 = *MEMORY[0x1E0C9D628];
            v15 = *MEMORY[0x1E0D06880];
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v48 != v41)
                  objc_enumerationMutation(obj);
                v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                v45 = v39;
                v46 = v38;
                FigCFDictionaryGetCGRectIfPresent();
                visn_transformRectangle(v42, v40, v43, *(double *)&v45, *((double *)&v45 + 1), *(double *)&v46, *((double *)&v46 + 1));
                FigCFDictionarySetCGRect();
                if (objc_msgSend(v17, "objectForKeyedSubscript:", v11))
                {
                  v18 = objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v11), "intValue");
                  v19 = (*(double *)&v45 + *(double *)&v46 * 0.5) * v12;
                  v20 = (*((double *)&v45 + 1) + *((double *)&v46 + 1) * 0.5) * v13;
                  v54[0] = v19;
                  v54[1] = v20;
                  v21 = __sincos_stret((float)((float)v18 + -90.0) / 180.0 * 3.14159265);
                  v22 = 0;
                  v54[2] = v19 + v21.__cosval * 10.0;
                  v54[3] = v20 + v21.__sinval * 10.0;
                  v23 = 1;
                  do
                  {
                    v24 = 0;
                    v25 = v23;
                    v26 = &v54[2 * v22];
                    v27 = *v26;
                    v28 = v26[1];
                    v29 = (float *)(v42 + 8);
                    do
                    {
                      v30 = v28 * *(v29 - 1) + *(v29 - 2) * v27;
                      v31 = *v29;
                      v29 += 3;
                      *(float *)&v30 = v30 + v31;
                      v51.i32[v24++] = LODWORD(v30);
                    }
                    while (v24 != 3);
                    v23 = 0;
                    v32 = (const float *)&v52;
                    v33 = vld1_dup_f32(v32);
                    *(float64x2_t *)&v53[2 * v22] = vcvtq_f64_f32(vdiv_f32(v51, v33));
                    v22 = 1;
                  }
                  while ((v25 & 1) != 0);
                  v34 = atan2(v53[3] - v53[1], v53[2] - v53[0]) * 180.0 / 3.14159265;
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureNormalizeAngle(llroundf(v34 + 90.0))), v11);
                }
                if (objc_msgSend(v17, "objectForKeyedSubscript:", v14, obj) && *(_BYTE *)(a1 + 164))
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureNormalizeAngle(llroundf(-(float)(int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v14), "intValue")))), v14);
                if (objc_msgSend(v17, "objectForKeyedSubscript:", v15))
                  objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", FigCaptureNormalizeAngle((int)(float)(int)objc_msgSend((id)objc_msgSend(v17, "objectForKeyedSubscript:", v14), "intValue"))), v15);
              }
              v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            }
            while (v44);
          }
        }
      }
    }
  }
  return 0;
}

- (BOOL)firstFrameProcessed
{
  return self->_firstFrameProcessed;
}

- (void)setFirstFrameProcessed:(BOOL)a3
{
  self->_firstFrameProcessed = a3;
}

@end
