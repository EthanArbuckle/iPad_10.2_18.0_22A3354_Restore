@implementation BWMetadataDetectorGatingNode

- (id)nodeType
{
  return CFSTR("Demuxer");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  double v13;
  int v14;
  BWMetadataDetectorGatingOutputController *textLocalizationOutputController;
  objc_super v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)BWMetadataDetectorGatingNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v16, sel_prepareForCurrentConfigurationToBecomeLive);
  v3 = -[BWVideoFormat pixelFormat](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "pixelFormat");
  if (self)
    v4 = &unk_1E4A00C50;
  else
    v4 = 0;
  if (!objc_msgSend(v4, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3))|| -[BWVideoFormat cacheMode](-[BWNodeInput videoFormat](self->super.super._input, "videoFormat"), "cacheMode") == 1792)
  {
    -[BWMetadataDetectorGatingNode _ensureTransferSession]((uint64_t)self);
  }
  if (self->_mrcOutputController)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (self->_lowPowerModeEnabled)
    {
      v6 = 5;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0));
        --v6;
      }
      while (v6);
      v7 = 5;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 7.5));
        --v7;
      }
      while (v7);
      v8 = 5;
    }
    else
    {
      v9 = 15;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 15.0));
        --v9;
      }
      while (v9);
      LODWORD(v8) = 15;
      do
      {
        objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 7.5));
        v8 = (v8 - 1);
      }
      while ((_DWORD)v8);
    }
    objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.0));
    -[BWMetadataDetectorGatingOutputController enableDetectionFrameRateControllingWithRamp:startIndex:](self->_mrcOutputController, "enableDetectionFrameRateControllingWithRamp:startIndex:", v5, v8);
  }
  if (self->_appClipCodeOutputController)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 5;
    if (+[BWInferenceEngine isNeuralEngineSupported](BWInferenceEngine, "isNeuralEngineSupported"))
    {
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0));
        --v11;
      }
      while (v11);
      v12 = 5;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 7.5));
        --v12;
      }
      while (v12);
      v13 = 5.0;
    }
    else
    {
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 10.0));
        --v11;
      }
      while (v11);
      v14 = 5;
      do
      {
        objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 2.0));
        --v14;
      }
      while (v14);
      v13 = 1.0;
    }
    objc_msgSend(v10, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13));
    -[BWMetadataDetectorGatingOutputController enableDetectionFrameRateControllingWithRamp:startIndex:](self->_appClipCodeOutputController, "enableDetectionFrameRateControllingWithRamp:startIndex:", v10, 5);
  }
  textLocalizationOutputController = self->_textLocalizationOutputController;
  if (textLocalizationOutputController)
  {
    v17[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 5.5);
    -[BWMetadataDetectorGatingOutputController enableDetectionFrameRateControllingWithRamp:startIndex:](textLocalizationOutputController, "enableDetectionFrameRateControllingWithRamp:startIndex:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1), 0);
  }
}

- (uint64_t)_ensureTransferSession
{
  uint64_t v1;

  if (!a1 || *(_QWORD *)(a1 + 216))
    return 0;
  v1 = VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (VTPixelTransferSessionRef *)(a1 + 216));
  if ((_DWORD)v1)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v1;
}

- (BWMetadataDetectedResultsObserver)textLocalizationResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_textLocalizationOutputController;
}

- (BWNodeOutput)textLocalizationOutput
{
  return self->_textLocalizationOutput;
}

- (BWMetadataDetectedResultsObserver)mrcResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_mrcOutputController;
}

- (BWNodeOutput)mrcOutput
{
  return self->_mrcOutput;
}

- (BWMetadataDetectedResultsObserver)appClipCodeResultsObserver
{
  return (BWMetadataDetectedResultsObserver *)self->_appClipCodeOutputController;
}

- (BWNodeOutput)appClipCodeOutput
{
  return self->_appClipCodeOutput;
}

