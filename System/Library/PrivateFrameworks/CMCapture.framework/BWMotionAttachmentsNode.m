@implementation BWMotionAttachmentsNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  -[BWNodeOutput setFormat:](self->super._output, "setFormat:", a3, a4);
}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWMotionAttachmentsNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWMotionAttachmentsNode _setupSampleBufferProcessor]((uint64_t)self))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (BWNodeOutput)sourceVideoWithMotionAttachmentsOutput
{
  return self->_sourceVideoWithMotionAttachmentsOutput;
}

- (uint64_t)_setupSampleBufferProcessor
{
  uint64_t v1;
  uint64_t v3;
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, _QWORD, uint64_t);
  uint64_t v8;
  const void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v3 = *MEMORY[0x1E0C9AE00];
  v4 = *(const __CFDictionary **)(a1 + 104);
  v13 = 0;
  v5 = FigSampleBufferProcessorCreateForMotionAttachments(v3, v4, &v13);
  if ((_DWORD)v5)
  {
    v8 = v5;
    fig_log_get_emitter();
    FigDebugAssert3();
    fig_log_get_emitter();
    v12 = v1;
    LODWORD(v11) = 0;
  }
  else
  {
    v6 = v13;
    *(_QWORD *)(a1 + 96) = v13;
    v7 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v7)
    {
      v8 = v7(v6, man_maProcessorOutputReadyCallback, a1);
      if (!(_DWORD)v8)
        return v8;
    }
    else
    {
      v8 = 4294954514;
    }
    fig_log_get_emitter();
    v12 = v1;
    LODWORD(v11) = 0;
  }
  FigDebugAssert3();
  v9 = *(const void **)(a1 + 96);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 96) = 0;
  }
  objc_msgSend(*(id *)(a1 + 128), "logErrorNumber:errorString:", v8, CFSTR("setup SBP"), v11, v12);
  return v8;
}

+ (void)initialize
{
  objc_opt_class();
}

