@implementation BWStillImageFocusPixelDisparityNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStillImageFocusPixelDisparityNode)initWithNodeConfiguration:(id)a3 sensorConfiguration:(id)a4 disparityMapWidth:(unint64_t)a5 disparityMapHeight:(unint64_t)a6 depthIsAlwaysHighQuality:(BOOL)a7
{
  BWStillImageFocusPixelDisparityNode *v12;
  BWSensorConfiguration *v13;
  NSDictionary *v14;
  id v15;
  double v16;
  BWNodeInput *v17;
  BWVideoFormatRequirements *v18;
  int v19;
  BWNodeInputMediaConfiguration *v20;
  BWVideoFormatRequirements *v21;
  id *p_input;
  BWNodeInputMediaConfiguration *v23;
  BWVideoFormatRequirements *v24;
  __CFString **v25;
  BWVideoFormatRequirements *v26;
  BWNodeInputMediaConfiguration *v27;
  BWVideoFormatRequirements *v28;
  BWNodeOutput *v29;
  BWNodeOutputMediaConfiguration *v30;
  BWVideoFormatRequirements *v31;
  BWNodeOutputMediaConfiguration *v32;
  BWVideoFormatRequirements *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  v12 = -[BWNode init](&v35, sel_init);
  if (v12)
  {
    if (!a3
      || (v12->_nodeConfiguration = (BWStillImageNodeConfiguration *)a3, !a4)
      || (v13 = (BWSensorConfiguration *)a4,
          v12->_sensorConfiguration = v13,
          !-[BWSensorConfiguration cameraInfo](v13, "cameraInfo"))
      || (v14 = -[BWSensorConfiguration cameraInfo](v12->_sensorConfiguration, "cameraInfo"),
          (v15 = -[NSDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D05968])) == 0))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    objc_msgSend(v15, "doubleValue");
    *(float *)&v16 = v16 * 0.001;
    v12->_pixelSizeInMm = *(float *)&v16;
    v12->_depthIsAlwaysHighQuality = a7;
    v17 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v12);
    v18 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v18, "setSupportedPixelFormats:", &unk_1E4A00140);
    -[BWNodeInput setFormatRequirements:](v17, "setFormatRequirements:", v18);

    -[BWNodeInput setPassthroughMode:](v17, "setPassthroughMode:", 1);
    -[BWNode addInput:](v12, "addInput:", v17);

    v19 = -[BWStillImageNodeConfiguration depthDataType](v12->_nodeConfiguration, "depthDataType");
    if (v19 == 5)
    {
      v23 = objc_alloc_init(BWNodeInputMediaConfiguration);
      v26 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v26, "setSupportedPixelFormats:", &unk_1E4A00188);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v23, "setFormatRequirements:", v26);

      -[BWNodeInputMediaConfiguration setPassthroughMode:](v23, "setPassthroughMode:", 0);
      p_input = (id *)&v12->super._input;
      v25 = BWAttachedMediaKey_SensorInterfaceRaw;
    }
    else
    {
      if (v19 != 4)
      {
LABEL_11:
        v27 = objc_alloc_init(BWNodeInputMediaConfiguration);
        v28 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v28, "setSupportedPixelFormats:", &unk_1E4A001A0);
        -[BWNodeInputMediaConfiguration setFormatRequirements:](v27, "setFormatRequirements:", v28);
        -[BWNodeInputMediaConfiguration setPassthroughMode:](v27, "setPassthroughMode:", 0);
        -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v12->super._input, "setMediaConfiguration:forAttachedMediaKey:", v27, 0x1E495AFF8);
        v29 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v12);
        v30 = -[BWNodeOutput primaryMediaConfiguration](v29, "primaryMediaConfiguration");
        v31 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v31, "setSupportedPixelFormats:", &unk_1E4A001B8);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v30, "setFormatRequirements:", v31);

        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v30, "setProvidesPixelBufferPool:", 0);
        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v30, "setPassthroughMode:", 1);
        v32 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        v33 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v33, "setSupportedPixelFormats:", &unk_1E4A001D0);
        -[BWVideoFormatRequirements setWidth:](v33, "setWidth:", a5);
        -[BWVideoFormatRequirements setHeight:](v33, "setHeight:", a6);
        -[BWNodeOutputMediaConfiguration setFormatRequirements:](v32, "setFormatRequirements:", v33);

        -[BWNodeOutputMediaConfiguration setPassthroughMode:](v32, "setPassthroughMode:", 0);
        -[BWNodeOutputMediaConfiguration setProvidesPixelBufferPool:](v32, "setProvidesPixelBufferPool:", 1);
        -[BWNodeOutput setMediaConfiguration:forAttachedMediaKey:](v29, "setMediaConfiguration:forAttachedMediaKey:", v32, CFSTR("Depth"));

        -[BWNode addOutput:](v12, "addOutput:", v29);
        *(_DWORD *)v12->_anon_90 = 1065353216;
        *(_DWORD *)&v12->_anon_90[20] = 1065353216;
        *(_DWORD *)&v12->_anon_90[40] = 1065353216;
        return v12;
      }
      v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
      v21 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", &unk_1E4A00158);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v20, "setFormatRequirements:", v21);

      -[BWNodeInputMediaConfiguration setPassthroughMode:](v20, "setPassthroughMode:", 0);
      p_input = (id *)&v12->super._input;
      -[BWNodeInput setMediaConfiguration:forAttachedMediaKey:](v12->super._input, "setMediaConfiguration:forAttachedMediaKey:", v20, 0x1E495AED8);

      v23 = objc_alloc_init(BWNodeInputMediaConfiguration);
      v24 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v24, "setSupportedPixelFormats:", &unk_1E4A00170);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v23, "setFormatRequirements:", v24);

      -[BWNodeInputMediaConfiguration setPassthroughMode:](v23, "setPassthroughMode:", 0);
      v25 = BWAttachedMediaKey_FocusPixelData;
    }
    objc_msgSend(*p_input, "setMediaConfiguration:forAttachedMediaKey:", v23, *v25);

    goto LABEL_11;
  }
  return v12;
}

