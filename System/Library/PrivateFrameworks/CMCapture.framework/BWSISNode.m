@implementation BWSISNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWSISNode)initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 fusionScheme:(int)a5
{
  return (BWSISNode *)-[BWSISNode _initWithCameraTuningDictionary:sensorIDDictionary:sbpCreationFunction:fusionScheme:allowExperimentalOverrides:](self, "_initWithCameraTuningDictionary:sensorIDDictionary:sbpCreationFunction:fusionScheme:allowExperimentalOverrides:", a3, a4, sisn_createSampleBufferProcessorFunction, *(_QWORD *)&a5, 1);
}

- (void)dealloc
{
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v4)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  OpaqueFigSampleBufferProcessor *v8;
  objc_super v9;

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
    v8 = self->_sampleBufferProcessor;
    if (v8)
    {
      CFRelease(v8);
      self->_sampleBufferProcessor = 0;
    }
  }
  -[BWSISNode _clearCaptureRequestState]((uint64_t)self);

  v9.receiver = self;
  v9.super_class = (Class)BWSISNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(_QWORD *)(a1 + 208) = 0;
    *(_BYTE *)(a1 + 216) = 0;
    *(_DWORD *)(a1 + 220) = 0;
  }
}

- (id)_initWithCameraTuningDictionary:(id)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5 fusionScheme:(int)a6 allowExperimentalOverrides:(BOOL)a7
{
  BWSISNode *v11;
  BWNodeInput *v12;
  BWVideoFormatRequirements *v13;
  int v14;
  int sisBracketCount;
  uint64_t v16;
  BWNodeOutput *v17;
  BWVideoFormatRequirements *v18;
  objc_super v20;

  if (a6 >= 2)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("StillImageStabilization node supports only SeparateFusionAndNoiseReduction and TemporalMultiBandNoiseReduction fusion schemes!"), 0));
  v20.receiver = self;
  v20.super_class = (Class)BWSISNode;
  v11 = -[BWNode init](&v20, sel_init);
  if (v11)
  {
    v11->_cameraTuningDictionary = (NSDictionary *)a3;
    v11->_sensorIDDictionary = (NSDictionary *)a4;
    v11->_fusionScheme = a6;
    v11->_allowExperimentalOverrides = 0;
    if (-[BWSISNode _unpackSISOptions]((uint64_t)v11))
    {

      return 0;
    }
    else
    {
      v11->_createSampleBufferProcessorFunction = a5;
      v12 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v11);
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A00C20);
      -[BWNodeInput setFormatRequirements:](v12, "setFormatRequirements:", v13);
      v14 = v11->_oisBracketCount + 1;
      sisBracketCount = v11->_sisBracketCount;
      if (v14 <= sisBracketCount + 1)
        v16 = (sisBracketCount + 1);
      else
        v16 = v14;
      -[BWNodeInput setRetainedBufferCount:](v12, "setRetainedBufferCount:", v16);

      -[BWNode addInput:](v11, "addInput:", v12);
      v17 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v11);
      v18 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v18, "setSupportedPixelFormats:", &unk_1E4A00C38);
      -[BWNodeOutput setProvidesPixelBufferPool:](v17, "setProvidesPixelBufferPool:", 0);
      -[BWNodeOutput setFormatRequirements:](v17, "setFormatRequirements:", v18);

      -[BWNode addOutput:](v11, "addOutput:", v17);
      v11->_lastFusionTypeUsed = 0;
    }
  }
  return v11;
}