- (BWMotionAttachmentsNode)initWithSensorIDDictionaryByPortType:(id)a3 cameraInfoByPortType:(id)a4 tuningParameters:(id)a5 activePortTypes:(id)a6 horizontalSensorBinningFactor:(int)a7 verticalSensorBinningFactor:(int)a8 maxSupportedFrameRate:(float)a9 motionAttachmentsMode:(int)a10 motionAttachmentsSource:(int)a11 motionCallbackThreadPriority:(unsigned int)a12 provideSourceVideoWithMotionAttachmentsOutput:(BOOL)a13 provideOfflineVISMotionDataOutput:(BOOL)a14 errorOut:(int *)a15
{
  BWMotionAttachmentsNode *v22;
  BWMotionAttachmentsNode *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  __CFString **v29;
  uint64_t v30;
  void *v31;
  __CFString **v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  BWNodeInput *v39;
  BWVideoFormatRequirements *v40;
  uint64_t v41;
  void *v42;
  BWNodeOutput *v43;
  BWVideoFormatRequirements *v44;
  BWNodeOutput *v45;
  unsigned int v47;
  unsigned int v48;
  _BOOL4 v49;
  objc_super v50;
  uint64_t v51;
  _QWORD v52[10];
  _QWORD v53[10];
  _QWORD v54[2];
  _QWORD v55[2];
  __CFString *v56;
  _QWORD v57[2];
  __CFString *v58;
  _QWORD v59[4];
  _QWORD v60[7];

  v22 = self;
  v60[5] = *MEMORY[0x1E0C80C00];
  if (!a13 && !a14)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return v22;
  }
  v50.receiver = self;
  v50.super_class = (Class)BWMotionAttachmentsNode;
  v23 = -[BWNode init](&v50, sel_init);
  v22 = v23;
  if (v23)
  {
    if (a10)
    {
      if (a10 != 2)
      {
        if (a10 == 1)
        {
          v47 = a7;
          v48 = a8;
          v49 = a14;
          if (a11 == 1)
          {
            v60[0] = 0x1E49479B8;
            v60[1] = 0x1E4947938;
            v60[2] = 0x1E4947918;
            v60[3] = 0x1E4947978;
            v60[4] = 0x1E4947958;
            v24 = (void *)MEMORY[0x1E0C99D20];
            v25 = v60;
            v26 = 5;
          }
          else
          {
            v59[0] = 0x1E4947938;
            v59[1] = 0x1E4947918;
            v59[2] = 0x1E4947978;
            v59[3] = 0x1E4947958;
            v24 = (void *)MEMORY[0x1E0C99D20];
            v25 = v59;
            v26 = 4;
          }
          v34 = (void *)objc_msgSend(v24, "arrayWithObjects:count:", v25, v26);
          v35 = 240;
          goto LABEL_28;
        }
        goto LABEL_16;
      }
      if (a11 == 2)
      {
        v47 = a7;
        v48 = a8;
        v49 = a14;
        v57[0] = 0x1E49479B8;
        v57[1] = 0x1E49479D8;
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = (__CFString **)v57;
        v33 = 2;
      }
      else
      {
        if (a11 != 1)
          goto LABEL_16;
        v47 = a7;
        v48 = a8;
        v49 = a14;
        v58 = CFSTR("AttachmentsKey_ISPMotionData");
        v31 = (void *)MEMORY[0x1E0C99D20];
        v32 = &v58;
        v33 = 1;
      }
      v34 = (void *)objc_msgSend(v31, "arrayWithObjects:count:", v32, v33);
      v28 = 0;
    }
    else
    {
      switch(a11)
      {
        case 3:
          v47 = a7;
          v48 = a8;
          v49 = a14;
          v36 = vcvtps_s32_f32(0.042 / (float)(1.0 / a9));
          if (v36 <= 3)
            v28 = 3;
          else
            v28 = v36;
          v54[0] = 0x1E49478F8;
          v54[1] = 0x1E4947998;
          v27 = (void *)MEMORY[0x1E0C99D20];
          v29 = (__CFString **)v54;
          v30 = 2;
          break;
        case 2:
          v47 = a7;
          v48 = a8;
          v49 = a14;
          v55[0] = 0x1E49479B8;
          v55[1] = 0x1E49479D8;
          v34 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
          v35 = 0;
LABEL_28:
          v28 = 1;
          goto LABEL_29;
        case 1:
          v47 = a7;
          v48 = a8;
          v49 = a14;
          v56 = CFSTR("AttachmentsKey_ISPMotionData");
          v27 = (void *)MEMORY[0x1E0C99D20];
          v28 = 1;
          v29 = &v56;
          v30 = 1;
          break;
        default:
LABEL_16:

          v22 = 0;
          *a15 = -12787;
          return v22;
      }
      v34 = (void *)objc_msgSend(v27, "arrayWithObjects:count:", v29, v30);
    }
    v35 = 0;
LABEL_29:
    v37 = *MEMORY[0x1E0D06140];
    v52[0] = *MEMORY[0x1E0D06178];
    v52[1] = v37;
    v53[0] = a3;
    v53[1] = a4;
    v38 = *MEMORY[0x1E0D06188];
    v52[2] = *MEMORY[0x1E0D06138];
    v52[3] = v38;
    v53[2] = a6;
    v53[3] = a5;
    v52[4] = *MEMORY[0x1E0D06160];
    v53[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47);
    v52[5] = *MEMORY[0x1E0D06168];
    v53[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
    v52[6] = 0x1E49478B8;
    v53[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v35);
    v52[7] = 0x1E4947898;
    v53[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v28);
    v53[8] = v34;
    v52[8] = 0x1E4947878;
    v52[9] = 0x1E49478D8;
    v53[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a12);
    v22->_optionsDict = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 10);
    v39 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v22);
    v40 = objc_alloc_init(BWVideoFormatRequirements);
    if (v34)
    {
      v41 = v28;
      v42 = (void *)objc_msgSend(v34, "firstObject");
      if ((unint64_t)objc_msgSend(v34, "count") <= 1
        && objc_msgSend(v42, "isEqualToString:", 0x1E49478F8))
      {
        -[BWNodeInput setRetainedBufferCount:](v39, "setRetainedBufferCount:", 0);
      }
      else
      {
        -[BWNodeInput setDelayedBufferCount:](v39, "setDelayedBufferCount:", v41);
      }
    }
    -[BWNodeInput setFormatRequirements:](v39, "setFormatRequirements:", v40);

    -[BWNode addInput:](v22, "addInput:", v39);
    if (a13)
    {
      -[BWNodeInput setPassthroughMode:](v39, "setPassthroughMode:", 1);
      v43 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v22);
      v44 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWNodeOutput setName:](v43, "setName:", CFSTR("Source Video With Motion Attachments"));
      -[BWNodeOutput setPassthroughMode:](v43, "setPassthroughMode:", 1);
      -[BWNodeOutput setFormatRequirements:](v43, "setFormatRequirements:", v44);

      -[BWNode addOutput:](v22, "addOutput:", v43);
      v22->_sourceVideoWithMotionAttachmentsOutput = v43;

    }
    if (v49)
    {
      v45 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v22);
      v51 = *MEMORY[0x1E0CA4CB8];
      -[BWNodeOutput setFormat:](v45, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1)));
      -[BWNodeOutput setName:](v45, "setName:", CFSTR("Motion Attachments For Offline VIS"));
      -[BWNode addOutput:](v22, "addOutput:", v45);
      v22->_offlineVISMotionDataOutput = v45;

    }
    v22->_limitedGMErrorLogger = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("MotionAttachments"), 10);

  }
  return v22;
}

