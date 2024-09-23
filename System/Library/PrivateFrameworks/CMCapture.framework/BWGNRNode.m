@implementation BWGNRNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWGNRNode)initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12
{
  uint64_t v13;

  LOBYTE(v13) = 0;
  return (BWGNRNode *)-[BWGNRNode _initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:sbpCreationFunction:treatSoftErrorsAsHardErrors:](self, "_initWithSISEnabled:OISEnabled:LTMHDREnabled:processingLTMHDRFusion:portType:sensorID:sensorIDDictionary:telephotoPortType:telephotoSensorID:telephotoSensorIDDictionary:sbpCreationFunction:treatSoftErrorsAsHardErrors:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, gnrn_createSampleBufferProcessorFunction, v13);
}

- (id)_initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12 sbpCreationFunction:(void *)a13 treatSoftErrorsAsHardErrors:(BOOL)a14
{
  BWGNRNode *v20;
  BWGNRNode *v21;
  BWNodeInput *v22;
  BWVideoFormatRequirements *v23;
  BWNodeOutput *v24;
  BWVideoFormatRequirements *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)BWGNRNode;
  v20 = -[BWNode init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_sisEnabled = a3;
    v20->_oisEnabled = a4;
    v20->_hdrEnabled = a5;
    v20->_processingLTMHDRFusion = a6;
    v20->_previouslyCompletedFusionSettingsID = -1;
    v20->_receivedReferenceFrameBracketedCaptureSequenceNumber = -1;
    v20->_gnrFusionReferenceFrameBracketedCaptureSequenceNumber = -1;
    v20->_processingHDREV0BracketFrame = 0;
    v20->_hdrEV0BracketCaptureIdentifier = -1;
    v20->_hdrDisparityBracketedCaptureSequenceNumber = -1;
    v20->_portType = (NSString *)a7;
    v21->_sensorID = (NSString *)a8;
    v21->_sensorIDDictionary = (NSDictionary *)a9;
    v21->_telephotoPortType = (NSString *)a10;
    v21->_telephotoSensorID = (NSString *)a11;
    v21->_telephotoSensorIDDictionary = (NSDictionary *)a12;
    v21->_createSampleBufferProcessorFunction = a13;
    v22 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v21);
    v23 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", &unk_1E4A00398);
    -[BWNodeInput setFormatRequirements:](v22, "setFormatRequirements:", v23);

    -[BWNodeInput setPassthroughMode:](v22, "setPassthroughMode:", 0);
    -[BWNodeInput setRetainedBufferCount:](v22, "setRetainedBufferCount:", -[BWGNRNode _worstCaseFrameRetainCount]((unint64_t)v21));
    -[BWNode addInput:](v21, "addInput:", v22);

    v24 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v21);
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v25, "setSupportedPixelFormats:", &unk_1E4A003B0);
    -[BWNodeOutput setFormatRequirements:](v24, "setFormatRequirements:", v25);

    -[BWNodeOutput setProvidesPixelBufferPool:](v24, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutput setPassthroughMode:](v24, "setPassthroughMode:", 0);
    -[BWNode addOutput:](v21, "addOutput:", v24);

  }
  return v21;
}

