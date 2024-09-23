@implementation BWStillImageScalerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWVideoFormatRequirements *v6;
  uint64_t height;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  float v15;
  BWNodeInputMediaConfiguration *v16;
  BWNodeOutputMediaConfiguration *v17;
  char v18;
  BWVideoFormatRequirements *v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  _QWORD v28[3];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v28[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1));
  if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)&self->_resizedOutputDimensions))
  {
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", self->_resizedOutputDimensions.width);
    height = self->_resizedOutputDimensions.height;
  }
  else
  {
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", objc_msgSend(a3, "width"));
    height = objc_msgSend(a3, "height");
  }
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", height);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v6, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v27 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v8 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  }
  else
  {
    v8 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v6, "setSupportedColorSpaceProperties:", v8);
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v6);
  -[BWNodeInput setPassthroughMode:](self->super._input, "setPassthroughMode:", 0);
  -[BWNodeOutput setPassthroughMode:](self->super._output, "setPassthroughMode:", 0);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (-[NSDictionary count](self->_mainImageDownscalingFactorByAttachedMediaKey, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", -[NSDictionary allKeys](self->_mainImageDownscalingFactorByAttachedMediaKey, "allKeys"));
  if (-[NSDictionary count](self->_outputSizeByAttachedMediaKey, "count"))
    objc_msgSend(v9, "addObjectsFromArray:", -[NSDictionary allKeys](self->_outputSizeByAttachedMediaKey, "allKeys"));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    obj = v9;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_mainImageDownscalingFactorByAttachedMediaKey, "objectForKeyedSubscript:", v14), "floatValue");
        if (v15 == 0.0
          && !-[NSDictionary objectForKeyedSubscript:](self->_outputSizeByAttachedMediaKey, "objectForKeyedSubscript:", v14))
        {
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", 0, v14);
          v17 = 0;
        }
        else
        {
          v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v16, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
          -[BWNodeInputMediaConfiguration setPassthroughMode:](v16, "setPassthroughMode:", 0);
          -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](self->super._input, "setMediaConfiguration:forAttachedMediaKey:", v16, v14);
          v17 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          v18 = objc_msgSend(v14, "isEqualToString:", 0x1E495B278);
          v19 = v6;
          if ((v18 & 1) == 0)
            v19 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", v19);
          -[BWNodeOutputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 1);
        }
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](self->super._output, "setMediaConfiguration:forAttachedMediaKey:", v17, v14);
        ++v13;
      }
      while (v11 != v13);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v11 = v20;
    }
    while (v20);
  }
}

- (id)nodeType
{
  return CFSTR("Converter");
}

- (void)setOutputSizeByAttachedMediaKey:(id)a3
{
  NSDictionary *outputSizeByAttachedMediaKey;

  outputSizeByAttachedMediaKey = self->_outputSizeByAttachedMediaKey;
  if (outputSizeByAttachedMediaKey != a3)
  {

    self->_outputSizeByAttachedMediaKey = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setMainImageDownscalingFactorByAttachedMediaKey:(id)a3
{
  NSDictionary *mainImageDownscalingFactorByAttachedMediaKey;

  mainImageDownscalingFactorByAttachedMediaKey = self->_mainImageDownscalingFactorByAttachedMediaKey;
  if (mainImageDownscalingFactorByAttachedMediaKey != a3)
  {

    self->_mainImageDownscalingFactorByAttachedMediaKey = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setEnforcesZoomingForPortraitCaptures:(BOOL)a3
{
  self->_enforcesZoomingForPortraitCaptures = a3;
}

- (void)setBackPressureDrivenPipelining:(BOOL)a3
{
  self->_backPressureDrivenPipelining = a3;
}

- (void)setBlackFillingRequired:(BOOL)a3
{
  _BOOL4 v3;
  BWFormatRequirements *v5;
  void *v6;

  v3 = a3;
  if (FigCapturePlatformSupportsUniversalCompression())
  {
    v5 = -[BWNodeInput formatRequirements](self->super._input, "formatRequirements");
    if (v3)
      v6 = &unk_1E4A00368;
    else
      v6 = 0;
    -[BWFormatRequirements setSupportedPixelFormats:](v5, "setSupportedPixelFormats:", v6);
  }
  self->_blackFillingRequired = v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWStillImageScalerNode)initWithBasePoolCapacity:(int)a3 nodeConfiguration:(id)a4
{
  BWStillImageScalerNode *v6;
  BWNodeInput *v7;
  BWVideoFormatRequirements *v8;
  BWNodeOutput *v9;
  BWVideoFormatRequirements *v10;
  objc_super v12;

  if (a3 <= 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("baseCapacity must be >= 1"), 0));
  v12.receiver = self;
  v12.super_class = (Class)BWStillImageScalerNode;
  v6 = -[BWNode init](&v12, sel_init);
  if (v6)
  {
    v6->_nodeConfiguration = (BWStillImageNodeConfiguration *)a4;
    v7 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v6);
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeInput setFormatRequirements:](v7, "setFormatRequirements:", v8);
    -[BWNodeInput setPassthroughMode:](v7, "setPassthroughMode:", 2);

    -[BWNode addInput:](v6, "addInput:", v7);
    v9 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v6);
    v10 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v9, "setFormatRequirements:", v10);
    -[BWNodeOutput setPassthroughMode:](v9, "setPassthroughMode:", 2);

    -[BWNode addOutput:](v6, "addOutput:", v9);
    -[BWNodeOutput setProvidesPixelBufferPool:](v9, "setProvidesPixelBufferPool:", 0);

    v6->_poolBaseCapacity = a3;
  }
  return v6;
}

- (void)dealloc
{
  opaqueCMFormatDescription *outputFormatDescription;
  objc_super v4;

  -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, 0);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription)
    CFRelease(outputFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageScalerNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (void)_purgeResourcesLeavingThemForMediaToProcess:(uint64_t)a1
{
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  const void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1 && (*(_QWORD *)(a1 + 120) || objc_msgSend(*(id *)(a1 + 160), "count")))
  {
    objc_msgSend(a2, "count");
    if ((objc_msgSend(a2, "containsObject:", CFSTR("PrimaryFormat")) & 1) == 0)
    {
      v4 = *(void **)(a1 + 120);
      if (v4)
      {

        *(_QWORD *)(a1 + 120) = 0;
        v5 = *(const void **)(a1 + 128);
        if (v5)
        {
          CFRelease(v5);
          *(_QWORD *)(a1 + 128) = 0;
        }
      }
    }
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = *(void **)(a1 + 160);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(a2, "containsObject:", v12) & 1) == 0)
            objc_msgSend(v6, "addObject:", v12);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    objc_msgSend(*(id *)(a1 + 160), "removeObjectsForKeys:", v6);
    if (!objc_msgSend(*(id *)(a1 + 160), "count"))
    {
      v13 = *(const void **)(a1 + 168);
      if (v13)
      {
        CFRelease(v13);
        *(_QWORD *)(a1 + 168) = 0;
      }
    }
  }
}

- (void)setResizedOutputDimensions:(id)a3
{
  self->_resizedOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)resizedOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_resizedOutputDimensions;
}

- (id)nodeSubType
{
  return CFSTR("VideoConverter");
}

- (BOOL)blackFillingRequired
{
  return self->_blackFillingRequired;
}

- (BOOL)enforcesZoomingForPortraitCaptures
{
  return self->_enforcesZoomingForPortraitCaptures;
}