- (void)dealloc
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v4)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  objc_super v8;

  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    v4 = *(void (**)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                             + 16)
                                                                                 + 8);
    if (v4)
      v4(sampleBufferProcessor, 0, 0);
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      v6 = FigBaseObject;
      v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v7)
        v7(v6);
    }
    CFRelease(self->_sampleBufferProcessor);
  }

  v8.receiver = self;
  v8.super_class = (Class)BWMotionAttachmentsNode;
  -[BWNode dealloc](&v8, sel_dealloc);
}

- (id)nodeSubType
{
  return CFSTR("MotionAttachments");
}

- (void)didReachEndOfDataForInput:(id)a3
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v6)(OpaqueFigSampleBufferProcessor *);
  objc_super v7;

  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    v6 = *(void (**)(OpaqueFigSampleBufferProcessor *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v6)
      v6(sampleBufferProcessor);
  }
  -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
  v7.receiver = self;
  v7.super_class = (Class)BWMotionAttachmentsNode;
  -[BWNode didReachEndOfDataForInput:](&v7, sel_didReachEndOfDataForInput_, a3);
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v7)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  CMTime v8;
  CMTime v9;

  memset(&v9, 0, sizeof(v9));
  CMSampleBufferGetPresentationTimeStamp(&v9, a3);
  if (BWSampleBufferIsMarkerBuffer(a3))
  {
    -[BWMotionAttachmentsNode _flushIfRequiredForMarkerBuffer:]((uint64_t)self, a3);
    -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
  }
  else
  {
    sampleBufferProcessor = self->_sampleBufferProcessor;
    if (sampleBufferProcessor)
    {
      if (self->_adjustsValidBufferRectForDarkShade)
      {
        FigCaptureMetadataUtilitiesAdjustValidBufferRectForDarkShadeCropping(a3);
        sampleBufferProcessor = self->_sampleBufferProcessor;
      }
      v7 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 16);
      if (v7)
        v7(sampleBufferProcessor, a3);
    }
    else
    {
      v8 = v9;
      -[BWNodeOutput emitDroppedSample:](self->super._output, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1E494F058, &v8));
    }
  }
}

- (uint64_t)_flushIfRequiredForMarkerBuffer:(uint64_t)result
{
  uint64_t v3;
  void *v4;
  CFTypeRef v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  if (result)
  {
    v3 = result;
    v4 = (void *)CMGetAttachment(target, CFSTR("FileWriterAction"), 0);
    v5 = CMGetAttachment(target, CFSTR("AttachedMediaSwapPlaceholderSampleBuffer"), 0);
    if ((objc_msgSend(v4, "isEqualToString:", 0x1E495A098) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", 0x1E495A0B8) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", 0x1E495A118) & 1) != 0
      || (objc_msgSend(v4, "isEqualToString:", 0x1E495A0F8) & 1) != 0
      || (result = objc_msgSend(v4, "isEqualToString:", 0x1E495A158), (result & 1) != 0)
      || v5 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    {
      v6 = *(_QWORD *)(v3 + 96);
      if (v6)
      {
        v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v7)
          v7(v6);
      }
      return objc_msgSend(*(id *)(v3 + 128), "resetCurrentLoggingCounter");
    }
  }
  return result;
}

- (BWNodeOutput)offlineVISMotionDataOutput
{
  return self->_offlineVISMotionDataOutput;
}

- (BOOL)adjustsValidBufferRectForDarkShade
{
  return self->_adjustsValidBufferRectForDarkShade;
}

- (void)setAdjustsValidBufferRectForDarkShade:(BOOL)a3
{
  self->_adjustsValidBufferRectForDarkShade = a3;
}

@end