- (CVPixelBufferRef)_createOutputPixelBufferFromSbuf:(_BYTE *)a3 appliedPrimaryCaptureRect:
{
  CGSize v6;
  const __CFDictionary *v7;
  __CVBuffer *v8;
  int Width;
  size_t Height;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CFDictionaryRef DictionaryRepresentation;
  OSStatus v24;
  __CVBuffer *v25;
  __CVBuffer *ImageBuffer;
  CGRect rect;

  if (!a1)
    return 0;
  *a3 = 0;
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v6;
  v7 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05D10], 0);
  CGRectMakeWithDictionaryRepresentation(v7, &rect);
  if (objc_msgSend(*(id *)(a1 + 168), "shouldRunDetection")
    && !CGRectIsNull(rect)
    && -[BWMetadataDetectorGatingNode _ensureTransferSession](a1))
  {
    goto LABEL_26;
  }
  if ((-[BWMetadataDetectorGatingNode _anyOutputShouldRunDetection](a1) & 1) == 0
    && !-[BWMetadataDetectorGatingNode _anyOutputShouldApplySceneMotion](a1)
    || !*(_QWORD *)(a1 + 216))
  {
    ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    return CVPixelBufferRetain(ImageBuffer);
  }
  v8 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
  Width = CVPixelBufferGetWidth(v8);
  Height = CVPixelBufferGetHeight(v8);
  if (!CGRectIsNull(rect))
  {
    v11 = (double)Width;
    v12 = (double)(int)Height;
    FigCaptureMetadataUtilitiesDenormalizeCropRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    rect.origin.x = v13;
    rect.origin.y = v14;
    v17 = round(v16 * 0.5);
    v18 = v17 + v17;
    if (v18 < (double)Width)
      v11 = v18;
    v19 = round(v15 * 0.5);
    v20 = v19 + v19;
    if (v20 < v12)
      v12 = v20;
    rect.size.width = v11;
    rect.size.height = v12;
    v21 = v11;
    v22 = v12;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&v13);
    v24 = VTSessionSetProperty(*(VTSessionRef *)(a1 + 216), (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
    if (v24)
      goto LABEL_26;
    Width = (int)v11;
    Height = (int)v12;
  }
  if (-[BWMetadataDetectorGatingNode _ensureOutputBufferPoolWithDimensions:](a1, Width | (Height << 32)))
  {
LABEL_26:
    fig_log_get_emitter();
    FigDebugAssert3();
    v25 = 0;
    goto LABEL_27;
  }
  v25 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 224), "newPixelBuffer");
  if (!v25)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v25;
  }
  if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 216), v8, v25))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_27:
    CVPixelBufferRelease(v25);
    return 0;
  }
  *a3 = 1;
  return v25;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSMutableArray *outputControllers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  CVPixelBufferRef v11;
  __CVBuffer *v12;
  CFTypeRef v13;
  BWSceneStabilityMonitor *sceneStabilityMonitor;
  uint64_t ShouldApplyScene;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t j;
  BWMetadataDetectorGatingOutputController *v22;
  _BOOL8 v23;
  BWMetadataDetectorGatingOutputController *v24;
  CVImageBufferRef ImageBuffer;
  opaqueCMSampleBuffer *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  unsigned __int8 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (self->_needsSynchronization)
    -[BWMetadataDetectorGatingNode _synchronizeOutputControllersWhenApplicable]((uint64_t)self);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  outputControllers = self->_outputControllers;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputControllers, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(outputControllers);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "prepareToEmitBuffer:", a3);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](outputControllers, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v8);
  }
  v35 = 0;
  v11 = -[BWMetadataDetectorGatingNode _createOutputPixelBufferFromSbuf:appliedPrimaryCaptureRect:]((uint64_t)self, a3, &v35);
  if (v11)
  {
    v12 = v11;
    v33 = 0uLL;
    v34 = 0;
    BWGetOriginalPresentationTimeStampFromBuffer(a3, (uint64_t)&v33);
    v13 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    sceneStabilityMonitor = self->_sceneStabilityMonitor;
    ShouldApplyScene = -[BWMetadataDetectorGatingNode _anyOutputShouldApplySceneMotion]((uint64_t)self);
    v31 = v33;
    v32 = v34;
    -[BWSceneStabilityMonitor calculateStabilityWithPixelBuffer:pts:metadataDictionary:forceSceneMotion:](sceneStabilityMonitor, "calculateStabilityWithPixelBuffer:pts:metadataDictionary:forceSceneMotion:", v12, &v31, v13, ShouldApplyScene);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = self->_outputControllers;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      v20 = v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          v22 = *(BWMetadataDetectorGatingOutputController **)(*((_QWORD *)&v27 + 1) + 8 * j);
          if (-[BWMetadataDetectorGatingOutputController shouldEmitBuffer](v22, "shouldEmitBuffer"))
          {
            if (v22 == self->_textLocalizationOutputController)
            {
              ImageBuffer = CMSampleBufferGetImageBuffer(a3);
              v24 = v22;
              v26 = a3;
              v23 = 0;
            }
            else
            {
              v23 = v20 != 0;
              v24 = v22;
              ImageBuffer = v12;
              v26 = a3;
            }
            -[BWMetadataDetectorGatingOutputController emitPixelBuffer:inputSampleBuffer:appliedPrimaryCaptureRect:](v24, "emitPixelBuffer:inputSampleBuffer:appliedPrimaryCaptureRect:", ImageBuffer, v26, v23);
          }
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
      }
      while (v18);
    }
    CFRelease(v12);
  }
}