- (id)mainImageDownscalingFactorByAttachedMediaKey
{
  return self->_mainImageDownscalingFactorByAttachedMediaKey;
}

- (uint64_t)mainImageDownscalingFactorForAttachedMediaKey:(void *)a3 attachedMediaMetadata:
{
  uint64_t v4;
  float v5;

  if (result)
  {
    v4 = result;
    result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FB8]), "floatValue");
    if (v5 == 0.0)
      return objc_msgSend((id)objc_msgSend(*(id *)(v4 + 144), "objectForKeyedSubscript:", a2), "floatValue");
  }
  return result;
}

- (id)outputSizeByAttachedMediaKey
{
  return self->_outputSizeByAttachedMediaKey;
}

- (BOOL)backPressureDrivenPipelining
{
  return self->_backPressureDrivenPipelining;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  objc_super v5;

  -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, 0);
  v5.receiver = self;
  v5.super_class = (Class)BWStillImageScalerNode;
  -[BWNode didReachEndOfDataForInput:](&v5, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  _DWORD *v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CFTypeRef v11;
  CFTypeRef v12;
  void *v13;
  void *v14;
  void *v15;
  __CVBuffer *ImageBuffer;
  unint64_t v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  int v28;
  void *v29;
  int v30;
  CFDictionaryRef DictionaryRepresentation;
  __CVBuffer *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  CVImageBufferRef v41;
  __CVBuffer *v42;
  uint64_t CopyWithNewPixelBuffer;
  uint64_t v44;
  NSObject *v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t v49;
  unint64_t v50;
  const char *v51;
  CGFloat v52;
  CFDictionaryRef v53;
  double v54;
  unint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  CFTypeRef v63;
  int64_t v64;
  id v65;
  void *v66;
  id v67;
  int v68;
  CGRect v69;
  __int128 v70;
  __int128 v71;
  CMAttachmentBearerRef target;
  _BYTE v73[128];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  CGSize v79;

  v78 = *MEMORY[0x1E0C80C00];
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  target = 0;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v70 = *MEMORY[0x1E0C9D648];
  v71 = v8;
  v9 = (double)-[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width");
  v10 = (double)-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
  v69.origin.x = 0.0;
  v69.origin.y = 0.0;
  v69.size.width = v9;
  v69.size.height = v10;
  v68 = 0;
  v67 = 0;
  if (a3 && (v11 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)) != 0)
  {
    v12 = v11;
    v13 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    v14 = v13;
    v63 = v12;
    if (v13)
    {
      v15 = (void *)objc_msgSend(v13, "requestedSettings");
      ImageBuffer = CMSampleBufferGetImageBuffer(a3);
      v17 = psn_pixelBufferDimensions(ImageBuffer);
      v64 = -[BWStillImageScalerNode _resolveOutputDimensionsForSampleBuffer:settings:inputDimensions:]((unint64_t)self, a3, v15, v17);
      FigCFDictionaryGetCGRectIfPresent();
      v66 = v14;
      if (dword_1ECFE98B0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v19 = -[BWStillImageScalerNode _attachedMediaKeysThatRequireDifferentScalingThanPrimaryMediaSampleBuffer:primaryMediaNormalizedInputCropRect:primaryMediaRequestedOutputWidth:primaryMediaRequestedOutputHeight:](self, a3, (int)v64, v64 >> 32, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
      v20 = -[BWStillImageScalerNode _resolveScalerModeWithSettings:inputDimensions:outputDimensions:normalizedInputCropRect:attachedMediaThatRequiresDifferentScalingThanPrimaryMedia:stillImageScalerModeOut:scaledDenormalizedInputCropRectOut:mediaToProcessOut:]((uint64_t)self, v15, v17, v64, v19, &v68, &v69.origin.x, (uint64_t *)&v67, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
      if ((_DWORD)v20)
      {
        v34 = v20;
        v32 = 0;
        DictionaryRepresentation = 0;
        LOBYTE(v30) = 1;
        goto LABEL_62;
      }
      v59 = v17;
      v61 = v15;
      v21 = v67;
      v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v67);
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v77 = 0u;
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v75;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v75 != v25)
              objc_enumerationMutation(v21);
            v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
            if ((objc_msgSend(v27, "isEqualToString:", CFSTR("PrimaryFormat"), v57, v58) & 1) == 0
              && !BWSampleBufferGetAttachedMedia(a3, (uint64_t)v27))
            {
              objc_msgSend(v22, "removeObject:", v27);
            }
          }
          v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v74, v73, 16);
        }
        while (v24);
      }
      v67 = (id)objc_msgSend(v22, "copy", v57);
      v28 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("NonProcessedReferenceFrame"), 0), "BOOLValue");
      if (v28)
      {
        v29 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v67);
        objc_msgSend(v29, "removeObject:", CFSTR("PrimaryFormat"));
        v67 = v29;
      }
      if (objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageBufferFrameType"), 0), "unsignedLongLongValue") == 40)
        v30 = 1;
      else
        v30 = v28 ^ 1;
      v14 = v66;
      if (v30 == 1)
        -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, v67);
      DictionaryRepresentation = 0;
      v32 = 0;
      switch(v68)
      {
        case 0:
          goto LABEL_52;
        case 1:
          goto LABEL_58;
        case 2:
          goto LABEL_34;
        case 3:
        case 4:
          v32 = CMSampleBufferGetImageBuffer(a3);
          if (!v32)
            goto LABEL_53;
          if (dword_1ECFE98B0)
          {
            v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          v35 = VTFillPixelBufferBorderWithBlack();
          if ((_DWORD)v35)
            goto LABEL_79;
          CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05E78], MEMORY[0x1E0C9AAB0], 1u);
          v36 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v67);
          objc_msgSend(v36, "removeObject:", CFSTR("PrimaryFormat"));
          -[BWStillImageScalerNode _blackenBorderForAttachedMedia:sampleBuffer:normalizedInputCropRect:requestedSettings:]((uint64_t)self, v36, a3, v61, *(CGFloat *)&v70, *((CGFloat *)&v70 + 1), *(CGFloat *)&v71, *((CGFloat *)&v71 + 1));
          if (v68 != 4)
          {
            DictionaryRepresentation = 0;
            v32 = 0;
            goto LABEL_58;
          }
          v69.origin.x = 0.0;
          v69.origin.y = 0.0;
          v69.size.width = (double)(int)v59;
          v69.size.height = (double)SHIDWORD(v59);