- (unint64_t)_worstCaseFrameRetainCount
{
  unsigned int v1;
  int v2;
  unsigned int v3;

  if (result)
  {
    v1 = 4 * *(unsigned __int8 *)(result + 96);
    v2 = *(unsigned __int8 *)(result + 97);
    if (*(_BYTE *)(result + 98))
      v3 = 3;
    else
      v3 = 0;
    if (v1 <= 4 * v2)
      v1 = 4 * v2;
    if (v1 <= v3)
      v1 = v3;
    if (v1 <= 1)
      return 1;
    else
      return v1;
  }
  return result;
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

  -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
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

  v9.receiver = self;
  v9.super_class = (Class)BWGNRNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  const void *v2;

  if (a1)
  {

    *(_QWORD *)(a1 + 176) = 0;
    *(_DWORD *)(a1 + 184) = 0;
    *(_BYTE *)(a1 + 188) = 0;
    *(_BYTE *)(a1 + 189) = 0;
    *(_BYTE *)(a1 + 190) = 0;
    *(_DWORD *)(a1 + 192) = 0;
    *(_DWORD *)(a1 + 196) = 0;
    *(_BYTE *)(a1 + 200) = 0;
    *(_DWORD *)(a1 + 204) = -1;
    *(_DWORD *)(a1 + 208) = -1;
    *(_DWORD *)(a1 + 216) = -1;
    *(_DWORD *)(a1 + 220) = -1;
    objc_msgSend(*(id *)(a1 + 224), "removeAllObjects");
    v2 = *(const void **)(a1 + 232);
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)(a1 + 232) = 0;
    }
  }
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
  return CFSTR("GeneralNoiseReducerAndFusionProcessor");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWGNRNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v3, sel_prepareForCurrentConfigurationToBecomeLive);
  if (self->_sampleBufferProcessor || !-[BWGNRNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    if (self->_hdrEnabled && self->_portType && self->_telephotoPortType && !self->_stereoFusedGNRHDRPixelConverter)
      self->_stereoFusedGNRHDRPixelConverter = objc_alloc_init(FigCapturePixelConverter);
    self->_inputAttachedMedia = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  _QWORD *v2;
  uint64_t (*v3)(_QWORD, const __CFString *, _QWORD *, uint64_t *);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t (*)(), uint64_t);
  uint64_t FigBaseObject;
  uint64_t (*v9)(uint64_t, _QWORD, uint64_t, id *);
  id v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];
  id v15;
  uint64_t v16;

  if (!a1)
    return 0;
  v15 = 0;
  v16 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = __Block_byref_object_copy__9;
  v14[4] = __Block_byref_object_dispose__9;
  v14[5] = a1;
  v2 = -[BWGNRNode sbpOptionsDictionary]((_QWORD *)a1);
  if (v2 && (v3 = *(uint64_t (**)(_QWORD, const __CFString *, _QWORD *, uint64_t *))(a1 + 112)) != 0)
  {
    v4 = *MEMORY[0x1E0C9AE00];
    v5 = v3(*MEMORY[0x1E0C9AE00], CFSTR("GNR"), v2, &v16);
    if ((_DWORD)v5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      v10 = 0;
    }
    else
    {
      v6 = v16;
      *(_QWORD *)(a1 + 120) = v16;
      v7 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                            + 16)
                                                                                + 8);
      if (v7)
      {
        v5 = v7(v6, gnrn_processorOutputReadyCallback, a1);
        if ((_DWORD)v5)
        {
          v10 = 0;
          goto LABEL_11;
        }
        FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        v9 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (v9)
        {
          v5 = v9(FigBaseObject, *MEMORY[0x1E0D084C8], v4, &v15);
          v10 = v15;
          if (!(_DWORD)v5)
          {
            v13[0] = MEMORY[0x1E0C809B0];
            v13[1] = 3221225472;
            v13[2] = __40__BWGNRNode__setupSampleBufferProcessor__block_invoke;
            v13[3] = &unk_1E491F900;
            v13[4] = v14;
            objc_msgSend(v15, "setReferenceFrameSelectionHandlerBlock:", v13);
            v11 = (void *)objc_msgSend(*(id *)(a1 + 8), "videoFormat");
            objc_msgSend(v15, "prepareForProcessingPixelBuffersWithAttributes:", objc_msgSend(v11, "pixelBufferAttributes"));
            v5 = 0;
            v10 = v15;
          }
          goto LABEL_11;
        }
      }
      v10 = 0;
      v5 = 4294954514;
    }
  }
  else
  {
    v10 = 0;
    v5 = 0;
  }
