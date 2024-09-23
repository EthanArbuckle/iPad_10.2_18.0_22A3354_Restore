@implementation BWStereoFusionNode

+ (void)initialize
{
  objc_opt_class();
}

- (BWStereoFusionNode)initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4
{
  return (BWStereoFusionNode *)-[BWStereoFusionNode _initWithTelephotoSensorIDDictionary:cameraInfoByPortType:sbpCreationFunction:treatSoftErrorsAsHardErrors:](self, "_initWithTelephotoSensorIDDictionary:cameraInfoByPortType:sbpCreationFunction:treatSoftErrorsAsHardErrors:", a3, a4, sfn_createSampleBufferProcessorFunction, 0);
}

- (id)_initWithTelephotoSensorIDDictionary:(id)a3 cameraInfoByPortType:(id)a4 sbpCreationFunction:(void *)a5 treatSoftErrorsAsHardErrors:(BOOL)a6
{
  BWStereoFusionNode *v9;
  BWStereoFusionNode *v10;
  BWVideoFormatRequirements *v11;
  BWVideoFormatRequirements *v12;
  BWVideoFormatRequirements *v13;
  BWVideoFormatRequirements *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)BWStereoFusionNode;
  v9 = -[BWNode init](&v16, sel_init, a3, a4, a5, a6);
  v10 = v9;
  if (v9)
  {
    v9->_createSampleBufferProcessorFunction = a5;
    v9->_telephotoSensorIDDictionary = (NSDictionary *)a3;
    v10->_cameraInfoByPortType = (NSDictionary *)objc_msgSend(a4, "copy");
    v10->_wideInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v10, 0);
    v11 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v11, "setSupportedPixelFormats:", &unk_1E4A00AD0);
    -[BWNodeInput setFormatRequirements:](v10->_wideInput, "setFormatRequirements:", v11);

    -[BWNodeInput setPassthroughMode:](v10->_wideInput, "setPassthroughMode:", 0);
    -[BWNodeInput setRetainedBufferCount:](v10->_wideInput, "setRetainedBufferCount:", 1);
    -[BWNodeInput setName:](v10->_wideInput, "setName:", CFSTR("Wide"));
    -[BWNode addInput:](v10, "addInput:", v10->_wideInput);

    v10->_telephotoInput = -[BWNodeInput initWithMediaType:node:index:]([BWNodeInput alloc], "initWithMediaType:node:index:", 1986618469, v10, 1);
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v12, "setSupportedPixelFormats:", &unk_1E4A00AE8);
    -[BWNodeInput setFormatRequirements:](v10->_telephotoInput, "setFormatRequirements:", v12);

    -[BWNodeInput setPassthroughMode:](v10->_telephotoInput, "setPassthroughMode:", 0);
    -[BWNodeInput setRetainedBufferCount:](v10->_telephotoInput, "setRetainedBufferCount:", 1);
    -[BWNodeInput setName:](v10->_telephotoInput, "setName:", CFSTR("Telephoto"));
    -[BWNode addInput:](v10, "addInput:", v10->_telephotoInput);

    v10->_defaultOutput = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v10);
    v13 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v13, "setSupportedPixelFormats:", &unk_1E4A00B00);
    -[BWNodeOutput setFormatRequirements:](v10->_defaultOutput, "setFormatRequirements:", v13);

    -[BWNodeOutput setProvidesPixelBufferPool:](v10->_defaultOutput, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutput setPassthroughMode:](v10->_defaultOutput, "setPassthroughMode:", 0);
    -[BWNodeOutput setName:](v10->_defaultOutput, "setName:", CFSTR("Default"));
    -[BWNode addOutput:](v10, "addOutput:", v10->_defaultOutput);

    v10->_stereoHDROutput = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v10);
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", &unk_1E4A00B18);
    -[BWNodeOutput setFormatRequirements:](v10->_stereoHDROutput, "setFormatRequirements:", v14);

    -[BWNodeOutput setProvidesPixelBufferPool:](v10->_stereoHDROutput, "setProvidesPixelBufferPool:", 0);
    -[BWNodeOutput setPassthroughMode:](v10->_stereoHDROutput, "setPassthroughMode:", 0);
    -[BWNodeOutput setName:](v10->_stereoHDROutput, "setName:", CFSTR("HDR"));
    -[BWNode addOutput:](v10, "addOutput:", v10->_stereoHDROutput);

  }
  return v10;
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

  -[BWStereoFusionNode _clearCaptureRequestState]((uint64_t)self);
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
  v9.super_class = (Class)BWStereoFusionNode;
  -[BWNode dealloc](&v9, sel_dealloc);
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(_QWORD *)(a1 + 128) = 0;
    *(_BYTE *)(a1 + 168) = 0;
    *(_BYTE *)(a1 + 169) = 0;
    *(_BYTE *)(a1 + 170) = 0;
    *(_BYTE *)(a1 + 171) = 0;
    *(_BYTE *)(a1 + 172) = 0;

    *(_QWORD *)(a1 + 176) = 0;
    *(_QWORD *)(a1 + 184) = 0;

    *(_QWORD *)(a1 + 192) = 0;
    *(_QWORD *)(a1 + 200) = 0;
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWVideoFormatRequirements *v6;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1));
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", objc_msgSend(a3, "width"));
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", objc_msgSend(a3, "height"));
  -[BWVideoFormatRequirements setSupportedCacheModes:](v6, "setSupportedCacheModes:", +[BWVideoFormatRequirements cacheModesForOptimizedHWAccess](BWVideoFormatRequirements, "cacheModesForOptimizedHWAccess"));
  if (objc_msgSend(a3, "colorSpaceProperties"))
  {
    v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  }
  else
  {
    v7 = 0;
  }
  -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v6, "setSupportedColorSpaceProperties:", v7);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = -[BWNode outputs](self, "outputs", 0);
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setFormatRequirements:", v6);
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)nodeType
{
  return CFSTR("Effect");
}