- (void)dealloc
{
  opaqueCMFormatDescription *disparityFormatDescription;
  objc_super v4;

  -[FigFocusPixelDisparityGenerator finishProcessing](self->_focusPixelDisparityGenerator, "finishProcessing");

  disparityFormatDescription = self->_disparityFormatDescription;
  if (disparityFormatDescription)
    CFRelease(disparityFormatDescription);

  v4.receiver = self;
  v4.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  objc_super v9;

  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3);
  }
  else if ((objc_msgSend(a5, "isEqualToString:", CFSTR("FocusPixelData")) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AED8) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", CFSTR("SensorInterfaceRaw")) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495AFF8) & 1) == 0
         && (objc_msgSend(a5, "isEqualToString:", 0x1E495B018) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)BWStillImageFocusPixelDisparityNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v9, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("DisparityGenerator");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageFocusPixelDisparityNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (-[BWStillImageFocusPixelDisparityNode _loadAndConfigureDisparityGenerator]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (uint64_t)_loadAndConfigureDisparityGenerator
{
  uint64_t v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (!a1)
    return 0;
  v2 = -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "focusPixelDisparityVersionForPortType:sensorIDString:", objc_msgSend(*(id *)(a1 + 112), "portType"), objc_msgSend(*(id *)(a1 + 112), "sensorIDString"));
  v3 = objc_msgSend(*(id *)(a1 + 104), "depthDataType");
  if (v3 == 5)
  {
    if ((int)v2 >= 2)
      goto LABEL_8;
    return 0;
  }
  if (v3 == 4 && (_DWORD)v2 != 1)
    return 0;
LABEL_8:
  v5 = -[BWStillImageFocusPixelDisparityNode processorOptionsForProcessorVersion:](a1, v2);
  if (!v5
    || (v6 = v5, (v7 = BWLoadProcessorBundle((uint64_t)CFSTR("FPDisparity"), v2)) == 0)
    || (v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "principalClass")), "initWithCommandQueue:", objc_msgSend(*(id *)(a1 + 104), "metalCommandQueue")), (*(_QWORD *)(a1 + 120) = v8) == 0))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = FigSignalErrorAt();
    if (!(_DWORD)v9)
      return v9;
    goto LABEL_18;
  }
  objc_msgSend(v8, "setOptions:", v6);
  objc_msgSend(*(id *)(a1 + 120), "setFocusPixelMetadata:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setQualityEstimationEnabled:", *(_BYTE *)(a1 + 212) == 0);
  v9 = 0;
  if (objc_msgSend(*(id *)(a1 + 120), "prepareToProcess:", 0))
  {
    v9 = 4294954516;
LABEL_18:

    *(_QWORD *)(a1 + 120) = 0;
  }
  return v9;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;

  if (a3)
  {
    v6 = (void *)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0);
    if (v6)
    {
      if ((objc_msgSend(v6, "captureFlags") & 0x800) != 0)
        -[BWStillImageFocusPixelDisparityNode _processDisparityForSampleBuffer:]((uint64_t)self, a3);
    }
  }
  if (-[BWStillImageNodeConfiguration depthDataType](self->_nodeConfiguration, "depthDataType") == 5)
    -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:]((uint64_t)self, a3);
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
}