- (uint64_t)_anyOutputShouldApplySceneMotion
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = *(void **)(result + 184);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      while (2)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4), "shouldApplySceneMotion") & 1) != 0)
            return 1;
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (uint64_t)_anyOutputShouldRunDetection
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = 0u;
    v8 = 0u;
    v5 = 0u;
    v6 = 0u;
    v1 = *(void **)(result + 184);
    result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
    if (result)
    {
      v2 = result;
      v3 = *(_QWORD *)v6;
      while (2)
      {
        v4 = 0;
        do
        {
          if (*(_QWORD *)v6 != v3)
            objc_enumerationMutation(v1);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v5 + 1) + 8 * v4), "shouldRunDetection") & 1) != 0)
            return 1;
          ++v4;
        }
        while (v2 != v4);
        result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v5, v9, 16);
        v2 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BWMetadataDetectorGatingNode;
  -[BWFanOutNode didSelectFormat:forInput:](&v7, sel_didSelectFormat_forInput_, a3, a4);
  if (self)
    v6 = &unk_1E4A00C50;
  else
    v6 = 0;
  if (objc_msgSend(v6, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"))))
  {
    -[BWNodeInput setPassthroughMode:](self->super.super._input, "setPassthroughMode:", 1);
    -[BWMetadataDetectorGatingNode _updateNodeOutputPassthroughMode:](self, 1);
  }
  -[BWMetadataDetectorGatingNode _updateOutputRequirementsIfNecessary]((uint64_t)self);
}

- (void)_updateNodeOutputPassthroughMode:(void *)result
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (void *)objc_msgSend(result, "outputs", 0);
    result = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v8;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "setPassthroughMode:", a2);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        result = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_updateOutputRequirementsIfNecessary
{
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (id *)result;
    result = objc_msgSend(*(id *)(result + 8), "passthroughMode");
    if (!(_DWORD)result)
    {
      result = objc_msgSend(v1[1], "videoFormat");
      if (result)
      {
        v2 = (void *)result;
        v11 = 0u;
        v12 = 0u;
        v9 = 0u;
        v10 = 0u;
        obj = (id)objc_msgSend(v1, "outputs");
        result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
        if (result)
        {
          v3 = result;
          v4 = *(_QWORD *)v10;
          do
          {
            v5 = 0;
            do
            {
              if (*(_QWORD *)v10 != v4)
                objc_enumerationMutation(obj);
              v6 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "formatRequirements");
              v8[0] = MEMORY[0x1E0C809B0];
              v8[1] = 3221225472;
              v8[2] = __68__BWMetadataDetectorGatingNode__updateOutputRequirementsIfNecessary__block_invoke;
              v8[3] = &unk_1E4923320;
              v8[4] = v2;
              objc_msgSend(v6, "setSupportedPixelFormats:", objc_msgSend(&unk_1E4A00C50, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8)));
              objc_msgSend(v6, "setWidth:", objc_msgSend(v2, "width"));
              objc_msgSend(v6, "setHeight:", objc_msgSend(v2, "height"));
              v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v2, "colorSpaceProperties"));
              objc_msgSend(v6, "setSupportedColorSpaceProperties:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1));
              ++v5;
            }
            while (v3 != v5);
            result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
            v3 = result;
          }
          while (result);
        }
      }
    }
  }
  return result;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWMetadataDetectorGatingNode)initWithMRCEnabled:(BOOL)a3 appClipCodeEnabled:(BOOL)a4 textLocalizationEnabled:(BOOL)a5 lowPowerModeEnabled:(BOOL)a6 compressed8BitInputEnabled:(BOOL)a7
{
  int v7;
  uint64_t v8;
  unsigned int v9;
  _BOOL8 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  unsigned int v13;
  BWMetadataDetectorGatingNode *v14;
  BWMetadataDetectorGatingOutputController *v15;
  BWMetadataDetectorGatingOutputController *v16;
  BWMetadataDetectorGatingOutputController *v17;
  objc_super v19;

  if (a3)
    v7 = 2;
  else
    v7 = 1;
  if (!a4)
    v7 = a3;
  v8 = (v7 + a5);
  if (!(v7 + a5))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("No detectors enabled"), 0, a6, a7));
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BWMetadataDetectorGatingNode;
  v14 = -[BWFanOutNode initWithFanOutCount:mediaType:](&v19, sel_initWithFanOutCount_mediaType_, v8, 1986618469);
  if (v14)
  {
    v14->_sceneStabilityMonitor = objc_alloc_init(BWSceneStabilityMonitor);
    v14->_outputControllers = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v14->_detectorsAvailableGroup = (OS_dispatch_group *)dispatch_group_create();
    if (v13)
    {
      v14->_mrcOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", 0);
      v15 = -[BWMetadataDetectorGatingOutputController initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:]([BWMetadataDetectorGatingOutputController alloc], "initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:", v14->_mrcOutput, CFSTR("MRC Output Controller"), v14->_sceneStabilityMonitor, v14->_detectorsAvailableGroup);
      v14->_mrcOutputController = v15;
      -[BWMetadataDetectorGatingOutputController setLowPowerModeEnabled:](v15, "setLowPowerModeEnabled:", v10);
      v13 = 1;
      -[BWMetadataDetectorGatingOutputController setSceneMotionEstimatesSupported:](v14->_mrcOutputController, "setSceneMotionEstimatesSupported:", 1);
      -[BWMetadataDetectorGatingOutputController setShouldEmitFirstBufferAfterSceneChange:](v14->_mrcOutputController, "setShouldEmitFirstBufferAfterSceneChange:", 1);
      -[BWMetadataDetectorGatingOutputController setSynchronizeWithOtherControllers:](v14->_mrcOutputController, "setSynchronizeWithOtherControllers:", 1);
      -[NSMutableArray addObject:](v14->_outputControllers, "addObject:", v14->_mrcOutputController);
      if (!v12)
        goto LABEL_13;
    }
    else if (!v12)
    {
LABEL_13:
      if (v11)
      {
        v14->_textLocalizationOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", v13);
        v17 = -[BWMetadataDetectorGatingOutputController initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:]([BWMetadataDetectorGatingOutputController alloc], "initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:", v14->_textLocalizationOutput, CFSTR("Text Localization Output Controller"), v14->_sceneStabilityMonitor, v14->_detectorsAvailableGroup);
        v14->_textLocalizationOutputController = v17;
        -[BWMetadataDetectorGatingOutputController setLowPowerModeEnabled:](v17, "setLowPowerModeEnabled:", v10);
        -[NSMutableArray addObject:](v14->_outputControllers, "addObject:", v14->_textLocalizationOutputController);
      }
      -[BWMetadataDetectorGatingNode _updateInputRequirements:]((uint64_t)v14, v9);
      -[BWNodeInput setPassthroughMode:](v14->super.super._input, "setPassthroughMode:", 0);
      -[BWMetadataDetectorGatingNode _updateNodeOutputPassthroughMode:](v14, 0);
      v14->_lowPowerModeEnabled = v10;
      v14->_needsSynchronization = 1;
      return v14;
    }
    v14->_appClipCodeOutput = (BWNodeOutput *)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v14, "outputs"), "objectAtIndexedSubscript:", v13);
    v16 = -[BWMetadataDetectorGatingOutputController initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:]([BWMetadataDetectorGatingOutputController alloc], "initWithOutput:name:sceneStabilityMonitor:detectorAvailableGroup:", v14->_appClipCodeOutput, CFSTR("AppClipCode Output Controller"), v14->_sceneStabilityMonitor, v14->_detectorsAvailableGroup);
    v14->_appClipCodeOutputController = v16;
    -[BWMetadataDetectorGatingOutputController setLowPowerModeEnabled:](v16, "setLowPowerModeEnabled:", v10);
    -[BWMetadataDetectorGatingOutputController setSynchronizeWithOtherControllers:](v14->_appClipCodeOutputController, "setSynchronizeWithOtherControllers:", 1);
    -[NSMutableArray addObject:](v14->_outputControllers, "addObject:", v14->_appClipCodeOutputController);
    ++v13;
    goto LABEL_13;
  }
  return v14;
}