LABEL_11:

  _Block_object_dispose(v14, 8);
  return v5;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  int *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  unsigned int processingType;
  BOOL v22;
  int v23;
  BOOL v24;
  int v25;
  char v26;
  _BOOL4 v27;
  CGSize v28;
  uint64_t v29;
  void *v30;
  double v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  id v36;
  void *v37;
  unsigned int v38;
  OpaqueFigSampleBufferProcessor *v39;
  void (*v40)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  unsigned int v41;
  uint64_t v42;
  id *v43;
  opaqueCMSampleBuffer *v44;
  void *v45;
  double v46;
  OpaqueFigSampleBufferProcessor *sampleBufferProcessor;
  void (*v48)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  unsigned int v49;
  char v50;
  unsigned int expectedFrameCount;
  _BOOL4 v52;
  int v53;
  CFTypeRef v54;
  void *v55;
  opaqueCMSampleBuffer *collectedUnprocessedPreBracketHDR;
  OpaqueFigSampleBufferProcessor *v57;
  void (*v58)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  opaqueCMSampleBuffer *v59;
  OpaqueFigSampleBufferProcessor *v60;
  void (*v61)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *);
  int v62;
  unsigned int v63;
  _BOOL4 v64;
  uint64_t receivedReferenceFrameBracketedCaptureSequenceNumber;
  unsigned int v66;
  uint64_t v67;
  id v68;
  opaqueCMSampleBuffer *v69;
  signed int v70;
  CGRect cf;

  if (!a3)
    return;
  v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  if (!v6)
    return;
  v7 = v6;
  v8 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
  v9 = *MEMORY[0x1E0D06910];
  v70 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06910]), "intValue");
  v10 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
  v11 = v10;
  v12 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  if (!self->_sampleBufferProcessor)
    goto LABEL_144;
  if (self->_currentStillImageSettings)
  {
    if (v10)
      goto LABEL_6;
LABEL_30:
    processingType = self->_processingType;
    v22 = processingType > 0xA;
    v23 = (1 << processingType) & 0x431;
    v24 = v22 || v23 == 0;
    if (v24 && (v70 < 1 || v70 > self->_expectedFrameCount))
      return;
    v68 = -[BWStillImageCaptureSettings captureStreamSettingsForPortType:](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureStreamSettingsForPortType:", v8);
    v25 = self->_processingType;
    if (v25 != 9 && v25 != 3
      || (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x400) == 0)
    {
      v26 = 0;
      v27 = 0;
      v69 = a3;
LABEL_86:
      ++self->_receivedFrameCount;
      if (self->_hdrEnabled)
      {
        v45 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038]);
        if (v45)
        {
          objc_msgSend(v45, "doubleValue");
          if (v46 == 0.0)
          {
            self->_hdrEV0BracketCaptureIdentifier = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB0]), "intValue");
            if (-[BWGNRNode _isBravoHDRDepthDataCapture]((uint64_t)self))
            {
              self->_processingHDREV0BracketFrame = 1;
              v67 = *MEMORY[0x1E0D084D8];
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D8], (uint64_t)&unk_1E49F8880);
              sampleBufferProcessor = self->_sampleBufferProcessor;
              v48 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
              if (v48)
                v48(sampleBufferProcessor, a3);
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
              if (!-[NSString isEqualToString:](self->_portType, "isEqualToString:", *MEMORY[0x1E0D05A30]))
                goto LABEL_137;
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, v67, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processingType));
              self->_hdrDisparityBracketedCaptureSequenceNumber = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v9), "intValue");
            }
          }
        }
      }
      v49 = self->_processingType;
      if (v49 > 0xA || ((1 << v49) & 0x431) == 0)
      {
        v54 = BWSampleBufferCopyDictionaryOfAttachedMedia(v69);
        if (v54)
        {
          v55 = (void *)v54;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputAttachedMedia, "setObject:forKeyedSubscript:", v54, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70));

        }
        BWSampleBufferRemoveAttachedMedia(a3, (uint64_t)CFSTR("Depth"));
      }
      if (v70 < 1)
        v50 = 1;
      else
        v50 = v26;
      expectedFrameCount = self->_expectedFrameCount;
      if ((v50 & 1) != 0)
      {
        v52 = v27;
        if (expectedFrameCount)
        {
          v53 = self->_receivedFrameCount >= expectedFrameCount;
          goto LABEL_112;
        }
      }
      else
      {
        if (expectedFrameCount && self->_receivedFrameCount < expectedFrameCount)
        {
          v52 = v27;
          if (v70 == expectedFrameCount)
            v53 = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture]((uint64_t)self) ^ 1;
          else
            v53 = 0;
LABEL_112:
          self->_receivedAllFrames = v53;
          collectedUnprocessedPreBracketHDR = self->_collectedUnprocessedPreBracketHDR;
          if (collectedUnprocessedPreBracketHDR)
          {
            v57 = self->_sampleBufferProcessor;
            v58 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                  + 16);
            if (v58)
              v58(v57, collectedUnprocessedPreBracketHDR);
            v59 = self->_collectedUnprocessedPreBracketHDR;
            if (v59)
            {
              CFRelease(v59);
              self->_collectedUnprocessedPreBracketHDR = 0;
            }
          }
          v60 = self->_sampleBufferProcessor;
          v61 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 16);
          if (v61)
            v61(v60, v69);
          LOBYTE(v27) = v52;
          if (objc_msgSend(v68, "captureType") == 5
            && self->_receivedFrameCount == self->_expectedFrameCount - 1)
          {
            v62 = objc_msgSend(v68, "timeMachineFrameCount");
            if (-[BWStillImageCaptureSettings bracketedCaptureSequenceNumberForOISLongExposure](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "bracketedCaptureSequenceNumberForOISLongExposure")+ v62 == self->_expectedFrameCount)-[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084E8], MEMORY[0x1E0C9AAB0]);
          }
          if (!self->_receivedAllFrames)
          {
            v63 = self->_processingType;
            if (v63 > 0xA || ((1 << v63) & 0x431) == 0)
              goto LABEL_136;
          }
          -[BWGNRNode _detectMissingPreBracketedFrameAndEmitBWNodeError]((uint64_t)self);
          v64 = -[BWStillImageCaptureSettings expectReferenceFrameBracketedCaptureSequenceNumber](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "expectReferenceFrameBracketedCaptureSequenceNumber");
          receivedReferenceFrameBracketedCaptureSequenceNumber = self->_receivedReferenceFrameBracketedCaptureSequenceNumber;
          if (v64)
          {
            if ((_DWORD)receivedReferenceFrameBracketedCaptureSequenceNumber != -1)
              goto LABEL_132;
            if (self->_hdrDisparityBracketedCaptureSequenceNumber == -1)
            {
LABEL_138:
              if (!v27)
                return;
LABEL_142:
              CFRelease(v69);
              return;
            }
          }
          else if ((_DWORD)receivedReferenceFrameBracketedCaptureSequenceNumber != -1)
          {
            goto LABEL_132;
          }
          receivedReferenceFrameBracketedCaptureSequenceNumber = self->_hdrDisparityBracketedCaptureSequenceNumber;