LABEL_34:
          v37 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v67, v57, v58);
          objc_msgSend(v37, "removeObject:", CFSTR("PrimaryFormat"));
          v38 = objc_msgSend(v67, "containsObject:", CFSTR("PrimaryFormat"));
          v39 = objc_msgSend(v37, "count");
          if (!v38)
          {
            DictionaryRepresentation = 0;
            v32 = 0;
            if (!v39)
              goto LABEL_58;
            goto LABEL_57;
          }
          v60 = v39;
          v62 = v37;
          if ((int)v64 == -[BWPixelBufferPool width](self->_pool, "width")
            && v64 >> 32 == -[BWPixelBufferPool height](self->_pool, "height"))
          {
            v40 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:]((uint64_t)self, v66, v64);
            if (-[BWPixelBufferPool capacity](self->_pool, "capacity") != v40)
              -[BWPixelBufferPool setCapacity:](self->_pool, "setCapacity:", v40);
          }
          else
          {
            v35 = -[BWStillImageScalerNode _rebuildPrimaryFormatBufferPoolForOutputDimensions:settings:]((uint64_t)self, v64, v66);
            if ((_DWORD)v35)
              goto LABEL_79;
          }
          if (self->_scalingSession
            || (v35 = -[BWStillImageScalerNode _buildPrimaryFormatScalingSession]((uint64_t)self), !(_DWORD)v35))
          {
            v41 = CMSampleBufferGetImageBuffer(a3);
            if (!v41)
            {
LABEL_52:
              v32 = 0;
LABEL_53:
              DictionaryRepresentation = 0;
              goto LABEL_54;
            }
            v42 = v41;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NewPixelBuffer-%@"), CFSTR("PrimaryFormat"));
            v32 = -[BWPixelBufferPool newPixelBuffer](self->_pool, "newPixelBuffer");
            if (!v32)
            {
              v58 = v4;
              LODWORD(v57) = 0;
              FigDebugAssert3();
              DictionaryRepresentation = 0;
              v34 = 4294954510;
              goto LABEL_62;
            }
            CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v32, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&target);
            if (!(_DWORD)CopyWithNewPixelBuffer)
            {
              v65 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(target);
              DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v69);
              if (DictionaryRepresentation)
              {
                v44 = VTSessionSetProperty(self->_scalingSession, (CFStringRef)*MEMORY[0x1E0CED850], DictionaryRepresentation);
                if (!(_DWORD)v44)
                {
                  if (dword_1ECFE98B0)
                  {
                    v45 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                    v14 = v66;
                  }
                  v44 = VTPixelTransferSessionTransferImage(self->_scalingSession, v42, v32);
                  if (!(_DWORD)v44)
                  {
                    CVBufferRemoveAttachment(v32, (CFStringRef)*MEMORY[0x1E0CA8D50]);
                    v46 = -[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width");
                    v47 = -[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height");
                    v48 = -[BWPixelBufferPool width](self->_pool, "width");
                    v49 = v46 | ((unint64_t)v47 << 32);
                    v50 = v48 | ((unint64_t)-[BWPixelBufferPool height](self->_pool, "height") << 32);
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v65, v49, v50, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
                    FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v65, v49, v50);
                    BWUpdateLandmarksForStillImageCrop(target, 801, *(double *)&v70, *((double *)&v70 + 1), *(double *)&v71, *((double *)&v71 + 1));
                    FigCaptureMetadataUtilitiesPreventFurtherCropping(v65, v51);
                    -[BWMemoryAnalyticsPayload setScaledStillCaptureTaken:](-[BWGraph memoryAnalyticsPayload](-[BWNode graph](self, "graph"), "memoryAnalyticsPayload"), "setScaledStillCaptureTaken:", 1);
                    v52 = (double)-[BWPixelBufferPool width](self->_pool, "width");
                    v79.height = (double)-[BWPixelBufferPool height](self->_pool, "height");
                    v79.width = v52;
                    v53 = CGSizeCreateDictionaryRepresentation(v79);
                    CMSetAttachment(target, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), v53, 1u);

                    v54 = (double)-[BWPixelBufferPool width](self->_pool, "width");
                    v55 = -[BWPixelBufferPool height](self->_pool, "height");
                    BWUpdateCameraIntrinsicsMatrixOnSampleBuffer(target, CFSTR("OriginalCameraIntrinsicMatrix"), 0, 0, v69.origin.x, v69.origin.y, v69.size.width, v69.size.height, 0.0, 0.0, v54, (double)v55);
                    a3 = (opaqueCMSampleBuffer *)target;
                    v37 = v62;
                    if (v60)
LABEL_57:
                      -[BWStillImageScalerNode _zoomAttachedMedia:sampleBuffer:]((uint64_t)self, v37, a3);
LABEL_58:
                    if (a3)
                    {
                      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
                      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                      if (!v30)
                        goto LABEL_66;
                      goto LABEL_64;
                    }
                    v34 = 0;
                    goto LABEL_62;
                  }
                }
                v34 = v44;
LABEL_62:
                v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
                goto LABEL_63;
              }
LABEL_54:
              v34 = 4294954516;
              goto LABEL_62;
            }
            v34 = CopyWithNewPixelBuffer;
LABEL_83:
            DictionaryRepresentation = 0;
            goto LABEL_62;
          }
LABEL_79:
          v34 = v35;
          v32 = 0;
          goto LABEL_83;
        default:
          v34 = 0;
          v32 = 0;
          goto LABEL_62;
      }
    }
    v32 = 0;
  }
  else
  {
    v32 = 0;
    v14 = 0;
    v63 = 0;
  }
  DictionaryRepresentation = 0;
  LOBYTE(v30) = 1;
  v34 = 4294954516;
LABEL_63:
  v56 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v34, self, v14, v63, v57, v58);
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v56);

  if ((v30 & 1) == 0)
    goto LABEL_66;
LABEL_64:
  if (-[BWStillImageScalerNode _shouldPurgeAllResourcesAfterProcessingSettings:]((uint64_t)self, v14))
    -[BWStillImageScalerNode _purgeResourcesLeavingThemForMediaToProcess:]((uint64_t)self, 0);
LABEL_66:
  if (DictionaryRepresentation)
    CFRelease(DictionaryRepresentation);
  if (v32)
    CFRelease(v32);
  if (target)
    CFRelease(target);
  if (*v7 == 1)
    kdebug_trace();
}

- (unint64_t)_resolveOutputDimensionsForSampleBuffer:(void *)a3 settings:(uint64_t)a4 inputDimensions:
{
  unint64_t v4;
  void *v8;
  int v9;
  void *v10;
  int v11;
  BOOL v12;
  float v14;
  float v15;
  unint64_t v16;
  int v17;
  unint64_t v19;

  v4 = a1;
  if (a1)
  {
    v8 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v9 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageBufferFrameType"), 0), "unsignedIntValue");
    v10 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D05FB0]);
    v11 = BWStillImageProcessingFlagsForSampleBuffer(target);
    if (objc_msgSend(*(id *)(v4 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled"))
      v12 = v9 == 13;
    else
      v12 = 0;
    if (v12)
    {
      v16 = FigCaptureMetadataUtilitiesEnforceAspectRatioWithStillImageDimensions(a4, (double)objc_msgSend(a3, "outputWidth")/ (double)objc_msgSend(a3, "outputHeight"));
      LODWORD(v4) = v16;
      a1 = HIDWORD(v16);
    }
    else if (!FigCaptureVideoDimensionsAreValid(objc_msgSend(*(id *)(v4 + 96), "stereoPhotoOutputDimensions"))
           || (v11 & 0x100000) == 0)
    {
      if (v10)
      {
        objc_msgSend(v10, "floatValue");
        v15 = v14;
        v4 = (unint64_t)(float)(v14 * (float)objc_msgSend(a3, "outputWidth"));
        a1 = (unint64_t)(float)(v15 * (float)objc_msgSend(a3, "outputHeight"));
      }
      else if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)(v4 + 180)))
      {
        v19 = v4 + 180;
        LODWORD(v4) = *(_DWORD *)(v4 + 180);
        a1 = *(unsigned int *)(v19 + 4);
      }
      else
      {
        LODWORD(v4) = objc_msgSend(a3, "outputWidth");
        a1 = objc_msgSend(a3, "outputHeight");
      }
    }
    else
    {
      v17 = objc_msgSend(*(id *)(v4 + 96), "stereoPhotoOutputDimensions");
      a1 = (unint64_t)objc_msgSend(*(id *)(v4 + 96), "stereoPhotoOutputDimensions") >> 32;
      LODWORD(v4) = v17;
    }
  }
  return v4 | (a1 << 32);
}