- (uint64_t)_unpackSISOptions
{
  uint64_t v1;
  void *v2;
  void *v3;
  const void *v4;
  const void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  void *v12;
  int v13;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 120))
    {
      *(_DWORD *)(result + 184) = 4;
      *(_DWORD *)(result + 152) = 0;
      v2 = (void *)objc_msgSend(*(id *)(result + 120), "objectForKeyedSubscript:", CFSTR("StillImageStabilization"));
      if (!v2)
        goto LABEL_21;
      v3 = v2;
      v4 = (const void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D07358]);
      if (!v4)
        goto LABEL_21;
      v5 = *(const void **)(v1 + 176);
      *(_QWORD *)(v1 + 176) = v4;
      CFRetain(v4);
      if (v5)
        CFRelease(v5);
      v6 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MaxGain"));
      if (!v6)
        goto LABEL_21;
      v7 = objc_msgSend(v6, "intValue");
      v8 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D087E0]);
      if (!v8)
        goto LABEL_21;
      *(_DWORD *)(v1 + 152) = objc_msgSend(v8, "intValue");
      v9 = (id)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D087E8]);
      *(_QWORD *)(v1 + 128) = v9;
      if (!*(_DWORD *)(v1 + 144) && !v9)
        goto LABEL_21;
      *(_QWORD *)(v1 + 136) = (id)objc_msgSend(*(id *)(v1 + 120), "objectForKeyedSubscript:", *MEMORY[0x1E0D087D8]);
      *(float *)(v1 + 160) = (float)v7 * 0.0039062;
      *(_DWORD *)(v1 + 156) = 67;
      if (*(_QWORD *)(v1 + 168))
        goto LABEL_16;
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (*(int *)(v1 + 184) >= 1)
      {
        v11 = 0;
        do
        {
          objc_msgSend(v10, "addObject:", &unk_1E4A02EA0);
          ++v11;
        }
        while (v11 < *(_DWORD *)(v1 + 184));
      }
      *(_QWORD *)(v1 + 168) = v10;
      if (v10)
      {
LABEL_16:
        v12 = *(void **)(v1 + 192);
        if (!v12)
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E49FA098, &unk_1E49FA0B0, 0);
          *(_QWORD *)(v1 + 192) = v12;
        }
        v13 = objc_msgSend(v12, "count");
        result = 0;
        *(_DWORD *)(v1 + 200) = v13;
      }
      else
      {
LABEL_21:
        fig_log_get_emitter();
        FigDebugAssert3();
        return FigSignalErrorAt();
      }
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 4294954516;
    }
  }
  return result;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWVideoFormatRequirements *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1));
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", objc_msgSend(a3, "width"));
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", objc_msgSend(a3, "height"));
  -[BWVideoFormatRequirements setSupportedCacheModes:](v6, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  }
  else
  {
    v7 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v6, "setSupportedColorSpaceProperties:", v7);
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v6);

}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("StillImageStabilizer");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  uint64_t FigBaseObject;
  void (*v7)(uint64_t, _QWORD, uint64_t);
  NSDictionary *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD, NSDictionary *);
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWSISNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
  if (!self->_sampleBufferProcessor && -[BWSISNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    fig_log_get_emitter();
    v12 = v2;
    LODWORD(v11) = 0;
    FigDebugAssert3();
  }
  if (self->_allowAllocationsAtPrepareTime
    && self->_sampleBufferProcessor
    && !-[BWSISNode livePhotoSupported](self, "livePhotoSupported"))
  {
    if (-[BWSISNode OISSupported](self, "OISSupported"))
      v4 = 2;
    else
      v4 = 1;
    self->_lastFusionTypeUsed = v4;
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11, v12);
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    v7 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(FigBaseObject, *MEMORY[0x1E0D08808], v5);
    v8 = -[BWVideoFormat pixelBufferAttributes](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "pixelBufferAttributes");
    v9 = FigSampleBufferProcessorGetFigBaseObject();
    v10 = *(void (**)(uint64_t, _QWORD, NSDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v10)
      v10(v9, *MEMORY[0x1E0D061A0], v8);
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  id v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, const __CFString *, void *, uint64_t *);
  const __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v13;
  uint64_t v15;

  if (!a1)
    return 0;
  v15 = 0;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v2;
  if (!*(_QWORD *)(a1 + 112))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = FigSignalErrorAt();
    goto LABEL_21;
  }
  v4 = *(_DWORD *)(a1 + 144);
  if (v4 == 1)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E49FA0C8, *MEMORY[0x1E0D087F0]);
    v7 = *MEMORY[0x1E0D087F8];
    v6 = &unk_1E49FA0E0;
  }
  else
  {
    if (v4)
      goto LABEL_10;
    objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E49FA0C8, *MEMORY[0x1E0D087F0]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E49FA0E0, *MEMORY[0x1E0D087F8]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 128), *MEMORY[0x1E0D087E8]);
    v5 = *(_QWORD *)(a1 + 136);
    if (v5)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D087D8]);
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 152));
    v7 = *MEMORY[0x1E0D087E0];
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, v7);
LABEL_10:
  v8 = *(uint64_t (**)(_QWORD, const __CFString *, void *, uint64_t *))(a1 + 96);
  if (!v8)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v13 = 0;
    goto LABEL_21;
  }
  if (*(_DWORD *)(a1 + 144))
    v9 = CFSTR("TMBNR");
  else
    v9 = CFSTR("SIS");
  v10 = v8(*MEMORY[0x1E0C9AE00], v9, v3, &v15);
  if ((_DWORD)v10)
  {
    v13 = v10;
    fig_log_get_emitter();
    goto LABEL_20;
  }
  v11 = v15;
  *(_QWORD *)(a1 + 104) = v15;
  v12 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                             + 8);
  if (!v12)
  {
    v13 = 4294954514;
LABEL_19:
    fig_log_get_emitter();
LABEL_20:
    FigDebugAssert3();
    goto LABEL_21;
  }
  v13 = v12(v11, sisn_processorOutputReadyCallback, a1);
  if ((_DWORD)v13)
    goto LABEL_19;