- (uint64_t)_updateInputRequirements:(uint64_t)result
{
  id *v3;
  void *v4;
  void *v5;
  int v6;

  if (result)
  {
    v3 = (id *)result;
    v4 = (void *)objc_msgSend(*(id *)(result + 8), "formatRequirements");
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    objc_msgSend(v5, "addObjectsFromArray:", &unk_1E4A00C50);
    if ((objc_msgSend(v3[20], "usesSceneClassifierToGateDetection") & 1) != 0
      || (objc_msgSend(v3[21], "usesSceneClassifierToGateDetection") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v3[22], "usesSceneClassifierToGateDetection");
    }
    objc_msgSend(v5, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(1, 0, 1, 1, 0, v6, 1, 1));
    objc_msgSend(v5, "addObjectsFromArray:", FigCaptureSupportedCompressedPixelFormatsForSettings(4, 3, 1, 1, 0, v6 | a2, 1, 1));
    objc_msgSend(v5, "addObjectsFromArray:", &unk_1E4A00C68);
    return objc_msgSend(v4, "setSupportedPixelFormats:", v5);
  }
  return result;
}

- (BWMetadataDetectorGatingNode)initWithSceneClassifierVersion:(id)a3 mrcEnabled:(BOOL)a4 appClipCodeEnabled:(BOOL)a5 textLocalizationEnabled:(BOOL)a6 lowPowerModeEnabled:(BOOL)a7 compressed8BitInputEnabled:(BOOL)a8
{
  unsigned int v8;
  BWMetadataDetectorGatingNode *v9;
  BWMetadataDetectorGatingNode *v10;
  BWMetadataDetectorGatingOutputController *mrcOutputController;
  BWMetadataDetectorGatingOutputController *appClipCodeOutputController;
  BWMetadataDetectorGatingOutputController *textLocalizationOutputController;

  v8 = a8;
  v9 = -[BWMetadataDetectorGatingNode initWithMRCEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:](self, "initWithMRCEnabled:appClipCodeEnabled:textLocalizationEnabled:lowPowerModeEnabled:compressed8BitInputEnabled:", a4, a5, a6, a7, a8);
  v10 = v9;
  if (v9)
  {
    v9->_sceneLock._os_unfair_lock_opaque = 0;
    v9->_needsSynchronization = 0;
    mrcOutputController = v9->_mrcOutputController;
    if (mrcOutputController)
    {
      -[BWMetadataDetectorGatingOutputController setUsesSceneClassifierToGateDetection:](mrcOutputController, "setUsesSceneClassifierToGateDetection:", 1);
      -[BWMetadataDetectorGatingOutputController setLogger:](v10->_mrcOutputController, "setLogger:", -[FigCaptureLogSmartCameraGating initWithGateIdentifier:]([FigCaptureLogSmartCameraGating alloc], "initWithGateIdentifier:", 0));
      BWSmartCameraSceneInitialize((uint64_t)&v10->_qrCodeScene, 1, 0, 2, (uint64_t)"QR", 0.06, 0.05, 0.75);
    }
    appClipCodeOutputController = v10->_appClipCodeOutputController;
    if (appClipCodeOutputController)
    {
      -[BWMetadataDetectorGatingOutputController setUsesSceneClassifierToGateDetection:](appClipCodeOutputController, "setUsesSceneClassifierToGateDetection:", 1);
      -[BWMetadataDetectorGatingOutputController setLogger:](v10->_appClipCodeOutputController, "setLogger:", -[FigCaptureLogSmartCameraGating initWithGateIdentifier:]([FigCaptureLogSmartCameraGating alloc], "initWithGateIdentifier:", 1));
      BWSmartCameraSceneInitialize((uint64_t)&v10->_appClipCodeScene, 1, 0, 2, (uint64_t)"AppClipCode", 0.108, 0.05, 0.75);
    }
    textLocalizationOutputController = v10->_textLocalizationOutputController;
    if (textLocalizationOutputController)
    {
      -[BWMetadataDetectorGatingOutputController setUsesSceneClassifierToGateDetection:](textLocalizationOutputController, "setUsesSceneClassifierToGateDetection:", 1);
      -[BWMetadataDetectorGatingOutputController setLogger:](v10->_textLocalizationOutputController, "setLogger:", -[FigCaptureLogSmartCameraGating initWithGateIdentifier:]([FigCaptureLogSmartCameraGating alloc], "initWithGateIdentifier:", 2));
      BWSmartCameraSceneInitialize((uint64_t)&v10->_textScene, 1, 0, 2, (uint64_t)"TextScene", 0.091, 0.05, 0.75);
    }
    -[BWMetadataDetectorGatingNode _updateInputRequirements:]((uint64_t)v10, v8);
  }
  return v10;
}