- (void)_attachedMediaKeysThatRequireDifferentScalingThanPrimaryMediaSampleBuffer:(unint64_t)a3 primaryMediaNormalizedInputCropRect:(unint64_t)a4 primaryMediaRequestedOutputWidth:(CGFloat)a5 primaryMediaRequestedOutputHeight:(CGFloat)a6
{
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const void *v15;
  uint64_t v16;
  void *v17;
  void *AttachedMedia;
  void *v19;
  float v20;
  float v21;
  unint64_t v22;
  double FinalCropRect;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int64_t v30;
  int64_t v31;
  _BOOL4 v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id obj;
  const __CFString *key;
  uint64_t v47;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v57 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v11 = (uint64_t)result;
    v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v44 = (void *)CMGetAttachment(a2, CFSTR("StillSettings"), 0);
    v12 = (void *)objc_msgSend(v44, "requestedSettings");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    obj = (id)BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (!v13)
      goto LABEL_35;
    v14 = v13;
    v47 = *(_QWORD *)v53;
    key = (const __CFString *)*MEMORY[0x1E0D05CB0];
    v15 = a2;
    while (1)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v53 != v47)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v16);
        AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a2, (uint64_t)v17);
        v19 = (void *)CMGetAttachment(AttachedMedia, key, 0);
        -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v11, (uint64_t)v17, v19);
        v21 = v20;
        if (objc_msgSend(*(id *)(v11 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled"))
          v22 = ((unint64_t)objc_msgSend((id)objc_msgSend(v44, "captureSettings"), "captureFlags") >> 11) & 1;
        else
          LODWORD(v22) = 0;
        FinalCropRect = FigCaptureMetadataUtilitiesGetFinalCropRect();
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v30 = BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)AttachedMedia);
        v31 = -[BWStillImageScalerNode _outputDimensionsForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:primaryMediaWidth:primaryMediaHeight:requestedWidth:requestedHeight:zoomWithoutUpscalingEnabled:normalizedZoomRect:optimizedEnhancedResolutionDepthCapture:](v11, v17, a3, a4, objc_msgSend(v12, "outputWidth"), objc_msgSend(v12, "outputHeight"), objc_msgSend(v12, "isZoomWithoutUpscalingEnabled"), v22, v21, FinalCropRect, v25, v27, v29);
        v32 = (objc_msgSend(v17, "isEqualToString:", 0x1E495B258) & 1) == 0
           && (objc_msgSend(v17, "isEqualToString:", 0x1E495B2D8) & 1) == 0
           && (objc_msgSend(v17, "isEqualToString:", 0x1E495B298) & 1) == 0
           && (objc_msgSend(v17, "isEqualToString:", 0x1E495B2F8) & 1) == 0
           && !objc_msgSend(v17, "isEqualToString:", 0x1E495B318);
        v58.origin.x = FinalCropRect;
        v58.origin.y = v25;
        v58.size.width = v27;
        v58.size.height = v29;
        v60.origin.x = a5;
        v60.origin.y = a6;
        v60.size.width = a7;
        v60.size.height = a8;
        a2 = v15;
        if (CGRectEqualToRect(v58, v60) && FigCaptureVideoDimensionsAreEqual(v30, v31))
        {
          v61.origin.x = 0.0;
          v61.origin.y = 0.0;
          v61.size.width = 1.0;
          v61.size.height = 1.0;
          v59.origin.x = FinalCropRect;
          v59.origin.y = v25;
          v59.size.width = v27;
          v59.size.height = v29;
          if (CGRectEqualToRect(v59, v61) || v32)
            goto LABEL_31;
LABEL_22:
          v33 = v27 / v29;
          goto LABEL_23;
        }
        if (!v32)
          goto LABEL_22;
        v33 = (double)(int)v31 / (double)SHIDWORD(v31);
LABEL_23:
        if (v21 == 0.0)
        {
          if (!objc_msgSend(*(id *)(v11 + 152), "objectForKeyedSubscript:", v17))
            goto LABEL_31;
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)v30, v30 >> 32, FinalCropRect, v25, v27, v29, v33);
        }
        else
        {
          v34 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia((int)v30, v30 >> 32, FinalCropRect, v25, v27, v29, v33, v21);
        }
        v38 = v34;
        v39 = v35;
        v40 = v36;
        v41 = v37;
        if (CGRectIsNull(*(CGRect *)&v34))
          FigDebugAssert3();
        if (!sis_encoderCanCropDenormalizedZoomRect((int)v31, v31 >> 32, v38, v39, v40, v41))
        {
          FigCaptureVideoDimensionsAreEqual(v30, v31);
          objc_msgSend(v43, "addObject:", v17);
        }
LABEL_31:
        ++v16;
      }
      while (v14 != v16);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      v14 = v42;
      if (!v42)
      {
LABEL_35:

        if (objc_msgSend(v43, "count"))
          return v43;
        else
          return 0;
      }
    }
  }
  return result;
}