- (id)nodeSubType
{
  return CFSTR("StereoFusionProcessor");
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BWNodeInput *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)BWStereoFusionNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v13, sel_prepareForCurrentConfigurationToBecomeLive);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = -[BWNode inputs](self, "inputs");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(BWNodeInput **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (v8 != self->super._input)
          -[BWFormat isEqual:](-[BWNodeInput format](v8, "format"), "isEqual:", -[BWNodeInput format](self->super._input, "format"));
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }
  if (!self->_sampleBufferProcessor)
  {
    if (-[BWStereoFusionNode _setupSampleBufferProcessor]((uint64_t)self))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD, const __CFString *, uint64_t, uint64_t *);
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t (*)(), uint64_t);
  uint64_t v7;
  uint64_t v9;

  if (!a1)
    return 0;
  v9 = 0;
  v2 = -[BWStereoFusionNode sbpOptionsDictionary](a1);
  if (!v2 || (v3 = *(uint64_t (**)(_QWORD, const __CFString *, uint64_t, uint64_t *))(a1 + 96)) == 0)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  v4 = v3(*MEMORY[0x1E0C9AE00], CFSTR("StereoFusion"), v2, &v9);
  if ((_DWORD)v4)
  {
    v7 = v4;
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    v5 = v9;
    *(_QWORD *)(a1 + 104) = v9;
    v6 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 8);
    if (v6)
      return v6(v5, sfn_processorOutputReadyCallback, a1);
    else
      return 4294954514;
  }
  return v7;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = -[BWNode outputs](self, "outputs", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "makeConfiguredFormatLive");
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 0))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = -[BWNode outputs](self, "outputs", 0);
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "markEndOfLiveOutput");
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BWStillImageSettings *v14;
  int v15;
  uint64_t v16;
  _BYTE *v17;

  if (!a3)
  {
    v8 = 0;
LABEL_27:
    -[BWStereoFusionNode _handleError:forSampleBuffer:input:metadata:]((uint64_t)self, 4294954516, (uint64_t)a3, (uint64_t)a4, (uint64_t)v8);
    goto LABEL_23;
  }
  v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  v8 = v7;
  if (!v7)
    goto LABEL_27;
  v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue");
  if (!self->_sampleBufferProcessor)
    goto LABEL_27;
  v10 = v9;
  v11 = (void *)CMGetAttachment(a3, CFSTR("StillSettings"), 0);
  if (!v11)
    goto LABEL_27;
  v12 = v11;
  if (!self->_currentStillImageSettings)
    goto LABEL_9;
  v13 = objc_msgSend(v11, "settingsID");
  if (v13 != -[BWStillImageSettings settingsID](self->_currentStillImageSettings, "settingsID"))
  {
    -[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E0D08818], *MEMORY[0x1E0C9AE50]);
    -[BWStereoFusionNode _clearCaptureRequestState]((uint64_t)self);
  }
  if (!self->_currentStillImageSettings)
  {
LABEL_9:
    v14 = v12;
    self->_currentStillImageSettings = v14;
    -[BWStereoFusionNode _setExpectedInputFramesWithResolvedCaptureSettings:]((uint64_t)self, -[BWStillImageSettings captureSettings](v14, "captureSettings"));
  }
  if (self->_masterInput)
    v15 = 0;
  else
    v15 = v10;
  if (v15 == 1)
    self->_masterInput = (BWNodeInput *)a4;
  if (self->_wideInput == a4)
    v16 = 169;
  else
    v16 = 171;
  v17 = (char *)self + v16;
  if (!*v17)
  {
    *v17 = 1;
    if (self->_performSBPProcessing)
    {
      -[BWStereoFusionNode _processSampleBufferInSampleBufferProcessor:metadataDictionary:]((uint64_t)self, (uint64_t)a3, v8);
    }
    else if (objc_msgSend((id)objc_msgSend(v12, "requestedSettings"), "outputFormat"))
    {
      -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", a3);
    }
  }