LABEL_132:
          if ((receivedReferenceFrameBracketedCaptureSequenceNumber & 0x80000000) == 0)
            -[BWGNRNode _setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:]((uint64_t)self, receivedReferenceFrameBracketedCaptureSequenceNumber);
          -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
          v66 = self->_processingType;
          if (v66 > 0xA || ((1 << v66) & 0x431) == 0)
          {
            self->_previouslyCompletedFusionSettingsID = -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID");
            if (v53)
              goto LABEL_137;
            goto LABEL_141;
          }
LABEL_136:
          if (v53)
          {
LABEL_137:
            -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
            goto LABEL_138;
          }
LABEL_141:
          if (!v52)
            return;
          goto LABEL_142;
        }
        v52 = v27;
      }
      v53 = 1;
      goto LABEL_112;
    }
    v28 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    cf.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    cf.size = v28;
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D05A18]))
    {
      v29 = *MEMORY[0x1E0D05E68];
      if (FigCFDictionaryGetCGRectIfPresent())
        objc_msgSend(v7, "removeObjectForKey:", v29);
    }
    v30 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06038]);
    if (v30 && (objc_msgSend(v30, "doubleValue"), v31 == 0.0))
    {
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D084F0], (CFTypeRef)*MEMORY[0x1E0C9AE50], 1u);
    }
    else if (!CGRectIsNull(cf))
    {
      v43 = -[BWGNRNode _copyAndZoomSampleBuffer:usingNormalizedZoomRectangle:]((id *)&self->super.super.isa, a3, cf.origin.x, cf.origin.y, cf.size.width, cf.size.height);
      v27 = v43 != 0;
      if (v43)
        v44 = (opaqueCMSampleBuffer *)v43;
      else
        v44 = a3;
      v69 = v44;
      goto LABEL_85;
    }
    v27 = 0;
    v69 = a3;
LABEL_85:
    v26 = 1;
    goto LABEL_86;
  }
  v13 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v13 || (v14 = v13, objc_msgSend(v13, "settingsID") == self->_previouslyCompletedFusionSettingsID))
  {
LABEL_144:
    v33 = 4294954516;
    goto LABEL_56;
  }
  self->_currentStillImageSettings = (BWStillImageSettings *)v14;
  -[BWGNRNode _setExpectedFrameCountForPortType:]((uint64_t)self, (uint64_t)v8);
  v15 = -[BWGNRNode _gnrProcessingTypeWithMetadataDictionary:]((uint64_t)self, v7);
  v16 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15));
  if ((_DWORD)v16)
  {
    v33 = v16;
    v12 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    goto LABEL_56;
  }
  self->_processingType = v15;
  v17 = -[BWStillImageCaptureSettings captureType](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureType");
  if ((v17 & 0xFFFFFFFE) == 4)
  {
    v18 = 1;
    v12 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
  }
  else
  {
    v12 = &OBJC_IVAR___BWActionCameraFlickerAvoidanceMonitor__currentFrameRate;
    v18 = v17 == 3 && self->_hdrEnabled;
  }
  if (v18 && self->_allowedToModifyInputBuffers)
    v20 = (uint64_t *)MEMORY[0x1E0C9AE50];
  else
    v20 = (uint64_t *)MEMORY[0x1E0C9AE40];
  -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0CC5E10], *v20);
  if (!v11)
    goto LABEL_30;
LABEL_6:
  self->_receivedPreBracketFrame = 1;
  if (-[BWStillImageCaptureSettings captureType](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureType") == 3)
  {
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x400) == 0)
    {
      if (self->_hdrEnabled)
      {
        self->_collectedUnprocessedPreBracketHDR = (opaqueCMSampleBuffer *)CFRetain(a3);
        if (!-[BWStillImageCaptureSettings deliverOriginalImage](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "deliverOriginalImage"))return;
      }
      goto LABEL_52;
    }
    if (self->_portType && self->_telephotoPortType)
    {
      if (-[BWStillImageCaptureSettings deliverOriginalImage](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "deliverOriginalImage"))
      {
        cf.origin.x = 0.0;
        if (BWCMSampleBufferCreateCopyIncludingMetadata(a3, (CMSampleBufferRef *)&cf))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return;
        }
        -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", *(_QWORD *)&cf.origin.x);
        if (*(_QWORD *)&cf.origin.x)
          CFRelease(*(CFTypeRef *)&cf.origin.x);
      }
      v19 = 98;
LABEL_51:
      if (!*((_BYTE *)&self->super.super.isa + v19))
        return;
      goto LABEL_52;
    }
    if (!-[BWStillImageCaptureSettings deliverOriginalImage](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "deliverOriginalImage"))
    {
      v19 = 256;
      goto LABEL_51;
    }
  }