- (uint64_t)_resolveScalerModeWithSettings:(uint64_t)a3 inputDimensions:(uint64_t)a4 outputDimensions:(void *)a5 normalizedInputCropRect:(int *)a6 attachedMediaThatRequiresDifferentScalingThanPrimaryMedia:(double *)a7 stillImageScalerModeOut:(uint64_t *)a8 scaledDenormalizedInputCropRectOut:(CGFloat)a9 mediaToProcessOut:(CGFloat)a10
{
  uint64_t v12;
  int v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 v25;
  unint64_t v26;
  _BOOL4 v27;
  unint64_t v28;
  _BOOL4 v29;
  int v30;
  double x;
  double y;
  double width;
  double height;
  int v35;
  _BOOL4 v36;
  int v37;
  int v38;
  void *v40;
  uint64_t v41;
  int v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v48;
  CGRect v49;
  CGRect v50;

  if (result)
  {
    v12 = result;
    result = 0;
    if (a6)
    {
      if (a7 && a8)
      {
        v48 = objc_msgSend((id)objc_msgSend(a2, "bravoConstituentImageDeliveryDeviceTypes"), "count");
        v22 = objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "pixelFormat");
        v23 = (a4 & 0x1F000000000) == 0 || (a4 & 0x1F0) == 0;
        if (FigCapturePixelFormatGetCompressionType(v22))
          v24 = v23;
        else
          v24 = 0;
        v45 = a5;
        v25 = objc_msgSend(a2, "outputFormat") == 1785750887
           || objc_msgSend(a2, "outputFormat") == 1752589105;
        v26 = (int)a4;
        v27 = FigCapturePixelFormatIsDemosaicedRaw(objc_msgSend(a2, "rawOutputFormat"))
           && objc_msgSend(a2, "outputFormat") == 0;
        v28 = a4 >> 32;
        v29 = v26 == objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "width")
           && v28 == objc_msgSend((id)objc_msgSend(*(id *)(v12 + 8), "videoFormat"), "height");
        if (*(_BYTE *)(v12 + 137))
          v30 = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(a2, "processedImageFilters"));
        else
          v30 = 0;
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect((int)a3, a3 >> 32, a9, a10, a11, a12, (double)v26 / (double)v28);
        x = v49.origin.x;
        y = v49.origin.y;
        width = v49.size.width;
        height = v49.size.height;
        if (CGRectIsNull(v49))
        {
          FigDebugAssert3();
          return 4294954516;
        }
        else
        {
          v35 = v25 || v27;
          v50.origin.x = a9;
          v50.origin.y = a10;
          v50.size.width = a11;
          v50.size.height = a12;
          if (CGRectIsEmpty(v50))
          {
            v36 = 0;
          }
          else
          {
            v36 = 1;
            if (round(x) <= 0.0 && round(y) <= 0.0 && round(x + width) >= (double)(int)a3)
              v36 = round(y + height) < (double)SHIDWORD(a3);
          }
          if (!v35)
            goto LABEL_30;
          v37 = !sis_encoderCanCropDenormalizedZoomRect(v26, v28, x, y, width, height) || v29;
          if (v48)
            v37 = 1;
          if ((v37 | v24 | v30) != 1)
          {
            v44 = objc_msgSend(v45, "count");
            if (v44)
              v42 = 2;
            else
              v42 = 1;
            if (v44)
              v41 = (uint64_t)v45;
            else
              v41 = 0;
          }
          else
          {
LABEL_30:
            v38 = v36 || !v29 || v24;
            if (v38 != 1 || v48 == 0)
            {
              if (v38)
              {
                v40 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(*(id *)(v12 + 144), "allKeys"));
                objc_msgSend(v40, "addObjectsFromArray:", objc_msgSend(*(id *)(v12 + 152), "allKeys"));
                objc_msgSend(v40, "addObject:", CFSTR("PrimaryFormat"));
                v41 = objc_msgSend(v40, "allObjects");
                v42 = 2;
              }
              else
              {
                v41 = 0;
                v42 = !v24;
              }
            }
            else
            {
              if (v29)
                v42 = 3;
              else
                v42 = 4;
              v43 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(*(id *)(v12 + 144), "allKeys"));
              objc_msgSend(v43, "addObjectsFromArray:", objc_msgSend(*(id *)(v12 + 152), "allKeys"));
              objc_msgSend(v43, "addObject:", CFSTR("PrimaryFormat"));
              v41 = objc_msgSend(v43, "allObjects");
            }
          }
          result = 0;
          *a6 = v42;
          *a7 = x;
          a7[1] = y;
          a7[2] = width;
          a7[3] = height;
          *a8 = v41;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_blackenBorderForAttachedMedia:(const void *)a3 sampleBuffer:(void *)a4 normalizedInputCropRect:(CGFloat)a5 requestedSettings:(CGFloat)a6
{
  uint64_t v8;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v20;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v22;
  void *v23;
  float v24;
  float v25;
  double v26;
  double v27;
  size_t v29;
  size_t v30;
  CGFloat x;
  CGFloat y;
  CGFloat v33;
  CGFloat v34;
  __int128 v35;
  size_t Width;
  size_t Height;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  const __CFString *v50;
  const __CFString *key;
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  CGFloat v59[15];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v61 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v14 = a2;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v53 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (!v53)
  {
    v16 = 0;
    goto LABEL_34;
  }
  v16 = 0;
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  v52 = *(_QWORD *)v55;
  v47 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v48 = *MEMORY[0x1E0C9D628];
  v45 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v46 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v50 = (const __CFString *)*MEMORY[0x1E0D05E78];
  v43 = v14;
  v44 = a4;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v55 != v52)
        objc_enumerationMutation(v14);
      v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v17);
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, v18);
      if (AttachedMedia)
      {
        v20 = AttachedMedia;
        ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
        if (!ImageBuffer)
          goto LABEL_28;
        v22 = ImageBuffer;
        v23 = (void *)CMGetAttachment(v20, key, 0);
        -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](a1, v18, v23);
        v25 = v24;
        if (v24 == 0.0 && !objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", v18))
          goto LABEL_28;
        v26 = (double)objc_msgSend(a4, "outputWidth", v41, v42);
        v27 = v26 / (double)objc_msgSend(a4, "outputHeight");
        if (v25 == 0.0)
        {
          v35 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
          v58 = *MEMORY[0x1E0C9D628];
          *(_OWORD *)v59 = v35;
          y = v47;
          x = v48;
          v34 = v45;
          v33 = v46;
          if (FigCFDictionaryGetCGRectIfPresent())
          {
            Width = CVPixelBufferGetWidth(v22);
            Height = CVPixelBufferGetHeight(v22);
            FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, *(CGFloat *)&v58, *((CGFloat *)&v58 + 1), v59[0], v59[1], v27);
            x = v63.origin.x;
            y = v63.origin.y;
            v33 = v63.size.width;
            v34 = v63.size.height;
            if (CGRectIsNull(v63))
            {
              v42 = v8;
              LODWORD(v41) = 0;
LABEL_30:
              FigDebugAssert3();
            }
          }
        }
        else
        {
          if (v25 != 1.0 && v25 != 2.0)
          {
            v16 = 4294954516;
LABEL_28:
            BWSampleBufferRemoveAttachedMedia(a3, v18);
            goto LABEL_26;
          }
          v29 = CVPixelBufferGetWidth(v22);
          v30 = CVPixelBufferGetHeight(v22);
          v62.origin.x = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(v29, v30, a5, a6, a7, a8, v27, v25);
          x = v62.origin.x;
          y = v62.origin.y;
          v33 = v62.size.width;
          v34 = v62.size.height;
          if (CGRectIsNull(v62))
          {
            v42 = v8;
            LODWORD(v41) = 0;
            goto LABEL_30;
          }
        }
        v64.origin.x = x;
        v64.origin.y = y;
        v64.size.width = v33;
        v64.size.height = v34;
        if (CGRectIsNull(v64))
          goto LABEL_25;
        if (dword_1ECFE98B0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          v14 = v43;
          a4 = v44;
        }
        v16 = VTFillPixelBufferBorderWithBlack();
        if (!(_DWORD)v16)
        {
LABEL_25:
          CMSetAttachment(v20, v50, MEMORY[0x1E0C9AAB0], 1u);
          goto LABEL_26;
        }
        goto LABEL_28;
      }
LABEL_26:
      ++v17;
    }
    while (v53 != v17);
    v39 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    v53 = v39;
  }
  while (v39);
LABEL_34:
  -[BWStillImageScalerNode _removeUnmodifiedAttachedMedias:](a1, a3);
  return v16;
}