LABEL_23:
  if (-[BWStereoFusionNode _receivedExpectedNumberOfFramesOrErrors]((uint64_t)self))
    -[BWStereoFusionNode _endSequence]((uint64_t)self);
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

- (uint64_t)_setExpectedInputFramesWithResolvedCaptureSettings:(uint64_t)result
{
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = (_BYTE *)result;
    v4 = objc_msgSend(a2, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A18]);
    v5 = objc_msgSend(a2, "captureStreamSettingsForPortType:", *MEMORY[0x1E0D05A30]);
    v3[168] = v4 != 0;
    v3[170] = v5 != 0;
    result = objc_msgSend(a2, "captureFlags");
    v3[172] = (result & 0x400) != 0;
  }
  return result;
}

- (uint64_t)_processSampleBufferInSampleBufferProcessor:(void *)a3 metadataDictionary:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);

  if (result)
  {
    v5 = result;
    objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "captureSettings"), "captureType");
    -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorIfNecessaryBasedOnMetadata:captureType:](v5, a3);
    v6 = *(_QWORD *)(v5 + 104);
    result = CMBaseObjectGetVTable();
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(result + 16) + 16);
    if (v7)
      return v7(v6, a2);
  }
  return result;
}

- (void)_handleError:(uint64_t)a3 forSampleBuffer:(uint64_t)a4 input:(uint64_t)a5 metadata:
{
  id v7;
  int *v8;
  id v9;
  id v10;

  if (a1)
  {
    v7 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, a1, *(_QWORD *)(a1 + 128), a5);
    v10 = v7;
    if (*(_QWORD *)(a1 + 136) == a4)
      v8 = &OBJC_IVAR___BWStereoFusionNode__nodeErrorsForWide;
    else
      v8 = &OBJC_IVAR___BWStereoFusionNode__nodeErrorsForTelephoto;
    v9 = *(id *)(a1 + *v8);
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      *(_QWORD *)(a1 + *v8) = v9;
      v7 = v10;
    }
    objc_msgSend(v9, "addObject:", v7);

  }
}