LABEL_21:

  return v13;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  int lastFusionTypeUsed;
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v19)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD);
  uint64_t FigBaseObject;
  uint64_t v21;
  void (*v22)(uint64_t);
  OpaqueFigSampleBufferProcessor *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, _QWORD, uint64_t);
  int v27;
  OpaqueFigSampleBufferProcessor *v28;
  unsigned int (*v29)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  int v30;
  _BOOL4 preBracketedFrameReceived;
  OpaqueFigSampleBufferProcessor *v32;
  unsigned int (*v33)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);

  if (!a3 || !self->_sampleBufferProcessor)
    return;
  v6 = (void *)CMGetAttachment(a3, CFSTR("StillImageSettings"), 0);
  if (!v6)
    goto LABEL_35;
  if (!self->_currentCaptureSettings)
    self->_currentCaptureSettings = (FigCaptureStillImageSettings *)v6;
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v7)
    goto LABEL_35;
  v8 = v7;
  v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
  v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
  v11 = (void *)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, CFSTR("BWStillImageCaptureSettings"), 0), "captureStreamSettingsForPortType:", objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), "bracketSettings");
  if (!v11)
    goto LABEL_35;
  v12 = v11;
  v13 = objc_msgSend(v11, "providePreBracketedEV0");
  v14 = objc_msgSend(v12, "bracketFrameCount");
  v15 = objc_msgSend((id)CMGetAttachment(a3, CFSTR("StillImageCaptureType"), 0), "intValue");
  if (v15 == 4)
    v16 = 1;
  else
    v16 = 2;
  if (v15 == 5 && self->_alwaysRequestsPreBracketedEV0)
    v13 = 0;
  lastFusionTypeUsed = self->_lastFusionTypeUsed;
  if (lastFusionTypeUsed && (_DWORD)v16 != lastFusionTypeUsed)
  {
    sampleBufferProcessor = self->_sampleBufferProcessor;
    if (sampleBufferProcessor)
    {
      v19 = *(void (**)(OpaqueFigSampleBufferProcessor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 16)
                                                                                    + 8);
      if (v19)
        v19(sampleBufferProcessor, 0, 0);
      FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
      if (FigBaseObject)
      {
        v21 = FigBaseObject;
        v22 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v22)
          v22(v21);
      }
      v23 = self->_sampleBufferProcessor;
      if (v23)
      {
        CFRelease(v23);
        self->_sampleBufferProcessor = 0;
      }
    }
    -[BWSISNode _setupSampleBufferProcessor]((uint64_t)self);
  }
  self->_lastFusionTypeUsed = v16;
  if (!self->_numberFramesReceived)
  {
    v24 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
    v25 = FigSampleBufferProcessorGetFigBaseObject();
    v26 = *(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v26)
      v26(v25, *MEMORY[0x1E0D08808], v24);
  }
  if (!v10)
  {
    if (v9 < 1 || v9 > v14)
      return;
    v30 = self->_numberFramesReceived + 1;
    self->_numberFramesReceived = v30;
    if (v9 == v14)
    {
      if (v13)
        preBracketedFrameReceived = self->_preBracketedFrameReceived;
      else
        preBracketedFrameReceived = 1;
      if (v30 != v9 || !preBracketedFrameReceived)
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        goto LABEL_49;
      }
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C88], (CFTypeRef)*MEMORY[0x1E0C9AE50], 0);
    }
    v32 = self->_sampleBufferProcessor;
    v33 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 16);
    if (!v33 || v33(v32, a3))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (v9 != v14)
      return;