- (void)dealloc
{
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v4;

  transferSession = self->_transferSession;
  if (transferSession)
    CFRelease(transferSession);

  v4.receiver = self;
  v4.super_class = (Class)BWMetadataDetectorGatingNode;
  -[BWFanOutNode dealloc](&v4, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("MetadataDetectorGating");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  OpaqueVTPixelTransferSession *transferSession;
  objc_super v6;

  transferSession = self->_transferSession;
  if (transferSession)
  {
    CFRelease(transferSession);
    self->_transferSession = 0;
  }

  self->_outputBufferPool = 0;
  v6.receiver = self;
  v6.super_class = (Class)BWMetadataDetectorGatingNode;
  -[BWFanOutNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

- (uint64_t)_synchronizeOutputControllersWhenApplicable
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v1 = result;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = *(void **)(v1 + 184);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v5)
    goto LABEL_23;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v34;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      if (objc_msgSend(v10, "synchronizeWithOtherControllers"))
      {
        if ((objc_msgSend(v10, "forceSynchronizedControllersToRunDetectionImmediately") & 1) != 0)
        {
          v7 = 1;
          v11 = v3;
LABEL_10:
          objc_msgSend(v11, "addObject:", v10);
          continue;
        }
        if ((objc_msgSend(v10, "usesSceneClassifierToGateDetection") & 1) == 0)
        {
          v12 = objc_msgSend(v10, "lastDetectedCodesCount");
          v11 = v2;
          if (!v12)
            goto LABEL_10;
        }
      }
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      v22 = *MEMORY[0x1E0CA2E18];
      v16 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v2);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          v27 = v22;
          v28 = v16;
          objc_msgSend(v18, "setLastDetectionPTS:", &v27, v22);
        }
        v14 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v14);
    }
  }