- (void)_processDisparityForSampleBuffer:(uint64_t)a1
{
  uint64_t v2;
  double *v5;
  CGSize v6;
  int v7;
  opaqueCMSampleBuffer *v8;
  CVImageBufferRef ImageBuffer;
  opaqueCMSampleBuffer *v10;
  opaqueCMSampleBuffer *v11;
  CVImageBufferRef v12;
  CVImageBufferRef v13;
  CFTypeRef v14;
  CFTypeRef v15;
  opaqueCMSampleBuffer *AttachedMedia;
  void *v17;
  const __CFDictionary *v18;
  opaqueCMSampleBuffer *v19;
  CVImageBufferRef v20;
  CVImageBufferRef v21;
  opaqueCMSampleBuffer *v22;
  CVImageBufferRef v23;
  int CopyWithNewPixelBuffer;
  int v25;
  uint64_t v26;
  uint64_t v27;
  CFTypeRef cf;
  CGRect rect;

  if (!a1)
    return;
  v5 = (double *)MEMORY[0x1E0C9D628];
  v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  rect.size = v6;
  cf = 0;
  if (!*(_QWORD *)(a1 + 120))
    goto LABEL_50;
  v7 = objc_msgSend(*(id *)(a1 + 104), "depthDataType");
  if (v7 == 5)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, (uint64_t)CFSTR("SensorInterfaceRaw"));
    if (!AttachedMedia)
      goto LABEL_48;
    ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
    if (ImageBuffer)
    {
      v15 = 0;
      v13 = 0;
      goto LABEL_15;
    }
    goto LABEL_52;
  }
  if (v7 != 4)
  {
    v15 = 0;
    v13 = 0;
    ImageBuffer = 0;
    goto LABEL_15;
  }
  v8 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495AED8);
  if (!v8)
  {
LABEL_48:
    fig_log_get_emitter();
    v27 = v2;
    LODWORD(v26) = 0;
    goto LABEL_49;
  }
  ImageBuffer = CMSampleBufferGetImageBuffer(v8);
  if (!ImageBuffer)
  {
LABEL_52:
    fig_log_get_emitter();
    v27 = v2;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    goto LABEL_51;
  }
  v10 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, (uint64_t)CFSTR("FocusPixelData"));
  v11 = v10;
  if (!v10)
  {
    fig_log_get_emitter();
    v27 = v2;
    LODWORD(v26) = 0;
    FigDebugAssert3();
    LOBYTE(ImageBuffer) = 0;
    goto LABEL_31;
  }
  v12 = CMSampleBufferGetImageBuffer(v10);
  if (!v12)
    goto LABEL_48;
  v13 = v12;
  v14 = CMGetAttachment(v11, (CFStringRef)*MEMORY[0x1E0D05C78], 0);
  if (!v14)
    goto LABEL_48;
  v15 = v14;