- (uint64_t)_rebuildPrimaryFormatBufferPoolForOutputDimensions:(void *)a3 settings:
{
  uint64_t v5;
  BWVideoFormatRequirements *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  int CompressionType;
  BOOL v12;
  id v13;
  id v14;
  BWPixelBufferPool *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BWVideoFormatRequirements *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v5 = result;
    v6 = objc_alloc_init(BWVideoFormatRequirements);
    v7 = objc_msgSend((id)v5, "name");
    if (v7)
      v8 = (const __CFString *)v7;
    else
      v8 = CFSTR("StillImageScaler");
    v9 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](v5, a3, a2);
    v10 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "pixelFormat");
    CompressionType = FigCapturePixelFormatGetCompressionType(objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "pixelFormat"));
    v12 = (a2 & 0x1F000000000) == 0 || (a2 & 0x1F0) == 0;
    if (v12 && CompressionType)
      v10 = FigCaptureUncompressedPixelFormatForPixelFormat(v10);
    v20[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v10);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1));
    -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", (int)a2);
    -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", a2 >> 32);
    -[BWVideoFormatRequirements setBytesPerRowAlignment:](v6, "setBytesPerRowAlignment:", 64);
    -[BWVideoFormatRequirements setPlaneAlignment:](v6, "setPlaneAlignment:", 64);
    -[BWVideoFormatRequirements setSupportedCacheModes:](v6, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForCacheProfile:](BWVideoFormatRequirements, "cacheModesForCacheProfile:", 2));
    v19 = v6;
    v13 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1));
    if (v13)
    {
      v14 = v13;

      v15 = [BWPixelBufferPool alloc];
      v16 = objc_msgSend(*(id *)(v5 + 16), "memoryPool");
      LOBYTE(v18) = *(_BYTE *)(v5 + 176);
      v17 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v15, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v14, v9, v8, 0, v16, v18);
      result = 0;
      *(_QWORD *)(v5 + 120) = v17;
      if (!v17)
        return 4294954510;
    }
    else
    {
      return 4294954516;
    }
  }
  return result;
}

- (uint64_t)_resolvedPoolCapacityForSettings:(uint64_t)a3 outputDimensions:
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;

  if (result)
  {
    v5 = result;
    v6 = *(int *)(result + 112);
    objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle");
    v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "bravoConstituentImageDeliveryDeviceTypes"), "count");
    v8 = objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "width") != (int)a3
      || objc_msgSend((id)objc_msgSend(*(id *)(v5 + 8), "videoFormat"), "height") != a3 >> 32;
    if (v7 > 1 && v8)
      v9 = v7;
    else
      v9 = 1;
    return v9 * v6;
  }
  return result;
}

- (uint64_t)_buildPrimaryFormatScalingSession
{
  uint64_t v1;
  const void *v2;

  if (result)
  {
    v1 = result;
    v2 = *(const void **)(result + 128);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(v1 + 128) = 0;
    }
    return VTPixelTransferSessionCreate(0, (VTPixelTransferSessionRef *)(v1 + 128));
  }
  return result;
}