- (uint64_t)_receivedExpectedNumberOfFramesOrErrors
{
  uint64_t v1;
  _BOOL4 v2;
  _BOOL4 v3;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 128))
    {
      v2 = !*(_BYTE *)(result + 168) || *(_BYTE *)(result + 169) || objc_msgSend(*(id *)(result + 192), "count") == 1;
      if (*(_BYTE *)(v1 + 170) && !*(_BYTE *)(v1 + 171))
      {
        v3 = objc_msgSend(*(id *)(v1 + 200), "count") == 1;
        return v2 & v3;
      }
    }
    else
    {
      v2 = 1;
    }
    v3 = 1;
    return v2 & v3;
  }
  return result;
}

- (void)_endSequence
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int *v5;
  uint64_t v6;
  id v7;
  id v8;
  int *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (!*(_BYTE *)(a1 + 169) && !*(_BYTE *)(a1 + 171))
  {
    v2 = *(_QWORD *)(a1 + 184);
    if (!v2)
    {
      v3 = objc_msgSend(*(id *)(a1 + 192), "count");
      v4 = objc_msgSend(*(id *)(a1 + 200), "count");
      v5 = &OBJC_IVAR___BWStereoFusionNode__wideInput;
      if (v3 < v4)
        v5 = &OBJC_IVAR___BWStereoFusionNode__telephotoInput;
      v2 = *(_QWORD *)(a1 + *v5);
      *(_QWORD *)(a1 + 184) = v2;
    }
    if (v2 == *(_QWORD *)(a1 + 136) && objc_msgSend(*(id *)(a1 + 192), "count") == 1)
    {
      v6 = 192;
    }
    else
    {
      if (*(_QWORD *)(a1 + 184) != *(_QWORD *)(a1 + 144) || objc_msgSend(*(id *)(a1 + 200), "count") != 1)
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v8 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954516, a1, *(_QWORD *)(a1 + 128), 0);
        if (v8)
          objc_msgSend(v7, "addObject:", v8);

        goto LABEL_18;
      }
      v6 = 200;
    }
    v7 = *(id *)(a1 + v6);
    *(_QWORD *)(a1 + v6) = 0;