LABEL_23:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (result)
  {
    v19 = result;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "setForceSynchronizedControllersToRunDetectionImmediately:", 0);
      }
      while (v19 != v21);
      result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      v19 = result;
    }
    while (result);
  }
  return result;
}

- (void)sceneDidChangeQRConfidence:(float)a3 appClipCodeConfidence:(float)a4 documentConfidence:(float)a5 textConfidence:(float)a6
{
  _BOOL8 confident;
  _BOOL8 v11;
  _BOOL8 v12;

  if (-[BWMetadataDetectorGatingOutputController usesSceneClassifierToGateDetection](self->_mrcOutputController, "usesSceneClassifierToGateDetection")|| -[BWMetadataDetectorGatingOutputController usesSceneClassifierToGateDetection](self->_appClipCodeOutputController, "usesSceneClassifierToGateDetection")|| -[BWMetadataDetectorGatingOutputController usesSceneClassifierToGateDetection](self->_textLocalizationOutputController, "usesSceneClassifierToGateDetection"))
  {
    os_unfair_lock_lock(&self->_sceneLock);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_qrCodeScene, a3);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_appClipCodeScene, a4);
    BWSmartCameraSceneUpdateWithConfidence((uint64_t)&self->_textScene, a6);
    confident = self->_qrCodeScene.confident;
    v11 = self->_appClipCodeScene.confident;
    v12 = self->_textScene.confident;
    os_unfair_lock_unlock(&self->_sceneLock);
    -[BWMetadataDetectorGatingOutputController setSmartCameraSceneConfident:](self->_mrcOutputController, "setSmartCameraSceneConfident:", confident);
    -[BWMetadataDetectorGatingOutputController setSmartCameraSceneConfident:](self->_appClipCodeOutputController, "setSmartCameraSceneConfident:", v11);
    -[BWMetadataDetectorGatingOutputController setSmartCameraSceneConfident:](self->_textLocalizationOutputController, "setSmartCameraSceneConfident:", v12);
  }
}