LABEL_52:
  v32 = self->_processingType;
  if ((v32 == 9 || v32 == 3)
    && (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x400) == 0)
  {
    v33 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0));
    LOBYTE(v11) = 1;
    if ((_DWORD)v33)
    {
LABEL_56:
      v34 = self->_expectedFrameCount;
      if (v34 && (v34 == 1 || v70 == v34))
      {
        v35 = 1;
        if ((v11 & 1) == 0)
        {
LABEL_60:
          -[BWGNRNode _detectMissingPreBracketedFrameAndEmitBWNodeError]((uint64_t)self);
          v36 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v33, self, *(Class *)((char *)&self->super.super.isa + v12[858]), v7);
          -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", v36);

        }
      }
      else
      {
        if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v12[858]), "captureSettings"), "captureType") != 7)
        {
LABEL_80:
          -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
          return;
        }
        v35 = 0;
        if ((v11 & 1) == 0)
          goto LABEL_60;
      }
      if (v35)
      {
        v37 = *(Class *)((char *)&self->super.super.isa + v12[858]);
        if (v37)
        {
          v38 = self->_processingType;
          if (v38 > 0xA || ((1 << v38) & 0x431) == 0)
            self->_previouslyCompletedFusionSettingsID = objc_msgSend(v37, "settingsID");
        }
      }
      goto LABEL_80;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  v39 = self->_sampleBufferProcessor;
  v40 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 16);
  if (v40)
    v40(v39, a3);
  v41 = self->_processingType;
  if (v41 <= 0xA && ((1 << v41) & 0x431) != 0)
  {
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
    if ((v11 & 1) == 0)
      return;
  }
  else
  {
    if ((v11 & 1) == 0)
      return;
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
  }
  v42 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_processingType));
  if ((_DWORD)v42)
  {
    v33 = v42;
    LOBYTE(v11) = 1;
    goto LABEL_56;
  }
}

- (uint64_t)_setExpectedFrameCountForPortType:(uint64_t)result
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  char v6;
  int v7;
  int v8;

  if (result)
  {
    v2 = result;
    v3 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureStreamSettingsForPortType:", a2);
    v4 = objc_msgSend(v3, "captureType");
    result = objc_msgSend(v3, "bracketSettings");
    v5 = (void *)result;
    if (result)
    {
      v6 = objc_msgSend((id)result, "providePreBracketedEV0");
      v7 = objc_msgSend(v3, "expectedFrameCount");
      result = objc_msgSend(v5, "providePreBracketedEV0");
      v8 = v7 - result;
    }
    else
    {
      v6 = 0;
      v8 = 1;
    }
    if (!*(_DWORD *)(v2 + 192))
    {
      *(_DWORD *)(v2 + 192) = v8;
      *(_BYTE *)(v2 + 189) = v6;
      result = objc_msgSend(v5, "providePreBracketedEV0");
      if ((_DWORD)result)
        result = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 176), "captureSettings"), "deliverOriginalImage");
      *(_BYTE *)(v2 + 188) = result;
      if (v4 == 3)
      {
        if (*(_BYTE *)(v2 + 98))
        {
          result = -[BWGNRNode _isBravoHDRDepthDataCapture](v2);
          if ((_DWORD)result)
          {
            result = objc_msgSend(*(id *)(v2 + 128), "isEqualToString:", *MEMORY[0x1E0D05A18]);
            if ((_DWORD)result)
              *(_DWORD *)(v2 + 192) = 1;
          }
        }
        else
        {
          *(_DWORD *)(v2 + 192) = 1;
          result = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v2);
          if ((_DWORD)result)
            ++*(_DWORD *)(v2 + 192);
          if (*(_QWORD *)(v2 + 128) && *(_QWORD *)(v2 + 152) && !*(_BYTE *)(v2 + 188))
            *(_BYTE *)(v2 + 189) = 0;
        }
      }
    }
  }
  return result;
}