LABEL_18:
    v9 = &OBJC_IVAR___BWStereoFusionNode__defaultOutput;
    if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "captureSettings"), "captureType") == 3
      && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 128), "captureSettings"), "captureFlags") & 0x400) != 0)
    {
      v9 = &OBJC_IVAR___BWStereoFusionNode__stereoHDROutput;
    }
    v10 = *(void **)(a1 + *v9);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v7);
          objc_msgSend(v10, "emitNodeError:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  if (*(_BYTE *)(a1 + 172) && (*(_BYTE *)(a1 + 169) || *(_BYTE *)(a1 + 171)))
    -[BWStereoFusionNode _processSequenceInSampleBufferProcessor](a1);
  -[BWStereoFusionNode _clearCaptureRequestState](a1);
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  uint64_t v6;
  objc_class *v7;
  BWStillImageSettings *v8;

  if (self->_wideInput == a4)
    v6 = 192;
  else
    v6 = 200;
  v7 = *(Class *)((char *)&self->super.super.isa + v6);
  if (!v7)
  {
    v7 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(Class *)((char *)&self->super.super.isa + v6) = v7;
  }
  -[objc_class addObject:](v7, "addObject:", a3);
  if (self->_currentStillImageSettings
    || (v8 = (BWStillImageSettings *)(id)objc_msgSend(a3, "stillImageSettings"),
        self->_currentStillImageSettings = v8,
        -[BWStereoFusionNode _setExpectedInputFramesWithResolvedCaptureSettings:]((uint64_t)self, -[BWStillImageSettings captureSettings](v8, "captureSettings")), self->_currentStillImageSettings))
  {
    if (-[BWStereoFusionNode _receivedExpectedNumberOfFramesOrErrors]((uint64_t)self))
      -[BWStereoFusionNode _endSequence]((uint64_t)self);
  }
  else
  {
    -[BWNodeOutput emitNodeError:](self->_defaultOutput, "emitNodeError:", a3);
    -[BWNodeOutput emitNodeError:](self->_stereoHDROutput, "emitNodeError:", a3);
  }
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (uint64_t)sbpOptionsDictionary
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(*(id *)(result + 112), "objectForKeyedSubscript:", CFSTR("StereoFusionParameters"));
    if (v2)
    {
      v3 = *MEMORY[0x1E0D087C8];
      v4[0] = *MEMORY[0x1E0D06188];
      v4[1] = v3;
      v5[0] = v2;
      v5[1] = &unk_1E49F9DB0;
      v4[2] = *MEMORY[0x1E0D06140];
      v5[2] = *(_QWORD *)(v1 + 120);
      return objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

- (BOOL)isCaptureRequestStateReset
{
  return !self->_currentStillImageSettings
      && !self->_expectsWideFrame
      && !self->_receivedWideFrame
      && !self->_expectsTelephotoFrame
      && !self->_receivedTelephotoFrame
      && !self->_performSBPProcessing
      && !self->_masterInput
      && !self->_nodeErrorsForWide
      && self->_nodeErrorsForTelephoto == 0;
}

- (OpaqueFigSampleBufferProcessor)sampleBufferProcessor
{
  return self->_sampleBufferProcessor;
}

- (uint64_t)_processSequenceInSampleBufferProcessor
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (!*(_QWORD *)(result + 176))
      -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorWithRectangle:](result, 0.0, 0.0, 1.0, 1.0);
    return -[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:](v1, *MEMORY[0x1E0D084D0], 0);
  }
  return result;
}

- (void)_setZoomRectangleOnSampleBufferProcessorIfNecessaryBasedOnMetadata:(uint64_t)a1 captureType:(void *)a2
{
  void *v4;
  double width;
  double y;
  BOOL IsNull;
  double height;
  double x;
  CGRect v10;

  if (a1
    && objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue"))
  {
    v4 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D05A18]))
    {
      v10.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      v10.size = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      width = 1.0;
      y = 0.0;
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        IsNull = CGRectIsNull(v10);
        height = 1.0;
        x = 0.0;
        if (!IsNull)
        {
          y = v10.origin.y;
          x = v10.origin.x;
          height = v10.size.height;
          width = v10.size.width;
        }
        goto LABEL_9;
      }
    }
    else
    {
      width = 1.0;
      y = 0.0;
    }
    height = 1.0;
    x = 0.0;
LABEL_9:
    -[BWStereoFusionNode _setZoomRectangleOnSampleBufferProcessorWithRectangle:](a1, x, y, width, height);
  }
}

- (void)_setZoomRectangleOnSampleBufferProcessorWithRectangle:(double)a3
{
  CFDictionaryRef DictionaryRepresentation;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 176))
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    else
    {
      DictionaryRepresentation = CGRectCreateDictionaryRepresentation(*(CGRect *)&a2);
      if (!-[BWStereoFusionNode _setPropertyOnSampleBufferProcessorWithKey:value:](a1, *MEMORY[0x1E0D087D0], (uint64_t)DictionaryRepresentation))
      {
        *(_QWORD *)(a1 + 176) = -[__CFDictionary copy](DictionaryRepresentation, "copy");
        if (!DictionaryRepresentation)
          return;
        goto LABEL_5;
      }
      fig_log_get_emitter();
      FigDebugAssert3();
      if (DictionaryRepresentation)
LABEL_5:
        CFRelease(DictionaryRepresentation);
    }
  }
}