uint64_t __68__BWMetadataDetectorGatingNode__updateOutputRequirementsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  int IsFullRange;

  IsFullRange = FigCapturePixelFormatIsFullRange(objc_msgSend(*(id *)(a1 + 32), "pixelFormat"));
  return IsFullRange ^ FigCapturePixelFormatIsFullRange(objc_msgSend(a2, "intValue")) ^ 1;
}

- (uint64_t)_ensureOutputBufferPoolWithDimensions:(uint64_t)a1
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  BWVideoFormatRequirements *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  BWPixelBufferPool *v13;
  BWVideoFormatRequirements *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = HIDWORD(a2);
  if (*(_QWORD *)(a1 + 232) == a2)
    return 0;
  v6 = (void *)MEMORY[0x1A858DD40]();
  v7 = (const __CFString *)objc_msgSend((id)a1, "name");
  v8 = objc_alloc_init(BWVideoFormatRequirements);
  if (FigCapturePixelFormatIsFullRange(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "videoFormat"), "pixelFormat")))
    v9 = 875704422;
  else
    v9 = 875704438;
  -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", (int)a2);
  -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", a2 >> 32);
  v16[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v9);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1));
  v15 = v8;
  v10 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1));
  if (v10)
  {
    v11 = v10;
    if (!v7)
      v7 = CFSTR("MRC PixelTransfer");

    if (*(_BYTE *)(a1 + 192))
      v12 = 1;
    else
      v12 = 2;
    v13 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", v11, v12, v7, objc_msgSend(*(id *)(a1 + 16), "memoryPool"));
    v5 = 0;
    *(_QWORD *)(a1 + 224) = v13;
    *(_DWORD *)(a1 + 232) = a2;
    *(_DWORD *)(a1 + 236) = v4;
  }
  else
  {
    v5 = FigSignalErrorAt();
  }
  objc_autoreleasePoolPop(v6);
  return v5;
}

@end
