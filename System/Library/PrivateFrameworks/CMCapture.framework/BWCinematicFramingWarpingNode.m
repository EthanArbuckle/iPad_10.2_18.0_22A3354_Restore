@implementation BWCinematicFramingWarpingNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (_QWORD)initWithFramingStatesProvider:(void *)a1 outputDimensions:(void *)a2 maxLossyCompressionLevel:(uint64_t)a3
{
  _QWORD *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWNodeInput *v7;
  void *v8;
  BWVideoFormatRequirements *v9;
  BWNodeOutput *v10;
  BWVideoFormatRequirements *v11;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13.receiver = a1;
  v13.super_class = (Class)BWCinematicFramingWarpingNode;
  v5 = objc_msgSendSuper2(&v13, sel_init);
  if (v5)
  {
    if (dword_1EE6BEA98)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v5[12] = a2;
    v5[14] = a3;
    v7 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v5);
    if ((int)FigCapturePlatformIdentifier() < 8)
      v8 = &unk_1E4A011C0;
    else
      v8 = FigCapturePixelFormatsByAddingCompressedVariants(&unk_1E4A011C0, 1);
    v9 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", v8);
    -[BWNodeInput setFormatRequirements:](v7, "setFormatRequirements:", v9);
    -[BWNodeInput setPassthroughMode:](v7, "setPassthroughMode:", 0);
    objc_msgSend(v5, "addInput:", v7);
    v10 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v5);
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", v8);
    -[BWNodeOutput setFormatRequirements:](v10, "setFormatRequirements:", v11);
    -[BWNodeOutput setPassthroughMode:](v10, "setPassthroughMode:", 0);
    -[BWNodeOutput setProvidesPixelBufferPool:](v10, "setProvidesPixelBufferPool:", 1);
    objc_msgSend(v5, "addOutput:", v10);

    -[BWCinematicFramingWarpingNode _initVirtualCameraProcessorWithOutputDimensions:]((uint64_t)v5, v5[14]);
  }
  return v5;
}

- (uint64_t)_initVirtualCameraProcessorWithOutputDimensions:(uint64_t)result
{
  uint64_t v3;
  id v4;

  if (result)
  {
    v3 = result;
    v4 = objc_alloc_init(MEMORY[0x1E0D10650]);
    *(_QWORD *)(v3 + 104) = v4;
    objc_msgSend(v4, "setOutputDimensions:", a2);
    if (objc_msgSend(*(id *)(v3 + 104), "setup"))
      return FigDebugAssert3();
    if (objc_msgSend(*(id *)(v3 + 104), "prewarm"))
      return FigDebugAssert3();
    result = objc_msgSend(*(id *)(v3 + 104), "prepareToProcess:", 1);
    if ((_DWORD)result)
      return FigDebugAssert3();
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[VCProcessor purgeResources](self->_vcProcessor, "purgeResources");
  v3.receiver = self;
  v3.super_class = (Class)BWCinematicFramingWarpingNode;
  -[BWNode dealloc](&v3, sel_dealloc);
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  BWVideoFormatRequirements *v9;
  objc_super v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a5, "isEqualToString:", CFSTR("PrimaryFormat")))
  {
    v9 = objc_alloc_init(BWVideoFormatRequirements);
    v11[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v9, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
    -[BWVideoFormatRequirements setWidth:](v9, "setWidth:", self->_outputDimensions.width);
    -[BWVideoFormatRequirements setHeight:](v9, "setHeight:", self->_outputDimensions.height);
    -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v9);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)BWCinematicFramingWarpingNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v10, sel_didSelectFormat_forInput_forAttachedMediaKey_, a3, a4, a5);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BWCinematicFramingStatesProvider *framingStatesProvider;
  double *v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CVImageBufferRef ImageBuffer;
  __CVBuffer *v21;
  const __CFString *v22;
  const void *v23;
  __CVBuffer *v24;
  int v25;
  int v26;
  __CVBuffer *v27;
  BWNodeOutput *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CMTime v33;
  CFTypeRef v34;
  CFTypeRef cf;
  CMTime v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  cf = 0;
  v7 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  Value = (const __CFDictionary *)CFDictionaryGetValue(v7, (const void *)*MEMORY[0x1E0D05D00]);
  memset(&v33, 0, sizeof(v33));
  CMTimeMakeFromDictionary(&v33, Value);
  if (dword_1EE6BEA98)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  framingStatesProvider = self->_framingStatesProvider;
  v36 = v33;
  v11 = (double *)-[BWCinematicFramingStatesProvider copyCameraStatesForPTS:](framingStatesProvider, "copyCameraStatesForPTS:", &v36, v29, v31);
  v12 = v11;
  if (!v11)
    goto LABEL_22;
  v14 = *((_QWORD *)v11 + 1);
  v13 = *((_QWORD *)v11 + 2);
  if (v14)
    v15 = v13 == 0;
  else
    v15 = 1;
  if (v15)
  {
    v32 = v4;
    LODWORD(v30) = 0;
    FigDebugAssert3();
    goto LABEL_22;
  }
  v16 = v11[3];
  v17 = v11[4];
  v18 = v11[5];
  v19 = v11[6];
  ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
LABEL_22:
    v24 = 0;
    goto LABEL_16;
  }
  v21 = ImageBuffer;
  v22 = (const __CFString *)*MEMORY[0x1E0D06F48];
  v23 = (const void *)-[__CFDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06F48]);
  if (v23)
    CVBufferSetAttachment(v21, v22, v23, kCVAttachmentMode_ShouldPropagate);
  v24 = -[BWPixelBufferPool newPixelBuffer](-[BWNodeOutputMediaProperties livePixelBufferPool](-[BWNodeOutput primaryMediaProperties](-[BWNode output](self, "output"), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
  if (v24)
  {
    -[VCProcessor setInputPixelBuffer:](self->_vcProcessor, "setInputPixelBuffer:", v21);
    -[VCProcessor setInputCamera:](self->_vcProcessor, "setInputCamera:", v14);
    -[VCProcessor setOutputPixelBuffer:](self->_vcProcessor, "setOutputPixelBuffer:", v24);
    -[VCProcessor setOutputCamera:](self->_vcProcessor, "setOutputCamera:", v13);
    -[VCProcessor setOutputROI:](self->_vcProcessor, "setOutputROI:", v16, v17, v18, v19);
    v25 = -[VCProcessor process](self->_vcProcessor, "process");
    if (v25)
    {
      v32 = v4;
      LODWORD(v30) = v25;
    }
    else
    {
      v26 = -[VCProcessor finishProcessing](self->_vcProcessor, "finishProcessing");
      if (!v26)
      {
        BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v24, &v34, (CMSampleBufferRef *)&cf);
        if (cf)
        {
          v27 = CMSampleBufferGetImageBuffer(a3);
          CVBufferPropagateAttachments(v27, v24);
          FigCaptureCinematicFramingUpdateSampleBufferMetadata(self->_vcProcessor, cf, 0);
        }
        goto LABEL_16;
      }
      v32 = v4;
      LODWORD(v30) = v26;
    }
    FigDebugAssert3();
  }
LABEL_16:
  v28 = -[BWNode output](self, "output", v30, v32);
  -[BWNodeOutput emitSampleBuffer:](v28, "emitSampleBuffer:", cf);

  if (v24)
    CFRelease(v24);
  if (cf)
    CFRelease(cf);
}

@end