- (uint64_t)_sampleBufferProcessorOutputReady:(const void *)a3 sampleBuffer:
{
  uint64_t v3;
  uint64_t v6;
  int *v7;
  __int16 v8;
  unint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double *v17;
  CGSize v18;
  unsigned int v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  const char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  CGRect rect;
  CGRect v33;

  if (result)
  {
    v6 = result;
    v7 = &OBJC_IVAR___BWStereoFusionNode__defaultOutput;
    if (objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "captureSettings"), "captureType") == 3)
    {
      v8 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "captureSettings"), "captureFlags");
      v9 = (unint64_t)(v8 & 0x400) >> 10;
      if ((v8 & 0x400) != 0)
        v7 = &OBJC_IVAR___BWStereoFusionNode__stereoHDROutput;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
    v10 = *(void **)(v6 + *v7);
    if (a3)
      v11 = (_DWORD)a2 == 0;
    else
      v11 = 1;
    if (v11)
      v12 = a2;
    else
      v12 = 0;
    v13 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v14 = v13;
    if (v13
      && (objc_msgSend((id)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D06EB8]), "BOOLValue") & 1) == 0)
    {
      if ((v9 & 1) != 0
        && !objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D10]), "BOOLValue"))
      {
        CMSetAttachment(a3, CFSTR("StereoFusionFailed"), (CFTypeRef)*MEMORY[0x1E0C9AE50], 0);
      }
      else
      {
        v15 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0D06D00]);
        objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0D05A18]);
      }
    }
    v16 = *(void **)(v6 + 176);
    *(_QWORD *)(v6 + 176) = 0;
    if ((_DWORD)v12)
    {
      fig_log_get_emitter();
      LODWORD(v30) = v12;
      FigDebugAssert3();

      v29 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", v12, v6, *(_QWORD *)(v6 + 128), v14, v30, v3);
      objc_msgSend(v10, "emitNodeError:", v29);

    }
    else
    {
      v17 = (double *)MEMORY[0x1E0C9D628];
      v18 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
      rect.size = v18;
      if (CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v16, &rect))
      {
        v33.origin.x = 0.0;
        v33.origin.y = 0.0;
        v33.size.width = 1.0;
        v33.size.height = 1.0;
        if (!CGRectEqualToRect(rect, v33))
        {
          v19 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "requestedSettings"), "outputWidth");
          v31 = v19;
          v20 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 128), "requestedSettings"), "outputHeight");
          v21 = (double)v19 / (double)v20;
          v22 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "width");
          v23 = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "height");
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v22, v23, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v21);
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v14, objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "width") | ((unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 8), "videoFormat"), "height") << 32), v31 | (v20 << 32), v24, v25, v26, v27, *v17, v17[1], v17[2], v17[3]);
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v14, v28);
        }
      }
      CMRemoveAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D20]);
      CMSetAttachment(a3, CFSTR("HasUnreliableBracketingMetadata"), MEMORY[0x1E0C9AAB0], 1u);

      objc_msgSend(v10, "emitSampleBuffer:", a3);
    }
    return -[BWAggdDataReporter reportStereoFusionSampleBufferProcessorProcessingStatus:](+[BWAggdDataReporter sharedInstance](BWAggdDataReporter, "sharedInstance"), "reportStereoFusionSampleBufferProcessorProcessingStatus:", a2);
  }
  return result;
}

- (BWNodeInput)wideInput
{
  return self->_wideInput;
}

- (BWNodeInput)telephotoInput
{
  return self->_telephotoInput;
}

- (BWNodeOutput)defaultOutput
{
  return self->_defaultOutput;
}

- (BWNodeOutput)stereoHDROutput
{
  return self->_stereoHDROutput;
}

@end