LABEL_49:
    -[BWSISNode _clearCaptureRequestState]((uint64_t)self);
    return;
  }
  if (self->_alwaysRequestsPreBracketedEV0)
    v27 = v13;
  else
    v27 = 1;
  if (v27 == 1)
  {
    self->_preBracketedFrameReceived = 1;
    v28 = self->_sampleBufferProcessor;
    v29 = *(unsigned int (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 16);
    if (!v29 || v29(v28, a3))
    {
LABEL_35:
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  FigCaptureStillImageSettings *currentCaptureSettings;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, _QWORD, _QWORD);

  currentCaptureSettings = self->_currentCaptureSettings;
  if (currentCaptureSettings)
  {
    if (currentCaptureSettings == (FigCaptureStillImageSettings *)objc_msgSend((id)objc_msgSend(a3, "stillImageSettings", a3, a4), "requestedSettings"))
    {
      -[BWSISNode _clearCaptureRequestState]((uint64_t)self);
      if (self->_sampleBufferProcessor)
      {
        FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        v8 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v8)
          v8(FigBaseObject, *MEMORY[0x1E0D08818], *MEMORY[0x1E0C9AE50]);
      }
    }
  }
  -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3, a4);
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3
{
  self->_alwaysRequestsPreBracketedEV0 = a3;
}

- (BOOL)alwaysRequestsPreBracketedEV0
{
  return self->_alwaysRequestsPreBracketedEV0;
}

- (void)setLivePhotoSupported:(BOOL)a3
{
  self->_livePhotoSupported = a3;
}

- (BOOL)livePhotoSupported
{
  return self->_livePhotoSupported;
}

- (void)setOISSupported:(BOOL)a3
{
  self->_OISSupported = a3;
}

- (BOOL)OISSupported
{
  return self->_OISSupported;
}

- (void)setAllowAllocationsAtPrepareTime:(BOOL)a3
{
  self->_allowAllocationsAtPrepareTime = a3;
}

- (BOOL)allowAllocationsAtPrepareTime
{
  return self->_allowAllocationsAtPrepareTime;
}

- (void)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:
{
  uint64_t v4;
  uint64_t v6;
  uint64_t FigBaseObject;
  void (*v8)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  const __CFString *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  CFTypeRef v12;
  id v13;
  CFTypeRef value;
  CFTypeRef cf;

  if (!a1)
    return;
  v4 = a2;
  value = 0;
  cf = 0;
  if ((_DWORD)a2)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_19;
  }
  if (!*(_DWORD *)(a1 + 144) && objc_msgSend(*(id *)(a1 + 208), "noiseReductionEnabled"))
  {
    v6 = *MEMORY[0x1E0C9AE00];
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    v8 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v8)
    {
      v9 = (const __CFString *)*MEMORY[0x1E0D08800];
      v8(FigBaseObject, *MEMORY[0x1E0D08800], v6, &value);
      if (value)
        CMSetAttachment(a3, v9, value, 0);
    }
    v10 = FigSampleBufferProcessorGetFigBaseObject();
    v11 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
    if (v11)
    {
      v4 = v11(v10, *MEMORY[0x1E0D08810], v6, &cf);
      if (cf)
        CMSetAttachment(a3, CFSTR("NoiseReductionAlternateMetadata"), cf, 0);
      if (!(_DWORD)v4)
        goto LABEL_12;
    }
    else
    {
      v4 = 4294954514;
    }
LABEL_19:
    v12 = CMGetAttachment(a3, CFSTR("StillSettings"), 0);
    v13 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v4, a1, v12, CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0));
    objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v13);

    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", a3);
LABEL_13:
  if (value)
    CFRelease(value);
  if (cf)
    CFRelease(cf);
}

@end