LABEL_15:
  v17 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v17)
    goto LABEL_48;
  v18 = (const __CFDictionary *)objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F38]);
  if (!v18)
    goto LABEL_48;
  if (!CGRectMakeWithDictionaryRepresentation(v18, &rect))
    goto LABEL_22;
  v19 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495AFF8);
  if (!v19)
    goto LABEL_22;
  v20 = CMSampleBufferGetImageBuffer(v19);
  if (!v20)
    goto LABEL_22;
  v21 = v20;
  v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a2, 0x1E495B018);
  if (v22)
  {
    v23 = CMSampleBufferGetImageBuffer(v22);
    if (!v23)
    {
LABEL_22:
      fig_log_get_emitter();
      v27 = v2;
      LODWORD(v26) = 0;
LABEL_49:
      FigDebugAssert3();
LABEL_50:
      LOBYTE(ImageBuffer) = 0;
LABEL_51:
      v11 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v23 = 0;
  }
  v11 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "mediaPropertiesForAttachedMediaKey:", CFSTR("Depth")), "livePixelBufferPool"), "newPixelBuffer");
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 120), "setImageSampleBuffer:", a2);
    objc_msgSend(*(id *)(a1 + 120), "setRawImagePixelBufferBuffer:", ImageBuffer);
    objc_msgSend(*(id *)(a1 + 120), "setFocusPixelBuffer:", v13);
    objc_msgSend(*(id *)(a1 + 120), "setFocusPixelMetadata:", v15);
    objc_msgSend(*(id *)(a1 + 120), "setFocusPixelValidArea:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
    objc_msgSend(*(id *)(a1 + 120), "setPersonSegmentationPixelBuffer:", v21);
    objc_msgSend(*(id *)(a1 + 120), "setPersonSegmentationConfidencePixelBuffer:", v23);
    objc_msgSend(*(id *)(a1 + 120), "setOutDisparity:", v11);
    if (!objc_msgSend(*(id *)(a1 + 120), "process")
      && !objc_msgSend(*(id *)(a1 + 120), "finishProcessing"))
    {
      -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:](a1, a2);
      CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)a2, v11, (CFTypeRef *)(a1 + 128), (CMSampleBufferRef *)&cf);
      if (CopyWithNewPixelBuffer)
      {
        v25 = CopyWithNewPixelBuffer;
        fig_log_get_emitter();
        v27 = v2;
        LODWORD(v26) = v25;
        FigDebugAssert3();
      }
      else
      {
        -[BWStillImageFocusPixelDisparityNode _attachDepthMetadataToSampleBuffer:](a1, a2);
        BWSampleBufferSetAttachedMedia(a2, (uint64_t)CFSTR("Depth"), (uint64_t)cf);
      }
      LOBYTE(ImageBuffer) = 1;
      goto LABEL_30;
    }
  }
  else
  {
    fig_log_get_emitter();
    v27 = v2;
    LODWORD(v26) = 0;
    FigDebugAssert3();
  }
  LOBYTE(ImageBuffer) = 0;
LABEL_30:
  v5 = (double *)MEMORY[0x1E0C9D628];
LABEL_31:
  objc_msgSend(*(id *)(a1 + 120), "setImageSampleBuffer:", 0, v26, v27);
  objc_msgSend(*(id *)(a1 + 120), "setRawImagePixelBufferBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setFocusPixelBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setFocusPixelMetadata:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setFocusPixelValidArea:", *v5, v5[1], v5[2], v5[3]);
  objc_msgSend(*(id *)(a1 + 120), "setPersonSegmentationPixelBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setPersonSegmentationConfidencePixelBuffer:", 0);
  objc_msgSend(*(id *)(a1 + 120), "setOutDisparity:", 0);
  if (cf)
    CFRelease(cf);
  if (v11)
    CFRelease(v11);
  if ((ImageBuffer & 1) == 0)
    -[BWStillImageFocusPixelDisparityNode _removeConsumedAttachedMediaFromSampleBuffer:](a1, a2);
}

- (void)_removeConsumedAttachedMediaFromSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495AED8);
    BWSampleBufferRemoveAttachedMedia(a2, (uint64_t)CFSTR("SensorInterfaceRaw"));
    BWSampleBufferRemoveAttachedMedia(a2, (uint64_t)CFSTR("FocusPixelData"));
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495AFF8);
    BWSampleBufferRemoveAttachedMedia(a2, 0x1E495B018);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3, a4);
}

- (uint64_t)processorOptionsForProcessorVersion:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];
  _QWORD v9[2];
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (!objc_msgSend(*(id *)(result + 112), "sensorIDDictionary")
      || !objc_msgSend(*(id *)(v3 + 112), "portType")
      || !objc_msgSend(*(id *)(v3 + 112), "cameraInfo")
      || (v4 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 112), "sensorIDDictionary"), "objectForKeyedSubscript:", CFSTR("FocusPixelDisparityParameters"))) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_14;
    }
    v5 = (uint64_t)v4;
    if ((_DWORD)a2 == 1
      || (result = objc_msgSend(v4, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FPDisparityV%d"), a2)), (v5 = result) != 0))
    {
      v10 = objc_msgSend(*(id *)(v3 + 112), "portType");
      v11[0] = objc_msgSend(*(id *)(v3 + 112), "cameraInfo");
      v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      if (v6)
      {
        v7 = *MEMORY[0x1E0D06140];
        v8[0] = *MEMORY[0x1E0D06188];
        v8[1] = v7;
        v9[0] = v5;
        v9[1] = v6;
        return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
      }
      fig_log_get_emitter();
LABEL_14:
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (void)_attachDepthMetadataToSampleBuffer:(uint64_t)a1
{
  id v4;
  int v5;
  __int16 v6;
  __int16 v7;
  unsigned __int16 CurrentMajorVersion;
  uint64_t v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  CFTypeRef v12;
  CFTypeRef v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  CGSize size;

  if (a1)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v4
      && ((v5 = -[FigCaptureCameraParameters focusPixelDisparityVersionForPortType:sensorIDString:](+[FigCaptureCameraParameters sharedInstance](FigCaptureCameraParameters, "sharedInstance"), "focusPixelDisparityVersionForPortType:sensorIDString:", objc_msgSend(*(id *)(a1 + 112), "portType"), objc_msgSend(*(id *)(a1 + 112), "sensorIDString")), v6 = v5, v5 <= 1)? (v7 = 30000): (v7 = -15536), (CurrentMajorVersion = FigDepthDataGetCurrentMajorVersion(), !*(_BYTE *)(a1 + 212))? (v9 = objc_msgSend(*(id *)(a1 + 120), "disparityQuality")): (v9 = 1), CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05CB0], 0)&& (size = (CGSize)*MEMORY[0x1E0C9D820], (v10 = (const __CFDictionary *)CMGetAttachment(a2, CFSTR("OriginalCameraIntrinsicMatrixReferenceDimensions"), 0)) != 0)))
    {
      v11 = v10;
      if (CGSizeMakeWithDictionaryRepresentation(v10, &size))
      {
        v12 = CMGetAttachment(a2, CFSTR("OriginalCameraIntrinsicMatrix"), 0);
        if (v12)
        {
          v13 = v12;
          v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (unsigned __int16)(v7 + v6) | (CurrentMajorVersion << 16));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0D08478]);
          v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0D08470]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D08438]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E49F8100, *MEMORY[0x1E0D08428]);
          LODWORD(v16) = *(_DWORD *)(a1 + 208);
          v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D08468]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D08440]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D08448]);
          v18 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a1 + 144, 64);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D08430]);
          CMSetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D086F0], v4, 1u);
LABEL_14:

          return;
        }
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    goto LABEL_14;
  }
}

@end