- (uint64_t)_gnrProcessingTypeWithMetadataDictionary:(uint64_t)result
{
  uint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t v10;
  unsigned int v11;

  if (result)
  {
    v3 = result;
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00])), "captureType");
    v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 176), "captureSettings"), "captureFlags") & 0x400;
    switch(v4)
    {
      case 1:
      case 2:
        v6 = v5 >> 8;
        break;
      case 3:
        if (v5)
        {
          if (*(_QWORD *)(v3 + 128) && *(_QWORD *)(v3 + 152))
          {
            v7 = *(_BYTE *)(v3 + 98) == 0;
            v8 = 9;
            v9 = 5;
            goto LABEL_13;
          }
          LODWORD(v6) = 4;
        }
        else if (*(_BYTE *)(v3 + 98))
        {
          LODWORD(v6) = 9;
        }
        else
        {
          LODWORD(v6) = 0;
        }
        break;
      case 4:
        if (v5)
          LODWORD(v6) = 6;
        else
          LODWORD(v6) = 1;
        break;
      case 5:
        v7 = v5 == 0;
        v8 = 7;
        v9 = 2;
LABEL_13:
        if (v7)
          LODWORD(v6) = v9;
        else
          LODWORD(v6) = v8;
        break;
      default:
        LODWORD(v6) = 0;
        break;
    }
    v10 = *MEMORY[0x1E0D06CB0];
    if (objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06CB0]))
    {
      if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v10), "BOOLValue"))
        v11 = 0;
      else
        v11 = 10;
    }
    else
    {
      v11 = 0;
    }
    if ((_DWORD)v6)
      return v6;
    else
      return v11;
  }
  return result;
}

- (uint64_t)_setPropertyOnSampleBufferProcessorWithKey:(uint64_t)a3 value:
{
  uint64_t FigBaseObject;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  if (result)
  {
    FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
      return v6(FigBaseObject, a2, a3);
    else
      return 4294954514;
  }
  return result;
}

- (id)_copyAndZoomSampleBuffer:(CGFloat)a3 usingNormalizedZoomRectangle:(CGFloat)a4
{
  id *v11;
  const opaqueCMFormatDescription *FormatDescription;
  CMVideoDimensions Dimensions;
  unint64_t v14;
  unsigned int v15;
  unint64_t v17;
  CFTypeRef v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  unsigned int v28;
  unsigned int v29;
  const char *v30;
  CMAttachmentBearerRef target;

  if (result)
  {
    v11 = result;
    target = 0;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
    if (objc_msgSend(v11[30], "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "pixelFormat"), Dimensions, 2, objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "colorSpaceProperties"), 1))
    {
      fig_log_get_emitter();
    }
    else
    {
      if (!objc_msgSend(v11[30], "convertSampleBuffer:cropRect:outputSampleBuffer:", sbuf, &target, a3 * (double)Dimensions.width, a4 * (double)Dimensions.height, a5 * (double)Dimensions.width, a6 * (double)Dimensions.height))
      {
        LODWORD(v14) = objc_msgSend((id)objc_msgSend(v11[22], "requestedSettings"), "outputWidth");
        v15 = objc_msgSend((id)objc_msgSend(v11[22], "requestedSettings"), "outputHeight");
        if (!(_DWORD)v14 || v15 == 0)
        {
          v14 = objc_msgSend((id)objc_msgSend(v11[2], "videoFormat"), "width");
          v17 = objc_msgSend((id)objc_msgSend(v11[2], "videoFormat"), "height");
        }
        else
        {
          v14 = v14;
          v17 = v15;
        }
        v18 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
        if (v18)
        {
          v19 = (void *)v18;
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "width"), objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "height"), a3, a4, a5, a6, (double)v14 / (double)v17);
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v28 = objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "width");
          v29 = objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "height");
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v19, v28 | ((unint64_t)v29 << 32), v14 | ((unint64_t)v17 << 32), v21, v23, v25, v27, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v19, v30);
          return (id *)target;
        }
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return (id *)target;
  }
  return result;
}

- (BOOL)_isBravoHDRDepthDataCapture
{
  return a1
      && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") == 3
      && -[BWGNRNode _isBravoDepthDataCapture](a1);
}

- (uint64_t)_isBravoTelephotoHDRDepthDataCapture
{
  if (a1
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") == 3
    && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureFlags") & 0x800) != 0)
  {
    return objc_msgSend(*(id *)(a1 + 128), "isEqualToString:", *MEMORY[0x1E0D05A30]);
  }
  else
  {
    return 0;
  }
}

- (void)_detectMissingPreBracketedFrameAndEmitBWNodeError
{
  int v2;
  BOOL v3;
  id v4;

  if (a1 && *(_BYTE *)(a1 + 189) && !*(_BYTE *)(a1 + 190))
  {
    v2 = *(unsigned __int8 *)(a1 + 256);
    if (*(_BYTE *)(a1 + 256))
      v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") == 3;
    if (*(_BYTE *)(a1 + 188))
      v3 = 0;
    else
      v3 = v2 == 0;
    if (!v3)
    {
      v4 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, *(_QWORD *)(a1 + 176), 0);
      objc_msgSend(*(id *)(a1 + 16), "emitNodeError:", v4);

    }
  }
}