- (uint64_t)_zoomAttachedMedia:(CMAttachmentBearerRef)target sampleBuffer:
{
  uint64_t v3;
  CMAttachmentBearerRef v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v15;
  uint64_t v16;
  void *v17;
  opaqueCMSampleBuffer *AttachedMedia;
  void *v19;
  CMAttachmentBearerRef v20;
  opaqueCMSampleBuffer *v21;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v23;
  void *v24;
  float v25;
  float v26;
  unint64_t v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CFDictionaryRef DictionaryRepresentation;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL4 v42;
  int v43;
  CFTypeRef v44;
  CFTypeRef v45;
  CFTypeRef v46;
  CFTypeRef v47;
  unsigned int v48;
  id v49;
  unsigned int v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  OSStatus v56;
  const char *v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  const __CFString *v65;
  const __CFString *propertyKey;
  __int128 v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFAllocator *allocator;
  unsigned int v71;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v73;
  void *v74;
  const void *v75;
  void *v76;
  unint64_t v77;
  const __CFString *key;
  opaqueCMSampleBuffer *v79;
  CVBufferRef buffer;
  __CVBuffer *buffera;
  uint64_t v82;
  uint64_t v83;
  __CVBuffer *pixelBuffer;
  int Height;
  int Width;
  __int128 v87;
  __int128 v88;
  CFTypeRef v89;
  CFTypeRef cf;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  uint64_t v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v96 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = target;
  v6 = a1;
  v73 = (void *)CMGetAttachment(target, CFSTR("StillSettings"), 0);
  v74 = (void *)objc_msgSend(v73, "requestedSettings");
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
  if (!v7)
  {
    v71 = 0;
    goto LABEL_87;
  }
  v8 = v7;
  v71 = 0;
  v9 = *(_QWORD *)v92;
  key = (const __CFString *)*MEMORY[0x1E0D05CB0];
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __asm { FMOV            V0.2D, #1.0 }
  v67 = _Q0;
  v69 = (const __CFString *)*MEMORY[0x1E0CA8D68];
  v68 = (const __CFString *)*MEMORY[0x1E0CA8E98];
  propertyKey = (const __CFString *)*MEMORY[0x1E0CED850];
  v65 = (const __CFString *)*MEMORY[0x1E0D086F0];
  v63 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v64 = *MEMORY[0x1E0C9D628];
  v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v62 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v82 = v6;
  v75 = v4;
  v76 = a2;
  do
  {
    v16 = 0;
    v83 = v8;
    do
    {
      if (*(_QWORD *)v92 != v9)
        objc_enumerationMutation(a2);
      v17 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v16);
      v89 = 0;
      cf = 0;
      if ((objc_msgSend(v17, "isEqualToString:", 0x1E495B2D8, v60) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", 0x1E495B298) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", 0x1E495B2F8) & 1) == 0
        && (objc_msgSend(v17, "isEqualToString:", 0x1E495B318) & 1) == 0)
      {
        AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v4, (uint64_t)v17);
        if (AttachedMedia)
        {
          v19 = a2;
          v20 = v4;
          v21 = AttachedMedia;
          ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
          if (!ImageBuffer)
          {
            v4 = v20;
            goto LABEL_22;
          }
          v23 = ImageBuffer;
          v79 = v21;
          v24 = (void *)CMGetAttachment(v21, key, 0);
          -[BWStillImageScalerNode mainImageDownscalingFactorForAttachedMediaKey:attachedMediaMetadata:](v6, (uint64_t)v17, v24);
          v26 = v25;
          if (v25 == 0.0 && !objc_msgSend(*(id *)(v6 + 152), "objectForKeyedSubscript:", v17))
          {
            v4 = v20;
            goto LABEL_22;
          }
          v4 = v20;
          if (!*(_QWORD *)(v6 + 168)
            && VTPixelTransferSessionCreate(allocator, (VTPixelTransferSessionRef *)(v6 + 168)))
          {
LABEL_22:
            a2 = v19;
            goto LABEL_30;
          }
          objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v6, "graph"), "memoryAnalyticsPayload"), "setScaledStillCaptureTaken:", 1);
          if (v26 == 0.0 || v26 == 1.0 || (a2 = v19, CVPixelBufferGetPixelFormatType(v23) == 1278226488))
          {
            v8 = v83;
            if (objc_msgSend(*(id *)(v6 + 96), "optimizedEnhancedResolutionDepthPipelineEnabled"))
              buffer = (CVBufferRef)(((unint64_t)objc_msgSend((id)objc_msgSend(v73, "captureSettings"), "captureFlags") >> 11) & 1);
            else
              LODWORD(buffer) = 0;
            v87 = *MEMORY[0x1E0C9D628];
            v88 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
            if (!FigCFDictionaryGetCGRectIfPresent())
            {
              v87 = 0uLL;
              v88 = v67;
            }
            Width = CVPixelBufferGetWidth(v23);
            pixelBuffer = v23;
            Height = CVPixelBufferGetHeight(v23);
            v27 = -[BWStillImageScalerNode _outputDimensionsForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:primaryMediaWidth:primaryMediaHeight:requestedWidth:requestedHeight:zoomWithoutUpscalingEnabled:normalizedZoomRect:optimizedEnhancedResolutionDepthCapture:](v82, v17, objc_msgSend(v74, "outputWidth"), objc_msgSend(v74, "outputHeight"), objc_msgSend(v74, "outputWidth"), objc_msgSend(v74, "outputHeight"), objc_msgSend(v74, "isZoomWithoutUpscalingEnabled"), (int)buffer, v26, *(double *)&v87, *((double *)&v87 + 1), *(double *)&v88, *((double *)&v88 + 1));
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("Depth")) & 1) != 0
              || objc_msgSend(v17, "isEqualToString:", 0x1E495B258))
            {
              FigCaptureMetadataUtilitiesDenormalizeCropRect(*(double *)&v87, *((double *)&v87 + 1), *(double *)&v88, *((double *)&v88 + 1));
              FigCaptureMetadataUtilitiesRoundRectToEvenCoordinates();
              v29 = v28;
              v31 = v30;
              v33 = v32;
              v35 = v34;
              v4 = v75;
              a2 = v76;
              v6 = v82;
            }
            else
            {
              v37 = (double)(int)v27 / (double)SHIDWORD(v27);
              v4 = v75;
              a2 = v76;
              if (v26 == 0.0)
                FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(Width, Height, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), *(CGFloat *)&v88, *((CGFloat *)&v88 + 1), v37);
              else
                v38 = FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRectForAttachedMedia(Width, Height, *(CGFloat *)&v87, *((CGFloat *)&v87 + 1), *(CGFloat *)&v88, *((CGFloat *)&v88 + 1), v37, v26);
              v29 = v38;
              v31 = v39;
              v33 = v40;
              v35 = v41;
              v6 = v82;
            }
            v97.origin.x = v29;
            v97.origin.y = v31;
            v97.size.width = v33;
            v97.size.height = v35;
            if (CGRectIsNull(v97))
            {
              v61 = v3;
              LODWORD(v60) = 0;
              FigDebugAssert3();
              v71 = -12780;
            }
            else
            {
              v77 = v27;
              v42 = FigCaptureVideoDimensionsAreEqual((int)v33 | ((unint64_t)(int)v35 << 32), v27);
              v43 = objc_msgSend(v17, "isEqualToString:", 0x1E495B278);
              if (!v43)
                goto LABEL_41;
              if (*(_BYTE *)(v6 + 137))
              {
                LOBYTE(v43) = BWCIFilterArrayContainsPortraitFilters((void *)objc_msgSend(v74, "processedImageFilters"));
LABEL_41:
                if (v42)
                {
LABEL_42:
                  if ((v43 & 1) == 0
                    && (CVPixelBufferGetPlaneCount(v23) == 1
                     || sis_encoderCanCropDenormalizedZoomRect(objc_msgSend(v74, "outputWidth"), objc_msgSend(v74, "outputHeight"), v29, v31, v33, v35)))
                  {
                    goto LABEL_75;
                  }
                }
              }
              else
              {
                LOBYTE(v43) = 0;
                if (v42)
                  goto LABEL_42;
              }
              if (objc_msgSend(v17, "isEqualToString:", CFSTR("Depth")))
              {
                v100.size.width = (double)Width;
                v100.size.height = (double)Height;
                v100.origin.x = 0.0;
                v100.origin.y = 0.0;
                v98.origin.x = v29;
                v98.origin.y = v31;
                v98.size.width = v33;
                v98.size.height = v35;
                if (CGRectEqualToRect(v98, v100))
                  goto LABEL_75;
              }
              -[BWStillImageScalerNode _rebuildBufferPoolForAttachedMediaKey:attachedMediaMainImageDownscalingFactor:outputDimensions:settings:](v6, (uint64_t)v17, v77, v73, v26);
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NewPixelBuffer-%@"), v17);
              buffera = (__CVBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 160), "objectForKeyedSubscript:", v17), "newPixelBuffer");
              if (buffera)
              {
                v44 = CVBufferCopyAttachment(v23, v69, 0);
                if (v44)
                {
                  v45 = CFAutorelease(v44);
                  if (v45)
                    CVBufferSetAttachment(buffera, v69, v45, kCVAttachmentMode_ShouldPropagate);
                }
                v46 = CVBufferCopyAttachment(v23, v68, 0);
                if (v46)
                {
                  v47 = CFAutorelease(v46);
                  if (v47)
                    CVBufferSetAttachment(buffera, v68, v47, kCVAttachmentMode_ShouldPropagate);
                }
                if (dword_1ECFE98B0)
                {
                  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                  v6 = v82;
                }
                v48 = BWCMSampleBufferCreateCopyWithNewPixelBuffer(v79, buffera, &v89, (CMSampleBufferRef *)&cf);
                if (v48)
                {
                  v71 = v48;
                  DictionaryRepresentation = 0;
                  goto LABEL_83;
                }
                v49 = BWCMSampleBufferCopyReattachAndReturnMutableMetadata(cf);
                if (objc_msgSend(v17, "isEqualToString:", CFSTR("Depth")))
                {
                  v50 = FigDepthScaleBufferWithCrop(v23, buffera, v29, v31, v33, v35);
                  if (!v50)
                  {
                    v51 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", CMGetAttachment(v4, v65, 0));
                    FigCaptureMetadataUtilitiesNormalizeCropRect(v29, v31, v33, v35);
                    FigCaptureMetadataUtilitiesUpdateDepthDataMetadataForStillImageCropAndScale(v51, v52, v53, v54, v55, 1.0 / v55);
                    CMSetAttachment(v4, v65, v51, 1u);
                    DictionaryRepresentation = 0;
                    goto LABEL_65;
                  }
                  v71 = v50;
                  DictionaryRepresentation = 0;
                  a2 = v76;
LABEL_83:
                  BWSampleBufferRemoveAttachedMedia(v4, (uint64_t)v17);
                }
                else
                {
                  v99.origin.x = v29;
                  v99.origin.y = v31;
                  v99.size.width = v33;
                  v99.size.height = v35;
                  DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v99);
                  v56 = VTSessionSetProperty(*(VTSessionRef *)(v6 + 168), propertyKey, DictionaryRepresentation);
                  if (v56
                    || (v56 = VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v6 + 168), pixelBuffer, buffera)) != 0)
                  {
                    v71 = v56;
                    v4 = v75;
                    a2 = v76;
                    goto LABEL_83;
                  }
LABEL_65:
                  if (objc_msgSend(v17, "isEqualToString:", 0x1E495B0F8, v60, v61))
                  {
                    FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v49, Width | ((unint64_t)Height << 32), v77, v29, v31, v33, v35, v64, v63, v62, v15);
                    v6 = v82;
                    FigCaptureMetadataUtilitiesUpdateMetadataForNewFinalDimensions((uint64_t)v49, Width | ((unint64_t)Height << 32), v77);
                  }
                  v4 = v75;
                  BWSampleBufferSetAttachedMedia(v75, (uint64_t)v17, (uint64_t)cf);
                  FigCaptureMetadataUtilitiesPreventFurtherCropping(v49, v57);
                  v71 = 0;
                  a2 = v76;
                }
                CFRelease(buffera);