- (uint64_t)_setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:(uint64_t)result
{
  uint64_t v3;
  int v4;
  _BOOL8 v6;

  if (result)
  {
    v3 = result;
    if (-[BWGNRNode _isBravoDepthDataCapture](result))
    {
      v4 = *(_DWORD *)(v3 + 184);
      v6 = v4 != 3 && v4 != 9;
    }
    else
    {
      v6 = 0;
    }
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:](v3, *MEMORY[0x1E0D084C0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6));
    return -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:](v3, *MEMORY[0x1E0D084E0], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2));
  }
  return result;
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a3;
  if (self->_receivedAllFrames)
  {
    -[BWStillImageCaptureSettings expectReferenceFrameBracketedCaptureSequenceNumber](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings", *(_QWORD *)&a3, a4), "expectReferenceFrameBracketedCaptureSequenceNumber");
    -[BWGNRNode _setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:]((uint64_t)self, v4);
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
    self->_previouslyCompletedFusionSettingsID = -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID");
    -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
  }
  else
  {
    self->_receivedReferenceFrameBracketedCaptureSequenceNumber = a3;
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  _BOOL4 v6;
  unsigned int processingType;
  int v9;
  int isBravoTelephotoHDRDepthData;

  if (self->_sampleBufferProcessor)
  {
    v6 = objc_msgSend(a3, "errorCode", a3, a4) == -16800 || objc_msgSend(a3, "errorCode") == -16802;
    if (objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID") == self->_previouslyCompletedFusionSettingsID
      && !v6)
    {
LABEL_13:
      v9 = 0;
      goto LABEL_14;
    }
    processingType = self->_processingType;
    if (processingType >= 0xB || ((0x431u >> processingType) & 1) == 0)
    {
      if (self->_currentStillImageSettings)
      {
        -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D084D0], 0);
        v9 = 0;
        self->_previouslyCompletedFusionSettingsID = -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID");
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v9 = 1;
LABEL_14:
  isBravoTelephotoHDRDepthData = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture]((uint64_t)self);
  -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
  if (v9)
  {
    -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
    if (isBravoTelephotoHDRDepthData)
      -[BWNodeOutput emitNodeError:](self->super._output, "emitNodeError:", a3);
  }
}

- (void)setUsesHDRPreBracketFrameForErrorRecoveryDownstream:(BOOL)a3
{
  self->_usesHDRPreBracketFrameForErrorRecoveryDownstream = a3;
}

- (BOOL)usesHDRPreBracketFrameForErrorRecoveryDownstream
{
  return self->_usesHDRPreBracketFrameForErrorRecoveryDownstream;
}

- (void)setAllowedToModifyInputBuffers:(BOOL)a3
{
  self->_allowedToModifyInputBuffers = a3;
}

- (BOOL)allowedToModifyInputBuffers
{
  return self->_allowedToModifyInputBuffers;
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (_QWORD)sbpOptionsDictionary
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    result = -[BWGNRNode _tuningDictionaryWithOnlyGNRParameters](result);
    if (result)
    {
      v2 = *MEMORY[0x1E0D084B8];
      v3[0] = *MEMORY[0x1E0D06188];
      v3[1] = v2;
      v4[0] = result;
      v4[1] = &unk_1E49F8898;
      v3[2] = *MEMORY[0x1E0D084B0];
      v4[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v1 + 99));
      return (_QWORD *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
    }
  }
  return result;
}