LABEL_69:
                if (cf)
                  CFRelease(cf);
                if (DictionaryRepresentation)
                  CFRelease(DictionaryRepresentation);
                if (v89)
                  CFRelease(v89);
                goto LABEL_75;
              }
            }
          }
          else
          {
            v71 = -12780;
LABEL_30:
            v8 = v83;
          }
          BWSampleBufferRemoveAttachedMedia(v4, (uint64_t)v17);
        }
        DictionaryRepresentation = 0;
        goto LABEL_69;
      }
LABEL_75:
      ++v16;
    }
    while (v8 != v16);
    v58 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v91, v95, 16);
    v8 = v58;
  }
  while (v58);
LABEL_87:
  -[BWStillImageScalerNode _removeUnmodifiedAttachedMedias:](v6, v4);
  return v71;
}

- (uint64_t)_shouldPurgeAllResourcesAfterProcessingSettings:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    result = objc_msgSend(*(id *)(result + 16), "memoryPool");
    if (result)
      return !FigCaptureVideoDimensionsAreValid(*(_QWORD *)(v3 + 180))
          && objc_msgSend((id)objc_msgSend(a2, "requestedSettings"), "smartStyle") == 0;
  }
  return result;
}

- (unint64_t)_outputDimensionsForAttachedMediaKey:(unint64_t)a3 attachedMediaMainImageDownscalingFactor:(unint64_t)a4 primaryMediaWidth:(unint64_t)a5 primaryMediaHeight:(unint64_t)a6 requestedWidth:(char)a7 requestedHeight:(int)a8 zoomWithoutUpscalingEnabled:(float)a9 normalizedZoomRect:(double)a10 optimizedEnhancedResolutionDepthCapture:(double)a11
{
  uint64_t v20;
  unsigned int v23;
  float width;
  float height;
  double v26;
  CGSize v28;

  if (!a1)
    goto LABEL_12;
  v20 = a1;
  if (a8 && objc_msgSend(a2, "isEqual:", 0x1E4936818))
  {
    a4 = a6;
    a3 = a5;
  }
  if (a9 != 0.0)
  {
    v23 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)(float)((float)a3 / a9));
    a1 = FigCaptureRoundFloatToMultipleOf(2, (float)(int)(float)((float)a4 / a9));
    return v23 | (unint64_t)(a1 << 32);
  }
  a1 = objc_msgSend(*(id *)(v20 + 152), "objectForKeyedSubscript:", a2);
  if (!a1)
  {
LABEL_12:
    v23 = 0;
    return v23 | (unint64_t)(a1 << 32);
  }
  v28 = (CGSize)*MEMORY[0x1E0C9D820];
  if (!CGSizeMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(*(id *)(v20 + 152), "objectForKeyedSubscript:", a2), &v28))
  {
    a1 = 0;
    goto LABEL_12;
  }
  if ((a7 & 1) != 0)
  {
    v28.width = a12 * v28.width;
    width = v28.width;
    v28.width = (double)(int)FigCaptureRoundFloatToMultipleOf(2, width);
    v28.height = a13 * v28.height;
    height = v28.height;
    v26 = (double)(int)FigCaptureRoundFloatToMultipleOf(2, height);
  }
  else
  {
    v26 = v28.height;
  }
  v23 = (int)v28.width;
  a1 = (int)v26;
  return v23 | (unint64_t)(a1 << 32);
}

- (void)_rebuildBufferPoolForAttachedMediaKey:(uint64_t)a3 attachedMediaMainImageDownscalingFactor:(void *)a4 outputDimensions:(float)a5 settings:
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  BWVideoFormatRequirements *v20;
  id v21;
  BWPixelBufferPool *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  BWVideoFormatRequirements *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  if (a1 && (a5 != 0.0 || objc_msgSend(*(id *)(a1 + 152), "objectForKeyedSubscript:", a2)))
  {
    v9 = *(id *)(a1 + 160);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      *(_QWORD *)(a1 + 160) = v9;
    }
    v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", a2);
    if ((int)a3 == objc_msgSend(v10, "width") && objc_msgSend(v10, "height") == a3 >> 32)
    {
      v11 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](a1, a4, a3);
      if (objc_msgSend(v10, "capacity") != v11)
        objc_msgSend(v10, "setCapacity:", v11);
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = objc_msgSend((id)a1, "name");
      v14 = CFSTR("StillImageScaler");
      if (v13)
        v14 = (const __CFString *)v13;
      v15 = objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v14, a2);
      v16 = -[BWStillImageScalerNode _resolvedPoolCapacityForSettings:outputDimensions:](a1, a4, a3);
      v17 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", a2), "resolvedVideoFormat");
      v18 = objc_msgSend(v17, "pixelFormat");
      if ((_DWORD)v18)
      {
        v19 = v18;
        v20 = objc_alloc_init(BWVideoFormatRequirements);
        v28[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v19);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1));
        -[BWVideoFormatRequirements setWidth:](v20, "setWidth:", (int)a3);
        -[BWVideoFormatRequirements setHeight:](v20, "setHeight:", a3 >> 32);
        -[BWVideoFormatRequirements setSupportedCacheModes:](v20, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForCacheProfile:](BWVideoFormatRequirements, "cacheModesForCacheProfile:", objc_msgSend(v17, "cacheMode")));
        -[BWVideoFormatRequirements setWidthAlignment:](v20, "setWidthAlignment:", 16);
        -[BWVideoFormatRequirements setHeightAlignment:](v20, "setHeightAlignment:", 16);
        -[BWVideoFormatRequirements setBytesPerRowAlignment:](v20, "setBytesPerRowAlignment:", objc_msgSend(v17, "bytesPerRowAlignment"));
        -[BWVideoFormatRequirements setPlaneAlignment:](v20, "setPlaneAlignment:", objc_msgSend(v17, "planeAlignment"));
        -[BWVideoFormatRequirements setMemoryPoolUseAllowed:](v20, "setMemoryPoolUseAllowed:", objc_msgSend(v17, "memoryPoolUseAllowed"));
        v27 = v20;
        v21 = +[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1));
        v22 = [BWPixelBufferPool alloc];
        v23 = objc_msgSend(*(id *)(a1 + 16), "memoryPool");
        LOBYTE(v26) = *(_BYTE *)(a1 + 176);
        v24 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:](v22, "initWithVideoFormat:capacity:name:clientProvidesPool:memoryPool:providesBackPressure:reportSlowBackPressureAllocations:", v21, v16, v15, 0, v23, v26);
        if (v24)
        {
          v25 = (void *)v24;
          objc_msgSend(*(id *)(a1 + 160), "setObject:forKeyedSubscript:", v24, a2);

        }
      }
    }
  }
}

- (uint64_t)_removeUnmodifiedAttachedMedias:(uint64_t)a1
{
  CFTypeRef v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (id)BWSampleBufferCopyDictionaryOfAttachedMedia(a2);
    v4 = v3 ? (void *)v3 : (void *)MEMORY[0x1E0C9AA70];
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(*(id *)(a1 + 144), "allKeys"));
    objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(*(id *)(a1 + 152), "allKeys"));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(v4, "allKeys"));
    objc_msgSend(v6, "minusSet:", v5);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(v11, "isEqualToString:", CFSTR("Depth")) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495AEF8) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495B2B8) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495B358) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495B298) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495B2F8) & 1) == 0
            && (objc_msgSend(v11, "isEqualToString:", 0x1E495B318) & 1) == 0)
          {
            BWSampleBufferRemoveAttachedMedia(a2, (uint64_t)v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }
  }
  return 0;
}

@end