- (_QWORD)_tuningDictionaryWithOnlyGNRParameters
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[2];
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    if (!result[16] || !result[17])
      return 0;
    result = (_QWORD *)result[18];
    if (result)
    {
      result = (_QWORD *)objc_msgSend(result, "objectForKeyedSubscript:", CFSTR("GNRParameters"));
      if (result)
      {
        v2 = (void *)v1[21];
        if (!v2)
        {
          v18 = v1[16];
          v19 = v1[17];
          v20[0] = CFSTR("DefaultSensorIDs");
          v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v13 = v1[17];
          v20[1] = v1[16];
          v21[0] = v12;
          v16 = v13;
          v14 = CFSTR("GNRParameters");
          v15 = objc_msgSend((id)v1[18], "objectForKeyedSubscript:", CFSTR("GNRParameters"));
          v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
          v21[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v21;
          v10 = v20;
          v11 = 2;
          return (_QWORD *)objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11);
        }
        if (v1[19] && v1[20])
        {
          result = (_QWORD *)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("GNRParameters"));
          if (!result)
            return result;
          v3 = v1[17];
          v4 = v1[19];
          v30[0] = v1[16];
          v30[1] = v4;
          v5 = v1[20];
          v31[0] = v3;
          v31[1] = v5;
          v32[0] = CFSTR("DefaultSensorIDs");
          v33[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v6 = v1[17];
          v32[1] = v1[16];
          v28 = v6;
          v26 = CFSTR("GNRParameters");
          v27 = objc_msgSend((id)v1[18], "objectForKeyedSubscript:", CFSTR("GNRParameters"));
          v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v33[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
          v7 = v1[20];
          v32[2] = v1[19];
          v24 = v7;
          v22 = CFSTR("GNRParameters");
          v23 = objc_msgSend((id)v1[21], "objectForKeyedSubscript:", CFSTR("GNRParameters"));
          v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
          v33[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v33;
          v10 = v32;
          v11 = 3;
          return (_QWORD *)objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11);
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t __40__BWGNRNode__setupSampleBufferProcessor__block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40);
  if (v2)
    *(_DWORD *)(v2 + 208) = a2;
  return result;
}

- (BOOL)_isBravoDepthDataCapture
{
  uint64_t v1;
  void *v2;

  if (result)
  {
    v1 = result;
    if ((objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureFlags") & 0x800) != 0)
    {
      v2 = (void *)objc_msgSend(*(id *)(v1 + 176), "captureSettings");
      return objc_msgSend(v2, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A30]) != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_sampleBufferProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  BOOL v10;
  char v11;
  int v12;
  BOOL v13;
  id v14;
  unsigned int v15;
  int v17;
  int v18;
  int v19;
  BOOL v20;
  int v21;
  BOOL v22;
  unsigned int v23;
  int v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];

  if (result)
  {
    v6 = result;
    v7 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue");
    v9 = v8;
    if ((_DWORD)a2)
      v10 = target == 0;
    else
      v10 = 1;
    v11 = !v10;
    if (v10)
    {
      if ((_DWORD)a2)
        goto LABEL_16;
    }
    else
    {
      v12 = *(_DWORD *)(v6 + 184);
      v13 = v12 == 9 || v12 == 3;
      if (v13
        && (v8 & 1) == 0
        && (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage") & 1) != 0)
      {
LABEL_16:
        fig_log_get_emitter();
        LODWORD(v30) = a2;
        FigDebugAssert3();
        v14 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, v6, *(_QWORD *)(v6 + 176), v7, v30, v3);
        objc_msgSend(*(id *)(v6 + 16), "emitNodeError:", v14);
        if ((-[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v6) & 1) != 0)
          objc_msgSend(*(id *)(v6 + 16), "emitNodeError:", v14);

        return -[BWAggdDataReporter reportGNRSampleBufferProcessorProcessingStatus:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportGNRSampleBufferProcessorProcessingStatus:", a2);
      }
    }
    v15 = *(_DWORD *)(v6 + 184);
    if (v15 != 9 && v15 != 3)
    {
      v19 = 0;
LABEL_33:
      v20 = v15 > 0xA;
      v21 = (1 << v15) & 0x431;
      v22 = v20 || v21 == 0;
      if (v22
        && (v19 | objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage") ^ 1) == 1)
      {
        CMSetAttachment(target, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);
      }
      CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E0D084F0]);
      v23 = *(_DWORD *)(v6 + 184);
      v20 = v23 > 0xA;
      v24 = (1 << v23) & 0x431;
      v25 = v20 || v24 == 0;
      if (v25 && (v9 & 1) == 0 && (*(_DWORD *)(v6 + 208) & 0x80000000) == 0)
      {
        v26 = (void *)objc_msgSend(*(id *)(v6 + 224), "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"));
        if (v26)
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __60__BWGNRNode__sampleBufferProcessorOutputReady_sampleBuffer___block_invoke;
          v31[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
          v31[4] = target;
          objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
        }
      }
      objc_msgSend(*(id *)(v6 + 16), "emitSampleBuffer:", target);
      return -[BWAggdDataReporter reportGNRSampleBufferProcessorProcessingStatus:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportGNRSampleBufferProcessorProcessingStatus:", a2);
    }
    v17 = objc_msgSend((id)CMGetAttachment(target, CFSTR("StillImageProcessingFlags"), 0), "unsignedIntValue");
    v18 = v17;
    if ((v11 & 1) != 0)
    {
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17 | 0x400u), 1u);
    }
    else if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage"))
      {
        CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v18 | 1u), 1u);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E49F88B0, *MEMORY[0x1E0D06B08]);
      }
    }
    else if (!*(_BYTE *)(v6 + 212))
    {
      CMSetAttachment(target, CFSTR("StillImageProcessingFlags"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v17 | 2u), 1u);
      if (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage"))
        v27 = 3;
      else
        v27 = 2;
      v28 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v27);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, *MEMORY[0x1E0D06B08]);
      if (*(int *)(v6 + 216) < 1)
      {
        -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v6);
      }
      else
      {
        v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D06EB0]);
      }
      v19 = 1;
      goto LABEL_32;
    }
    v19 = 0;
LABEL_32:
    *(_BYTE *)(v6 + 212) = 0;
    v15 = *(_DWORD *)(v6 + 184);
    goto LABEL_33;
  }
  return result;
}

void __60__BWGNRNode__sampleBufferProcessorOutputReady_sampleBuffer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BWSampleBufferSetAttachedMedia(*(const void **)(a1 + 32), a2, a3);
}

@end
